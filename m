Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA4054CB62
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:31:57 +0200 (CEST)
Received: from localhost ([::1]:36848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1U3n-0002wl-Tz
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1o1U1p-0001Zt-Jt
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:29:53 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:39825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1o1U1n-0008Q1-PY
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:29:53 -0400
Received: by mail-pf1-x434.google.com with SMTP id y196so11609064pfb.6
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=urXLCEo0HdMiwrT9/lHPLDvk+tFr+S8kFKoTasWYgTM=;
 b=jE8+1EoaVPLQAQgJuF6uSHsVQUNEYiULaZEf4qWJ+FDCtBcy5wU+1PuRU/qTw6mXuJ
 rhkDSC1GoM3r6gP1XqDzyFKdRxVJyQscQceF46fTmrMh4tpJ7/3OD4E0UUUL4FXaE4E4
 HLsY4nWxsZ1bLbc4mtfRzI75UcR7ige6egZvCSqqgKpyeTsqtkTZjDQiW2mEf6TP1C0u
 784mpZz2YhCQYjeTdJsTJu7oJeXZ7GHllZjsJApUFHo2QiJHGuFpB3Xi7l8+I0pC+m8X
 WUI+8LcLsPMDaqunWg8z0EiW4EPIpYE086RJe+7JyYOWlUAXkMPBTz0xEA+GhbwuK97s
 EpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=urXLCEo0HdMiwrT9/lHPLDvk+tFr+S8kFKoTasWYgTM=;
 b=XoOh5Fh4Lg9SeelXlQ2hotwo0MJ+HPzvpTriiixmvk5PYp1360K3FtH5Mljou2Cfy7
 JiX9PcgxCPorLHFkPtqoCuhnKiyAZ8wYO8xKzmhK5byfPCjUvMu0/e1GjQwVg2WdsY2C
 iCz1rk+Igw7XshHRvFQAMpLWN5f5uTFSH64YDt13/IrHv7z3W5941V/Funb3WlJ54TVN
 QvdME3K1gfymkWdW31c5m6NUS8AwfDks2ZBdakYjK5b9woXukd8UiQQu+mczTuCBod7i
 C/B/20V6giSKgBi3sx7huOej68Nue1XPNy68R0JoPIDCuZ48SA5mQBVkJY5WxPIy+xG9
 ZHhw==
X-Gm-Message-State: AJIora+JxofnZAWDbNwBd10swNMcfOOCWJJYKMELSPRToB2NpU7fnpuJ
 gNEKekfH/Lek29cFzJEgltnKLQ==
X-Google-Smtp-Source: AGRyM1tbE6e2B2i42MyE6StE9nppc07YDmrFHDgu8iNlTHFWW5xo4NNjzQzQb9yFXGjB6QHFLP8hJw==
X-Received: by 2002:a63:e1c:0:b0:3fd:f319:df7b with SMTP id
 d28-20020a630e1c000000b003fdf319df7bmr75509pgl.135.1655303389770; 
 Wed, 15 Jun 2022 07:29:49 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com.
 [35.230.65.123]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b0015eb200cc00sm9366660plg.138.2022.06.15.07.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 07:29:49 -0700 (PDT)
Date: Wed, 15 Jun 2022 14:29:45 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>,
 Vishal Annapurve <vannapurve@google.com>,
 Marc Orr <marcorr@google.com>, kvm list <kvm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Dave Hansen <dave.hansen@intel.com>,
 Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 0/8] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <Yqns2ar0TND4RP9P@google.com>
