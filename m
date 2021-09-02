Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC66D3FF504
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:36:55 +0200 (CEST)
Received: from localhost ([::1]:51076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtSB-0000Ki-1y
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtIk-0007N4-VM
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:27:11 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:45013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtIh-0007Mk-MU
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:27:10 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id n63so2625503vsc.11
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sVmxSajWjmvQFNeYbztXOm0im/4xVGH/4yffdaVa2o=;
 b=IQQ94W6z8/5NeuHYKaXJA7RYxibVGpYbasMkLkmGZJL3M+x3Xa5il3RwL6ueiFAM/e
 KZfjBSJkhzWt5Kam+dauac+KhHY5NbhN7GOwm2XjxnfuwlwYar9d6+Jz1EPfV8C73l6Z
 uA45tOQXvh9FlplZau1rLO0tZ2T9gndnL+IsEx8FsgwN0PY68d4exPaH8AviLW9cMyP+
 q96MfUxmR6BNfADaAFSggezGnEa4No1M7MPzdaVs5SVhUfszpmfjYXYuloCzhC905SUp
 vochMfcUBcnTQIfEw8XypsyDGVsrpLtiR61MuRT+EgvuTFEjZq9YJzHOzXJRolWHFWYd
 QivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sVmxSajWjmvQFNeYbztXOm0im/4xVGH/4yffdaVa2o=;
 b=s8GqmrWocRDoFo2rJUJ1zjWV8nnnFG09RFzdsjRb7N32+bUJ9TpNJig3UtNrjbRl8N
 TxriFXL4iZu+Ii3L6O4rlRR8TgRfT633E5iEYLewq6K2wxPCH7loqIYVbE0G37bSk6nz
 4djPbk3S3K8a4MO/XtAwsoBWdZkOJsbBmtJaV5lmZXd9xJWQ4p1UOzEccrgNnQQTjON1
 AUFaP/mKMue32rCNXzZ0VmoM6BHpnmFOWjvXBW8gmBxb8euFF5F35a1BjLaE5BGQUc8f
 X0exKQdnuicV4M439CVIL0MAEAkRizF8Ru8sPEllh5xq0jeFXhoQHkzPJHd7gNRriEBt
 bNeg==
X-Gm-Message-State: AOAM5301fg33yNQNJBILWvknEF1xwT9ovblpjSwIKDKmfzZLBvoBO25U
 VPY3ft609BQ6VYnevyDuqG/lF2BuBRKrLOfyr3PqXQ==
X-Google-Smtp-Source: ABdhPJxpZYsqFeZuO5Bb4wHZN2UzYcIlZFXJ6eJ9hB59qiuprKLJ0+5UlydVmDR8GTbO2mXPmmHsyx4b3VO6XLhELQQ=
X-Received: by 2002:a05:6102:5a:: with SMTP id
 k26mr4349500vsp.26.1630614426851; 
 Thu, 02 Sep 2021 13:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-23-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-23-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:26:55 -0600
Message-ID: <CANCZdfr3refw4KEqgd0npRHeZVs92N5G45MpJ5vc6BjpV0koAw@mail.gmail.com>
Subject: Re: [PATCH 22/24] target/xtensa: Restrict cpu_exec_interrupt()
 handler to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000ada9bf05cb090178"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

--000000000000ada9bf05cb090178
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:19 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/xtensa/cpu.h        | 4 ++--
>  target/xtensa/cpu.c        | 2 +-
>  target/xtensa/exc_helper.c | 7 ++-----
>  3 files changed, 5 insertions(+), 8 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index 1e0cb1535ca..cbb720e7cca 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -566,14 +566,14 @@ struct XtensaCPU {
>  bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           MMUAccessType access_type, int mmu_idx,
>                           bool probe, uintptr_t retaddr);
> +#ifndef CONFIG_USER_ONLY
>  void xtensa_cpu_do_interrupt(CPUState *cpu);
>  bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
> -#ifndef CONFIG_USER_ONLY
>  void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
> vaddr addr,
>                                        unsigned size, MMUAccessType
> access_type,
>                                        int mmu_idx, MemTxAttrs attrs,
>                                        MemTxResult response, uintptr_t
> retaddr);
> -#endif /* !CONFIG_USER_ONLY */
> +#endif
>  void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void xtensa_count_regs(const XtensaConfig *config,
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index 58ec3a08622..c1cbd03595e 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -192,11 +192,11 @@ static const struct SysemuCPUOps xtensa_sysemu_ops =
=3D
> {
>
>  static const struct TCGCPUOps xtensa_tcg_ops =3D {
>      .initialize =3D xtensa_translate_init,
> -    .cpu_exec_interrupt =3D xtensa_cpu_exec_interrupt,
>      .tlb_fill =3D xtensa_cpu_tlb_fill,
>      .debug_excp_handler =3D xtensa_breakpoint_handler,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D xtensa_cpu_exec_interrupt,
>      .do_interrupt =3D xtensa_cpu_do_interrupt,
>      .do_transaction_failed =3D xtensa_cpu_do_transaction_failed,
>      .do_unaligned_access =3D xtensa_cpu_do_unaligned_access,
> diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
> index 10e75ab070d..9bc7f50d355 100644
> --- a/target/xtensa/exc_helper.c
> +++ b/target/xtensa/exc_helper.c
> @@ -255,11 +255,6 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
>      }
>      check_interrupts(env);
>  }
> -#else
> -void xtensa_cpu_do_interrupt(CPUState *cs)
> -{
> -}
> -#endif
>
>  bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> @@ -270,3 +265,5 @@ bool xtensa_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      }
>      return false;
>  }
> +
> +#endif /* !CONFIG_USER_ONLY */
> --
> 2.31.1
>
>

