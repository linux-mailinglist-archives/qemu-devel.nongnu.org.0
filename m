Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C8518349
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 13:30:32 +0200 (CEST)
Received: from localhost ([::1]:32994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlqjf-0002Sj-Re
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 07:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1nlqSA-0006C5-ND
 for qemu-devel@nongnu.org; Tue, 03 May 2022 07:12:26 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1nlqS8-0005AM-OW
 for qemu-devel@nongnu.org; Tue, 03 May 2022 07:12:26 -0400
Received: by mail-ej1-x62a.google.com with SMTP id dk23so32761112ejb.8
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 04:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oFqiHnRl1AV5CwVvzFn8cPS0OwpSBHpXeStUM3laFbc=;
 b=rgEPWEyb2782i+En/M1Gr9kW1acyISu99grDdKpqBvvPNsWCOiP+G46tw+T/g/PWac
 0j/1IRgAx1LslBRX9J7N7iLrm3mcHMi7hhyzdYB5+ng2Ys2TT210cess3fl+KH+LXswP
 YnUJ5G4gbXRsTmJeogARhIPFKX4YLURoQ/zauliX7py64FVLF0q/j/9nemRIgKYrxfRF
 50bDBKtO24eHHvWVd0drvStgCLuh456LYRrNwiecHIdJqORZ5ymDAyfLWlif7S9+FR0S
 sOpckw/TLRFb1sQNpj7W3yH7GGX6IflG6OTh0++C8FJ+iysRYy2A8JK6ATCEZuqV/FRP
 J1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oFqiHnRl1AV5CwVvzFn8cPS0OwpSBHpXeStUM3laFbc=;
 b=yxxOYx2Y07P6N/2gnxpdzD45BuFsXK/n0qLNaCFJs/ULDf/OoXpwkMXoB0EZFmyfMl
 GECwriwv4Q4uubldR5mBu/FZwxrT6Ae8L7tlDkfard3zHEDmHQ1zHQUll6IgkYZfLdEN
 FwzhheF/iaqVKAoEskk78WXJgpJ5GTLiBOKyr0a2jDXsnR59bdhvqcPj8MVkAGr1K1ZH
 vvQb5ry4V3bcVlXgYUqC1WST/qghNECzxQQ28hEsg0H7UFwV+nGgcOblRT/kxVku3zk7
 y2iSMfiUD9gJjmhQkAhWaHtokUL7QVE2cwmeRqMTgK6jN4FD/UCfHBJGyix0gWoS3B9i
 dRtA==
X-Gm-Message-State: AOAM533/BuQsUCDAkgICDsyT7hsJVGa0mCtdq+yZ5bweIi99zu/qIDuq
 wRovzQuwvmy0VYCjP3Ltf+hNOw==
X-Google-Smtp-Source: ABdhPJw97PYd30DNDpPNsRrpJXojPvheV9UWZoSzYNANOpCBRVYdFYA4fTJtujnPpl7vcUfHD29C2Q==
X-Received: by 2002:a17:907:6e04:b0:6e0:95c0:47b8 with SMTP id
 sd4-20020a1709076e0400b006e095c047b8mr15127269ejc.483.1651576342075; 
 Tue, 03 May 2022 04:12:22 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com.
 [34.91.171.30]) by smtp.gmail.com with ESMTPSA id
 l24-20020a056402029800b0042617ba63a7sm7817960edv.49.2022.05.03.04.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 04:12:21 -0700 (PDT)
Date: Tue, 3 May 2022 11:12:18 +0000
From: Quentin Perret <qperret@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>,
 Steven Price <steven.price@arm.com>, kvm list <kvm@vger.kernel.org>,
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
 Will Deacon <will@kernel.org>, Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YnEOEmf4We1aeLcT@google.com>
References: <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com> <YkyEaYiL0BrDYcZv@google.com>
 <20220422105612.GB61987@chaop.bj.intel.com>
 <3b99f157-0f30-4b30-8399-dd659250ab8d@www.fastmail.com>
 <20220425134051.GA175928@chaop.bj.intel.com>
 <27616b2f-1eff-42ff-91e0-047f531639ea@www.fastmail.com>
 <20220428122952.GA10508@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428122952.GA10508@chaop.bj.intel.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=qperret@google.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday 28 Apr 2022 at 20:29:52 (+0800), Chao Peng wrote:
