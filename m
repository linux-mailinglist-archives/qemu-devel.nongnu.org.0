Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952D8204443
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 01:06:43 +0200 (CEST)
Received: from localhost ([::1]:43632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnVWU-0000bs-M2
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 19:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jnVV2-0007it-U1
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 19:05:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34298
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jnVV0-0002X0-Aq
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 19:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592867109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QGOgXyP+V6ZX9XlqYc/aL6AiCKn6armXlX3+teRFbrQ=;
 b=K3kYYbqNRZm8MbIdvTIu8kCu9D2YYIJfuS0SrewyoIf6daKuRICzbUcRuW/Nl8WGGdWGe3
 zO2iOrQjMBHRjN1tNH6BOLsSHg6haNliN4N7TnKh4jHpoY6CWI0VroRJDq/GN5rYQWG3rL
 dwD3NEa21kUcm7B/uxOYLhuJ6aHJZTM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-uckqvz3oM3uW0seMceMPAw-1; Mon, 22 Jun 2020 19:05:07 -0400
X-MC-Unique: uckqvz3oM3uW0seMceMPAw-1
Received: by mail-wm1-f72.google.com with SMTP id h6so945748wmb.7
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 16:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QGOgXyP+V6ZX9XlqYc/aL6AiCKn6armXlX3+teRFbrQ=;
 b=qPvAUcqPRIdyCzYdnYd8QpxQRRTaSqn/xuBmQpTlHSt9VYjSVm+MP5O/qd6WlUuIy5
 KYx8yzfkTw3y9kY1YlQfg/aiqbR2mxkBO11ToQgCJK56b7WufodnGXpwYeLurOJ4wJpy
 PDURnHFjhxw0bamS8p3rZZ7etus08mWLKlsPEGtxGajezl5zvHRw8atWzST8Oy1wuCKf
 TFRFKnQS3nUek2t7Bq/5FymnRIA+CoL5BYuwZBaYsnYExtaM8/D4GXEPHPDqUDlyp95n
 6IccewHwEcvLv0Bl7D6nR00AlS1EZ/B49RhyGx/tUuRbCymVFHhXP2hUm7guNvmqUmK/
 TpVA==
X-Gm-Message-State: AOAM533vVock9XJsGDogOYuvDQjOAXFzpErd+YS1/dsxX754TdLjH7Zb
 9FIX8XeX5CiLSRu8cf6DMSorF/4dH2Q0h54PGdq8sl5Wsc5ezYH/MImkByqYOJH8v+4Eu7cIa8D
 X7KKcW27XorcNx4I=
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr7448096wrp.234.1592867105788; 
 Mon, 22 Jun 2020 16:05:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBBEMAjHoewU6Nrlx/mZXv+KZawK3Ben4raFY7rVGgPz59FlY8qkmg7223neCsMd3Vmh9t+w==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr7448056wrp.234.1592867105436; 
 Mon, 22 Jun 2020 16:05:05 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id k11sm16975667wrd.23.2020.06.22.16.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 16:05:04 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm: Check supported KVM features globally (not
 per vCPU)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200619095542.2095-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <51efbadc-8061-47f6-ed0b-9b846ace36d7@redhat.com>
Date: Tue, 23 Jun 2020 01:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200619095542.2095-1-philmd@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/06/20 11:55, Philippe Mathieu-Daudé wrote:
> Since commit d70c996df23f, when enabling the PMU we get:
> 
>   $ qemu-system-aarch64 -cpu host,pmu=on -M virt,accel=kvm,gic-version=3
>   Segmentation fault (core dumped)
> 
>   Thread 1 "qemu-system-aar" received signal SIGSEGV, Segmentation fault.
>   0x0000aaaaaae356d0 in kvm_ioctl (s=0x0, type=44547) at accel/kvm/kvm-all.c:2588
>   2588        ret = ioctl(s->fd, type, arg);
>   (gdb) bt
>   #0  0x0000aaaaaae356d0 in kvm_ioctl (s=0x0, type=44547) at accel/kvm/kvm-all.c:2588
>   #1  0x0000aaaaaae31568 in kvm_check_extension (s=0x0, extension=126) at accel/kvm/kvm-all.c:916
>   #2  0x0000aaaaaafce254 in kvm_arm_pmu_supported (cpu=0xaaaaac214ab0) at target/arm/kvm.c:213
>   #3  0x0000aaaaaafc0f94 in arm_set_pmu (obj=0xaaaaac214ab0, value=true, errp=0xffffffffe438) at target/arm/cpu.c:1111
>   #4  0x0000aaaaab5533ac in property_set_bool (obj=0xaaaaac214ab0, v=0xaaaaac223a80, name=0xaaaaac11a970 "pmu", opaque=0xaaaaac222730, errp=0xffffffffe438) at qom/object.c:2170
>   #5  0x0000aaaaab5512f0 in object_property_set (obj=0xaaaaac214ab0, v=0xaaaaac223a80, name=0xaaaaac11a970 "pmu", errp=0xffffffffe438) at qom/object.c:1328
>   #6  0x0000aaaaab551e10 in object_property_parse (obj=0xaaaaac214ab0, string=0xaaaaac11b4c0 "on", name=0xaaaaac11a970 "pmu", errp=0xffffffffe438) at qom/object.c:1561
>   #7  0x0000aaaaab54ee8c in object_apply_global_props (obj=0xaaaaac214ab0, props=0xaaaaac018e20, errp=0xaaaaabd6fd88 <error_fatal>) at qom/object.c:407
>   #8  0x0000aaaaab1dd5a4 in qdev_prop_set_globals (dev=0xaaaaac214ab0) at hw/core/qdev-properties.c:1218
>   #9  0x0000aaaaab1d9fac in device_post_init (obj=0xaaaaac214ab0) at hw/core/qdev.c:1050
>   ...
>   #15 0x0000aaaaab54f310 in object_initialize_with_type (obj=0xaaaaac214ab0, size=52208, type=0xaaaaabe237f0) at qom/object.c:512
>   #16 0x0000aaaaab54fa24 in object_new_with_type (type=0xaaaaabe237f0) at qom/object.c:687
>   #17 0x0000aaaaab54fa80 in object_new (typename=0xaaaaabe23970 "host-arm-cpu") at qom/object.c:702
>   #18 0x0000aaaaaaf04a74 in machvirt_init (machine=0xaaaaac0a8550) at hw/arm/virt.c:1770
>   #19 0x0000aaaaab1e8720 in machine_run_board_init (machine=0xaaaaac0a8550) at hw/core/machine.c:1138
>   #20 0x0000aaaaaaf95394 in qemu_init (argc=5, argv=0xffffffffea58, envp=0xffffffffea88) at softmmu/vl.c:4348
>   #21 0x0000aaaaaada3f74 in main (argc=<optimized out>, argv=<optimized out>, envp=<optimized out>) at softmmu/main.c:48
> 
> This is because in frame #2, cpu->kvm_state is still NULL
> (the vCPU is not yet realized).
> 
> KVM has a hard requirement of all cores supporting the same
> feature set. We only need to check if the accelerator supports
> a feature, not each vCPU individually.
> 
> Fix by kvm_arm_<FEATURE>_supported() functions take a AccelState
> argument (already realized/valid at this point) instead of a
> CPUState argument.
> 
> Reported-by: Haibo Xu <haibo.xu@linaro.org>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Use global kvm_state (bonzini)
> 
> Paolo, does this break migration of encrypted memory assumptions?
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Supersedes: <20200617130800.26355-1-philmd@redhat.com>
> ---
>  target/arm/kvm_arm.h | 21 +++++++++------------
>  target/arm/cpu.c     |  2 +-
>  target/arm/cpu64.c   | 10 +++++-----
>  target/arm/kvm.c     |  4 ++--
>  target/arm/kvm64.c   | 14 +++++---------
>  5 files changed, 22 insertions(+), 29 deletions(-)
> 
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 48bf5e16d5..a4ce4fd93d 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -269,29 +269,26 @@ void kvm_arm_add_vcpu_properties(Object *obj);
>  
>  /**
>   * kvm_arm_aarch32_supported:
> - * @cs: CPUState
>   *
> - * Returns: true if the KVM VCPU can enable AArch32 mode
> + * Returns: true if KVM can enable AArch32 mode
>   * and false otherwise.
>   */
> -bool kvm_arm_aarch32_supported(CPUState *cs);
> +bool kvm_arm_aarch32_supported(void);
>  
>  /**
>   * kvm_arm_pmu_supported:
> - * @cs: CPUState
>   *
> - * Returns: true if the KVM VCPU can enable its PMU
> + * Returns: true if KVM can enable the PMU
>   * and false otherwise.
>   */
> -bool kvm_arm_pmu_supported(CPUState *cs);
> +bool kvm_arm_pmu_supported(void);
>  
>  /**
>   * kvm_arm_sve_supported:
> - * @cs: CPUState
>   *
> - * Returns true if the KVM VCPU can enable SVE and false otherwise.
> + * Returns true if KVM can enable SVE and false otherwise.
>   */
> -bool kvm_arm_sve_supported(CPUState *cs);
> +bool kvm_arm_sve_supported(void);
>  
>  /**
>   * kvm_arm_get_max_vm_ipa_size:
> @@ -359,17 +356,17 @@ static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>  
>  static inline void kvm_arm_add_vcpu_properties(Object *obj) {}
>  
> -static inline bool kvm_arm_aarch32_supported(CPUState *cs)
> +static inline bool kvm_arm_aarch32_supported(void)
>  {
>      return false;
>  }
>  
> -static inline bool kvm_arm_pmu_supported(CPUState *cs)
> +static inline bool kvm_arm_pmu_supported(void)
>  {
>      return false;
>  }
>  
> -static inline bool kvm_arm_sve_supported(CPUState *cs)
> +static inline bool kvm_arm_sve_supported(void)
>  {
>      return false;
>  }
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5b7a36b5d7..e44e18062c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1108,7 +1108,7 @@ static void arm_set_pmu(Object *obj, bool value, Error **errp)
>      ARMCPU *cpu = ARM_CPU(obj);
>  
>      if (value) {
> -        if (kvm_enabled() && !kvm_arm_pmu_supported(CPU(cpu))) {
> +        if (kvm_enabled() && !kvm_arm_pmu_supported()) {
>              error_setg(errp, "'pmu' feature not supported by KVM on this host");
>              return;
>          }
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 778cecc2e6..a0c1d8894b 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -266,7 +266,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>  
>      /* Collect the set of vector lengths supported by KVM. */
>      bitmap_zero(kvm_supported, ARM_MAX_VQ);
> -    if (kvm_enabled() && kvm_arm_sve_supported(CPU(cpu))) {
> +    if (kvm_enabled() && kvm_arm_sve_supported()) {
>          kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
>      } else if (kvm_enabled()) {
>          assert(!cpu_isar_feature(aa64_sve, cpu));
> @@ -473,7 +473,7 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> -    if (kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
> +    if (kvm_enabled() && !kvm_arm_sve_supported()) {
>          error_setg(errp, "cannot set sve-max-vq");
>          error_append_hint(errp, "SVE not supported by KVM on this host\n");
>          return;
> @@ -519,7 +519,7 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> -    if (value && kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
> +    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
>          error_setg(errp, "cannot enable %s", name);
>          error_append_hint(errp, "SVE not supported by KVM on this host\n");
>          return;
> @@ -556,7 +556,7 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> -    if (value && kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
> +    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
>          error_setg(errp, "'sve' feature not supported by KVM on this host");
>          return;
>      }
> @@ -751,7 +751,7 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>       * uniform execution state like do_interrupt.
>       */
>      if (value == false) {
> -        if (!kvm_enabled() || !kvm_arm_aarch32_supported(CPU(cpu))) {
> +        if (!kvm_enabled() || !kvm_arm_aarch32_supported()) {
>              error_setg(errp, "'aarch64' feature cannot be disabled "
>                               "unless KVM is enabled and 32-bit EL1 "
>                               "is supported");
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index eef3bbd1cc..7c672c78b8 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -208,9 +208,9 @@ void kvm_arm_add_vcpu_properties(Object *obj)
>      }
>  }
>  
> -bool kvm_arm_pmu_supported(CPUState *cpu)
> +bool kvm_arm_pmu_supported(void)
>  {
> -    return kvm_check_extension(cpu->kvm_state, KVM_CAP_ARM_PMU_V3);
> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
>  }
>  
>  int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index f09ed9f4df..3dc494aaa7 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -652,18 +652,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      return true;
>  }
>  
> -bool kvm_arm_aarch32_supported(CPUState *cpu)
> +bool kvm_arm_aarch32_supported(void)
>  {
> -    KVMState *s = KVM_STATE(current_accel());
> -
> -    return kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL1_32BIT);
>  }
>  
> -bool kvm_arm_sve_supported(CPUState *cpu)
> +bool kvm_arm_sve_supported(void)
>  {
> -    KVMState *s = KVM_STATE(current_accel());
> -
> -    return kvm_check_extension(s, KVM_CAP_ARM_SVE);
> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
>  }
>  
>  QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
> @@ -798,7 +794,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          env->features &= ~(1ULL << ARM_FEATURE_PMU);
>      }
>      if (cpu_isar_feature(aa64_sve, cpu)) {
> -        assert(kvm_arm_sve_supported(cs));
> +        assert(kvm_arm_sve_supported());
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
>      }
>  
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

I think the patch and the test can go through the ARM tree.

Thanks,

Paolo


