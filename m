Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A451D592F71
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 15:11:56 +0200 (CEST)
Received: from localhost ([::1]:58858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNZso-0001SS-NH
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 09:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oNZqG-0008DG-7E
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 09:09:16 -0400
Received: from mga11.intel.com ([192.55.52.93]:57404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oNZqA-000078-Fu
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 09:09:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660568950; x=1692104950;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=uC6wcjTIjKWZdEEUC6nc6q/QLuQ42xa9S3mFqSAWmAc=;
 b=OFCPl3X46lF1CWJyVxkwqOWhniujiJ8gdu1Fz+/jgC22fQgNZv09Z2i8
 7NYAzoFieM8shTAgCcu1MtqYIaOAY/0injHdTxs98+uTGE3INRAzCELf8
 5tfxAVymHT99coSm87iGTkuP8oOaRTpWYyFKNmAIIl2WFh+5pge4tbVgA
 3GpUvf1StO29Y6wKl3pZdz1zjdJMznFJX03EyavQZ5Am9G+JADiFvGhgI
 QLnq3A1rt/BVYT5B9KMzvMo6T7e2SQShvJWNpp8ahselHjwMyHmXY39jV
 LKkkOUkXj6vc4P1x03qVwIP8eu1P9ZDc/1wk10/KN86RebNh8SAY0L7YX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="289521954"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="289521954"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 06:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="635470742"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 15 Aug 2022 06:08:56 -0700
Date: Mon, 15 Aug 2022 21:04:11 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Nikunj A. Dadhania" <nikunj@amd.com>
Cc: "Gupta, Pankaj" <pankaj.gupta@amd.com>,
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
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, bharata@amd.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220815130411.GA1073443@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <b21f41e5-0322-bbfb-b9c2-db102488592d@amd.com>
 <9e86daea-5619-a216-fe02-0562cf14c501@amd.com>
 <9dc91ce8-4cb6-37e6-4c25-27a72dc11dd0@amd.com>
 <422b9f97-fdf5-54bf-6c56-3c45eff5e174@amd.com>
 <1407c70c-0c0b-6955-10bb-d44c5928f2d9@amd.com>
 <1136925c-2e37-6af4-acac-be8bed9f6ed5@amd.com>
 <1b02db9d-f2f1-94dd-6f37-59481525abff@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b02db9d-f2f1-94dd-6f37-59481525abff@amd.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, Aug 12, 2022 at 02:18:43PM +0530, Nikunj A. Dadhania wrote:
> 
> 
> On 12/08/22 12:48, Gupta, Pankaj wrote:
> > 
> >>>>>>
> >>>>>> However, fallocate() preallocates full guest memory before starting the guest.
> >>>>>> With this behaviour guest memory is *not* demand pinned. Is there a way to
> >>>>>> prevent fallocate() from reserving full guest memory?
> >>>>>
> >>>>> Isn't the pinning being handled by the corresponding host memory backend with mmu > notifier and architecture support while doing the memory operations e.g page> migration and swapping/reclaim (not supported currently AFAIU). But yes, we need> to allocate entire guest memory with the new flags MEMFILE_F_{UNMOVABLE, UNRECLAIMABLE etc}.
> >>>>
> >>>> That is correct, but the question is when does the memory allocated, as these flags are set,
> >>>> memory is neither moved nor reclaimed. In current scenario, if I start a 32GB guest, all 32GB is
> >>>> allocated.
> >>>
> >>> I guess so if guest memory is private by default.
> >>>
> >>> Other option would be to allocate memory as shared by default and
> >>> handle on demand allocation and RMPUPDATE with page state change event. But still that would be done at guest boot time, IIUC.
> >>
> >> Sorry! Don't want to hijack the other thread so replying here.
> >>
> >> I thought the question is for SEV SNP. For SEV, maybe the hypercall with the page state information can be used to allocate memory as we use it or something like quota based memory allocation (just thinking).
> > 
> > But all this would have considerable performance overhead (if by default memory is shared) and used mostly at boot time. 
> 
> > So, preallocating memory (default memory private) seems better approach for both SEV & SEV SNP with later page management (pinning, reclaim) taken care by host memory backend & architecture together.
> 
> I am not sure how will pre-allocating memory help, even if guest would not use full memory it will be pre-allocated. Which if I understand correctly is not expected.

Actually the current version allows you to delay the allocation to a
later time (e.g. page fault time) if you don't call fallocate() on the
private fd. fallocate() is necessary in previous versions because we
treat the existense in the fd as 'private' but in this version we track
private/shared info in KVM so we don't rely on that fact from memory
backstores.

Definitely the page will still be pinned once it's allocated, there is
no way to swap it out for example just with the current code. That kind
of support, if desirable, can be extended through MOVABLE flag and some
other callbacks to let feature-specific code to involve.

Chao
> 
> Regards
> Nikunj

