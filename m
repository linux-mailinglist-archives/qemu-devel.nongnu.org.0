Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42354588FCE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 17:53:12 +0200 (CEST)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJGgJ-0006wh-AZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 11:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oJGei-00043U-T2
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 11:51:32 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oJGeg-0001CJ-Uh
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 11:51:32 -0400
Received: by mail-pf1-x429.google.com with SMTP id w185so16838095pfb.4
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=nQ/PVBdgsWcgdstxLD2wNHSv0oGBQkwDPYWARWt/BZk=;
 b=UqknoREV8mEy68zQSBU2lbsWwGYJTvDQqRAleSTHvyIJ9duv+KK5mptQRpjJ4+gqwT
 NxHvbORsCprsREjtYZh1buxFH+7EmVZpQLTV3+hYE+0dFCTXjJEnC3b96X8evdOb5AvE
 k4iA+m9355bZUR/pB9mbPpAtkahMb5UJRUeDN+StvBc9wiJ05Fv5gikb+f1UBTkXZ9Wb
 T3uxjZMlPupTU7GmMz1t23PVXrEuoowTqTk0zL5Hyru097c+kpaUrTX0+tZJiyZrRiOO
 fkDHAGmtMrFQ7XABTAs6+c7PxqPyw3Ku9zCqwf6gSHK8zwJF3t1nJjjVSt++BhLBcJPe
 c9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=nQ/PVBdgsWcgdstxLD2wNHSv0oGBQkwDPYWARWt/BZk=;
 b=oqdhq3kUMcnjI2N1z6W1MaSHjC3m4yUHSKRrnFZf5RAnulo8wa6WGLHPSpofJ+czti
 JUGlj/QXvV2k1o+kpBHPZshijvz5cVOGH70V02gZo7y3MRJhyVEGRaKAz/ujB+wk1UKm
 ToknrOqs5HK3aaV8Pwo8rvzryvLmsx0XU00a9aGLx+miO12/4VEE8tRWlktsi4Y2k97h
 e8t4iXiZd0BYCb32a8gTvtXYz9txR0QwvOUJxZpkFsI6eX3eg9TCFxf/dx/D0OpyNm+E
 hzUOV+U/S80O0jYYuoa9uXyOn/8hgOkAuC2Fu8pbHPaTgVbesm3Jh+RJICok7blk0xLn
 uyCw==
X-Gm-Message-State: AJIora9dwF9/eKAZCc2ii3IgxbR5QemrtM1XkU2OBZxuQLooau+z52zC
 pXTOEKAmk2Q44TgZAW982wZfEw==
X-Google-Smtp-Source: AGRyM1uDNFXI+kxeHIg+ULHnKLrtLVM3YAsuBREDsfvLxR8PwpGaMsjug1I+UmNiUr91nJEzTB4ZRg==
X-Received: by 2002:a63:d014:0:b0:41a:13b3:69d9 with SMTP id
 z20-20020a63d014000000b0041a13b369d9mr21261764pgf.202.1659541889184; 
 Wed, 03 Aug 2022 08:51:29 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 x187-20020a6231c4000000b0052c4b3e6f6asm13535782pfx.97.2022.08.03.08.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 08:51:28 -0700 (PDT)
Date: Wed, 3 Aug 2022 15:51:24 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Wei Wang <wei.w.wang@linux.intel.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 11/14] KVM: Register/unregister the guest private
 memory regions
Message-ID: <YuqZfPvRo+3GvLF1@google.com>
References: <d0fd229d-afa6-c66d-3e55-09ac5877453e@amd.com>
 <YtgrkXqP/GIi9ujZ@google.com>
 <45ae9f57-d595-f202-abb5-26a03a2ca131@linux.intel.com>
 <20220721092906.GA153288@chaop.bj.intel.com>
 <YtmT2irvgInX1kPp@google.com>
 <20220725130417.GA304216@chaop.bj.intel.com>
 <YuQ64RgWqdoAAGdY@google.com> <Yuh0ikhoh+tCK6VW@google.com>
 <YulTH7bL4MwT5v5K@google.com>
 <20220803094827.GA607465@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220803094827.GA607465@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=seanjc@google.com; helo=mail-pf1-x429.google.com
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

