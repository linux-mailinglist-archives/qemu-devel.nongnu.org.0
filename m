Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182A13FF502
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:35:55 +0200 (CEST)
Received: from localhost ([::1]:46360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtRC-0005a0-5U
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtHN-00059K-8x
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:25:45 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c]:35726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtHK-0006C6-5K
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:25:44 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id ay16so1065063vkb.2
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G5Tw6Gk7i8JA5HZbS8cdH0JDDZOlM1bogAqTxtfIK4Y=;
 b=MhxmKQW5ybCqzser/3X9RnZUY6n1iYqo2b7CCecrGeV+YTRuydoFJGw7MxoVxx+iLu
 /DOVaEO4XV1BF8t+c09cUUQ/xcl7tL5pkVKd50yRDfr0mRuI9YMWKHmSmbNFefYxn4VE
 xh+eaeZ9J2JMckbXLGsrCvz1SaA/xdo7GjqFPVHs9+dhnF8SA6JWslHmJ2YypptzmV0k
 KTX4hwEirfmPrhSkGNrPoV/puNhwsqHdOHygQLCJ0m+MbN7UGRjki0mruIjCUyjOEn1X
 mgHfdCeClCzz12R+u5fCDmycn0tBHB11WbkFTHZUoZfz+g04Cc1j7dO+eSz4UV7JwXYt
 hxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G5Tw6Gk7i8JA5HZbS8cdH0JDDZOlM1bogAqTxtfIK4Y=;
 b=DhzBRQLAtspFNODYOxcxBFS9CRwL62GWmwaFS3ed2/DAK1s0CVIFjXGt2AGOL0lxtt
 /EaID9IuWMAfH8ENxqwHo16ZXg3qgZ5uqnawoGI2yakSDKA3RbD+L822HXg2dFHOkJS4
 etb9RbP+JpmQDianRCL4rN3dX8M/3R6cIASYriECtU6yobxoqMMbJRF8f8o78ABP8BY5
 uFGzs6LUhJcfE3AsKXaFWS5A+enEyFYQu2bEseo6rh1TCMUVeWhQ17HBlAW66x4sSMjo
 tsxjxfGZa2MRayGc84pUVVRZYX8nEM6MNxbqjlTpvjT9lqN35thH+fYkMAZFceLWncO+
 3sWg==
X-Gm-Message-State: AOAM532d15G56TltG0QTVT7C9JhQKqqbPWS+bhIHhml+w3tSvzthFMdk
 3OS/BCAaFKHgcDWonmpftBmT4Jgt4x8Ybqhom6JYvg==
X-Google-Smtp-Source: ABdhPJw3aEH0oPWyD6d7PnrzhV2f1+rPSzNF37WgWXlBW5aXFO63uBkZi63shXUk+mWYlxaJLLSR9if6ohCwHHRyEQU=
X-Received: by 2002:a1f:1bcf:: with SMTP id b198mr3560069vkb.25.1630614341079; 
 Thu, 02 Sep 2021 13:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-19-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-19-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:25:30 -0600
Message-ID: <CANCZdfqhPjik8zGSkjfGZdHvHW-KMHoXoNNFvWj2285bMdr6tA@mail.gmail.com>
Subject: Re: [PATCH 18/24] target/riscv: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000090e20d05cb08fc60"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2c.google.com
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

--00000000000090e20d05cb08fc60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:18 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/riscv/cpu.h        | 2 +-
>  target/riscv/cpu.c        | 2 +-
>  target/riscv/cpu_helper.c | 5 -----
>  3 files changed, 2 insertions(+), 7 deletions(-)
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf1c899c00b..e735e53e26c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -334,7 +334,6 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction
> f, CPUState *cs,
>                                 int cpuid, void *opaque);
>  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> -bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  bool riscv_cpu_virt_enabled(CPURISCVState *env);
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
> @@ -362,6 +361,7 @@ void riscv_cpu_list(void);
>  #define cpu_mmu_index riscv_cpu_mmu_index
>
>  #ifndef CONFIG_USER_ONLY
> +bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
>  uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t
> value);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1a2b03d579c..13575c14085 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -644,10 +644,10 @@ static const struct SysemuCPUOps riscv_sysemu_ops =
=3D {
>  static const struct TCGCPUOps riscv_tcg_ops =3D {
>      .initialize =3D riscv_translate_init,
>      .synchronize_from_tb =3D riscv_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,
>      .tlb_fill =3D riscv_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,
>      .do_interrupt =3D riscv_cpu_do_interrupt,
>      .do_transaction_failed =3D riscv_cpu_do_transaction_failed,
>      .do_unaligned_access =3D riscv_cpu_do_unaligned_access,
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 968cb8046f4..701858d670c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -75,11 +75,9 @@ static int riscv_cpu_local_irq_pending(CPURISCVState
> *env)
>          return RISCV_EXCP_NONE; /* indicates no pending interrupt */
>      }
>  }
> -#endif
>
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> -#if !defined(CONFIG_USER_ONLY)
>      if (interrupt_request & CPU_INTERRUPT_HARD) {
>          RISCVCPU *cpu =3D RISCV_CPU(cs);
>          CPURISCVState *env =3D &cpu->env;
> @@ -90,12 +88,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>              return true;
>          }
>      }
> -#endif
>      return false;
>  }
>
> -#if !defined(CONFIG_USER_ONLY)
> -
>  /* Return true is floating point support is currently enabled */
>  bool riscv_cpu_fp_enabled(CPURISCVState *env)
>  {
> --
> 2.31.1
>
>

--00000000000090e20d05cb08fc60
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
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0target/riscv/cpu_helper.c | 5 -----<br>
=C2=A03 files changed, 2 insertions(+), 7 deletions(-)<br>
<br></blockquote><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail=
-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:=
2px 0px 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index bf1c899c00b..e735e53e26c 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -334,7 +334,6 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f,=
 CPUState *cs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int cpuid, void *opaque);<br>
=C2=A0int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int r=
eg);<br>
=C2=A0int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg=
);<br>
-bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);<br>
=C2=A0bool riscv_cpu_fp_enabled(CPURISCVState *env);<br>
=C2=A0bool riscv_cpu_virt_enabled(CPURISCVState *env);<br>
=C2=A0void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);<br>
@@ -362,6 +361,7 @@ void riscv_cpu_list(void);<br>
=C2=A0#define cpu_mmu_index riscv_cpu_mmu_index<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);<br>
=C2=A0void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);<br>
=C2=A0int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);<b=
r>
=C2=A0uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t =
value);<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 1a2b03d579c..13575c14085 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -644,10 +644,10 @@ static const struct SysemuCPUOps riscv_sysemu_ops =3D=
 {<br>
=C2=A0static const struct TCGCPUOps riscv_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D riscv_translate_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D riscv_cpu_synchronize_from_tb,=
<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D riscv_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D riscv_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D riscv_cpu_do_transaction_fai=
led,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D riscv_cpu_do_unaligned_access,=
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 968cb8046f4..701858d670c 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -75,11 +75,9 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *en=
v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE; /* indicates no p=
ending interrupt */<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
-#endif<br>
<br>
=C2=A0bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request)<br=
>
=C2=A0{<br>
-#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0if (interrupt_request &amp; CPU_INTERRUPT_HARD) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<=
br>
@@ -90,12 +88,9 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrup=
t_request)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
<br>
-#if !defined(CONFIG_USER_ONLY)<br>
-<br>
=C2=A0/* Return true is floating point support is currently enabled */<br>
=C2=A0bool riscv_cpu_fp_enabled(CPURISCVState *env)<br>
=C2=A0{<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--00000000000090e20d05cb08fc60--

