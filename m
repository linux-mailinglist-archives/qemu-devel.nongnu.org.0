Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2806D5AACA6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 12:39:52 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU45W-0001a0-SK
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 06:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oU3yn-0004aZ-SH
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:32:53 -0400
Received: from mga06b.intel.com ([134.134.136.31]:17847 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oU3yl-0007Pb-QR
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 06:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662114771; x=1693650771;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Ws38xTyai1UArcptdFTCO63DRGm+K11UNHn/R44NQ2A=;
 b=N//FG4Jq8XKhPXGTuFRJcoI0phXjy/f2yKX9XD+889tXa/bRdqRRYG46
 WY3Dy9+TepGSZ/ExcojSCZLQUXxeHSVZ4FheGZZ9lO/0kPTCU0vRyEn/G
 UafMZwl8jzBVCqHF+zsOKqWt9GQPpXrxWKD4ekNgGwCH74TBhlB4j8TT5
 QPge1IQ87HdK760pdua/jI2VLmYf7G8lHRrUuJt2uz9bDm6VJE1JK3iZr
 j2E0KCv9oXORYR+YApazpygGAlazj7aieQlovFq/io6CddN8M8jiVLZa2
 tyvcGM6ePBICoazYDVh2JIJveFHvbMJOoBXCP7Lfzdjw/Y1wPEuuUHdng Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="357669304"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="357669304"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 03:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="608945519"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 02 Sep 2022 03:32:39 -0700
Date: Fri, 2 Sep 2022 18:27:57 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Hugh Dickins <hughd@google.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>,
 Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220902102757.GB1712673@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
 <c194262b-b634-4baf-abf0-dc727e8f1d7@google.com>
 <20220831142439.65q2gi4g2d2z4ofh@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831142439.65q2gi4g2d2z4ofh@box.shutemov.name>
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 31, 2022 at 05:24:39PM +0300, Kirill A . Shutemov wrote:
> On Sat, Aug 20, 2022 at 10:15:32PM -0700, Hugh Dickins wrote:
> > > I will try next week to rework it as shim to top of shmem. Does it work
> > > for you?
> > 
> > Yes, please do, thanks.  It's a compromise between us: the initial TDX
> > case has no justification to use shmem at all, but doing it that way
> > will help you with some of the infrastructure, and will probably be
> > easiest for KVM to extend to other more relaxed fd cases later.
> 
> Okay, below is my take on the shim approach.
> 
> I don't hate how it turned out. It is easier to understand without
> callback exchange thing.
> 
> The only caveat is I had to introduce external lock to protect against
> race between lookup and truncate. Otherwise, looks pretty reasonable to me.
> 
> I did very limited testing. And it lacks integration with KVM, but API
> changed not substantially, any it should be easy to adopt.

I have integrated this patch with other KVM patches and verified the
functionality works well in TDX environment with a minor fix below.

> 
> Any comments?
> 

...

> diff --git a/mm/memfd.c b/mm/memfd.c
> index 08f5f8304746..1853a90f49ff 100644
> --- a/mm/memfd.c
> +++ b/mm/memfd.c
> @@ -261,7 +261,8 @@ long memfd_fcntl(struct file *file, unsigned int cmd, unsigned long arg)
>  #define MFD_NAME_PREFIX_LEN (sizeof(MFD_NAME_PREFIX) - 1)
>  #define MFD_NAME_MAX_LEN (NAME_MAX - MFD_NAME_PREFIX_LEN)
>  
> -#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB)
> +#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB | \
> +		       MFD_INACCESSIBLE)
>  
>  SYSCALL_DEFINE2(memfd_create,
>  		const char __user *, uname,
> @@ -283,6 +284,14 @@ SYSCALL_DEFINE2(memfd_create,
>  			return -EINVAL;
>  	}
>  
> +	/* Disallow sealing when MFD_INACCESSIBLE is set. */
> +	if ((flags & MFD_INACCESSIBLE) && (flags & MFD_ALLOW_SEALING))
> +		return -EINVAL;
> +
> +	/* TODO: add hugetlb support */
> +	if ((flags & MFD_INACCESSIBLE) && (flags & MFD_HUGETLB))
> +		return -EINVAL;
> +
>  	/* length includes terminating zero */
>  	len = strnlen_user(uname, MFD_NAME_MAX_LEN + 1);
>  	if (len <= 0)
> @@ -331,10 +340,24 @@ SYSCALL_DEFINE2(memfd_create,
>  		*file_seals &= ~F_SEAL_SEAL;
>  	}
>  
> +	if (flags & MFD_INACCESSIBLE) {
> +		struct file *inaccessible_file;
> +
> +		inaccessible_file = memfd_mkinaccessible(file);
> +		if (IS_ERR(inaccessible_file)) {
> +			error = PTR_ERR(inaccessible_file);
> +			goto err_file;
> +		}

The new file should alse be marked as O_LARGEFILE otherwise setting the
initial size greater than 2^31 on the fd will be refused by ftruncate().

+               inaccessible_file->f_flags |= O_LARGEFILE;
+

> +
> +		file = inaccessible_file;
> +	}
> +
>  	fd_install(fd, file);
>  	kfree(name);
>  	return fd;
>  
> +err_file:
> +	fput(file);
>  err_fd:
>  	put_unused_fd(fd);
>  err_name:

