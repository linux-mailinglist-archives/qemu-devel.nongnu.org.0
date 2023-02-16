Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F326995F2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:40:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSeTh-0001BZ-C0; Thu, 16 Feb 2023 08:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSeTf-0001BO-6D
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:39:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSeTd-0004cB-Dw
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676554748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykCkMNCDNn73m4nYQTnGBP9VrDWDb5/u+6fmYUr1+5Q=;
 b=Tu/SJ2vmuXJK+GvctKHlYQ6LQX5saIWu8nMB2NBuDOcPqutid2qa+DEULI4xyti2AUB/ng
 iZXypE7OSRFjpl5zMw5a3eO0AvsXtXqA5XUw1EkD5jKxBLpF6YhrD9wnB8ApCNfjKLb7lO
 ygxCZ1Dncg7zkK7fR05BXVNgyfw28rE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-q0dNsAyiMRSY37YOdqQd3w-1; Thu, 16 Feb 2023 08:39:07 -0500
X-MC-Unique: q0dNsAyiMRSY37YOdqQd3w-1
Received: by mail-qv1-f71.google.com with SMTP id
 pv24-20020ad45498000000b0056ea549d728so1079744qvb.10
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ykCkMNCDNn73m4nYQTnGBP9VrDWDb5/u+6fmYUr1+5Q=;
 b=tvNIpBxMfBGpY27WOxQdckCAQxAvnoSMJ23ZEG3kHktsvNAGPWlS8K3HD33X6X9lUL
 R14ElKZp0crpfCgVOtIiFIKCaPl/KOkwPbjoehoRzDuY2y/vrFNsLqScDj7BYfCRTkfm
 JP8Hof/QHpsd0ObV/9RJwwFCMRPvg+JL9hoDD5ruNsly6hQgJoFSvZJSEv7oMQWeffWH
 aR1W2KART54Ju2VYsBIQD+jmFvBrtl/c5D5QUT3VTOfWVkG67FmQqgAiyjtPJEnuOMpw
 0Amp8z1RufupaTKLT0NuYJJabfy8ZdQIPSEoFHM1pJaKqwmqpGgf8jMAllT01js3OrSh
 oH3w==
X-Gm-Message-State: AO0yUKU88AZTnD8F28jk/1pia4wqBJgKE6HgzYq3Z/SMgiJLUpj49ZbM
 64IFdSuYqrRJtAkYWsaLf1xdptQx9MyfUhf4rH+bZFANCjE/bKG8YLjIokulpuCEBVxQ935c+dR
 GBAUu7LgG8Hnmseg=
X-Received: by 2002:ac8:57cc:0:b0:3ba:13dd:f253 with SMTP id
 w12-20020ac857cc000000b003ba13ddf253mr9539830qta.7.1676554746895; 
 Thu, 16 Feb 2023 05:39:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9PWgysn8lAEtx7OGp31duH0K3vAMhN9xaeDNssac30D2Oqd0WBUcDov47PQ5+La5e5NqVGIQ==
X-Received: by 2002:ac8:57cc:0:b0:3ba:13dd:f253 with SMTP id
 w12-20020ac857cc000000b003ba13ddf253mr9539776qta.7.1676554746472; 
 Thu, 16 Feb 2023 05:39:06 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 t21-20020ac87615000000b003bb8c60cdf1sm1220572qtq.78.2023.02.16.05.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 05:39:05 -0800 (PST)
Message-ID: <1f2865ee-6780-5e25-d538-43de0b367c2d@redhat.com>
Date: Thu, 16 Feb 2023 14:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-21-zhao1.liu@linux.intel.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC 20/52] s390x: Replace MachineState.smp access with topology
 helpers
In-Reply-To: <20230213095035.158240-21-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13/02/2023 10.50, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> When MachineState.topo is introduced, the topology related structures
> become complicated. So we wrapped the access to topology fields of
> MachineState.topo into some helpers, and we are using these helpers
> to replace the use of MachineState.smp.
> 
> In hw/s390x/s390-virtio-ccw.c, s390_init_cpus() needs "threads per core".
> Before s390x supports hybrid, here we use smp-specific interface to get
> "threads per core".
> 
> For other cases, it's straightforward to replace topology access with
> wrapped generic interfaces.
...
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 3ac7ec9acf4e..d297daed1117 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -406,9 +406,11 @@ unsigned long kvm_arch_vcpu_id(CPUState *cpu)
>   
>   int kvm_arch_init_vcpu(CPUState *cs)
>   {
> -    unsigned int max_cpus = MACHINE(qdev_get_machine())->smp.max_cpus;
> +    unsigned int max_cpus;
>       S390CPU *cpu = S390_CPU(cs);
> +
>       kvm_s390_set_cpu_state(cpu, cpu->env.cpu_state);
> +    max_cpus = machine_topo_get_max_cpus(MACHINE(qdev_get_machine()));
>       cpu->irqstate = g_malloc0(VCPU_IRQ_BUF_SIZE(max_cpus));
>       return 0;
>   }
> @@ -2097,14 +2099,15 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
>   
>   void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu)
>   {
> -    unsigned int max_cpus = MACHINE(qdev_get_machine())->smp.max_cpus;
> -    struct kvm_s390_irq_state irq_state = {
> -        .buf = (uint64_t) cpu->irqstate,
> -        .len = VCPU_IRQ_BUF_SIZE(max_cpus),
> -    };
> +    unsigned int max_cpus;
> +    struct kvm_s390_irq_state irq_state;
>       CPUState *cs = CPU(cpu);
>       int32_t bytes;
>   
> +    max_cpus = machine_topo_get_max_cpus(MACHINE(qdev_get_machine()));
> +    irq_state.buf = (uint64_t) cpu->irqstate;
> +    irq_state.len = VCPU_IRQ_BUF_SIZE(max_cpus);

  Hi!

Please don't replace struct initializers like this. There's a reason why 
these structs like irq_state are directly initialized with "= { ... }" at 
the beginning of the function: This automatically clears all fields that are 
not mentioned, e.g. also the "flags" field of struct kvm_s390_irq_state, 
which can be very important for structs that are passed to the kernel via an 
ioctl.
You could use memset(..., 0, ...) instead, but people tend to forget that, 
too, so we settled on using struct initializers at the beginning instead. So 
please stick to that.

  Thanks,
   Thomas


>       if (!kvm_check_extension(kvm_state, KVM_CAP_S390_IRQ_STATE)) {
>           return;
>       }
> diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
> index bc767f044381..e396a89d5540 100644
> --- a/target/s390x/tcg/excp_helper.c
> +++ b/target/s390x/tcg/excp_helper.c
> @@ -321,7 +321,7 @@ static void do_ext_interrupt(CPUS390XState *env)
>       if ((env->pending_int & INTERRUPT_EMERGENCY_SIGNAL) &&
>           (env->cregs[0] & CR0_EMERGENCY_SIGNAL_SC)) {
>           MachineState *ms = MACHINE(qdev_get_machine());
> -        unsigned int max_cpus = ms->smp.max_cpus;
> +        unsigned int max_cpus = machine_topo_get_max_cpus(ms);
>   
>           lowcore->ext_int_code = cpu_to_be16(EXT_EMERGENCY);
>           cpu_addr = find_first_bit(env->emergency_signals, S390_MAX_CPUS);


