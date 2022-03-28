Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE3B4E9D20
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 19:14:26 +0200 (CEST)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYswj-0004HC-CJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 13:14:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYsvg-0003Ve-24
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:13:20 -0400
Received: from [2607:f8b0:4864:20::42d] (port=42935
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nYsve-0001M9-CN
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 13:13:19 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x31so6693021pfh.9
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 10:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xkOsBgVuG0zCndlt1G8crnufHuKqrN/5aTVkYRyBZfc=;
 b=YDY+YeRkB1EvXc+KqVUKjZJIfyymRN45O804LxSksnIdheInoNyrxLgz1F47fxHVQL
 O0Kja0/2Q4FdPsdKGceWLGPOsgIB7koi3bsv2jQY5FvEw9UpUJEaEeBfe/lq8itIV2He
 SQnYSKK1Fz1SViat1FInTLq4FgbBR06LBs+nbppiyo+/q2iYabnxipScvrMV4E1MSScm
 IuEuDnKZdCEpPFMGG4zz4wq7C6Q1bv6ZTbkfGcUvtR4ftGNRAKLv/g8foAvB0eSaH3Lv
 j5RVx3sG+vmQwgxgF8/tNjDTKl16iAAeEO1TLbSC9OarbzM8Xt1ZEbnWEKcUJqGexWp3
 CiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xkOsBgVuG0zCndlt1G8crnufHuKqrN/5aTVkYRyBZfc=;
 b=gimLx+ksjTv3af4o7UpZC4tsUpoucOlOWvXm8fKY1LqUNn+7rcWrqvH+0Wfx+HByHv
 E0Yv+zKlXmcfxCgM1aWHNX/E5MeBzJLkB79J8kKqsqzs1AEeWjyj2JkFi8C1Di1Cdk6Y
 6Ck/DFoOjf52hgxg5S1OqmKFymKTsKU4IW8JEO8Uvn2f7E0Dg715/KRD72jRCFSzFWfy
 4ffrdupDb51OLGWDaSvuzrxmBPRDMO7t71h4lTe3CVL4KTqpX9NkL5l3U38XGzHSGlVy
 N0NwYdaAg28Co8/0xVn8j4Dqv8WGNvf7xkiA9/Jne2vTFtIBPymaiDVu5DMiT27R3NnU
 mQeQ==
X-Gm-Message-State: AOAM533I9rR2iK8KVBuAmXLiOcaJjWwsG1w+MCzMGv1xU5/xg+rHmRAP
 l2s9m/5W+Tkn4CnTE+QybbVr2Q==
X-Google-Smtp-Source: ABdhPJyjv96+m6AY6ltlDIh6YwZCGgDdQJCULPA3+nexLHL1Y3Cwco6Ne/HueLnONAhilf3ume3wCw==
X-Received: by 2002:a05:6a00:1a02:b0:4fb:20f0:c1aa with SMTP id
 g2-20020a056a001a0200b004fb20f0c1aamr15081324pfv.45.1648487594529; 
 Mon, 28 Mar 2022 10:13:14 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 f91-20020a17090a706400b001c7858a6879sm80756pjk.12.2022.03.28.10.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 10:13:13 -0700 (PDT)
Date: Mon, 28 Mar 2022 17:13:10 +0000
From: Sean Christopherson <seanjc@google.com>
To: Quentin Perret <qperret@google.com>
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
Message-ID: <YkHspg+YzOsbUaCf@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <YjyS6A0o4JASQK+B@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjyS6A0o4JASQK+B@google.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=seanjc@google.com; helo=mail-pf1-x42d.google.com
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

On Thu, Mar 24, 2022, Quentin Perret wrote:
> For Protected KVM (and I suspect most other confidential computing
> solutions), guests have the ability to share some of their pages back
> with the host kernel using a dedicated hypercall. This is necessary
> for e.g. virtio communications, so these shared pages need to be mapped
> back into the VMM's address space. I'm a bit confused about how that
> would work with the approach proposed here. What is going to be the
> approach for TDX?
> 
> It feels like the most 'natural' thing would be to have a KVM exit
> reason describing which pages have been shared back by the guest, and to
> then allow the VMM to mmap those specific pages in response in the
> memfd. Is this something that has been discussed or considered?

The proposed solution is to exit to userspace with a new exit reason, KVM_EXIT_MEMORY_ERROR,
when the guest makes the hypercall to request conversion[1].  The private fd itself
will never allow mapping memory into userspace, instead userspace will need to punch
a hole in the private fd backing store.  The absense of a valid mapping in the private
fd is how KVM detects that a pfn is "shared" (memslots without a private fd are always
shared)[2].

The key point is that KVM never decides to convert between shared and private, it's
always a userspace decision.  Like normal memslots, where userspace has full control
over what gfns are a valid, this gives userspace full control over whether a gfn is
shared or private at any given time.

Another important detail is that this approach means the kernel and KVM treat the
shared backing store and private backing store as independent, albeit related,
entities.  This is very deliberate as it makes it easier to reason about what is
and isn't allowed/required.  E.g. the kernel only needs to handle freeing private
memory, there is no special handling for conversion to shared because no such path
exists as far as host pfns are concerned.  And userspace doesn't need any new "rules"
for protecting itself against a malicious guest, e.g. userspace already needs to
ensure that it has a valid mapping prior to accessing guest memory (or be able to
handle any resulting signals).  A malicious guest can DoS itself by instructing
userspace to communicate over memory that is currently mapped private, but there
are no new novel attack vectors from the host's perspective as coercing the host
into accessing an invalid mapping after shared=>private conversion is just a variant
of a use-after-free.

One potential conversions that's TBD (at least, I think it is, I haven't read through
this most recent version) is how to support populating guest private memory with
non-zero data, e.g. to allow in-place conversion of the initial guest firmware instead
of having to an extra memcpy().

[1] KVM will also exit to userspace with the same info on "implicit" conversions,
    i.e. if the guest accesses the "wrong" GPA.  Neither SEV-SNP nor TDX mandate
    explicit conversions in their guest<->host ABIs, so KVM has to support implicit
    conversions :-/

[2] Ideally (IMO), KVM would require userspace to completely remove the private memslot,
    but that's too slow due to use of SRCU in both KVM and userspace (QEMU at least uses
    SRCU for memslot changes).

