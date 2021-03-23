Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E47346913
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:30:28 +0100 (CET)
Received: from localhost ([::1]:47078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmjT-0002Sr-EO
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOmh4-0008T5-0q
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:27:59 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOmgx-0002im-VH
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:27:55 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so13661144wml.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IFGc1U/3515ZJutIyapP6qFhIp8aN23MA/SznlXxnyM=;
 b=aWg4sC5cKJ2G8pTwwNwKdSkx7Ov1IDKv0RoZDl4znZhg7edV90u8NMFO4m5xAdkKPk
 byLi31egR9Rk/qfMT88akWsYXRyJlW1aRMM6S5WsfVyscojZbOngk+gGUuDaa52XSFjU
 GHzQTzK4L1Q2lW2zM5x4moERWgvVkV0MtuCH4447MgEupQ72UlIcyo4zuB3gzWD6E3lk
 7QFfy/mPBvMD/ZUWvhbdP9qViNvR1jyvGMwWkVCM0cXwcOffCal0kDoZc5j0JJ9E7X6n
 9iQrYHH5O+9Jq2fYyY65UiJu1E1ksZEtiNJ5iBNG7u1mmxgYtUqADwuL/o4XipL0WFqP
 5omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IFGc1U/3515ZJutIyapP6qFhIp8aN23MA/SznlXxnyM=;
 b=It3HWbyghuU47Tb/h2S2hNigzvDZDa+IYCHhMWR0ivut+IM+mnPEojCrZvsOIHD3ka
 UXgh22jAPnE9qbeuxdEjAegjPEPjZS5sKQA6m+6sSAZhkcly0dJjBaLDQdoHGgc+rWbR
 TO4Vxcws+WPRCv4cUvaqY9qhApc4zdiOl6V9phjiFM+5PrGR75rP03mDtZufc31L6OKL
 qJ1wG+a1zs28oJrZ1CsGMk4bs/n9DbH3Quvhkpbha+71FhrvH+I+Fq4ZS1jvBOOStAkz
 QccUvohmYkB1OmX9Y9cwNr0EJoPmAXL3XH6NQuq8az9SMZo0jnlw1itEkYT8VUEFi+/l
 N4Fg==
X-Gm-Message-State: AOAM531pYysxRGkMyrSQF7Re2Fx4Sh/V6IeNFiBhqCoIW9R+RQgrHqI/
 DDFefhF2xdu5WLdp4fuxKFvRcg==
X-Google-Smtp-Source: ABdhPJxSi68fP1vubVT29BpYggZalLjdLIY2qFFkaklgKc9povsr8e06XZvTgtDzAlCsNB/VosAFHw==
X-Received: by 2002:a1c:5455:: with SMTP id p21mr4759206wmi.138.1616527669456; 
 Tue, 23 Mar 2021 12:27:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u2sm25098896wrp.12.2021.03.23.12.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 12:27:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B59541FF7E;
 Tue, 23 Mar 2021 19:27:47 +0000 (GMT)
References: <20210322140206.9513-1-cfontana@suse.de>
 <20210322140206.9513-40-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v10 39/49] target/arm: add tcg cpu accel class
Date: Tue, 23 Mar 2021 19:26:16 +0000
In-reply-to: <20210322140206.9513-40-cfontana@suse.de>
Message-ID: <87h7l1isb0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> move init, realizefn and reset code into it.

w.r.t my testing this is fingered by bisect for causing:

  Running test qtest-aarch64/migration-test
  ERROR qtest-aarch64/migration-test - Bail out! ERROR:../../target/arm/tcg=
/tcg-cpu.c:233:tcg_arm_init_accel_cpu: assertion failed: (object_class_by_n=
ame(ACCEL_CPU_NAME("tcg")) =3D=3D OBJECT_CLASS(accel_cpu))
  Broken pipe
  make: *** [Makefile.mtest:272: run-test-32] Error 1

The bisect log:

  git bisect start
  # bad: [474677f44c0d581381db57ff6030a6553f16db95] XXX target/arm: experim=
ent refactoring cpu "max"
  git bisect bad 474677f44c0d581381db57ff6030a6553f16db95
  # good: [5ca634afcf83215a9a54ca6e66032325b5ffb5f6] Merge remote-tracking =
branch 'remotes/philmd/tags/sdmmc-20210322' into staging
  git bisect good 5ca634afcf83215a9a54ca6e66032325b5ffb5f6
  # good: [bf31455e28246f6b9b732dc56f89e61895f6f4f0] i386: split svm_helper=
 into sysemu and stub-only user
  git bisect good bf31455e28246f6b9b732dc56f89e61895f6f4f0
  # good: [903f6e1bdc20939d023d6b577875370023bcac5f] target/arm: move arm_c=
