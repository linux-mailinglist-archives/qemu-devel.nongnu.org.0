Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D36140102C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:27:31 +0200 (CEST)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMt7K-0001f5-Nc
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mMt6A-0000lo-Iu
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:26:18 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:40950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mMt68-0003HN-Am
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:26:18 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id d6so3446870vsr.7
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lEHAVO6iMj37wyWEHlCqF0IZwBelIU5qRZGxymv5ppc=;
 b=VeDmmuXZragzVz7EVp/fGiowN4ijJL8HkyL+4LxRz5cLNU0DGbLWrRynru/AsmYBjD
 q7pxubQsvQ9dZuI0k7nPP2jGcxJmpoYpvsQhuXO1x435cWsVPuA2KwVq1iiimEGl8jRn
 FCU0VNe80DxGble4qoqfRKQdYBcVJZtJ1fz4/3q8xIZ68t7mdEAWfV+lvxM1XrwBw5Qf
 +nLNoihty8S5bmVo7jxuh9xS3pUcLrTadCU/llfQBQnBbXCP/TL0Njr+8SdhlQt5TXyt
 8iNcf6DH9iKeAizSpSrD6zyabmYlCUv2ROHINIklTJbohNl+7pdg9PBdKfmNYcsQlwQ5
 5mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lEHAVO6iMj37wyWEHlCqF0IZwBelIU5qRZGxymv5ppc=;
 b=ajYqlUcdCgevX0jOM55SYxzZBVqJtHZ0TX07JNS7vPvUMGSF6h4sulQ5ZhqyLutaqF
 q9jxUn+3dAB/zr7i8L0damhbPt1l6LtddHD+P3hIvUqmtsv/2qD2XStFeyvWDVT6E+Wm
 reeyyLSqqrYR/UXrC2AbiNvKt9L4jlKeGFTmHb9cvBgdF521jHPknBFNDzu99TBppjUX
 JxyQ2pT7R32L8UbA3+/PTItVgfefR7JCM/s5APqK7HFRCu8gM72Amk7NrqJGpeIaQmgu
 gfTTIHWqWafyy2eWGKsMO73RNxaBwWuj+z+JiCmK2aUlPELoqgMFyJkiwQx86sMtipWB
 RVCA==
X-Gm-Message-State: AOAM532zLOWHjITywe0Q3xD1L3U8qgp8NbAUNaKuqy3tlC9CUUTqvJia
 fZ/e9CWHzYD84XdRCQ2D7utVJhYN5EOna8FJ/NzZIA==
X-Google-Smtp-Source: ABdhPJz7AzKEOe8w6kZzKcTSfPstwmIAfgKV0ON/O2CLatCA7yt/EOEbx7FKPBTEp+wnPwsL6XgHu1+myH8pvoBrSHQ=
X-Received: by 2002:a05:6102:1175:: with SMTP id
 k21mr3820769vsg.42.1630851973817; 
 Sun, 05 Sep 2021 07:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210904235542.1092641-1-f4bug@amsat.org>
 <20210904235542.1092641-12-f4bug@amsat.org>
In-Reply-To: <20210904235542.1092641-12-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 5 Sep 2021 08:26:03 -0600
Message-ID: <CANCZdfo-iNJWaoOE7+fFRgKqNZ+c+oLwG0R6Qo2XGsdUjtp8kA@mail.gmail.com>
Subject: Re: [PATCH v2 11/24] target/i386: Move x86_cpu_exec_interrupt() under
 sysemu/ folder
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000094c00c05cb4050f2"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000094c00c05cb4050f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 4, 2021 at 5:56 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Following the logic of commit 30493a030ff ("i386: split seg_helper
> into user-only and sysemu parts"), move x86_cpu_exec_interrupt()
> under sysemu/seg_helper.c.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> I prefer to not squash this into the previous patch because the
> ifdef'ry removal (in previous patch) is not trivial IMO.
> ---
>  target/i386/tcg/seg_helper.c        | 64 ----------------------------
>  target/i386/tcg/sysemu/seg_helper.c | 65 +++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+), 64 deletions(-)
>

