Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC350531195
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:26:12 +0200 (CEST)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9wh-0005ng-GT
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nt9tJ-0002pP-5j
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:22:41 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nt9tG-0002ci-Vw
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:22:40 -0400
Received: by mail-pl1-x62b.google.com with SMTP id 10so9970597plj.0
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=alhazuhH7tTd8Xd528vjQZhEVIVEKAWK4HCLXZDJ228=;
 b=FY+eaeQn0QSUHoJZ1pIFqwwhEngjriob9gD9u/B6V7NGsK628vXfe9OaR7V+ivQcG7
 oUq06I8eW7HBIntiAx8hVuSzVcI4o08UOO8rnlQzh+q3k/m/WbEVxbdOUyjyOCwOE937
 A487RWEuR49BgO5YHvoZXJYj8YibiJbikPaMzwoJU6XjJBkkBT4zo6LA0wUkZ+xe+wVv
 u/5J4TUl1BPNy5wFyQRJj+jpLzLFkAgws5kcfohn0eOOtgmxkfKFRb1vx4U7mxSjIxMa
 n0m0TkhMSmH3C563bTiPkClwsxB2JnwTw2UxQ027A0jTP2RpKPm9+cBoqaLh2XhDQs3i
 KbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=alhazuhH7tTd8Xd528vjQZhEVIVEKAWK4HCLXZDJ228=;
 b=O6d7Uont4fJ1cHJ3u6s7rSkX3+3SnNeC3/rVsN8yB/2D5zbeNSU5n+RRibMibDJ8hU
 7ZlRbM/cbw3EZpZzzvhFuCZ4Ab5eYXx6xzKd/SXprqCvk+bWU+ey91jspRrk9zSzmNiu
 hLoVA9vJv4Z28JrI/noT3vQwMu0lO9KNsIy5ZgHcZZO0ctGmQD2wwHh18ksCwUGeAyDE
 5iu2GaryHaF1ceEGFT0njaGN5RthdQkvSFrBUhUHeUZYi50nnMUpOV+U9jokOVnoiRba
 VcN7Fw83cx8UFHW1syrG660Ii7rSpx6XB6UsWc7lLC8rwyNK/WgbyvvMaDukYCP8FOIK
 QlqA==
X-Gm-Message-State: AOAM5300ngzrZzp7re28Z0+4/shLF2Q8GgYHATVfzWQupAyX4w34tZza
 0SVcdSdjvBTpNy49Ro1rAcOxHQ==
X-Google-Smtp-Source: ABdhPJxMnuGcLeXNmgvjCrimkV9tdjgzm2jljb8i5xr1qPYZt2WYeIGCUhIkYo7TSWGZfmskKdgJKg==
X-Received: by 2002:a17:90b:3884:b0:1df:db8a:1fcf with SMTP id
 mu4-20020a17090b388400b001dfdb8a1fcfmr24013896pjb.217.1653319356845; 
 Mon, 23 May 2022 08:22:36 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 q22-20020a170902789600b0016230703ca3sm1655647pll.231.2022.05.23.08.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 08:22:36 -0700 (PDT)
Date: Mon, 23 May 2022 15:22:32 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
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
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 4/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <YoumuHUmgM6TH20S@google.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-5-chao.p.peng@linux.intel.com>
 <8840b360-cdb2-244c-bfb6-9a0e7306c188@kernel.org>
 <YofeZps9YXgtP3f1@google.com>
 <20220523132154.GA947536@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523132154.GA947536@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=seanjc@google.com; helo=mail-pl1-x62b.google.com
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

On Mon, May 23, 2022, Chao Peng wrote:
> On Fri, May 20, 2022 at 06:31:02PM +0000, Sean Christopherson wrote:
> > On Fri, May 20, 2022, Andy Lutomirski wrote:
> > > The alternative would be to have some kind of separate table or bitmap (part
> > > of the memslot?) that tells KVM whether a GPA should map to the fd.
> > > 
> > > What do you all think?
> > 
> > My original proposal was to have expolicit shared vs. private memslots, and punch
> > holes in KVM's memslots on conversion, but due to the way KVM (and userspace)
> > handle memslot updates, conversions would be painfully slow.  That's how we ended
> > up with the current propsoal.
> > 
> > But a dedicated KVM ioctl() to add/remove shared ranges would be easy to implement
> > and wouldn't necessarily even need to interact with the memslots.  It could be a
> > consumer of memslots, e.g. if we wanted to disallow registering regions without an
> > associated memslot, but I think we'd want to avoid even that because things will
> > get messy during memslot updates, e.g. if dirty logging is toggled or a shared
> > memory region is temporarily removed then we wouldn't want to destroy the tracking.
> 
> Even we don't tight that to memslots, that info can only be effective
> for private memslot, right? Setting this ioctl to memory ranges defined
> in a traditional non-private memslots just makes no sense, I guess we can
> comment that in the API document.

Hrm, applying it universally would be funky, e.g. emulated MMIO would need to be
declared "shared".  But, applying it selectively would arguably be worse, e.g.
letting userspace map memory into the guest as shared for a region that's registered
as private...

On option to that mess would be to make memory shared by default, and so userspace
must declare regions that are private.  Then there's no weirdness with emulated MMIO
or "legacy" memslots.

On page fault, KVM does a lookup to see if the GPA is shared or private.  If the
GPA is private, but there is no memslot or the memslot doesn't have a private fd,
KVM exits to userspace.  If there's a memslot with a private fd, the shared/private
flag is used to resolve the 

And to handle the ioctl(), KVM can use kvm_zap_gfn_range(), which will bump the
notifier sequence, i.e. force the page fault to retry if the GPA may have been
(un)registered between checking the type and acquiring mmu_lock.

> > I don't think we'd want to use a bitmap, e.g. for a well-behaved guest, XArray
> > should be far more efficient.
> 
> What about the mis-behaved guest? I don't want to design for the worst
> case, but people may raise concern on the attack from such guest.

That's why cgroups exist.  E.g. a malicious/broken L1 can similarly abuse nested
EPT/NPT to generate a large number of shadow page tables.

> > One benefit to explicitly tracking this in KVM is that it might be useful for
> > software-only protected VMs, e.g. KVM could mark a region in the XArray as "pending"
> > based on guest hypercalls to share/unshare memory, and then complete the transaction
> > when userspace invokes the ioctl() to complete the share/unshare.
> 
> OK, then this can be another field of states/flags/attributes. Let me
> dig up certain level of details:
> 
> First, introduce below KVM ioctl
> 
> KVM_SET_MEMORY_ATTR

Actually, if the semantics are that userspace declares memory as private, then we
can reuse KVM_MEMORY_ENCRYPT_REG_REGION and KVM_MEMORY_ENCRYPT_UNREG_REGION.  It'd
be a little gross because we'd need to slightly redefine the semantics for TDX, SNP,
and software-protected VM types, e.g. the ioctls() currently require a pre-exisitng
memslot.  But I think it'd work...

I'll think more on this...

