Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F32561228B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 13:46:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ookHM-0004w4-CG; Sat, 29 Oct 2022 07:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ookHB-0004vo-LW
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 07:45:24 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ookH9-0001QC-Gy
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 07:45:21 -0400
Received: by mail-wm1-x336.google.com with SMTP id l32so4580779wms.2
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cMMdSaIRPUeya2DERK8Tx47rWdFB+Pirc43Qaq6E5Ck=;
 b=jp2hYzi8xQDbCZUW6MK9Dd/NlfgfxoJomLNEAAAzQVNfVPGgxymazRNBP6dMN8hz8z
 g4G2HuZuifmnpKJ/hUkQcUmNTiajn8rfQzc+uhM6OdN3UaAOK5Sgz8uLl4x3fBdiFxWo
 pIkZjaYrJEObeX6djkZNcKn5wbCOKg6waVECS6FSXsmwAPG3WYyGa5Pb5Epar5Ycg/Ft
 yo0Xh+/G9T7mQp+Z7jOnL214w9fxcoxkreJgotHaDoDjdxrP/FwUMXwWOoHAYOlcD8y1
 dvmzbmpdf8S7fpmloqiaWXf4DEvYiPUZzvow2oyK/Bv5kKW/Jguycr3oFNYIci4bQbrY
 Lneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cMMdSaIRPUeya2DERK8Tx47rWdFB+Pirc43Qaq6E5Ck=;
 b=tzyh6iZ0Z7P1zJJdNWTQ+Ckaf34d0hTXUWSU25+jr+Mi2w0Wj6BbzFsj/htWoPTS7e
 9FrRHM8QSVH34edTElst52kRIi2LSunpcsKQqC3S+k5lLazu1mLdmrydlYlW1q2qaHwp
 q2ErI2iHQDmoa2bWVEtw6eQ9KQfI705YEgogBsk4tVKdv7Jf+bbKFKCU/iy1tELc5nDi
 UGv0blzODh+ZTPMvCey6v9YxZF7pVX4HwiipqX8uiB/Z8GyyZOeQjaEGFNm8bDj4ye9n
 eBVOwwd4nrfnNPUXfhL6CDTrwxidvqD3Siu4/n6AcjyKxsIA2N/+YuhPbWVTa4tjrdPc
 eaxg==
X-Gm-Message-State: ACrzQf3ykKu9hGR0jYG5FSmq0qN2kSTR1REEm3Qq/TWekz0yRCWgJ0Sw
 cI4TeES0SxWDzAqD6WJYacZzsA==
X-Google-Smtp-Source: AMsMyM7N19kIaHIQtClZc276egoJHhdyJ2wycqvS2pBo4LgL3gfaF1jLYbbmGyySGmDNb++7h+xkqA==
X-Received: by 2002:a05:600c:4586:b0:3c6:fbb0:bf5a with SMTP id
 r6-20020a05600c458600b003c6fbb0bf5amr12594204wmo.47.1667043917544; 
 Sat, 29 Oct 2022 04:45:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a05600c204a00b003b476cabf1csm1441633wmg.26.2022.10.29.04.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 04:45:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DEB01FFB7;
 Sat, 29 Oct 2022 12:45:16 +0100 (BST)
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
 <20221026021116.1988449-26-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: stefanha@redhat.com, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Subject: Re: [PULL 25/47] accel/tcg: Add restore_state_to_opc to TCGCPUOps
Date: Sat, 29 Oct 2022 11:42:59 +0100
In-reply-to: <20221026021116.1988449-26-richard.henderson@linaro.org>
Message-ID: <87r0yqua43.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Add a tcg_ops hook to replace the restore_state_to_opc
> function call.  Because these generic hooks cannot depend
> on target-specific types, temporarily, copy the current
> target_ulong data[] into uint64_t d64[].
>
> Reviewed-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This has triggered a regression in x86_64 stuff:

  =E2=9E=9C  make -j30
    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley=
-softfloat-3 dtc
  [1/9] Generating qemu-version.h with a custom command (wrapped by meson t=
o capture output)
  =F0=9F=95=9911:41:11 alex.bennee@hackbox2:qemu.git/builds/bisect  on =EE=
=82=A0 HEAD (8269c01) (BISECTING) [$?]
  =E2=9E=9C  ./tests/venv/bin/avocado run tests/avocado/boot_linux.py:BootL=
