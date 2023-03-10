Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A522B6B3FEE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:06:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pacRC-0001jA-1D; Fri, 10 Mar 2023 08:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pacQw-0001dp-3h; Fri, 10 Mar 2023 08:05:19 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pacQt-000159-Fq; Fri, 10 Mar 2023 08:05:17 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 8ABD045895;
 Fri, 10 Mar 2023 14:05:12 +0100 (CET)
Message-ID: <a432cb4d-8d7e-8408-15a9-c84414c03196@proxmox.com>
Date: Fri, 10 Mar 2023 14:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Hanna Czenczek <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
References: <20230309114430.33684-1-hreitz@redhat.com>
 <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
 <CABgObfZkSt6-0-vKkUtiWUy1TtHS_kEiYM2wRh+MfjTXmW497A@mail.gmail.com>
 <7ca18cb4-eeb1-4cba-feea-90f28fb9c2fc@redhat.com>
 <3e695f64-13bb-1311-6cd6-09bffc312873@redhat.com>
 <ZAobe/wtsf//YGHJ@redhat.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <ZAobe/wtsf//YGHJ@redhat.com>
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

Am 09.03.23 um 18:46 schrieb Kevin Wolf:
> Am 09.03.2023 um 14:59 hat Paolo Bonzini geschrieben:
>> On 3/9/23 13:31, Hanna Czenczek wrote:
>>> On 09.03.23 13:08, Paolo Bonzini wrote:
>>>> On Thu, Mar 9, 2023 at 1:05 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>>> I think having to do this is problematic, because the blk_drain should
>>>>> leave no pending operation.
>>>>>
>>>>> Here it seems okay because you do it in a controlled situation, but the
>>>>> main thread can also issue blk_drain(), or worse bdrv_drained_begin(),
>>>>> and there would be pending I/O operations when it returns.
>>>
>>> Not really.  We would stop in the middle of a trim that processes a list
>>> of discard requests.  So I see it more like stopping in the middle of
>>> anything that processes guest requests.  Once drain ends, we continue
>>> processing them, and that’s not exactly pending I/O.
>>>
>>> There is a pending object in s->bus->dma->aiocb on the IDE side, so
>>> there is a pending DMA operation, but naïvely, I don’t see that as a
>>> problem.
>>
>> What about the bdrv_drain_all() when a VM stops, would the guest continue to
>> access memory and disks after bdrv_drain() return?
> 
> That one shouldn't be a problem because the devices are stopped before
> the backends.
> 
>> Migration could also be a problem, because the partial TRIM would not be
>> recorded in the s->bus->error_status field of IDEState (no surprise there,
>> it's not an error).  Also, errors happening after bdrv_drain() might not be
>> migrated correctly.
> 
> Yes, I think it would be good to have the I/O operation fully completed
> on the IDE level rather than just in the block layer.
> 
>>> Or the issue is generally that IDE uses dma_* functions, which might
>>> cause I/O functions to be run from new BHs (I guess through
>>> reschedule_dma()?).
> 
> None of those complicated scenarios actually. The problem solved by the
> request queuing is simply that nothing else stops the guest from
> submitting new requests to drained nodes if the CPUs are still running.
> 
> Drain uses aio_disable_external() to disable processing of external
> events, in particular the ioeventfd used by virtio-blk and virtio-scsi.
> But IDE submits requests through MMIO or port I/O, i.e. the vcpu thread
> exits to userspace and calls directly into the IDE code, so it's
> completely unaffected by aio_disable_external().
> 
>> Ah, you mean that you can have pending I/O operations while blk->in_flight
>> is zero?  That would be a problem indeed.  We already have BlockDevOps for
>> ide-cd and ide-hd, should we add a .drained_poll callback there?
> 
> To be more precise, you suggested in the call that .drained_poll should
> return that IDE is still busy while aiocb != NULL. Without having looked
> at the code in detail yet, that seems to make sense to me. And maybe
> even the blk_inc/dec_in_flight() pair can then go completely away
> because IDE takes care of its drain state itself then.
> 

I assume the addition of drained_poll is meant to be orthogonal to the
fix of the deadlock? At least I can't see how it would help there?

If we have the assumptions:
1. The TRIM operation should be completed on the IDE level before
draining ends.
2. Block layer requests issued after draining has begun are queued.

To me, the conclusion seems to be:
Issue all block layer requests belonging to the IDE TRIM operation up front.

The other alternative I see is to break assumption 2, introduce a way to
not queue certain requests while drained, and use it for the recursive
requests issued by ide_issue_trim_cb. But not the initial one, if that
would defeat the purpose of request queuing. Of course this can't be
done if QEMU relies on the assumption in other places already.

Best Regards,
Fiona


