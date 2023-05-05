Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C3D6F8733
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 19:02:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puyoL-0005Oi-Lj; Fri, 05 May 2023 13:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mic@digikod.net>) id 1puyoG-0005OU-Jk
 for qemu-devel@nongnu.org; Fri, 05 May 2023 13:01:32 -0400
Received: from smtp-1908.mail.infomaniak.ch ([2001:1600:4:17::1908])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mic@digikod.net>) id 1puyoD-0006E0-Qp
 for qemu-devel@nongnu.org; Fri, 05 May 2023 13:01:32 -0400
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QCcQt2Hl7zMqBQp;
 Fri,  5 May 2023 19:01:26 +0200 (CEST)
Received: from unknown by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QCcQl2DxJzMpxhN; Fri,  5 May 2023 19:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
 s=20191114; t=1683306086;
 bh=Gz496lWCqtEQGiFhDAnNdISGi/Ti3+4r45rZfW9pMhA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=0n9dK6yocwQrPoCyZhLiYaFRP+Rrc+AesC8U5DRpIAduml7GS9dfUNu27anU/Nq9H
 X7nX6pZrCIdpSbikNeBpaLS6XS4cxGwP59sL8dmULJe3HbrVsb+7OJzRnuN4Tp0SIU
 jtv1NK7dS4Wb0Fq0T7+YdNL/W/Ml/YkRAsZVmseM=
Message-ID: <39125b11-659f-35f4-ac7a-a3ba31365950@digikod.net>
Date: Fri, 5 May 2023 19:01:18 +0200
MIME-Version: 1.0
User-Agent: 
Subject: Re: [PATCH v1 4/9] KVM: x86: Add new hypercall to set EPT permissions
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
 <20230505152046.6575-5-mic@digikod.net> <ZFUyhPuhtMbYdJ76@google.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <ZFUyhPuhtMbYdJ76@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha
Received-SPF: pass client-ip=2001:1600:4:17::1908;
 envelope-from=mic@digikod.net; helo=smtp-1908.mail.infomaniak.ch
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


On 05/05/2023 18:44, Sean Christopherson wrote:
> On Fri, May 05, 2023, Mickaï¿½l Salaï¿½n wrote:
>> Add a new KVM_HC_LOCK_MEM_PAGE_RANGES hypercall that enables a guest to
>> set EPT permissions on a set of page ranges.
> 
> IMO, manipulation of protections, both for memory (this patch) and CPU state
> (control registers in the next patch) should come from userspace.  I have no
> objection to KVM providing plumbing if necessary, but I think userspace needs to
> to have full control over the actual state.

By user space, do you mean the host user space or the guest user space?

About the guest user space, I see several issues to delegate this kind 
of control:
- These are restrictions only relevant to the kernel.
- The threat model is to protect against user space as early as possible.
- It would be more complex for no obvious gain.

This patch series is an extension of the kernel self-protections 
mechanisms, and they are not configured by user space.


> 
> One of the things that caused Intel's control register pinning series to stall
> out was how to handle edge cases like kexec() and reboot.  Deferring to userspace
> means the kernel doesn't need to define policy, e.g. when to unprotect memory,
> and avoids questions like "should userspace be able to overwrite pinned control
> registers".

The idea is to authenticate every changes. For kexec, the VMM (or 
something else) would have to authenticate the new kernel. Do you have 
something else in mind that could legitimately require such memory or CR 
changes?


> 
> And like the confidential VM use case, keeping userspace in the loop is a big
> beneifit, e.g. the guest can't circumvent protections by coercing userspace into
> writing to protected memory .

I don't understand this part. Are you talking about the host user space? 
How the guest could circumvent protections?

