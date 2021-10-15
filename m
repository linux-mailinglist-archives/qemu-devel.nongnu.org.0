Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D483442FB66
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:48:55 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSGE-00023d-Vf
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSCs-0000Og-OG
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:45:26 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:42551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSCq-0006cp-Pg
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:45:26 -0400
Received: by mail-vk1-xa36.google.com with SMTP id o42so5597810vkf.9
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8FzoarPMYGUcIi9Dd1njX18tUzdQ9keLkFtvRWbsDUw=;
 b=Z4dzvQxOVotfU4r0ZbsHk1nVyc50M9jFJx01WXT3kwI0ITueEJjskia2ewVFGYeo41
 4KUpRpkRegIdSomDA4z4pk9ZT6or80Pfy6ElwWIJ6K93ReO1KQQqn39dgbNIcZ+Suzi0
 bFP95Ml/ujsuUVq/RLKrbq4CdZty6NFQXK/I2GgbvOiveu/xRfyrnsq91dxgj7G4YoA/
 v8IsRtLtlRbP7ymYOhTIUsfS6T0gUqfhJjgoxY2/Mnaw21Rud6z9uJnutCm/dqTnCRJ4
 Ox0WQSlkDf/K/un87wjuwHxuf2YHzdD6vfQ8hNY5XmhwVf4J3/aCULPL4n2Qc4q20aCX
 mNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8FzoarPMYGUcIi9Dd1njX18tUzdQ9keLkFtvRWbsDUw=;
 b=rm7iShrglM7g0pwjvS9Xx3lbuQxTOuC6nZTHIpZSZxQp7r+/McLmPfucISdQIZ3be2
 fzjQGtRHjXng3yUjoidDe6Px9oDcIqmSGHuH7602JRX5N2G78IhRksb+dp2QKb0UWoJU
 O9CzRPHqjIuBQlQg/m36qzX1G80pd6PAPVRq1tuvSWvEF8XZLxls9PnE+9+IGy9WjXri
 pzNBItKxeDllURFCvVjUsLOdkeQMOCLNBY8K/ONOXLAisxz/Knm+Uo+wfdu0psxlrIQE
 O7XfsnWxIrBdoD39B1vCxic6gnHJU7tFlVb1/eRo+wuhxf365rc50J505KYRtptQ4R6b
 heNQ==
X-Gm-Message-State: AOAM530v4YVg0l07JyKi5laycEoTtR31scYQQmkIHahfsM4NsJZlZ7LR
 +EhnjZqAapL1kBnBQO0buvkKRwKDxSfcxRPvFRLtyw==
X-Google-Smtp-Source: ABdhPJyaxmN54utXUg9yxVtJut0gu1YzcHElme6Zo4D9Aj/xU6DlnOhLghTEuo7ctvv+3H78QpXgt7DFwbcY8ngSlKw=
X-Received: by 2002:a05:6122:180d:: with SMTP id
 ay13mr3861165vkb.21.1634323523665; 
 Fri, 15 Oct 2021 11:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-35-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-35-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:45:12 -0600
