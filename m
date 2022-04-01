Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D730F4EF97F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 20:05:04 +0200 (CEST)
Received: from localhost ([::1]:45700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naLdv-0007Kx-6N
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 14:05:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1naLcS-0006dT-0E
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 14:03:32 -0400
Received: from [2a00:1450:4864:20::52b] (port=46010
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1naLcQ-0000D9-4p
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 14:03:31 -0400
Received: by mail-ed1-x52b.google.com with SMTP id u26so3804503eda.12
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lhxxWKT9SwwnWJkm39OZn7IwwCKXG3b/O/9dQouxNPo=;
 b=Lr8A3p7Ekj/xeqHFv/FPraXvj8lmfHwD95Tyh0wBLtHKMerFISovW3cP911Cv1OBMv
 LV/OgGxHqX6rFmQDgLqdILULRzc7+aWuNiPU+Sk8Vtloe5edefA/RKnzKDbH1r5KuBbZ
 kev1t4QLJXESZh3mGGAntIMgi47syaHwmLXLjV4jdlQobqziGAHtJIA2WFfzfe5cFIjV
 fqcPM0a1TZGP94MxJrnUfa3F6LyGzWdGmQaH2OoT4mLR0RmukUXT9LXwNpTFQKZVcRf/
 aIWCTNM3KQyU809xH2hE5O+R6+Ekag5oYXwycP+wVr1LXAKbwyLENB8lf5HV4rz1dgco
 C/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lhxxWKT9SwwnWJkm39OZn7IwwCKXG3b/O/9dQouxNPo=;
 b=ciG19RSPwiV4/UQRvjBRU3smtS+5Cimy8wRkvGGphVgnZb6EiftT3B0EiaFEHd3uXP
 AojKrGsXTEVFrZD54YB5i2v/MwnA04HBj5rcqVj8k7n7ooPqEYkyJXR/IcTe9512NY4c
 8hhPyE4l5d3SjxJ0Rs6SBZm7JJsuiCKTPyxswyEhYJ+VfBuj3F1j0/oonVlP7Yzg8P3N
 exmSqyg1fICJPpPKSlGdWaWtNmmMRWKxF4wRXWFNyR711kZ1Dxalm8WeFXvpVbmQKody
 /cjBa21e5qQMmkeL7O9zVIKKDWssN9si+iSTeLTeO7QmCXc4S0W+vd5F+BpAycnMb6Ta
 9Etg==
X-Gm-Message-State: AOAM533BK80HqU+LndWuhGcfgavOWHWEddgO7AtVgcF6KVays5ihE8To
 bFlJ6EJ7u/NSErz0weqB4kEEng==
X-Google-Smtp-Source: ABdhPJx4lQmR1Kk59tyeYPMDHJWz6rR/i5Lub1feW38LhyW2CdsmPwtcOTrIJDFvMbum4LQjQAg6LQ==
X-Received: by 2002:a05:6402:438d:b0:419:4550:d52b with SMTP id
 o13-20020a056402438d00b004194550d52bmr22227721edc.83.1648836200464; 
 Fri, 01 Apr 2022 11:03:20 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com.
 [34.91.171.30]) by smtp.gmail.com with ESMTPSA id
 w14-20020a170906d20e00b006cee22553f7sm1261239ejz.213.2022.04.01.11.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 11:03:20 -0700 (PDT)
Date: Fri, 1 Apr 2022 18:03:16 +0000
From: Quentin Perret <qperret@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Steven Price <steven.price@arm.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <Ykc+ZNWlsXCaOrM9@google.com>
References: <YkHspg+YzOsbUaCf@google.com> <YkH32nx+YsJuUbmZ@google.com>
 <YkIFW25WgV2WIQHb@google.com> <YkM7eHCHEBe5NkNH@google.com>
 <88620519-029e-342b-0a85-ce2a20eaf41b@arm.com>
 <YkQzfjgTQaDd2E2T@google.com> <YkSaUQX89ZEojsQb@google.com>
 <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com> <Ykcy7fj/d+f9OUl/@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ykcy7fj/d+f9OUl/@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=qperret@google.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Friday 01 Apr 2022 at 17:14:21 (+0000), Sean Christopherson wrote:
> On Fri, Apr 01, 2022, Quentin Perret wrote:
> > The typical flow is as follows:
> > 
> >  - the host asks the hypervisor to run a guest;
> > 
> >  - the hypervisor does the context switch, which includes switching
> >    stage-2 page-tables;
> > 
> >  - initially the guest has an empty stage-2 (we don't require
> >    pre-faulting everything), which means it'll immediately fault;
> > 
> >  - the hypervisor switches back to host context to handle the guest
> >    fault;
> > 
> >  - the host handler finds the corresponding memslot and does the
> >    ipa->hva conversion. In our current implementation it uses a longterm
> >    GUP pin on the corresponding page;
> > 
> >  - once it has a page, the host handler issues a hypercall to donate the
> >    page to the guest;
> > 
> >  - the hypervisor does a bunch of checks to make sure the host owns the
> >    page, and if all is fine it will unmap it from the host stage-2 and
> >    map it in the guest stage-2, and do some bookkeeping as it needs to
> >    track page ownership, etc;
> > 
> >  - the guest can then proceed to run, and possibly faults in many more
> >    pages;
> > 
> >  - when it wants to, the guest can then issue a hypercall to share a
> >    page back with the host;
> > 
> >  - the hypervisor checks the request, maps the page back in the host
> >    stage-2, does more bookkeeping and returns back to the host to notify
> >    it of the share;
> > 
> >  - the host kernel at that point can exit back to userspace to relay
> >    that information to the VMM;
> > 
> >  - rinse and repeat.
> 
> I assume there is a scenario where a page can be converted from shared=>private?
> If so, is there a use case where that happens post-boot _and_ the contents of the
> page are preserved?

I think most our use-cases are private=>shared, but how is that
different?

> > We currently don't allow the host punching holes in the guest IPA space.
> 
> The hole doesn't get punched in guest IPA space, it gets punched in the private
> backing store, which is host PA space.

Hmm, in a previous message I thought that you mentioned when a whole
gets punched in the fd KVM will go and unmap the page in the private
SPTEs, which will cause a fatal error for any subsequent access from the
guest to the corresponding IPA?

If that's correct, I meant that we currently don't support that - the
host can't unmap anything from the guest stage-2, it can only tear it
down entirely. But again, I'm not too worried about that, we could
certainly implement that part without too many issues.

> > Once it has donated a page to a guest, it can't have it back until the
> > guest has been entirely torn down (at which point all of memory is
> > poisoned by the hypervisor obviously).
> 
> The guest doesn't have to know that it was handed back a different page.  It will
> require defining the semantics to state that the trusted hypervisor will clear
> that page on conversion, but IMO the trusted hypervisor should be doing that
> anyways.  IMO, forcing on the guest to correctly zero pages on conversion is
> unnecessarily risky because converting private=>shared and preserving the contents
> should be a very, very rare scenario, i.e. it's just one more thing for the guest
> to get wrong.

I'm not sure I agree. The guest is going to communicate with an
untrusted entity via that shared page, so it better be careful. Guest
hardening in general is a major topic, and of all problems, zeroing the
page before sharing is probably one of the simplest to solve.

Also, note that in pKVM all the hypervisor code at EL2 runs with
preemption disabled, which is a strict constraint. As such one of the
main goals is the spend as little time as possible in that context.
We're trying hard to keep the amount of zeroing/memcpy-ing to an
absolute minimum. And that's especially true as we introduce support for
huge pages. So, we'll take every opportunity we get to have the guest
or the host do that work.

