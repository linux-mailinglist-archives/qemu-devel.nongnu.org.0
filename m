Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A1F6B777B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 13:30:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhJH-0006S6-6y; Mon, 13 Mar 2023 08:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pbhJA-0006Ql-Uf; Mon, 13 Mar 2023 08:29:47 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pbhJ8-0004vR-HF; Mon, 13 Mar 2023 08:29:44 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 48FCC43FA3;
 Mon, 13 Mar 2023 13:29:26 +0100 (CET)
Message-ID: <9bc7a6d8-744e-9593-1de0-88f19a1e1bc1@proxmox.com>
Date: Mon, 13 Mar 2023 13:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Czenczek <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
References: <20230309114430.33684-1-hreitz@redhat.com>
 <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
 <CABgObfZkSt6-0-vKkUtiWUy1TtHS_kEiYM2wRh+MfjTXmW497A@mail.gmail.com>
 <7ca18cb4-eeb1-4cba-feea-90f28fb9c2fc@redhat.com>
 <3e695f64-13bb-1311-6cd6-09bffc312873@redhat.com>
 <ZAobe/wtsf//YGHJ@redhat.com>
 <a432cb4d-8d7e-8408-15a9-c84414c03196@proxmox.com>
 <ZAs92f/J9qvA6X5B@redhat.com>
 <CABgObfbJ_20fk4H=w0HUBrAtUBbrzn53euqUc-D-s5a3-Xur5w@mail.gmail.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <CABgObfbJ_20fk4H=w0HUBrAtUBbrzn53euqUc-D-s5a3-Xur5w@mail.gmail.com>
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

Am 10.03.23 um 16:13 schrieb Paolo Bonzini:
> On Fri, Mar 10, 2023 at 3:25 PM Kevin Wolf <kwolf@redhat.com> wrote:
>>> 1. The TRIM operation should be completed on the IDE level before
>>> draining ends.
>>> 2. Block layer requests issued after draining has begun are queued.
>>>
>>> To me, the conclusion seems to be:
>>> Issue all block layer requests belonging to the IDE TRIM operation up
>>> front.
>>>
>>> The other alternative I see is to break assumption 2, introduce a way
>>> to not queue certain requests while drained, and use it for the
>>> recursive requests issued by ide_issue_trim_cb. But not the initial
>>> one, if that would defeat the purpose of request queuing. Of course
>>> this can't be done if QEMU relies on the assumption in other places
>>> already.
>>
>> I feel like this should be allowed because if anyone has exclusive
>> access in this scenario, it's IDE, so it should be able to bypass the
>> queuing. Of course, the queuing is still needed if someone else drained
>> the backend, so we can't just make TRIM bypass it in general. And if you
>> make it conditional on IDE being in blk_drain(), it already starts to
>> become ugly again...
>>
>> So maybe the while loop is unavoidable.
>>
>> Hmm... But could ide_cancel_dma_sync() just directly use
>> AIO_WAIT_WHILE(s->bus->dma->aiocb) instead of using blk_drain()?
> 
> While that should work, it would not fix other uses of
> bdrv_drain_all(), for example in softmmu/cpus.c. Stopping the device
> model relies on those to run *until the device model has finished
> submitting requests*.
> 
> So I still think that this bug is a symptom of a problem in the design
> of request queuing.
> 
> In fact, shouldn't request queuing was enabled at the _end_ of
> bdrv_drained_begin (once the BlockBackend has reached a quiescent
> state on its own terms), rather than at the beginning (which leads to
> deadlocks like this one)?
> 
> blk->quiesce_counter becomes just a nesting counter for
> drained_begin/end, with no uses outside, and blk_wait_while_drained
> uses a new counter. Then you have something like this in
> blk_root_drained_poll:
> 
>     if (blk->dev_ops && blk->dev_ops->drained_poll) {
>         busy = blk->dev_ops->drained_poll(blk->dev_opaque);
>     }
>     busy |= !!blk->in_flight;
>     if (!busy) {
>        qatomic_set(&blk->queue_requests, true);
>     }
>     return busy;
> 
> And there's no need to touch IDE at all.
> 
Couldn't this lead to scenarios where a busy or malicious guest, which
continues to submit new requests, slows down draining or even prevents
it from finishing?

Best Regards,
Fiona