> 
> + Michael in case he has comment from SEV side.
> 
> On Mon, Apr 25, 2022 at 07:52:38AM -0700, Andy Lutomirski wrote:
> > 
> > 
> > On Mon, Apr 25, 2022, at 6:40 AM, Chao Peng wrote:
> > > On Sun, Apr 24, 2022 at 09:59:37AM -0700, Andy Lutomirski wrote:
> > >> 
> > 
> > >> 
> > >> 2. Bind the memfile to a VM (or at least to a VM technology).  Now it's in the initial state appropriate for that VM.
> > >> 
> > >> For TDX, this completely bypasses the cases where the data is prepopulated and TDX can't handle it cleanly.  For SEV, it bypasses a situation in which data might be written to the memory before we find out whether that data will be unreclaimable or unmovable.
> > >
> > > This sounds a more strict rule to avoid semantics unclear.
> > >
> > > So userspace needs to know what excatly happens for a 'bind' operation.
> > > This is different when binds to different technologies. E.g. for SEV, it
> > > may imply after this call, the memfile can be accessed (through mmap or
> > > what ever) from userspace, while for current TDX this should be not allowed.
> > 
> > I think this is actually a good thing.  While SEV, TDX, pKVM, etc achieve similar goals and have broadly similar ways of achieving them, they really are different, and having userspace be aware of the differences seems okay to me.
> > 
> > (Although I don't think that allowing userspace to mmap SEV shared pages is particularly wise -- it will result in faults or cache incoherence depending on the variant of SEV in use.)
> > 
> > >
> > > And I feel we still need a third flow/operation to indicate the
> > > completion of the initialization on the memfile before the guest's 
> > > first-time launch. SEV needs to check previous mmap-ed areas are munmap-ed
> > > and prevent future userspace access. After this point, then the memfile
> > > becomes truely private fd.
> > 
> > Even that is technology-dependent.  For TDX, this operation doesn't really exist.  For SEV, I'm not sure (I haven't read the specs in nearly enough detail).  For pKVM, I guess it does exist and isn't quite the same as a shared->private conversion.
> > 
> > Maybe this could be generalized a bit as an operation "measure and make private" that would be supported by the technologies for which it's useful.
> 
> Then I think we need callback instead of static flag field. Backing
> store implements this callback and consumers change the flags
> dynamically with this callback. This implements kind of state machine
> flow.
> 
> > 
> > 
> > >
> > >> 
> > >> 
> > >> ----------------------------------------------
> > >> 
> > >> Now I have a question, since I don't think anyone has really answered it: how does this all work with SEV- or pKVM-like technologies in which private and shared pages share the same address space?  I sounds like you're proposing to have a big memfile that contains private and shared pages and to use that same memfile as pages are converted back and forth.  IO and even real physical DMA could be done on that memfile.  Am I understanding correctly?
> > >
> > > For TDX case, and probably SEV as well, this memfile contains private memory
> > > only. But this design at least makes it possible for usage cases like
> > > pKVM which wants both private/shared memory in the same memfile and rely
> > > on other ways like mmap/munmap or mprotect to toggle private/shared instead
> > > of fallocate/hole punching.
> > 
> > Hmm.  Then we still need some way to get KVM to generate the correct SEV pagetables.  For TDX, there are private memslots and shared memslots, and they can overlap.  If they overlap and both contain valid pages at the same address, then the results may not be what the guest-side ABI expects, but everything will work.  So, when a single logical guest page transitions between shared and private, no change to the memslots is needed.  For SEV, this is not the case: everything is in one set of pagetables, and there isn't a natural way to resolve overlaps.
> 
> I don't see SEV has problem. Note for all the cases, both private/shared
> memory are in the same memslot. For a given GPA, if there is no private
> page, then shared page will be used to establish KVM pagetables, so this
> can guarantee there is no overlaps.
> 
> > 
> > If the memslot code becomes efficient enough, then the memslots could be fragmented.  Or the memfile could support private and shared data in the same memslot.  And if pKVM does this, I don't see why SEV couldn't also do it and hopefully reuse the same code.
> 
> For pKVM, that might be the case. For SEV, I don't think we require
> private/shared data in the same memfile. The same model that works for
> TDX should also work for SEV. Or maybe I misunderstood something here?
> 
> > 
> > >
> > >> 
> > >> If so, I think this makes sense, but I'm wondering if the actual memslot setup should be different.  For TDX, private memory lives in a logically separate memslot space.  For SEV and pKVM, it doesn't.  I assume the API can reflect this straightforwardly.
> > >
> > > I believe so. The flow should be similar but we do need pass different
> > > flags during the 'bind' to the backing store for different usages. That
> > > should be some new flags for pKVM but the callbacks (API here) between
> > > memfile_notifile and its consumers can be reused.
> > 
> > And also some different flag in the operation that installs the fd as a memslot?
> > 
> > >
> > >> 
> > >> And the corresponding TDX question: is the intent still that shared pages aren't allowed at all in a TDX memfile?  If so, that would be the most direct mapping to what the hardware actually does.
> > >
> > > Exactly. TDX will still use fallocate/hole punching to turn on/off the
> > > private page. Once off, the traditional shared page will become
> > > effective in KVM.
> > 
> > Works for me.
> > 
> > For what it's worth, I still think it should be fine to land all the TDX memfile bits upstream as long as we're confident that SEV, pKVM, etc can be added on without issues.
> > 
> > I think we can increase confidence in this by either getting one other technology's maintainers to get far enough along in the design to be confident
> 
> AFAICS, SEV shouldn't have any problem, But would like to see AMD people
> can comment. For pKVM, definitely need more work, but isn't totally
> undoable. Also would be good if pKVM people can comment.

Merging things incrementally sounds good to me if we can indeed get some
time to make sure it'll be a workable solution for other technologies.
I'm happy to prototype a pKVM extension to the proposed series to see if
there are any major blockers.

Thanks,
Quentin

