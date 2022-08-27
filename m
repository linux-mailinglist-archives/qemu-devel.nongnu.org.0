Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4F5A3A09
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 23:00:49 +0200 (CEST)
Received: from localhost ([::1]:50296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oS2v9-0001z3-Um
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 17:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oS2tI-0008TF-Mv
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 16:58:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oS2tE-0001jV-Iu
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 16:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661633927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f5Yp4uDxle1J+XbJ3fMk+np85Dig75I94CphpypKYu4=;
 b=S6DZyswQ/vWH/Soo+VpiaLDVyAQesnilAUm154YNkygY0grMPqbz3Fo4Jj4IAwVNtdteHe
 yziQpFd9m9FNHtTq6/AGFLC5qs6O+AvCO3mfJChTUcLBqFUi+vmQLEZ0GgvE4BgePy89c6
 mswrKSvYzucgVQ9RtY3erjH2cTHQCn4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374-dgX4PmzKMeawjYLXOawf4w-1; Sat, 27 Aug 2022 16:58:43 -0400
X-MC-Unique: dgX4PmzKMeawjYLXOawf4w-1
Received: by mail-qk1-f199.google.com with SMTP id
 n15-20020a05620a294f00b006b5768a0ed0so3763568qkp.7
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 13:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=f5Yp4uDxle1J+XbJ3fMk+np85Dig75I94CphpypKYu4=;
 b=S06sbTltkhNGuajk3J34i5mqu4M4Uz56i1S1oTNAdkp8r2pDG5Qeu1tGDp3W5CTmCg
 LacGZ14LOYrKdiUZ8QbUkypeVT81HJIFTIBw5WGAp7nlH3VOqoLjijBREQuCwYOiesTG
 jQxsKjbz1rfry2LyL92ZMdswC+o5VbvVmErEHWP25pnoICH2MCBk84v7/PcKVstwnAC2
 Nbfnl9BEyCmdpkBxMhb0clwr6Yx5dQ0HDPdy864Pi9uuq7+DbCPTIbZeVqeh2VYgeyzQ
 jld6ZphRr5D23jr62l1ydgxCMdmqAt+ET+ZYuk7GgNL+BSv7Pce3ex7/xp/3lxbQL5MW
 YELQ==
X-Gm-Message-State: ACgBeo3JwL7VopzxywNp9Wlgcaip7MfxFzksUY5izfZOg/s2AKYcuAHp
 9nNQx8rMOOcNAoeHguXv+qxJOKsccoLEBRQEeUIWNBzwoWMmMIbV/qNoh0cro3BzqwKTpoF9TSV
 ww5uKE/zkEnm3LAM=
X-Received: by 2002:a05:620a:2688:b0:6bc:3a9f:42e9 with SMTP id
 c8-20020a05620a268800b006bc3a9f42e9mr3812628qkp.200.1661633922578; 
 Sat, 27 Aug 2022 13:58:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6kYfNdmI+QrzQ63aD1HbE42325Xfg2vkJdOL73lCX8reXOdIDA1S1CxSzrdU1Qna6ghvjyuA==
X-Received: by 2002:a05:620a:2688:b0:6bc:3a9f:42e9 with SMTP id
 c8-20020a05620a268800b006bc3a9f42e9mr3812611qkp.200.1661633922205; 
 Sat, 27 Aug 2022 13:58:42 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 v7-20020ac87487000000b0034035e73be0sm2306646qtq.4.2022.08.27.13.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 13:58:41 -0700 (PDT)
Date: Sat, 27 Aug 2022 16:58:39 -0400
From: Peter Xu <peterx@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay
 kvm_vm_ioctl to the commit phase
Message-ID: <YwqFfyZ1fMA9knnK@xz-m1.local>
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com>
 <Yv6baJoNikyuZ38R@xz-m1.local>
 <CAJ6HWG6maoPjbP8T5qo=iXCbNeHu4dq3wHLKtRLahYKuJmMY-g@mail.gmail.com>
 <YwOOcC72KKABKgU+@xz-m1.local>
 <d4601180-4c95-a952-2b40-d40fa8e55005@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d4601180-4c95-a952-2b40-d40fa8e55005@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Emanuele,

On Fri, Aug 26, 2022 at 04:07:01PM +0200, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 22/08/2022 um 16:10 schrieb Peter Xu:
> > On Thu, Aug 18, 2022 at 09:55:20PM -0300, Leonardo Bras Soares Passos wrote:
> >> On Thu, Aug 18, 2022 at 5:05 PM Peter Xu <peterx@redhat.com> wrote:
> >>>
> >>> On Tue, Aug 16, 2022 at 06:12:50AM -0400, Emanuele Giuseppe Esposito wrote:
> >>>> +static void kvm_memory_region_node_add(KVMMemoryListener *kml,
> >>>> +                                       struct kvm_userspace_memory_region *mem)
> >>>> +{
> >>>> +    MemoryRegionNode *node;
> >>>> +
> >>>> +    node = g_malloc(sizeof(MemoryRegionNode));
> >>>> +    *node = (MemoryRegionNode) {
> >>>> +        .mem = mem,
> >>>> +    };
> >>>
> >>> Nit: direct assignment of struct looks okay, but maybe pointer assignment
> >>> is clearer (with g_malloc0?  Or iirc we're suggested to always use g_new0):
> >>>
> >>>   node = g_new0(MemoryRegionNode, 1);
> >>>   node->mem = mem;
> >>>
> >>> [...]
> 
> Makes sense
> 
> >>>
> >>>> +/* for KVM_SET_USER_MEMORY_REGION_LIST */
> >>>> +struct kvm_userspace_memory_region_list {
> >>>> +     __u32 nent;
> >>>> +     __u32 flags;
> >>>> +     struct kvm_userspace_memory_region entries[0];
> >>>> +};
> >>>> +
> >>>>  /*
> >>>>   * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
> >>>>   * other bits are reserved for kvm internal use which are defined in
> >>>> @@ -1426,6 +1433,8 @@ struct kvm_vfio_spapr_tce {
> >>>>                                       struct kvm_userspace_memory_region)
> >>>>  #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
> >>>>  #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
> >>>> +#define KVM_SET_USER_MEMORY_REGION_LIST _IOW(KVMIO, 0x49, \
> >>>> +                                     struct kvm_userspace_memory_region_list)
> >>>
> >>> I think this is probably good enough, but just to provide the other small
> >>> (but may not be important) piece of puzzle here.  I wanted to think through
> >>> to understand better but I never did..
> >>>
> >>> For a quick look, please read the comment in kvm_set_phys_mem().
> >>>
> >>>                 /*
> >>>                  * NOTE: We should be aware of the fact that here we're only
> >>>                  * doing a best effort to sync dirty bits.  No matter whether
> >>>                  * we're using dirty log or dirty ring, we ignored two facts:
> >>>                  *
> >>>                  * (1) dirty bits can reside in hardware buffers (PML)
> >>>                  *
> >>>                  * (2) after we collected dirty bits here, pages can be dirtied
> >>>                  * again before we do the final KVM_SET_USER_MEMORY_REGION to
> >>>                  * remove the slot.
> >>>                  *
> >>>                  * Not easy.  Let's cross the fingers until it's fixed.
> >>>                  */
> >>>
> >>> One example is if we have 16G mem, we enable dirty tracking and we punch a
> >>> hole of 1G at offset 1G, it'll change from this:
> >>>
> >>>                      (a)
> >>>   |----------------- 16G -------------------|
> >>>
> >>> To this:
> >>>
> >>>      (b)    (c)              (d)
> >>>   |--1G--|XXXXXX|------------14G------------|
> >>>
> >>> Here (c) will be a 1G hole.
> >>>
> >>> With current code, the hole punching will del region (a) and add back
> >>> region (b) and (d).  After the new _LIST ioctl it'll be atomic and nicer.
> >>>
> >>> Here the question is if we're with dirty tracking it means for each region
> >>> we have a dirty bitmap.  Currently we do the best effort of doing below
> >>> sequence:
> >>>
> >>>   (1) fetching dirty bmap of (a)
> >>>   (2) delete region (a)
> >>>   (3) add region (b) (d)
> >>>
> >>> Here (a)'s dirty bmap is mostly kept as best effort, but still we'll lose
> >>> dirty pages written between step (1) and (2) (and actually if the write
> >>> comes within (2) and (3) I think it'll crash qemu, and iiuc that's what
> >>> we're going to fix..).
> >>>
> >>> So ideally the atomic op can be:
> >>>
> >>>   "atomically fetch dirty bmap for removed regions, remove regions, and add
> >>>    new regions"
> >>>
> >>> Rather than only:
> >>>
> >>>   "atomically remove regions, and add new regions"
> >>>
> >>> as what the new _LIST ioctl do.
> >>>
> >>> But... maybe that's not a real problem, at least I didn't know any report
> >>> showing issue with current code yet caused by losing of dirty bits during
> >>> step (1) and (2).  Neither do I know how to trigger an issue with it.
> >>>
> >>> I'm just trying to still provide this information so that you should be
> >>> aware of this problem too, at the meantime when proposing the new ioctl
> >>> change for qemu we should also keep in mind that we won't easily lose the
> >>> dirty bmap of (a) here, which I think this patch does the right thing.
> >>>
> >>
> >> Thanks for bringing these details Peter!
> >>
> >> What do you think of adding?
> >> (4) Copy the corresponding part of (a)'s dirty bitmap to (b) and (d)'s
> >> dirty bitmaps.
> > 
> > Sounds good to me, but may not cover dirty ring?  Maybe we could move on
> > with the simple but clean scheme first and think about a comprehensive
> > option only if very necessary.  The worst case is we need one more kvm cap
> > but we should still have enough.
> 
> Ok then, I will not consider this for now.
> 
> Might or might not be relevant, but I was also considering to
> pre-process the list of memslots passed to the ioctl and merge
> operations when necessary, to avoid unnecessary operations.
> 
> For example, if we are creating an area and punching a hole (assuming
> this is a valid example), we would have
> 
> transaction_begin()
> CREATE(offset=0, memory area)
> DELETE(memory area)
> CREATE(offset=0, memory area / 2 - 1)
> CREATE(offset=memory_area/2, memory area / 2)
> transaction_commmit()
> 
> Instead, if we pre-process the memory regions and detect overlaps with
> an interval tree, we could simplify the above with:
> CREATE(offset=0, memory area / 2 - 1)
> CREATE(offset=memory_area/2, memory area / 2)

As I replied in the private email, I don't think the pre-process here is
needed, because afaict flat views already handle that.

See generate_memory_topology() and especially render_memory_region().

In above example, the 1st CREATE + DELETE shouldn't reach any of the memory
listners, including the KVM one, because the flatview only contains the
final layout of the address space when commit() happens.

> 
> In addition, I was thinking to also provide the operation type (called
> enum kvm_mr_change) from userspace directly, and not "figure" it
> ourselves in KVM.
> 
> The reason for these two changes come from KVM implementation. I know
> this is no KVM place, but a background explanation might be necessary.
> Basically KVM 1) figures the request type by looking at the fields
> passed by userspace (for example mem_size == 0 means DELETE) and the
> current status of the memslot (id not found means CREATE, found means
> MOVE/UPDATE_FLAGS), and 2) has 2 memslot lists per address space: the
> active (visible) and inactive. Any operation is performed in the
> inactive list, then we "swap" the two so that the change is visible.
> 
> The "atomic" goal of this serie just means that we want to apply
> multiple memslot operation and then perform a single "swap".
> The problem is that each DELETE and MOVE request perform 2 swaps: first
> substitute current memslot with an invalid one (so that page faults are
> retried), and then remove the invalid one (in case of MOVE, substitute
> with new memslot).
> 
> Therefore:
> - KVM should ideally pre-process all DELETE/MOVE memslots and perform a
> first swap(s) to replace the current memslot with an invalid one, and
> then perform all other operations in order (deletion/move included).

This sounds correct.

> This is why QEMU should just send pre-merged MR, so that we don't have
> CREATE(x)- DELETE(x). Otherwise we would process a DELETE on a MR that
> doesn't exist yet.

As discussed above, IMHO pre-merge isn't an issue here and I think the
sequence in your example won't happen.  But you raised a great question on
whether we should allow the new ioctl (if there's going to be one) to do
whatever it wants by batching any sequence of memslot operations.

More below.

> 
> - Doing the above is still not enough, as KVM figures what operation to
> do depending on the current state of the memslots.
> Assuming we already have an already existing MR y, and now we get the
> list DELETE(y) CREATE(y/2) (ie reducing y to half its size).
> In this case the interval tree can't do anything, but it's very hard to
> understand that the second request in the list is a CREATE, because when
> KVM performs the check to understand which type of operation it is
> (before doing any modification at all in the memslot list), it finds
> that y (memslot with same id) exist, but has a different size than what
> provided from userspace, therefore it could either fail, or misinterpret
> it as another operation (currently fails -EINVALID).

Another good question..  I think that can be partly solved by not allowing
ID duplication in the same batched ioctl, or maybe we can fail it.  From
qemu perspective, we may need to change the memslot id allocation to not
reuse IDs of being-deleted memslots until the batch is processed.

Something like adding similar INVALID tags to kvm memslots in QEMU when we
are preparing the batch, then we should only reset memory_size==0 and clear
INVALID tag after the ioctl returns.  Then during the batch, any new slots
to be added from kvm_get_free_slot() will not return any duplication of a
deleting one.

> If we instead already provide the labels, then we can:
> 	1. substitute the memslots pointed by DELETE/MOVE with invalid & swap
> (so it is visible, non-atomic. But we don't care, as we are not deleting
> anything)
> 	2. delete the invalid memslot (in the inactive memslot list)
> 	3. process the other requests (in the inactive memslot list)
> 	4. single and atomic swap (step 2 and 3 are now visible).
> 
> What do you think?

Adding some limitation to the new ioctl makes sense to me, especially
moving the DELETE/MOVE to be handled earlier, rather than a complete
mixture of all of them.

I'm wondering whether the batch ioctl can be layed out separately on the
operations, then it can be clearly documented on the sequence of handling
each op:

  struct kvm_userspace_memory_region_batch {
         struct kvm_userspace_memory_region deletes[];
         struct kvm_userspace_memory_region moves[];
         struct kvm_userspace_memory_region creates[];
         struct kvm_userspace_memory_region flags_only[];
  };

So that the ordering can be very obvious.  But I didn't really think deeper
than that.

Side note: do we use MOVE at all in QEMU?

> 
> Bonus question: with this atomic operation, do we really need the
> invalid memslot logic for MOVE/DELETE?

I think so.  Not an expert on that, but iiuc that's to make sure we'll zap
all shadow paging that maps to the slots being deleted/moved.

Paolo can always help to keep me honest above.

One thing I forgot to ask: iirc we used to have a workaround to kick all
vcpus out, update memory slots, then continue all vcpus.  Would that work
for us too for the problem you're working on?

Thanks,

-- 
Peter Xu