inuxX8664.test_pc_i440fx_tcg tests/avocado/boot_linux.py:BootLinuxX8664.tes=
t_pc_q35_tcg tests/avocado/linux_
  initrd.py:LinuxInitrd.test_with_2gib_file_should_work_with_linux_v4_16 te=
sts/avocado/replay_kernel.py:ReplayKernelNormal.test_x86_64_pc
  Fetching asset from tests/avocado/linux_initrd.py:LinuxInitrd.test_with_2=
gib_file_should_work_with_linux_v4_16
  Fetching asset from tests/avocado/replay_kernel.py:ReplayKernelNormal.tes=
t_x86_64_pc
  JOB ID     : 1d6ae71471e46c091ed06acc59a077c10b7b1ff9
  JOB LOG    : /home/alex.bennee/avocado/job-results/job-2022-10-29T11.41-1=
d6ae71/job.log
   (1/4) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg: PAS=
S (80.15 s)
   (2/4) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg: PASS (=
69.03 s)
   (3/4) tests/avocado/linux_initrd.py:LinuxInitrd.test_with_2gib_file_shou=
ld_work_with_linux_v4_16: PASS (14.37 s)
   (4/4) tests/avocado/replay_kernel.py:ReplayKernelNormal.test_x86_64_pc: =
PASS (71.81 s)
  RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0
  JOB TIME   : 235.96 s
  =F0=9F=95=9911:45:10 alex.bennee@hackbox2:qemu.git/builds/bisect  on =EE=
=82=A0 HEAD (d292568) (BISECTING) [$?] took 3m56s
  =E2=9E=9C  ninja build
  ninja: error: unknown target 'build'
  =F0=9F=95=9911:45:21 alex.bennee@hackbox2:qemu.git/builds/bisect  on =EE=
=82=A0 HEAD (d292568) (BISECTING) [$?] [=F0=9F=94=B4 ERROR]=20
  =E2=9C=97  ninja
  [56/56] Linking target qemu-system-x86_64
  =F0=9F=95=9911:45:29 alex.bennee@hackbox2:qemu.git/builds/bisect  on =EE=
=82=A0 HEAD (d292568) (BISECTING) [$?] took 4s=20
  =E2=9E=9C  ./tests/venv/bin/avocado run tests/avocado/boot_linux.py:BootL=
inuxX8664.test_pc_i440fx_tcg tests/avocado/boot_linux.py:BootLinuxX8664.tes=
t_pc_q35_tcg tests/avocado/linux_
  initrd.py:LinuxInitrd.test_with_2gib_file_should_work_with_linux_v4_16 te=
sts/avocado/replay_kernel.py:ReplayKernelNormal.test_x86_64_pc=20
  Fetching asset from tests/avocado/linux_initrd.py:LinuxInitrd.test_with_2=
gib_file_should_work_with_linux_v4_16
  Fetching asset from tests/avocado/replay_kernel.py:ReplayKernelNormal.tes=
t_x86_64_pc
  JOB ID     : a1c449facd31a2907520e6971a66a3a5529c3bd2
  JOB LOG    : /home/alex.bennee/avocado/job-results/job-2022-10-29T11.45-a=
1c449f/job.log
   (1/4) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg: INT=
ERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reach=
ed\nOriginal status: ERRO
  R\n{'name': '1-tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_=
tcg', 'logdir': '/home/alex.bennee/avocado/job-results/job-2022-10-29T11.45=
-a1c449f/test-result... (120.58 s)
   (2/4) tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg: INTERR=
UPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\=
nOriginal status: ERROR\n
  {'name': '2-tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg', =
'logdir': '/home/alex.bennee/avocado/job-results/job-2022-10-29T11.45-a1c44=
9f/test-results/2... (120.59 s)
   (3/4) tests/avocado/linux_initrd.py:LinuxInitrd.test_with_2gib_file_shou=
ld_work_with_linux_v4_16: INTERRUPTED: Test died without reporting the stat=
us.\nRunner error occurre
  d: Timeout reached\nOriginal status: ERROR\n{'name': '3-tests/avocado/lin=
ux_initrd.py:LinuxInitrd.test_with_2gib_file_should_work_with_linux_v4_16',=
 'logdir': '/home/alex.bennee/avocado/job-results... (311.46 s)
   (4/4) tests/avocado/replay_kernel.py:ReplayKernelNormal.test_x86_64_pc: =
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout re=
ached\nOriginal status: E
  RROR\n{'name': '4-tests/avocado/replay_kernel.py:ReplayKernelNormal.test_=
x86_64_pc', 'logdir': '/home/alex.bennee/avocado/job-results/job-2022-10-29=
T11.45-a1c449f/test-res... (120.58 s)
  RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 4 | =
CANCEL 0
  JOB TIME   : 676.41 s
  =F0=9F=95=9911:56:59 alex.bennee@hackbox2:qemu.git/builds/bisect  on =EE=
=82=A0 HEAD (d292568) (BISECTING) [$?] took 11m28s [=F0=9F=94=B4 8]=20
  =E2=9C=97=20=20

> ---
>  include/exec/exec-all.h       |  2 +-
>  include/hw/core/tcg-cpu-ops.h | 11 +++++++++++
>  accel/tcg/translate-all.c     | 24 ++++++++++++++++++++++--
>  3 files changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 5ae484e34d..3b5e84240b 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -40,7 +40,7 @@ typedef ram_addr_t tb_page_addr_t;
>  #endif
>=20=20
>  void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
> -                          target_ulong *data);
> +                          target_ulong *data) __attribute__((weak));
>=20=20
>  /**
>   * cpu_restore_state:
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 78c6c6635d..20e3c0ffbb 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -31,6 +31,17 @@ struct TCGCPUOps {
>       * function to restore all the state, and register it here.
>       */
>      void (*synchronize_from_tb)(CPUState *cpu, const TranslationBlock *t=
b);
> +    /**
> +     * @restore_state_to_opc: Synchronize state from INDEX_op_start_insn
> +     *
> +     * This is called when we unwind state in the middle of a TB,
> +     * usually before raising an exception.  Set all part of the CPU
> +     * state which are tracked insn-by-insn in the target-specific
> +     * arguments to start_insn, passed as @data.
> +     */
> +    void (*restore_state_to_opc)(CPUState *cpu, const TranslationBlock *=
tb,
> +                                 const uint64_t *data);
> +
>      /** @cpu_exec_enter: Callback for cpu_exec preparation */
>      void (*cpu_exec_enter)(CPUState *cpu);
>      /** @cpu_exec_exit: Callback for cpu_exec cleanup */
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 433fa247f4..4d8783efc7 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -256,7 +256,6 @@ int cpu_restore_state_from_tb(CPUState *cpu, Translat=
ionBlock *tb,
>  {
>      target_ulong data[TARGET_INSN_START_WORDS];
>      uintptr_t host_pc =3D (uintptr_t)tb->tc.ptr;
> -    CPUArchState *env =3D cpu->env_ptr;
>      const uint8_t *p =3D tb->tc.ptr + tb->tc.size;
>      int i, j, num_insns =3D tb->icount;
>  #ifdef CONFIG_PROFILER
> @@ -295,7 +294,20 @@ int cpu_restore_state_from_tb(CPUState *cpu, Transla=
tionBlock *tb,
>             and shift if to the number of actually executed instructions =
*/
>          cpu_neg(cpu)->icount_decr.u16.low +=3D num_insns - i;
>      }
> -    restore_state_to_opc(env, tb, data);
> +
> +    {
> +        const struct TCGCPUOps *ops =3D cpu->cc->tcg_ops;
> +        __typeof(ops->restore_state_to_opc) restore =3D ops->restore_sta=
te_to_opc;
> +        if (restore) {
> +            uint64_t d64[TARGET_INSN_START_WORDS];
> +            for (i =3D 0; i < TARGET_INSN_START_WORDS; ++i) {
> +                d64[i] =3D data[i];
> +            }
> +            restore(cpu, tb, d64);
> +        } else {
> +            restore_state_to_opc(cpu->env_ptr, tb, data);
> +        }
> +    }
>=20=20
>  #ifdef CONFIG_PROFILER
>      qatomic_set(&prof->restore_time,
> @@ -307,6 +319,14 @@ int cpu_restore_state_from_tb(CPUState *cpu, Transla=
tionBlock *tb,
>=20=20
>  bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
>  {
> +    /*
> +     * The pc update associated with restore without exit will
> +     * break the relative pc adjustments performed by TARGET_TB_PCREL.
> +     */
> +    if (TARGET_TB_PCREL) {
> +        assert(will_exit);
> +    }
> +
>      /*
>       * The host_pc has to be in the rx region of the code buffer.
>       * If it is not we will not be able to resolve it here.


--=20
Alex Benn=C3=A9e

