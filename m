Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9EA4FC0DA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:33:47 +0200 (CEST)
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndw2z-0003KL-Q3
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1ndvex-0006rA-Ti
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:08:56 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:37887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kirill@shutemov.name>)
 id 1ndvew-0002WJ-3q
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:08:55 -0400
Received: by mail-lf1-x12b.google.com with SMTP id u19so7095008lff.4
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SZ3/Vx+1Q7uH45Ete1zY0f2BZJWVMOSE6BEs5zWCYbs=;
 b=7DIUdDw1bDVY/1pX9CrYKqoUnxn4Af2165TByD3u5HZ0iXmIdkyeDLerqJVS4ILYb2
 sr8EaHNWEoVQlow3SdmLYTkP5xN8dgvPftKQlE2GzWppJ9Nm1Jc8ZkbxJeZp/XQcv+bm
 CkITSbBdcYbYkEIbRjUo+wMmeMYCl/ckl8Eyh5jpmDByZr90ijXMmjL2GuwmjJqoSc6X
 41HpTTObRQn2DziTHtTZKAPeR3G4oO4JnMRiHaWm+nxgPN2SgqBjtuDslRAMsgbobCqJ
 zrEUAd863LfUu4IdojsoK+HRzJ1QfBeJabFS3cJ9rTqFAAPFDxSzIUbnYMV1zoLxx+KI
 BBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SZ3/Vx+1Q7uH45Ete1zY0f2BZJWVMOSE6BEs5zWCYbs=;
 b=IpnMizTAoh3eYg2T08rx1doa7kDzTwqnN0MF9FMPkshZcXEyOjtcLEt/2D6BuQk8M1
 16yNiTTjQ7ohIzEj+K8JWASOUc6oTQ4OVT0swLldbRiSOZI158Y+a/dNxO0YUmFdHWJV
 CN60e3a/2YF/l1zz+/lKK8edFv3xhwPbNkEW5JkgGmYyuh8sGsaCxfRwTzr24As77Jmi
 zt1htdpb7td3R8LTdeMS1Vu8DycjcfauYLZC5zavQkMEw9cQP33ldkn3tM+O8v0p5wAJ
 yViJLKMrUAPTp4WL5MRQniKMsIclu8gFkZbgrA1xUP5QvL2WaO9d4rkGTC5cYmZTASdv
 4H+Q==
X-Gm-Message-State: AOAM5317OeCZkTZtH2/jydHhsOnLhl1qZsXse9BTBZr4S7L86WcNY2P7
 PfcI8njfkvrAGFkLmWVnLsx2DQ==
X-Google-Smtp-Source: ABdhPJwVzRe0aqmUWVOSiTlNptfcMMnBCa3LaWdYU4CM/MHAyK3juuV+XEpH4cZF1tu2LetUDByrEw==
X-Received: by 2002:a05:6512:3f29:b0:450:ac79:77dd with SMTP id
 y41-20020a0565123f2900b00450ac7977ddmr21705662lfa.301.1649689731304; 
 Mon, 11 Apr 2022 08:08:51 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a05651c204200b0024b4bc5d324sm1197193ljo.79.2022.04.11.08.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:08:50 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 41CC4103CE0; Mon, 11 Apr 2022 18:10:23 +0300 (+03)
Date: Mon, 11 Apr 2022 18:10:23 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v5 01/13] mm/memfd: Introduce MFD_INACCESSIBLE flag
Message-ID: <20220411151023.4nx34pxyg5amj44m@box.shutemov.name>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-2-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-2-chao.p.peng@linux.intel.com>
Received-SPF: none client-ip=2a00:1450:4864:20::12b;
 envelope-from=kirill@shutemov.name; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, linux-api@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 10:08:59PM +0800, Chao Peng wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Introduce a new memfd_create() flag indicating the content of the
> created memfd is inaccessible from userspace through ordinary MMU
> access (e.g., read/write/mmap). However, the file content can be
> accessed via a different mechanism (e.g. KVM MMU) indirectly.
> 
> It provides semantics required for KVM guest private memory support
> that a file descriptor with this flag set is going to be used as the
> source of guest memory in confidential computing environments such
> as Intel TDX/AMD SEV but may not be accessible from host userspace.
> 
> Since page migration/swapping is not yet supported for such usages
> so these pages are currently marked as UNMOVABLE and UNEVICTABLE
> which makes them behave like long-term pinned pages.
> 
> The flag can not coexist with MFD_ALLOW_SEALING, future sealing is
> also impossible for a memfd created with this flag.
> 
> At this time only shmem implements this flag.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> ---
>  include/linux/shmem_fs.h   |  7 +++++
>  include/uapi/linux/memfd.h |  1 +
>  mm/memfd.c                 | 26 +++++++++++++++--
>  mm/shmem.c                 | 57 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 88 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
> index e65b80ed09e7..2dde843f28ef 100644
> --- a/include/linux/shmem_fs.h
> +++ b/include/linux/shmem_fs.h
> @@ -12,6 +12,9 @@
>  
>  /* inode in-kernel data */
>  
> +/* shmem extended flags */
> +#define SHM_F_INACCESSIBLE	0x0001  /* prevent ordinary MMU access (e.g. read/write/mmap) to file content */
> +
>  struct shmem_inode_info {
>  	spinlock_t		lock;
>  	unsigned int		seals;		/* shmem seals */
> @@ -24,6 +27,7 @@ struct shmem_inode_info {
>  	struct shared_policy	policy;		/* NUMA memory alloc policy */
>  	struct simple_xattrs	xattrs;		/* list of xattrs */
>  	atomic_t		stop_eviction;	/* hold when working on inode */
> +	unsigned int		xflags;		/* shmem extended flags */
>  	struct inode		vfs_inode;
>  };
>  

AFAICS, only two bits of 'flags' are used. And that's very strange that
VM_ flags are used for the purpose. My guess that someone was lazy to
introduce new constants for this.

I think we should fix this: introduce SHM_F_LOCKED and SHM_F_NORESERVE
alongside with SHM_F_INACCESSIBLE and stuff them all into info->flags.
It also makes shmem_file_setup_xflags() go away.

-- 
 Kirill A. Shutemov

