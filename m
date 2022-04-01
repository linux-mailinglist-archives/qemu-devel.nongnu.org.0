Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF04EF8BF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 19:15:44 +0200 (CEST)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naKsA-0002Vg-HV
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 13:15:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1naKr0-0001lc-P8
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:14:30 -0400
Received: from [2607:f8b0:4864:20::633] (port=36804
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1naKqz-0001GY-7L
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 13:14:30 -0400
Received: by mail-pl1-x633.google.com with SMTP id m18so2987493plx.3
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TmJlBi2lOKilVyCE4rEH1RU4SqqxsckJUfBoRuoJ5iA=;
 b=XswIK2+VM16bs1EyCAixrX89EKH93ezG3dB1CWqPGTee1snfa+If/AZijfKqsxCqtT
 czAJM7L+aUj6khEGJ6GV9s++PLrO8RH4lZkcJg2KUogkm/dx0FOh6Bdu3+L9kSytbNEF
 XG0woWBUkeuEHiLxkjZVlGyLcAV8wCqkBCs5NYAogpMbDENpW1paD3SiXOo3FOHbC/BE
 WYgluaeEO6OycFsdtzk13mJ436B8Tm+WeKW9KRWPo6GkYNWY936IsCliUkUrYOsiKniH
 rexTSPppoR//hQcB3ze8glrIZD0dmsOyJ/XHIq6k4cBlE7q4ChILUSTyVJwIVcd9BGxN
 YFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TmJlBi2lOKilVyCE4rEH1RU4SqqxsckJUfBoRuoJ5iA=;
 b=6nCzajG+tss871SpObNzgnjFCwL3CcXrXYqBBqBntrR0dzIZDMqJuhn3eDNtyzvAkm
 D056Hhl+Vw4XqsiAoFK3ZrFUaa/WDZGoqx8PazUUSp0kSCtAbkcbnnyCRD/rhJ5BH/5+
 meL2RWD2j5uppAlbzbsuYDHKqHP4ZIsgmmy++fWE9MWFhxMyrYwBsnTAmWWruuTOebJI
 /DGfsGpQuQVgOGIagjF7P7iMiHI9zw0U8JC39SccVckP+AXhrxIHWZYlbo3MHSRehax0
 2Quo+PzrR50cYxh7ctgF95iTuuiUT5rnMwv/MhtLhBNdCl0NVWRINCel1ewGOknnpHAT
 oAkg==
X-Gm-Message-State: AOAM531rX8wqwXJ+BXied/QpRmq4cunjF408dM4PQjdY6DSk9JxWEpBh
 j4/cFxilCwlW+T+d9AvxPHRMRQ==
X-Google-Smtp-Source: ABdhPJz12AHLKCpitPA4TCd4Qr7wvOzdMzS4bQmVFvgCp7soE2Mp/gjwDqcr67uNH6+9bYjsC7+Dhg==
X-Received: by 2002:a17:902:ec8c:b0:154:2e86:dd51 with SMTP id
 x12-20020a170902ec8c00b001542e86dd51mr11082426plg.99.1648833265465; 
 Fri, 01 Apr 2022 10:14:25 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm3669103pfh.83.2022.04.01.10.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 10:14:24 -0700 (PDT)
Date: Fri, 1 Apr 2022 17:14:21 +0000
From: Sean Christopherson <seanjc@google.com>
To: Quentin Perret <qperret@google.com>
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
Message-ID: <Ykcy7fj/d+f9OUl/@google.com>
References: <YjyS6A0o4JASQK+B@google.com> <YkHspg+YzOsbUaCf@google.com>
 <YkH32nx+YsJuUbmZ@google.com> <YkIFW25WgV2WIQHb@google.com>
 <YkM7eHCHEBe5NkNH@google.com>
 <88620519-029e-342b-0a85-ce2a20eaf41b@arm.com>
 <YkQzfjgTQaDd2E2T@google.com> <YkSaUQX89ZEojsQb@google.com>
 <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkcTTY4YjQs5BRhE@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=seanjc@google.com; helo=mail-pl1-x633.google.com
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

On Fri, Apr 01, 2022, Quentin Perret wrote:
> The typical flow is as follows:
> 
>  - the host asks the hypervisor to run a guest;
> 
>  - the hypervisor does the context switch, which includes switching
>    stage-2 page-tables;
> 
>  - initially the guest has an empty stage-2 (we don't require
>    pre-faulting everything), which means it'll immediately fault;
> 
>  - the hypervisor switches back to host context to handle the guest
>    fault;
> 
>  - the host handler finds the corresponding memslot and does the
>    ipa->hva conversion. In our current implementation it uses a longterm
>    GUP pin on the corresponding page;
> 
>  - once it has a page, the host handler issues a hypercall to donate the
>    page to the guest;
> 
>  - the hypervisor does a bunch of checks to make sure the host owns the
>    page, and if all is fine it will unmap it from the host stage-2 and
>    map it in the guest stage-2, and do some bookkeeping as it needs to
>    track page ownership, etc;
> 
>  - the guest can then proceed to run, and possibly faults in many more
>    pages;
> 
>  - when it wants to, the guest can then issue a hypercall to share a
>    page back with the host;
> 
>  - the hypervisor checks the request, maps the page back in the host
>    stage-2, does more bookkeeping and returns back to the host to notify
>    it of the share;
> 
>  - the host kernel at that point can exit back to userspace to relay
>    that information to the VMM;
> 
>  - rinse and repeat.

I assume there is a scenario where a page can be converted from shared=>private?
If so, is there a use case where that happens post-boot _and_ the contents of the
page are preserved?

> We currently don't allow the host punching holes in the guest IPA space.

The hole doesn't get punched in guest IPA space, it gets punched in the private
backing store, which is host PA space.

> Once it has donated a page to a guest, it can't have it back until the
> guest has been entirely torn down (at which point all of memory is
> poisoned by the hypervisor obviously).

The guest doesn't have to know that it was handed back a different page.  It will
require defining the semantics to state that the trusted hypervisor will clear
that page on conversion, but IMO the trusted hypervisor should be doing that
anyways.  IMO, forcing on the guest to correctly zero pages on conversion is
unnecessarily risky because converting private=>shared and preserving the contents
should be a very, very rare scenario, i.e. it's just one more thing for the guest
to get wrong.

If there is a use case where the page contents need to be preserved, then that can
and should be an explicit request from the guest, and can be handled through
export/import style functions.  Export/import would be slow-ish due to memcpy(),
which is why I asked if there's a need to do this specific action frequently (or
at all).

