Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574DF6545E7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 19:17:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Q6Q-0003YR-TA; Thu, 22 Dec 2022 13:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1p8Q6P-0003YI-9m
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 13:15:33 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1p8Q6N-0004wn-42
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 13:15:33 -0500
Received: by mail-pj1-x102c.google.com with SMTP id x3so2694355pjv.4
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 10:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=752C77UYWYC/kCXAv9m+o+bKyybany3JU3TCXHGZR0U=;
 b=mnWHipNRICDDr9o9B9k9tzUHQ5DlJw7QNZU1NFFDGUJ/WFgmaKL6adljuLzxsRCR1T
 yOt1llvxRLddf3o8tFdD1XSrfvJKY91Y6BA+Ue/bxbYYHAufNWWHf+w2InX7LDglGQta
 9K3BVA4lZMYr2iIsmJ+f1M3V5mNVtVOBrDe0He7TJ193jL7X5zGQlNAIk8two/do47Qa
 +IAmme0Ak9mW8lBakzH8LqHkhC04c8aYC5+Yadk9FKgybASwcKtR2kDtwpwTkfLtjN0F
 Pf78IoRu0kt98rlTKH1ZJdwA91Ht9u39VkBXmY2L8neh0zXKIViW79WjZdA8w13OMOlE
 OnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=752C77UYWYC/kCXAv9m+o+bKyybany3JU3TCXHGZR0U=;
 b=z3+4LY8AQ9TCZamXubNgdx31iCoCgHBcBOYnRr9cITo8mvoEEkj72yrhIjbemA9EGv
 JYNqbsbQ6v0AitNPiYWn6ThH0//wXJHgi80lCj4R2fRn1zXoOqgkrWLVtKdWeWFIc0qK
 1ZeOj1PYBlcgh+6DBXn7kDD54oNjjm0anEILVQWSo1UC2M45pnEwHUBDsin6x4EGr18h
 yGttAeZ4so3BdJX16D7haqGk9qnuRdhHWcJE+ZtvziNiTfsWRJEBAL9oqY7UX2oclV9E
 7YwfC3RFfLljUKg+3AOG1BZvGptLz4GlqlwuO+EoRxPNeYYSUgDDN7+mwPHNeMo3nyBh
 rJWg==
X-Gm-Message-State: AFqh2kpvnUcUnxQQPC+u0rR+B6GMWeNnpmnpNMAfacPfTyvtAgENC9Yu
 ggNz1RA8WWrReJ2ccU0NZkwY2Q==
X-Google-Smtp-Source: AMrXdXtVsGTXmJ+OudFvpboyWukOEY96QmhFL3/LDUsVn+qtHCwo04yMbEQyfv9hcz3t0HxxdVHCiA==
X-Received: by 2002:a17:903:41ca:b0:189:6624:58c0 with SMTP id
 u10-20020a17090341ca00b00189662458c0mr1174380ple.3.1671732928592; 
 Thu, 22 Dec 2022 10:15:28 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 a7-20020a17090a70c700b00219feae9486sm3443216pjm.7.2022.12.22.10.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 10:15:28 -0800 (PST)
Date: Thu, 22 Dec 2022 18:15:24 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
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
Message-ID: <Y6SevJt6XXOsmIBD@google.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-2-chao.p.peng@linux.intel.com>
 <5c6e2e516f19b0a030eae9bf073d555c57ca1f21.camel@intel.com>
 <20221219075313.GB1691829@chaop.bj.intel.com>
 <deba096c85e41c3a15d122f2159986a74b16770f.camel@intel.com>
 <20221220072228.GA1724933@chaop.bj.intel.com>
 <126046ce506df070d57e6fe5ab9c92cdaf4cf9b7.camel@intel.com>
 <20221221133905.GA1766136@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221133905.GA1766136@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Dec 21, 2022, Chao Peng wrote:
> On Tue, Dec 20, 2022 at 08:33:05AM +0000, Huang, Kai wrote:
> > On Tue, 2022-12-20 at 15:22 +0800, Chao Peng wrote:
> > > On Mon, Dec 19, 2022 at 08:48:10AM +0000, Huang, Kai wrote:
> > > > On Mon, 2022-12-19 at 15:53 +0800, Chao Peng wrote:
> > But for non-restricted-mem case, it is correct for KVM to decrease page's
> > refcount after setting up mapping in the secondary mmu, otherwise the page will
> > be pinned by KVM for normal VM (since KVM uses GUP to get the page).
> 
> That's true. Actually even true for restrictedmem case, most likely we
> will still need the kvm_release_pfn_clean() for KVM generic code. On one
> side, other restrictedmem users like pKVM may not require page pinning
> at all. On the other side, see below.
> 
> > 
> > So what we are expecting is: for KVM if the page comes from restricted mem, then
> > KVM cannot decrease the refcount, otherwise for normal page via GUP KVM should.

No, requiring the user (KVM) to guard against lack of support for page migration
in restricted mem is a terrible API.  It's totally fine for restricted mem to not
support page migration until there's a use case, but punting the problem to KVM
is not acceptable.  Restricted mem itself doesn't yet support page migration,
e.g. explosions would occur even if KVM wanted to allow migration since there is
no notification to invalidate existing mappings.

> I argue that this page pinning (or page migration prevention) is not
> tied to where the page comes from, instead related to how the page will
> be used. Whether the page is restrictedmem backed or GUP() backed, once
> it's used by current version of TDX then the page pinning is needed. So
> such page migration prevention is really TDX thing, even not KVM generic
> thing (that's why I think we don't need change the existing logic of
> kvm_release_pfn_clean()). Wouldn't better to let TDX code (or who
> requires that) to increase/decrease the refcount when it populates/drops
> the secure EPT entries? This is exactly what the current TDX code does:

I agree that whether or not migration is supported should be controllable by the
user, but I strongly disagree on punting refcount management to KVM (or TDX).
The whole point of restricted mem is to support technologies like TDX and SNP,
accomodating their special needs for things like page migration should be part of
the API, not some footnote in the documenation.

It's not difficult to let the user communicate support for page migration, e.g.
if/when restricted mem gains support, add a hook to restrictedmem_notifier_ops
to signal support (or lack thereof) for page migration.  NULL == no migration,
non-NULL == migration allowed.

We know that supporting page migration in TDX and SNP is possible, and we know
that page migration will require a dedicated API since the backing store can't
memcpy() the page.  I don't see any reason to ignore that eventuality.

But again, unless I'm missing something, that's a future problem because restricted
mem doesn't yet support page migration regardless of the downstream user.