pu_list to common_cpu
  git bisect good 903f6e1bdc20939d023d6b577875370023bcac5f
  # good: [1999c2ce6cc82200a39f6e41041f304eba5d4e7e] tests: device-introspe=
ct-test: cope with ARM TCG-only devices
  git bisect good 1999c2ce6cc82200a39f6e41041f304eba5d4e7e
  # bad: [fa37cc7fbabcf4de1cc963530c75b0ea7a73139a] target/arm: cpu-sve: ne=
w module
  git bisect bad fa37cc7fbabcf4de1cc963530c75b0ea7a73139a
  # good: [d0c4b7a7d2aa12537a06527692f10066b7acbed9] target/arm: create kvm=
 cpu accel class
  git bisect good d0c4b7a7d2aa12537a06527692f10066b7acbed9
  # bad: [3288c8a8cfc8dd9999e7b5908eaebb561f0169eb] target/arm: add tcg cpu=
 accel class
  git bisect bad 3288c8a8cfc8dd9999e7b5908eaebb561f0169eb
  # good: [683b948d40bc81f1eaed27bef8631ab3f8a937d6] target/arm: move kvm p=
ost init initialization to kvm cpu accel
  git bisect good 683b948d40bc81f1eaed27bef8631ab3f8a937d6
  # first bad commit: [3288c8a8cfc8dd9999e7b5908eaebb561f0169eb] target/arm=
: add tcg cpu accel class

  3288c8a8cfc8dd9999e7b5908eaebb561f0169eb is the first bad commit
  commit 3288c8a8cfc8dd9999e7b5908eaebb561f0169eb
  Author: Claudio Fontana <cfontana@suse.de>
  Date:   Mon Mar 22 15:01:56 2021 +0100

      target/arm: add tcg cpu accel class

      move init, realizefn and reset code into it.

      Signed-off-by: Claudio Fontana <cfontana@suse.de>
      Cc: Paolo Bonzini <pbonzini@redhat.com>
      Message-Id: <20210322140206.9513-40-cfontana@suse.de>

   target/arm/cpu.c                | 44 +++----------------------------
   target/arm/tcg/sysemu/tcg-cpu.c | 27 +++++++++++++++++++
   target/arm/tcg/tcg-cpu-models.c | 11 +++++---
   target/arm/tcg/tcg-cpu.c        | 57 +++++++++++++++++++++++++++++++++++=
++++--
   target/arm/tcg/tcg-cpu.h        |  4 ++-
   5 files changed, 96 insertions(+), 47 deletions(-)
  bisect run success


