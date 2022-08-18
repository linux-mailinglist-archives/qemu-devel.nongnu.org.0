Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98966598D60
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 22:08:17 +0200 (CEST)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOloO-0005t7-9H
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 16:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oOllK-0003iP-1B
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 16:05:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oOllG-00067k-Ce
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 16:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660853100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qF9mwdX42Z4XttzFYrU1Z9fWJ/vdaMjVOtdzop5CgMc=;
 b=TLVxBQCbf/a4+DR+tGLiJ23Jr+H8gnTznmzvR3Cag6f+AQt/fI9LLo2RcQap+txzwVbPNV
 gbxvau799A1A6CThvv16FvculBsG4hs1ZuttNgEICKqBeydJtgA/AdCMgdZ3rvXcMjqrun
 aezEmj4fYp+mCZlHmAlGCMZQ6XpUmhQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-WLjSF-DoMMGLr4jDdOs6TQ-1; Thu, 18 Aug 2022 16:04:59 -0400
X-MC-Unique: WLjSF-DoMMGLr4jDdOs6TQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 dh19-20020ad458d3000000b00496bf7e4a72so938540qvb.0
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 13:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=qF9mwdX42Z4XttzFYrU1Z9fWJ/vdaMjVOtdzop5CgMc=;
 b=yLE/DNg4LaCEsnZ9zWV5/im8L0SuJUZisPT0HU8wEIjVJ4uTcQK2UoGmfKUEcex/Ly
 509BcncHKu5fZk8iQkjEljHgQhsfnuN0nSZJflUKpuDcIP3NHridk4xNZxTHVzQXI+r7
 yoRUNnSJUwNi0l7vW/GUfHIZyXuf3uqbEbgbQvuhgIsSG5nrQ4eYBpN2lK1w58dfAFSH
 6R3h8cHuPHYfq9FScf++wPx68EA83CgTW9QvaFIv+9OD/dwsMS1ee4yMRXCFRFggYltL
 HiNtUYW35sViFINWPVzX7g/HsFOp+qIK+zHKHKflOIIqApJriXcAsKoixcQQFy/c79il
 727A==
X-Gm-Message-State: ACgBeo0uxu8WK+tpYjuYu6nucNegulHs2NwujIvW/uTK/FOBwyVMPAdb
 ONThNkdP4DHwuYQxO1uH+q9V4872k8ozeuP6gQJZfIHNSwQYCIeFaVb/A/qcwGfT5C9qf12ZJN+
 latOg7pK9/624Vk0=
X-Received: by 2002:a05:6214:d6c:b0:476:94f5:aa7b with SMTP id
 12-20020a0562140d6c00b0047694f5aa7bmr3895812qvs.92.1660853098549; 
 Thu, 18 Aug 2022 13:04:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6O9zlcJ/KMtTjIyEYwAveSzfMEIkT91qHws4tgXti0bKMuujrPu5MosTDghM+a6G4Jrn/kBw==
X-Received: by 2002:a05:6214:d6c:b0:476:94f5:aa7b with SMTP id
 12-20020a0562140d6c00b0047694f5aa7bmr3895774qvs.92.1660853098131; 
 Thu, 18 Aug 2022 13:04:58 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 bm30-20020a05620a199e00b006bb11f9a859sm2185725qkb.122.2022.08.18.13.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 13:04:57 -0700 (PDT)
Date: Thu, 18 Aug 2022 16:04:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay
 kvm_vm_ioctl to the commit phase
Message-ID: <Yv6baJoNikyuZ38R@xz-m1.local>
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220816101250.1715523-3-eesposit@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, Aug 16, 2022 at 06:12:50AM -0400, Emanuele Giuseppe Esposito wrote:
> +static void kvm_memory_region_node_add(KVMMemoryListener *kml,
> +                                       struct kvm_userspace_memory_region *mem)
> +{
> +    MemoryRegionNode *node;
> +
> +    node = g_malloc(sizeof(MemoryRegionNode));
> +    *node = (MemoryRegionNode) {
> +        .mem = mem,
> +    };

Nit: direct assignment of struct looks okay, but maybe pointer assignment
is clearer (with g_malloc0?  Or iirc we're suggested to always use g_new0):

  node = g_new0(MemoryRegionNode, 1);
  node->mem = mem;

[...]

> +/* for KVM_SET_USER_MEMORY_REGION_LIST */
> +struct kvm_userspace_memory_region_list {
> +	__u32 nent;
> +	__u32 flags;
> +	struct kvm_userspace_memory_region entries[0];
> +};
> +
>  /*
>   * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
>   * other bits are reserved for kvm internal use which are defined in
> @@ -1426,6 +1433,8 @@ struct kvm_vfio_spapr_tce {
>  					struct kvm_userspace_memory_region)
>  #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
>  #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
> +#define KVM_SET_USER_MEMORY_REGION_LIST _IOW(KVMIO, 0x49, \
> +					struct kvm_userspace_memory_region_list)

I think this is probably good enough, but just to provide the other small
(but may not be important) piece of puzzle here.  I wanted to think through
to understand better but I never did..

For a quick look, please read the comment in kvm_set_phys_mem().

                /*
                 * NOTE: We should be aware of the fact that here we're only
                 * doing a best effort to sync dirty bits.  No matter whether
                 * we're using dirty log or dirty ring, we ignored two facts:
                 *
                 * (1) dirty bits can reside in hardware buffers (PML)
                 *
                 * (2) after we collected dirty bits here, pages can be dirtied
                 * again before we do the final KVM_SET_USER_MEMORY_REGION to
                 * remove the slot.
                 *
                 * Not easy.  Let's cross the fingers until it's fixed.
                 */

One example is if we have 16G mem, we enable dirty tracking and we punch a
hole of 1G at offset 1G, it'll change from this:

                     (a)
  |----------------- 16G -------------------|

To this:

     (b)    (c)              (d)
  |--1G--|XXXXXX|------------14G------------|

Here (c) will be a 1G hole.

With current code, the hole punching will del region (a) and add back
region (b) and (d).  After the new _LIST ioctl it'll be atomic and nicer.

Here the question is if we're with dirty tracking it means for each region
we have a dirty bitmap.  Currently we do the best effort of doing below
sequence:

  (1) fetching dirty bmap of (a)
  (2) delete region (a)
  (3) add region (b) (d)

Here (a)'s dirty bmap is mostly kept as best effort, but still we'll lose
dirty pages written between step (1) and (2) (and actually if the write
comes within (2) and (3) I think it'll crash qemu, and iiuc that's what
we're going to fix..).

So ideally the atomic op can be:

  "atomically fetch dirty bmap for removed regions, remove regions, and add
   new regions"

Rather than only:

  "atomically remove regions, and add new regions"

as what the new _LIST ioctl do.

But... maybe that's not a real problem, at least I didn't know any report
showing issue with current code yet caused by losing of dirty bits during
step (1) and (2).  Neither do I know how to trigger an issue with it.

I'm just trying to still provide this information so that you should be
aware of this problem too, at the meantime when proposing the new ioctl
change for qemu we should also keep in mind that we won't easily lose the
dirty bmap of (a) here, which I think this patch does the right thing.

Thanks!

--
Peter Xu


