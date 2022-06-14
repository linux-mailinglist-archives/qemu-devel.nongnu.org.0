Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8AB54BC60
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 23:01:44 +0200 (CEST)
Received: from localhost ([::1]:37298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1DfR-0002II-OA
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 17:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1o1Ddo-0001Ev-0x
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:00:00 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:59938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1o1Ddl-0006IX-IJ
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 16:59:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5241861614
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 20:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C7DC385A9
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 20:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655240394;
 bh=9wZk9MRpUMnrGZbQcUwmuX/7Qeydrlw5OKktQernftE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sIwDRA2Vra2dKTCg1DafT8ciCfbsFmCy/4ggHE0w4hDjeAbryOsCZvHwd7s4LYrJC
 RASdznOBdSMKuP1HZx3N5LDRcRg5QZzJX/ZhmraXzSOpJV+Dnq1Fq8dNFlzAIPdlKj
 uozMksen4aiuIii2IV54Nm3xvOzJjHHbLOVgd6M8BPv8mQc01tS4EqZLTesOG9Ebcu
 X1LTLzO7C4Z9x3sS1MfNuors/XgMUqnnuflvEWXW3BZcA3JWBdxKrUGmnsBU1UYSw5
 gySRzGesBFaWCOLwCchPoQL+xtWWai64eXMIZX5iM0zl4ssRfXthevO9q8WhM/q44E
 Sq/WGvjZxKdfw==
Received: by mail-lf1-f50.google.com with SMTP id i29so15864469lfp.3
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 13:59:54 -0700 (PDT)
X-Gm-Message-State: AJIora84v9M1Z5OGUH6SiqekvyzCXt3YpCg3isEqLVVvYo/U2GWLbIzl
 5hRtJPsF/Iqd64g5DuRaoe+ZRH7pvDdFfDqMckMedA==
X-Google-Smtp-Source: AGRyM1sCbLW6pqrjCLadGc9nlr9/fXFl71CEbENKqHrt6kXBGBmrjtgceQq2RtPH/Uy7fk0amoBaU8MzH9G8H+xSOgs=
X-Received: by 2002:ac2:57c4:0:b0:479:7d52:a5a2 with SMTP id
 k4-20020ac257c4000000b004797d52a5a2mr4201442lfo.173.1655240392630; Tue, 14
 Jun 2022 13:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <CAGtprH_83CEC0U-cBR2FzHsxbwbGn0QJ87WFNOEet8sineOcbQ@mail.gmail.com>
 <20220607065749.GA1513445@chaop.bj.intel.com>
 <CAA03e5H_vOQS-qdZgacnmqP5T5jJLnEfm44yfRzJQ2KVu0Br+Q@mail.gmail.com>
 <20220608021820.GA1548172@chaop.bj.intel.com>
 <CAGtprH8xyf07jMN7ubTC__BvDj+z41uVGRiCJ7Rc5cv3KWg03w@mail.gmail.com>
 <YqJYEheLiGI4KqXF@google.com> <20220614072800.GB1783435@chaop.bj.intel.com>
 <CALCETrWw=Q=1AKW0Jcj3ZGscjyjDJXAjuxOnQx_sabQ6ZtS-wg@mail.gmail.com>
 <Yqjcx6u0KJcJuZfI@google.com>
In-Reply-To: <Yqjcx6u0KJcJuZfI@google.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 14 Jun 2022 13:59:41 -0700
X-Gmail-Original-Message-ID: <CALCETrUdGoZ2yUnNGbxJ-Xr3KD7QhTi-ddhS8AUMjFyJM5pDfA@mail.gmail.com>
Message-ID: <CALCETrUdGoZ2yUnNGbxJ-Xr3KD7QhTi-ddhS8AUMjFyJM5pDfA@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] KVM: mm: fd-based approach for supporting KVM
 guest private memory
To: Sean Christopherson <seanjc@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, Chao Peng <chao.p.peng@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>, Marc Orr <marcorr@google.com>, 
 kvm list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 x86 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, 
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>, 
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, 
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>, 
 David Hildenbrand <david@redhat.com>, aarcange@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>, 
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Jun 14, 2022 at 12:09 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, Jun 14, 2022, Andy Lutomirski wrote:
> > On Tue, Jun 14, 2022 at 12:32 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > >
> > > On Thu, Jun 09, 2022 at 08:29:06PM +0000, Sean Christopherson wrote:
> > > > On Wed, Jun 08, 2022, Vishal Annapurve wrote:
> > > >
> > > > One argument is that userspace can simply rely on cgroups to detect misbehaving
> > > > guests, but (a) those types of OOMs will be a nightmare to debug and (b) an OOM
> > > > kill from the host is typically considered a _host_ issue and will be treated as
> > > > a missed SLO.
> > > >
> > > > An idea for handling this in the kernel without too much complexity would be to
> > > > add F_SEAL_FAULT_ALLOCATIONS (terrible name) that would prevent page faults from
> > > > allocating pages, i.e. holes can only be filled by an explicit fallocate().  Minor
> > > > faults, e.g. due to NUMA balancing stupidity, and major faults due to swap would
> > > > still work, but writes to previously unreserved/unallocated memory would get a
> > > > SIGSEGV on something it has mapped.  That would allow the userspace VMM to prevent
> > > > unintentional allocations without having to coordinate unmapping/remapping across
> > > > multiple processes.
> > >
> > > Since this is mainly for shared memory and the motivation is catching
> > > misbehaved access, can we use mprotect(PROT_NONE) for this? We can mark
> > > those range backed by private fd as PROT_NONE during the conversion so
> > > subsequence misbehaved accesses will be blocked instead of causing double
> > > allocation silently.
>
> PROT_NONE, a.k.a. mprotect(), has the same vma downsides as munmap().
>
> > This patch series is fairly close to implementing a rather more
> > efficient solution.  I'm not familiar enough with hypervisor userspace
> > to really know if this would work, but:
> >
> > What if shared guest memory could also be file-backed, either in the
> > same fd or with a second fd covering the shared portion of a memslot?
> > This would allow changes to the backing store (punching holes, etc) to
> > be some without mmap_lock or host-userspace TLB flushes?  Depending on
> > what the guest is doing with its shared memory, userspace might need
> > the memory mapped or it might not.
>
> That's what I'm angling for with the F_SEAL_FAULT_ALLOCATIONS idea.  The issue,
> unless I'm misreading code, is that punching a hole in the shared memory backing
> store doesn't prevent reallocating that hole on fault, i.e. a helper process that
> keeps a valid mapping of guest shared memory can silently fill the hole.
>
> What we're hoping to achieve is a way to prevent allocating memory without a very
> explicit action from userspace, e.g. fallocate().

Ah, I misunderstood.  I thought your goal was to mmap it and prevent
page faults from allocating.

It is indeed the case (and has been since before quite a few of us
were born) that a hole in a sparse file is logically just a bunch of
zeros.  A way to make a file for which a hole is an actual hole seems
like it would solve this problem nicely.  It could also be solved more
specifically for KVM by making sure that the private/shared mode that
userspace programs is strict enough to prevent accidental allocations
-- if a GPA is definitively private, shared, neither, or (potentially,
on TDX only) both, then a page that *isn't* shared will never be
accidentally allocated by KVM.  If the shared backing is not mmapped,
it also won't be accidentally allocated by host userspace on a stray
or careless write.


--Andy

