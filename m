Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0D3FF4C1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:18:28 +0200 (CEST)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtAJ-0005xN-Bf
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt8F-0002te-H7
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:16:19 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:38828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLt8C-0006gv-6o
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:16:19 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id a25so2606679vso.5
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zT2c+1E62cjQEi2kiCLiim1kp9aQQG9tokwDG6Y3pNg=;
 b=Xgj2sBXu3i6bStX7urBDIHPF46qb2zi4OiBCj6DT686why3aWwbs8k6u90kvWcPu0s
 3A2vOuexaFQi2EevSzukNpRqNWyz/lPxza+Lj3R05dOrkeKQxcPnBJNz58yx0YSQDlVk
 4rxg2dI9xIWG/5rWZF9DccZHU/qEZJKiLKGazR3zyRsN/cD+HQigOd9GcKPM90aTsLx0
 s3SAcjNhQKKk+UAxlen+fW1RPYCYCAxsIFF77EJSe9nr0o3NtE4HnUY21zk9yLIVIw5r
 +Xul6lPpFSMHV+fhJJhp0J9xHfTGpo31few11iKKjDNVdQPM4b56OcgOmKHSLBQyhPzc
 WwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zT2c+1E62cjQEi2kiCLiim1kp9aQQG9tokwDG6Y3pNg=;
 b=ME+4Lz9eXboap/pUmT3tjYZcne3yLXYNcqg+PizPIJca1KYK92QenqRbITN3An6SK5
 Nfo7XF4xa9rRJLgXlCCWTmnonweqb6tuxElD4eDXv2ExEMzXlojh3qb3ARkz79ASFGWc
 T6UfVPkCRMn+2P8b0tMPwZhr6BgmGmCJwuxvZ5a8szOo/W1PlhruIF4CHgNO8JFp6mtq
 tU12uM5JINvQTA+N6qxPYVSeTOwlVT5AC9ZaEjp/hH5ufpADYTjC5NKu+pG9x0qp/yV6
 b5VEdwuDyiiZoBIJGMsZQApWhaZ9iqOafFqu/QgNdkF2zc/7AB+EUcuOPvYZA6yQSDFo
 1+mg==
X-Gm-Message-State: AOAM5310nVzSOifaf9zmvWZKKsly7Vteq2kHTd3qVzPKkIY4qIxejOcY
 NeDU23LCL9AbrxTiHBhobZMWGJua9szeEvkLQp94RA==
X-Google-Smtp-Source: ABdhPJySLqKUvFQ4hGNx3XkylZn/cqi61Dc7gj6WuzjH6ru2Xr3bE/rhC+fe/5z45nYT5KJLSBmCOhUskDD1EWlqUvc=
X-Received: by 2002:a67:c789:: with SMTP id t9mr4324246vsk.60.1630613775240;
 Thu, 02 Sep 2021 13:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-8-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-8-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:16:04 -0600
Message-ID: <CANCZdfpdN6O6QyM_nQewz1+ugjjHOL38QD01B2dDZnw=zcTQOw@mail.gmail.com>
Subject: Re: [PATCH 07/24] target/arm: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000d6e2f405cb08dab2"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2c.google.com
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