>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/arm/tcg/tcg-cpu.h        |  4 ++-
>  target/arm/cpu.c                | 44 ++-----------------------
>  target/arm/tcg/sysemu/tcg-cpu.c | 27 ++++++++++++++++
>  target/arm/tcg/tcg-cpu-models.c | 11 +++++--
>  target/arm/tcg/tcg-cpu.c        | 57 +++++++++++++++++++++++++++++++--
>  5 files changed, 96 insertions(+), 47 deletions(-)
>
> diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
> index d93c6a6749..dd08587949 100644
> --- a/target/arm/tcg/tcg-cpu.h
> +++ b/target/arm/tcg/tcg-cpu.h
> @@ -22,15 +22,17 @@
>=20=20
>  #include "cpu.h"
>  #include "hw/core/tcg-cpu-ops.h"
> +#include "hw/core/accel-cpu.h"
>=20=20
>  void arm_cpu_synchronize_from_tb(CPUState *cs,
>                                   const TranslationBlock *tb);
>=20=20
> -extern struct TCGCPUOps arm_tcg_ops;
> +void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);
>=20=20
>  #ifndef CONFIG_USER_ONLY
>  /* Do semihosting call and set the appropriate return value. */
>  void tcg_handle_semihosting(CPUState *cs);
> +bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
>=20=20
>  #endif /* !CONFIG_USER_ONLY */
>=20=20
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5e0f6bd01d..9248e096df 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -410,12 +410,6 @@ static void arm_cpu_reset(DeviceState *dev)
>                                &env->vfp.fp_status_f16);
>      set_float_detect_tininess(float_tininess_before_rounding,
>                                &env->vfp.standard_fp_status_f16);
> -
> -    if (tcg_enabled()) {
> -        hw_breakpoint_update_all(cpu);
> -        hw_watchpoint_update_all(cpu);
> -        arm_rebuild_hflags(env);
> -    }
>  }
>=20=20
>  void arm_cpu_update_virq(ARMCPU *cpu)
> @@ -576,10 +570,6 @@ static void arm_cpu_initfn(Object *obj)
>      cpu->dtb_compatible =3D "qemu,unknown";
>      cpu->psci_version =3D 1; /* By default assume PSCI v0.1 */
>      cpu->kvm_target =3D QEMU_KVM_ARM_TARGET_NONE;
> -
> -    if (tcg_enabled()) {
> -        cpu->psci_version =3D 2; /* TCG implements PSCI 0.2 */
> -    }
>  }
>=20=20
>  static Property arm_cpu_gt_cntfrq_property =3D
> @@ -868,34 +858,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>      Error *local_err =3D NULL;
>      bool no_aa32 =3D false;
>=20=20
> -    /*
> -     * If we needed to query the host kernel for the CPU features
> -     * then it's possible that might have failed in the initfn, but
> -     * this is the first point where we can report it.
> -     */
> -    if (cpu->host_cpu_probe_failed) {
> -        error_setg(errp, "The 'host' CPU type can only be used with KVM"=
);
> -        return;
> -    }
> -
> -#ifndef CONFIG_USER_ONLY
> -    /* The NVIC and M-profile CPU are two halves of a single piece of
> -     * hardware; trying to use one without the other is a command line
> -     * error and will result in segfaults if not caught here.
> -     */
> -    if (arm_feature(env, ARM_FEATURE_M)) {
> -        if (!env->nvic) {
> -            error_setg(errp, "This board cannot be used with Cortex-M CP=
Us");
> -            return;
> -        }
> -    } else {
> -        if (env->nvic) {
> -            error_setg(errp, "This board can only be used with Cortex-M =
CPUs");
> -            return;
> -        }
> -    }
> -
> -#ifdef CONFIG_TCG
> +#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
>      {
>          uint64_t scale;
>=20=20
> @@ -921,8 +884,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error=
 **errp)
>          cpu->gt_timer[GTIMER_HYPVIRT] =3D timer_new(QEMU_CLOCK_VIRTUAL, =
scale,
>                                                    arm_gt_hvtimer_cb, cpu=
);
>      }
> -#endif /* CONFIG_TCG */
> -#endif /* !CONFIG_USER_ONLY */
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
>=20=20
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err !=3D NULL) {
> @@ -1458,7 +1420,7 @@ static void arm_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      cc->disas_set_info =3D arm_disas_set_info;
>=20=20
>  #ifdef CONFIG_TCG
> -    cc->tcg_ops =3D &arm_tcg_ops;
> +    cc->init_accel_cpu =3D tcg_arm_init_accel_cpu;
>  #endif /* CONFIG_TCG */
>=20=20
>      arm32_cpu_class_init(oc, data);
> diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-=
cpu.c
> index 327b2a5073..115ac523dc 100644
> --- a/target/arm/tcg/sysemu/tcg-cpu.c
> +++ b/target/arm/tcg/sysemu/tcg-cpu.c
> @@ -19,10 +19,13 @@
>   */
>=20=20
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/timer.h"
>  #include "cpu.h"
>  #include "semihosting/common-semi.h"
>  #include "qemu/log.h"
>  #include "tcg/tcg-cpu.h"
> +#include "internals.h"
>=20=20
>  /*
>   * Do semihosting call and set the appropriate return value. All the
> @@ -50,3 +53,27 @@ void tcg_handle_semihosting(CPUState *cs)
>          env->regs[15] +=3D env->thumb ? 2 : 4;
>      }
>  }
> +
> +bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
> +    /*
> +     * The NVIC and M-profile CPU are two halves of a single piece of
> +     * hardware; trying to use one without the other is a command line
> +     * error and will result in segfaults if not caught here.
> +     */
> +    if (arm_feature(env, ARM_FEATURE_M)) {
> +        if (!env->nvic) {
> +            error_setg(errp, "This board cannot be used with Cortex-M CP=
Us");
> +            return false;
> +        }
> +    } else {
> +        if (env->nvic) {
> +            error_setg(errp, "This board can only be used with Cortex-M =
CPUs");
> +            return false;
> +        }
> +    }
> +    return true;
> +}
> diff --git a/target/arm/tcg/tcg-cpu-models.c b/target/arm/tcg/tcg-cpu-mod=
els.c
> index 16ab5d5364..2f44fd1b41 100644
> --- a/target/arm/tcg/tcg-cpu-models.c
> +++ b/target/arm/tcg/tcg-cpu-models.c
> @@ -844,15 +844,20 @@ static struct TCGCPUOps arm_v7m_tcg_ops =3D {
>  #endif /* !CONFIG_USER_ONLY */
>  };
>=20=20
> +static void arm_v7m_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *c=
c)
> +{
> +    g_assert(object_class_by_name(ACCEL_CPU_NAME("tcg")) =3D=3D OBJECT_C=
LASS(accel_cpu));
> +
> +    cc->tcg_ops =3D &arm_v7m_tcg_ops;
> +}
> +
>  static void arm_v7m_class_init(ObjectClass *oc, void *data)
>  {
>      ARMCPUClass *acc =3D ARM_CPU_CLASS(oc);
>      CPUClass *cc =3D CPU_CLASS(oc);
>=20=20
>      acc->info =3D data;
> -#ifdef CONFIG_TCG
> -    cc->tcg_ops =3D &arm_v7m_tcg_ops;
> -#endif /* CONFIG_TCG */
> +    cc->init_accel_cpu =3D arm_v7m_init_accel_cpu;
>=20=20
>      cc->gdb_core_xml_file =3D "arm-m-profile.xml";
>  }
> diff --git a/target/arm/tcg/tcg-cpu.c b/target/arm/tcg/tcg-cpu.c
> index 9fd996d908..d6c3a0ba41 100644
> --- a/target/arm/tcg/tcg-cpu.c
> +++ b/target/arm/tcg/tcg-cpu.c
> @@ -20,8 +20,8 @@
>=20=20
>  #include "qemu/osdep.h"
>  #include "cpu.h"
> +#include "qapi/error.h"
>  #include "tcg-cpu.h"
> -#include "hw/core/tcg-cpu-ops.h"
>  #include "cpregs.h"
>  #include "internals.h"
>  #include "exec/exec-all.h"
> @@ -212,7 +212,7 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int =
interrupt_request)
>      return true;
>  }
>=20=20
> -struct TCGCPUOps arm_tcg_ops =3D {
> +static struct TCGCPUOps arm_tcg_ops =3D {
>      .initialize =3D arm_translate_init,
>      .synchronize_from_tb =3D arm_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D arm_cpu_exec_interrupt,
> @@ -227,3 +227,56 @@ struct TCGCPUOps arm_tcg_ops =3D {
>      .debug_check_watchpoint =3D arm_debug_check_watchpoint,
>  #endif /* !CONFIG_USER_ONLY */
>  };
> +
> +void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc)
> +{
> +    g_assert(object_class_by_name(ACCEL_CPU_NAME("tcg")) =3D=3D OBJECT_C=
LASS(accel_cpu));
> +
> +    cc->tcg_ops =3D &arm_tcg_ops;
> +}
> +
> +static void tcg_cpu_instance_init(CPUState *cs)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +
> +    /*
> +     * this would be the place to move TCG-specific props
> +     * in future refactoring of cpu properties.
> +     */
> +
> +    cpu->psci_version =3D 2; /* TCG implements PSCI 0.2 */
> +}
> +
> +static void tcg_cpu_reset(CPUState *cs)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
> +    hw_breakpoint_update_all(cpu);
> +    hw_watchpoint_update_all(cpu);
> +    arm_rebuild_hflags(env);
> +}
> +
> +static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelCPUClass *acc =3D ACCEL_CPU_CLASS(oc);
> +
> +#ifndef CONFIG_USER_ONLY
> +    acc->cpu_realizefn =3D tcg_cpu_realizefn;
> +#endif /* CONFIG_USER_ONLY */
> +
> +    acc->cpu_instance_init =3D tcg_cpu_instance_init;
> +    acc->cpu_reset =3D tcg_cpu_reset;
> +}
> +static const TypeInfo tcg_cpu_accel_type_info =3D {
> +    .name =3D ACCEL_CPU_NAME("tcg"),
> +
> +    .parent =3D TYPE_ACCEL_CPU,
> +    .class_init =3D tcg_cpu_accel_class_init,
> +    .abstract =3D true,
> +};
> +static void tcg_cpu_accel_register_types(void)
> +{
> +    type_register_static(&tcg_cpu_accel_type_info);
> +}
> +type_init(tcg_cpu_accel_register_types);


--=20
Alex Benn=C3=A9e