--000000000000ada9bf05cb090178
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:19 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict cpu_exec_interrupt() and its callees to sysemu.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/xtensa/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0target/xtensa/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/xtensa/exc_helper.c | 7 ++-----<br>
=C2=A03 files changed, 5 insertions(+), 8 deletions(-)<br></blockquote><div=
><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-yj6qo=
 gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0p=
x 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h<br>
index 1e0cb1535ca..cbb720e7cca 100644<br>
--- a/target/xtensa/cpu.h<br>
+++ b/target/xtensa/cpu.h<br>
@@ -566,14 +566,14 @@ struct XtensaCPU {<br>
=C2=A0bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bool probe, uintptr_t retaddr);<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0void xtensa_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);=
<br>
-#ifndef CONFIG_USER_ONLY<br>
=C2=A0void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, =
vaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned =
size, MMUAccessType access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_i=
dx, MemTxAttrs attrs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemTxResu=
lt response, uintptr_t retaddr);<br>
-#endif /* !CONFIG_USER_ONLY */<br>
+#endif<br>
=C2=A0void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0void xtensa_count_regs(const XtensaConfig *config,<br>
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c<br>
index 58ec3a08622..c1cbd03595e 100644<br>
--- a/target/xtensa/cpu.c<br>
+++ b/target/xtensa/cpu.c<br>
@@ -192,11 +192,11 @@ static const struct SysemuCPUOps xtensa_sysemu_ops =
=3D {<br>
<br>
=C2=A0static const struct TCGCPUOps xtensa_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D xtensa_translate_init,<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D xtensa_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D xtensa_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.debug_excp_handler =3D xtensa_breakpoint_handler,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D xtensa_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D xtensa_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D xtensa_cpu_do_transaction_fa=
iled,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D xtensa_cpu_do_unaligned_access=
,<br>
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c<br>
index 10e75ab070d..9bc7f50d355 100644<br>
--- a/target/xtensa/exc_helper.c<br>
+++ b/target/xtensa/exc_helper.c<br>
@@ -255,11 +255,6 @@ void xtensa_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0check_interrupts(env);<br>
=C2=A0}<br>
-#else<br>
-void xtensa_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-}<br>
-#endif<br>
<br>
=C2=A0bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<b=
r>
=C2=A0{<br>
@@ -270,3 +265,5 @@ bool xtensa_cpu_exec_interrupt(CPUState *cs, int interr=
upt_request)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
+<br>
+#endif /* !CONFIG_USER_ONLY */<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000ada9bf05cb090178--

