Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A16473CA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 17:02:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3JKn-0000Sx-92; Thu, 08 Dec 2022 11:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p3JKf-0000SK-1u
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 11:01:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p3JKZ-0000Nw-I5
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 11:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670515262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S37V+c6YainuPctvRm/6n446JOcHUi2rYI6ZUHOoXos=;
 b=ZireFY7RfrF2OoVdsIj0Vokxna1QVY3k5xPuVYCZphw1eiRjo2czIcfvLWmbqT5FWx3Jxr
 Pvt6S323mfGtxCfu/gbQ+v1NU64BZo0F8UBR/O7i/yxxrzzlEL5l7N/7qI955NrF96YvIt
 x4OqaQNSZ0FzMLmXKt8RLID8RxEN+Do=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-7CdRFTfPOO2D_Coi7OMjWg-1; Thu, 08 Dec 2022 11:01:00 -0500
X-MC-Unique: 7CdRFTfPOO2D_Coi7OMjWg-1
Received: by mail-qk1-f198.google.com with SMTP id
 o13-20020a05620a2a0d00b006cf9085682dso1871457qkp.7
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 08:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S37V+c6YainuPctvRm/6n446JOcHUi2rYI6ZUHOoXos=;
 b=jhMhd6FN1tBrZzfMv7qlZo/c5Pflh8UAqE2UkjeoOqdbxrMe9UE+z3hs9Scd9XeOTJ
 Cp+lWI8Z75NgVTp/Yb7etbfx5q/p1a95yl2+f77EdWbRAFKJAAAMJfj4phNqX4Sn0LDX
 nEONi1DHHWBk93RFLpJCGGJWBJ8uoJQqdK2t3gZXnNKugL/ac6tobg8A9NNpFZhWfG2m
 pMYyjyxOFfcEdFIgXbtYuXwoX7e+Axhj8Ih/pQBfMIco+KX8Q9+4SATBidbi8wdMawMH
 ELg2QfEL4rUcdcSpRxIaU+WLiJGXsnoHXmtuhmPoKS0Oc+RVda6HTM7bZvmV+5IeMPyi
 XeSA==
X-Gm-Message-State: ANoB5pk8whhXeBzBqhNBefVRHJW5DgE8DyfbKNqAPjsF0VR/Q0FVj2kd
 59Ore3Nqc6ki+Sw3cUwlY846RQ6247Cs7Y2o6vHwXp0mNnWIs27H+MoMj7NoJZYrT9yi5GpriRL
 i73IhjPzyOpP3J1w=
X-Received: by 2002:ac8:5c03:0:b0:3a6:6181:f4ef with SMTP id
 i3-20020ac85c03000000b003a66181f4efmr5658948qti.60.1670515260029; 
 Thu, 08 Dec 2022 08:01:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7PfMvRXEpI3+94F0qyDfwvoHwfbSzPRftle9ifOqB61nRpI4dZST/8hv++JxvY7Gh6n8uMPA==
X-Received: by 2002:ac8:5c03:0:b0:3a6:6181:f4ef with SMTP id
 i3-20020ac85c03000000b003a66181f4efmr5658704qti.60.1670515258190; 
 Thu, 08 Dec 2022 08:00:58 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 z14-20020ac8100e000000b003a6847d6386sm15070355qti.68.2022.12.08.08.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 08:00:57 -0800 (PST)
Date: Thu, 8 Dec 2022 11:00:56 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] migration: reduce time of loading non-iterable vmstate
Message-ID: <Y5IKOIUYHWbpVABV@x1n>
References: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
 <Y3+egjXTvLEHDjuT@x1n>
 <7e5c5d6c-8f23-c0c5-5f5c-5daad854c2e7@bytedance.com>
 <Y4Ty07M/HN9UnsGb@x1n>
 <1adf426d-a9c8-9015-383b-3e82eb6b7c54@bytedance.com>
 <Y44cNenFueVE4RFW@x1n>
 <faae03bb-7705-fb16-46a5-e4c2ea55a254@bytedance.com>
 <Y5EO8HqNVj/Rq7M5@x1n>
 <704c1986-e878-8837-a2bb-12f76eeb1ba4@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <704c1986-e878-8837-a2bb-12f76eeb1ba4@bytedance.com>
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

