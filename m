Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FCD45586A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 10:57:48 +0100 (CET)
Received: from localhost ([::1]:42842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mneAt-0005Qp-Gz
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 04:57:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mne9C-0004bO-8t
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 04:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mne98-00008p-GB
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 04:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637229355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgtS2qtEPtxWdGSRN9DUq/i1FFQwam8T+4l41ksykJg=;
 b=cvMnxpyiwHMSGhvg7dqCAYinNfDMYvVCwU8Sh3xsqyypIwX+vyvKnxHFVmR0iyJZ1zO1Ht
 FEs/YvQVBgfj1nPNA7CWXOdDEnzU47wBwkjiVlbRCrKcKJLLVnMq/bW5aFpSW0zTu6Kd7y
 KO1ef0NRwefuD7kyoG/v15S442+P+38=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-Bv7TlfErMbSHYX_b-auzUg-1; Thu, 18 Nov 2021 04:55:53 -0500
X-MC-Unique: Bv7TlfErMbSHYX_b-auzUg-1
Received: by mail-ed1-f72.google.com with SMTP id
 q17-20020aa7da91000000b003e7c0641b9cso4795590eds.12
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 01:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GgtS2qtEPtxWdGSRN9DUq/i1FFQwam8T+4l41ksykJg=;
 b=zImcPoxvXnPy+t/j7KZa4ycDvh5Ny7FahQF3pBuMhK9tmwZ5K3i4Q4ZsG6MEMej7RB
 BC2xN21d5u+0l2aPu0zA2OOfDr0WYGGDIK5T3RM+AjRmLaj2U4xQ0sC7jNMQ7dwU9Y6d
 61Pmjjxzi2FVAmkxVqJOgzAunrtHIXt69Tndz9nJ/Yli7WcwzRpOf4LrQ8P7qXRSD+Hi
 t6OuKnUOl0CVRiFRlT1d2gxAbH6ALQVRHpK7XlWRjYQbCKJl6DKhfAtxST/smNlvq9B3
 uTGni/15VQ1ScWefWGyxJc0UZ5G59Wd5m6XxSD9sFPVo9EjCZ8Be/C2SlRjpAMoERGDq
 ZzKg==
X-Gm-Message-State: AOAM531bItYngws50//H/m9xYnd+b6j1UsE3yUQ/XB5FgXr1z9GucVOn
 8SIaJwI7vfq6MjKwuRA9VOlb8XoX/5B9sgjH217vRB9DjExCDkedfMTlJW7YeB3xh6/KUqIHe+f
 wC9Vnn4eCm7ZKg9U=
X-Received: by 2002:a50:cd87:: with SMTP id p7mr9343790edi.205.1637229352249; 
 Thu, 18 Nov 2021 01:55:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBG+fsJjzwkNtu4VO86Qu/yeu41wamt0n2xNuEmEmpUwIQARdOjCjM8EKfmU/mbBUE8QGe6A==
X-Received: by 2002:a50:cd87:: with SMTP id p7mr9343717edi.205.1637229351839; 
 Thu, 18 Nov 2021 01:55:51 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id sb19sm1136164ejc.120.2021.11.18.01.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 01:55:51 -0800 (PST)
Message-ID: <ff4a4c8e-93c3-2954-27ef-68587f3868ec@redhat.com>
Date: Thu, 18 Nov 2021 10:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 08/25] block: introduce assert_bdrv_graph_writable
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-9-eesposit@redhat.com>
 <734073bb-80e6-3caf-d6b5-c8f2ade86044@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <734073bb-80e6-3caf-d6b5-c8f2ade86044@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/11/2021 15:40, Hanna Reitz wrote:
> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>> We want to be sure that the functions that write the child and
>> parent list of a bs are under BQL and drain.
>>
>> BQL prevents from concurrent writings from the GS API, while
>> drains protect from I/O.
>>
>> TODO: drains are missing in some functions using this assert.
>> Therefore a proper assertion will fail. Because adding drains
>> requires additional discussions, they will be added in future
>> series.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block.c                                |  5 +++++
>>   block/io.c                             | 11 +++++++++++
>>   include/block/block_int-global-state.h | 10 +++++++++-
>>   3 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/block.c b/block.c
>> index 41c5883c5c..94bff5c757 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -2734,12 +2734,14 @@ static void 
>> bdrv_replace_child_noperm(BdrvChild *child,
>>           if (child->klass->detach) {
>>               child->klass->detach(child);
>>           }
>> +        assert_bdrv_graph_writable(old_bs);
>>           QLIST_REMOVE(child, next_parent);
> 
> I think this belongs above the .detach() call (and the QLIST_REMOVE() 
> belongs into the .detach() implementation, as done in 
> https://lists.nongnu.org/archive/html/qemu-block/2021-11/msg00240.html, 
> which has been merged to Kevin’s block branch).

Yes, I rebased on kwolf/block branch. Thank you for pointing that out.
> 
>>       }
>>       child->bs = new_bs;
>>       if (new_bs) {
>> +        assert_bdrv_graph_writable(new_bs);
>>           QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
> 
> In both these places it’s a bit strange that the assertion is done on 
> the child nodes.  The subgraph starting from them isn’t modified after 
> all, so their subgraph technically doesn’t need to be writable.  I think 
> a single assertion on the parent node would be preferable.
> 
> I presume the problem with that is that we don’t have the parent node 
> here?  Do we need a new BdrvChildClass method that performs this 
> assertion on the parent node?
> 

Uhm I am not sure what you mean here.

Just to recap on how I see this: the assertion 
assert_bdrv_graph_writable(bs) is basically used to make sure we are 
protecting the write on some fields (childrens and parents lists in this 
patch) of a given @bs. It should work like a rwlock: reading is allowed 
to be concurrent, but a write should stop all readers to prevent 
concurrency issues. This is achieved by draining.

Let's use the first case that you point out, old_bs (it's specular for 
new_bs):

 >> +        assert_bdrv_graph_writable(old_bs);
 >>           QLIST_REMOVE(child, next_parent);

