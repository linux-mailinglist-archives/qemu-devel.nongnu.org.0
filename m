Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC7D4053C9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 15:12:18 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOJqi-0000HG-2z
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 09:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOJoL-0006sC-0n
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:09:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOJoG-0005GV-P5
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631192982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCREa2u0EkUNSsEaG42GlzhdyUwqFP0paOZReeYrf78=;
 b=bURp6THUtnmTgPx3qdc9VdeUIZriQWMUFzQCaYZTQ86AtdM1qtyuAncUjSQ5zKk0lmavS8
 J8CrP1ceyugboi7KDlCsh66FVQOjYTmFEAn5j77N9a5Qk/TovRBB4bC9NX4cuKVM3sSPnb
 Wt++Xk52F46Azrd7CJC6sRKYovjNwZo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-IdeUQbM1Ow6k8o9orx_j3Q-1; Thu, 09 Sep 2021 09:09:41 -0400
X-MC-Unique: IdeUQbM1Ow6k8o9orx_j3Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so856220wmk.2
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 06:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WCREa2u0EkUNSsEaG42GlzhdyUwqFP0paOZReeYrf78=;
 b=XD871xsW1jqUsQL+tNjDUtQ6qPqhSd6CwQetTpuPYkv61tsC09zKPYQ5h/cA61/QWX
 fA+3OoZfLSHlN+PmDeK+BEgp7vDs0hL3UCWfCnFTPlLxeV3mfghPeAJ7d8HF9gtZ27RM
 mcIuGxnIGUJvvUsJU1iyyFKb1aMnAZaLB3Dr7W2xoUtCdWzOxK0fl5ZvRTaVTainGV07
 heNzHdtz2S1qPS9nlLdhTuI5+HDjPz1xsQp0JCaL44P3TJRsqVuCSutJZdoJlfD8a3BI
 J1zfIqAmcrx4s4/ZMchFgJ5QhKXsFhxclcng4qVYphkFbHVl8cCBZ9hv+oIKShj4djhQ
 iuyQ==
X-Gm-Message-State: AOAM530mUG9LyXvjO+EM29xTpb/UGAN0TTilJpCBLZDHMxBjLvCKHQ2/
 sHaI5CuMeOZ0BZL1oWbdFsjHKkBa2ioF2xnciO7rzZb3kdIcIVnUCv/GcDHOtb/R9OeKdqZq/LY
 Cnkiy5M1aMey6T+0=
X-Received: by 2002:a5d:4f88:: with SMTP id d8mr3546366wru.358.1631192980490; 
 Thu, 09 Sep 2021 06:09:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ0zfHOpcsIgBYnEHlyB/0/SAOUiBs/9PJnnZT66diI+tFsx2KDcVyX/JMLeQQNNmThRj75w==
X-Received: by 2002:a5d:4f88:: with SMTP id d8mr3546340wru.358.1631192980236; 
 Thu, 09 Sep 2021 06:09:40 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y24sm1681724wma.9.2021.09.09.06.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 06:09:39 -0700 (PDT)
Subject: Re: [PULL v4 21/43] i386: Update SGX CPUID info according to
 hardware/KVM/user input
To: qemu-devel@nongnu.org, Yang Zhong <yang.zhong@intel.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
 <20210908100426.264356-22-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9154070d-dbde-ae6e-5634-db7e814393d4@redhat.com>
Date: Thu, 9 Sep 2021 15:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908100426.264356-22-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 12:04 PM, Paolo Bonzini wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Expose SGX to the guest if and only if KVM is enabled and supports
> virtualization of SGX.  While the majority of ENCLS can be emulated to
> some degree, because SGX uses a hardware-based root of trust, the
> attestation aspects of SGX cannot be emulated in software, i.e.
> ultimately emulation will fail as software cannot generate a valid
> quote/report.  The complexity of partially emulating SGX in Qemu far
> outweighs the value added, e.g. an SGX specific simulator for userspace
> applications can emulate SGX for development and testing purposes.
> 
> Note, access to the PROVISIONKEY is not yet advertised to the guest as
> KVM blocks access to the PROVISIONKEY by default and requires userspace
> to provide additional credentials (via ioctl()) to expose PROVISIONKEY.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

'---' separator goes here.

