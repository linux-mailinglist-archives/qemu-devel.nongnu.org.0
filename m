Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F04482199
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 03:36:10 +0100 (CET)
Received: from localhost ([::1]:41466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n37m5-0006aP-9f
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 21:36:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n37kO-0005uS-GU
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 21:34:24 -0500
Received: from mga05.intel.com ([192.55.52.43]:30651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n37kM-00035b-8P
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 21:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640918062; x=1672454062;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=3xgj6YPF/dL11Z/52845rvYXUsZ6jR0j7Y9+NOsvBzY=;
 b=K95VyQj5wuV86bskUaDdSUixrL8sxio6Z3gyrV98cTQP5FwcieIL0QHQ
 RdqCN28GNPi8gM8wmN2cG/c4C14YP1womD+SP/xFgGFc1DimWc+b4zOF7
 LIcT+GZJmkKauxBCP8fdUh96zOzwPEaswHRt1Xl8fuoxIn7nQ/poNy4Ks
 EaHdH1MafxaCQchMeg1iWQP++LQw5SNrJ4j02yoHXX0lr6sPgI2tRSHkV
 H/IyeYpt+B8Q3OxEUxbR7297ZlyGRK8ORo7jbjehikKiPnG4AMMicAouw
 LarhhJGIfRav+FsHMlfqHQq9D6sSB/53j5O8H9tVXRpo73+SbeM/lw9LP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="328096166"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="328096166"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 18:34:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="666706992"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2021 18:34:10 -0800
Date: Fri, 31 Dec 2021 10:33:34 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v3 kvm/queue 11/16] KVM: Add kvm_map_gfn_range
Message-ID: <20211231023334.GA7255@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-12-chao.p.peng@linux.intel.com>
 <YcS6m9CieYaIGA3F@google.com>
 <20211224041351.GB44042@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224041351.GB44042@chaop.bj.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 24, 2021 at 12:13:51PM +0800, Chao Peng wrote:
> On Thu, Dec 23, 2021 at 06:06:19PM +0000, Sean Christopherson wrote:
> > On Thu, Dec 23, 2021, Chao Peng wrote:
> > > This new function establishes the mapping in KVM page tables for a
> > > given gfn range. It can be used in the memory fallocate callback for
> > > memfd based memory to establish the mapping for KVM secondary MMU when
> > > the pages are allocated in the memory backend.
> > 
> > NAK, under no circumstance should KVM install SPTEs in response to allocating
> > memory in a file.   The correct thing to do is to invalidate the gfn range
> > associated with the newly mapped range, i.e. wipe out any shared SPTEs associated
> > with the memslot.
> 
> Right, thanks.

BTW, I think the current fallocate() callback is just useless as long as
we don't want to install KVM SPTEs in response to allocating memory in a
file. The invalidation of the shared SPTEs should be notified through 
mmu_notifier of the shared memory backend, not memfd_notifier of the
private memory backend.

Thanks,
Chao