--000000000000d6e2f405cb08dab2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:17 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/arm/cpu.h     | 3 +--
>  target/arm/cpu.c     | 7 +++++--
>  target/arm/cpu_tcg.c | 6 +++---
>  3 files changed, 9 insertions(+), 7 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 6a987f65e41..cfd755cff99 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1040,11 +1040,10 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t
> clustersz);
>
>  #ifndef CONFIG_USER_ONLY
>  extern const VMStateDescription vmstate_arm_cpu;
> -#endif
>
>  void arm_cpu_do_interrupt(CPUState *cpu);
>  void arm_v7m_cpu_do_interrupt(CPUState *cpu);
> -bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
> +#endif /* !CONFIG_USER_ONLY */
>
>  hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
>                                           MemTxAttrs *attrs);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d631c4683c4..ba0741b20e4 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -440,6 +440,8 @@ static void arm_cpu_reset(DeviceState *dev)
>      arm_rebuild_hflags(env);
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +
>  static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx=
,
>                                       unsigned int target_el,
>                                       unsigned int cur_el, bool secure,
> @@ -556,7 +558,7 @@ static inline bool arm_excp_unmasked(CPUState *cs,
> unsigned int excp_idx,
>      return unmasked || pstate_unmasked;
>  }
>
> -bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> +static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      CPUClass *cc =3D CPU_GET_CLASS(cs);
>      CPUARMState *env =3D cs->env_ptr;
> @@ -608,6 +610,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      cc->tcg_ops->do_interrupt(cs);
>      return true;
>  }
> +#endif /* !CONFIG_USER_ONLY */
>
>  void arm_cpu_update_virq(ARMCPU *cpu)
>  {
> @@ -2010,11 +2013,11 @@ static const struct SysemuCPUOps arm_sysemu_ops =
=3D {
>  static const struct TCGCPUOps arm_tcg_ops =3D {
>      .initialize =3D arm_translate_init,
>      .synchronize_from_tb =3D arm_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D arm_cpu_exec_interrupt,
>      .tlb_fill =3D arm_cpu_tlb_fill,
>      .debug_excp_handler =3D arm_debug_excp_handler,
>
>  #if !defined(CONFIG_USER_ONLY)
> +    .cpu_exec_interrupt =3D arm_cpu_exec_interrupt,
>      .do_interrupt =3D arm_cpu_do_interrupt,
>      .do_transaction_failed =3D arm_cpu_do_transaction_failed,
>      .do_unaligned_access =3D arm_cpu_do_unaligned_access,
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 33cc75af57d..0d5adccf1a7 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -22,7 +22,7 @@
>  /* CPU models. These are not needed for the AArch64 linux-user build. */
>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>
> -#ifdef CONFIG_TCG
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>  static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>  {
>      CPUClass *cc =3D CPU_GET_CLASS(cs);
> @@ -46,7 +46,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, in=
t
> interrupt_request)
>      }
>      return ret;
>  }
> -#endif /* CONFIG_TCG */
> +#endif /* !CONFIG_USER_ONLY && CONFIG_TCG */
>
>  static void arm926_initfn(Object *obj)
>  {
> @@ -898,11 +898,11 @@ static void pxa270c5_initfn(Object *obj)
>  static const struct TCGCPUOps arm_v7m_tcg_ops =3D {
>      .initialize =3D arm_translate_init,
>      .synchronize_from_tb =3D arm_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt,
>      .tlb_fill =3D arm_cpu_tlb_fill,
>      .debug_excp_handler =3D arm_debug_excp_handler,
>
>  #if !defined(CONFIG_USER_ONLY)
> +    .cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt,
>      .do_interrupt =3D arm_v7m_cpu_do_interrupt,
>      .do_transaction_failed =3D arm_cpu_do_transaction_failed,
>      .do_unaligned_access =3D arm_cpu_do_unaligned_access,
> --
> 2.31.1
>
>

--000000000000d6e2f405cb08dab2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 9:17 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict cpu_exec_interrupt() and its callees to sysemu.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/arm/cpu.h=C2=A0 =C2=A0 =C2=A0| 3 +--<br>
=C2=A0target/arm/cpu.c=C2=A0 =C2=A0 =C2=A0| 7 +++++--<br>
=C2=A0target/arm/cpu_tcg.c | 6 +++---<br>
=C2=A03 files changed, 9 insertions(+), 7 deletions(-)<br></blockquote><div=
><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail-=
yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:2=
px 0px 0px"><br></div></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
diff --git a/target/arm/cpu.h b/target/arm/cpu.h<br>
index 6a987f65e41..cfd755cff99 100644<br>
--- a/target/arm/cpu.h<br>
+++ b/target/arm/cpu.h<br>
@@ -1040,11 +1040,10 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clust=
ersz);<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0extern const VMStateDescription vmstate_arm_cpu;<br>
-#endif<br>
<br>
=C2=A0void arm_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0void arm_v7m_cpu_do_interrupt(CPUState *cpu);<br>
-bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);<br>
+#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 M=
emTxAttrs *attrs);<br>
diff --git a/target/arm/cpu.c b/target/arm/cpu.c<br>
index d631c4683c4..ba0741b20e4 100644<br>
--- a/target/arm/cpu.c<br>
+++ b/target/arm/cpu.c<br>
@@ -440,6 +440,8 @@ static void arm_cpu_reset(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0arm_rebuild_hflags(env);<br>
=C2=A0}<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
+<br>
=C2=A0static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_=
idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int ta=
rget_el,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int cu=
r_el, bool secure,<br>
@@ -556,7 +558,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsi=
gned int excp_idx,<br>
=C2=A0 =C2=A0 =C2=A0return unmasked || pstate_unmasked;<br>
=C2=A0}<br>
<br>
-bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
+static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUClass *cc =3D CPU_GET_CLASS(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPUARMState *env =3D cs-&gt;env_ptr;<br>
@@ -608,6 +610,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt=
_request)<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;tcg_ops-&gt;do_interrupt(cs);<br>
=C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0}<br>
+#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0void arm_cpu_update_virq(ARMCPU *cpu)<br>
=C2=A0{<br>
@@ -2010,11 +2013,11 @@ static const struct SysemuCPUOps arm_sysemu_ops =3D=
 {<br>
=C2=A0static const struct TCGCPUOps arm_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D arm_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D arm_cpu_synchronize_from_tb,<b=
r>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D arm_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D arm_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.debug_excp_handler =3D arm_debug_excp_handler,<br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D arm_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D arm_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D arm_cpu_do_transaction_faile=
d,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D arm_cpu_do_unaligned_access,<b=
r>
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c<br>
index 33cc75af57d..0d5adccf1a7 100644<br>
--- a/target/arm/cpu_tcg.c<br>
+++ b/target/arm/cpu_tcg.c<br>
@@ -22,7 +22,7 @@<br>
=C2=A0/* CPU models. These are not needed for the AArch64 linux-user build.=
 */<br>
=C2=A0#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)<br>
<br>
-#ifdef CONFIG_TCG<br>
+#if !defined(CONFIG_USER_ONLY) &amp;&amp; defined(CONFIG_TCG)<br>
=C2=A0static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_re=
quest)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUClass *cc =3D CPU_GET_CLASS(cs);<br>
@@ -46,7 +46,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int =
interrupt_request)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
-#endif /* CONFIG_TCG */<br>
+#endif /* !CONFIG_USER_ONLY &amp;&amp; CONFIG_TCG */<br>
<br>
=C2=A0static void arm926_initfn(Object *obj)<br>
=C2=A0{<br>
@@ -898,11 +898,11 @@ static void pxa270c5_initfn(Object *obj)<br>
=C2=A0static const struct TCGCPUOps arm_v7m_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D arm_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D arm_cpu_synchronize_from_tb,<b=
r>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D arm_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.debug_excp_handler =3D arm_debug_excp_handler,<br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D arm_v7m_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D arm_cpu_do_transaction_faile=
d,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D arm_cpu_do_unaligned_access,<b=
r>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000d6e2f405cb08dab2--