On Thu, Dec 08, 2022 at 10:39:11PM +0800, Chuang Xu wrote:
> 
> On 2022/12/8 上午6:08, Peter Xu wrote:
> > On Thu, Dec 08, 2022 at 12:07:03AM +0800, Chuang Xu wrote:
> > > On 2022/12/6 上午12:28, Peter Xu wrote:
> > > > Chuang,
> > > > 
> > > > No worry on the delay; you're faster than when I read yours. :)
> > > > 
> > > > On Mon, Dec 05, 2022 at 02:56:15PM +0800, Chuang Xu wrote:
> > > > > > As a start, maybe you can try with poison address_space_to_flatview() (by
> > > > > > e.g. checking the start_pack_mr_change flag and assert it is not set)
> > > > > > during this process to see whether any call stack can even try to
> > > > > > dereference a flatview.
> > > > > > 
> > > > > > It's just that I didn't figure a good way to "prove" its validity, even if
> > > > > > I think this is an interesting idea worth thinking to shrink the downtime.
> > > > > Thanks for your sugguestions!
> > > > > I used a thread local variable to identify whether the current thread is a
> > > > > migration thread(main thread of target qemu) and I modified the code of
> > > > > qemu_coroutine_switch to make sure the thread local variable true only in
> > > > > process_incoming_migration_co call stack. If the target qemu detects that
> > > > > start_pack_mr_change is set and address_space_to_flatview() is called in
> > > > > non-migrating threads or non-migrating coroutine, it will crash.
> > > > Are you using the thread var just to avoid the assert triggering in the
> > > > migration thread when commiting memory changes?
> > > > 
> > > > I think _maybe_ another cleaner way to sanity check this is directly upon
> > > > the depth:
> > > > 
> > > > static inline FlatView *address_space_to_flatview(AddressSpace *as)
> > > > {
> > > >       /*
> > > >        * Before using any flatview, sanity check we're not during a memory
> > > >        * region transaction or the map can be invalid.  Note that this can
> > > >        * also be called during commit phase of memory transaction, but that
> > > >        * should also only happen when the depth decreases to 0 first.
> > > >        */
> > > >       assert(memory_region_transaction_depth == 0);
> > > >       return qatomic_rcu_read(&as->current_map);
> > > > }
> > > > 
> > > > That should also cover the safe cases of memory transaction commits during
> > > > migration.
> > > > 
> > > Peter, I tried this way and found that the target qemu will crash.
> > > 
> > > Here is the gdb backtrace:
> > > 
> > > #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:51
> > > #1  0x00007ff2929d851a in __GI_abort () at abort.c:118
> > > #2  0x00007ff2929cfe67 in __assert_fail_base (fmt=<optimized out>, assertion=assertion@entry=0x55a32578cdc0 "memory_region_transaction_depth == 0", file=file@entry=0x55a32575d9b0 "/data00/migration/qemu-5.2.0/include/exec/memory.h",
> > >      line=line@entry=766, function=function@entry=0x55a32578d6e0 <__PRETTY_FUNCTION__.20463> "address_space_to_flatview") at assert.c:92
> > > #3  0x00007ff2929cff12 in __GI___assert_fail (assertion=assertion@entry=0x55a32578cdc0 "memory_region_transaction_depth == 0", file=file@entry=0x55a32575d9b0 "/data00/migration/qemu-5.2.0/include/exec/memory.h", line=line@entry=766,
> > >      function=function@entry=0x55a32578d6e0 <__PRETTY_FUNCTION__.20463> "address_space_to_flatview") at assert.c:101
> > > #4  0x000055a324b2ed5e in address_space_to_flatview (as=0x55a326132580 <address_space_memory>) at /data00/migration/qemu-5.2.0/include/exec/memory.h:766
> > > #5  0x000055a324e79559 in address_space_to_flatview (as=0x55a326132580 <address_space_memory>) at ../softmmu/memory.c:811
> > > #6  address_space_get_flatview (as=0x55a326132580 <address_space_memory>) at ../softmmu/memory.c:805
> > > #7  0x000055a324e96474 in address_space_cache_init (cache=cache@entry=0x55a32a4fb000, as=<optimized out>, addr=addr@entry=68404985856, len=len@entry=4096, is_write=false) at ../softmmu/physmem.c:3307
> > > #8  0x000055a324ea9cba in virtio_init_region_cache (vdev=0x55a32985d9a0, n=0) at ../hw/virtio/virtio.c:185
> > > #9  0x000055a324eaa615 in virtio_load (vdev=0x55a32985d9a0, f=<optimized out>, version_id=<optimized out>) at ../hw/virtio/virtio.c:3203
> > > #10 0x000055a324c6ab96 in vmstate_load_state (f=f@entry=0x55a329dc0c00, vmsd=0x55a325fc1a60 <vmstate_virtio_scsi>, opaque=0x55a32985d9a0, version_id=1) at ../migration/vmstate.c:143
> > > #11 0x000055a324cda138 in vmstate_load (f=0x55a329dc0c00, se=0x55a329941c90) at ../migration/savevm.c:913
> > > #12 0x000055a324cdda34 in qemu_loadvm_section_start_full (mis=0x55a3284ef9e0, f=0x55a329dc0c00) at ../migration/savevm.c:2741
> > > #13 qemu_loadvm_state_main (f=f@entry=0x55a329dc0c00, mis=mis@entry=0x55a3284ef9e0) at ../migration/savevm.c:2939
> > > #14 0x000055a324cdf66a in qemu_loadvm_state (f=0x55a329dc0c00) at ../migration/savevm.c:3021
> > > #15 0x000055a324d14b4e in process_incoming_migration_co (opaque=<optimized out>) at ../migration/migration.c:574
> > > #16 0x000055a32501ae3b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:173
> > > #17 0x00007ff2929e8000 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> > > #18 0x00007ffed80dc2a0 in ?? ()
> > > #19 0x0000000000000000 in ?? ()
> > > 
> > > address_space_cache_init() is the only caller of address_space_to_flatview
> > > I can find in vmstate_load call stack so far. Although I think the mr used
> > > by address_space_cache_init() won't be affected by the delay of
> > > memory_region_transaction_commit(), we really need a mechanism to prevent
> > > the modified mr from being used.
> > > 
> > > Maybe we can build a stale list:
> > > If a subregion is added, add its parent to the stale list(considering that
> > > new subregion's priority has uncertain effects on flatviews).
> > > If a subregion is deleted, add itself to the stale list.
> > > When memory_region_transaction_commit() regenerates flatviews, clear the
> > > stale list.
> > > when address_space_translate_internal() is called, check whether the mr
> > > looked up matches one of mrs（or its child）in the stale list. If yes, a
> > > crash will be triggered.
> > I'm not sure that'll work, though.  Consider this graph:
> > 
> >                              A
> >                             / \
> >                            B   C
> >                         (p=1) (p=0)
> > 
> > A,B,C are MRs, B&C are subregions to A.  When B's priority is higher (p=1),
> > any access to A will go upon B, so far so good.
> > 
> > Then, let's assume D comes under C with even higher priority:
> > 
> >                              A
> >                             / \
> >                            B   C
> >                         (p=1) (p=0)
> >                                |
> >                                D
> >                               (p=2)
> > 
> > 
> > Adding C into stale list won't work because when with the old flatview
> > it'll point to B instead, while B is not in the stale list. The AS
> > operation will carry out without noticing it's already wrong.
> 
> Peter, I think our understanding of priority is different.
> 
> In the qemu docs
> (https://qemu.readthedocs.io/en/stable-6.1/devel/memory.html#overlapping-regions-and-priority),
> it says 'Priority values are local to a container, because the priorities of
> two regions are only compared when they are both children of the same container.'
> And as I read in code, when doing render_memory_region() operation on A, qemu
> will firstly insert B's FlatRanges and its children's FlatRanges recursively
> because B's priority is higher than C. After B's FlatRanges and its children's
> FlatRanges are all inserted into flatviews, C's FlatRanges and its children's
> FlatRanges will be inserted into gaps left by B if B and C overlaps.
> 
> So I think adding D as C's subregion has no effect on B in your second case.
> The old FlatRange pointing to B is still effective. C and C'children with lower
> priority than D will be affected, but we have flagged them as stale.
> 
> I hope I have no misunderstanding of the flatview's construction code. If I
> understand wrong, please forgive my ignorance..😭

No I think you're right.. thanks, I should read the code/doc first rather
than trusting myself. :)

But still, the whole point is that the parent may not even be visible to
the flatview, so I still don't know how it could work.

My 2nd attempt:

                                  A
                                  |
                                  B
                                (p=1)

Adding C with p=2:

                                  A
                                 / \
                                B   C
                             (p=1) (p=2)

IIUC the flatview to access the offset A resides should point to B, then
after C plugged we'll still lookup and find B.  Even if A is in the stale
list, B is not?

The other thing I didn't mention is that I don't think the address space
translation is the solo consumer of the flat view.  Some examples:

common_semi_find_bases() walks the flatview without translations.

memory_region_update_coalesced_range() (calls address_space_get_flatview()
first) notifies kvm coalesced mmio regions without translations.

So at least hooking up address_space_translate_internal() itself may not be
enough too.

> 
> > 
> > > There may be many details to consider in this mechanism. Hope you can give
> > > some suggestions on its feasibility.
> > For this specific case, I'm wildly thinking whether we can just postpone
> > the init of the vring cache until migration completes.
> > 
> > One thing to mention from what I read it: we'll need to update all the
> > caches in virtio_memory_listener_commit() anyway, when the batched commit()
> > happens when migration completes with your approach, so we'll rebuild the
> > vring cache once and for all which looks also nice if possible.
> > 
> > There's some details to consider. E.g. the commit() happens only when
> > memory_region_update_pending==true.  We may want to make sure the cache is
> > initialized unconditionally, at least.  Not sure whether that's doable,
> > though.
> > 
> > Thanks,
> > 
> Good idea! We can try it in the new patches! And with the delay of
> virtio_init_region_cache(), we can still use assert in address_space_to_flatview().
> However, I think the stale list can be used as a retention scheme for further
> discussion in the future, because the stale list may adapt to more complex scenarios.

If the assert will work that'll be even better.  I'm actually worried this
can trigger like what you mentioned in the virtio path, I didn't expect it
comes that soon.  So if there's a minimum cases and we can fixup easily
that'll be great.  Hopefully there aren't so much or we'll need to revisit
the whole idea.

Thanks,

-- 
Peter Xu


