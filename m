Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D849626F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:56:30 +0100 (CET)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwH6-00082n-K7
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:56:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1nAwC0-0003OY-VI
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:51:12 -0500
Received: from foss.arm.com ([217.140.110.172]:48218)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1nAwBs-0003TK-WA
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:51:09 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC5BE101E;
 Fri, 21 Jan 2022 07:51:00 -0800 (PST)
Received: from [10.57.39.88] (unknown [10.57.39.88])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B59213F73D;
 Fri, 21 Jan 2022 07:50:56 -0800 (PST)
From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v4 02/12] mm/memfd: Introduce MFD_INACCESSIBLE flag
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-3-chao.p.peng@linux.intel.com>
Message-ID: <8f1eba03-e5e9-e9fc-084d-0ef683093d65@arm.com>
Date: Fri, 21 Jan 2022 15:50:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220118132121.31388-3-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, luto@kernel.org, david@redhat.com,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 jun.nakajima@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/2022 13:21, Chao Peng wrote:
> Introduce a new memfd_create() flag indicating the content of the
> created memfd is inaccessible from userspace. It does this by force
> setting F_SEAL_INACCESSIBLE seal when the file is created. It also set
> F_SEAL_SEAL to prevent future sealing, which means, it can not coexist
> with MFD_ALLOW_SEALING.
> 
> The pages backed by such memfd will be used as guest private memory in
> confidential computing environments such as Intel TDX/AMD SEV. Since
> page migration/swapping is not yet supported for such usages so these
> pages are currently marked as UNMOVABLE and UNEVICTABLE which makes
> them behave like long-term pinned pages.
> 
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  include/uapi/linux/memfd.h |  1 +
>  mm/memfd.c                 | 20 +++++++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/memfd.h b/include/uapi/linux/memfd.h
> index 7a8a26751c23..48750474b904 100644
> --- a/include/uapi/linux/memfd.h
> +++ b/include/uapi/linux/memfd.h
> @@ -8,6 +8,7 @@
>  #define MFD_CLOEXEC		0x0001U
>  #define MFD_ALLOW_SEALING	0x0002U
>  #define MFD_HUGETLB		0x0004U
> +#define MFD_INACCESSIBLE	0x0008U
>  
>  /*
>   * Huge page size encoding when MFD_HUGETLB is specified, and a huge page
> diff --git a/mm/memfd.c b/mm/memfd.c
> index 9f80f162791a..26998d96dc11 100644
> --- a/mm/memfd.c
> +++ b/mm/memfd.c
> @@ -245,16 +245,19 @@ long memfd_fcntl(struct file *file, unsigned int cmd, unsigned long arg)
>  #define MFD_NAME_PREFIX_LEN (sizeof(MFD_NAME_PREFIX) - 1)
>  #define MFD_NAME_MAX_LEN (NAME_MAX - MFD_NAME_PREFIX_LEN)
>  
> -#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB)
> +#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB | \
> +		       MFD_INACCESSIBLE)
>  
>  SYSCALL_DEFINE2(memfd_create,
>  		const char __user *, uname,
>  		unsigned int, flags)
>  {
> +	struct address_space *mapping;
>  	unsigned int *file_seals;
>  	struct file *file;
>  	int fd, error;
>  	char *name;
> +	gfp_t gfp;
>  	long len;
>  
>  	if (!(flags & MFD_HUGETLB)) {
> @@ -267,6 +270,10 @@ SYSCALL_DEFINE2(memfd_create,
>  			return -EINVAL;
>  	}
>  
> +	/* Disallow sealing when MFD_INACCESSIBLE is set. */
> +	if (flags & MFD_INACCESSIBLE && flags & MFD_ALLOW_SEALING)
> +		return -EINVAL;
> +
>  	/* length includes terminating zero */
>  	len = strnlen_user(uname, MFD_NAME_MAX_LEN + 1);
>  	if (len <= 0)
> @@ -315,6 +322,17 @@ SYSCALL_DEFINE2(memfd_create,
>  		*file_seals &= ~F_SEAL_SEAL;
>  	}
>  
> +	if (flags & MFD_INACCESSIBLE) {
> +		mapping = file_inode(file)->i_mapping;
> +		gfp = mapping_gfp_mask(mapping);
> +		gfp &= ~__GFP_MOVABLE;
> +		mapping_set_gfp_mask(mapping, gfp);
> +		mapping_set_unevictable(mapping);
> +
> +		file_seals = memfd_file_seals_ptr(file);
> +		*file_seals &= F_SEAL_SEAL | F_SEAL_INACCESSIBLE;

This looks backwards - the flags should be set on *file_seals, but here
you are unsetting all other flags.

Steve

> +	}
> +
>  	fd_install(fd, file);
>  	kfree(name);
>  	return fd;
> 


