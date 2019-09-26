Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5A0BEC55
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 09:09:09 +0200 (CEST)
Received: from localhost ([::1]:59894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDNtk-0004RB-3w
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 03:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iDNsT-000379-OD
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iDNsR-0004QA-Ql
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:07:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33542)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iDNsL-0004LE-7W; Thu, 26 Sep 2019 03:07:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 35CC0307D98A;
 Thu, 26 Sep 2019 07:07:40 +0000 (UTC)
Received: from [10.36.117.64] (ovpn-117-64.ams2.redhat.com [10.36.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E157D1001B00;
 Thu, 26 Sep 2019 07:07:37 +0000 (UTC)
Subject: Re: [PATCH v4 9/9] target/arm/kvm: host cpu: Add support for sve<N>
 properties
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-10-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8b73f1a4-48bf-8021-7b91-566ad7e59962@redhat.com>
Date: Thu, 26 Sep 2019 09:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190924113105.19076-10-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 26 Sep 2019 07:07:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, armbru@redhat.com,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 9/24/19 1:31 PM, Andrew Jones wrote:
> Allow cpu 'host' to enable SVE when it's available, unless the
> user chooses to disable it with the added 'sve=off' cpu property.
> Also give the user the ability to select vector lengths with the
> sve<N> properties. We don't adopt 'max' cpu's other sve property,
> sve-max-vq, because that property is difficult to use with KVM.
> That property assumes all vector lengths in the range from 1 up
> to and including the specified maximum length are supported, but
> there may be optional lengths not supported by the host in that
> range. With KVM one must be more specific when enabling vector
> lengths.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  docs/arm-cpu-features.rst | 19 ++++++++++++-------
>  target/arm/cpu.c          |  3 +++
>  target/arm/cpu.h          |  2 ++
>  target/arm/cpu64.c        | 33 +++++++++++++++++----------------
>  target/arm/kvm64.c        | 14 +++++++++++++-
>  tests/arm-cpu-features.c  | 21 +++++++++++----------
>  6 files changed, 58 insertions(+), 34 deletions(-)
> 
> diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
> index 939366f959cf..0c16eef7c8c2 100644
> --- a/docs/arm-cpu-features.rst
> +++ b/docs/arm-cpu-features.rst
> @@ -256,31 +256,36 @@ SVE CPU Property Examples
>  
>       $ qemu-system-aarch64 -M virt -cpu max
>  
> -  3) Only enable the 128-bit vector length::
> +  3) When KVM is enabled, implicitly enable all host CPU supported vector
> +     lengths with the `host` CPU type::
> +
> +     $ qemu-system-aarch64 -M virt,accel=kvm -cpu host
> +
> +  4) Only enable the 128-bit vector length::
>  
>       $ qemu-system-aarch64 -M virt -cpu max,sve128=on
>  
> -  4) Disable the 256-bit vector length and all larger vector lengths
> +  5) Disable the 256-bit vector length and all larger vector lengths
>       since 256 is a power-of-two (this results in only the 128-bit length
>       being enabled)::
>  
>       $ qemu-system-aarch64 -M virt -cpu max,sve256=off
>  
> -  5) Enable the 128-bit, 256-bit, and 512-bit vector lengths::
> +  6) Enable the 128-bit, 256-bit, and 512-bit vector lengths::
>  
>       $ qemu-system-aarch64 -M virt -cpu max,sve128=on,sve256=on,sve512=on
>  
> -  6) The same as (5), but since the 128-bit and 256-bit vector
> +  7) The same as (6), but since the 128-bit and 256-bit vector
>       lengths are required for the 512-bit vector length to be enabled,
>       then allow them to be auto-enabled::
>  
>       $ qemu-system-aarch64 -M virt -cpu max,sve512=on
>  
> -  7) Do the same as (6), but by first disabling SVE and then re-enabling it::
> +  8) Do the same as (7), but by first disabling SVE and then re-enabling it::
>  
>       $ qemu-system-aarch64 -M virt -cpu max,sve=off,sve512=on,sve=on
>  
> -  8) Force errors regarding the last vector length::
> +  9) Force errors regarding the last vector length::
>  
>       $ qemu-system-aarch64 -M virt -cpu max,sve128=off
>       $ qemu-system-aarch64 -M virt -cpu max,sve=off,sve128=off,sve=on
> @@ -292,5 +297,5 @@ The examples in "SVE CPU Property Examples" exhibit many ways to select
>  vector lengths which developers may find useful in order to avoid overly
>  verbose command lines.  However, the recommended way to select vector
>  lengths is to explicitly enable each desired length.  Therefore only
> -example's (1), (3), and (5) exhibit recommended uses of the properties.
> +example's (1), (4), and (6) exhibit recommended uses of the properties.
>  
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 522fed95b339..7695ae551218 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2671,6 +2671,9 @@ static void arm_host_initfn(Object *obj)
>      ARMCPU *cpu = ARM_CPU(obj);
>  
>      kvm_arm_set_cpu_features_from_host(cpu);
> +    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +        aarch64_add_sve_properties(obj);
> +    }
>      arm_cpu_post_init(obj);
>  }
>  
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 11162484465a..5b9c3e4cd73d 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -974,11 +974,13 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
>  void aarch64_sve_change_el(CPUARMState *env, int old_el,
>                             int new_el, bool el0_a64);
> +void aarch64_add_sve_properties(Object *obj);
>  #else
>  static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
>  static inline void aarch64_sve_change_el(CPUARMState *env, int o,
>                                           int n, bool a)
>  { }
> +static inline void aarch64_add_sve_properties(Object *obj) { }
>  #endif
>  
>  #if !defined(CONFIG_TCG)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 18dd5e24ec61..e7cd420faa9d 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -579,6 +579,21 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
>      cpu->isar.id_aa64pfr0 = t;
>  }
>  
> +void aarch64_add_sve_properties(Object *obj)
> +{
> +    uint32_t vq;
> +
> +    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> +                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
> +
> +    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
> +        char name[8];
line needed
> +        sprintf(name, "sve%d", vq * 128);
> +        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
> +                            cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
> +    }
> +}
> +
>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>   * otherwise, a CPU with as many features enabled as our emulation supports.
>   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> @@ -587,17 +602,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
>  static void aarch64_max_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> -    uint32_t vq;
> -    uint64_t t;
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> -        if (kvm_arm_sve_supported(CPU(cpu))) {
> -            t = cpu->isar.id_aa64pfr0;
> -            t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
> -            cpu->isar.id_aa64pfr0 = t;
> -        }
>      } else {
> +        uint64_t t;
>          uint32_t u;
>          aarch64_a57_initfn(obj);
>  
> @@ -697,17 +706,9 @@ static void aarch64_max_initfn(Object *obj)
>  #endif
>      }
>  
> -    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> -                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
> +    aarch64_add_sve_properties(obj);
>      object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
>                          cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
> -
> -    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
> -        char name[8];
> -        sprintf(name, "sve%d", vq * 128);
> -        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
> -                            cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
> -    }
>  }
>  
>  struct ARMCPUInfo {
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index cff4217a8469..2da366ba113e 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -488,7 +488,9 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       * and then query that CPU for the relevant ID registers.
>       */
>      int fdarray[3];
> +    bool sve_supported;
>      uint64_t features = 0;
> +    uint64_t t;
t can stay local to the block below
>      int err;
>  
>      /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
> @@ -578,13 +580,23 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>                                ARM64_SYS_REG(3, 0, 0, 3, 2));
>      }
>  
> +    sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
!ioctl?
> +
>      kvm_arm_destroy_scratch_host_vcpu(fdarray);
>  
>      if (err < 0) {
>          return false;
>      }
>  
> -   /* We can assume any KVM supporting CPU is at least a v8
> +    /* Add feature bits that can't appear until after VCPU init. */
> +    if (sve_supported) {
> +        t = ahcf->isar.id_aa64pfr0;
> +        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
> +        ahcf->isar.id_aa64pfr0 = t;
> +    }
> +
> +    /*
> +     * We can assume any KVM supporting CPU is at least a v8
>       * with VFPv4+Neon; this in turn implies most of the other
>       * feature bits.
>       */
> diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> index a0129aebf409..4dc067fb5558 100644
> --- a/tests/arm-cpu-features.c
> +++ b/tests/arm-cpu-features.c
> @@ -351,7 +351,7 @@ static void sve_tests_sve_off_kvm(const void *data)
>  {
>      QTestState *qts;
>  
> -    qts = qtest_init(MACHINE "-accel kvm -cpu max,sve=off");
> +    qts = qtest_init(MACHINE "-accel kvm -cpu host,sve=off");
>  
>      /*
>       * We don't know if this host supports SVE so we don't
> @@ -360,8 +360,8 @@ static void sve_tests_sve_off_kvm(const void *data)
>       * and that using sve<N>=off to explicitly disable vector
>       * lengths is OK too.
>       */
> -    assert_sve_vls(qts, "max", 0, NULL);
> -    assert_sve_vls(qts, "max", 0, "{ 'sve128': false }");
> +    assert_sve_vls(qts, "host", 0, NULL);
> +    assert_sve_vls(qts, "host", 0, "{ 'sve128': false }");
>  
>      qtest_quit(qts);
>  }
> @@ -428,8 +428,8 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>              "We cannot guarantee the CPU type 'cortex-a15' works "
>              "with KVM on this host", NULL);
>  
> -        assert_has_feature(qts, "max", "sve");
> -        resp = do_query_no_props(qts, "max");
> +        assert_has_feature(qts, "host", "sve");
> +        resp = do_query_no_props(qts, "host");
>          kvm_supports_sve = resp_get_feature(resp, "sve");
>          vls = resp_get_sve_vls(resp);
>          qobject_unref(resp);
> @@ -440,7 +440,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>              sprintf(max_name, "sve%d", max_vq * 128);
>  
>              /* Enabling a supported length is of course fine. */
> -            assert_sve_vls(qts, "max", vls, "{ %s: true }", max_name);
> +            assert_sve_vls(qts, "host", vls, "{ %s: true }", max_name);
>  
>              /* Get the next supported length smaller than max-vq. */
>              vq = 64 - __builtin_clzll(vls & ~BIT(max_vq - 1));
> @@ -449,7 +449,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>                   * We have at least one length smaller than max-vq,
>                   * so we can disable max-vq.
>                   */
> -                assert_sve_vls(qts, "max", (vls & ~BIT(max_vq - 1)),
> +                assert_sve_vls(qts, "host", (vls & ~BIT(max_vq - 1)),
>                                 "{ %s: false }", max_name);
>  
>                  /*
> @@ -459,7 +459,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>                   */
>                  sprintf(name, "sve%d", vq * 128);
>                  error = g_strdup_printf("cannot disable %s", name);
> -                assert_error(qts, "max", error,
> +                assert_error(qts, "host", error,
>                               "{ %s: true, %s: false }",
>                               max_name, name);
>                  g_free(error);
> @@ -472,7 +472,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>              vq = __builtin_ffsll(vls);
>              sprintf(name, "sve%d", vq * 128);
>              error = g_strdup_printf("cannot disable %s", name);
> -            assert_error(qts, "max", error, "{ %s: false }", name);
> +            assert_error(qts, "host", error, "{ %s: false }", name);
>              g_free(error);
>  
>              /* Get an unsupported length. */
> @@ -484,13 +484,14 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>              if (vq <= SVE_MAX_VQ) {
>                  sprintf(name, "sve%d", vq * 128);
>                  error = g_strdup_printf("cannot enable %s", name);
> -                assert_error(qts, "max", error, "{ %s: true }", name);
> +                assert_error(qts, "host", error, "{ %s: true }", name);
>                  g_free(error);
>              }
>          } else {
>              g_assert(vls == 0);
>          }
>      } else {
> +        assert_has_not_feature(qts, "host", "sve");
>          assert_error(qts, "host",
>                       "'pmu' feature not supported by KVM on this host",
>                       "{ 'pmu': true }");
> 
Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

