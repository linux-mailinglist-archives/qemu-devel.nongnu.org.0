Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A22679AC7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 14:58:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKJnz-0003tJ-Sb; Tue, 24 Jan 2023 08:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pKJnn-0003ro-Pe; Tue, 24 Jan 2023 08:57:32 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pKJnk-0005Pf-BJ; Tue, 24 Jan 2023 08:57:31 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 9D3CD45F23;
 Tue, 24 Jan 2023 14:57:25 +0100 (CET)
Message-ID: <64e1a713-9806-29fe-3859-10c87608522b@proxmox.com>
Date: Tue, 24 Jan 2023 14:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] block/mirror: add 'write-blocking-after-ready' copy mode
Content-Language: en-US
From: Fiona Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Cc: t.lamprecht@proxmox.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com, hreitz@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
References: <20221207132719.131227-1-f.ebner@proxmox.com>
In-Reply-To: <20221207132719.131227-1-f.ebner@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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

Am 07.12.22 um 14:27 schrieb Fiona Ebner:
> The new copy mode starts out in 'background' mode and switches to
> 'write-blocking' mode once the job transitions to ready.
> 
> Before switching to active mode and indicating that the drives are
> actively synced, it is necessary to have seen and handled all guest
> I/O. This is done by checking the dirty bitmap inside a drained
> section. Transitioning to ready is also only done at the same time.
> 
> The new mode is useful for management applications using drive-mirror
> in combination with migration. Currently, migration doesn't check on
> mirror jobs before inactivating the blockdrives, so it's necessary to
> either:
> 1) use the 'pause-before-switchover' migration capability and complete
>    mirror jobs before actually switching over.
> 2) use 'write-blocking' copy mode for the drive mirrors.
> 
> The downside with 1) is longer downtime for the guest, while the
> downside with 2) is that guest write speed is limited by the
> synchronous writes to the mirror target. The newly introduced copy
> mode reduces the time that limit is in effect.
> 
> Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
> ---
> 
> See [0] for a bit more context. While the new copy mode doesn't
> fundamentally improve the downside of 2) (especially when multiple
> drives are mirrored), it would still improve things a little. And I
> guess when trying to keep downtime short, guest write speed needs to
> be limited at /some/ point (always in the context of migration with
> drive-mirror of course). Ideally, that could go hand-in-hand with
> migration convergence, but that would require some larger changes to
> implement and introduce more coupling.
> 
> [0] https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg04886.html
> 
Ping. If there is no interest from upstream in such a feature, it would
still be nice to know.