Reviewed-By: Warner Losh <imp@bsdimp.com>



> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
> index 13c6e6ee62e..baa905a0cd6 100644
> --- a/target/i386/tcg/seg_helper.c
> +++ b/target/i386/tcg/seg_helper.c
> @@ -1110,70 +1110,6 @@ void do_interrupt_x86_hardirq(CPUX86State *env, in=
t
> intno, int is_hw)
>      do_interrupt_all(env_archcpu(env), intno, 0, 0, 0, is_hw);
>  }
>
> -#ifndef CONFIG_USER_ONLY
> -bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> -{
> -    X86CPU *cpu =3D X86_CPU(cs);
> -    CPUX86State *env =3D &cpu->env;
> -    int intno;
> -
> -    interrupt_request =3D x86_cpu_pending_interrupt(cs, interrupt_reques=
t);
> -    if (!interrupt_request) {
> -        return false;
> -    }
> -
> -    /* Don't process multiple interrupt requests in a single call.
> -     * This is required to make icount-driven execution deterministic.
> -     */
> -    switch (interrupt_request) {
> -    case CPU_INTERRUPT_POLL:
> -        cs->interrupt_request &=3D ~CPU_INTERRUPT_POLL;
> -        apic_poll_irq(cpu->apic_state);
> -        break;
> -    case CPU_INTERRUPT_SIPI:
> -        do_cpu_sipi(cpu);
> -        break;
> -    case CPU_INTERRUPT_SMI:
> -        cpu_svm_check_intercept_param(env, SVM_EXIT_SMI, 0, 0);
> -        cs->interrupt_request &=3D ~CPU_INTERRUPT_SMI;
> -        do_smm_enter(cpu);
> -        break;
> -    case CPU_INTERRUPT_NMI:
> -        cpu_svm_check_intercept_param(env, SVM_EXIT_NMI, 0, 0);
> -        cs->interrupt_request &=3D ~CPU_INTERRUPT_NMI;
> -        env->hflags2 |=3D HF2_NMI_MASK;
> -        do_interrupt_x86_hardirq(env, EXCP02_NMI, 1);
> -        break;
> -    case CPU_INTERRUPT_MCE:
> -        cs->interrupt_request &=3D ~CPU_INTERRUPT_MCE;
> -        do_interrupt_x86_hardirq(env, EXCP12_MCHK, 0);
> -        break;
> -    case CPU_INTERRUPT_HARD:
> -        cpu_svm_check_intercept_param(env, SVM_EXIT_INTR, 0, 0);
> -        cs->interrupt_request &=3D ~(CPU_INTERRUPT_HARD |
> -                                   CPU_INTERRUPT_VIRQ);
> -        intno =3D cpu_get_pic_interrupt(env);
> -        qemu_log_mask(CPU_LOG_TB_IN_ASM,
> -                      "Servicing hardware INT=3D0x%02x\n", intno);
> -        do_interrupt_x86_hardirq(env, intno, 1);
> -        break;
> -    case CPU_INTERRUPT_VIRQ:
> -        /* FIXME: this should respect TPR */
> -        cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
> -        intno =3D x86_ldl_phys(cs, env->vm_vmcb
> -                             + offsetof(struct vmcb, control.int_vector)=
);
> -        qemu_log_mask(CPU_LOG_TB_IN_ASM,
> -                      "Servicing virtual hardware INT=3D0x%02x\n", intno=
);
> -        do_interrupt_x86_hardirq(env, intno, 1);
> -        cs->interrupt_request &=3D ~CPU_INTERRUPT_VIRQ;
> -        break;
> -    }
> -
> -    /* Ensure that no TB jump will be modified as the program flow was
> changed.  */
> -    return true;
> -}
> -#endif /* CONFIG_USER_ONLY */
> -
>  void helper_lldt(CPUX86State *env, int selector)
>  {
>      SegmentCache *dt;
> diff --git a/target/i386/tcg/sysemu/seg_helper.c
> b/target/i386/tcg/sysemu/seg_helper.c
> index 82c0856c417..b425b930f9d 100644
> --- a/target/i386/tcg/sysemu/seg_helper.c
> +++ b/target/i386/tcg/sysemu/seg_helper.c
> @@ -125,6 +125,71 @@ void x86_cpu_do_interrupt(CPUState *cs)
>      }
>  }
>
> +bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> +{
> +    X86CPU *cpu =3D X86_CPU(cs);
> +    CPUX86State *env =3D &cpu->env;
> +    int intno;
> +
> +    interrupt_request =3D x86_cpu_pending_interrupt(cs, interrupt_reques=
t);
> +    if (!interrupt_request) {
> +        return false;
> +    }
> +
> +    /*
> +     * Don't process multiple interrupt requests in a single call.
> +     * This is required to make icount-driven execution deterministic.
> +     */
> +    switch (interrupt_request) {
> +    case CPU_INTERRUPT_POLL:
> +        cs->interrupt_request &=3D ~CPU_INTERRUPT_POLL;
> +        apic_poll_irq(cpu->apic_state);
> +        break;
> +    case CPU_INTERRUPT_SIPI:
> +        do_cpu_sipi(cpu);
> +        break;
> +    case CPU_INTERRUPT_SMI:
> +        cpu_svm_check_intercept_param(env, SVM_EXIT_SMI, 0, 0);
> +        cs->interrupt_request &=3D ~CPU_INTERRUPT_SMI;
> +        do_smm_enter(cpu);
> +        break;
> +    case CPU_INTERRUPT_NMI:
> +        cpu_svm_check_intercept_param(env, SVM_EXIT_NMI, 0, 0);
> +        cs->interrupt_request &=3D ~CPU_INTERRUPT_NMI;
> +        env->hflags2 |=3D HF2_NMI_MASK;
> +        do_interrupt_x86_hardirq(env, EXCP02_NMI, 1);
> +        break;
> +    case CPU_INTERRUPT_MCE:
> +        cs->interrupt_request &=3D ~CPU_INTERRUPT_MCE;
> +        do_interrupt_x86_hardirq(env, EXCP12_MCHK, 0);
> +        break;
> +    case CPU_INTERRUPT_HARD:
> +        cpu_svm_check_intercept_param(env, SVM_EXIT_INTR, 0, 0);
> +        cs->interrupt_request &=3D ~(CPU_INTERRUPT_HARD |
> +                                   CPU_INTERRUPT_VIRQ);
> +        intno =3D cpu_get_pic_interrupt(env);
> +        qemu_log_mask(CPU_LOG_TB_IN_ASM,
> +                      "Servicing hardware INT=3D0x%02x\n", intno);
> +        do_interrupt_x86_hardirq(env, intno, 1);
> +        break;
> +    case CPU_INTERRUPT_VIRQ:
> +        /* FIXME: this should respect TPR */
> +        cpu_svm_check_intercept_param(env, SVM_EXIT_VINTR, 0, 0);
> +        intno =3D x86_ldl_phys(cs, env->vm_vmcb
> +                             + offsetof(struct vmcb, control.int_vector)=
);
> +        qemu_log_mask(CPU_LOG_TB_IN_ASM,
> +                      "Servicing virtual hardware INT=3D0x%02x\n", intno=
);
> +        do_interrupt_x86_hardirq(env, intno, 1);
> +        cs->interrupt_request &=3D ~CPU_INTERRUPT_VIRQ;
> +        break;
> +    }
> +
> +    /*
> +     * Ensure that no TB jump will be modified as the program flow was
> changed.
> +     */
> +    return true;
> +}
> +
>  /* check if Port I/O is allowed in TSS */
>  void helper_check_io(CPUX86State *env, uint32_t addr, uint32_t size)
>  {
> --
> 2.31.1
>
>

--00000000000094c00c05cb4050f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 4, 2021 at 5:56 PM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Following the logic of commit 30493a030ff (&quot;i386: split seg_helper<br=
>
into user-only and sysemu parts&quot;), move x86_cpu_exec_interrupt()<br>
under sysemu/seg_helper.c.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
I prefer to not squash this into the previous patch because the<br>
ifdef&#39;ry removal (in previous patch) is not trivial IMO.<br>
---<br>
=C2=A0target/i386/tcg/seg_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 64 --------=
--------------------<br>
=C2=A0target/i386/tcg/sysemu/seg_helper.c | 65 ++++++++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 65 insertions(+), 64 deletions(-)<br></blockquote><d=
iv><br></div><div><div>Reviewed-By: Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com">imp@bsdimp.com</a>&gt;</div><div><br></div></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c<br=
>
index 13c6e6ee62e..baa905a0cd6 100644<br>
--- a/target/i386/tcg/seg_helper.c<br>
+++ b/target/i386/tcg/seg_helper.c<br>
@@ -1110,70 +1110,6 @@ void do_interrupt_x86_hardirq(CPUX86State *env, int =
intno, int is_hw)<br>
=C2=A0 =C2=A0 =C2=A0do_interrupt_all(env_archcpu(env), intno, 0, 0, 0, is_h=
w);<br>
=C2=A0}<br>
<br>
-#ifndef CONFIG_USER_ONLY<br>
-bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
-{<br>
-=C2=A0 =C2=A0 X86CPU *cpu =3D X86_CPU(cs);<br>
-=C2=A0 =C2=A0 CPUX86State *env =3D &amp;cpu-&gt;env;<br>
-=C2=A0 =C2=A0 int intno;<br>
-<br>
-=C2=A0 =C2=A0 interrupt_request =3D x86_cpu_pending_interrupt(cs, interrup=
t_request);<br>
-=C2=A0 =C2=A0 if (!interrupt_request) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* Don&#39;t process multiple interrupt requests in a single=
 call.<br>
-=C2=A0 =C2=A0 =C2=A0* This is required to make icount-driven execution det=
erministic.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 switch (interrupt_request) {<br>
-=C2=A0 =C2=A0 case CPU_INTERRUPT_POLL:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~CPU_INTERRU=
PT_POLL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_poll_irq(cpu-&gt;apic_state);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case CPU_INTERRUPT_SIPI:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_cpu_sipi(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case CPU_INTERRUPT_SMI:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_svm_check_intercept_param(env, SVM_EXIT_SM=
I, 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~CPU_INTERRU=
PT_SMI;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_smm_enter(cpu);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case CPU_INTERRUPT_NMI:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_svm_check_intercept_param(env, SVM_EXIT_NM=
I, 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~CPU_INTERRU=
PT_NMI;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hflags2 |=3D HF2_NMI_MASK;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_interrupt_x86_hardirq(env, EXCP02_NMI, 1);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case CPU_INTERRUPT_MCE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~CPU_INTERRU=
PT_MCE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_interrupt_x86_hardirq(env, EXCP12_MCHK, 0);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case CPU_INTERRUPT_HARD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_svm_check_intercept_param(env, SVM_EXIT_IN=
TR, 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~(CPU_INTERR=
UPT_HARD |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_INTERRUPT_VIRQ);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 intno =3D cpu_get_pic_interrupt(env);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(CPU_LOG_TB_IN_ASM,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Servicing hardware INT=3D0x%02x\n&quot;, intno);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_interrupt_x86_hardirq(env, intno, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case CPU_INTERRUPT_VIRQ:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: this should respect TPR */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_svm_check_intercept_param(env, SVM_EXIT_VI=
NTR, 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 intno =3D x86_ldl_phys(cs, env-&gt;vm_vmcb<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ offsetof(struct vmcb, control.int_vector))=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(CPU_LOG_TB_IN_ASM,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Servicing virtual hardware INT=3D0x%02x\n&quot;, intno);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_interrupt_x86_hardirq(env, intno, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~CPU_INTERRU=
PT_VIRQ;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* Ensure that no TB jump will be modified as the program fl=
ow was changed.=C2=A0 */<br>
-=C2=A0 =C2=A0 return true;<br>
-}<br>
-#endif /* CONFIG_USER_ONLY */<br>
-<br>
=C2=A0void helper_lldt(CPUX86State *env, int selector)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SegmentCache *dt;<br>
diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu/s=
eg_helper.c<br>
index 82c0856c417..b425b930f9d 100644<br>
--- a/target/i386/tcg/sysemu/seg_helper.c<br>
+++ b/target/i386/tcg/sysemu/seg_helper.c<br>
@@ -125,6 +125,71 @@ void x86_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+bool x86_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
+{<br>
+=C2=A0 =C2=A0 X86CPU *cpu =3D X86_CPU(cs);<br>
+=C2=A0 =C2=A0 CPUX86State *env =3D &amp;cpu-&gt;env;<br>
+=C2=A0 =C2=A0 int intno;<br>
+<br>
+=C2=A0 =C2=A0 interrupt_request =3D x86_cpu_pending_interrupt(cs, interrup=
t_request);<br>
+=C2=A0 =C2=A0 if (!interrupt_request) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Don&#39;t process multiple interrupt requests in a s=
ingle call.<br>
+=C2=A0 =C2=A0 =C2=A0* This is required to make icount-driven execution det=
erministic.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 switch (interrupt_request) {<br>
+=C2=A0 =C2=A0 case CPU_INTERRUPT_POLL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~CPU_INTERRU=
PT_POLL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_poll_irq(cpu-&gt;apic_state);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CPU_INTERRUPT_SIPI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_cpu_sipi(cpu);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CPU_INTERRUPT_SMI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_svm_check_intercept_param(env, SVM_EXIT_SM=
I, 0, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~CPU_INTERRU=
PT_SMI;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_smm_enter(cpu);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CPU_INTERRUPT_NMI:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_svm_check_intercept_param(env, SVM_EXIT_NM=
I, 0, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~CPU_INTERRU=
PT_NMI;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;hflags2 |=3D HF2_NMI_MASK;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_interrupt_x86_hardirq(env, EXCP02_NMI, 1);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CPU_INTERRUPT_MCE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~CPU_INTERRU=
PT_MCE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_interrupt_x86_hardirq(env, EXCP12_MCHK, 0);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CPU_INTERRUPT_HARD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_svm_check_intercept_param(env, SVM_EXIT_IN=
TR, 0, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~(CPU_INTERR=
UPT_HARD |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU_INTERRUPT_VIRQ);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 intno =3D cpu_get_pic_interrupt(env);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(CPU_LOG_TB_IN_ASM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Servicing hardware INT=3D0x%02x\n&quot;, intno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_interrupt_x86_hardirq(env, intno, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case CPU_INTERRUPT_VIRQ:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: this should respect TPR */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_svm_check_intercept_param(env, SVM_EXIT_VI=
NTR, 0, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 intno =3D x86_ldl_phys(cs, env-&gt;vm_vmcb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ offsetof(struct vmcb, control.int_vector))=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(CPU_LOG_TB_IN_ASM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Servicing virtual hardware INT=3D0x%02x\n&quot;, intno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_interrupt_x86_hardirq(env, intno, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~CPU_INTERRU=
PT_VIRQ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Ensure that no TB jump will be modified as the progr=
am flow was changed.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 return true;<br>
+}<br>
+<br>
=C2=A0/* check if Port I/O is allowed in TSS */<br>
=C2=A0void helper_check_io(CPUX86State *env, uint32_t addr, uint32_t size)<=
br>
=C2=A0{<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000094c00c05cb4050f2--

