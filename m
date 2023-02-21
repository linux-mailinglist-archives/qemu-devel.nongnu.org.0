Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AA669E902
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 21:38:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUZNk-0002lC-SH; Tue, 21 Feb 2023 15:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUZNi-0002j1-9W
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 15:36:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pUZNg-00005J-7Q
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 15:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677011813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WrTOxoFAturRA4eV7IA+Xm3BLimjEEVfKxc0tWqB/Rs=;
 b=ZAIkm1myOp379fjIUX2wwDN4GQzlVbVxsQrURJS/2TP4ehOOc/fY9iG5wV2KiHn9/g76LO
 w0HrVmD0jKIJZ2gG8TbCro4Bet5wW3iZRywV4r5gKnU0/knOM9SFWUmUg7PXPXzdcuN+bm
 qNs2+Dt2cYZXxtUMLAE9uvpw4ICYv3g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-463-GU-PMALCPDSANb9vKL_JBg-1; Tue, 21 Feb 2023 15:36:50 -0500
X-MC-Unique: GU-PMALCPDSANb9vKL_JBg-1
Received: by mail-qv1-f70.google.com with SMTP id
 y3-20020a0cec03000000b0056ee5b123bbso2629387qvo.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 12:36:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WrTOxoFAturRA4eV7IA+Xm3BLimjEEVfKxc0tWqB/Rs=;
 b=Dm1ctwf8BMuLA46lSHyJK/+Ep9hXQt0zVhYxCcPHR2HlvlfkrPocwmQUNQEoJ14jXZ
 xjscktVNvJFd/5TMjRbbzIP1QnaUs7vLsa652dzuu7u7vJ1NmukyRADajCye62E8ta5w
 mMeveNBV2cC0Vr2+V0KgKD3rvAqtvnTfl222O8T1dFjJhIiDyoam+wSGlIyWcber2sjw
 kxz++SQT8/xScamlljdwgp6qUUQOz8T0USSERFtcRX0NQ13sHDJt6PdsDgl6uqf1guhm
 idt8xGiGtX+VQxI42MRfwOH0S88zbkSxcbTjsL1/1ZyyXgNNAbImAilPaKvV7yzFBHIJ
 DJOA==
X-Gm-Message-State: AO0yUKWoj2Yf+hxZA/KXdhfVY34+Y5IGkzypfeFVp4owbnZF0tMGgF7h
 a203XvP4K4891RBg18aqb6x3OeOBOdf55v2oXaDx47tPWPWmO41YclL0VS7FVpw6mgtrjjuptcH
 w9UfFnLhw7wVTsbs=
X-Received: by 2002:a05:622a:40a:b0:3be:36c7:a15b with SMTP id
 n10-20020a05622a040a00b003be36c7a15bmr11200934qtx.6.1677011809623; 
 Tue, 21 Feb 2023 12:36:49 -0800 (PST)
X-Google-Smtp-Source: AK7set++8srXDXHuiOpMcjqUlrk0vFysBK34qBR499rG1XzWF6vuTXONOsdSMtU0ZdSdwtHhRfT7Ng==
X-Received: by 2002:a05:622a:40a:b0:3be:36c7:a15b with SMTP id
 n10-20020a05622a040a00b003be36c7a15bmr11200900qtx.6.1677011809314; 
 Tue, 21 Feb 2023 12:36:49 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05622a039100b003b63dfad2b4sm1783199qtx.0.2023.02.21.12.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 12:36:48 -0800 (PST)
Date: Tue, 21 Feb 2023 15:36:47 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
Message-ID: <Y/UrXwRK7rB2KRKO@x1n>
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
 <877cwizqvy.fsf@secure.mitica>
 <a555b989-27be-006e-0d00-9f1688c5be4e@bytedance.com>
 <abcb08b7-460c-d88c-af48-c1d256f89c54@bytedance.com>
 <Y++i1NmxUxOPDM/V@x1n>
 <76a253ef-6989-f92d-cb33-6456a270a8d1@bytedance.com>
 <51d862b2-96be-0b93-7ed2-fcd15ffaa76e@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51d862b2-96be-0b93-7ed2-fcd15ffaa76e@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 21, 2023 at 04:57:30PM +0800, Chuang Xu wrote:
> Hi, Peter

Hi, Chuang,

> 
> This email is a supplement to the previous one.

AFAICT I mostly agree with you, but see a few more comments below.

> 
> On 2023/2/21 上午11:38, Chuang Xu wrote:
> > 
> > I think we need a memory_region_transaction_commit_force() to force
> > commit
> > some transactions when load vmstate. This function is designed like this:
> > 
> > /*
> >  * memory_region_transaction_commit_force() is desgined to
> >  * force the mr transaction to be commited in the process
> >  * of loading vmstate.
> >  */
> > void memory_region_transaction_commit_force(void)

