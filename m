Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38F55BA9EE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 12:06:10 +0200 (CEST)
Received: from localhost ([::1]:54702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ8Eb-0007wb-Jn
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 06:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oZ87w-0003WK-0l
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 05:59:16 -0400
Received: from mga04.intel.com ([192.55.52.120]:62406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oZ87u-0003uL-EW
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 05:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663322354; x=1694858354;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=+GGngsOt+mHhqh1Zhh4O/6JETM5+xIHPKtlncj1KbqA=;
 b=A4LkHZQkw9RJPE2LBXoRbFGpWzMgVEeaok7p4fZZPt5l561i3x4vj9ju
 kLaQzale4QuTaPxI7YnyTDwXFq4QaxCIffjCP+2j1/6ERhw/inCQmjrpS
 r3uG+GuEh9kgo3SmhABPbju6H417mV+HF/BGWuBFlk/l5cs/zAdPPkQp+
 RkbKD6wjuopBIfKO1RI6RLe88rAuP4pFs62oWSvMXXXiUTmG2Bx+whY3N
 vHSyhK5GMwYoaGxllhf6koDysvjz1NCkM6jbEypyE1k9FxbjobXFEIZnL
 iusleMIIYGAW061hBOk9EBNFKQGCu0Y88KkucXEmuPwRlF5IyvP5LVc1C A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="297681504"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="297681504"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="620036737"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga007.fm.intel.com with ESMTP; 16 Sep 2022 02:59:03 -0700
Date: Fri, 16 Sep 2022 17:54:24 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Message-ID: <20220916095424.GB2261402@chaop.bj.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-4-chao.p.peng@linux.intel.com>
 <YyQ/PHZHkDSgjH/v@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyQ/PHZHkDSgjH/v@debian.me>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 16, 2022 at 04:17:48PM +0700, Bagas Sanjaya wrote:
> On Thu, Sep 15, 2022 at 10:29:08PM +0800, Chao Peng wrote:
> > + - KVM_MEMORY_EXIT_FLAG_PRIVATE - indicates the memory error is caused by
> > +   private memory access when the bit is set otherwise the memory error is
> > +   caused by shared memory access when the bit is clear.
> 
> s/set otherwise/set. Otherwise,

Thanks.

> 
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara



