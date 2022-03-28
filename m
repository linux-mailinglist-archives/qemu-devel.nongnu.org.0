Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7DE4E9E8E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 20:02:36 +0200 (CEST)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYthK-0004xu-IT
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 14:02:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1nYtfz-0004C8-NF
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:01:11 -0400
Received: from [2a00:1450:4864:20::433] (port=40515
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1nYtfu-0000MJ-Vu
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:01:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id d7so21516579wrb.7
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 11:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ytrSkwXUDSFcv9NwzDcZHJvhwX8Ip28tSIzF/72ZJ1Q=;
 b=VcyTOLVPq+V1OSY1Zl84llZUOW1+DiM07S87IWjY6+20V2jBdQ1vm+S2GV9qIJPtqv
 pLK4CJ9etgGbTHFOsHk97o/HxvnmIVI4mMk+EGHbRX6CJrIFhyvnSC6Rfimd+X/hl2uA
 a6RBgH4fTtSovkIx/LH5QsjPzVnFtvX03n05rdHb2Niy7y93hqADUsfUaEgwWTWY0DGl
 GeMqskNlS97LRMAsvI02JTysyyghYlfjb9mf6gG4HlbTYhYnGIBhn3XdBYfTYXBaOwsF
 95L6ejUjlhIht89eN92IqbUGGnk20Xbj3EaFlV+lYxgRhw/js5pXwNxfvBz/LaSuxyZ9
 fpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ytrSkwXUDSFcv9NwzDcZHJvhwX8Ip28tSIzF/72ZJ1Q=;
 b=P4xXqfJmW1zECUuuEileiHw8ZhS8Q34fzxTYYsIISL0rv1zV6TADjvMyGpodvVCflO
 4TCtwE76bcdH5CFt3Y5FO46HVEtZqD6c5OPeRryh7YcOUQGpxic6ae7SDbAsn5IJfPcF
 lHJ5bPv4kJ/1+SrNfCAOCgpInNoCcmMBJFZil08tx42lh28QwknOmYK0JEwmGB+OMOL8
 1Q8ydODzZStzzTaJur/fpkfG97fi0hcvPuwdl0X+PZOd9BaW3ux0LNrXW1qQj9LtnCtk
 jAYS1sV3JJubqify+ELFxA7AR462RB2HMj7GjdQQGBvIUg3hz743ZbuYA7swfgLu1d4I
 P/+w==
X-Gm-Message-State: AOAM531FkTqtJT2oSHoMwkgWHWpa7xzhJrD1ebKV32bvGxIpARNk3D/3
 OTR7uoVXu4oRVA0Bgv7QiOQFHg==
X-Google-Smtp-Source: ABdhPJz/DFJ+XVXhJNrPMlWXh7xu5l3qH4Q/QymhLpFp1U0q32kHVhkRByS9xkteULaLyJt8VbhF/w==
X-Received: by 2002:adf:fac8:0:b0:203:fb08:ff7 with SMTP id
 a8-20020adffac8000000b00203fb080ff7mr24674238wrs.648.1648490463028; 
 Mon, 28 Mar 2022 11:01:03 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:2cfc:d300:5bbc:f8a0])
 by smtp.gmail.com with ESMTPSA id
 bi20-20020a05600c3d9400b0038cfe80eeddsm142468wmb.29.2022.03.28.11.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 11:01:02 -0700 (PDT)
Date: Mon, 28 Mar 2022 19:00:58 +0100
From: Quentin Perret <qperret@google.com>
To: Sean Christopherson <seanjc@google.com>
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
Message-ID: <YkH32nx+YsJuUbmZ@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <YjyS6A0o4JASQK+B@google.com> <YkHspg+YzOsbUaCf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkHspg+YzOsbUaCf@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=qperret@google.com; helo=mail-wr1-x433.google.com
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

Hi Sean,

Thanks for the reply, this helps a lot.

