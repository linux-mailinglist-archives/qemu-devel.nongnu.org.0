Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B314057316B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:45:48 +0200 (CEST)
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBY0B-0003po-Gb
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oBXJ7-0000g4-Kc
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:01:21 -0400
Received: from mga03.intel.com ([134.134.136.65]:41514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oBXJ1-00056z-GR
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657699271; x=1689235271;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=7ENYqPqKTk0ESIJ/QoNgf3KZMY16w1kA6fyDKtIJ5rs=;
 b=YUrb6DOXtoDXmgQg7mtkNXQyiBEwAMIES4zCxg7H/SH2V9fn+2W+tIUo
 5Fdqd+dj3PDqyjLK6A8CQpchQSBLCEz6AlINB50D4tEfyOwaUUG+YwHJP
 cBg2SWZUWpvEm3ohH5aYR+7VRHhaXvJf/qoV0PSO9rhSLa8fh/AnMRieS
 reCrutbLAQWWX23sbXS2NaSOFxWnJzV0OU2P71DXzDd7Y1+AeKxuyCePk
 Zr1Nxbeab+3Nny5IDrZS3gvQ4tBgV5eIPWHZjGPwxD4Vwt0lzuPhF0gFV
 E14fsdukq1wQPMe7e2+GzmFpxHK/hQx2gTpchJcuH0EMxJndMpmWFOSqP A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="286277207"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="286277207"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 01:01:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="685071104"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2022 01:00:56 -0700
Date: Wed, 13 Jul 2022 15:57:38 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
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
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220713075738.GC2831541@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <b1c12a4b-46f7-081b-242f-005a8824aad1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1c12a4b-46f7-081b-242f-005a8824aad1@amd.com>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
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

On Wed, Jul 13, 2022 at 05:58:32AM +0200, Gupta, Pankaj wrote:
> 
> > This is the v7 of this series which tries to implement the fd-based KVM
> > guest private memory. The patches are based on latest kvm/queue branch
> > commit:
> > 
> >    b9b71f43683a (kvm/queue) KVM: x86/mmu: Buffer nested MMU
> > split_desc_cache only by default capacity
> > 
> > Introduction
> > ------------
> > In general this patch series introduce fd-based memslot which provides
> > guest memory through memory file descriptor fd[offset,size] instead of
> > hva/size. The fd can be created from a supported memory filesystem
> > like tmpfs/hugetlbfs etc. which we refer as memory backing store. KVM
> 
> Thinking a bit, As host side fd on tmpfs or shmem will store memory on host
> page cache instead of mapping pages into userspace address space. Can we hit
> double (un-coordinated) page cache problem with this when guest page cache
> is also used?

This is my understanding: in host it will be indeed in page cache (in
current shmem implementation) but that's just the way it allocates and
provides the physical memory for the guest. In guest, guest OS will not
see this fd (absolutely), it only sees guest memory, on top of which it
can build its own page cache system for its own file-mapped content but
that is unrelated to host page cache.

Chao
> 
> Thanks,
> Pankaj
> 

