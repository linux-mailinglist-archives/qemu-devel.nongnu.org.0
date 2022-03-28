Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0919C4E9F54
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 21:00:23 +0200 (CEST)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYubG-0007hi-2c
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 15:00:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYuZe-0006ea-S8
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:58:42 -0400
Received: from [2607:f8b0:4864:20::42d] (port=44753
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYuZc-0000Ck-VE
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:58:42 -0400
Received: by mail-pf1-x42d.google.com with SMTP id w7so10890484pfu.11
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J0gKBEKFmyw8tGYtEJySSF3LdFpLZnr/dEFLwztId4s=;
 b=BP6lY2zHEqXub322vtOJdyYONyA2pqNnkB9QNDf/JQ/FQms6jvObpEygxdH0FyBEjA
 6rDnrRMp1VIY1DGs4Aovje3NRLVQnfqDCW/cPxNNpmIU4pgIFSLRETIlwLywtIAT+AOV
 lSoXKwCaRrQeo5jYgSfkPNwOxKDE/kG5zvgNTghAfhgssFANlYN6U4LJSIFxbS4efxAk
 RZHIeYKWjhSS9BjuxiknAgyddsaYaw8q0yI+BZX79mKvTDujTRnOhIi1+W7msg+v2O3B
 q+NGnwlN1qJ0l57xyUIeUxLlmBQ5MkFDOMntLhJK+CMbBP+AfGJYbeYDdC6LvciB6kti
 +W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J0gKBEKFmyw8tGYtEJySSF3LdFpLZnr/dEFLwztId4s=;
 b=y5wtDBJspGd+wLagLHk+S9KYfF7NaYRNDWcjtFa9fWNhTQiJuaJblOZ2cU9z/gAf4b
 bp4qTWZs72klrqWa3/QBp2cPWg2bRDpxA6MGA27fDwQY49ExYSQt45ZKDqx2GaheXhPC
 sEvn8xxxjeirQZJxxAC64yUXm85gTMwaWVUzTGqCcfoLzpO6N4mn6mDua1E+ACdcI5h5
 ZXpEGBrDfN/g+RW3nYy6Jb89x4vL1hThf5jR+YAlJ8aeefatcfZSVZI3eOH0xjIhDooY
 SKfBx52zrc540vaLwoKTzvopdaeivpfVR7HGmBFJlVb52rDzpPkzbocWB0VF6Ka0QOms
 XGsg==
X-Gm-Message-State: AOAM5320/bFajjWh5PDeP8cMf7xfNghJzHoCDXVFwbTYgNVSuMWFieI5
 eMF4iFP03K5JfXRXMZwpErPskg==
X-Google-Smtp-Source: ABdhPJzt33Tcu5zFv7O6tkqFVpoXjqM4zc4NiOigygH2Y07+cCWuGLygkYuTYFYwvGauzAJIekPWIA==
X-Received: by 2002:aa7:8256:0:b0:4e0:78ad:eb81 with SMTP id
 e22-20020aa78256000000b004e078adeb81mr24856623pfn.30.1648493919181; 
 Mon, 28 Mar 2022 11:58:39 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 132-20020a62168a000000b004f40e8b3133sm17938224pfw.188.2022.03.28.11.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 11:58:38 -0700 (PDT)
Date: Mon, 28 Mar 2022 18:58:35 +0000
From: Sean Christopherson <seanjc@google.com>
To: Quentin Perret <qperret@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
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
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YkIFW25WgV2WIQHb@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <YjyS6A0o4JASQK+B@google.com> <YkHspg+YzOsbUaCf@google.com>
 <YkH32nx+YsJuUbmZ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkH32nx+YsJuUbmZ@google.com>
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

On Mon, Mar 28, 2022, Quentin Perret wrote:
> Hi Sean,
> 
> Thanks for the reply, this helps a lot.
> 
> On Monday 28 Mar 2022 at 17:13:10 (+0000), Sean Christopherson wrote:
> > On Thu, Mar 24, 2022, Quentin Perret wrote:
> > > For Protected KVM (and I suspect most other confidential computing
> > > solutions), guests have the ability to share some of their pages back
> > > with the host kernel using a dedicated hypercall. This is necessary
> > > for e.g. virtio communications, so these shared pages need to be mapped
> > > back into the VMM's address space. I'm a bit confused about how that
> > > would work with the approach proposed here. What is going to be the
> > > approach for TDX?
> > > 
> > > It feels like the most 'natural' thing would be to have a KVM exit
> > > reason describing which pages have been shared back by the guest, and to
> > > then allow the VMM to mmap those specific pages in response in the
> > > memfd. Is this something that has been discussed or considered?
> > 
> > The proposed solution is to exit to userspace with a new exit reason, KVM_EXIT_MEMORY_ERROR,
> > when the guest makes the hypercall to request conversion[1].  The private fd itself
> > will never allow mapping memory into userspace, instead userspace will need to punch
> > a hole in the private fd backing store.  The absense of a valid mapping in the private
> > fd is how KVM detects that a pfn is "shared" (memslots without a private fd are always
> > shared)[2].
> 
> Right. I'm still a bit confused about how the VMM is going to get the
> shared page mapped in its page-table. Once it has punched a hole into
> the private fd, how is it supposed to access the actual physical page
> that the guest shared?

The guest doesn't share a _host_ physical page, the guest shares a _guest_ physical
page.  Until host userspace converts the gfn to shared and thus maps the gfn=>hva
via mmap(), the guest is blocked and can't read/write/exec the memory.  AFAIK, no
architecture allows in-place decryption of guest private memory.  s390 allows a
page to be "made accessible" to the host for the purposes of swap, and other
architectures will have similar behavior for migrating a protected VM, but those
scenarios are not sharing the page (and they also make the page inaccessible to
the guest).

> Is there an assumption somewhere that the VMM should have this page mapped in
> via an alias that it can legally access only once it has punched a hole at
> the corresponding offset in the private fd or something along those lines?

Yes, the VMM must have a completely separate VMA.  The VMM doesn't haven't to
wait until the conversion to mmap() the shared variant, though obviously it will
potentially consume double the memory if the VMM actually populates both the
private and shared backing stores.

> > The key point is that KVM never decides to convert between shared and private, it's
> > always a userspace decision.  Like normal memslots, where userspace has full control
> > over what gfns are a valid, this gives userspace full control over whether a gfn is
> > shared or private at any given time.
> 
> I'm understanding this as 'the VMM is allowed to punch holes in the
> private fd whenever it wants'. Is this correct?

From the kernel's perspective, yes, the VMM can punch holes at any time.  From a
"do I want to DoS my guest" perspective, the VMM must honor its contract with the
guest and not spuriously unmap private memory.

> What happens if it does so for a page that a guest hasn't shared back?

When the hole is punched, KVM will unmap the corresponding private SPTEs.  If the
guest is still accessing the page as private, the next access will fault and KVM
will exit to userspace with KVM_EXIT_MEMORY_ERROR.  Of course the guest is probably
hosed if the hole punch was truly spurious, as at least hardware-based protected VMs
effectively destroy data when a private page is unmapped from the guest private SPTEs.

E.g. Linux guests for TDX and SNP will panic/terminate in such a scenario as they
will get a fault (injected by trusted hardware/firmware) saying that the guest is
trying to access an unaccepted/unvalidated page (TDX and SNP require the guest to
explicit accept all private pages that aren't part of the guest's initial pre-boot
image).

> > Another important detail is that this approach means the kernel and KVM treat the
> > shared backing store and private backing store as independent, albeit related,
> > entities.  This is very deliberate as it makes it easier to reason about what is
> > and isn't allowed/required.  E.g. the kernel only needs to handle freeing private
> > memory, there is no special handling for conversion to shared because no such path
> > exists as far as host pfns are concerned.  And userspace doesn't need any new "rules"
> > for protecting itself against a malicious guest, e.g. userspace already needs to
> > ensure that it has a valid mapping prior to accessing guest memory (or be able to
> > handle any resulting signals).  A malicious guest can DoS itself by instructing
> > userspace to communicate over memory that is currently mapped private, but there
> > are no new novel attack vectors from the host's perspective as coercing the host
> > into accessing an invalid mapping after shared=>private conversion is just a variant
> > of a use-after-free.
> 
> Interesting. I was (maybe incorrectly) assuming that it would be
> difficult to handle illegal host accesses w/ TDX. IOW, this would
> essentially crash the host. Is this remotely correct or did I get that
> wrong?

Handling illegal host kernel accesses for both TDX and SEV-SNP is extremely
difficult, bordering on impossible.  That's one of the biggest, if not _the_
biggest, motivations for the private fd approach.  On "conversion", the page that is
used to back the shared variant is a completely different, unrelated host physical
page.  Whether or not the private/shared backing page is freed is orthogonal to
what version is mapped into the guest.  E.g. if the guest converts a 4kb chunk of
a 2mb hugepage, the private backing store could keep the physical page on hole
punch (example only, I don't know if this is the actual proposed implementation).

The idea is that it'll be much, much more difficult for the host to perform an
illegal access if the actual private memory is not mapped anywhere (modulo the
kernel's direct map, which we may or may not leave intact).  The private backing
store just needs to ensure it properly sanitizing pages before freeing them.