I would call this memory_region_transaction_do_commit(), and I don't think
the manipulation of memory_region_transaction_depth is needed here since we
don't release BQL during the whole process, so changing that depth isn't
needed at all to me.

So, I think we can...

> > {
> >     AddressSpace *as;
> >     unsigned int memory_region_transaction_depth_copy =
> > memory_region_transaction_depth;
> > 
> >     /*
> >      * Temporarily replace memory_region_transaction_depth with 0 to
> > prevent
> >      * memory_region_transaction_commit_force() and
> > address_space_to_flatview()
> >      * call each other recursively.
> >      */
> >     memory_region_transaction_depth = 0;

... drop here ...

> > 
> >     assert(qemu_mutex_iothread_locked());
> > 
> > 
> >     if (memory_region_update_pending) {
> >         flatviews_reset();
> > 
> >         MEMORY_LISTENER_CALL_GLOBAL(begin, Forward);
> > 
> >         QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> >             address_space_set_flatview(as);
> >             address_space_update_ioeventfds(as);
> >         }
> >         memory_region_update_pending = false;
> >         ioeventfd_update_pending = false;
> >         MEMORY_LISTENER_CALL_GLOBAL(commit, Forward);
> >     } else if (ioeventfd_update_pending) {
> >         QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> >             address_space_update_ioeventfds(as);
> >         }
> >         ioeventfd_update_pending = false;
> >     }
> > 
> >     /* recover memory_region_transaction_depth */
> >     memory_region_transaction_depth =
> > memory_region_transaction_depth_copy;

... drop here ...

> > }

... then call this new memory_region_transaction_do_commit() in
memory_region_transaction_commit().

void memory_region_transaction_commit(void)
{
    AddressSpace *as;

    assert(memory_region_transaction_depth);
    --memory_region_transaction_depth;
    memory_region_transaction_do_commit();
}

Then...

> > 
> > Now there are two options to use this function:
> > 1. call it in address_space_to_flatview():
> > 
> > static inline FlatView *address_space_to_flatview(AddressSpace *as)
> > {
> >     /*
> >      * Before using any flatview, check whether we're during a memory
> >      * region transaction. If so, force commit the memory region
> > transaction.
> >      */
> >     if (memory_region_transaction_in_progress())
> 
> Here we need to add the condition of BQL holding, or some threads without
> BQL held running here will trigger the assertion in
> memory_region_transaction_commit_force().
> 
> I'm not sure whether this condition is sufficient, at least for the mr access
> in the load thread it is sufficient (because the load thread will hold the BQL
> when accessing mr). But for other cases, it seems that we will return to
> our discussion on sanity check..

Yes, I think the sanity checks are actually good stuff.

I would think it's nice to impl address_space_to_flatview() like this.  I
guess we don't have an use case to fetch the flatview during a memory
update procedure, but I also don't see why it can't be supported.

/* Need to be called with either BQL or RCU read lock held */
static inline FlatView *address_space_to_flatview(AddressSpace *as)
{
    if (qemu_mutex_iothread_locked()) {
        /* We exclusively own the flatview now.. */
        if (memory_region_transaction_in_progress()) {
            /*
             * Fetch the flatview within a transaction in-progress, it
             * means current_map may not be the latest, we need to update
             * immediately to make sure the caller won't see obsolete
             * mapping.
             */
            memory_region_transaction_do_commit();
        }

        /* No further protection needed to access current_map */
        return as->current_map;
    }

    /* Otherwise we must have had the RCU lock or something went wrong */
    assert(rcu_read_is_locked());

    return qatomic_rcu_read(&as->current_map);
}

Then IIUC everything should start to run normal again, with the same hope
that it will keep the benefit of your whole idea.  Does that look sane to
you?

> 
> Another point I worry about is whether the number of mr transaction commits
> has increased in some other scenarios because of this force commit. Although
> So far, I haven't seen a simple virtual machine lifecycle trigger this force commit.

It won't be so bad; with the help of existing memory_region_update_pending
and ioeventfd_update_pending, the commit() will be noop if both are unset.

> I did a little test: replace commit_force() with abort() and run qtest.
> Almost all error I can see is related to migration..
> 
> > memory_region_transaction_commit_force();
> >     return qatomic_rcu_read(&as->current_map);
> > }
> > 
> > 2. call it before each post_load()
> > 
> > I prefer to use the former one, it is more general than the latter.
> > And with this function, the sanity check is not necessary any more.
> > Although we may inevitably call memory_region_transaction_commit_force()
> > several times, in my actual test, the number of calls to
> > memory_region_transaction_commit_force() is still insignificant compared
> > with the number of calls to memory_region_transaction_commit() before
> > optimization. As a result, This code won't affect the optimization
> > effect,
> > but it can ensure reliability.

Yes the 2nd option doesn't sound appealing to me, because we have so many
post_load()s and it can quickly beat your original purpose, I think.

Thanks,

-- 
Peter Xu


