Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BD558FDA7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:45:45 +0200 (CEST)
Received: from localhost ([::1]:45252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM8VM-0006cX-ME
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oM8Tt-00058U-R9
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:44:13 -0400
Received: from mga11.intel.com ([192.55.52.93]:31518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oM8Ts-0008OM-0S
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660225451; x=1691761451;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=6G1vjfFDPRBJq3hrus4RUCAj1Ik6SbGGx7LGPLT4CKc=;
 b=WVLdsVDkaPM+9uF36ZZZhATCv7P6gj8eaqWg4EFJY1mwHYSB+jfFKIev
 gnbq4lAW41INLQ1NFh28rHlXjLPl9FaMIv4DRyw/EYhnLLgOemlyqxveC
 sBUY0rdxaC7tUIk//uDRrVNWAcNkP9u5e4DvAQUSzH1zcVfS7ocwhA16G
 DSDk4RB+jAa87Q4xGshFXpexhPyS79ynNqlkX3bQUk+MO3t0hAVZU8Jp6
 y9hMuMt5BEMFKM65q8MxUxSaoARDc1MAmpXy/X2IEK00UZ0IDtrIV0fTO
 IAwUZfu/o7wpmMJM1mXdhIabWqKA/3QMpj3pMOk+UnWotk7Cx/s45sa3S A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="288914020"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="288914020"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 06:44:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="665377410"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 11 Aug 2022 06:43:59 -0700
Date: Thu, 11 Aug 2022 21:39:14 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Quentin Perret <qperret@google.com>
Cc: Sean Christopherson <seanjc@google.com>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
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
 ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v7 03/14] mm: Introduce memfile_notifier
Message-ID: <20220811133914.GC916119@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-4-chao.p.peng@linux.intel.com>
 <13394075-fca0-6f2b-92a2-f1291fcec9a3@redhat.com>
 <20220810092232.GC862421@chaop.bj.intel.com>
 <00f1aa03-bc82-ffce-569b-e2d5c459992c@redhat.com>
 <YvPC87FMgF7uac7z@google.com> <YvT1zOQtTQl2t300@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvT1zOQtTQl2t300@google.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
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

On Thu, Aug 11, 2022 at 12:27:56PM +0000, Quentin Perret wrote:
> +CC Fuad
> 
> On Wednesday 10 Aug 2022 at 14:38:43 (+0000), Sean Christopherson wrote:
> > > I understand Sean's suggestion about abstracting, but if the new name
> > > makes it harder to grasp and there isn't really an alternative to memfd
> > > in sight, I'm not so sure I enjoy the tried abstraction here.
> > 
> > ARM's pKVM implementation is potentially (hopefully) going to switch to this API
> > (as a consumer) sooner than later.  If they anticipate being able to use memfd,
> > then there's unlikely to be a second backing type any time soon.
> > 
> > Quentin, Will?
> 
> Yep, Fuad is currently trying to port the pKVM mm stuff on top of this
> series to see how well it fits, so stay tuned.

Good to hear that.

>I think there is still
> some room for discussion around page conversions (private->shared etc),
> and we'll need a clearer idea of what the code might look like to have a
> constructive discussion,

That's fine. Looking forward to your feedbacks.

>but so far it does seem like using a memfd (the
> new private one or perhaps just memfd_secret, to be discussed) + memfd
> notifiers is a promising option.

If it still memfd (even memfd_secret), maybe we can use the name
memfd_notifier?

Chao

