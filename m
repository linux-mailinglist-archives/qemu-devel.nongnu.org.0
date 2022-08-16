Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03242595BB9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:23:44 +0200 (CEST)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNvbi-0003kQ-Nv
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oNvaG-0002Mt-53
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:22:12 -0400
Received: from mga09.intel.com ([134.134.136.24]:31213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oNvaD-00011o-Cb
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660652529; x=1692188529;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B3uUd/yG6wpuTb/aR5iTfAme30Qm6tQlD5VU32Fh/CI=;
 b=l90UqfuAlsI9rgX21s+zwIbGeqVkc1EmkCyzgFh9lgV5un0GgfOgOEai
 QTXSoYHt5DSjb0BAZmerVFVrP+2Cnmfpifh21B7mu0tRrGGWQHw5oqc3W
 m8w/pXueQ5yJpOGA3v1p+2W+JxjkfAA2t5ZX6u4D0Ft3/oQDuJ1bzrAv9
 uvcSRaQ3kxpKNv+vP0yKWxOg/9CnBi4geuee18NkfR6/kjSPK6FNFBEG+
 aB2A76Dk5AwNh8Qheokeq5l1XpXDV8FKbZ7nTmDn3uzmx6KMyh5kpCAiN
 C9IyBFW0GWh5E0ZBqVxMREh0hu2wN8a9ZNeKeeX56zlppEQQUcjiGsvsS A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="292997966"
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; d="scan'208";a="292997966"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 05:22:03 -0700
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; d="scan'208";a="675194031"
Received: from damianos-mobl.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.252.40.45])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 05:21:54 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 4FB31104A4E; Tue, 16 Aug 2022 15:24:57 +0300 (+03)
Date: Tue, 16 Aug 2022 15:24:57 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>,
 "Nikunj A. Dadhania" <nikunj@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, bharata@amd.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220816122457.2fjyd4uz5hp5cani@box.shutemov.name>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <b21f41e5-0322-bbfb-b9c2-db102488592d@amd.com>
 <9e86daea-5619-a216-fe02-0562cf14c501@amd.com>
 <9dc91ce8-4cb6-37e6-4c25-27a72dc11dd0@amd.com>
 <422b9f97-fdf5-54bf-6c56-3c45eff5e174@amd.com>
 <1407c70c-0c0b-6955-10bb-d44c5928f2d9@amd.com>
 <1136925c-2e37-6af4-acac-be8bed9f6ed5@amd.com>
 <1b02db9d-f2f1-94dd-6f37-59481525abff@amd.com>
 <20220815130411.GA1073443@chaop.bj.intel.com>
 <f0094f31-9669-47b5-eb52-6754a13ce757@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0094f31-9669-47b5-eb52-6754a13ce757@amd.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 16, 2022 at 01:33:00PM +0200, Gupta, Pankaj wrote:
> Hi Chao,
> 
> > 
> > Actually the current version allows you to delay the allocation to a
> > later time (e.g. page fault time) if you don't call fallocate() on the
> > private fd. fallocate() is necessary in previous versions because we
> > treat the existense in the fd as 'private' but in this version we track
> > private/shared info in KVM so we don't rely on that fact from memory
> > backstores.
> 
> Does this also mean reservation of guest physical memory with secure
> processor (both for SEV-SNP & TDX) will also happen at page fault time?
> 
> Do we plan to keep it this way?

If you are talking about accepting memory by the guest, it is initiated by
the guest and has nothing to do with page fault time vs fallocate()
allocation of host memory. I mean acceptance happens after host memory
allocation but they are not in lockstep, acceptance can happen much later.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

