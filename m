Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862B33FF4E3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:26:58 +0200 (CEST)
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtIX-0004Vx-KZ
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtCm-0003w6-AN
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:21:00 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:45960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtCi-0001xa-Hn
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:21:00 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id a21so2611386vsp.12
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xgcf6EoLNCllzQwVHSXeXQuNAqjcojElSkTiwngEz2k=;
 b=l1Tw93qK764wBB+Ug6JSI7N6mH63E+IKBgW2qDK3daaM12bMYFoL6heRZDpYQV+6+d
 naScfbKvM48hp9+S+TEZW4FserN3zwD2U2uHDInJyOl9UX0rXGms8NdpwfaI7ZmhXiKg
 qsv1uvfTUL4nEqW9FnAoyl26M+mQpBI1A/cUWXBhvpIOEc/6NWgXeZPbXGLf+vZGhx7F
 O3ZU9/QX5zsk3A+pGb7aTNtAAdd/HGgmfbwtyRa8p2/qW7EpxMdvFS35CTSpXIr4OtvC
 fkNhU6k2mNITX+KppkR5x7v3ukclM5s0AKGWJSWNu96SW44Ll/7CFDIcBC72M47VERSn
 XBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xgcf6EoLNCllzQwVHSXeXQuNAqjcojElSkTiwngEz2k=;
 b=tnoP1QCmqueY1aY4OV5C2aJaOOmbFpn9XRotb41P0gNtwfoWRyuM98DegrvlpBLXlS
 ytl+64c0iUS7Y1IhukQSnWVIYtxgTj55BNHgM+s197ycxvpfiRiZde3lHxQ3QTv0GhAC
 3byjWx4MW/BBqWwyL9VnSE4kypA7gBTY26+cV4dNVaa8ntKhD6JrTTRYuuUwblRSoLJs
 rbXbY41zAecNI9ZFlpgZyI2OMgEJ0oLtEiwnRxZ9r/xkzuLO68K9sDeRI849cyhOVmS6
 GcZcRmmzddftPuNtkZC0DNDI37sGotY6NX6n5XpRrMqzuaCX3Ee2XzVzmIc4GrfJoiM9
 5vpw==
X-Gm-Message-State: AOAM53204Or5RseYRzcTLyM6B7sWiq0T9SsvFc8fhaUTBb9/XLCcjfax
 lO6a9+iKWcPvyA2EeQX+BBFDn8M07HjNNOG4tUtOVQ==
X-Google-Smtp-Source: ABdhPJw92HaXkBXnnVRNEmBrLgD8kacd/9+fHyyZJMEXciftDjTP3tvSjit4R1i3Qx2ZztImUpAR8W5Hy6QOtuSvaBI=
X-Received: by 2002:a67:c789:: with SMTP id t9mr4342239vsk.60.1630614051676;
 Thu, 02 Sep 2021 13:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-14-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-14-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:20:40 -0600
Message-ID: <CANCZdfqyFmNCKBhPtJc_QHwz9VRVWpY0_n-DKobQBFoSti4m=g@mail.gmail.com>
Subject: Re: [PATCH 13/24] target/microblaze: Restrict cpu_exec_interrupt()
 handler to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000050f55105cb08eb91"
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

