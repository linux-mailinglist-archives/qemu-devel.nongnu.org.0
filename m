Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17EF3FF4FA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:33:51 +0200 (CEST)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtPD-0002IM-0A
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtGs-0004UT-Nr
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:25:14 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtGo-0005gK-Pa
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:25:14 -0400
Received: by mail-ua1-x936.google.com with SMTP id x6so1574622uai.11
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pOzMwxgST2XJbxjjsjqRotGSxsdcLHUskxe0blFFOf0=;
 b=LudhGsh32A3Km3n5aiDuciiTAr+2I49ROwWqHgSTsB79VUGL8TM2DyRQ2GoHY4sbo4
 DSOIXGqjjUkQ1AnSWJloCi9+7lTpU6ocKu0olTBZMkRllHsW1bZkEw3ervDa9vg32Ye4
 DuwlTeqqhOxiSp7ZBFK/xsc+gtbt9NsIXQO28QqQQrCKkxLYwqIIe02kQLdAEEfjMYd1
 JLjfmIuwPhqj0jNkG4FQOuggJ0aUTgg2ALGlFlGynYnCl9uM1DEc/rgR3onVKZoYgG7g
 xslqmtDCVDRTXJPrvFwimr0nZ0sagGS5HNVQY+RLuBh3O3FHuirWytD7jcoPxzT7G3pJ
 2wuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pOzMwxgST2XJbxjjsjqRotGSxsdcLHUskxe0blFFOf0=;
 b=oHkVRcuxXzDScKNyF4Hy7IdYR+Ap9nXipZcN/AchwzaFSHNOA2ZI2uV/rsJx1BvBPA
 iRucw2V4kOJcYRC/IMY42g2r51FCoS6pPSQo3j6t9zhJXoNIadKVut+ds7lOXqJuKRG7
 swzYy8998T4x0CWQ3YaPfO+kXKyUKCBZyPlEaJluGwY36xl1XlhGjSH1NuZoVexzYKyb
 0+M9C67lQ6ELsRxa/JbGfxKa5gcUbb752HvEI7c0dvTt3eROTj6UUWRR9SpiSYLpKJ/Z
 E9/n+jBBIn5VtLSlBzbirLo5cUNkBv79lhtmEIGpKl2r81na28QcPvrPNokU9vaHhsBq
 Zi3w==
X-Gm-Message-State: AOAM530eIv2LjsxME4V8qnpuL/uExQd5e4t3+BKiOxO661HrM/x5ALw6
 8S6Pw3yTbxsYdi38I0mFCdRL3NQFjvVdW3GvNhI40g==
X-Google-Smtp-Source: ABdhPJwyPQLROVPKSVhF1EpfggN4L04FP3CHC5K3i6FcsTSXCqIkyu3WnsHcyq8mPEgGOwVkokhpyMsUNCOnxjOfyv0=
X-Received: by 2002:a9f:2a87:: with SMTP id z7mr90111uai.11.1630614309810;
 Thu, 02 Sep 2021 13:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-18-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-18-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:24:58 -0600