On Wed, Aug 03, 2022, Chao Peng wrote:
> On Tue, Aug 02, 2022 at 04:38:55PM +0000, Sean Christopherson wrote:
> > On Tue, Aug 02, 2022, Sean Christopherson wrote:
> > > I think we should avoid UNMAPPABLE even on the KVM side of things for the core
> > > memslots functionality and instead be very literal, e.g.
> > > 
> > > 	KVM_HAS_FD_BASED_MEMSLOTS
> > > 	KVM_MEM_FD_VALID
> > > 
> > > We'll still need KVM_HAS_USER_UNMAPPABLE_MEMORY, but it won't be tied directly to
> > > the memslot.  Decoupling the two thingis will require a bit of extra work, but the
> > > code impact should be quite small, e.g. explicitly query and propagate
> > > MEMFILE_F_USER_INACCESSIBLE to kvm_memory_slot to track if a memslot can be private.
> > > And unless I'm missing something, it won't require an additional memslot flag.
> > > The biggest oddity (if we don't also add KVM_MEM_PRIVATE) is that KVM would
> > > effectively ignore the hva for fd-based memslots for VM types that don't support
> > > private memory, i.e. userspace can't opt out of using the fd-based backing, but that
> > > doesn't seem like a deal breaker.
> 
> I actually love this idea. I don't mind adding extra code for potential
> usage other than confidential VMs if we can have a workable solution for
> it.
> 
> > 
> > Hrm, but basing private memory on top of a generic FD_VALID would effectively require
> > shared memory to use hva-based memslots for confidential VMs.  That'd yield a very
> > weird API, e.g. non-confidential VMs could be backed entirely by fd-based memslots,
> > but confidential VMs would be forced to use hva-based memslots.
> 
> It would work if we can treat userspace_addr as optional for
> KVM_MEM_FD_VALID, e.g. userspace can opt in to decide whether needing
> the mappable part or not for a regular VM and we can enforce KVM for
> confidential VMs. But the u64 type of userspace_addr doesn't allow us to
> express a 'null' value so sounds like we will end up needing another
> flag anyway.
> 
> In concept, we could have three cofigurations here:
>   1. hva-only: without any flag and use userspace_addr;
>   2. fd-only:  another new flag is needed and use fd/offset;
>   3. hva/fd mixed: both userspace_addr and fd/offset is effective.
>      KVM_MEM_PRIVATE is a subset of it for confidential VMs. Not sure
>      regular VM also wants this.

My mental model breaks things down slightly differently, though the end result is
more or less the same. 

After this series, there will be two types of memory: private and "regular" (I'm
trying to avoid "shared").  "Regular" memory is always hva-based (userspace_addr),
and private always fd-based (fd+offset).

In the future, if we want to support fd-based memory for "regular" memory, then
as you said we'd need to add a new flag, and a new fd+offset pair.

At that point, we'd have two new (relatively to current) flags:

  KVM_MEM_PRIVATE_FD_VALID
  KVM_MEM_FD_VALID

along with two new pairs of fd+offset (private_* and "regular").  Mapping those
to your above list:
  
  1.  Neither *_FD_VALID flag set.
  2a. Both PRIVATE_FD_VALID and FD_VALID are set
  2b. FD_VALID is set and the VM doesn't support private memory
  3.  Only PRIVATE_FD_VALID is set (which private memory support in the VM).

Thus, "regular" VMs can't have a mix in a single memslot because they can't use
private memory.

> There is no direct relationship between unmappable and fd-based since
> even fd-based can also be mappable for regular VM?

Yep.

> > Ignore this idea for now.  If there's an actual use case for generic fd-based memory
> > then we'll want a separate flag, fd, and offset, i.e. that support could be added
> > independent of KVM_MEM_PRIVATE.
> 
> If we ignore this idea now (which I'm also fine), do you still think we
> need change KVM_MEM_PRIVATE to KVM_MEM_USER_UNMAPPBLE?

Hmm, no.  After working through this, I think it's safe to say KVM_MEM_USER_UNMAPPABLE
is bad name because we could end up with "regular" memory that's backed by an
inaccessible (unmappable) file.

One alternative would be to call it KVM_MEM_PROTECTED.  That shouldn't cause
problems for the known use of "private" (TDX and SNP), and it gives us a little
wiggle room, e.g. if we ever get a use case where VMs can share memory that is
otherwise protected.

That's a pretty big "if" though, and odds are good we'd need more memslot flags and
fd+offset pairs to allow differentiating "private" vs. "protected-shared" without
forcing userspace to punch holes in memslots, so I don't know that hedging now will
buy us anything.

So I'd say that if people think KVM_MEM_PRIVATE brings additional and meaningful
clarity over KVM_MEM_PROTECTECD, then lets go with PRIVATE.  But if PROTECTED is
just as good, go with PROTECTED as it gives us a wee bit of wiggle room for the
future.

Note, regardless of what name we settle on, I think it makes to do the
KVM_PRIVATE_MEM_SLOTS => KVM_INTERNAL_MEM_SLOTS rename.

