Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DCC480544
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 00:52:39 +0100 (CET)
Received: from localhost ([::1]:43584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1znC-0006d9-FV
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 18:52:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaoyuan0329os@gmail.com>)
 id 1n1zlV-0005NV-Kc
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 18:50:53 -0500
Received: from [2607:f8b0:4864:20::533] (port=45645
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaoyuan0329os@gmail.com>)
 id 1n1zlT-0004LU-Q3
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 18:50:53 -0500
Received: by mail-pg1-x533.google.com with SMTP id 2so14530237pgb.12
 for <qemu-devel@nongnu.org>; Mon, 27 Dec 2021 15:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jMDYAAEzWKf+ZWKv9FVeegcQUYl4xuyCtWob58cAQWw=;
 b=Mn7hUoT2uvnAFbeYWRxfKqSyou/4u6IWp5Ab9qGalAnlr7CngmbOyRZZC+s5asEIUW
 D9pKUg8BUKSlcrGHpuRE0eVQ4R7/edscU9ohcmHdtsmKqr+Boz5j3tg6LOO5/I88JJv4
 TZK7o2ygufhlP3LYfuzuoWG7p9becxKvBXHa41Cizd2XQ8ivuEkcaWMZ99iHFwZnjN1i
 KeMwOIR2V0jav1n+UfooUNeR5uBznQwTmB2E267YriDa4fRhYLSFBc3Uf4oK+pSoJTaC
 K1JaaZzvNioZAMKg1NKVaFFaQ2xG0686bGDyixKpHfpRm1UO6iFaJuVD9qoCX9mzH8P7
 OoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jMDYAAEzWKf+ZWKv9FVeegcQUYl4xuyCtWob58cAQWw=;
 b=xW0veHwBIwyrGF07Vf/mjoysC4bdD5BBiSYousFOodGJw/9E5Av1JtC+w8cCKpQ1kp
 +llT/CXMMYpGWExpI2rvsmj0GgyHGCk1X4AlG8LjkmPrwRpb0s9fcG301BYysmO3w6J4
 jCBlhjoxmRMegeRzPqqneO79x3G110NdtopHMUgzmQ6+62Mj1XI+PLqeGUcUmS/YBgWj
 EOe9rSucV44GKtfQzxrnPSqKuohEv8JARkr61b0hRYqwVvxshowl1jqUwCVf6fvc3bmO
 yZkEEXp9jcUSn0B73KfdYOxHb3qNusJI3v8EEzjdX1VwHys+GoUxvHvDkjtoXPciAX22
 oIxA==
X-Gm-Message-State: AOAM531Ha7ZgVXgelQM+0cNWv+Y43kXcSNswLuB3v71qaFXToWkHGGKb
 5u/R3dBykuIUuum0FYrXLws=
X-Google-Smtp-Source: ABdhPJyliKjaqPaj3bkR5OEDX+2h8UmXBD78mFpsM4oAqOKbEenA5uObRsI4rm3mReETZDeq4yKueA==
X-Received: by 2002:a62:158f:0:b0:4ba:b456:24b9 with SMTP id
 137-20020a62158f000000b004bab45624b9mr19854677pfv.86.1640649047357; 
 Mon, 27 Dec 2021 15:50:47 -0800 (PST)
Received: from localhost (176.222.229.35.bc.googleusercontent.com.
 [35.229.222.176])
 by smtp.gmail.com with ESMTPSA id 10sm18533824pfm.56.2021.12.27.15.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 15:50:46 -0800 (PST)
Date: Tue, 28 Dec 2021 07:50:42 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Subject: Re: [PATCH v3 kvm/queue 05/16] KVM: Maintain ofs_tree for fast
 memslot lookup by file offset
Message-ID: <20211227235042.rmnwzcqy6ujj75zp@sapienza>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-6-chao.p.peng@linux.intel.com>
 <YcS5uStTallwRs0G@google.com>
 <20211224035418.GA43608@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224035418.GA43608@chaop.bj.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=yaoyuan0329os@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HK_RANDOM_ENVFROM=0.45, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 24, 2021 at 11:54:18AM +0800, Chao Peng wrote:
> On Thu, Dec 23, 2021 at 06:02:33PM +0000, Sean Christopherson wrote:
> > On Thu, Dec 23, 2021, Chao Peng wrote:
> > > Similar to hva_tree for hva range, maintain interval tree ofs_tree for
> > > offset range of a fd-based memslot so the lookup by offset range can be
> > > faster when memslot count is high.
> >
> > This won't work.  The hva_tree relies on there being exactly one virtual address
> > space, whereas with private memory, userspace can map multiple files into the
> > guest at different gfns, but with overlapping offsets.
>
> OK, that's the point.
>
> >
> > I also dislike hijacking __kvm_handle_hva_range() in patch 07.
> >
> > KVM also needs to disallow mapping the same file+offset into multiple gfns, which
> > I don't see anywhere in this series.
>
> This can be checked against file+offset overlapping with existing slots
> when register a new one.
>
> >
> > In other words, there needs to be a 1:1 gfn:file+offset mapping.  Since userspace
> > likely wants to allocate a single file for guest private memory and map it into
> > multiple discontiguous slots, e.g. to skip the PCI hole, the best idea off the top
> > of my head would be to register the notifier on a per-slot basis, not a per-VM
> > basis.  It would require a 'struct kvm *' in 'struct kvm_memory_slot', but that's
> > not a huge deal.
> >
> > That way, KVM's notifier callback already knows the memslot and can compute overlap
> > between the memslot and the range by reversing the math done by kvm_memfd_get_pfn().
> > Then, armed with the gfn and slot, invalidation is just a matter of constructing
> > a struct kvm_gfn_range and invoking kvm_unmap_gfn_range().
>
> KVM is easy but the kernel bits would be difficulty, it has to maintain
> fd+offset to memslot mapping because one fd can have multiple memslots,
> it need decide which memslot needs to be notified.

How about pass "context" of fd (e.g. the gfn/hva start point) when register
the invalidation notifier to fd, then in callback kvm can convert the
offset to absolute hva/gfn with such "context", then do memslot invalidation.

>
> Thanks,
> Chao