Message-ID: <CANCZdfr=iGO2yCNE_A8OQjuc1KoAWz8MTPLJCWgnMzM-s1CO1w@mail.gmail.com>
Subject: Re: [PATCH 17/24] target/ppc: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000b3c93305cb08fa0e"
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-ppc <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b3c93305cb08fa0e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/ppc/cpu.h         |  4 ++--
>  target/ppc/cpu_init.c    |  2 +-
>  target/ppc/excp_helper.c | 21 +++------------------
>  3 files changed, 6 insertions(+), 21 deletions(-)
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 500205229c0..362e7c4c5c7 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1254,8 +1254,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor,
> PPCVirtualHypervisorClass,
>                       PPC_VIRTUAL_HYPERVISOR, TYPE_PPC_VIRTUAL_HYPERVISOR=
)
>  #endif /* CONFIG_USER_ONLY */
>
> -void ppc_cpu_do_interrupt(CPUState *cpu);
> -bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
> @@ -1271,6 +1269,8 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunctio=
n
> f, CPUState *cs,
>  int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>                                 int cpuid, void *opaque);
>  #ifndef CONFIG_USER_ONLY
> +void ppc_cpu_do_interrupt(CPUState *cpu);
> +bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void ppc_cpu_do_system_reset(CPUState *cs);
>  void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector);
>  extern const VMStateDescription vmstate_ppc_cpu;
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index ad7abc6041a..6aad01d1d3a 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9014,10 +9014,10 @@ static const struct SysemuCPUOps ppc_sysemu_ops =
=3D {
>
>  static const struct TCGCPUOps ppc_tcg_ops =3D {
>    .initialize =3D ppc_translate_init,
> -  .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .tlb_fill =3D ppc_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +  .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .do_interrupt =3D ppc_cpu_do_interrupt,
>    .cpu_exec_enter =3D ppc_cpu_exec_enter,
>    .cpu_exec_exit =3D ppc_cpu_exec_exit,
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7b6ac16eef7..d7e32ee107e 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -40,24 +40,8 @@
>
>
>  /***********************************************************************=
******/
>  /* Exception processing */
> -#if defined(CONFIG_USER_ONLY)
> -void ppc_cpu_do_interrupt(CPUState *cs)
> -{
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    CPUPPCState *env =3D &cpu->env;
> +#if !defined(CONFIG_USER_ONLY)
>
> -    cs->exception_index =3D POWERPC_EXCP_NONE;
> -    env->error_code =3D 0;
> -}
> -
> -static void ppc_hw_interrupt(CPUPPCState *env)
> -{
> -    CPUState *cs =3D env_cpu(env);
> -
> -    cs->exception_index =3D POWERPC_EXCP_NONE;
> -    env->error_code =3D 0;
> -}
> -#else /* defined(CONFIG_USER_ONLY) */
>  static inline void dump_syscall(CPUPPCState *env)
>  {
>      qemu_log_mask(CPU_LOG_INT, "syscall r0=3D%016" PRIx64
> @@ -1113,7 +1097,6 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs,
> target_ulong vector)
>
>      powerpc_set_excp_state(cpu, vector, msr);
>  }
> -#endif /* !CONFIG_USER_ONLY */
>
>  bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> @@ -1130,6 +1113,8 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      return false;
>  }
>
> +#endif /* !CONFIG_USER_ONLY */
> +
>  #if defined(DEBUG_OP)
>  static void cpu_dump_rfi(target_ulong RA, target_ulong msr)
>  {
> --
> 2.31.1
>
>

--000000000000b3c93305cb08fa0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:18 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict cpu_exec_interrupt() and its callees to sysemu.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/ppc/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0target/ppc/cpu_init.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0target/ppc/excp_helper.c | 21 +++------------------<br>
=C2=A03 files changed, 6 insertions(+), 21 deletions(-)<br>
<br></blockquote><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail=
-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:=
2px 0px 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h<br>
index 500205229c0..362e7c4c5c7 100644<br>
--- a/target/ppc/cpu.h<br>
+++ b/target/ppc/cpu.h<br>
@@ -1254,8 +1254,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtual=
HypervisorClass,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PPC_VIRTUAL_HYPERVISOR, TYPE_PPC_VIRTUAL_HYPERVISOR)<br>
=C2=A0#endif /* CONFIG_USER_ONLY */<br>
<br>
-void ppc_cpu_do_interrupt(CPUState *cpu);<br>
-bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
=C2=A0void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg=
);<br>
@@ -1271,6 +1269,8 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction =
f, CPUState *cs,<br>
=C2=A0int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int cpuid, void *opaque);<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+void ppc_cpu_do_interrupt(CPUState *cpu);<br>
+bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
=C2=A0void ppc_cpu_do_system_reset(CPUState *cs);<br>
=C2=A0void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector=
);<br>
=C2=A0extern const VMStateDescription vmstate_ppc_cpu;<br>
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c<br>
index ad7abc6041a..6aad01d1d3a 100644<br>
--- a/target/ppc/cpu_init.c<br>
+++ b/target/ppc/cpu_init.c<br>
@@ -9014,10 +9014,10 @@ static const struct SysemuCPUOps ppc_sysemu_ops =3D=
 {<br>
<br>
=C2=A0static const struct TCGCPUOps ppc_tcg_ops =3D {<br>
=C2=A0 =C2=A0.initialize =3D ppc_translate_init,<br>
-=C2=A0 .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0.tlb_fill =3D ppc_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0.do_interrupt =3D ppc_cpu_do_interrupt,<br>
=C2=A0 =C2=A0.cpu_exec_enter =3D ppc_cpu_exec_enter,<br>
=C2=A0 =C2=A0.cpu_exec_exit =3D ppc_cpu_exec_exit,<br>
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c<br>
index 7b6ac16eef7..d7e32ee107e 100644<br>
--- a/target/ppc/excp_helper.c<br>
+++ b/target/ppc/excp_helper.c<br>
@@ -40,24 +40,8 @@<br>
<br>
=C2=A0/********************************************************************=
*********/<br>
=C2=A0/* Exception processing */<br>
-#if defined(CONFIG_USER_ONLY)<br>
-void ppc_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-=C2=A0 =C2=A0 PowerPCCPU *cpu =3D POWERPC_CPU(cs);<br>
-=C2=A0 =C2=A0 CPUPPCState *env =3D &amp;cpu-&gt;env;<br>
+#if !defined(CONFIG_USER_ONLY)<br>
<br>
-=C2=A0 =C2=A0 cs-&gt;exception_index =3D POWERPC_EXCP_NONE;<br>
-=C2=A0 =C2=A0 env-&gt;error_code =3D 0;<br>
-}<br>
-<br>
-static void ppc_hw_interrupt(CPUPPCState *env)<br>
-{<br>
-=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
-<br>
-=C2=A0 =C2=A0 cs-&gt;exception_index =3D POWERPC_EXCP_NONE;<br>
-=C2=A0 =C2=A0 env-&gt;error_code =3D 0;<br>
-}<br>
-#else /* defined(CONFIG_USER_ONLY) */<br>
=C2=A0static inline void dump_syscall(CPUPPCState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0qemu_log_mask(CPU_LOG_INT, &quot;syscall r0=3D%016&quot=
; PRIx64<br>
@@ -1113,7 +1097,6 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, tar=
get_ulong vector)<br>
<br>
=C2=A0 =C2=A0 =C2=A0powerpc_set_excp_state(cpu, vector, msr);<br>
=C2=A0}<br>
-#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0{<br>
@@ -1130,6 +1113,8 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interru=
pt_request)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
+#endif /* !CONFIG_USER_ONLY */<br>
+<br>
=C2=A0#if defined(DEBUG_OP)<br>
=C2=A0static void cpu_dump_rfi(target_ulong RA, target_ulong msr)<br>
=C2=A0{<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000b3c93305cb08fa0e--

