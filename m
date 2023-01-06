Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8DF65FE39
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 10:45:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDjH9-0004JV-Av; Fri, 06 Jan 2023 04:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pDjH6-0004Iw-11
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 04:44:32 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pDjH3-0008KX-Pq
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 04:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672998269; x=1704534269;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=fhXY6C/6U5im9JnhiBqmPE5GvqslI6HKlZc88plC8HU=;
 b=AIFfegQD89JW6SuNoA4Atgm6tlxmC+QBk3+Y1IkZpGpr+fH7/9Y52Htu
 owosCzkHPBZI+s/btBHWrIoyIyojaviOxDaNLkUtE3dF2CGzB+lKyu+98
 TfLIsuG3XmXbTEvNewcXZcdDQWmyHPzymdKvFYyfBcqy6UNB+XWbtMExD
 UNjxMyegCLv1+OUtjrzQe2rtSqxwHmM/w/L8CPprlhJS9OsSTd6bx4NYh
 WbyG8t4InTxJ88A6hzD6ANIliHfc8J/ygpnlVVet0TWpLlAmDDBizTFur
 PwHE7Funt4ho/t5Lg5Jx+4KHZscD9uM8Ix4olr6q5O02xpy3FzeItwhfi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="320148928"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="320148928"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2023 01:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="901237278"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; d="scan'208";a="901237278"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jan 2023 01:44:12 -0800
Date: Fri, 6 Jan 2023 17:40:00 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 3/9] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20230106094000.GA2297836@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-4-chao.p.peng@linux.intel.com>
 <Y7azFdnnGAdGPqmv@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7azFdnnGAdGPqmv@kernel.org>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Jan 05, 2023 at 11:23:01AM +0000, Jarkko Sakkinen wrote:
> On Fri, Dec 02, 2022 at 02:13:41PM +0800, Chao Peng wrote:
> > In memory encryption usage, guest memory may be encrypted with special
> > key and can be accessed only by the guest itself. We call such memory
> > private memory. It's valueless and sometimes can cause problem to allow
> > userspace to access guest private memory. This new KVM memslot extension
> > allows guest private memory being provided through a restrictedmem
> > backed file descriptor(fd) and userspace is restricted to access the
> > bookmarked memory in the fd.
> > 
> > This new extension, indicated by the new flag KVM_MEM_PRIVATE, adds two
> > additional KVM memslot fields restricted_fd/restricted_offset to allow
> > userspace to instruct KVM to provide guest memory through restricted_fd.
> > 'guest_phys_addr' is mapped at the restricted_offset of restricted_fd
> > and the size is 'memory_size'.
> > 
> > The extended memslot can still have the userspace_addr(hva). When use, a
> > single memslot can maintain both private memory through restricted_fd
> > and shared memory through userspace_addr. Whether the private or shared
> > part is visible to guest is maintained by other KVM code.
> > 
> > A restrictedmem_notifier field is also added to the memslot structure to
> > allow the restricted_fd's backing store to notify KVM the memory change,
> > KVM then can invalidate its page table entries or handle memory errors.
> > 
> > Together with the change, a new config HAVE_KVM_RESTRICTED_MEM is added
> > and right now it is selected on X86_64 only.
> > 
> > To make future maintenance easy, internally use a binary compatible
> > alias struct kvm_user_mem_region to handle both the normal and the
> > '_ext' variants.
> 
> Feels bit hacky IMHO, and more like a completely new feature than
> an extension.
> 
> Why not just add a new ioctl? The commit message does not address
> the most essential design here.

Yes, people can always choose to add a new ioctl for this kind of change
and the balance point here is we want to also avoid 'too many ioctls' if
the functionalities are similar.  The '_ext' variant reuses all the
existing fields in the 'normal' variant and most importantly KVM
internally can reuse most of the code. I certainly can add some words in
the commit message to explain this design choice.

Thanks,
Chao
> 
> BR, Jarkko

