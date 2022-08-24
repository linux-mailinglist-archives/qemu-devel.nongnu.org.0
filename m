Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F401659F90B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 14:09:54 +0200 (CEST)
Received: from localhost ([::1]:56124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQpCj-0000I4-JR
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 08:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oQngl-00037B-M5
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 06:32:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:20949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oQngj-0001Cl-PE
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 06:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661337165; x=1692873165;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=UArt2EM4pE0fPWswCENdaTr2KP04kl+6xHjnd6dPVIs=;
 b=W0lWWq5i9uQc7Y+we8FUDNIW0o+HhhP3bQpcZFEEPqaNrgiZt7uj+Lo9
 TruU+dsbx/zNYjwbnizshBiz0sutHaFSao/CzK3NpEfA+/93D7VOVTmYP
 //MIAb6nozrdUjtPJqoA2KxLFDSoDgOD57sLS2DZnpzcGyXu04kl/i47F
 UC+Ym7znpAA/gPxyQXBYqUKrb+u7g+KAhSJRLzTXp3ZkkCWwsq/WNMB8+
 52WHPqoPRxQZjnsz7gRmTgjUH6QREyb7a2Muf7lvbx8UKPAJhIwHyC+CJ
 y+bdfWzwom+AfOWG7N8PtZDRJtDgrqSv/AA4urYPKTvgACNaiKVWToRxq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="294715932"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="294715932"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 03:32:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="605987428"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 24 Aug 2022 03:32:31 -0700
Date: Wed, 24 Aug 2022 18:27:48 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Hugh Dickins <hughd@google.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, linux-kselftest@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220824102748.GB1385482@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <YwIIoFJrKPBXaRDW@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwIIoFJrKPBXaRDW@casper.infradead.org>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 21, 2022 at 11:27:44AM +0100, Matthew Wilcox wrote:
> On Thu, Aug 18, 2022 at 08:00:41PM -0700, Hugh Dickins wrote:
> > tmpfs and hugetlbfs and page cache are designed around sharing memory:
> > TDX is designed around absolutely not sharing memory; and the further
> > uses which Sean foresees appear not to need it as page cache either.
> > 
> > Except perhaps for page migration reasons.  It's somewhat incidental,  
> > but of course page migration knows how to migrate page cache, so
> > masquerading as page cache will give a short cut to page migration,
> > when page migration becomes at all possible.
> 
> I haven't read the patch series, and I'm not taking a position one way
> or the other on whether this is better implemented as a shmem addition
> or a shim that asks shmem for memory.  Page migration can be done for
> driver memory by using PageMovable.  I just rewrote how it works, so
> the details are top of my mind at the moment if anyone wants something
> explained.  Commit 68f2736a8583 is the key one to look at.

Thanks Matthew. That is helpful to understand the current code.

Chao

