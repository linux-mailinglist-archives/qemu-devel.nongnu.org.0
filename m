Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C52B3FF4FE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:35:13 +0200 (CEST)
Received: from localhost ([::1]:44728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtQW-0004Q0-AS
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtIG-0006Wj-Sg
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:26:41 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:38884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtID-000701-VH
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:26:40 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id a25so2629001vso.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cATzV+cgXA9fNf6+6osb5t9LIw0lqjY+rzeij2NRDf0=;
 b=DRVhSzZsPNOUVAwAQdU3ZfJkRqxYT5ooUQ0xzAZbyEd5BK+RK8v4wCu1oazuQetzeR
 xCsnZ3/Tn/Q1qs6Y6RjEN2j+Inu7kXf5lvv3ecHK3eluC3dclp8eTrdoWZUD1ZZ5HY3q
 mgLX0DoKZIp6IaFpDB2MuNMeVpUBIYPQseC7MZpACC/GQO7xt/SyPOAkBlcD5Y1dkfDS
 sMLRJes9UD7G88UbrMPPUp+h2GNHDHARzwGxHboygmkVk34LRMsZhM33VWYmiKT9rJgB
 Fe0R3FCb71AJcJZyu90zwFG+cCNzsRKj9/dMNgORreiL6Ske6HZOfYtqG/K0kFnvkzq/
 bp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cATzV+cgXA9fNf6+6osb5t9LIw0lqjY+rzeij2NRDf0=;
 b=ZpekGeI/ryQIgSuOHveoV14QXLH1ACpkrlH+lf5gzDnFu+wzwhlvrbn+17Y5TxPF/A
 YnQFfZ7aWxwC9nHyTe3RKz+Aa94yLVAraPQNqTFeOW+ZXCo6DtfkvqVLRocEBlVTIV6n
 eeVtAHiSgNIAvJOXlMEGp9aX+HyrEwC2P2LRrjGPrSiwiVtZUnSkVbsfPYkKzfpN67sb
 zjhsLRap+3IpRy3mBE9HkcjMbZK32O7WO9cGQu52hURAhjXHT6RkKkwJPU6Bl88o/zoH
 9jVJ5OoOCAOTsiocJTk6uvwLUpvrwqPqHldPpjIjVXzx7N107AnLF1N53s0Tat+pRmNN
 Cpfg==
X-Gm-Message-State: AOAM530/+RCdrqotYHIbKCiHO/2CPGllIqB4ZzNiDlgy/5wfn5tEoKP2
 eOBhVSj2tNYmkAtaM/Gyz2SIaK68zSQPA/PJbf074Qtm49i5yij9
X-Google-Smtp-Source: ABdhPJzCQnrZJVyyLjW6ViZm56nxlRoiIb9JOyCCs4FBdQe8rdlDPfVruz1UYu6Sr4ILLM1CDWpjyMkVVqOuUH+hdpo=
X-Received: by 2002:a67:2dc6:: with SMTP id t189mr3914121vst.49.1630614396994; 
 Thu, 02 Sep 2021 13:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-22-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-22-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:26:26 -0600
Message-ID: <CANCZdfqpxrTgYz5Ff5TshQ9ro6486XX4M0EL=RSHrUQyHpGd1A@mail.gmail.com>
Subject: Re: [PATCH 21/24] target/rx: Restrict cpu_exec_interrupt() handler to
 sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000e61b4605cb08ff52"
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

--000000000000e61b4605cb08ff52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:19 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/rx/cpu.h    | 2 ++
>  target/rx/cpu.c    | 2 +-
>  target/rx/helper.c | 4 ++++
>  3 files changed, 7 insertions(+), 1 deletion(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> index 0b4b998c7be..faa3606f52f 100644
> --- a/target/rx/cpu.h
> +++ b/target/rx/cpu.h
> @@ -124,8 +124,10 @@ typedef RXCPU ArchCPU;
>  #define CPU_RESOLVING_TYPE TYPE_RX_CPU
>
>  const char *rx_crname(uint8_t cr);
> +#ifndef CONFIG_USER_ONLY
>  void rx_cpu_do_interrupt(CPUState *cpu);
>  bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +#endif /* !CONFIG_USER_ONLY */
>  void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 96cc96e514f..25a4aa2976d 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -186,10 +186,10 @@ static const struct SysemuCPUOps rx_sysemu_ops =3D =
{
>  static const struct TCGCPUOps rx_tcg_ops =3D {
>      .initialize =3D rx_translate_init,
>      .synchronize_from_tb =3D rx_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D rx_cpu_exec_interrupt,
>      .tlb_fill =3D rx_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D rx_cpu_exec_interrupt,
>      .do_interrupt =3D rx_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/rx/helper.c b/target/rx/helper.c
> index db6b07e3890..f34945e7e2c 100644
> --- a/target/rx/helper.c
> +++ b/target/rx/helper.c
> @@ -40,6 +40,8 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw,
> int rte)
>      env->psw_c =3D FIELD_EX32(psw, PSW, C);
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +
>  #define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)
>  void rx_cpu_do_interrupt(CPUState *cs)
>  {
> @@ -142,6 +144,8 @@ bool rx_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      return false;
>  }
>
> +#endif /* !CONFIG_USER_ONLY */
> +
>  hwaddr rx_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>  {
>      return addr;
> --
> 2.31.1
>
>

--000000000000e61b4605cb08ff52
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
=C2=A0target/rx/cpu.h=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0target/rx/cpu.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/rx/helper.c | 4 ++++<br>
=C2=A03 files changed, 7 insertions(+), 1 deletion(-)<br></blockquote><div>=
<br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.co=
m" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-yj6qo =
gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2px 0px=
 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/rx/cpu.h b/target/rx/cpu.h<br>
index 0b4b998c7be..faa3606f52f 100644<br>
--- a/target/rx/cpu.h<br>
+++ b/target/rx/cpu.h<br>
@@ -124,8 +124,10 @@ typedef RXCPU ArchCPU;<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_RX_CPU<br>
<br>
=C2=A0const char *rx_crname(uint8_t cr);<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0void rx_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;<br>
=C2=A0int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);<=
br>
diff --git a/target/rx/cpu.c b/target/rx/cpu.c<br>
index 96cc96e514f..25a4aa2976d 100644<br>
--- a/target/rx/cpu.c<br>
+++ b/target/rx/cpu.c<br>
@@ -186,10 +186,10 @@ static const struct SysemuCPUOps rx_sysemu_ops =3D {<=
br>
=C2=A0static const struct TCGCPUOps rx_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D rx_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D rx_cpu_synchronize_from_tb,<br=
>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D rx_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D rx_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D rx_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D rx_cpu_do_interrupt,<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
diff --git a/target/rx/helper.c b/target/rx/helper.c<br>
index db6b07e3890..f34945e7e2c 100644<br>
--- a/target/rx/helper.c<br>
+++ b/target/rx/helper.c<br>
@@ -40,6 +40,8 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int=
 rte)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;psw_c =3D FIELD_EX32(psw, PSW, C);<br>
=C2=A0}<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
+<br>
=C2=A0#define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)<br>
=C2=A0void rx_cpu_do_interrupt(CPUState *cs)<br>
=C2=A0{<br>
@@ -142,6 +144,8 @@ bool rx_cpu_exec_interrupt(CPUState *cs, int interrupt_=
request)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
+#endif /* !CONFIG_USER_ONLY */<br>
+<br>
=C2=A0hwaddr rx_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return addr;<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000e61b4605cb08ff52--