References: <20220607065749.GA1513445@chaop.bj.intel.com>
 <CAA03e5H_vOQS-qdZgacnmqP5T5jJLnEfm44yfRzJQ2KVu0Br+Q@mail.gmail.com>
 <20220608021820.GA1548172@chaop.bj.intel.com>
 <CAGtprH8xyf07jMN7ubTC__BvDj+z41uVGRiCJ7Rc5cv3KWg03w@mail.gmail.com>
 <YqJYEheLiGI4KqXF@google.com>
 <20220614072800.GB1783435@chaop.bj.intel.com>
 <CALCETrWw=Q=1AKW0Jcj3ZGscjyjDJXAjuxOnQx_sabQ6ZtS-wg@mail.gmail.com>
 <Yqjcx6u0KJcJuZfI@google.com>
 <CALCETrUdGoZ2yUnNGbxJ-Xr3KD7QhTi-ddhS8AUMjFyJM5pDfA@mail.gmail.com>
 <20220615091759.GB1823790@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615091759.GB1823790@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=seanjc@google.com; helo=mail-pf1-x434.google.com
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

On Wed, Jun 15, 2022, Chao Peng wrote:
> On Tue, Jun 14, 2022 at 01:59:41PM -0700, Andy Lutomirski wrote:
> > On Tue, Jun 14, 2022 at 12:09 PM Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Tue, Jun 14, 2022, Andy Lutomirski wrote:
> > > > This patch series is fairly close to implementing a rather more
> > > > efficient solution.  I'm not familiar enough with hypervisor userspace
> > > > to really know if this would work, but:
> > > >
> > > > What if shared guest memory could also be file-backed, either in the
> > > > same fd or with a second fd covering the shared portion of a memslot?
> > > > This would allow changes to the backing store (punching holes, etc) to
> > > > be some without mmap_lock or host-userspace TLB flushes?  Depending on
> > > > what the guest is doing with its shared memory, userspace might need
> > > > the memory mapped or it might not.
> > >
> > > That's what I'm angling for with the F_SEAL_FAULT_ALLOCATIONS idea.  The issue,
> > > unless I'm misreading code, is that punching a hole in the shared memory backing
> > > store doesn't prevent reallocating that hole on fault, i.e. a helper process that
> > > keeps a valid mapping of guest shared memory can silently fill the hole.
> > >
> > > What we're hoping to achieve is a way to prevent allocating memory without a very
> > > explicit action from userspace, e.g. fallocate().
> > 
> > Ah, I misunderstood.  I thought your goal was to mmap it and prevent
> > page faults from allocating.

I don't think you misunderstood, that's also one of the goals.  The use case is
that multiple processes in the host mmap() guest memory, and we'd like to be able
to punch a hole without having to rendezvous with all processes and also to prevent
an unintentional re-allocation.

> I think we still need the mmap, but want to prevent allocating when
> userspace touches previously mmaped area that has never filled the page.

Yes, or if a chunk was filled at some point but then was removed via PUNCH_HOLE.

> I don't have clear answer if other operations like read/write should be
> also prevented (probably yes). And only after an explicit fallocate() to
> allocate the page these operations would act normally.

I always forget about read/write.  I believe reads should be ok, the semantics of
holes are that they return zeros, i.e. can use ZERO_PAGE() and not allocate a new
backing page.  Not sure what to do about writes though.  Allocating on direct writes
might be ok for our use case, but that could also result in a rather wierd API.

> > It is indeed the case (and has been since before quite a few of us
> > were born) that a hole in a sparse file is logically just a bunch of
> > zeros.  A way to make a file for which a hole is an actual hole seems
> > like it would solve this problem nicely.  It could also be solved more
> > specifically for KVM by making sure that the private/shared mode that
> > userspace programs is strict enough to prevent accidental allocations
> > -- if a GPA is definitively private, shared, neither, or (potentially,
> > on TDX only) both, then a page that *isn't* shared will never be
> > accidentally allocated by KVM.
> 
> KVM is clever enough to not allocate since it knows a GPA is shared or
> not. This case it's the host userspace that can cause the allocating and
> is too complex to check on every access from guest.

Yes, KVM is not in the picture at all.  KVM won't trigger allocation, but KVM also
is not in a position to prevent userspace from touching memory.

> > If the shared backing is not mmapped,
> > it also won't be accidentally allocated by host userspace on a stray
> > or careless write.
> 
> As said above, mmap is still prefered, otherwise too many changes are
> needed for usespace VMM.

Forcing userspace to change doesn't bother me too much, the biggest concern is
having to take mmap_lock for write in a per-host process.

