Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8157354BA21
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 21:11:29 +0200 (CEST)
Received: from localhost ([::1]:40134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Bwk-0003uM-4K
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 15:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1o1BuR-0002sv-W4
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 15:09:04 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1o1BuP-0006tA-V0
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 15:09:03 -0400
Received: by mail-pg1-x531.google.com with SMTP id 123so9335773pgb.5
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WxVFX8SQoTkO2asaGhNARNyU0t4WV/p9VWUwvDYpcsM=;
 b=Xh80bV+FmkQM9epsA7aMCOshN8wzgXzzNfcH1Mc5l2PMPe+NVyrmidG+ZAIomvJRtU
 RwgYBZBLNjvMpgnLGqwffyVKFtkt95EvQJE7V+yhNJd4WI+Y0tU/+mvZfD/c+ZQ5IwjW
 awNyTzTiwwpe/fFELOsgLdQ+96PwyMOQ36VM5zE678kFN78bKFVWurGuCW2jPter6rTJ
 UnK3MeTmvxnDOMbC1zWiS64QnXHMoJpqeZXS0bwZBWQpiEshgMr7JbhokFHwuNAu5XM4
 XGvYYWMpjtxj1AxQuoVI4g6+R6kOiDBnYQeRcjBoiYkH2ZASJ7TlFQcVFSnBSo6YMR1V
 KAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WxVFX8SQoTkO2asaGhNARNyU0t4WV/p9VWUwvDYpcsM=;
 b=gkh23+EL30pBJTAoZ3yl3BWUCbF/RehsAHADuwCw7ncSIeR7NfY3bL+TTYfstCn942
 yS3OjhFgjTZX5UTNGhVjsQeB2aQgkmq0xPuD1yJO1Q2ymDMlo2z7REIVlhCwCpRFwodl
 rbQ9dnaGFImYHLg+nJ+3CwSNobNFgc2a+A4IJkVNYojZWlPaYOlYRmwTmOoeYEUmy4G8
 edZnB1/pe/csX1ulE1Xmd8UoWNVFPdqq9tONeTRPDhCDUz/D2qPWDg/sJAXYKbw+8ZiR
 poeGsbuQbC2mM1Y5AuSxU0Bo0zmBLAoWmg1Q+v/vu3Su81tq6xooi9F6sKc7cURG4DBC
 ShNQ==
X-Gm-Message-State: AOAM5306vQFq95Mlvds6NqzY8S0BlHemRF8JmVYChUGwogaEA+s9FR0r
 2BL36KJEAu+bmzhKeflHj9FPaw==
X-Google-Smtp-Source: ABdhPJzHn2Ye3YjC05M4BzToAcQNR5uLK5arwJemtulnC/fJwq6gRuGbN+I9cWXJrKe2+YDZm5QL5w==
X-Received: by 2002:a05:6a00:1744:b0:51b:d4d5:f34 with SMTP id
 j4-20020a056a00174400b0051bd4d50f34mr6274754pfc.0.1655233739275; 
 Tue, 14 Jun 2022 12:08:59 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170902a50800b00161ac982b9esm7590467plq.185.2022.06.14.12.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 12:08:58 -0700 (PDT)
Date: Tue, 14 Jun 2022 19:08:55 +0000
From: Sean Christopherson <seanjc@google.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Chao Peng <chao.p.peng@linux.intel.com>,
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
Message-ID: <Yqjcx6u0KJcJuZfI@google.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <CAGtprH_83CEC0U-cBR2FzHsxbwbGn0QJ87WFNOEet8sineOcbQ@mail.gmail.com>
 <20220607065749.GA1513445@chaop.bj.intel.com>
 <CAA03e5H_vOQS-qdZgacnmqP5T5jJLnEfm44yfRzJQ2KVu0Br+Q@mail.gmail.com>
 <20220608021820.GA1548172@chaop.bj.intel.com>
 <CAGtprH8xyf07jMN7ubTC__BvDj+z41uVGRiCJ7Rc5cv3KWg03w@mail.gmail.com>
 <YqJYEheLiGI4KqXF@google.com>
 <20220614072800.GB1783435@chaop.bj.intel.com>
 <CALCETrWw=Q=1AKW0Jcj3ZGscjyjDJXAjuxOnQx_sabQ6ZtS-wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrWw=Q=1AKW0Jcj3ZGscjyjDJXAjuxOnQx_sabQ6ZtS-wg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=seanjc@google.com; helo=mail-pg1-x531.google.com
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

On Tue, Jun 14, 2022, Andy Lutomirski wrote:
> On Tue, Jun 14, 2022 at 12:32 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> >
> > On Thu, Jun 09, 2022 at 08:29:06PM +0000, Sean Christopherson wrote:
> > > On Wed, Jun 08, 2022, Vishal Annapurve wrote:
> > >
> > > One argument is that userspace can simply rely on cgroups to detect misbehaving
> > > guests, but (a) those types of OOMs will be a nightmare to debug and (b) an OOM
> > > kill from the host is typically considered a _host_ issue and will be treated as
> > > a missed SLO.
> > >
> > > An idea for handling this in the kernel without too much complexity would be to
> > > add F_SEAL_FAULT_ALLOCATIONS (terrible name) that would prevent page faults from
> > > allocating pages, i.e. holes can only be filled by an explicit fallocate().  Minor
> > > faults, e.g. due to NUMA balancing stupidity, and major faults due to swap would
> > > still work, but writes to previously unreserved/unallocated memory would get a
> > > SIGSEGV on something it has mapped.  That would allow the userspace VMM to prevent
> > > unintentional allocations without having to coordinate unmapping/remapping across
> > > multiple processes.
> >
> > Since this is mainly for shared memory and the motivation is catching
> > misbehaved access, can we use mprotect(PROT_NONE) for this? We can mark
> > those range backed by private fd as PROT_NONE during the conversion so
> > subsequence misbehaved accesses will be blocked instead of causing double
> > allocation silently.

PROT_NONE, a.k.a. mprotect(), has the same vma downsides as munmap().
 
> This patch series is fairly close to implementing a rather more
> efficient solution.  I'm not familiar enough with hypervisor userspace
> to really know if this would work, but:
> 
> What if shared guest memory could also be file-backed, either in the
> same fd or with a second fd covering the shared portion of a memslot?
> This would allow changes to the backing store (punching holes, etc) to
> be some without mmap_lock or host-userspace TLB flushes?  Depending on
> what the guest is doing with its shared memory, userspace might need
> the memory mapped or it might not.

That's what I'm angling for with the F_SEAL_FAULT_ALLOCATIONS idea.  The issue,
unless I'm misreading code, is that punching a hole in the shared memory backing
store doesn't prevent reallocating that hole on fault, i.e. a helper process that
keeps a valid mapping of guest shared memory can silently fill the hole.

What we're hoping to achieve is a way to prevent allocating memory without a very
explicit action from userspace, e.g. fallocate().

