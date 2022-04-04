Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6687A4F198C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 19:07:45 +0200 (CEST)
Received: from localhost ([::1]:48250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbQB5-0005vg-TZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 13:07:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nbQAI-0005Da-IQ
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 13:06:54 -0400
Received: from [2607:f8b0:4864:20::1033] (port=40592
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nbQAF-0004jG-OO
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 13:06:54 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 g15-20020a17090adb0f00b001caa9a230c7so2285525pjv.5
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 10:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gIH+kCrSXmFI+fUc29mzPw+H1akkAs2ZuFoVFSP0vxU=;
 b=Rr+FaoMffwErSOq6pRJ5Va7RKsFxClc5D23MZTexTKDgRmNLw+QXPH7HgVaF+gPlsH
 VVR7VJA+skjtzQ0GECeuU2WVaa0asrNgHkDBl6tstbwCf7C6oMyBne0DAlcAXCdcVL7g
 YrXAno9IHlxoD/YmxzSY5HC12atdMPGZ+Q8N6kZHZabK4TNxokJ7fJfCa2Z4Dji8u6pl
 3dHXlOPQbLuOhlHnPj7HtE/XDcufKULa7gV7RWaa0It/x7X/ULWQS6QyjSSWicyoNFMA
 ahGu94J7u389AK59eb7k4Mps25d3P18aXb3oZxp/f/pFl16fpYmLG3tkL22HLs/vsOZL
 l1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gIH+kCrSXmFI+fUc29mzPw+H1akkAs2ZuFoVFSP0vxU=;
 b=YIqKpC4ulscoI/9sM08RJHIUFwFOhj1JO5id2ihEj4t5qmPF1CYyGWfsMpopBXq4Ls
 0/VmLs1y6QH0963Nz3B2R4yc51ljOIPqyN6TzU2VHaqVXt8KkbhuJ+nXlNxnyYcxaBuj
 vd5DHbVpflKZas68A1xWGOu6/bK6/oe4q2MHhAnxvVVC0bDP/BKxmwGMSD6VrZ9cCraZ
 CPCUy/l2NMHOAx2WJENO8IV4HgdQ3sahDuS9xXFqwRlHfB5U/WUvuSaetMI/o2rhcntd
 CIDhLOS3Z8wldOOsd20N38Kz0vKZbWjLantcn8g83BVMPHyK+IGKxAfARPPao0X/Ctz5
 u+Ow==
X-Gm-Message-State: AOAM532OOLRdF+2DIDkxhvQnFqtJHcI6wrzF2ROfwsBzdGr/Cxzbhvi5
 Xjd+MKtsMFfKtYVB8l/ylsPXNg==
X-Google-Smtp-Source: ABdhPJxR0cMYn6++nMtTapD/RTNavycubKSgeugDdrZDDJ6GPqebAjtiOfHHZgX3JbxNGnvGjPUvmw==
X-Received: by 2002:a17:902:7247:b0:156:9d3d:756d with SMTP id
 c7-20020a170902724700b001569d3d756dmr687366pll.6.1649092007999; 
 Mon, 04 Apr 2022 10:06:47 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 x9-20020a17090a970900b001ca6c59b350sm428753pjo.2.2022.04.04.10.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 10:06:47 -0700 (PDT)
Date: Mon, 4 Apr 2022 17:06:43 +0000
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
Message-ID: <Ykslo2eo2eRXrpFR@google.com>
References: <YkH32nx+YsJuUbmZ@google.com> <YkIFW25WgV2WIQHb@google.com>
 <YkM7eHCHEBe5NkNH@google.com>
 <88620519-029e-342b-0a85-ce2a20eaf41b@arm.com>
 <YkQzfjgTQaDd2E2T@google.com> <YkSaUQX89ZEojsQb@google.com>
 <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YksIQYdG41v3KWkr@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1033.google.com
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

On Mon, Apr 04, 2022, Quentin Perret wrote:
> On Friday 01 Apr 2022 at 12:56:50 (-0700), Andy Lutomirski wrote:
> FWIW, there are a couple of reasons why I'd like to have in-place
> conversions:
> 
>  - one goal of pKVM is to migrate some things away from the Arm
>    Trustzone environment (e.g. DRM and the likes) and into protected VMs
>    instead. This will give Linux a fighting chance to defend itself
>    against these things -- they currently have access to _all_ memory.
>    And transitioning pages between Linux and Trustzone (donations and
>    shares) is fast and non-destructive, so we really do not want pKVM to
>    regress by requiring the hypervisor to memcpy things;

Is there actually a _need_ for the conversion to be non-destructive?  E.g. I assume
the "trusted" side of things will need to be reworked to run as a pKVM guest, at
which point reworking its logic to understand that conversions are destructive and
slow-ish doesn't seem too onerous.

>  - it can be very useful for protected VMs to do shared=>private
>    conversions. Think of a VM receiving some data from the host in a
>    shared buffer, and then it wants to operate on that buffer without
>    risking to leak confidential informations in a transient state. In
>    that case the most logical thing to do is to convert the buffer back
>    to private, do whatever needs to be done on that buffer (decrypting a
>    frame, ...), and then share it back with the host to consume it;

If performance is a motivation, why would the guest want to do two conversions
instead of just doing internal memcpy() to/from a private page?  I would be quite
surprised if multiple exits and TLB shootdowns is actually faster, especially at
any kind of scale where zapping stage-2 PTEs will cause lock contention and IPIs.

>  - similar to the previous point, a protected VM might want to
>    temporarily turn a buffer private to avoid ToCToU issues;

Again, bounce buffer the page in the guest.

>  - once we're able to do device assignment to protected VMs, this might
>    allow DMA-ing to a private buffer, and make it shared later w/o
>    bouncing.

Exposing a private buffer to a device doesn't requring in-place conversion.  The
proper way to handle this would be to teach e.g. VFIO to retrieve the PFN from
the backing store.  I don't understand the use case for sharing a DMA'd page at a
later time; with whom would the guest share the page?  E.g. if a NIC has access to
guest private data then there should never be a need to convert/bounce the page.

