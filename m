Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA05C42FBE3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:20:33 +0200 (CEST)
Received: from localhost ([::1]:43414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSkq-00072w-QR
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSWk-0005t3-C9
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:05:58 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:35481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSWf-000290-UB
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:05:57 -0400
Received: by mail-ua1-x933.google.com with SMTP id q13so20043824uaq.2
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 12:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dVhMHfFfmVEuwnpfyt4WvTc12TcGOF2l5Ta8KwXUwpg=;
 b=VC13SmAkEsLm/9ydAWpYRrQfNgorQ+KChm9TkmK2QYtNRwprwYrW47ZvEtz0ykbj2p
 k7ptTzbGU4Ahueo1HMbBwrrMykgCCZcc6YHz1q3Qi3BBccSe3LjxyZd4m7PwsRoc+8HG
 092IrOQDtWUIw7+36ELpDdjcJwdP5CFtrNwE30YP8iKVfHVCJ3NVupKmNWKDdhZVApCI
 VgtUqr0YTo9DECpwkSdoB3MsdR6vaKn92ln3uQuQB/Aeow0P5XIuU+ZKziPuhk1Vf2NR
 UVqkiRDfPyFggQcTY37vEaTKvjoVrGBGAgLAIRfP/zx1Bq1A4XSY5wSuh0bTLZG2kZOR
 N4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVhMHfFfmVEuwnpfyt4WvTc12TcGOF2l5Ta8KwXUwpg=;
 b=27Oua/IvtBs1gkdUp9kPDF6fPw3749KDkTqLNgHIJsVE94bxEADqE2bUnnpP/OMr0+
 0FNLYVouqphYv+kCegZpR1lwTUhUA7EhLtZafYhcPu4pTuWY1WpqtTtPfZQpxqgnTq8l
 QmZ74KsFcTakq59dqQgeYqK/BZbEbj9UnsDlio0PxBIqvFFdnEpAxk4idkvwJXYXGJBE
 F4QniRlcAXyePxfnS00Ej9AaPG1V4YsST70rQBelKYCgl2m0DliwQBLqK3WG+OIuB24O
 +/JBprMLATZAoTatqx3KAnpo2TZM+Icbn1lcfiuHrGzEVl5Fi94Lam4xPPSzoHFxHY1y
 XCww==
X-Gm-Message-State: AOAM532Au5clrTEl6DuOxnJ8TA3UUxbLHhQOUXusKcDADVleHzy9GyRE
 J8vbRzaInMewoVYfhy2YXvgVaomchpDC/dSAeheDhA==
X-Google-Smtp-Source: ABdhPJwKmvx+L3JNWlt2FZtjjGNKUDCEK1F2PRsKxc1Y5BQUeZa6pDzipmnSGPDxFwW3wMrpNogvADsKXW86or0LfL0=
X-Received: by 2002:ab0:7688:: with SMTP id v8mr14589552uaq.77.1634324752121; 
 Fri, 15 Oct 2021 12:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-47-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-47-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 13:05:41 -0600
Message-ID: <CANCZdfo7Ti+fkxJGKk-=mevV9eGnBMRhSYB5UX399iHXOWCZdg@mail.gmail.com>
Subject: Re: [PATCH v5 46/67] target/arm: Implement arm_cpu_record_sigbus
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004c599805ce68e2c1"
Received-SPF: none client-ip=2607:f8b0:4864:20::933;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004c599805ce68e2c1
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:14 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Because of the complexity of setting ESR, re-use the existing
> arm_cpu_do_unaligned_access function.  This means we have to
> handle the exception ourselves in cpu_loop, transforming it
> to the appropriate signal.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h        |  2 ++
>  linux-user/aarch64/cpu_loop.c | 12 +++++++++---
>  linux-user/arm/cpu_loop.c     | 30 ++++++++++++++++++++++++++----
>  target/arm/cpu.c              |  1 +
>  target/arm/cpu_tcg.c          |  1 +
>  target/arm/tlb_helper.c       |  6 ++++++
>  6 files changed, 45 insertions(+), 7 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

This will definitely have an impact on the bsd-user fork, and my plans to
add arm and aarch64 to
upstream before 6.2, but I believe most of the changes will port over so
I'm not too worried.


> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 5a7aaf0f51..89f7610ebc 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -548,6 +548,8 @@ static inline bool arm_extabort_type(MemTxResult
> result)
>  void arm_cpu_record_sigsegv(CPUState *cpu, vaddr addr,
>                              MMUAccessType access_type,
>                              bool maperr, uintptr_t ra);
> +void arm_cpu_record_sigbus(CPUState *cpu, vaddr addr,
> +                           MMUAccessType access_type, uintptr_t ra);
>  #else
>  bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        MMUAccessType access_type, int mmu_idx,
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 034b737435..97e0728b67 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -79,7 +79,7 @@
>  void cpu_loop(CPUARMState *env)
>  {
>      CPUState *cs = env_cpu(env);
> -    int trapnr, ec, fsc, si_code;
> +    int trapnr, ec, fsc, si_code, si_signo;
>      abi_long ret;
>
>      for (;;) {
> @@ -121,20 +121,26 @@ void cpu_loop(CPUARMState *env)
>              fsc = extract32(env->exception.syndrome, 0, 6);
>              switch (fsc) {
>              case 0x04 ... 0x07: /* Translation fault, level {0-3} */
> +                si_signo = TARGET_SIGSEGV;
>                  si_code = TARGET_SEGV_MAPERR;
>                  break;
>              case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
>              case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
> +                si_signo = TARGET_SIGSEGV;
>                  si_code = TARGET_SEGV_ACCERR;
>                  break;
>              case 0x11: /* Synchronous Tag Check Fault */
> +                si_signo = TARGET_SIGSEGV;
>                  si_code = TARGET_SEGV_MTESERR;
>                  break;
> +            case 0x21: /* Alignment fault */
> +                si_signo = TARGET_SIGBUS;
> +                si_code = TARGET_BUS_ADRALN;
> +                break;
>              default:
>                  g_assert_not_reached();
>              }
> -
> -            force_sig_fault(TARGET_SIGSEGV, si_code,
> env->exception.vaddress);
> +            force_sig_fault(si_signo, si_code, env->exception.vaddress);
>              break;
>          case EXCP_DEBUG:
>          case EXCP_BKPT:
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index ae09adcb95..01cb6eb534 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -25,6 +25,7 @@
>  #include "cpu_loop-common.h"
>  #include "signal-common.h"
>  #include "semihosting/common-semi.h"
> +#include "target/arm/syndrome.h"
>
>  #define get_user_code_u32(x, gaddr, env)                \
>      ({ abi_long __r = get_user_u32((x), (gaddr));       \
> @@ -280,7 +281,7 @@ static bool emulate_arm_fpa11(CPUARMState *env,
> uint32_t opcode)
>  void cpu_loop(CPUARMState *env)
>  {
>      CPUState *cs = env_cpu(env);
> -    int trapnr;
> +    int trapnr, si_signo, si_code;
>      unsigned int n, insn;
>      abi_ulong ret;
>
> @@ -423,9 +424,30 @@ void cpu_loop(CPUARMState *env)
>              break;
>          case EXCP_PREFETCH_ABORT:
>          case EXCP_DATA_ABORT:
> -            /* XXX: check env->error_code */
> -            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR,
> -                            env->exception.vaddress);
> +            /* For user-only we don't set TTBCR_EAE, so look at the FSR.
> */
> +            switch (env->exception.fsr & 0x1f) {
> +            case 0x1: /* Alignment */
> +                si_signo = TARGET_SIGBUS;
> +                si_code = TARGET_BUS_ADRALN;
> +                break;
> +            case 0x3: /* Access flag fault, level 1 */
> +            case 0x6: /* Access flag fault, level 2 */
> +            case 0x9: /* Domain fault, level 1 */
> +            case 0xb: /* Domain fault, level 2 */
> +            case 0xd: /* Permision fault, level 1 */
> +            case 0xf: /* Permision fault, level 2 */
> +                si_signo = TARGET_SIGSEGV;
> +                si_code = TARGET_SEGV_ACCERR;
> +                break;
> +            case 0x5: /* Translation fault, level 1 */
> +            case 0x7: /* Translation fault, level 2 */
> +                si_signo = TARGET_SIGSEGV;
> +                si_code = TARGET_SEGV_MAPERR;
> +                break;
> +            default:
> +                g_assert_not_reached();
> +            }
> +            force_sig_fault(si_signo, si_code, env->exception.vaddress);
>              break;
>          case EXCP_DEBUG:
>          case EXCP_BKPT:
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7a18a58ca0..a211804fd3 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2035,6 +2035,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
>
>  #ifdef CONFIG_USER_ONLY
>      .record_sigsegv = arm_cpu_record_sigsegv,
> +    .record_sigbus = arm_cpu_record_sigbus,
>  #else
>      .tlb_fill = arm_cpu_tlb_fill,
>      .cpu_exec_interrupt = arm_cpu_exec_interrupt,
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 7b3bea2fbb..13d0e9b195 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -902,6 +902,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
>
>  #ifdef CONFIG_USER_ONLY
>      .record_sigsegv = arm_cpu_record_sigsegv,
> +    .record_sigbus = arm_cpu_record_sigbus,
>  #else
>      .tlb_fill = arm_cpu_tlb_fill,
>      .cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt,
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index dc5860180f..12a934e924 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -213,4 +213,10 @@ void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,
>      cpu_restore_state(cs, ra, true);
>      arm_deliver_fault(cpu, addr, access_type, MMU_USER_IDX, &fi);
>  }
> +
> +void arm_cpu_record_sigbus(CPUState *cs, vaddr addr,
> +                           MMUAccessType access_type, uintptr_t ra)
> +{
> +    arm_cpu_do_unaligned_access(cs, addr, access_type, MMU_USER_IDX, ra);
> +}
>  #endif /* !defined(CONFIG_USER_ONLY) */
> --
> 2.25.1
>
>

--0000000000004c599805ce68e2c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:14 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Because of the complexity of setting ESR, re-use the exi=
sting<br>
arm_cpu_do_unaligned_access function.=C2=A0 This means we have to<br>
handle the exception ourselves in cpu_loop, transforming it<br>
to the appropriate signal.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/arm/internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0linux-user/aarch64/cpu_loop.c | 12 +++++++++---<br>
=C2=A0linux-user/arm/cpu_loop.c=C2=A0 =C2=A0 =C2=A0| 30 +++++++++++++++++++=
+++++++----<br>
=C2=A0target/arm/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
=C2=A0target/arm/cpu_tcg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br=
>
=C2=A0target/arm/tlb_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++++<br=
>
=C2=A06 files changed, 45 insertions(+), 7 deletions(-)<br></blockquote><di=
v><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.=
com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>This will definitely h=
ave an impact on the bsd-user fork, and my plans to add arm and aarch64 to<=
/div><div>upstream before 6.2, but I believe most of the changes will port =
over so I&#39;m not too worried.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
diff --git a/target/arm/internals.h b/target/arm/internals.h<br>
index 5a7aaf0f51..89f7610ebc 100644<br>
--- a/target/arm/internals.h<br>
+++ b/target/arm/internals.h<br>
@@ -548,6 +548,8 @@ static inline bool arm_extabort_type(MemTxResult result=
)<br>
=C2=A0void arm_cpu_record_sigsegv(CPUState *cpu, vaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool maperr, uintptr_t ra);<br>
+void arm_cpu_record_sigbus(CPUState *cpu, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, uintptr_t ra);<br>
=C2=A0#else<br>
=C2=A0bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c<=
br>
index 034b737435..97e0728b67 100644<br>
--- a/linux-user/aarch64/cpu_loop.c<br>
+++ b/linux-user/aarch64/cpu_loop.c<br>
@@ -79,7 +79,7 @@<br>
=C2=A0void cpu_loop(CPUARMState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
-=C2=A0 =C2=A0 int trapnr, ec, fsc, si_code;<br>
+=C2=A0 =C2=A0 int trapnr, ec, fsc, si_code, si_signo;<br>
=C2=A0 =C2=A0 =C2=A0abi_long ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (;;) {<br>
@@ -121,20 +121,26 @@ void cpu_loop(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsc =3D extract32(env-&gt;e=
xception.syndrome, 0, 6);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (fsc) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x04 ... 0x07: /* Tran=
slation fault, level {0-3} */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_signo =3D TARGE=
T_SIGSEGV;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D T=
ARGET_SEGV_MAPERR;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x09 ... 0x0b: /* Acce=
ss flag fault, level {1-3} */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x0d ... 0x0f: /* Perm=
ission fault, level {1-3} */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_signo =3D TARGE=
T_SIGSEGV;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D T=
ARGET_SEGV_ACCERR;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0x11: /* Synchronous T=
ag Check Fault */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_signo =3D TARGE=
T_SIGSEGV;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D T=
ARGET_SEGV_MTESERR;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x21: /* Alignment fault */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_signo =3D TARGE=
T_SIGBUS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_code =3D TARGET=
_BUS_ADRALN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_=
reached();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 force_sig_fault(TARGET_SIGSEGV, =
si_code, env-&gt;exception.vaddress);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 force_sig_fault(si_signo, si_cod=
e, env-&gt;exception.vaddress);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_DEBUG:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_BKPT:<br>
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c<br>
index ae09adcb95..01cb6eb534 100644<br>
--- a/linux-user/arm/cpu_loop.c<br>
+++ b/linux-user/arm/cpu_loop.c<br>
@@ -25,6 +25,7 @@<br>
=C2=A0#include &quot;cpu_loop-common.h&quot;<br>
=C2=A0#include &quot;signal-common.h&quot;<br>
=C2=A0#include &quot;semihosting/common-semi.h&quot;<br>
+#include &quot;target/arm/syndrome.h&quot;<br>
<br>
=C2=A0#define get_user_code_u32(x, gaddr, env)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0({ abi_long __r =3D get_user_u32((x), (gaddr));=C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
@@ -280,7 +281,7 @@ static bool emulate_arm_fpa11(CPUARMState *env, uint32_=
t opcode)<br>
=C2=A0void cpu_loop(CPUARMState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
-=C2=A0 =C2=A0 int trapnr;<br>
+=C2=A0 =C2=A0 int trapnr, si_signo, si_code;<br>
=C2=A0 =C2=A0 =C2=A0unsigned int n, insn;<br>
=C2=A0 =C2=A0 =C2=A0abi_ulong ret;<br>
<br>
@@ -423,9 +424,30 @@ void cpu_loop(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_PREFETCH_ABORT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_DATA_ABORT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* XXX: check env-&gt;error_code=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 force_sig_fault(TARGET_SIGSEGV, =
TARGET_SEGV_MAPERR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;exception.vaddress);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* For user-only we don&#39;t se=
t TTBCR_EAE, so look at the FSR. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (env-&gt;exception.fsr &a=
mp; 0x1f) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x1: /* Alignment */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_signo =3D TARGE=
T_SIGBUS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_code =3D TARGET=
_BUS_ADRALN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x3: /* Access flag fault, =
level 1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x6: /* Access flag fault, =
level 2 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x9: /* Domain fault, level=
 1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xb: /* Domain fault, level=
 2 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xd: /* Permision fault, le=
vel 1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0xf: /* Permision fault, le=
vel 2 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_signo =3D TARGE=
T_SIGSEGV;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_code =3D TARGET=
_SEGV_ACCERR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x5: /* Translation fault, =
level 1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0x7: /* Translation fault, =
level 2 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_signo =3D TARGE=
T_SIGSEGV;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 si_code =3D TARGET=
_SEGV_MAPERR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reach=
ed();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 force_sig_fault(si_signo, si_cod=
e, env-&gt;exception.vaddress);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_DEBUG:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_BKPT:<br>
diff --git a/target/arm/cpu.c b/target/arm/cpu.c<br>
index 7a18a58ca0..a211804fd3 100644<br>
--- a/target/arm/cpu.c<br>
+++ b/target/arm/cpu.c<br>
@@ -2035,6 +2035,7 @@ static const struct TCGCPUOps arm_tcg_ops =3D {<br>
<br>
=C2=A0#ifdef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0.record_sigsegv =3D arm_cpu_record_sigsegv,<br>
+=C2=A0 =C2=A0 .record_sigbus =3D arm_cpu_record_sigbus,<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D arm_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_interrupt =3D arm_cpu_exec_interrupt,<br>
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c<br>
index 7b3bea2fbb..13d0e9b195 100644<br>
--- a/target/arm/cpu_tcg.c<br>
+++ b/target/arm/cpu_tcg.c<br>
@@ -902,6 +902,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops =3D {<br>
<br>
=C2=A0#ifdef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0.record_sigsegv =3D arm_cpu_record_sigsegv,<br>
+=C2=A0 =C2=A0 .record_sigbus =3D arm_cpu_record_sigbus,<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D arm_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt,<br>
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c<br>
index dc5860180f..12a934e924 100644<br>
--- a/target/arm/tlb_helper.c<br>
+++ b/target/arm/tlb_helper.c<br>
@@ -213,4 +213,10 @@ void arm_cpu_record_sigsegv(CPUState *cs, vaddr addr,<=
br>
=C2=A0 =C2=A0 =C2=A0cpu_restore_state(cs, ra, true);<br>
=C2=A0 =C2=A0 =C2=A0arm_deliver_fault(cpu, addr, access_type, MMU_USER_IDX,=
 &amp;fi);<br>
=C2=A0}<br>
+<br>
+void arm_cpu_record_sigbus(CPUState *cs, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, uintptr_t ra)<br>
+{<br>
+=C2=A0 =C2=A0 arm_cpu_do_unaligned_access(cs, addr, access_type, MMU_USER_=
IDX, ra);<br>
+}<br>
=C2=A0#endif /* !defined(CONFIG_USER_ONLY) */<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000004c599805ce68e2c1--