--00000000000050f55105cb08eb91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/microblaze/cpu.h    |  2 ++
>  target/microblaze/cpu.c    |  2 +-
>  target/microblaze/helper.c | 13 ++-----------
>  3 files changed, 5 insertions(+), 12 deletions(-)
>
>
Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index e4bba8a7551..40401c33b72 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -355,8 +355,10 @@ struct MicroBlazeCPU {
>  };
>
>
> +#ifndef CONFIG_USER_ONLY
>  void mb_cpu_do_interrupt(CPUState *cs);
>  bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
> +#endif /* !CONFIG_USER_ONLY */
>  void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>                                  MMUAccessType access_type,
>                                  int mmu_idx, uintptr_t retaddr);
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 72d8f2a0daa..15db277925f 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -365,10 +365,10 @@ static const struct SysemuCPUOps mb_sysemu_ops =3D =
{
>  static const struct TCGCPUOps mb_tcg_ops =3D {
>      .initialize =3D mb_tcg_init,
>      .synchronize_from_tb =3D mb_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D mb_cpu_exec_interrupt,
>      .tlb_fill =3D mb_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D mb_cpu_exec_interrupt,
>      .do_interrupt =3D mb_cpu_do_interrupt,
>      .do_transaction_failed =3D mb_cpu_transaction_failed,
>      .do_unaligned_access =3D mb_cpu_do_unaligned_access,
> diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
> index 20dbd673136..dd2aecd1d58 100644
> --- a/target/microblaze/helper.c
> +++ b/target/microblaze/helper.c
> @@ -26,16 +26,6 @@
>
>  #if defined(CONFIG_USER_ONLY)
>
> -void mb_cpu_do_interrupt(CPUState *cs)
> -{
> -    MicroBlazeCPU *cpu =3D MICROBLAZE_CPU(cs);
> -    CPUMBState *env =3D &cpu->env;
> -
> -    cs->exception_index =3D -1;
> -    env->res_addr =3D RES_ADDR_NONE;
> -    env->regs[14] =3D env->pc;
> -}
> -
>  bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                       MMUAccessType access_type, int mmu_idx,
>                       bool probe, uintptr_t retaddr)
> @@ -271,7 +261,6 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs,
> vaddr addr,
>
>      return paddr;
>  }
> -#endif
>
>  bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> @@ -289,6 +278,8 @@ bool mb_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      return false;
>  }
>
> +#endif /* !CONFIG_USER_ONLY */
> +
>  void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                  MMUAccessType access_type,
>                                  int mmu_idx, uintptr_t retaddr)
> --
> 2.31.1
>
>

--00000000000050f55105cb08eb91
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
=C2=A0target/microblaze/cpu.h=C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/microblaze/cpu.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0target/microblaze/helper.c | 13 ++-----------<br>
=C2=A03 files changed, 5 insertions(+), 12 deletions(-)<br>
<br></blockquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=
=3D"mailto:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><d=
iv class=3D"gmail-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;w=
idth:22px;margin:2px 0px 0px"><br class=3D"gmail-Apple-interchange-newline"=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h<br>
index e4bba8a7551..40401c33b72 100644<br>
--- a/target/microblaze/cpu.h<br>
+++ b/target/microblaze/cpu.h<br>
@@ -355,8 +355,10 @@ struct MicroBlazeCPU {<br>
=C2=A0};<br>
<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0void mb_cpu_do_interrupt(CPUState *cs);<br>
=C2=A0bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);<br>
+#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_idx, uintptr_t retaddr=
);<br>
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c<br>
index 72d8f2a0daa..15db277925f 100644<br>
--- a/target/microblaze/cpu.c<br>
+++ b/target/microblaze/cpu.c<br>
@@ -365,10 +365,10 @@ static const struct SysemuCPUOps mb_sysemu_ops =3D {<=
br>
=C2=A0static const struct TCGCPUOps mb_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D mb_tcg_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D mb_cpu_synchronize_from_tb,<br=
>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D mb_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D mb_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D mb_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D mb_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D mb_cpu_transaction_failed,<b=
r>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D mb_cpu_do_unaligned_access,<br=
>
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c<br>
index 20dbd673136..dd2aecd1d58 100644<br>
--- a/target/microblaze/helper.c<br>
+++ b/target/microblaze/helper.c<br>
@@ -26,16 +26,6 @@<br>
<br>
=C2=A0#if defined(CONFIG_USER_ONLY)<br>
<br>
-void mb_cpu_do_interrupt(CPUState *cs)<br>
-{<br>
-=C2=A0 =C2=A0 MicroBlazeCPU *cpu =3D MICROBLAZE_CPU(cs);<br>
-=C2=A0 =C2=A0 CPUMBState *env =3D &amp;cpu-&gt;env;<br>
-<br>
-=C2=A0 =C2=A0 cs-&gt;exception_index =3D -1;<br>
-=C2=A0 =C2=A0 env-&gt;res_addr =3D RES_ADDR_NONE;<br>
-=C2=A0 =C2=A0 env-&gt;regs[14] =3D env-&gt;pc;<br>
-}<br>
-<br>
=C2=A0bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bool probe, uintptr_t retaddr)<br>
@@ -271,7 +261,6 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs, v=
addr addr,<br>
<br>
=C2=A0 =C2=A0 =C2=A0return paddr;<br>
=C2=A0}<br>
-#endif<br>
<br>
=C2=A0bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br>
=C2=A0{<br>
@@ -289,6 +278,8 @@ bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_=
request)<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
+#endif /* !CONFIG_USER_ONLY */<br>
+<br>
=C2=A0void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_idx, uintptr_t retaddr=
)<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000050f55105cb08eb91--

