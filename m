Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B134B3175
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 00:43:41 +0100 (CET)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIfZk-0008HB-8m
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 18:43:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nIfWT-0006GX-FU
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 18:40:17 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:51918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nIfWQ-0003S6-Mk
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 18:40:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B1E761B65;
 Fri, 11 Feb 2022 23:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B73C340E9;
 Fri, 11 Feb 2022 23:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644622811;
 bh=qjDhoyLBnjObhE+qaWk23jxLof4n/h4IluDmsF4S+Zc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HxHkOQCy8wBjoXjL70TshCgTZJSE9ew2DxDnJ18jj/4/DZV2JSnnbrH8FYWN5XOpz
 7Ti0r5fW2KunCYfy9nEiI8B7VECUh3JugBLGRtdOucxqELydi8URSwwK5ypcHOgllo
 JURaNYZHo4Vvle1HwR+VFcqPtgpSAnhTW53ToVTE6/tophEv+r9/HuKCXdTKs+SzCs
 XXl3/zxMMecQoDvxqQcHzdXmfIB4/8dL1CNJeB9yr2QyMFVgooY3uJs2SsYqA9Nr/i
 6cmkPGk37vDLzgx5UttouMfTOmgXCX6jZbciQMJBcUR5bRSeqHpTIXNgrJGAVebGls
 Ml6ubZ55tvGsw==
Message-ID: <314affa4-fbcb-2cb9-deb7-f61a2ac99260@kernel.org>
Date: Fri, 11 Feb 2022 15:40:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 04/12] mm/shmem: Support memfile_notifier
Content-Language: en-US
To: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-5-chao.p.peng@linux.intel.com>
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <20220118132121.31388-5-chao.p.peng@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=luto@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, david@redhat.com,
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

On 1/18/22 05:21, Chao Peng wrote:
> It maintains a memfile_notifier list in shmem_inode_info structure and
> implements memfile_pfn_ops callbacks defined by memfile_notifier. It
> then exposes them to memfile_notifier via
> shmem_get_memfile_notifier_info.
> 
> We use SGP_NOALLOC in shmem_get_lock_pfn since the pages should be
> allocated by userspace for private memory. If there is no pages
> allocated at the offset then error should be returned so KVM knows that
> the memory is not private memory.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>

>   static int memfile_get_notifier_info(struct inode *inode,
>   				     struct memfile_notifier_list **list,
>   				     struct memfile_pfn_ops **ops)
>   {
> -	return -EOPNOTSUPP;
> +	int ret = -EOPNOTSUPP;
> +#ifdef CONFIG_SHMEM
> +	ret = shmem_get_memfile_notifier_info(inode, list, ops);
> +#endif
> +	return ret;
>   }

> +int shmem_get_memfile_notifier_info(struct inode *inode,
> +				    struct memfile_notifier_list **list,
> +				    struct memfile_pfn_ops **ops)
> +{
> +	struct shmem_inode_info *info;
> +
> +	if (!shmem_mapping(inode->i_mapping))
> +		return -EINVAL;
> +
> +	info = SHMEM_I(inode);
> +	*list = &info->memfile_notifiers;
> +	if (ops)
> +		*ops = &shmem_pfn_ops;
> +
> +	return 0;

I can't wrap my head around exactly who is supposed to call these 
functions and when, but there appears to be a missing check that the 
inode is actually a shmem inode.

What is this code trying to do?  It's very abstract.