On Monday 28 Mar 2022 at 17:13:10 (+0000), Sean Christopherson wrote:
> On Thu, Mar 24, 2022, Quentin Perret wrote:
> > For Protected KVM (and I suspect most other confidential computing
> > solutions), guests have the ability to share some of their pages back
> > with the host kernel using a dedicated hypercall. This is necessary
> > for e.g. virtio communications, so these shared pages need to be mapped
> > back into the VMM's address space. I'm a bit confused about how that
> > would work with the approach proposed here. What is going to be the
> > approach for TDX?
> > 
> > It feels like the most 'natural' thing would be to have a KVM exit
> > reason describing which pages have been shared back by the guest, and to
> > then allow the VMM to mmap those specific pages in response in the
> > memfd. Is this something that has been discussed or considered?
> 
> The proposed solution is to exit to userspace with a new exit reason, KVM_EXIT_MEMORY_ERROR,
> when the guest makes the hypercall to request conversion[1].  The private fd itself
> will never allow mapping memory into userspace, instead userspace will need to punch
> a hole in the private fd backing store.  The absense of a valid mapping in the private
> fd is how KVM detects that a pfn is "shared" (memslots without a private fd are always
> shared)[2].

Right. I'm still a bit confused about how the VMM is going to get the
shared page mapped in its page-table. Once it has punched a hole into
the private fd, how is it supposed to access the actual physical page
that the guest shared? Is there an assumption somewhere that the VMM
should have this page mapped in via an alias that it can legally access
only once it has punched a hole at the corresponding offset in the
private fd or something along those lines?

> The key point is that KVM never decides to convert between shared and private, it's
> always a userspace decision.  Like normal memslots, where userspace has full control
> over what gfns are a valid, this gives userspace full control over whether a gfn is
> shared or private at any given time.

I'm understanding this as 'the VMM is allowed to punch holes in the
private fd whenever it wants'. Is this correct? What happens if it does
so for a page that a guest hasn't shared back?

> Another important detail is that this approach means the kernel and KVM treat the
> shared backing store and private backing store as independent, albeit related,
> entities.  This is very deliberate as it makes it easier to reason about what is
> and isn't allowed/required.  E.g. the kernel only needs to handle freeing private
> memory, there is no special handling for conversion to shared because no such path
> exists as far as host pfns are concerned.  And userspace doesn't need any new "rules"
> for protecting itself against a malicious guest, e.g. userspace already needs to
> ensure that it has a valid mapping prior to accessing guest memory (or be able to
> handle any resulting signals).  A malicious guest can DoS itself by instructing
> userspace to communicate over memory that is currently mapped private, but there
> are no new novel attack vectors from the host's perspective as coercing the host
> into accessing an invalid mapping after shared=>private conversion is just a variant
> of a use-after-free.

Interesting. I was (maybe incorrectly) assuming that it would be
difficult to handle illegal host accesses w/ TDX. IOW, this would
essentially crash the host. Is this remotely correct or did I get that
wrong?

> One potential conversions that's TBD (at least, I think it is, I haven't read through
> this most recent version) is how to support populating guest private memory with
> non-zero data, e.g. to allow in-place conversion of the initial guest firmware instead
> of having to an extra memcpy().

Right. FWIW, in the pKVM case we should be pretty immune to this I
think. The initial firmware is loaded in guest memory by the hypervisor
itself (the EL2 code in arm64 speak) as the first vCPU starts running.
And that firmware can then use e.g. virtio to load the guest payload and
measure/check it. IOW, we currently don't have expectations regarding
the initial state of guest memory, but it might be handy to have support
for pre-loading the payload in the future (should save a copy as you
said).

> [1] KVM will also exit to userspace with the same info on "implicit" conversions,
>     i.e. if the guest accesses the "wrong" GPA.  Neither SEV-SNP nor TDX mandate
>     explicit conversions in their guest<->host ABIs, so KVM has to support implicit
>     conversions :-/
> 
> [2] Ideally (IMO), KVM would require userspace to completely remove the private memslot,
>     but that's too slow due to use of SRCU in both KVM and userspace (QEMU at least uses
>     SRCU for memslot changes).

