Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBAD546D29
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 21:20:30 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkBI-0003c2-L4
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 15:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nzk9g-0002rq-Og
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:18:48 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:48286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1nzk9e-0003qT-M1
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:18:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 855196223F
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 19:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27413C341CA
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654888720;
 bh=hM5nW1VA3yu5jpO3mlOUoDJaWYFKk3W0xm89jLGspjI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HhH/LtWGsBwB06n1CnPo9lhK0VtlQ6R1OeUxR4n65mwZeBEFV6sMuVM/FQ4mWjKfC
 U0buD2yynVGlZgaWK2yhy6sCYPwzRpoLMXXRNC35AXp8WPmbjWScn8eeu+b4znMsyo
 SBLsipBoAgnNOKj9AmZY2W5Wf3H0Kmmm5b4EHejPbftkHKC+R73iWdRMndn/qU7LdN
 mi8mlFucHHdXR3vU1iUTLqfm10BRj29AjwGU2+vcfzCq9fPpj35CHw9WzOEvI4Yn5B
 f5qeWPoNNahJsN/WYeZcsckWm0SeiIae32rB0ZzDFftWrWFELWEKh7GyQQVeErl1tH
 OVUa6I1o1xhTA==
Received: by mail-ej1-f45.google.com with SMTP id s12so48021917ejx.3
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 12:18:40 -0700 (PDT)
X-Gm-Message-State: AOAM532kFXHmQLMq7EKsCAggYUxIAz9fr+kLcqLIMZbX2H/v3+f/kVTq
 I7glKMl1XTed2Q3+5Klclpj+FvM1rQLuaIo2ZB5gLA==
X-Google-Smtp-Source: ABdhPJwexJxeTadU2a/HS+Q0PaTCtU7UH0lxqqpyQzdJR6JkeVtaY0mkRVT4jHiiW5JTPVMgfQPUbTO0E50JluvSE3Y=
X-Received: by 2002:a17:906:25d8:b0:6fe:9f11:3906 with SMTP id
 n24-20020a17090625d800b006fe9f113906mr40977072ejb.538.1654888718314; Fri, 10
 Jun 2022 12:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com>
 <YkyEaYiL0BrDYcZv@google.com> <20220422105612.GB61987@chaop.bj.intel.com>
 <3b99f157-0f30-4b30-8399-dd659250ab8d@www.fastmail.com>
 <20220425134051.GA175928@chaop.bj.intel.com>
 <27616b2f-1eff-42ff-91e0-047f531639ea@www.fastmail.com>
 <YmcFAJEJmmtYa+82@google.com>
In-Reply-To: <YmcFAJEJmmtYa+82@google.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Fri, 10 Jun 2022 12:18:25 -0700
X-Gmail-Original-Message-ID: <CALCETrU_BdaYcPgVcjj4o9zFPyvU9oyjCCtjKTbSSgeL0aZaGQ@mail.gmail.com>
Message-ID: <CALCETrU_BdaYcPgVcjj4o9zFPyvU9oyjCCtjKTbSSgeL0aZaGQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
To: Sean Christopherson <seanjc@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Chao Peng <chao.p.peng@linux.intel.com>,
 Quentin Perret <qperret@google.com>, Steven Price <steven.price@arm.com>, 
 kvm list <kvm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, Linux API <linux-api@vger.kernel.org>, 
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, 
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, 
 Vishal Annapurve <vannapurve@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, 
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>, 
 David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=luto@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 1:31 PM Sean Christopherson <seanjc@google.com> wro=
te:
>
> On Mon, Apr 25, 2022, Andy Lutomirski wrote:
> >
> >
> > On Mon, Apr 25, 2022, at 6:40 AM, Chao Peng wrote:
> > > On Sun, Apr 24, 2022 at 09:59:37AM -0700, Andy Lutomirski wrote:
> > >>
> >
> > >>
> > >> 2. Bind the memfile to a VM (or at least to a VM technology).  Now i=
t's in
> > >> the initial state appropriate for that VM.
> > >>
> > >> For TDX, this completely bypasses the cases where the data is prepop=
ulated
> > >> and TDX can't handle it cleanly.
>
> I believe TDX can handle this cleanly, TDH.MEM.PAGE.ADD doesn't require t=
hat the
> source and destination have different HPAs.  There's just no pressing nee=
d to
> support such behavior because userspace is highly motivated to keep the i=
nitial
> image small for performance reasons, i.e. burning a few extra pages while=
 building
> the guest is a non-issue.

Following up on this, rather belatedly.  After re-reading the docs,
TDX can populate guest memory using TDH.MEM.PAGE.ADD, but see Intel=C2=AE
TDX Module Base Spec v1.5, section 2.3, step D.4 substeps 1 and 2
here:

https://www.intel.com/content/dam/develop/external/us/en/documents/intel-td=
x-module-1.5-base-spec-348549001.pdf

For each TD page:

1. The host VMM specifies a TDR as a parameter and calls the
TDH.MEM.PAGE.ADD function. It copies the contents from the TD
image page into the target TD page which is encrypted with the TD
ephemeral key. TDH.MEM.PAGE.ADD also extends the TD
measurement with the page GPA.

2. The host VMM extends the TD measurement with the contents of
the new page by calling the TDH.MR.EXTEND function on each 256-
byte chunk of the new TD page.

So this is a bit like SGX.  There is a specific series of operations
that have to be done in precisely the right order to reproduce the
intended TD measurement.  Otherwise the guest will boot and run until
it tries to get a report and then it will have a hard time getting
anyone to believe its report.

So I don't think the host kernel can get away with host userspace just
providing pre-populated memory.  Userspace needs to tell the host
kernel exactly what sequence of adds, extends, etc to perform and in
what order, and the host kernel needs to do precisely what userspace
asks it to do.  "Here's the contents of memory" doesn't cut it unless
the tooling that builds the guest image matches the exact semantics
that the host kernel provides.

--Andy

