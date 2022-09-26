Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4305EA861
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:28:04 +0200 (CEST)
Received: from localhost ([::1]:36746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocp5X-00008W-Ot
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ocoq6-00055f-2z
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:12:06 -0400
Received: from mga09.intel.com ([134.134.136.24]:54752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ocoq4-0002C3-Di
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664201524; x=1695737524;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=3K99V46lahR/2OM+AWPRnQqkJGlMh+2oIpwQe2KYPck=;
 b=WjNfAYKygyHhNXvQNloGeVjyLniRHD7Qj6U0fJqVwrCLxGkdU4J2r5od
 LKivwq+Fuqiom4EnaK5Joo3rPeW3jDFhOJSl8Y3OLEweok7vrGDOgulHG
 OGt/ufdZL18Osf53CL/GhLo4Hxj68gBNfXTCEugyBb5Yj7NQxsZ2dkrWx
 ThoPngpsErvVOMkV6vrynQ0uFGBcS7H9htl1rgrEI9chDI0N/+owmND/L
 4JDZ0fsIgbZRoz7WukC5bm8xTcnomf0iL8+lNad8MP3OwktfwooOvYN6L
 /2m4G7i1QQA2P6yqlRaR/pVGo5WYVS0KNK914RsiSdVAuVwy6gKc7Vu8Q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="301937684"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="301937684"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 07:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="651841295"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="651841295"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 26 Sep 2022 07:11:51 -0700
Date: Mon, 26 Sep 2022 22:07:15 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Fuad Tabba <tabba@google.com>
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
Subject: Re: [PATCH v8 5/8] KVM: Register/unregister the guest private memory
 regions
Message-ID: <20220926140715.GB2658254@chaop.bj.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-6-chao.p.peng@linux.intel.com>
 <CA+EHjTx+GVpGavzMQQOispT-oUk5cSyssedYJ00=GdnCtEQO6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx+GVpGavzMQQOispT-oUk5cSyssedYJ00=GdnCtEQO6A@mail.gmail.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Sep 26, 2022 at 11:36:34AM +0100, Fuad Tabba wrote:
...

> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 2125b50f6345..d65690cae80b 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -260,6 +260,15 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
> >  bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
> >  #endif
> >
> > +#ifdef __KVM_HAVE_ZAP_GFN_RANGE
> > +void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end);
> > +#else
> > +static inline void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start
> > +                                                     gfn_t gfn_end)
> 
> Missing a comma after gfn_start.

Good catch, thanks!
Chao
> 
> Cheers,
> /fuad


