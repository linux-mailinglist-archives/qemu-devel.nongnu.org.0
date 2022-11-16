Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF2362B296
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 06:07:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovAbl-0006Vi-6a; Wed, 16 Nov 2022 00:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ovAbh-0006VL-TD
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 00:05:05 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ovAbe-0002RV-5y
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 00:05:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668575102; x=1700111102;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=foUP09rbOFmy8/q+NFuW/TBTGS2xITtwfC1ci5ozoPE=;
 b=HkfM+lh87Pdv9IqYREjjiPlQZkgx+RwkfOy9WQeyRCebmAgVL5UBjtoS
 LgArpTdyOMX5dCoe2UeKfqS8JP+skCuoU6AMxT/Py4PBKZdXvAbkTHDn0
 cwqjCxrSXqMKIXz5LkjZrA1KRMAqff2U+N3puBaUl/lSdAImwxYqjIgNJ
 nQI8ZQkCIUbH749OF1QA2tcWbsX/xz4uQ8AuFh+jsN0w0SPd7O8R4R0Vf
 vhNUnXuRmfhKv8HHVCxY+Bk8JHFqR+OkJKyzyD23bEr0BeMF6OMccEg/+
 M++ECX2U/mWJhH1tcUDysU9Ru98ZU1aB7MW2ogj4MonxVQgNrjEmd8UXa Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="313601780"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="313601780"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2022 21:04:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="708008436"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="708008436"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2022 21:04:47 -0800
Date: Wed, 16 Nov 2022 13:00:22 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>
Subject: Re: [PATCH v9 0/8] KVM: mm: fd-based approach for supporting KVM
Message-ID: <20221116050022.GC364614@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <87k03xbvkt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k03xbvkt.fsf@linaro.org>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 14, 2022 at 11:43:37AM +0000, Alex Bennée wrote:
> 
> Chao Peng <chao.p.peng@linux.intel.com> writes:
> 
> <snip>
> > Introduction
> > ============
> > KVM userspace being able to crash the host is horrible. Under current
> > KVM architecture, all guest memory is inherently accessible from KVM
> > userspace and is exposed to the mentioned crash issue. The goal of this
> > series is to provide a solution to align mm and KVM, on a userspace
> > inaccessible approach of exposing guest memory. 
> >
> > Normally, KVM populates secondary page table (e.g. EPT) by using a host
> > virtual address (hva) from core mm page table (e.g. x86 userspace page
> > table). This requires guest memory being mmaped into KVM userspace, but
> > this is also the source where the mentioned crash issue can happen. In
> > theory, apart from those 'shared' memory for device emulation etc, guest
> > memory doesn't have to be mmaped into KVM userspace.
> >
> > This series introduces fd-based guest memory which will not be mmaped
> > into KVM userspace. KVM populates secondary page table by using a
> > fd/offset pair backed by a memory file system. The fd can be created
> > from a supported memory filesystem like tmpfs/hugetlbfs and KVM can
> > directly interact with them with newly introduced in-kernel interface,
> > therefore remove the KVM userspace from the path of accessing/mmaping
> > the guest memory. 
> >
> > Kirill had a patch [2] to address the same issue in a different way. It
> > tracks guest encrypted memory at the 'struct page' level and relies on
> > HWPOISON to reject the userspace access. The patch has been discussed in
> > several online and offline threads and resulted in a design document [3]
> > which is also the original proposal for this series. Later this patch
> > series evolved as more comments received in community but the major
> > concepts in [3] still hold true so recommend reading.
> >
> > The patch series may also be useful for other usages, for example, pure
> > software approach may use it to harden itself against unintentional
> > access to guest memory. This series is designed with these usages in
> > mind but doesn't have code directly support them and extension might be
> > needed.
> 
> There are a couple of additional use cases where having a consistent
> memory interface with the kernel would be useful.

Thanks very much for the info. But I'm not so confident that the current
memfd_restricted() implementation can be useful for all these usages. 

> 
>   - Xen DomU guests providing other domains with VirtIO backends
> 
>   Xen by default doesn't give other domains special access to a domains
>   memory. The guest can grant access to regions of its memory to other
>   domains for this purpose. 

I'm trying to form my understanding on how this could work and what's
the benefit for a DomU guest to provide memory through memfd_restricted().
AFAICS, memfd_restricted() can help to hide the memory from DomU userspace,
but I assume VirtIO backends are still in DomU uerspace and need access
that memory, right?

> 
>   - pKVM on ARM
> 
>   Similar to Xen, pKVM moves the management of the page tables into the
>   hypervisor and again doesn't allow those domains to share memory by
>   default.

Right, we already had some discussions on this in the past versions.

> 
>   - VirtIO loopback
> 
>   This allows for VirtIO devices for the host kernel to be serviced by
>   backends running in userspace. Obviously the memory userspace is
>   allowed to access is strictly limited to the buffers and queues
>   because giving userspace unrestricted access to the host kernel would
>   have consequences.

Okay, but normal memfd_create() should work for it, right? And
memfd_restricted() instead may not work as it unmaps the memory from
userspace.

> 
> All of these VirtIO backends work with vhost-user which uses memfds to
> pass references to guest memory from the VMM to the backend
> implementation.

Sounds to me these are the places where normal memfd_create() can act on.
VirtIO backends work on the mmap-ed memory which currently is not the
case for memfd_restricted(). memfd_restricted() has different design
purpose that unmaps the memory from userspace and employs some kernel
callbacks so other kernel modules can make use of the memory with these
callbacks instead of userspace virtual address.

Chao
> 
> > mm change
> > =========
> > Introduces a new memfd_restricted system call which can create memory
> > file that is restricted from userspace access via normal MMU operations
> > like read(), write() or mmap() etc and the only way to use it is
> > passing it to a third kernel module like KVM and relying on it to
> > access the fd through the newly added restrictedmem kernel interface.
> > The restrictedmem interface bridges the memory file subsystems
> > (tmpfs/hugetlbfs etc) and their users (KVM in this case) and provides
> > bi-directional communication between them. 
> >
> >
> > KVM change
> > ==========
> > Extends the KVM memslot to provide guest private (encrypted) memory from
> > a fd. With this extension, a single memslot can maintain both private
> > memory through private fd (restricted_fd/restricted_offset) and shared
> > (unencrypted) memory through userspace mmaped host virtual address
> > (userspace_addr). For a particular guest page, the corresponding page in
> > KVM memslot can be only either private or shared and only one of the
> > shared/private parts of the memslot is visible to guest. For how this
> > new extension is used in QEMU, please refer to kvm_set_phys_mem() in
> > below TDX-enabled QEMU repo.
> >
> > Introduces new KVM_EXIT_MEMORY_FAULT exit to allow userspace to get the
> > chance on decision-making for shared <-> private memory conversion. The
> > exit can be an implicit conversion in KVM page fault handler or an
> > explicit conversion from guest OS.
> >
> > Extends existing SEV ioctls KVM_MEMORY_ENCRYPT_{UN,}REG_REGION to
> > convert a guest page between private <-> shared. The data maintained in
> > these ioctls tells the truth whether a guest page is private or shared
> > and this information will be used in KVM page fault handler to decide
> > whether the private or the shared part of the memslot is visible to
> > guest.
> >
> <snip>
> 
> -- 
> Alex Bennée