> 
> v3-->v4:
>    - Replaced g_malloc0() with directly ....
> Message-Id: <20210719112136.57018-13-yang.zhong@intel.com>
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/i386/sgx.c             | 17 +++++++++
>  include/hw/i386/sgx-epc.h |  2 +
>  target/i386/cpu.c         | 77 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+)
> 
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index e77deb0b00..5f988c6368 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -18,6 +18,23 @@
>  #include "qapi/error.h"
>  #include "exec/address-spaces.h"
>  
> +int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
> +{
> +    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
> +    SGXEPCDevice *epc;
> +
> +    if (pcms->sgx_epc.size == 0 || pcms->sgx_epc.nr_sections <= section_nr) {
> +        return 1;
> +    }
> +
> +    epc = pcms->sgx_epc.sections[section_nr];
> +
> +    *addr = epc->addr;
> +    *size = memory_device_get_region_size(MEMORY_DEVICE(epc), &error_fatal);
> +
> +    return 0;

Undocumented, but IIUC this return a boolean.

> +}
> +
>  static int sgx_epc_set_property(void *opaque, const char *name,
>                                  const char *value, Error **errp)
>  {
> diff --git a/include/hw/i386/sgx-epc.h b/include/hw/i386/sgx-epc.h
> index 2b2490892b..f85fd2a4ca 100644
> --- a/include/hw/i386/sgx-epc.h
> +++ b/include/hw/i386/sgx-epc.h
> @@ -55,4 +55,6 @@ typedef struct SGXEPCState {
>      int nr_sections;
>  } SGXEPCState;
>  
> +int sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size);

bool.

> +
>  #endif
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 59cb2c2d03..38cf507199 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -36,6 +36,7 @@
>  #ifndef CONFIG_USER_ONLY
>  #include "exec/address-spaces.h"
>  #include "hw/boards.h"
> +#include "hw/i386/sgx-epc.h"
>  #endif
>  
>  #include "disas/capstone.h"
> @@ -5334,6 +5335,25 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>                  *ecx |= CPUID_7_0_ECX_OSPKE;
>              }
>              *edx = env->features[FEAT_7_0_EDX]; /* Feature flags */
> +
> +            /*
> +             * SGX cannot be emulated in software.  If hardware does not
> +             * support enabling SGX and/or SGX flexible launch control,
> +             * then we need to update the VM's CPUID values accordingly.
> +             */
> +            if ((*ebx & CPUID_7_0_EBX_SGX) &&
> +                (!kvm_enabled() ||
> +                 !(kvm_arch_get_supported_cpuid(cs->kvm_state, 0x7, 0, R_EBX) &
> +                    CPUID_7_0_EBX_SGX))) {
> +                *ebx &= ~CPUID_7_0_EBX_SGX;
> +            }
> +
> +            if ((*ecx & CPUID_7_0_ECX_SGX_LC) &&
> +                (!(*ebx & CPUID_7_0_EBX_SGX) || !kvm_enabled() ||
> +                 !(kvm_arch_get_supported_cpuid(cs->kvm_state, 0x7, 0, R_ECX) &
> +                    CPUID_7_0_ECX_SGX_LC))) {
> +                *ecx &= ~CPUID_7_0_ECX_SGX_LC;
> +            }
>          } else if (count == 1) {
>              *eax = env->features[FEAT_7_1_EAX];
>              *ebx = 0;
> @@ -5469,6 +5489,63 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>          }
>          break;
>      }
> +    case 0x12:
> +#ifndef CONFIG_USER_ONLY
> +        if (!kvm_enabled() ||
> +            !(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX)) {
> +            *eax = *ebx = *ecx = *edx = 0;
> +            break;
> +        }
> +
> +        /*
> +         * SGX sub-leafs CPUID.0x12.{0x2..N} enumerate EPC sections.  Retrieve
> +         * the EPC properties, e.g. confidentiality and integrity, from the
> +         * host's first EPC section, i.e. assume there is one EPC section or
> +         * that all EPC sections have the same security properties.
> +         */
> +        if (count > 1) {
> +            uint64_t epc_addr, epc_size;
> +
> +            if (sgx_epc_get_section(count - 2, &epc_addr, &epc_size)) {

Missing stub for when CONFIG_SGX=n:

bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
{
    g_assert_not_reached();
}


