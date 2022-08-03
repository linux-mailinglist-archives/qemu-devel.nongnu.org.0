Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF77588A3B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 12:16:55 +0200 (CEST)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJBQs-0000up-Av
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 06:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oJB9K-0006zj-At
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 05:58:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:35937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oJB9H-000460-Vv
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 05:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659520724; x=1691056724;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=7BjbHNcgAD7bFSogdESJhwwP2ibvONYz64wk3ueI8zI=;
 b=m/OgAUq8Dw8uFTQaKLDDOGg4Bb9hCUzq2/rTTzXRgKYDXca2U8KBA6g+
 EMYHzmR/xgxUiUpaDYOuRA/G2J0ShI5Gkda3OMwOCQ521KrCWq4c0dEnz
 XbSu36dFFHatYkXzlE/cD5i1PGdU8Lnyg17STeM3Gp55nb4hpdKPJJ2uf
 npecfY2kHUFdVdPOOwbsWK997fkMOqk5kewB8eRItXCF6tTJ2vfN4nPUp
 nkmO1iF9+HVKkBm3CdzE5wJDU3MSGSp+ZAwC8oRlQPr6qkrOdWZYTsocm
 pG38ceIxEvz59DIzoubFTy/wLGo7bbwve0/XhFjWfphaKu8VGKPfN+AU/ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="353636776"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="353636776"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 02:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="599589950"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 03 Aug 2022 02:58:31 -0700
Date: Wed, 3 Aug 2022 17:53:44 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
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
 luto@kernel.org, jun.nakajima@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 14/14] memfd_create.2: Describe MFD_INACCESSIBLE flag
Message-ID: <20220803095344.GC607465@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-15-chao.p.peng@linux.intel.com>
 <dc878e6c-c1d2-c291-00ef-11cff6cb03ec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc878e6c-c1d2-c291-00ef-11cff6cb03ec@intel.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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

On Mon, Aug 01, 2022 at 07:40:32AM -0700, Dave Hansen wrote:
> This patch does not belong in this series.  It's not a patch to the
> kernel.  This is a kernel series.

You are right.

> 
> It would be much more appropriate to put a link to a separately posted
> manpage patch in the cover letter.

Thanks for suggesion.

Chao

