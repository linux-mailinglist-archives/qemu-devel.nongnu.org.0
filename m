Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AEF4F9C1C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:57:59 +0200 (CEST)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncsru-0000en-4G
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ncsr1-0008JZ-Gq
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:57:03 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ncsqz-0005eK-PM
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:57:03 -0400
Received: by mail-pl1-x636.google.com with SMTP id k13so3331614plk.12
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IudNh/HynxxH+tLoweLS06+fVTpNQOOa59eg8I3l6dE=;
 b=U2/eA7V9kOv67ug/CEAAH5jJ3bDdjcuxlz1/CKBkgdCZNj0JT/9J3pCPxI/ctDFSbM
 qK1+Sr9mcyKaUr/H66Pv9yktEidb3BhejDS+0/amDof+SQfyaKA08TzT03iiUsMWJJ3J
 1MOBs6THAm4fpRtqfO8Z5nRoWMFj9z3GkfuNpKxv/p7ca1UQgBQvuQUPEasblyTQ9RrO
 yn1hcR+9v3A8/OJPimHYWYuYVMj6vFYN+ei68jGp8D7XrjHDIdyTkfs0MDCZSOMFvB64
 yHKUCeuwajm7ozlzkxvbDs/GO8MPtR8QBXSY2YgA4lYkeM/deK+/SqRK5LFaoYUgODz1
 i3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IudNh/HynxxH+tLoweLS06+fVTpNQOOa59eg8I3l6dE=;
 b=dIJNKm+Ufc4G/Mmk4+2hXApQ+i1NuQZablvlnhiFl7yeT21JiSBok04r/JVZt0RP8F
 R869aZxfIqRkD/9h3aW08ppdMF3CWZXML8dxCJnLxwcWenFlLvRpAQO9OQS9Pqr5KIMX
 K9/+1tRTMOd98sfpO3mQGf2jAV2f+yU9lNeEbPE2441L1GATLBKgWLNbntqBF1xgs9Dg
 w2ep21CcuwAZ9BUQRbLzTarTpfW2ePhi9t4XlgWsE5clDE6Lcr4+NaOUa9SP9guS59nN
 Pt54dYfX/miQ8GVN35KtUjbQg15pM3HqmGvORNXbWd+uOVr9zNyIoOBNYy9eRrJ6CQjG
 mJ2Q==
X-Gm-Message-State: AOAM531qVHa35/qoG+xUr9eMZKycfamLghtwmN3FlkKqGmW5stTuqe4z
 OjKOyj0S7J1ez9+0mg3e3xm/Hg==
X-Google-Smtp-Source: ABdhPJzyqykFhKSNRm78BrrnsD1mOVmGCPlJulii4V8oRfU//P/WLig+dmASk3SzvKPSoD3usOwcWw==
X-Received: by 2002:a17:903:2346:b0:156:9956:f437 with SMTP id
 c6-20020a170903234600b001569956f437mr20871133plh.123.1649440620128; 
 Fri, 08 Apr 2022 10:57:00 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 w123-20020a623081000000b005056a4d71e3sm6021624pfw.77.2022.04.08.10.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 10:56:59 -0700 (PDT)
Date: Fri, 8 Apr 2022 17:56:55 +0000
From: Sean Christopherson <seanjc@google.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
Message-ID: <YlB3Z8fqJ+67a2Ck@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
 <02e18c90-196e-409e-b2ac-822aceea8891@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02e18c90-196e-409e-b2ac-822aceea8891@www.fastmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=seanjc@google.com; helo=mail-pl1-x636.google.com
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

On Thu, Apr 07, 2022, Andy Lutomirski wrote:
> 
> On Thu, Apr 7, 2022, at 9:05 AM, Sean Christopherson wrote:
> > On Thu, Mar 10, 2022, Chao Peng wrote:
> >> Since page migration / swapping is not supported yet, MFD_INACCESSIBLE
> >> memory behave like longterm pinned pages and thus should be accounted to
> >> mm->pinned_vm and be restricted by RLIMIT_MEMLOCK.
> >> 
> >> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> >> ---
> >>  mm/shmem.c | 25 ++++++++++++++++++++++++-
> >>  1 file changed, 24 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/mm/shmem.c b/mm/shmem.c
> >> index 7b43e274c9a2..ae46fb96494b 100644
> >> --- a/mm/shmem.c
> >> +++ b/mm/shmem.c
> >> @@ -915,14 +915,17 @@ static void notify_fallocate(struct inode *inode, pgoff_t start, pgoff_t end)
> >>  static void notify_invalidate_page(struct inode *inode, struct folio *folio,
> >>  				   pgoff_t start, pgoff_t end)
> >>  {
> >> -#ifdef CONFIG_MEMFILE_NOTIFIER
> >>  	struct shmem_inode_info *info = SHMEM_I(inode);
> >>  
> >> +#ifdef CONFIG_MEMFILE_NOTIFIER
> >>  	start = max(start, folio->index);
> >>  	end = min(end, folio->index + folio_nr_pages(folio));
> >>  
> >>  	memfile_notifier_invalidate(&info->memfile_notifiers, start, end);
> >>  #endif
> >> +
> >> +	if (info->xflags & SHM_F_INACCESSIBLE)
> >> +		atomic64_sub(end - start, &current->mm->pinned_vm);
> >
> > As Vishal's to-be-posted selftest discovered, this is broken as current->mm
> > may be NULL.  Or it may be a completely different mm, e.g. AFAICT there's
> > nothing that prevents a different process from punching hole in the shmem
> > backing.
> >
> 
> How about just not charging the mm in the first place?  There’s precedent:
> ramfs and hugetlbfs (at least sometimes — I’ve lost track of the current
> status).
> 
> In any case, for an administrator to try to assemble the various rlimits into
> a coherent policy is, and always has been, quite messy. ISTM cgroup limits,
> which can actually add across processes usefully, are much better.
> 
> So, aside from the fact that these fds aren’t in a filesystem and are thus
> available by default, I’m not convinced that this accounting is useful or
> necessary.
> 
> Maybe we could just have some switch require to enable creation of private
> memory in the first place, and anyone who flips that switch without
> configuring cgroups is subject to DoS.

I personally have no objection to that, and I'm 99% certain Google doesn't rely
on RLIMIT_MEMLOCK.

