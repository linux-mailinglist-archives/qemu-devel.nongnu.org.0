Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499959C280
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:21:13 +0200 (CEST)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9Em-0004FL-3O
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oQ95D-0001DQ-EK
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oQ95A-00045F-Sc
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661181075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X2uShgSizptZrajnSXWdWy/DzzK5uu1vpmTZwlLsqw8=;
 b=MVh09GYE3ky6ApuxnR17u4Mlad9MC6+qj/ZFD6N0q2B8rEAYEWdD9sXBiB1sQBLc4d23q0
 Ph5YFUu4czIVg5FqV0FXddwxlGKwUOyEiAOfs0/3ROfNoU1RH+sUiRG1eiUmBwMvIXjV/Z
 oQPeUzLdE8LPyAqNpWvAdQGUKk1MtIw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-1_8jjNWhMCu_cl7MWW094g-1; Mon, 22 Aug 2022 10:11:00 -0400
X-MC-Unique: 1_8jjNWhMCu_cl7MWW094g-1
Received: by mail-qk1-f199.google.com with SMTP id
 v13-20020a05620a0f0d00b006b5f0ec742eso9701622qkl.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 07:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=X2uShgSizptZrajnSXWdWy/DzzK5uu1vpmTZwlLsqw8=;
 b=xYqd/DgPo8+urWS7jiYUaUSV3BUzzUXL/TxVjYKCFeaqUfkPBu2bKDsHeSLR1LPCvW
 HIJ7o8ELoIotp87sJz5j9gekZ1XOIMKa/5m6RmZi9t6bSlwp2Wz6KxZH1ouy/hkXEYAo
 ecT9GhIGtPebn9/wDKtvsAZuuRsQ0pJ7tFQXO4Svl5t54etrDkCrXebr6S34QEYlNe6n
 G2v8nqNjfV0I8Zpmm7nlbZIsCtA4KmvY1fbjPbgV2FIGQYqatWiXtSuLeLs0x9LDBTh+
 l0J/M8IDv7eYddkczetm26/E1kcw6zBqVSSxyby4hUcEHv+/toeH4rV2CpM/9b511Yoj
 jaLg==
X-Gm-Message-State: ACgBeo3uMQZy+FDeC60lZmpL0mdxfVx7rzS7LncoeeIw03ftWWtoEnsH
 rzBg2niSHZu18QE8MEKj5SZ4ywjNUvmkYcHSMxipER6lQBw/fxnnkp3eFUuQvnsmxeFb8u3pGB2
 bo9NssLKdzn9vFZo=
X-Received: by 2002:a05:620a:bc3:b0:6a7:9e01:95ac with SMTP id
 s3-20020a05620a0bc300b006a79e0195acmr12771038qki.91.1661177459521; 
 Mon, 22 Aug 2022 07:10:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Q81+6KZjfmeiklX8+2y5Q7aXdyjYPcNKEVMQ/86HJlDYbRQBSpa49qa01I9iy9t47K7UYiw==
X-Received: by 2002:a05:620a:bc3:b0:6a7:9e01:95ac with SMTP id
 s3-20020a05620a0bc300b006a79e0195acmr12770993qki.91.1661177458994; 
 Mon, 22 Aug 2022 07:10:58 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05620a248700b006bb0f9b89cfsm11573580qkn.87.2022.08.22.07.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:10:58 -0700 (PDT)
Date: Mon, 22 Aug 2022 10:10:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay
 kvm_vm_ioctl to the commit phase
Message-ID: <YwOOcC72KKABKgU+@xz-m1.local>
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com>
 <Yv6baJoNikyuZ38R@xz-m1.local>
 <CAJ6HWG6maoPjbP8T5qo=iXCbNeHu4dq3wHLKtRLahYKuJmMY-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG6maoPjbP8T5qo=iXCbNeHu4dq3wHLKtRLahYKuJmMY-g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Aug 18, 2022 at 09:55:20PM -0300, Leonardo Bras Soares Passos wrote:
