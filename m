Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1350D4E6656
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 16:54:49 +0100 (CET)
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXPnT-0003Vg-Ma
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 11:54:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1nXPki-0001ve-NJ
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 11:51:56 -0400
Received: from [2a00:1450:4864:20::330] (port=45649
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qperret@google.com>)
 id 1nXPkg-00077B-Qv
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 11:51:56 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso2816466wmz.4
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NEtaF19RLk3IuGGWvhhX/z9a33LLQAJ182dON6UK5Yo=;
 b=fk9RkDsYVyolj4TSgLqmrYuEXdokpvUU9jaV0JAO9n+wmTm4I2wgbn37yCP2KfXBWI
 /2WqZepo3GcWY397TcvebHgjb3u1LCH+XB9TxdoIB3HsM02i0vXyZ51l25KENYsebBZB
 QbTnr2t8ehr+TLPj7+dmYDh6R8fCKi7yxBgoArhQu4dZbntaUZ1LBgcwvG5trGBp1A56
 W+b4dCBOtKMZ3YZueQKIC57OQp6xiYvcBVHV3A/C4PLGpqp2vi4+Ry8IOI2z1wZxIy3O
 C7pTxWtH0Fh0R0Nw9NrQNwKE2s6PQE6Nl1IN7bH79+T+kGNjIm0Ol7dDbMJr62zC41Tt
 NK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NEtaF19RLk3IuGGWvhhX/z9a33LLQAJ182dON6UK5Yo=;
 b=rhKV8owa41z3r+j++7b0oD/0O+TAIv7nUpIev8cm4m+27lurFErqRxwJ9SjM5tCn8o
 ZV30bsPiMJga8dRUEOzYV+utPG53e4vyEenrayFojW6oEzpMyirhqQBH9D7eKxdc+iv5
 M7VEy+Ib93IfbCURfzrgNBoA/K+Twh9xz/xFlSwRaQuLkRtXeG3Km8LR+O1gLv+stiBH
 4FewhU1IyBReWoyhK4LWJaatTHN5Hodw2Epvrk20RqXq0r0Sfbu7mwJp9Eh6DM+WKYFg
 2I9ePB6PPbACCh6jExA0KY5SBTy2AmClUpx1/kDT/q3QE754pjKXQ3FQolFKQn+Q+yX2
 uyiw==
X-Gm-Message-State: AOAM532kMGkPJV+ZXT127BjCsYVDSnMDt2urekd89C9cD4lzwqJXNod3
 8iWCf7dNEgq7BHkRp0tRDW/CJw==
X-Google-Smtp-Source: ABdhPJyoUHp29/XUyIZlxpqS/7kDffVwFSGviWgbTb92w3/eFRlsR7S6xMVteMn3CazvbWUm8x2Sjw==
X-Received: by 2002:a05:600c:4e8b:b0:38c:90cf:1158 with SMTP id
 f11-20020a05600c4e8b00b0038c90cf1158mr15120363wmq.107.1648137112585; 
 Thu, 24 Mar 2022 08:51:52 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:6aea:58cf:f2e0:7796])
 by smtp.gmail.com with ESMTPSA id
 y13-20020adffa4d000000b00203e3ca2701sm4051307wrr.45.2022.03.24.08.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 08:51:52 -0700 (PDT)
Date: Thu, 24 Mar 2022 15:51:48 +0000
From: Quentin Perret <qperret@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
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
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <YjyS6A0o4JASQK+B@google.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=qperret@google.com; helo=mail-wm1-x330.google.com
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

Hi Chao,

+CC Will and Marc for visibility.

