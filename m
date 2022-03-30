Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2CF4ECB31
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 19:59:42 +0200 (CEST)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcbc-00084d-NM
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 13:59:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nZcao-0007QE-6b
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:58:50 -0400
Received: from [2607:f8b0:4864:20::42d] (port=39748
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nZcam-0004bf-Gn
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:58:49 -0400
Received: by mail-pf1-x42d.google.com with SMTP id u22so19495232pfg.6
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 10:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qRdDzcsR6tHaU83Zu+AB6iaBkt7tf4uVxesheVO+k04=;
 b=fmINK1FWWmoLOoYP7UthQGhftrRGdNFBc+IlK+NV5/Ok9ERGA+qLeK6Qc2wTVLtgAA
 9LQ/i0EUSMCyjEaFKyIhIb7cMmbwQz9Y8BcfXLRuoN6ajRH59AuxXHA3EMGdoKl2VTSg
 p24YHpEbjdk+uT0CBOdjzzYlBeDTZ3F7gpj4hM7l1TBMoGnLiRy7iLYUHQWybuBMUn3o
 +79Dbrk0SFPljaZd36P/MkFhRRizQhSn53CNrK2P1EbC2v9I9Kv5K+rfi43xESLumhbH
 68CiFZAIDCb11Ijcxh9K1W3GQjeukR3sJTsN4+zlgHn1NYrxdXEcaVCJINP6zp/PmCKt
 vRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qRdDzcsR6tHaU83Zu+AB6iaBkt7tf4uVxesheVO+k04=;
 b=RRO7m8j12QRBWTkYreCLBkJatHIIqMyYlE1XNxhyUFHx2uarvGa5wQFyhuEgMYGAih
 Gcdh7FtaxeBBEnZ0L2KgOaKxp/QTvDZ2NBExVlqdrNHZnHk+ZxTTBGYNCeA+cf/STMf8
 ZnAzrlDaaqSwSwhfgpdSbNxMS3C4SEvtRfzbhfzWWArwxRx5jnkR1M7ZqQGgzla1MS+5
 g3GvrqaPP5pl585pf+FZ/twqw06Ovjx+FsCkwiJSpgFIP/ATon7xKnAVpp9ybNo2TSHE
 qL+uQw2SKZzo7hUcTNV7hEwv9sYL8EGwkI3NnFo2hA1cIFlDVaLFE0srK/c7HajAzW7e
 cY6A==
X-Gm-Message-State: AOAM530dJVcFJKHNPTRKwSaEShpZJc0YPUu5ty775v6Dg0ULq/GvO7iW
 dk3l72tdOh+ESUkaRTRSDHbUvw==
X-Google-Smtp-Source: ABdhPJw5RZDHzkmYWQnqaCR/pP7fkWu0K1pHE0zmJg/ZBWnJ2OplQYKLUcCZisuEeybmIa1wsGUd6g==
X-Received: by 2002:a65:674b:0:b0:381:6565:26fc with SMTP id
 c11-20020a65674b000000b00381656526fcmr7064146pgu.618.1648663126803; 
 Wed, 30 Mar 2022 10:58:46 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a8b0300b001c735089cc2sm6710778pjn.54.2022.03.30.10.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 10:58:45 -0700 (PDT)
Date: Wed, 30 Mar 2022 17:58:41 +0000
From: Sean Christopherson <seanjc@google.com>
To: Quentin Perret <qperret@google.com>
Cc: Steven Price <steven.price@arm.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YkSaUQX89ZEojsQb@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <YjyS6A0o4JASQK+B@google.com> <YkHspg+YzOsbUaCf@google.com>
 <YkH32nx+YsJuUbmZ@google.com> <YkIFW25WgV2WIQHb@google.com>
 <YkM7eHCHEBe5NkNH@google.com>
 <88620519-029e-342b-0a85-ce2a20eaf41b@arm.com>
 <YkQzfjgTQaDd2E2T@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkQzfjgTQaDd2E2T@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=seanjc@google.com; helo=mail-pf1-x42d.google.com
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

On Wed, Mar 30, 2022, Quentin Perret wrote:
> On Wednesday 30 Mar 2022 at 09:58:27 (+0100), Steven Price wrote:
> > On 29/03/2022 18:01, Quentin Perret wrote:
> > > Is implicit sharing a thing? E.g., if a guest makes a memory access in
> > > the shared gpa range at an address that doesn't have a backing memslot,
> > > will KVM check whether there is a corresponding private memslot at the
> > > right offset with a hole punched and report a KVM_EXIT_MEMORY_ERROR? Or
> > > would that just generate an MMIO exit as usual?
> > 
> > My understanding is that the guest needs some way of tagging whether a
> > page is expected to be shared or private. On the architectures I'm aware
> > of this is done by effectively stealing a bit from the IPA space and
> > pretending it's a flag bit.
> 
> Right, and that is in fact the main point of divergence we have I think.
> While I understand this might be necessary for TDX and the likes, this
> makes little sense for pKVM. This would effectively embed into the IPA a
> purely software-defined non-architectural property/protocol although we
> don't actually need to: we (pKVM) can reasonably expect the guest to
> explicitly issue hypercalls to share pages in-place. So I'd be really
> keen to avoid baking in assumptions about that model too deep in the
> host mm bits if at all possible.

There is no assumption about stealing PA bits baked into this API.  Even within
x86 KVM, I consider it a hard requirement that the common flows not assume the
private vs. shared information is communicated through the PA.

> > > I'm overall inclined to think that while this abstraction works nicely
> > > for TDX and the likes, it might not suit pKVM all that well in the
> > > current form, but it's close.
> > > 
> > > What do you think of extending the model proposed here to also address
> > > the needs of implementations that support in-place sharing? One option
> > > would be to have KVM notify the private-fd backing store when a page is
> > > shared back by a guest, which would then allow host userspace to mmap
> > > that particular page in the private fd instead of punching a hole.
> > > 
> > > This should retain the main property you're after: private pages that
> > > are actually mapped in the guest SPTE aren't mmap-able, but all the
> > > others are fair game.
> > > 
> > > Thoughts?
> > How do you propose this works if the page shared by the guest then needs
> > to be made private again? If there's no hole punched then it's not
> > possible to just repopulate the private-fd. I'm struggling to see how
> > that could work.
> 
> Yes, some discussion might be required, but I was thinking about
> something along those lines:
> 
>  - a guest requests a shared->private page conversion;
> 
>  - the conversion request is routed all the way back to the VMM;
> 
>  - the VMM is expected to either decline the conversion (which may be
>    fatal for the guest if it can't handle this), or to tear-down its
>    mappings (via munmap()) of the shared page, and accept the
>    conversion;
> 
>  - upon return from the VMM, KVM will be expected to check how many
>    references to the shared page are still held (probably by asking the
>    fd backing store) to check that userspace has indeed torn down its
>    mappings. If all is fine, KVM will instruct the hypervisor to
>    repopulate the private range of the guest, otherwise it'll return an
>    error to the VMM;
> 
>  - if the conversion has been successful, the guest can resume its
>    execution normally.
> 
> Note: this should still allow to use the hole-punching method just fine
> on systems that require it. The invariant here is just that KVM (with
> help from the backing store) is now responsible for refusing to
> instruct the hypervisor (or TDX module, or RMM, or whatever) to map a
> private page if there are existing mappings to it.
> 
> > Having said that; if we can work out a way to safely
> > mmap() pages from the private-fd there's definitely some benefits to be
> > had - e.g. it could be used to populate the initial memory before the
> > guest is started.
> 
> Right, so assuming the approach proposed above isn't entirely bogus,
> this might now become possible by having the VMM mmap the private-fd,
> load the payload, and then unmap it all, and only then instruct the
> hypervisor to use this as private memory.

Hard "no" on mapping the private-fd.  Having the invariant tha the private-fd
can never be mapped greatly simplifies the responsibilities of the backing store,
as well as the interface between the private-fd and the in-kernel consumers of the
memory (KVM in this case).

What is the use case for shared->private conversion?  x86, both TDX and SNP,
effectively do have a flavor of shared->private conversion; SNP can definitely
be in-place, and I think TDX too.  But the only use case in x86 is to populate
the initial guest image, and due to other performance bottlenecks, it's strongly
recommended to keep the initial image as small as possible.  Based on your previous
response about the guest firmware loading the full guest image, my understanding is
that pKVM will also utilize a minimal initial image.

As a result, true in-place conversion to reduce the number of memcpy()s is low
priority, i.e. not planned at this time.  Unless the use case expects to convert
large swaths of memory, the simplest approach would be to have pKVM memcpy() between
the private and shared backing pages during conversion.

In-place conversion that preserves data needs to be a separate and/or additional
hypercall, because "I want to map this page as private/shared" is very, very different
than "I want to map this page as private/shared and consume/expose non-zero data".
I.e. the host is guaranteed to get an explicit request to do the memcpy(), so there
shouldn't be a need to implicitly allow this on any conversion.

