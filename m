Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74334F3D35
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 20:33:19 +0200 (CEST)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbnzS-00074o-8D
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 14:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nbnx1-00069o-KV
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 14:30:51 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nbnwx-0008GK-Jg
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 14:30:47 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 c15-20020a17090a8d0f00b001c9c81d9648so303505pjo.2
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 11:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G8+4mXlfXEhZHOhFIRvGTNgBOyulQouXw+I2k4OPfSs=;
 b=JEAiwwWf8T9LZvKvUJKSgjehqTRQAgWTmIg0Kl3BSYJYTC+v/3bm2x1/9Hy8KfSmg+
 cHSPWpCpQx/B9uyWSDx7KDa583awqWBLkdvoEKwQ/QBUVRp4lZ6Cj73ZO0l8R1jsuMTu
 f4CTIP1KefeADG3WAL+m7kzbPsENWR2ewqxk3Vv6zcy974PyQLpH4p1GEvsWlPaOBnDD
 BG/d5Cparj8Y2vpN7tIW/k4gGVthNC5Ac8769ebux1ZwYDdSobMpJ6R2kheemPJpQheC
 Hjen7QcB7kjlOMvcpc1sK+TrMXslHzsMWklqEGe8pGwPZ2paBwziGZrdbb+U0gJgoIyn
 aHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G8+4mXlfXEhZHOhFIRvGTNgBOyulQouXw+I2k4OPfSs=;
 b=O40Ra6i/d/xL/JSduCCMq/jxsLhi4thghqx4Ufyxt8ks3A3xCx73k6WdFyUdQv/XOD
 oSdm+UyYhWmMuNW3CTKjeJSOE5/HtfnbwaNrBMf3GoCd1M2xOz9RG6PRlcAIAjeoopTP
 4uylUfhVG6ts+MccPNAXGocS/FyNNIsCMffcFZ+/S1OC/H/X+hY+M7IuPZAq7vynHkkP
 pQ5vuVS180avBZFDuduGMrvW6TW9l1CBmAazSysGk4w081AYqsgPzatYj3ZyqGBrDgoH
 Ga7axRsmX/dQdIkav534fpQEW663IgILM+NzgYLKCeSymFSU8BmVc8PT8B/v5XEOb5Ip
 BiSg==
X-Gm-Message-State: AOAM531WYDGNwhFm4/cmdaZ3I8giCDav4xA2EYovWhK8576/GLWy5zEY
 UQ8aFcaLmgsZ7HOTo5xCTBUANw==
X-Google-Smtp-Source: ABdhPJyua072a4AGX8ZFGYAQtmIMqiU1fY+N03i9KlJ21rU1Sdp03j8ltrsaSuySC/JcuYQKVUW/ZQ==
X-Received: by 2002:a17:902:8217:b0:156:9c4f:90eb with SMTP id
 x23-20020a170902821700b001569c4f90ebmr4788820pln.121.1649183440130; 
 Tue, 05 Apr 2022 11:30:40 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 i7-20020a628707000000b004fa6eb33b02sm16131023pfe.49.2022.04.05.11.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 11:30:39 -0700 (PDT)
Date: Tue, 5 Apr 2022 18:30:35 +0000
From: Sean Christopherson <seanjc@google.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Quentin Perret <qperret@google.com>, Steven Price <steven.price@arm.com>,
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
Message-ID: <YkyKywkQYbr9U0CA@google.com>
References: <YkQzfjgTQaDd2E2T@google.com> <YkSaUQX89ZEojsQb@google.com>
 <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com>
 <54acbba9-f4fd-48c1-9028-d596d9f63069@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54acbba9-f4fd-48c1-9028-d596d9f63069@www.fastmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1032.google.com
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

On Tue, Apr 05, 2022, Andy Lutomirski wrote:
> On Tue, Apr 5, 2022, at 3:36 AM, Quentin Perret wrote:
> > On Monday 04 Apr 2022 at 15:04:17 (-0700), Andy Lutomirski wrote:
> >> The best I can come up with is a special type of shared page that is not
> >> GUP-able and maybe not even mmappable, having a clear option for
> >> transitions to fail, and generally preventing the nasty cases from
> >> happening in the first place.
> >
> > Right, that sounds reasonable to me.
> 
> At least as a v1, this is probably more straightforward than allowing mmap().
> Also, there's much to be said for a simpler, limited API, to be expanded if
> genuinely needed, as opposed to starting out with a very featureful API.

Regarding "genuinely needed", IMO the same applies to supporting this at all.
Without numbers from something at least approximating a real use case, we're just
speculating on which will be the most performant approach.

> >> Maybe there could be a special mode for the private memory fds in which
> >> specific pages are marked as "managed by this fd but actually shared".
> >> pread() and pwrite() would work on those pages, but not mmap().  (Or maybe
> >> mmap() but the resulting mappings would not permit GUP.)  And
> >> transitioning them would be a special operation on the fd that is specific
> >> to pKVM and wouldn't work on TDX or SEV.
> >
> > Aha, didn't think of pread()/pwrite(). Very interesting.
> 
> There are plenty of use cases for which pread()/pwrite()/splice() will be as
> fast or even much faster than mmap()+memcpy().

...

> resume guest
> *** host -> hypervisor -> guest ***
> Guest unshares the page.
> *** guest -> hypervisor ***
> Hypervisor removes PTE.  TLBI.
> *** hypervisor -> guest ***
> 
> Obviously considerable cleverness is needed to make a virt IOMMU like this
> work well, but still.
> 
> Anyway, my suggestion is that the fd backing proposal get slightly modified
> to get it ready for multiple subtypes of backing object, which should be a
> pretty minimal change.  Then, if someone actually needs any of this
> cleverness, it can be added later.  In the mean time, the
> pread()/pwrite()/splice() scheme is pretty good.

Tangentially related to getting private-fd ready for multiple things, what about
implementing the pread()/pwrite()/splice() scheme in pKVM itself?  I.e. read() on
the VM fd, with the offset corresponding to gfn in some way.

Ditto for mmap() on the VM fd, though that would require additional changes outside
of pKVM.

That would allow pKVM to support in-place conversions without the private-fd having
to differentiate between the type of protected VM, and without having to provide
new APIs from the private-fd.  TDX, SNP, etc... Just Work by not supporting the pKVM
APIs.

And assuming we get multiple consumers down the road, pKVM will need to be able to
communicate the "true" state of a page to other consumers, because in addition to
being a consumer, pKVM is also an owner/enforcer analogous to the TDX Module and
the SEV PSP.

