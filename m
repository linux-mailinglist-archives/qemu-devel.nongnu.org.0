Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CC74ABE90
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 13:27:00 +0100 (CET)
Received: from localhost ([::1]:56306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH36g-00007c-Hu
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 07:26:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vbabka@suse.cz>) id 1nH34a-000728-Ss
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:24:48 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:56404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vbabka@suse.cz>) id 1nH34Y-0001wD-KE
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 07:24:48 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B67F1F390;
 Mon,  7 Feb 2022 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644236683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ua1slhO3tu08xV7nWywNOiJcEeO08Yt5cZK027Ezf3k=;
 b=nqOMyxSjLMJbw6hGT7aanNF6FeXa6FgYOuO77ErGEuJACVK/WzQrAuxx4D21488QVNhJuX
 M+sLFDEPq88gwTDe26b9nVE+8dD+rccnKtBCMorKDcqUMR/hUGcHCEQDFi9AQT2nbVRY6T
 L9BFC+P98Kw1UD74kp27KbhpGlpRgMg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644236683;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ua1slhO3tu08xV7nWywNOiJcEeO08Yt5cZK027Ezf3k=;
 b=Ig+IalBCscALNaeSnDxlQzpZStR+QTv+QgbHxgBVrWcg56NLco/bfe/fTeu43aME0FqSGV
 EH9EbjksryG48uCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 239E113BBC;
 Mon,  7 Feb 2022 12:24:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K8/ABosPAWKEfgAAMHmgww
 (envelope-from <vbabka@suse.cz>); Mon, 07 Feb 2022 12:24:43 +0000
Message-ID: <64407833-1387-0c46-c569-8b6a3db8e88c@suse.cz>
Date: Mon, 7 Feb 2022 13:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-2-chao.p.peng@linux.intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v4 01/12] mm/shmem: Introduce F_SEAL_INACCESSIBLE
In-Reply-To: <20220118132121.31388-2-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=vbabka@suse.cz;
 helo=smtp-out2.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/18/22 14:21, Chao Peng wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Introduce a new seal F_SEAL_INACCESSIBLE indicating the content of
> the file is inaccessible from userspace through ordinary MMU access
> (e.g., read/write/mmap). However, the file content can be accessed
> via a different mechanism (e.g. KVM MMU) indirectly.
> 
> It provides semantics required for KVM guest private memory support
> that a file descriptor with this seal set is going to be used as the
> source of guest memory in confidential computing environments such
> as Intel TDX/AMD SEV but may not be accessible from host userspace.
> 
> At this time only shmem implements this seal.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  include/uapi/linux/fcntl.h |  1 +
>  mm/shmem.c                 | 40 ++++++++++++++++++++++++++++++++++++--
>  2 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> index 2f86b2ad6d7e..09ef34754dfa 100644
> --- a/include/uapi/linux/fcntl.h
> +++ b/include/uapi/linux/fcntl.h
> @@ -43,6 +43,7 @@
>  #define F_SEAL_GROW	0x0004	/* prevent file from growing */
>  #define F_SEAL_WRITE	0x0008	/* prevent writes */
>  #define F_SEAL_FUTURE_WRITE	0x0010  /* prevent future writes while mapped */
> +#define F_SEAL_INACCESSIBLE	0x0020  /* prevent ordinary MMU access (e.g. read/write/mmap) to file content */
>  /* (1U << 31) is reserved for signed error codes */
>  
>  /*
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 18f93c2d68f1..72185630e7c4 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -1098,6 +1098,13 @@ static int shmem_setattr(struct user_namespace *mnt_userns,
>  		    (newsize > oldsize && (info->seals & F_SEAL_GROW)))
>  			return -EPERM;
>  
> +		if (info->seals & F_SEAL_INACCESSIBLE) {
> +			if(i_size_read(inode))

Is this needed? The rest of the function seems to trust oldsize obtained by
plain reading inode->i_size well enough, so why be suddenly paranoid here?

> +				return -EPERM;
> +			if (newsize & ~PAGE_MASK)
> +				return -EINVAL;
> +		}
> +
>  		if (newsize != oldsize) {
>  			error = shmem_reacct_size(SHMEM_I(inode)->flags,
>  					oldsize, newsize);
> @@ -1364,6 +1371,8 @@ static int shmem_writepage(struct page *page, struct writeback_control *wbc)
>  		goto redirty;
>  	if (!total_swap_pages)
>  		goto redirty;
> +	if (info->seals & F_SEAL_INACCESSIBLE)
> +		goto redirty;
>  
>  	/*
>  	 * Our capabilities prevent regular writeback or sync from ever calling
> @@ -2262,6 +2271,9 @@ static int shmem_mmap(struct file *file, struct vm_area_struct *vma)
>  	if (ret)
>  		return ret;
>  
> +	if (info->seals & F_SEAL_INACCESSIBLE)
> +		return -EPERM;
> +
>  	/* arm64 - allow memory tagging on RAM-based files */
>  	vma->vm_flags |= VM_MTE_ALLOWED;
>  
> @@ -2459,12 +2471,15 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
>  	pgoff_t index = pos >> PAGE_SHIFT;
>  
>  	/* i_rwsem is held by caller */
> -	if (unlikely(info->seals & (F_SEAL_GROW |
> -				   F_SEAL_WRITE | F_SEAL_FUTURE_WRITE))) {
> +	if (unlikely(info->seals & (F_SEAL_GROW | F_SEAL_WRITE |
> +				    F_SEAL_FUTURE_WRITE |
> +				    F_SEAL_INACCESSIBLE))) {
>  		if (info->seals & (F_SEAL_WRITE | F_SEAL_FUTURE_WRITE))
>  			return -EPERM;
>  		if ((info->seals & F_SEAL_GROW) && pos + len > inode->i_size)
>  			return -EPERM;
> +		if (info->seals & F_SEAL_INACCESSIBLE)
> +			return -EPERM;
>  	}
>  
>  	return shmem_getpage(inode, index, pagep, SGP_WRITE);
> @@ -2538,6 +2553,21 @@ static ssize_t shmem_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		end_index = i_size >> PAGE_SHIFT;
>  		if (index > end_index)
>  			break;
> +
> +		/*
> +		 * inode_lock protects setting up seals as well as write to
> +		 * i_size. Setting F_SEAL_INACCESSIBLE only allowed with
> +		 * i_size == 0.
> +		 *
> +		 * Check F_SEAL_INACCESSIBLE after i_size. It effectively
> +		 * serialize read vs. setting F_SEAL_INACCESSIBLE without
> +		 * taking inode_lock in read path.
> +		 */
> +		if (SHMEM_I(inode)->seals & F_SEAL_INACCESSIBLE) {
> +			error = -EPERM;
> +			break;
> +		}
> +
>  		if (index == end_index) {
>  			nr = i_size & ~PAGE_MASK;
>  			if (nr <= offset)
> @@ -2663,6 +2693,12 @@ static long shmem_fallocate(struct file *file, int mode, loff_t offset,
>  			goto out;
>  		}
>  
> +		if ((info->seals & F_SEAL_INACCESSIBLE) &&
> +		    (offset & ~PAGE_MASK || len & ~PAGE_MASK)) {

Could we use PAGE_ALIGNED()?

> +			error = -EINVAL;
> +			goto out;
> +		}
> +
>  		shmem_falloc.waitq = &shmem_falloc_waitq;
>  		shmem_falloc.start = (u64)unmap_start >> PAGE_SHIFT;
>  		shmem_falloc.next = (unmap_end + 1) >> PAGE_SHIFT;