So old_bs should be the child "son" (child->bs), meaning old_bs->parents 
contains the child. Therefore when a child is removed by old_bs, we need 
to be sure we are doing it safely.

So we should check that if old_bs exists, old_bs should be drained, to 
prevent any other iothread from reading the ->parents list that is being 
updated.

The only thing to keep in mind in this case is that just wrapping a 
drain around that won't be enough, because then the child won't be 
included in the drain_end(old_bs). Therefore the right way to cover this 
drain-wise once the assertion also checks for drains is:

drain_begin(old_bs)
assert_bdrv_graph_writable(old_bs)
QLIST_REMOVE(child, next_parent)
/* old_bs will be under drain_end, but not the child */
bdrv_parent_drained_end_single(child);
bdrv_drained_end(old_bs);

I think you agree on this so far.

Now I think your concern is related to the child "parent", namely 
child->opaque. The problem is that in the .detach and .attach callbacks 
we are firstly adding/removing the child from the list, and then calling 
drain on the subtree. We would ideally need to do the opposite:

assert_bdrv_graph_writable(bs);
QLIST_REMOVE(child, next);
bdrv_unapply_subtree_drain(child, bs);

In this case I think this would actually work, because removing/adding 
the child from the ->children list beforehand just prevents an 
additional recursion call (I think, and the fact that tests are passing 
seems to confirm my theory).

Of course you know this stuff better than me, so let me know if 
something here is wrong.

>>           /*
>> @@ -2940,6 +2942,7 @@ static int 
>> bdrv_attach_child_noperm(BlockDriverState *parent_bs,
>>           return ret;
>>       }
>> +    assert_bdrv_graph_writable(parent_bs);
>>       QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
>>       /*
>>        * child is removed in bdrv_attach_child_common_abort(), so 
>> don't care to
>> @@ -3140,6 +3143,7 @@ static void 
>> bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
>>   void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
>>   {
>>       assert(qemu_in_main_thread());
>> +    assert_bdrv_graph_writable(parent);
> 
> It looks to me like we have this assertion mainly because 
> bdrv_replace_child_noperm() doesn’t have a pointer to this parent node. 
> It’s a workaround, but we should have this in every path that eventually 
> ends up at bdrv_replace_child_noperm(), and that seems rather difficult 
> for the bdrv_replace_node() family of functions. That to me sounds like 
> it’d be good to have this as a BdrvChildClass function.

I think this assertion is wrong. There is no ->childrens or ->parents 
manipulation here, it used to be in one of the function that it calls 
internally, but now as you pointed out is moved to .attach and .detach. 
So I will remove this.

Not sure about the BdrvChildClass function, feel free to elaborate more 
if what I wrote above is wrong/does not make sense to you.

Thank you,
Emanuele
> 
>>       if (child == NULL) {
>>           return;
>>       }
>> @@ -4903,6 +4907,7 @@ static void 
>> bdrv_remove_filter_or_cow_child_abort(void *opaque)
>>       BdrvRemoveFilterOrCowChild *s = opaque;
>>       BlockDriverState *parent_bs = s->child->opaque;
>> +    assert_bdrv_graph_writable(parent_bs);
>>       QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
>>       if (s->is_backing) {
>>           parent_bs->backing = s->child;
>> diff --git a/block/io.c b/block/io.c
>> index f271ab3684..1c71e354d6 100644
>> --- a/block/io.c
>> +++ b/block/io.c
>> @@ -740,6 +740,17 @@ void bdrv_drain_all(void)
>>       bdrv_drain_all_end();
>>   }
>> +void assert_bdrv_graph_writable(BlockDriverState *bs)
>> +{
>> +    /*
>> +     * TODO: this function is incomplete. Because the users of this
>> +     * assert lack the necessary drains, check only for BQL.
>> +     * Once the necessary drains are added,
>> +     * assert also for qatomic_read(&bs->quiesce_counter) > 0
>> +     */
>> +    assert(qemu_in_main_thread());
>> +}
>> +
>>   /**
>>    * Remove an active request from the tracked requests list
>>    *
>> diff --git a/include/block/block_int-global-state.h 
>> b/include/block/block_int-global-state.h
>> index d08e80222c..6bd7746409 100644
>> --- a/include/block/block_int-global-state.h
>> +++ b/include/block/block_int-global-state.h
>> @@ -316,4 +316,12 @@ void 
>> bdrv_remove_aio_context_notifier(BlockDriverState *bs,
>>    */
>>   void bdrv_drain_all_end_quiesce(BlockDriverState *bs);
>> -#endif /* BLOCK_INT_GLOBAL_STATE*/
>> +/**
>> + * Make sure that the function is either running under
>> + * drain and BQL. The latter protects from concurrent writings
> 
> “either ... and” sounds wrong to me.  I’d drop the “either” or say 
> “running under both drain and BQL”.
> 
> Hanna
> 
>> + * from the GS API, while the former prevents concurrent reads
>> + * from I/O.
>> + */
>> +void assert_bdrv_graph_writable(BlockDriverState *bs);
>> +
>> +#endif /* BLOCK_INT_GLOBAL_STATE */
> 


