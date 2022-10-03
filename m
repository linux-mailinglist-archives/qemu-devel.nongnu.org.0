Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8765B5F2CCC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:08:01 +0200 (CEST)
Received: from localhost ([::1]:46144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofHQe-0004mq-8F
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofHEf-0005Yk-RH
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:55:38 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofHEd-0004Ho-L7
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:55:37 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j7so10298238wrr.3
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 01:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=08HwBk9q/bKHJzTRL/aaEMzixoYjRm41e3KZTsLNYR8=;
 b=xN+/eUvpbzSIrlfSnCdHQteLLFPXm87uk8RO+8s/nkrWlrJDD0bl+iz6Zp3S/sxuM5
 8duk7ry1S+78/H3xlONWqlGE1Jd+qJJNnIYnJVW7eCuLeki0Cf7erJA7qYjFDj3jDPiI
 cDX1igEQQhBZxkUcycP03UmuXXDjPmDaYgCJGYrhaXIWm5IgpRkPMEdJcJmyX9bFATXD
 wzGSKzci5Hv5HcUXIP9O6YCyuV6hlayO+PsezwNzQoB/wp9hkhDMo4Aq3Yv3947CCwN6
 hOknDJe6pS9wRFfPdm9Kaz1gJ8ojpYxs+ir9fX6M/OSkUn7Wo+u3n23KKR+fx6cGbyPv
 9drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=08HwBk9q/bKHJzTRL/aaEMzixoYjRm41e3KZTsLNYR8=;
 b=rVL3DuVEaJxxLCCnlk3urEDE2kYKrP+qdqkwyJOs5qqbibWe4IFWS7GGaCCU2VADUy
 mqNWV/8mr7U0WouIlow55DzN1+ra36hELZNwO0p9TZ8BINxR/wmjd2ZHye7oEQRrYIqC
 hdjaT50WzoNLfyPZtfPKGVYyXmpb9Woa8shtyCZIFnjS0s2A6X7LRRuPBXvKMk8eEsIm
 d4pfClCPfxIS4L1MymwMzieQcDRCf6SifUoMch9nQo5yk5SxuG9ou7drxGtDeI7jt4+T
 Jrx/M2VwudqWX2XkAFHrBfBqZchGAXwgqycHx+ReMWXVL5aOhpMJFji86f17Fa9k64Xw
 tLug==
X-Gm-Message-State: ACrzQf38PEtG/suKr9HLNxSrtpl3R7ND72LL6lySQJ8USB/fWcPILs2I
 rZEUwBmHZiA1LWSYVJrDWWDizQ==
X-Google-Smtp-Source: AMsMyM4bPfq0dvy/dsnZvTCTqQJvXB8wrUyHE0bieDYgI9GSh/Xdz9n02waiHods7vtWHTXjkhZoew==
X-Received: by 2002:a5d:47c5:0:b0:22a:6c7a:10f3 with SMTP id
 o5-20020a5d47c5000000b0022a6c7a10f3mr11743570wrc.523.1664787333888; 
 Mon, 03 Oct 2022 01:55:33 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a7bce90000000b003b3401f1e24sm10978196wmj.28.2022.10.03.01.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 01:55:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 906BC1FFB7;
 Mon,  3 Oct 2022 09:55:32 +0100 (BST)
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
 <20220822132358.3524971-4-peter.maydell@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v2 03/10] target/arm: Don't mishandle count when
 enabling or disabling PMU counters
Date: Mon, 03 Oct 2022 09:54:30 +0100
In-reply-to: <20220822132358.3524971-4-peter.maydell@linaro.org>
Message-ID: <87sfk5nv5n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Peter Maydell <peter.maydell@linaro.org> writes:

> The PMU cycle and event counter infrastructure design requires that
> operations on the PMU register fields are wrapped in pmu_op_start()
> and pmu_op_finish() calls (or their more specific pmmcntr and
> pmevcntr equivalents).  This includes any changes to registers which
> affect whether the counter should be enabled or disabled, but we
> forgot to do this.
>
> The effect of this bug is that in sequences like:
>  * disable the cycle counter (PMCCNTR) using the PMCNTEN register
>  * write a value such as 0xfffff000 to the PMCCNTR
>  * restart the counter by writing to PMCNTEN
> the value written to the cycle counter is corrupted, and it starts
> counting from the wrong place. (Essentially, we fail to record that
> the QEMU_CLOCK_VIRTUAL timestamp when the counter should be considered
> to have started counting is the point when PMCNTEN is written to enable
> the counter.)
>
> Add the necessary bracketing calls, so that updates to the various
> registers which affect whether the PMU is counting are handled
> correctly.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I'm not sure why but this commit seems to be breaking a bunch of avocado
tests for me, including the TCG plugin ones:

  =E2=9E=9C  ./tests/venv/bin/avocado run tests/avocado/tcg_plugins.py:test=
