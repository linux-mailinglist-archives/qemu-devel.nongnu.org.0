Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4C13109BC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:02:57 +0100 (CET)
Received: from localhost ([::1]:44420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yt6-0000bq-IE
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7yq7-0007jz-Lf
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:59:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7yq5-0002LG-E5
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612522788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FWEbYiIl2mPic9AVqqzSqXwMZeGmN0DaILU6NQPe7NM=;
 b=IUZt2n4nUmaObBhuJVMcAkzelanPi7c8ZJ9kHr+A/5Iqhb525Zs2+SwFJynWgbOA7MHSUu
 2gla/pLoIQhkONBLW4SEAMKC06OlLlwJss5tqAKqcOOoiGxbp9Hgy6vTzpSlDUWu9zMx2e
 7IXssRsu39yWEOsHv5y2V794c3F6SV4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-QAi02g9-MNCQGzlH3DPsOQ-1; Fri, 05 Feb 2021 05:59:45 -0500
X-MC-Unique: QAi02g9-MNCQGzlH3DPsOQ-1
Received: by mail-ed1-f70.google.com with SMTP id bd22so6788637edb.4
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 02:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWEbYiIl2mPic9AVqqzSqXwMZeGmN0DaILU6NQPe7NM=;
 b=Vr1Q18qUxmI4oq6mJoh8OhHY2viqMkZLTnfvU4pS5+R49u0t3y6UASOMCLbwm9SBdw
 zBzI1M1vs7SxvKComHwq3ReqQwolsw3qcIUNd0usP64NtDS3Lh/5g5gdYyOi3MFCX8fh
 mf7p0rfIsihoaTudEXsCumKfJhhX3LSUQ9MsxeSy0IhZ9BBo2uEZQkCP5tZIfLlKmeWI
 TjpoljVHDzjt4JDZ6+ZA16XA6Bt+z23FNoDOBqRAdgYddgh6uORoA1OJqP3WpJEv/sF1
 C2yWJhrDP1/2+9R86Lh+xeoKuwKIOvjb2jXQbfUw6QQPXlrqMIs1F9suRS2m5+8qhzsP
 oreA==
X-Gm-Message-State: AOAM532HqlYmX2AD/eJNvDLl/PK8urAE4j6rb26E3Puzs8em1hfXxiwG
 yQwO5ZuITpquudAvTQlF84EUNtJIw550m8dlUq5LyGjCWSNMns14arBx93imr0pY4Y9qdGS565n
 MYzDzVOCuVKFKqvo=
X-Received: by 2002:a17:906:cf89:: with SMTP id
 um9mr3529381ejb.189.1612522784266; 
 Fri, 05 Feb 2021 02:59:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyicYZ7U5+td54yQvw/EmYQEep7zZoL7Z/iHsgVsTvXCI+OmMZnm8j+EI9h1mLD7ZwFN6rfqQ==
X-Received: by 2002:a17:906:cf89:: with SMTP id
 um9mr3529357ejb.189.1612522784023; 
 Fri, 05 Feb 2021 02:59:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r9sm3707707eju.74.2021.02.05.02.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 02:59:42 -0800 (PST)
Subject: Re: [PATCH v6 0/6] Qemu SEV-ES guest support
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <cover.1611682609.git.thomas.lendacky@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9cfe8d87-c440-6ce8-7b1c-beb46e17c173@redhat.com>
Date: Fri, 5 Feb 2021 11:59:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1611682609.git.thomas.lendacky@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Jiri Slaby <jslaby@suse.cz>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/21 18:36, Tom Lendacky wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> This patch series provides support for launching an SEV-ES guest.
> 
> Secure Encrypted Virtualization - Encrypted State (SEV-ES) expands on the
> SEV support to protect the guest register state from the hypervisor. See
> "AMD64 Architecture Programmer's Manual Volume 2: System Programming",
> section "15.35 Encrypted State (SEV-ES)" [1].
> 
> In order to allow a hypervisor to perform functions on behalf of a guest,
> there is architectural support for notifying a guest's operating system
> when certain types of VMEXITs are about to occur. This allows the guest to
> selectively share information with the hypervisor to satisfy the requested
> function. The notification is performed using a new exception, the VMM
> Communication exception (#VC). The information is shared through the
> Guest-Hypervisor Communication Block (GHCB) using the VMGEXIT instruction.
> The GHCB format and the protocol for using it is documented in "SEV-ES
> Guest-Hypervisor Communication Block Standardization" [2].
> 
> The main areas of the Qemu code that are updated to support SEV-ES are
> around the SEV guest launch process and AP booting in order to support
> booting multiple vCPUs.
> 
> There are no new command line switches required. Instead, the desire for
> SEV-ES is presented using the SEV policy object. Bit 2 of the SEV policy
> object indicates that SEV-ES is required.
> 
> The SEV launch process is updated in two ways. The first is that a the
> KVM_SEV_ES_INIT ioctl is used to initialize the guest instead of the
> standard KVM_SEV_INIT ioctl. The second is that before the SEV launch
> measurement is calculated, the LAUNCH_UPDATE_VMSA SEV API is invoked for
> each vCPU that Qemu has created. Once the LAUNCH_UPDATE_VMSA API has been
> invoked, no direct changes to the guest register state can be made.
> 
> AP booting poses some interesting challenges. The INIT-SIPI-SIPI sequence
> is typically used to boot the APs. However, the hypervisor is not allowed
> to update the guest registers. For the APs, the reset vector must be known
> in advance. An OVMF method to provide a known reset vector address exists
> by providing an SEV information block, identified by UUID, near the end of
> the firmware [3]. OVMF will program the jump to the actual reset vector in
> this area of memory. Since the memory location is known in advance, an AP
> can be created with the known reset vector address as its starting CS:IP.
> The GHCB document [2] talks about how SMP booting under SEV-ES is
> performed. SEV-ES also requires the use of the in-kernel irqchip support
> in order to minimize the changes required to Qemu to support AP booting.
> 
> [1] https://www.amd.com/system/files/TechDocs/24593.pdf
> [2] https://developer.amd.com/wp-content/resources/56421.pdf
> [3] 30937f2f98c4 ("OvmfPkg: Use the SEV-ES work area for the SEV-ES AP reset vector")
>      https://github.com/tianocore/edk2/commit/30937f2f98c42496f2f143fe8374ae7f7e684847
> 
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> 
> ---
> 
> These patches are based on commit:
> 9cd69f1a27 ("Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-25-1' into staging")
> 
> Additionally, these patches pre-req the following patch series that has
> not yet been accepted into the Qemu tree:
> 
> [PATCH v2 0/2] sev: enable secret injection to a self described area in OVMF
>    https://lore.kernel.org/qemu-devel/20201214154429.11023-1-jejb@linux.ibm.com/
> 
> A version of the tree can be found at:
> https://github.com/AMDESE/qemu/tree/sev-es-v14
> 
> Changes since v5:
> - Rework the reset prevention patch to not issue the error message if the
>    --no-reboot option has been specified for SEV-ES guests.
> 
> Changes since v4:
> - Add support for an updated Firmware GUID table implementation, that
>    is now present in OVMF SEV-ES firmware, when searching for the reset
>    vector information. The code will check for the new implementation
>    first, followed by the original implementation to maintain backward
>    compatibility.
> 
> Changes since v3:
> - Use the QemuUUID structure for GUID definitions
> - Use SEV-ES policy bit definition from target/i386/sev_i386.h
> - Update SMM support to a per-VM check in order to check SMM capability
>    at the VM level since SEV-ES guests don't currently support SMM
> - Make the CPU resettable check an arch-specific check
> 
> Changes since v2:
> - Add in-kernel irqchip requirement for SEV-ES guests
> 
> Changes since v1:
> - Fixed checkpatch.pl errors/warnings
> 
> Tom Lendacky (6):
>    sev/i386: Add initial support for SEV-ES
>    sev/i386: Require in-kernel irqchip support for SEV-ES guests
>    sev/i386: Allow AP booting under SEV-ES
>    sev/i386: Don't allow a system reset under an SEV-ES guest
>    kvm/i386: Use a per-VM check for SMM capability
>    sev/i386: Enable an SEV-ES guest based on SEV policy
> 
>   accel/kvm/kvm-all.c       |  69 +++++++++++++++++++++
>   accel/stubs/kvm-stub.c    |   5 ++
>   hw/i386/pc_sysfw.c        |  10 ++-
>   include/sysemu/cpus.h     |   2 +
>   include/sysemu/hw_accel.h |   5 ++
>   include/sysemu/kvm.h      |  26 ++++++++
>   include/sysemu/sev.h      |   3 +
>   softmmu/cpus.c            |   5 ++
>   softmmu/runstate.c        |   3 +
>   target/arm/kvm.c          |   5 ++
>   target/i386/cpu.c         |   1 +
>   target/i386/kvm/kvm.c     |  10 ++-
>   target/i386/sev-stub.c    |   6 ++
>   target/i386/sev.c         | 124 +++++++++++++++++++++++++++++++++++++-
>   target/i386/sev_i386.h    |   1 +
>   target/mips/kvm.c         |   5 ++
>   target/ppc/kvm.c          |   5 ++
>   target/s390x/kvm.c        |   5 ++
>   18 files changed, 286 insertions(+), 4 deletions(-)
> 

Queued, thanks.

Paolo


