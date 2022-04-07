Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9534F849E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 18:10:59 +0200 (CEST)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncUij-0008Ke-N0
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 12:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ncUdo-000676-Vy
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 12:05:50 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ncUdn-0002Am-7A
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 12:05:48 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so9270330pjn.3
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oJxIZVkcUncMUZQfQzkdJ+zb+DZalywUloW4568yYn0=;
 b=kfqHsKdfw89Dwd7QGak9HdKv00acSQig8ZHOqKWrcgwuHdvnnaELMDCR55SPQFtBnS
 TCxq7MWV9AQn4Hy0EhgxCx0TPpiUCpQgwy7H23Vwal4SDaAw8HvwrqITWyGFNK4sQzhH
 JFlGRWNfuLUz6qBVdSmZZ4kfxxkJBk87qruGPkjprjbLBVVAK37/Q8fsRcuV33Xw/HVj
 B8h8cqJw82ZLbYL11sh4DuKcy3QGnH0AAQvp3PE979fT3HkEwRHAW82vgfR+KkL2QJN5
 KSj7BU6Ix6FVP1cRvsNGtSRLODq/C8E5+MMo0e8vGjCEj/PqSsvyu1EMlSFPMgRzy1o2
 ak7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oJxIZVkcUncMUZQfQzkdJ+zb+DZalywUloW4568yYn0=;
 b=qyfukq/67YlW9gWURqboWMfFsxu8NVjnRgjgEW1SuT/gYDhwOYaE9s2DcF8xBpwKIA
 7AYLoX/QBdChuYrQeZdMhHDxKTvkG+dWbIqbYeshlEW0XbAVDczmV78Q4q28nrZ9xG+s
 p2FOeesU+3ZlrjGCQGY2dr3/ORBbrN/YoPdWkZ8TYS6XWpPvEzVvm7PhV1Y9WMx4P3Bw
 wSK+e5hZoGP4mkym+NrACJddE4cY5lZ5UMXzZP9fC6OpETA+DKGY7P3Z52CiEL2C8hvn
 LfWi3O7WtNhZoULLpB7ZIt0lnxpG3h5FJSPE01TKIPsqW6cbwRDC/u0TuBvdbLevc8KN
 TdtQ==
X-Gm-Message-State: AOAM533IsQK82aOTV+wNWB/vaxEfUgh5IPUn9SmsOQF5GMC7mmqwmFGI
 4yhZKK38G+NQcWpZc85j456DXw==
X-Google-Smtp-Source: ABdhPJxwrn5jcOCrefa44ifJu+1yvC1mRdMBBIerz3MlZcxhkTZR+e25OlxT/CA5AXmZeG4/pzPIww==
X-Received: by 2002:a17:90b:4a84:b0:1cb:29bd:db3e with SMTP id
 lp4-20020a17090b4a8400b001cb29bddb3emr1947695pjb.112.1649347540416; 
 Thu, 07 Apr 2022 09:05:40 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 q17-20020aa79831000000b0050566040330sm3561920pfl.126.2022.04.07.09.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 09:05:39 -0700 (PDT)
Date: Thu, 7 Apr 2022 16:05:36 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
Message-ID: <Yk8L0CwKpTrv3Rg3@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-5-chao.p.peng@linux.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Thu, Mar 10, 2022, Chao Peng wrote:
> Since page migration / swapping is not supported yet, MFD_INACCESSIBLE
> memory behave like longterm pinned pages and thus should be accounted to
> mm->pinned_vm and be restricted by RLIMIT_MEMLOCK.
> 
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  mm/shmem.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 7b43e274c9a2..ae46fb96494b 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -915,14 +915,17 @@ static void notify_fallocate(struct inode *inode, pgoff_t start, pgoff_t end)
>  static void notify_invalidate_page(struct inode *inode, struct folio *folio,
>  				   pgoff_t start, pgoff_t end)
>  {
> -#ifdef CONFIG_MEMFILE_NOTIFIER
>  	struct shmem_inode_info *info = SHMEM_I(inode);
>  
> +#ifdef CONFIG_MEMFILE_NOTIFIER
>  	start = max(start, folio->index);
>  	end = min(end, folio->index + folio_nr_pages(folio));
>  
>  	memfile_notifier_invalidate(&info->memfile_notifiers, start, end);
>  #endif
> +
> +	if (info->xflags & SHM_F_INACCESSIBLE)
> +		atomic64_sub(end - start, &current->mm->pinned_vm);

As Vishal's to-be-posted selftest discovered, this is broken as current->mm may
be NULL.  Or it may be a completely different mm, e.g. AFAICT there's nothing that
prevents a different process from punching hole in the shmem backing.

I don't see a sane way of tracking this in the backing store unless the inode is
associated with a single mm when it's created, and that opens up a giant can of
worms, e.g. what happens with the accounting if the creating process goes away?

I think the correct approach is to not do the locking automatically for SHM_F_INACCESSIBLE,
and instead require userspace to do shmctl(.., SHM_LOCK, ...) if userspace knows the
consumers don't support migrate/swap.  That'd require wrapping migrate_page() and then
wiring up notifier hooks for migrate/swap, but IMO that's a good thing to get sorted
out sooner than later.  KVM isn't planning on support migrate/swap for TDX or SNP,
but supporting at least migrate for a software-only implementation a la pKVM should
be relatively straightforward.  On the notifiee side, KVM can terminate the VM if it
gets an unexpected migrate/swap, e.g. so that TDX/SEV VMs don't die later with
exceptions and/or data corruption (pre-SNP SEV guests) in the guest.

Hmm, shmem_writepage() already handles SHM_F_INACCESSIBLE by rejecting the swap, so
maybe it's just the page migration path that needs to be updated?

