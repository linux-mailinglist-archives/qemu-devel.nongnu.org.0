Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273D0485A53
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:56:59 +0100 (CET)
Received: from localhost ([::1]:59360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DL7-0003K0-Nq
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:56:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n5DHE-0008Ad-Md
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 15:52:57 -0500
Received: from [2607:f8b0:4864:20::1036] (port=44853
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1n5DHC-0004TK-JZ
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 15:52:56 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so255107pji.3
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JbxoBomdcCqOqJFCBjDh/uGAgy3A+q4n81f2FmBqdOo=;
 b=lcHlW5fa9jFHIO/4BxpYp/Tmy5m91nF1IHDBqc7vkJc8rcl2mWmRRDknMp0CMLyVxf
 XG6AinG8ofa2FW/grJcmrznnxnQHMXttxllF9zF1ag/Jj8VLCCwLTO3HY4SCjlg2UOKE
 a+kMrofibgpexqlucg3jyspkX/e8zA6WbfAoOCzZ+l5q9hnkZ4u1+hn00u80p+ugmte0
 FA+8o29Vyy3Jr5vKE3NEi0QEsEVR0MmdN6Ji77oqhe7fzz96jVnlyjBGeGVvEoGdMfXC
 VfzL8p3VVm36IH4JWgcFPStvAK81KBpBDqAZYWu4llyuPioega3WxWx8dVpGNUCvWcfd
 19CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JbxoBomdcCqOqJFCBjDh/uGAgy3A+q4n81f2FmBqdOo=;
 b=txELNvzkm07jXpt9LZSN45Hl9ffoT/xgzEdwkUFWsmaZ95+8G4m7dC3s8cbZdAEUuG
 OhlT1engNBNgWDu6qpaxO6/JU2dHdHrc8ZWsnoByI03AA1lU4f7v8iwqsBQU9wTfu1SF
 dKnwvgyWproLua3vwjINMPtXoAh0zwlB5iO8EkOn/CGhHEAVNDbLeaArpB3O/YIGooru
 j2QVY4VWjGOFTtjISnXtq82029ilLfNVpTXZ1bM9tqmvdTQg7/MBpJnNsg9S0Eat3BBy
 3y78hpiblO2QuPyLm1li/POe3wH0XuY50GI9sDR5I3xU9WXoPIqAYSe2DeTJF7NgVO0Z
 QTmg==
X-Gm-Message-State: AOAM530RM4JZkx9uCQbsHBQkQK1KMtnL1pEp+G4f70C2PJeoRijYbrGv
 dpOAalgTONg0925rYJIfkwR63A==
X-Google-Smtp-Source: ABdhPJyR0C1DrkXymrvkpk2S7sD/y26XNYIobEYJs+EPEbw+DMrYoag4fnJJYUy5LWVuQEwzegRnSA==
X-Received: by 2002:a17:90a:ad07:: with SMTP id
 r7mr6153665pjq.67.1641415963380; 
 Wed, 05 Jan 2022 12:52:43 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id h7sm28516pfv.35.2022.01.05.12.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 12:52:42 -0800 (PST)
Date: Wed, 5 Jan 2022 20:52:39 +0000
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, john.ji@intel.com, susie.li@intel.com,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com
Subject: Re: [PATCH v3 kvm/queue 14/16] KVM: Handle page fault for private
 memory
Message-ID: <YdYFFzlPTvgFdSXL@google.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-15-chao.p.peng@linux.intel.com>
 <20220104014629.GA2330@yzhao56-desk.sh.intel.com>
 <20220104091008.GA21806@chaop.bj.intel.com>
 <20220104100612.GA19947@yzhao56-desk.sh.intel.com>
 <20220105062810.GB25283@chaop.bj.intel.com>
 <20220105075356.GB19947@yzhao56-desk.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105075356.GB19947@yzhao56-desk.sh.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
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

On Wed, Jan 05, 2022, Yan Zhao wrote:
> Sorry, maybe I didn't express it clearly.
> 
> As in the kvm_faultin_pfn_private(), 
> static bool kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
> 				    struct kvm_page_fault *fault,
> 				    bool *is_private_pfn, int *r)
> {
> 	int order;
> 	int mem_convert_type;
> 	struct kvm_memory_slot *slot = fault->slot;
> 	long pfn = kvm_memfd_get_pfn(slot, fault->gfn, &order);
> 	...
> }
> Currently, kvm_memfd_get_pfn() is called unconditionally.
> However, if the backend of a private memslot is not memfd, and is device
> fd for example, a different xxx_get_pfn() is required here.

Ya, I've complained about this in a different thread[*].  This should really be
something like kvm_private_fd_get_pfn(), where the underlying ops struct can point
at any compatible backing store.

https://lore.kernel.org/all/YcuMUemyBXFYyxCC@google.com/

> Further, though mapped to a private gfn, it might be ok for QEMU to
> access the device fd in hva-based way (or call it MMU access way, e.g.
> read/write/mmap), it's desired that it could use the traditional to get
> pfn without convert the range to a shared one.

No, this is expressly forbidden.  The backing store for a private gfn must not
be accessible by userspace.  It's possible a backing store could support both, but
not concurrently, and any conversion must be done without KVM being involved.
In other words, resolving a private gfn must either succeed or fail (exit to
userspace), KVM cannot initiate any conversions.

> pfn = __gfn_to_pfn_memslot(slot, fault->gfn, ...)
> 	|->addr = __gfn_to_hva_many (slot, gfn,...)
> 	|  pfn = hva_to_pfn (addr,...)
> 
> 
> So, is it possible to recognize such kind of backends in KVM, and to get
> the pfn in traditional way without converting them to shared?
> e.g.
> - specify KVM_MEM_PRIVATE_NONPROTECT to memory regions with such kind
> of backends, or
> - detect the fd type and check if get_pfn is provided. if no, go the
>   traditional way.

No, because the whole point of this is to make guest private memory inaccessible
to host userspace.  Or did I misinterpret your questions?

