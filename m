Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61657EBA4
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 05:11:53 +0200 (CEST)
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oF5YV-0004Yg-Eg
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 23:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1oF5WH-00037Z-QX
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 23:09:33 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:48786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luto@kernel.org>) id 1oF5WF-0004H3-Qn
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 23:09:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D2776233A;
 Sat, 23 Jul 2022 03:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8C9C341C6;
 Sat, 23 Jul 2022 03:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658545766;
 bh=yfeKrSA/SfbRW4ZHy2JK6fnHYLeUM29oPE55X5506UQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oxm6j4n4k6TEwVlK1dp/rDs53BLhwoauQbLGK35rc3QJ+wKey0b7sGTpikHW4XCvY
 1JQNGkU2/ealbT+TOlf5zdl65Ecd0y/txIIQwq85gdvSTrBRDN00VMmMFOzHLaK8co
 Tm3Ejfx8av5weVgr8UFTcaBA8CZcFNbCF4xWNajYI9OCEWgsi3etdizaEN291jOYya
 EWgKUJ6hjldQNmY7xRMSkvHOK0oqmPh1bMP39edxeiCh9w3Extm3R/FoZu5F+ZGeWS
 zPTL4jl/DeG2NZSThdoMW+a3xiq0qebMTY8jfhn4XDCwuNqYBjJqN6Y4E1vBNieytj
 F3xnrGkgASOBQ==
Message-ID: <2171cf37-ea82-25c5-ad85-a80519525045@kernel.org>
Date: Fri, 22 Jul 2022 20:09:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 Steven Price <steven.price@arm.com>, kvm list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Linux API <linux-api@vger.kernel.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, the arch/x86 maintainers <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>, "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>, Dave Hansen
 <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, nikunj@amd.com, ashish.kalra@amd.com
References: <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com> <YkyEaYiL0BrDYcZv@google.com>
 <20220422105612.GB61987@chaop.bj.intel.com>
 <20220509223056.pyazfxjwjvipmytb@amd.com> <YnmjvX9ow4elYsY8@google.com>
 <c3ca63d6-db27-d783-40ca-486b3fbbced7@amd.com> <YtnCyqbI26QfRuOP@google.com>
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <YtnCyqbI26QfRuOP@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=luto@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/21/22 14:19, Sean Christopherson wrote:
> On Thu, Jul 21, 2022, Gupta, Pankaj wrote:
>>

>>> I view it as a performance problem because nothing stops KVM from copying from
>>> userspace into the private fd during the SEV ioctl().  What's missing is the
>>> ability for userspace to directly initialze the private fd, which may or may not
>>> avoid an extra memcpy() depending on how clever userspace is.
>> Can you please elaborate more what you see as a performance problem? And
>> possible ways to solve it?
> 
> Oh, I'm not saying there actually _is_ a performance problem.  What I'm saying is
> that in-place encryption is not a functional requirement, which means it's purely
> an optimization, and thus we should other bother supporting in-place encryption
> _if_ it would solve a performane bottleneck.

Even if we end up having a performance problem, I think we need to 
understand the workloads that we want to optimize before getting too 
excited about designing a speedup.

In particular, there's (depending on the specific technology, perhaps, 
and also architecture) a possible tradeoff between trying to reduce 
copying and trying to reduce unmapping and the associated flushes.  If a 
user program maps an fd, populates it, and then converts it in place 
into private memory (especially if it doesn't do it in a single shot), 
then that memory needs to get unmapped both from the user mm and 
probably from the kernel direct map.  On the flip side, it's possible to 
imagine an ioctl that does copy-and-add-to-private-fd that uses a 
private mm and doesn't need any TLB IPIs.

All of this is to say that trying to optimize right now seems quite 
premature to me.

