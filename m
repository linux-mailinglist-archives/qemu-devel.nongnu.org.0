Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B835E70F4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 02:55:20 +0200 (CEST)
Received: from localhost ([::1]:50412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obWyN-0006Ye-Jp
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 20:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1obWwj-00055z-Ok
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 20:53:37 -0400
Received: from mga04.intel.com ([192.55.52.120]:32364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1obWwh-0002bp-DU
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 20:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663894415; x=1695430415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N5ROSjhMMMcLpyjlHpJbtQYkQW/pwctSUSnQMueHIwE=;
 b=NX7hSj0zmjU9fixRqug+2wLy5hu6u+Je2gkssD0iIQIeIj746SrpLO75
 Y9fBzXV5zOh+uHZ9jjx+6J2GrgKxgGG59XZS4AejD7eRhnx7AXBcwhvlh
 70lQpNMQn+ipIDnFRBg6ioeP8+7U2cCFFbs7idMMOnSrCk9KG4JFYu6Qg
 zMnYsSLZIjqxT6mguH/O3xEukDsL5waGd7RB9PtbOcTHtQfGv8z/t2DYL
 FEKHcoF6te066R5+S9m4xwKoYsXMA/wXl5Pp4k9yuBOGYZUD34cu5qZss
 gF1R0GzLL4N7ocU7K8AZ9qabljRfDJTSP58OYxFHJHktnSG6S6csr3xqg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="299197561"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="299197561"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 17:53:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="622334850"
Received: from dnessim-mobl1.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.252.60.183])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 17:53:21 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 6B9DA104532; Fri, 23 Sep 2022 03:53:19 +0300 (+03)
Date: Fri, 23 Sep 2022 03:53:19 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: "Wang, Wei W" <wei.w.wang@intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "dhildenb@redhat.com" <dhildenb@redhat.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 "Hocko, Michal" <mhocko@suse.com>, Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <20220923005319.wkzpl36uailh4zbw@box.shutemov.name>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <DS0PR11MB63734D4DF4C4F368805EC97DDC4E9@DS0PR11MB6373.namprd11.prod.outlook.com>
 <Yyy8Pp0Y4NRzIzNw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yyy8Pp0Y4NRzIzNw@google.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga04.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 07:49:18PM +0000, Sean Christopherson wrote:
> On Thu, Sep 22, 2022, Wang, Wei W wrote:
> > On Thursday, September 15, 2022 10:29 PM, Chao Peng wrote:
> > > +int inaccessible_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
> > > +			 int *order)
> > 
> > Better to remove "order" from this interface?
> 
> Hard 'no'.
> 
> > Some callers only need to get pfn, and no need to bother with
> > defining and inputting something unused. For callers who need the "order",
> > can easily get it via thp_order(pfn_to_page(pfn)) on their own.
> 
> That requires (a) assuming the pfn is backed by struct page, and (b) assuming the
> struct page is a transparent huge page.  That might be true for the current
> implementation, but it most certainly will not always be true.
> 
> KVM originally did things like this, where there was dedicated code for THP vs.
> HugeTLB, and it was a mess.  The goal here is very much to avoid repeating those
> mistakes.  Have the backing store _tell_ KVM how big the mapping is, don't force
> KVM to rediscover the info on its own.

I guess we can allow order pointer to be NULL to cover caller that don't
need to know the order. Is it useful?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

