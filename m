Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2810822C1D0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 11:14:23 +0200 (CEST)
Received: from localhost ([::1]:39360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jytmY-0001i1-74
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 05:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jytlG-0000AL-JW
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 05:13:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50584
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jytlE-0004Xo-V4
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 05:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595581980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q7/A08mRNvKPkpe1O34UkyU7O620zZMdCRx7mxDjxek=;
 b=JlEe+EpWfzlK+ueRYe+eYVcLjxshBI6vrQt6mTyAmsQBmi2+i7eIoTJG9RGhb0bBWXkpBo
 oZCMp6bEyPY2CimGJQZQQR2hh9ROpvpJRMO0ebD7j8jFTL3ZD5OOzY7GCuPmTeNE50sSt3
 8mkjdCXicdwFq2Rt9pb+xmnt/ZPp4cw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-F3gySzlaNGq2XgOdAgSoTg-1; Fri, 24 Jul 2020 05:12:56 -0400
X-MC-Unique: F3gySzlaNGq2XgOdAgSoTg-1
Received: by mail-wr1-f71.google.com with SMTP id f14so1959607wrm.22
 for <qemu-devel@nongnu.org>; Fri, 24 Jul 2020 02:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=q7/A08mRNvKPkpe1O34UkyU7O620zZMdCRx7mxDjxek=;
 b=eguGG35efYpUEpYx/VjleOS63dX1xduSDJ4NLmFpGt7pezU9BQ9J15fofhqcDQ9S5+
 JNeqIYadWoXVuNm8TZwDsXh8xJ99ucPvavMtwvIgHWyJAiOIQL97nqRdtAb5Oc3aQoE3
 sLixIyEuS+bKnMtdYC+BocIAdUjJ5NxCSxlykNM/nAbF0mNJ98NcIolOoq5423Rt9Rao
 tbZFQWM62k9W+2JpwLHWl7R2PdpZ1b9NZ+FLu6+iToGaUcVtgzd5TezHmZuFNeuFl5rE
 8n/3nqlp7JrtAWcyOygAvTJlHuwzGPc1pOr206b3SQBa7pz2JwN8wWEiHF/kSNPHrBv1
 8DlQ==
X-Gm-Message-State: AOAM530J9TVKUmh9zXi+XPTi1Dj5j7/oznoL8XkdV82hR89aSrz2pCCx
 vYL6Gq7GRHL94qJYpZZt+txLaDFKCFtdiYpwmsTVjmZVywQIrpGRNVSBFROGiY4hPraSxmn84g8
 zyhJE0Ge4wyNVuD8=
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr8226163wmg.39.1595581974909;
 Fri, 24 Jul 2020 02:12:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd2W5G9f6O76yo0FemnyPQHJKhQnSVHlsnudhiwc25GlPzJNu/DWYy8rwhZkMafSTsQTTdIg==
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr8226134wmg.39.1595581974518;
 Fri, 24 Jul 2020 02:12:54 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id 14sm6236352wmk.19.2020.07.24.02.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jul 2020 02:12:53 -0700 (PDT)
Subject: Re: [PATCH] pseries: fix kvmppc_set_fwnmi()
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20200724083533.281700-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <375c9cb8-ec59-9d30-000d-b58d14be0aa6@redhat.com>
Date: Fri, 24 Jul 2020 11:12:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200724083533.281700-1-lvivier@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 01:23:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, npiggin@gmail.com,
 kvm@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/24/20 10:35 AM, Laurent Vivier wrote:
> QEMU issues the ioctl(KVM_CAP_PPC_FWNMI) on the first vCPU.
> 
> If the first vCPU is currently running, the vCPU mutex is held
> and the ioctl() cannot be done and waits until the mutex is released.
> This never happens and the VM is stuck.
> 
> To avoid this deadlock, issue the ioctl on the same vCPU doing the
> RTAS call.
> 
> The problem can be reproduced by booting a guest with several vCPUs
> (the probability to have the problem is (n - 1) / n,  n = # of CPUs),
> and then by triggering a kernel crash with "echo c >/proc/sysrq-trigger".
> 
> On the reboot, the kernel hangs after:
> 
> ...
> [    0.000000] -----------------------------------------------------
> [    0.000000] ppc64_pft_size    = 0x0
> [    0.000000] phys_mem_size     = 0x48000000
> [    0.000000] dcache_bsize      = 0x80
> [    0.000000] icache_bsize      = 0x80
> [    0.000000] cpu_features      = 0x0001c06f8f4f91a7
> [    0.000000]   possible        = 0x0003fbffcf5fb1a7
> [    0.000000]   always          = 0x00000003800081a1
> [    0.000000] cpu_user_features = 0xdc0065c2 0xaee00000
> [    0.000000] mmu_features      = 0x3c006041
> [    0.000000] firmware_features = 0x00000085455a445f
> [    0.000000] physical_start    = 0x8000000
> [    0.000000] -----------------------------------------------------
> [    0.000000] numa:   NODE_DATA [mem 0x47f33c80-0x47f3ffff]
> 
> Fixes: ec010c00665b ("ppc/spapr: KVM FWNMI should not be enabled until guest requests it")
> Cc: npiggin@gmail.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/ppc/spapr_rtas.c  | 2 +-
>  target/ppc/kvm.c     | 3 +--
>  target/ppc/kvm_ppc.h | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index bcac0d00e7b6..513c7a84351b 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -438,7 +438,7 @@ static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
>      }
>  
>      if (kvm_enabled()) {
> -        if (kvmppc_set_fwnmi() < 0) {
> +        if (kvmppc_set_fwnmi(cpu) < 0) {
>              rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
>              return;
>          }
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 2692f76130aa..d85ba8ffe00b 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2071,9 +2071,8 @@ bool kvmppc_get_fwnmi(void)
>      return cap_fwnmi;
>  }
>  
> -int kvmppc_set_fwnmi(void)
> +int kvmppc_set_fwnmi(PowerPCCPU *cpu)
>  {
> -    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
>      CPUState *cs = CPU(cpu);
>  
>      return kvm_vcpu_enable_cap(cs, KVM_CAP_PPC_FWNMI, 0);
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index 701c0c262be2..72e05f1cd2fc 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -28,7 +28,7 @@ void kvmppc_set_papr(PowerPCCPU *cpu);
>  int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
>  void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
>  bool kvmppc_get_fwnmi(void);
> -int kvmppc_set_fwnmi(void);
> +int kvmppc_set_fwnmi(PowerPCCPU *cpu);
>  int kvmppc_smt_threads(void);
>  void kvmppc_error_append_smt_possible_hint(Error *const *errp);
>  int kvmppc_set_smt_threads(int smt);
> @@ -169,7 +169,7 @@ static inline bool kvmppc_get_fwnmi(void)
>      return false;
>  }
>  
> -static inline int kvmppc_set_fwnmi(void)
> +static inline int kvmppc_set_fwnmi(PowerPCCPU *cpu)
>  {
>      return -1;
>  }
> 


