Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243B857A181
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:29:35 +0200 (CEST)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDoEA-0000Zk-BE
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oDnuY-00054H-PB
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:09:18 -0400
Received: from mga14.intel.com ([192.55.52.115]:32711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oDnuW-0005bM-Fq
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:09:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658239756; x=1689775756;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=s/ctDqIUvL1W3W833+ijczZqODZpeij+xtTHe7CbsGA=;
 b=dJ2vZyCOlcLa7JcPyZpsD+mHXkWF/QCTmZfeV+tefNaNJwyPVPToN45/
 YowkxibkhBxV4FtLP1GcaP0wlgHzyOFm6lsoLf6/cu8IrWkPT6IM5qa/h
 CXAWzzfYY024wrhnltHa5d2eanUQ1toiFWxmKHOFUk9UzEQg9EumUJ7na
 i/7zr/xP/xQ5e0cuXVM0DEqs5WqxINVFcyhQiYe+0rJInrxpxI/PcAgaH
 ncqYp0Z4uxkXfM14M3SjDJ02UGsr67K/2G7wLIGzXMa6j7nAE3REoNENB
 xUK05w3RVOE2FBzbCCWkfxcUZZv7mIV4Y++v8kp5sDlaB9k3rH8dFi0SO w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="286512959"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="286512959"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="655774698"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2022 07:07:38 -0700
Date: Tue, 19 Jul 2022 22:02:48 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: "Gupta, Pankaj" <pankaj.gupta@amd.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 07/14] KVM: Use gfn instead of hva for
 mmu_notifier_retry
Message-ID: <20220719140248.GA84005@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-8-chao.p.peng@linux.intel.com>
 <d480a850-601b-cda2-b671-04d839c98429@amd.com>
 <20220718132950.GA38104@chaop.bj.intel.com>
 <YtV7qpYZoT6jIKHQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtV7qpYZoT6jIKHQ@google.com>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

On Mon, Jul 18, 2022 at 03:26:34PM +0000, Sean Christopherson wrote:
> On Mon, Jul 18, 2022, Chao Peng wrote:
> > On Fri, Jul 15, 2022 at 01:36:15PM +0200, Gupta, Pankaj wrote:
> > > > Currently in mmu_notifier validate path, hva range is recorded and then
> > > > checked in the mmu_notifier_retry_hva() from page fault path. However
> > > > for the to be introduced private memory, a page fault may not have a hva
> > > 
> > > As this patch appeared in v7, just wondering did you see an actual bug
> > > because of it? And not having corresponding 'hva' occurs only with private
> > > memory because its not mapped to host userspace?
> > 
> > The addressed problem is not new in this version, previous versions I
> > also had code to handle it (just in different way). But the problem is:
> > mmu_notifier/memfile_notifier may be in the progress of invalidating a
> > pfn that obtained earlier in the page fault handler, when happens, we
> > should retry the fault. In v6 I used global mmu_notifier_retry() for
> > memfile_notifier but that can block unrelated mmu_notifer invalidation
> > which has hva range specified.
> > 
> > Sean gave a comment at https://lkml.org/lkml/2022/6/17/1001 to separate
> > memfile_notifier from mmu_notifier but during the implementation I
> > realized we actually can reuse the same code for shared and private
> > memory if both using gpa range and that can simplify the code handling
> > in kvm_zap_gfn_range and some other code (e.g. we don't need two
> > versions for memfile_notifier/mmu_notifier).
> 
> This should work, though I'm undecided as to whether or not it's a good idea.  KVM
> allows aliasing multiple gfns to a single hva, and so using the gfn could result
> in a much larger range being rejected given the simplistic algorithm for handling
> multiple ranges in kvm_inc_notifier_count().  But I assume such aliasing is uncommon,
> so I'm not sure it's worth optimizing for.

That can be a real problem for current v7 code, __kvm_handle_hva_range()
loops all possible gfn_range for a given hva_range but the
on_lock/on_unlock is invoked only once, this should work for hva_range,
but not gfn_range since we can have multiple of them.

> 
> > Adding gpa range for private memory invalidation also relieves the
> > above blocking issue between private memory page fault and mmu_notifier.