_aarch64_virt_insn_icount
  JOB ID     : 0f5647d95f678e73fc01730cf9f8d7f80118443e
  JOB LOG    : /home/alex/avocado/job-results/job-2022-10-02T20.19-0f5647d/=
job.log
   (1/1) tests/avocado/tcg_plugins.py:PluginKernelNormal.test_aarch64_virt_=
insn_icount: INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurre=
d: Timeout reached\nOrigi
  nal status: ERROR\n{'name': '1-tests/avocado/tcg_plugins.py:PluginKernelN=
ormal.test_aarch64_virt_insn_icount', 'logdir': '/home/alex/avocado/job-res=
ults/job-2022-10-02T20.19
  -0f5647d/te... (120.43 s)
  RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 1 | =
CANCEL 0
  JOB TIME   : 120.72 s

> ---
> v1->v2: fixed comment typo
> ---
>  target/arm/helper.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 87c89748954..59e1280a9cd 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1079,6 +1079,14 @@ static CPAccessResult pmreg_access_ccntr(CPUARMSta=
te *env,
>      return pmreg_access(env, ri, isread);
>  }
>=20=20
> +/*
> + * Bits in MDCR_EL2 and MDCR_EL3 which pmu_counter_enabled() looks at.
> + * We use these to decide whether we need to wrap a write to MDCR_EL2
> + * or MDCR_EL3 in pmu_op_start()/pmu_op_finish() calls.
> + */
> +#define MDCR_EL2_PMU_ENABLE_BITS (MDCR_HPME | MDCR_HPMD | MDCR_HPMN)
> +#define MDCR_EL3_PMU_ENABLE_BITS (MDCR_SPME)
> +
>  /* Returns true if the counter (pass 31 for PMCCNTR) should count events=
 using
>   * the current EL, security state, and register configuration.
>   */
> @@ -1432,15 +1440,19 @@ static uint64_t pmccfiltr_read_a32(CPUARMState *e=
nv, const ARMCPRegInfo *ri)
>  static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                              uint64_t value)
>  {
> +    pmu_op_start(env);
>      value &=3D pmu_counter_mask(env);
>      env->cp15.c9_pmcnten |=3D value;
> +    pmu_op_finish(env);
>  }
>=20=20
>  static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> +    pmu_op_start(env);
>      value &=3D pmu_counter_mask(env);
>      env->cp15.c9_pmcnten &=3D ~value;
> +    pmu_op_finish(env);
>  }
>=20=20
>  static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -4681,7 +4693,39 @@ static void sctlr_write(CPUARMState *env, const AR=
MCPRegInfo *ri,
>  static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                         uint64_t value)
>  {
> +    /*
> +     * Some MDCR_EL3 bits affect whether PMU counters are running:
> +     * if we are trying to change any of those then we must
> +     * bracket this update with PMU start/finish calls.
> +     */
> +    bool pmu_op =3D (env->cp15.mdcr_el3 ^ value) & MDCR_EL3_PMU_ENABLE_B=
ITS;
> +
> +    if (pmu_op) {
> +        pmu_op_start(env);
> +    }
>      env->cp15.mdcr_el3 =3D value & SDCR_VALID_MASK;
> +    if (pmu_op) {
> +        pmu_op_finish(env);
> +    }
> +}
> +
> +static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                           uint64_t value)
> +{
> +    /*
> +     * Some MDCR_EL2 bits affect whether PMU counters are running:
> +     * if we are trying to change any of those then we must
> +     * bracket this update with PMU start/finish calls.
> +     */
> +    bool pmu_op =3D (env->cp15.mdcr_el2 ^ value) & MDCR_EL2_PMU_ENABLE_B=
ITS;
> +
> +    if (pmu_op) {
> +        pmu_op_start(env);
> +    }
> +    env->cp15.mdcr_el2 =3D value;
> +    if (pmu_op) {
> +        pmu_op_finish(env);
> +    }
>  }
>=20=20
>  static const ARMCPRegInfo v8_cp_reginfo[] =3D {
> @@ -7669,6 +7713,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          ARMCPRegInfo mdcr_el2 =3D {
>              .name =3D "MDCR_EL2", .state =3D ARM_CP_STATE_BOTH,
>              .opc0 =3D 3, .opc1 =3D 4, .crn =3D 1, .crm =3D 1, .opc2 =3D =
1,
> +            .writefn =3D mdcr_el2_write,
>              .access =3D PL2_RW, .resetvalue =3D pmu_num_counters(env),
>              .fieldoffset =3D offsetof(CPUARMState, cp15.mdcr_el2),
>          };


--=20
Alex Benn=C3=A9e