On Thursday 10 Mar 2022 at 22:08:58 (+0800), Chao Peng wrote:
> This is the v5 of this series which tries to implement the fd-based KVM
> guest private memory. The patches are based on latest kvm/queue branch
> commit:
> 
>   d5089416b7fb KVM: x86: Introduce KVM_CAP_DISABLE_QUIRKS2
>  
> Introduction
> ------------
> In general this patch series introduce fd-based memslot which provides
> guest memory through memory file descriptor fd[offset,size] instead of
> hva/size. The fd can be created from a supported memory filesystem
> like tmpfs/hugetlbfs etc. which we refer as memory backing store. KVM
> and the the memory backing store exchange callbacks when such memslot
> gets created. At runtime KVM will call into callbacks provided by the
> backing store to get the pfn with the fd+offset. Memory backing store
> will also call into KVM callbacks when userspace fallocate/punch hole
> on the fd to notify KVM to map/unmap secondary MMU page tables.
> 
> Comparing to existing hva-based memslot, this new type of memslot allows
> guest memory unmapped from host userspace like QEMU and even the kernel
> itself, therefore reduce attack surface and prevent bugs.
> 
> Based on this fd-based memslot, we can build guest private memory that
> is going to be used in confidential computing environments such as Intel
> TDX and AMD SEV. When supported, the memory backing store can provide
> more enforcement on the fd and KVM can use a single memslot to hold both
> the private and shared part of the guest memory. 
> 
> mm extension
> ---------------------
> Introduces new MFD_INACCESSIBLE flag for memfd_create(), the file created
> with these flags cannot read(), write() or mmap() etc via normal
> MMU operations. The file content can only be used with the newly
> introduced memfile_notifier extension.
> 
> The memfile_notifier extension provides two sets of callbacks for KVM to
> interact with the memory backing store:
>   - memfile_notifier_ops: callbacks for memory backing store to notify
>     KVM when memory gets allocated/invalidated.
>   - memfile_pfn_ops: callbacks for KVM to call into memory backing store
>     to request memory pages for guest private memory.
> 
> The memfile_notifier extension also provides APIs for memory backing
> store to register/unregister itself and to trigger the notifier when the
> bookmarked memory gets fallocated/invalidated.
> 
> memslot extension
> -----------------
> Add the private fd and the fd offset to existing 'shared' memslot so that
> both private/shared guest memory can live in one single memslot. A page in
> the memslot is either private or shared. A page is private only when it's
> already allocated in the backing store fd, all the other cases it's treated
> as shared, this includes those already mapped as shared as well as those
> having not been mapped. This means the memory backing store is the place
> which tells the truth of which page is private.
> 
> Private memory map/unmap and conversion
> ---------------------------------------
> Userspace's map/unmap operations are done by fallocate() ioctl on the
> backing store fd.
>   - map: default fallocate() with mode=0.
>   - unmap: fallocate() with FALLOC_FL_PUNCH_HOLE.
> The map/unmap will trigger above memfile_notifier_ops to let KVM map/unmap
> secondary MMU page tables.

I recently came across this series which is interesting for the
Protected KVM work that's currently ongoing in the Android world (see
[1], [2] or [3] for more details). The idea is similar in a number of
ways to the Intel TDX stuff (from what I understand, but I'm clearly not
understanding it all so, ...) or the Arm CCA solution, but using stage-2
MMUs instead of encryption; and leverages the caveat of the nVHE
KVM/arm64 implementation to isolate the control of stage-2 MMUs from the
host.

For Protected KVM (and I suspect most other confidential computing
solutions), guests have the ability to share some of their pages back
with the host kernel using a dedicated hypercall. This is necessary
for e.g. virtio communications, so these shared pages need to be mapped
back into the VMM's address space. I'm a bit confused about how that
would work with the approach proposed here. What is going to be the
approach for TDX?

It feels like the most 'natural' thing would be to have a KVM exit
reason describing which pages have been shared back by the guest, and to
then allow the VMM to mmap those specific pages in response in the
memfd. Is this something that has been discussed or considered?

Thanks,
Quentin

[1] https://lwn.net/Articles/836693/
[2] https://www.youtube.com/watch?v=wY-u6n75iXc
[3] https://www.youtube.com/watch?v=54q6RzS9BpQ&t=10862s

