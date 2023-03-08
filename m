Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A648B6B0498
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 11:35:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZr8m-0001qj-5f; Wed, 08 Mar 2023 05:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pZr8i-0001iI-Ah; Wed, 08 Mar 2023 05:35:21 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pZr8f-0006Rk-8s; Wed, 08 Mar 2023 05:35:19 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 3E0A245DEE;
 Wed,  8 Mar 2023 11:35:14 +0100 (CET)
Message-ID: <018e2b20-4d0a-509a-d106-0fd8a0895821@proxmox.com>
Date: Wed, 8 Mar 2023 11:35:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Deadlock with ide_issue_trim and draining
To: Hanna Czenczek <hreitz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1e3813b6-f2d0-9bd5-a270-e5835c13b495@proxmox.com>
 <97638730-0dfa-918b-3c66-7874171b3e5c@redhat.com>
 <011bccb7-e45d-72a8-f87f-2d65d5934407@redhat.com>
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <011bccb7-e45d-72a8-f87f-2d65d5934407@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 07.03.23 um 15:27 schrieb Hanna Czenczek:
> On 07.03.23 14:44, Hanna Czenczek wrote:
>> On 07.03.23 13:22, Fiona Ebner wrote:
>>> Hi,
>>> I am suspecting that commit 7e5cdb345f ("ide: Increment BB in-flight
>>> counter for TRIM BH") introduced an issue in combination with draining.
>>>
>>>  From a debug session on a costumer's machine I gathered the following
>>> information:
>>> * The QEMU process hangs in aio_poll called during draining and doesn't
>>> progress.
>>> * The in_flight counter for the BlockDriverState is 0 and for the
>>> BlockBackend it is 1.
>>> * There is a blk_aio_pdiscard_entry request in the BlockBackend's
>>> queued_requests.
>>> * The drive is attached via ahci.
>>>
>>> I suspect that something like the following happened:
>>>
>>> 1. ide_issue_trim is called, and increments the in_flight counter.
>>> 2. ide_issue_trim_cb calls blk_aio_pdiscard.
>>> 3. somebody else starts draining.
>>> 4. ide_issue_trim_cb is called as the completion callback for
>>> blk_aio_pdiscard.
>>> 5. ide_issue_trim_cb issues yet another blk_aio_pdiscard request.
>>> 6. The request is added to the wait queue via blk_wait_while_drained,
>>> because draining has been started.
>>> 7. Nobody ever decrements the in_flight counter and draining can't
>>> finish.
>>
>> Sounds about right.
>>
>>> The issue occurs very rarely and is difficult to reproduce, but with the
>>> help of GDB, I'm able to do it rather reliably:
>>> 1. Use GDB to break on blk_aio_pdiscard.
>>> 2. Run mkfs.ext4 on a huge disk in the guest.
>>> 3. Issue a drive-backup QMP command after landing on the breakpoint.
>>> 4. Continue a few times in GDB.
>>> 5. After that I can observe the same situation as described above.
>>>
>>> I'd be happy about suggestions for how to fix it. Unfortunately, I don't
>>> see a clear-cut way at the moment. The only idea I have right now is to
>>> change the code to issue all discard requests at the same time, but I
>>> fear there might pitfalls with that?
>>
>> The point of 7e5cdb345f was that we need any in-flight count to
>> accompany a set s->bus->dma->aiocb.  While blk_aio_pdiscard() is
>> happening, we don’t necessarily need another count.  But we do need it
>> while there is no blk_aio_pdiscard().
>>
>> ide_issue_trim_cb() returns in two cases (and, recursively through its
>> callers, leaves s->bus->dma->aiocb set):
>> 1. After calling blk_aio_pdiscard(), which will keep an in-flight count,
>> 2. After calling replay_bh_schedule_event() (i.e. qemu_bh_schedule()),
>> which does not keep an in-flight count.
>>
>> Perhaps we just need to move the blk_inc_in_flight() above the
>> replay_bh_schedule_event() call?
> 
> FWIW, doing so at least keeps the reproducer from
> https://bugzilla.redhat.com/show_bug.cgi?id=2029980 working.
> 

And I'm not able to run into my current issue anymore :) Thank you!

FWIW, the suggested change and explanation sound good to me. Are you
going to send a patch for it?

Best Regards,
Fiona


