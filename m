Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6773654D79
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 09:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8dQ0-00005y-CE; Fri, 23 Dec 2022 03:28:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p8dPy-00005m-DL
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 03:28:38 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p8dPw-0004vs-HC
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 03:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671784116; x=1703320116;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ZGaAHoTLI1U3Y/sWtoppFD46fIsTwSzhwP5untsoPlg=;
 b=CxiQyYKqSroERWDmn9NWBA2YK9O9m7BhihOpacvwStduP8xQEaY6tAtY
 s85vSXdrMO2bEwD4Ke7feMNbd0U2+OrLTHJ3E643f5CGfEgWztql1kUrV
 UT923/P9Oj3pYhqquWUWUSx6tEtsLU5IgpSm0+di4FNkneIKuZLizyXOn
 FKNIPItvsg1h/8bEOfzqAq5hG01VAd9NdyWokKg04hmgBvWK+Zqts3Gu+
 H4gKwX3n49BoevrcOC9rdDnGc+kTDUjC5KSZ37LjvPNyWzNv0E+4/m1TU
 n4cHXLlF3p4XKHWqYjMnNuQFHGGxzlZyzcu5pKquaLxQDh6dvUnM80inW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="300634953"
X-IronPort-AV: E=Sophos;i="5.96,267,1665471600"; d="scan'208";a="300634953"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 00:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="602140158"
X-IronPort-AV: E=Sophos;i="5.96,267,1665471600"; d="scan'208";a="602140158"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga003.jf.intel.com with ESMTP; 23 Dec 2022 00:28:21 -0800
Date: Fri, 23 Dec 2022 16:24:06 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: "Huang, Kai" <kai.huang@intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jmattson@google.com" <jmattson@google.com>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "Hocko, Michal" <mhocko@suse.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "tabba@google.com" <tabba@google.com>,
 "david@redhat.com" <david@redhat.com>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "bfields@fieldses.org" <bfields@fieldses.org>,
 "dhildenb@redhat.com" <dhildenb@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "rppt@kernel.org" <rppt@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "vbabka@suse.cz" <vbabka@suse.cz>,
 "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "qperret@google.com" <qperret@google.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vannapurve@google.com" <vannapurve@google.com>,
 "naoya.horiguchi@nec.com" <naoya.horiguchi@nec.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
 "hughd@google.com" <hughd@google.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "Wang, Wei W" <wei.w.wang@intel.com>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linmiaohe@huawei.com" <linmiaohe@huawei.com>
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <20221223082406.GB1829090@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-2-chao.p.peng@linux.intel.com>
 <5c6e2e516f19b0a030eae9bf073d555c57ca1f21.camel@intel.com>
 <20221219075313.GB1691829@chaop.bj.intel.com>
 <deba096c85e41c3a15d122f2159986a74b16770f.camel@intel.com>
 <20221220072228.GA1724933@chaop.bj.intel.com>
 <126046ce506df070d57e6fe5ab9c92cdaf4cf9b7.camel@intel.com>
 <20221221133905.GA1766136@chaop.bj.intel.com>
 <Y6SevJt6XXOsmIBD@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6SevJt6XXOsmIBD@google.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 22, 2022 at 06:15:24PM +0000, Sean Christopherson wrote:
> On Wed, Dec 21, 2022, Chao Peng wrote:
> > On Tue, Dec 20, 2022 at 08:33:05AM +0000, Huang, Kai wrote:
> > > On Tue, 2022-12-20 at 15:22 +0800, Chao Peng wrote:
> > > > On Mon, Dec 19, 2022 at 08:48:10AM +0000, Huang, Kai wrote:
> > > > > On Mon, 2022-12-19 at 15:53 +0800, Chao Peng wrote:
> > > But for non-restricted-mem case, it is correct for KVM to decrease page's
> > > refcount after setting up mapping in the secondary mmu, otherwise the page will
> > > be pinned by KVM for normal VM (since KVM uses GUP to get the page).
> > 
> > That's true. Actually even true for restrictedmem case, most likely we
> > will still need the kvm_release_pfn_clean() for KVM generic code. On one
> > side, other restrictedmem users like pKVM may not require page pinning
> > at all. On the other side, see below.
> > 
> > > 
> > > So what we are expecting is: for KVM if the page comes from restricted mem, then
> > > KVM cannot decrease the refcount, otherwise for normal page via GUP KVM should.
> 
> No, requiring the user (KVM) to guard against lack of support for page migration
> in restricted mem is a terrible API.  It's totally fine for restricted mem to not
> support page migration until there's a use case, but punting the problem to KVM
> is not acceptable.  Restricted mem itself doesn't yet support page migration,
> e.g. explosions would occur even if KVM wanted to allow migration since there is
> no notification to invalidate existing mappings.
> 
> > I argue that this page pinning (or page migration prevention) is not
> > tied to where the page comes from, instead related to how the page will
> > be used. Whether the page is restrictedmem backed or GUP() backed, once
> > it's used by current version of TDX then the page pinning is needed. So
> > such page migration prevention is really TDX thing, even not KVM generic
> > thing (that's why I think we don't need change the existing logic of
> > kvm_release_pfn_clean()). Wouldn't better to let TDX code (or who
> > requires that) to increase/decrease the refcount when it populates/drops
> > the secure EPT entries? This is exactly what the current TDX code does:
> 
> I agree that whether or not migration is supported should be controllable by the
> user, but I strongly disagree on punting refcount management to KVM (or TDX).
> The whole point of restricted mem is to support technologies like TDX and SNP,
> accomodating their special needs for things like page migration should be part of
> the API, not some footnote in the documenation.

I never doubt page migration should be part of restrictedmem API, but
that's not an initial implementing as we all agreed? Then before that
API being introduced, we need find a solution to prevent page migration
for TDX. Other than refcount management, do we have any other workable
solution? 

> 
> It's not difficult to let the user communicate support for page migration, e.g.
> if/when restricted mem gains support, add a hook to restrictedmem_notifier_ops
> to signal support (or lack thereof) for page migration.  NULL == no migration,
> non-NULL == migration allowed.

I know.

> 
> We know that supporting page migration in TDX and SNP is possible, and we know
> that page migration will require a dedicated API since the backing store can't
> memcpy() the page.  I don't see any reason to ignore that eventuality.

No, I'm not ignoring it. It's just about the short-term page migration
prevention before that dedicated API being introduced.

> 
> But again, unless I'm missing something, that's a future problem because restricted
> mem doesn't yet support page migration regardless of the downstream user.

It's true a future problem for page migration support itself, but page
migration prevention is not a future problem since TDX pages need to be
pinned before page migration gets supported.

Thanks,
Chao

