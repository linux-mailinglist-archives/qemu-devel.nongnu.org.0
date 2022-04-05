Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1344F3D1A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 20:04:38 +0200 (CEST)
Received: from localhost ([::1]:49296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbnXg-0003CP-KW
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 14:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nbnWd-0002Su-Vm
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 14:03:32 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nbnWc-00045B-4o
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 14:03:31 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 ku13-20020a17090b218d00b001ca8fcd3adeso3361138pjb.2
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=U3PyY0pRKQhXeOMKJejZ2jWEMHgtC5U/1t6Griz2ZtE=;
 b=KGXUBKKkDKDhZlvZKiQELbSWKwFyjZ9pqbjywy++hvUawyC+vx+Kiwb6Gb6jEV0Wuc
 giwl5qnSM5u8wdE1F5+llR4K2Ticwza1m/ioW1C0ItJqonPtmvm5nhpHrTL3N6QT1Rl3
 Wtn49OopVnhw8g8P+PKXrUXFRKcYdC8fjuouVVIXctNCy1B+qGpT4pX2jNYpbQ1t2mP6
 xMe4g7fYtlOfWMZCvSnpCUHEZXd84dkEWXSH6ZD1YzTcBCMO32gius56GNlGsSmncOvV
 KQlOe+jigYhK1S2TKkrRmuV21s9fTFFu+nLTpzm/DTIX7AvACXAolik1vLnEB78gFwNe
 bYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U3PyY0pRKQhXeOMKJejZ2jWEMHgtC5U/1t6Griz2ZtE=;
 b=pqqH8Gqh08SKr/c/BcYbTZfT/0oAvVAZIaXZ2+ZqeTHTKk2/R+zSSU0JGeRr5f5rP7
 xohDiGyb0UJcgPqCKBttOdYwdBAQZs+Yrh4vPZEhv9ReRJDCJZRlwq27EWqyMreHojsA
 4BKzydzvS0EcKLdK6mY4MP06HpQVMkfDb924I4J3U7aOirgQnXitCFVb29i9PVt+WvJY
 ghv7gkLcxCjQ3KdATNtucQRF1+0yYvL327whew1mujJaX51ClRUuaTUuBEVd8WQqDjMH
 vOMxAKBQJQ67ZSNBC8RKeYFi7hEWNalfG8ds8kjuwwNOm4P8eOe2phhV+nJQzXP8QiCq
 ztKQ==
X-Gm-Message-State: AOAM532WfmRxQenS5Sqto/ZCQhcaxePOVn9KDrmsWp2dElQTSWdzOGmH
 9axCuk8bw/PCfAhyiLVtwT/YSQ==
X-Google-Smtp-Source: ABdhPJyStH5/Nz6FqwbLd9JjuWL5wIJ/TCBBrc+CUyEhlKkOsXFCG0zdV80i6DTnhSTJUvObFVL14A==
X-Received: by 2002:a17:903:288:b0:156:a6b5:80d4 with SMTP id
 j8-20020a170903028800b00156a6b580d4mr4934454plr.98.1649181806567; 
 Tue, 05 Apr 2022 11:03:26 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 d21-20020a056a0024d500b004fb0e7c7c3bsm17524046pfv.161.2022.04.05.11.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 11:03:25 -0700 (PDT)
Date: Tue, 5 Apr 2022 18:03:21 +0000
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
Message-ID: <YkyEaYiL0BrDYcZv@google.com>
References: <88620519-029e-342b-0a85-ce2a20eaf41b@arm.com>
 <YkQzfjgTQaDd2E2T@google.com> <YkSaUQX89ZEojsQb@google.com>
 <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ykwbqv90C7+8K+Ao@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1035.google.com
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

On Tue, Apr 05, 2022, Quentin Perret wrote:
> On Monday 04 Apr 2022 at 15:04:17 (-0700), Andy Lutomirski wrote:
> > >>  - it can be very useful for protected VMs to do shared=>private
> > >>    conversions. Think of a VM receiving some data from the host in a
> > >>    shared buffer, and then it wants to operate on that buffer without
> > >>    risking to leak confidential informations in a transient state. In
> > >>    that case the most logical thing to do is to convert the buffer back
> > >>    to private, do whatever needs to be done on that buffer (decrypting a
> > >>    frame, ...), and then share it back with the host to consume it;
> > >
> > > If performance is a motivation, why would the guest want to do two
> > > conversions instead of just doing internal memcpy() to/from a private
> > > page?  I would be quite surprised if multiple exits and TLB shootdowns is
> > > actually faster, especially at any kind of scale where zapping stage-2
> > > PTEs will cause lock contention and IPIs.
> > 
> > I don't know the numbers or all the details, but this is arm64, which is a
> > rather better architecture than x86 in this regard.  So maybe it's not so
> > bad, at least in very simple cases, ignoring all implementation details.
> > (But see below.)  Also the systems in question tend to have fewer CPUs than
> > some of the massive x86 systems out there.
> 
> Yep. I can try and do some measurements if that's really necessary, but
> I'm really convinced the cost of the TLBI for the shared->private
> conversion is going to be significantly smaller than the cost of memcpy
> the buffer twice in the guest for us.

It's not just the TLB shootdown, the VM-Exits aren't free.   And barring non-trivial
improvements to KVM's MMU, e.g. sharding of mmu_lock, modifying the page tables will
block all other updates and MMU operations.  Taking mmu_lock for read, should arm64
ever convert to a rwlock, is not an option because KVM needs to block other
conversions to avoid races.

Hmm, though batching multiple pages into a single request would mitigate most of
the overhead.

> There are variations of that idea: e.g. allow userspace to mmap the
> entire private fd but w/o taking a reference on pages mapped with
> PROT_NONE. And then the VMM can use mprotect() in response to
> share/unshare requests. I think Marc liked that idea as it keeps the
> userspace API closer to normal KVM -- there actually is a
> straightforward gpa->hva relation. Not sure how much that would impact
> the implementation at this point.
> 
> For the shared=>private conversion, this would be something like so:
> 
>  - the guest issues a hypercall to unshare a page;
> 
>  - the hypervisor forwards the request to the host;
> 
>  - the host kernel forwards the request to userspace;
> 
>  - userspace then munmap()s the shared page;
> 
>  - KVM then tries to take a reference to the page. If it succeeds, it
>    re-enters the guest with a flag of some sort saying that the share
>    succeeded, and the hypervisor will adjust pgtables accordingly. If
>    KVM failed to take a reference, it flags this and the hypervisor will
>    be responsible for communicating that back to the guest. This means
>    the guest must handle failures (possibly fatal).
> 
> (There are probably many ways in which we can optimize this, e.g. by
> having the host proactively munmap() pages it no longer needs so that
> the unshare hypercall from the guest doesn't need to exit all the way
> back to host userspace.)

...

> > Maybe there could be a special mode for the private memory fds in which
> > specific pages are marked as "managed by this fd but actually shared".
> > pread() and pwrite() would work on those pages, but not mmap().  (Or maybe
> > mmap() but the resulting mappings would not permit GUP.)

Unless I misunderstand what you intend by pread()/pwrite(), I think we'd need to
allow mmap(), otherwise e.g. uaccess from the kernel wouldn't work.

> > And transitioning them would be a special operation on the fd that is
> > specific to pKVM and wouldn't work on TDX or SEV.

To keep things feature agnostic (IMO, baking TDX vs SEV vs pKVM info into private-fd
is a really bad idea), this could be handled by adding a flag and/or callback into
the notifier/client stating whether or not it supports mapping a private-fd, and then
mapping would be allowed if and only if all consumers support/allow mapping.

> > Hmm.  Sean and Chao, are we making a bit of a mistake by making these fds
> > technology-agnostic?  That is, would we want to distinguish between a TDX
> > backing fd, a SEV backing fd, a software-based backing fd, etc?  API-wise
> > this could work by requiring the fd to be bound to a KVM VM instance and
> > possibly even configured a bit before any other operations would be
> > allowed.

I really don't want to distinguish between between each exact feature, but I've
no objection to adding flags/callbacks to track specific properties of the
downstream consumers, e.g. "can this memory be accessed by userspace" is a fine
abstraction.  It also scales to multiple consumers (see above).