Message-ID: <CANCZdfqHAJ5rcUOFyo9CgFsx2kLyDn7uKBdXMyrHSaNRQ9Gc0g@mail.gmail.com>
Subject: Re: [PATCH v5 34/67] target/ppc: Implement ppc_cpu_record_sigsegv
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000013938705ce6899bb"
Received-SPF: none client-ip=2607:f8b0:4864:20::a36;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa36.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000013938705ce6899bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Record DAR, DSISR, and exception_index.  That last means
> that we must exit to cpu_loop ourselves, instead of letting
> exception_index being overwritten.
>
> This is exactly what the user-mode ppc_cpu_tlb_fill does,
> so simply rename it as ppc_cpu_record_sigsegv.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/cpu.h              |  3 ---
>  target/ppc/internal.h         |  9 +++++++++
>  target/ppc/cpu_init.c         |  6 ++++--
>  target/ppc/user_only_helper.c | 15 +++++++++++----
>  4 files changed, 24 insertions(+), 9 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index baa4e7c34d..2242d57718 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1279,9 +1279,6 @@ extern const VMStateDescription vmstate_ppc_cpu;
>
>
>  /***********************************************************************=
******/
>  void ppc_translate_init(void);
> -bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> -                      MMUAccessType access_type, int mmu_idx,
> -                      bool probe, uintptr_t retaddr);
>
>  #if !defined(CONFIG_USER_ONLY)
>  void ppc_store_sdr1(CPUPPCState *env, target_ulong value);
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 55284369f5..339974b7d8 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -283,5 +283,14 @@ static inline void pte_invalidate(target_ulong *pte0=
)
>  #define PTE_PTEM_MASK 0x7FFFFFBF
>  #define PTE_CHECK_MASK (TARGET_PAGE_MASK | 0x7B)
>
> +#ifdef CONFIG_USER_ONLY
> +void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,
> +                            MMUAccessType access_type,
> +                            bool maperr, uintptr_t ra);
> +#else
> +bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                      MMUAccessType access_type, int mmu_idx,
> +                      bool probe, uintptr_t retaddr);
> +#endif
>
>  #endif /* PPC_INTERNAL_H */
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 6aad01d1d3..ec8da08f0b 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9014,9 +9014,11 @@ static const struct SysemuCPUOps ppc_sysemu_ops =
=3D {
>
>  static const struct TCGCPUOps ppc_tcg_ops =3D {
>    .initialize =3D ppc_translate_init,
> -  .tlb_fill =3D ppc_cpu_tlb_fill,
>
> -#ifndef CONFIG_USER_ONLY
> +#ifdef CONFIG_USER_ONLY
> +  .record_sigsegv =3D ppc_cpu_record_sigsegv,
> +#else
> +  .tlb_fill =3D ppc_cpu_tlb_fill,
>    .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .do_interrupt =3D ppc_cpu_do_interrupt,
>    .cpu_exec_enter =3D ppc_cpu_exec_enter,
> diff --git a/target/ppc/user_only_helper.c b/target/ppc/user_only_helper.=
c
> index aa3f867596..7ff76f7a06 100644
> --- a/target/ppc/user_only_helper.c
> +++ b/target/ppc/user_only_helper.c
> @@ -21,16 +21,23 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "exec/exec-all.h"
> +#include "internal.h"
>
> -
> -bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> -                      MMUAccessType access_type, int mmu_idx,
> -                      bool probe, uintptr_t retaddr)
> +void ppc_cpu_record_sigsegv(CPUState *cs, vaddr address,
> +                            MMUAccessType access_type,
> +                            bool maperr, uintptr_t retaddr)
>  {
>      PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>      CPUPPCState *env =3D &cpu->env;
>      int exception, error_code;
>
> +    /*
> +     * Both DSISR and the "trap number" (exception vector offset,
> +     * looked up from exception_index) are present in the linux-user
> +     * signal frame.
> +     * FIXME: we don't actually populate the trap number properly.
> +     * It would be easiest to fill in an env->trap value now.
> +     */
>

I think the same concerns apply to bsd-user, though
the details differ since trap frames only fill in information
relevant to the specific trap type. This may require some
refinement in the future when it's time to upstream bsd-user
ppc support. I'll revisit this, though, when that time comes.

Warner


>      if (access_type =3D=3D MMU_INST_FETCH) {
>          exception =3D POWERPC_EXCP_ISI;
>          error_code =3D 0x40000000;
> --
> 2.25.1
>
>

--00000000000013938705ce6899bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:11 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Record DAR, DSISR, and exception_index.=C2=A0 That last =
means<br>
that we must exit to cpu_loop ourselves, instead of letting<br>
exception_index being overwritten.<br>
<br>
This is exactly what the user-mode ppc_cpu_tlb_fill does,<br>
so simply rename it as ppc_cpu_record_sigsegv.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/ppc/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 3 ---<br>
=C2=A0target/ppc/internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++=
+++++<br>
=C2=A0target/ppc/cpu_init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++=
--<br>
=C2=A0target/ppc/user_only_helper.c | 15 +++++++++++----<br>
=C2=A04 files changed, 24 insertions(+), 9 deletions(-)<br></blockquote><di=
v><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com">imp@bsdimp.com</a>&gt;</div></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h<br>
index baa4e7c34d..2242d57718 100644<br>
--- a/target/ppc/cpu.h<br>
+++ b/target/ppc/cpu.h<br>
@@ -1279,9 +1279,6 @@ extern const VMStateDescription vmstate_ppc_cpu;<br>
<br>
=C2=A0/********************************************************************=
*********/<br>
=C2=A0void ppc_translate_init(void);<br>
-bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MMUAccessType access_type, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool probe, uintptr_t retaddr);<br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0void ppc_store_sdr1(CPUPPCState *env, target_ulong value);<br>
diff --git a/target/ppc/internal.h b/target/ppc/internal.h<br>
index 55284369f5..339974b7d8 100644<br>
--- a/target/ppc/internal.h<br>
+++ b/target/ppc/internal.h<br>
@@ -283,5 +283,14 @@ static inline void pte_invalidate(target_ulong *pte0)<=
br>
=C2=A0#define PTE_PTEM_MASK 0x7FFFFFBF<br>
=C2=A0#define PTE_CHECK_MASK (TARGET_PAGE_MASK | 0x7B)<br>
<br>
+#ifdef CONFIG_USER_ONLY<br>
+void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool maperr, uintptr_t ra);<br>
+#else<br>
+bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MMUAccessType access_type, int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool probe, uintptr_t retaddr);<br>
+#endif<br>
<br>
=C2=A0#endif /* PPC_INTERNAL_H */<br>
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c<br>
index 6aad01d1d3..ec8da08f0b 100644<br>
--- a/target/ppc/cpu_init.c<br>
+++ b/target/ppc/cpu_init.c<br>
@@ -9014,9 +9014,11 @@ static const struct SysemuCPUOps ppc_sysemu_ops =3D =
{<br>
<br>
=C2=A0static const struct TCGCPUOps ppc_tcg_ops =3D {<br>
=C2=A0 =C2=A0.initialize =3D ppc_translate_init,<br>
-=C2=A0 .tlb_fill =3D ppc_cpu_tlb_fill,<br>
<br>
-#ifndef CONFIG_USER_ONLY<br>
+#ifdef CONFIG_USER_ONLY<br>
+=C2=A0 .record_sigsegv =3D ppc_cpu_record_sigsegv,<br>
+#else<br>
+=C2=A0 .tlb_fill =3D ppc_cpu_tlb_fill,<br>
=C2=A0 =C2=A0.cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0.do_interrupt =3D ppc_cpu_do_interrupt,<br>
=C2=A0 =C2=A0.cpu_exec_enter =3D ppc_cpu_exec_enter,<br>
diff --git a/target/ppc/user_only_helper.c b/target/ppc/user_only_helper.c<=
br>
index aa3f867596..7ff76f7a06 100644<br>
--- a/target/ppc/user_only_helper.c<br>
+++ b/target/ppc/user_only_helper.c<br>
@@ -21,16 +21,23 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
+#include &quot;internal.h&quot;<br>
<br>
-<br>
-bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MMUAccessType access_type, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool probe, uintptr_t retaddr)<br>
+void ppc_cpu_record_sigsegv(CPUState *cs, vaddr address,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool maperr, uintptr_t retaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0PowerPCCPU *cpu =3D POWERPC_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPUPPCState *env =3D &amp;cpu-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0int exception, error_code;<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Both DSISR and the &quot;trap number&quot; (exceptio=
n vector offset,<br>
+=C2=A0 =C2=A0 =C2=A0* looked up from exception_index) are present in the l=
inux-user<br>
+=C2=A0 =C2=A0 =C2=A0* signal frame.<br>
+=C2=A0 =C2=A0 =C2=A0* FIXME: we don&#39;t actually populate the trap numbe=
r properly.<br>
+=C2=A0 =C2=A0 =C2=A0* It would be easiest to fill in an env-&gt;trap value=
 now.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br></blockquote><div><br></div><div>I think the sam=
e concerns apply to bsd-user, though</div><div>the details differ since tra=
p frames only fill in information</div><div>relevant to the specific trap t=
ype. This may require some</div><div>refinement in the future when it&#39;s=
 time to upstream bsd-user</div><div>ppc support. I&#39;ll revisit this, th=
ough, when that time comes.</div><div><br></div><div>Warner</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0if (access_type =3D=3D MMU_INST_FETCH) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exception =3D POWERPC_EXCP_ISI;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_code =3D 0x40000000;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000013938705ce6899bb--

