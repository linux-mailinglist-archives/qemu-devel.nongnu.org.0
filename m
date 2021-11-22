Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B72458FE0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:02:20 +0100 (CET)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9ti-0008JH-NV
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:02:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1mp9r4-0006bL-66
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:59:34 -0500
Received: from [2a00:1450:4864:20::136] (port=43866
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1mp9r1-0005Wi-36
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:59:33 -0500
Received: by mail-lf1-x136.google.com with SMTP id b40so81322131lfv.10
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q7OhoPungBQlpmy/07g8Fe+342nGWhdV6y8JU2nGv18=;
 b=vT0USDJF2fCKLhM7AtmhHZ6TqmNhALxV9Bh1G9113KXxZPkG5aIQh+e3yJp+NMyEgB
 yyjush06rRDAKf6xyUA+EMVlTfQFUDAid0CUtMtmeUtHix0pvnF7sbVcje0OV7nvBw9a
 g/8GZ6NHc48vcDLcr1f3fW01yrRMGBsBbjITwRurbUP5g1aabFr4PnvcR9GVkDnhTJOZ
 I3gDHccbJ7qYXpaRZGgxrspIfnGqi2qJLDQzshng4iQv3se7ahPPk7IgwWM5bY1jozMl
 SfrrFIYhsGdWwbB4Wq4Hi54Cs40biyzXYNHrpN0Wwyms/lv0ik/a9vUpy/9oPybPTkwE
 XN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q7OhoPungBQlpmy/07g8Fe+342nGWhdV6y8JU2nGv18=;
 b=VhQyddHhaPFpzWSlVWpwAE8X00qmXBJeNjoYf8uy6aRX2xKYE/MOiWuaZO5oq4ZQBZ
 qeYNADLnL3+A1ChvNFoyrGs48Q1yeIY1taS1ToC5UO6TdakDNxoICfBWZeRv0/tpMh6B
 JN6sxBut1yb3wAIppxUmsH5p74fJ23KDTqkFATL8iP77OPMSESBKAIRKCY1XAuEddhfz
 ZmhTyZKTGk6GaqHDKJ/oyaE3ygqpfjzdPYlnYDnvlsKwGtsy+TzwTSsjZznEfPpM9wmU
 eXq0WiyDXJd48W4Wxbvjo8xa91qm5cf8BQIkIfHkOrcXw+BC4agNEiuYcZ4loIdOqkVl
 4fkg==
X-Gm-Message-State: AOAM533gph1QfPhq6KOSPKPpZWUfSgsKOG+zJ5gxjHDTawcYW3LERueW
 xk+0LcePdRj/feAVMoHbN10mWQ==
X-Google-Smtp-Source: ABdhPJwOSduIL/T2HcuHSSI/wDp1Ip4IJTwBbrmlaHHjfVN4PCNHDjahR2ZbiKbNVp+QmDNNUEuLww==
X-Received: by 2002:a2e:9545:: with SMTP id t5mr51763112ljh.225.1637589567919; 
 Mon, 22 Nov 2021 05:59:27 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id i17sm967582lfe.281.2021.11.22.05.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 05:59:27 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id AD905103610; Mon, 22 Nov 2021 16:59:33 +0300 (+03)
Date: Mon, 22 Nov 2021 16:59:33 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211122135933.arjxpl7wyskkwvwv@box.shutemov.name>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <942e0dd6-e426-06f6-7b6c-0e80d23c27e6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <942e0dd6-e426-06f6-7b6c-0e80d23c27e6@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::136;
 envelope-from=kirill@shutemov.name; helo=mail-lf1-x136.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, luto@kernel.org, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 dave.hansen@intel.com, "H . Peter Anvin" <hpa@zytor.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 jun.nakajima@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jim Mattson <jmattson@google.com>,
 linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 02:51:11PM +0100, David Hildenbrand wrote:
> On 19.11.21 14:47, Chao Peng wrote:
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > 
> > The new seal type provides semantics required for KVM guest private
> > memory support. A file descriptor with the seal set is going to be used
> > as source of guest memory in confidential computing environments such as
> > Intel TDX and AMD SEV.
> > 
> > F_SEAL_GUEST can only be set on empty memfd. After the seal is set
> > userspace cannot read, write or mmap the memfd.
> > 
> > Userspace is in charge of guest memory lifecycle: it can allocate the
> > memory with falloc or punch hole to free memory from the guest.
> > 
> > The file descriptor passed down to KVM as guest memory backend. KVM
> > register itself as the owner of the memfd via memfd_register_guest().
> > 
> > KVM provides callback that needed to be called on fallocate and punch
> > hole.
> > 
> > memfd_register_guest() returns callbacks that need be used for
> > requesting a new page from memfd.
> > 
> 
> Repeating the feedback I already shared in a private mail thread:
> 
> 
> As long as page migration / swapping is not supported, these pages
> behave like any longterm pinned pages (e.g., VFIO) or secretmem pages.
> 
> 1. These pages are not MOVABLE. They must not end up on ZONE_MOVABLE or
> MIGRATE_CMA.
> 
> That should be easy to handle, you have to adjust the gfp_mask to
> 	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
> just as mm/secretmem.c:secretmem_file_create() does.

Okay, fair enough. mapping_set_unevictable() also makes sesne.

> 2. These pages behave like mlocked pages and should be accounted as such.
> 
> This is probably where the accounting "fun" starts, but maybe it's
> easier than I think to handle.
> 
> See mm/secretmem.c:secretmem_mmap(), where we account the pages as
> VM_LOCKED and will consequently check per-process mlock limits. As we
> don't mmap(), the same approach cannot be reused.
> 
> See drivers/vfio/vfio_iommu_type1.c:vfio_pin_map_dma() and
> vfio_pin_pages_remote() on how to manually account via mm->locked_vm .
> 
> But it's a bit hairy because these pages are not actually mapped into
> the page tables of the MM, so it might need some thought. Similarly,
> these pages actually behave like "pinned" (as in mm->pinned_vm), but we
> just don't increase the refcount AFAIR. Again, accounting really is a
> bit hairy ...

Accounting is fun indeed. Non-mapped mlocked memory is going to be
confusing. Hm...

I will look closer.

-- 
 Kirill A. Shutemov

