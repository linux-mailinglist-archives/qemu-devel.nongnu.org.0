Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD2C6ADE99
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:23:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWLZ-0003nZ-F8; Tue, 07 Mar 2023 07:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pZWLX-0003n8-9a; Tue, 07 Mar 2023 07:23:11 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pZWLV-0008JQ-Fa; Tue, 07 Mar 2023 07:23:11 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 023C845899;
 Tue,  7 Mar 2023 13:22:58 +0100 (CET)
Message-ID: <1e3813b6-f2d0-9bd5-a270-e5835c13b495@proxmox.com>
Date: Tue, 7 Mar 2023 13:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Fiona Ebner <f.ebner@proxmox.com>
Subject: Deadlock with ide_issue_trim and draining
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Czenczek <hreitz@redhat.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,
I am suspecting that commit 7e5cdb345f ("ide: Increment BB in-flight
counter for TRIM BH") introduced an issue in combination with draining.

From a debug session on a costumer's machine I gathered the following
information:
* The QEMU process hangs in aio_poll called during draining and doesn't
progress.
* The in_flight counter for the BlockDriverState is 0 and for the
BlockBackend it is 1.
* There is a blk_aio_pdiscard_entry request in the BlockBackend's
queued_requests.
* The drive is attached via ahci.

I suspect that something like the following happened:

1. ide_issue_trim is called, and increments the in_flight counter.
2. ide_issue_trim_cb calls blk_aio_pdiscard.
3. somebody else starts draining.
4. ide_issue_trim_cb is called as the completion callback for
blk_aio_pdiscard.
5. ide_issue_trim_cb issues yet another blk_aio_pdiscard request.
6. The request is added to the wait queue via blk_wait_while_drained,
because draining has been started.
7. Nobody ever decrements the in_flight counter and draining can't finish.

The issue occurs very rarely and is difficult to reproduce, but with the
help of GDB, I'm able to do it rather reliably:
1. Use GDB to break on blk_aio_pdiscard.
2. Run mkfs.ext4 on a huge disk in the guest.
3. Issue a drive-backup QMP command after landing on the breakpoint.
4. Continue a few times in GDB.
5. After that I can observe the same situation as described above.

I'd be happy about suggestions for how to fix it. Unfortunately, I don't
see a clear-cut way at the moment. The only idea I have right now is to
change the code to issue all discard requests at the same time, but I
fear there might pitfalls with that?

Best Regards,
Fiona


