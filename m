Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5B06F870E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:51:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puydT-0003FO-Uy; Fri, 05 May 2023 12:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mic@digikod.net>) id 1puydM-0003FF-5Y
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:50:16 -0400
Received: from smtp-42ac.mail.infomaniak.ch ([2001:1600:4:17::42ac])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mic@digikod.net>) id 1puydD-0001Q6-Ty
 for qemu-devel@nongnu.org; Fri, 05 May 2023 12:50:15 -0400
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QCc9j6pyZzMq29R;
 Fri,  5 May 2023 18:50:01 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QCc9f1ZprzMpt9p; Fri,  5 May 2023 18:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
 s=20191114; t=1683305401;
 bh=RPOWf6TexJXD2F61Y+MwwaWrFJGnJ6O8Bzm/vPfHfEg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KFqsV29bRBQXZVMUZDnW9//LbmTjZRdZ5CYSCvQtHGOugYPQZro4kAj1y6BuQuLMI
 6ri9TjVKDdRi4alwo2oX8l60NkGjcqHjRzeAjieP1C8UKm+ZX2LPynTNK6yGyQO8br
 /DpBAABiiqrinOuFsaScnqzH8PtKHmistKR3ODTI=
Message-ID: <6412bf27-4d05-eab8-3db1-d4efa44af3aa@digikod.net>
Date: Fri, 5 May 2023 18:49:57 +0200
MIME-Version: 1.0
User-Agent: 
Subject: Re: [PATCH v1 2/9] KVM: x86/mmu: Add support for prewrite page
 tracking
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>,
 James Morris <jamorris@linux.microsoft.com>,
 John Andersen <john.s.andersen@intel.com>, Liran Alon
 <liran.alon@oracle.com>,
 "Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
 =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>,
 =?UTF-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>,
 Zahra Tarkhani <ztarkhani@microsoft.com>,
 =?UTF-8?Q?=c8=98tefan_=c8=98icleru?= <ssicleru@bitdefender.com>,
 dev@lists.cloudhypervisor.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
References: <20230505152046.6575-1-mic@digikod.net>
 <20230505152046.6575-3-mic@digikod.net> <ZFUumGdZDNs1tkQA@google.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <ZFUumGdZDNs1tkQA@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha
Received-SPF: pass client-ip=2001:1600:4:17::42ac;
 envelope-from=mic@digikod.net; helo=smtp-42ac.mail.infomaniak.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 05/05/2023 18:28, Sean Christopherson wrote:
> On Fri, May 05, 2023, Mickaï¿½l Salaï¿½n wrote:
>> diff --git a/arch/x86/include/asm/kvm_page_track.h b/arch/x86/include/asm/kvm_page_track.h
>> index eb186bc57f6a..a7fb4ff888e6 100644
>> --- a/arch/x86/include/asm/kvm_page_track.h
>> +++ b/arch/x86/include/asm/kvm_page_track.h
>> @@ -3,6 +3,7 @@
>>   #define _ASM_X86_KVM_PAGE_TRACK_H
>>   
>>   enum kvm_page_track_mode {
>> +	KVM_PAGE_TRACK_PREWRITE,
> 
> Heh, just when I decide to finally kill off support for multiple modes[1] :-)
> 
> My assessment from that changelog still holds true for this case:
> 
>    Drop "support" for multiple page-track modes, as there is no evidence
>    that array-based and refcounted metadata is the optimal solution for
>    other modes, nor is there any evidence that other use cases, e.g. for
>    access-tracking, will be a good fit for the page-track machinery in
>    general.
>    
>    E.g. one potential use case of access-tracking would be to prevent guest
>    access to poisoned memory (from the guest's perspective).  In that case,
>    the number of poisoned pages is likely to be a very small percentage of
>    the guest memory, and there is no need to reference count the number of
>    access-tracking users, i.e. expanding gfn_track[] for a new mode would be
>    grossly inefficient.  And for poisoned memory, host userspace would also
>    likely want to trap accesses, e.g. to inject #MC into the guest, and that
>    isn't currently supported by the page-track framework.
>    
>    A better alternative for that poisoned page use case is likely a
>    variation of the proposed per-gfn attributes overlay (linked), which
>    would allow efficiently tracking the sparse set of poisoned pages, and by
>    default would exit to userspace on access.
> 
> Of particular relevance:
> 
>    - Using the page-track machinery is inefficient because the guest is likely
>      going to write-protect a minority of its memory.  And this
> 
>        select KVM_EXTERNAL_WRITE_TRACKING if KVM
> 
>      is particularly nasty because simply enabling HEKI in the Kconfig will cause
>      KVM to allocate rmaps and gfn tracking.
> 
>    - There's no need to reference count the protection, i.e. 15 of the 16 bits of
>      gfn_track are dead weight.
> 
>    - As proposed, adding a second "mode" would double the cost of gfn tracking.
> 
>    - Tying the protections to the memslots will create an impossible-to-maintain
>      ABI because the protections will be lost if the owning memslot is deleted and
>      recreated.
> 
>    - The page-track framework provides incomplete protection and will lead to an
>      ongoing game of whack-a-mole, e.g. this patch catches the obvious cases by
>      adding calls to kvm_page_track_prewrite(), but misses things like kvm_vcpu_map().
> 
>    - The scaling and maintenance issues will only get worse if/when someone tries
>      to support dropping read and/or execute permissions, e.g. for execute-only.
> 
>    - The code is x86-only, and is likely to stay that way for the foreseeable
>      future.
> 
> The proposed alternative is to piggyback the memory attributes implementation[2]
> that is being added (if all goes according to plan) for confidential VMs.  This
> use case (dropping permissions) came up not too long ago[3], which is why I have
> a ready-made answer).
> 
> I have no doubt that we'll need to solve performance and scaling issues with the
> memory attributes implementation, e.g. to utilize xarray multi-range support
> instead of storing information on a per-4KiB-page basis, but AFAICT, the core
> idea is sound.  And a very big positive from a maintenance perspective is that
> any optimizations, fixes, etc. for one use case (CoCo vs. hardening) should also
> benefit the other use case.
> 
> [1] https://lore.kernel.org/all/20230311002258.852397-22-seanjc@google.com
> [2] https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com
> [3] https://lore.kernel.org/all/Y1a1i9vbJ%2FpVmV9r@google.com

I agree, I used this mechanism because it was easier at first to rely on 
a previous work, but while I was working on the MBEC support, I realized 
that it's not the optimal way to do it.

I was thinking about using a new special EPT bit similar to 
EPT_SPTE_HOST_WRITABLE, but it may not be portable though. What do you 
think?