> On Thu, Aug 18, 2022 at 5:05 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Tue, Aug 16, 2022 at 06:12:50AM -0400, Emanuele Giuseppe Esposito wrote:
> > > +static void kvm_memory_region_node_add(KVMMemoryListener *kml,
> > > +                                       struct kvm_userspace_memory_region *mem)
> > > +{
> > > +    MemoryRegionNode *node;
> > > +
> > > +    node = g_malloc(sizeof(MemoryRegionNode));
> > > +    *node = (MemoryRegionNode) {
> > > +        .mem = mem,
> > > +    };
> >
> > Nit: direct assignment of struct looks okay, but maybe pointer assignment
> > is clearer (with g_malloc0?  Or iirc we're suggested to always use g_new0):
> >
> >   node = g_new0(MemoryRegionNode, 1);
> >   node->mem = mem;
> >
> > [...]
> >
> > > +/* for KVM_SET_USER_MEMORY_REGION_LIST */
> > > +struct kvm_userspace_memory_region_list {
> > > +     __u32 nent;
> > > +     __u32 flags;
> > > +     struct kvm_userspace_memory_region entries[0];
> > > +};
> > > +
> > >  /*
> > >   * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
> > >   * other bits are reserved for kvm internal use which are defined in
> > > @@ -1426,6 +1433,8 @@ struct kvm_vfio_spapr_tce {
> > >                                       struct kvm_userspace_memory_region)
> > >  #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
> > >  #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
> > > +#define KVM_SET_USER_MEMORY_REGION_LIST _IOW(KVMIO, 0x49, \
> > > +                                     struct kvm_userspace_memory_region_list)
> >
> > I think this is probably good enough, but just to provide the other small
> > (but may not be important) piece of puzzle here.  I wanted to think through
> > to understand better but I never did..
> >
> > For a quick look, please read the comment in kvm_set_phys_mem().
> >
> >                 /*
> >                  * NOTE: We should be aware of the fact that here we're only
> >                  * doing a best effort to sync dirty bits.  No matter whether
> >                  * we're using dirty log or dirty ring, we ignored two facts:
> >                  *
> >                  * (1) dirty bits can reside in hardware buffers (PML)
> >                  *
> >                  * (2) after we collected dirty bits here, pages can be dirtied
> >                  * again before we do the final KVM_SET_USER_MEMORY_REGION to
> >                  * remove the slot.
> >                  *
> >                  * Not easy.  Let's cross the fingers until it's fixed.
> >                  */
> >
> > One example is if we have 16G mem, we enable dirty tracking and we punch a
> > hole of 1G at offset 1G, it'll change from this:
> >
> >                      (a)
> >   |----------------- 16G -------------------|
> >
> > To this:
> >
> >      (b)    (c)              (d)
> >   |--1G--|XXXXXX|------------14G------------|
> >
> > Here (c) will be a 1G hole.
> >
> > With current code, the hole punching will del region (a) and add back
> > region (b) and (d).  After the new _LIST ioctl it'll be atomic and nicer.
> >
> > Here the question is if we're with dirty tracking it means for each region
> > we have a dirty bitmap.  Currently we do the best effort of doing below
> > sequence:
> >
> >   (1) fetching dirty bmap of (a)
> >   (2) delete region (a)
> >   (3) add region (b) (d)
> >
> > Here (a)'s dirty bmap is mostly kept as best effort, but still we'll lose
> > dirty pages written between step (1) and (2) (and actually if the write
> > comes within (2) and (3) I think it'll crash qemu, and iiuc that's what
> > we're going to fix..).
> >
> > So ideally the atomic op can be:
> >
> >   "atomically fetch dirty bmap for removed regions, remove regions, and add
> >    new regions"
> >
> > Rather than only:
> >
> >   "atomically remove regions, and add new regions"
> >
> > as what the new _LIST ioctl do.
> >
> > But... maybe that's not a real problem, at least I didn't know any report
> > showing issue with current code yet caused by losing of dirty bits during
> > step (1) and (2).  Neither do I know how to trigger an issue with it.
> >
> > I'm just trying to still provide this information so that you should be
> > aware of this problem too, at the meantime when proposing the new ioctl
> > change for qemu we should also keep in mind that we won't easily lose the
> > dirty bmap of (a) here, which I think this patch does the right thing.
> >
> 
> Thanks for bringing these details Peter!
> 
> What do you think of adding?
> (4) Copy the corresponding part of (a)'s dirty bitmap to (b) and (d)'s
> dirty bitmaps.

Sounds good to me, but may not cover dirty ring?  Maybe we could move on
with the simple but clean scheme first and think about a comprehensive
option only if very necessary.  The worst case is we need one more kvm cap
but we should still have enough.

Thanks,

-- 
Peter Xu


