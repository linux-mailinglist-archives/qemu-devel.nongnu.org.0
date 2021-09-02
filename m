Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501413FF4F7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 22:33:14 +0200 (CEST)
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLtOb-0001K6-Ct
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 16:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtI2-0005yk-Hg
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:26:26 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:39894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mLtHx-0006jT-Pz
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 16:26:26 -0400
Received: by mail-vk1-xa32.google.com with SMTP id d7so1061876vko.6
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 13:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=751TEEkaP5uNR4ViwAskIKR6oYmccFDD9SSpFku46JY=;
 b=LL/xHBPpOMYAlslk/XJHzZPbFrTpYJmk5+3oYZaSKmJ/axYdcouvMsB7jBo8wPntwX
 wCp4xZrXXjziaYJDTyZqp8efSJd9LeXmyPxMigTmG8NA+swNiCMFq07LpkD21cubyb0S
 xxR4gMNhsa8vdmLag9u4ZA9caD4jIrFPkhS93nZFkEZXWVykttfvsE0nNHx7PjItmwCy
 UJm0bXM+lf0KSmbL7KqlqbHtsQF34yqk0orEGvd28TaDl7kr85lytuYGHM216dEXgFeI
 HmoD6qC4z++Wtw7J8hCzq/ZAoL8yDGopimRaQr3SF7UxQGhVV4KLIl6TROMj5JmJfiqE
 ImsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=751TEEkaP5uNR4ViwAskIKR6oYmccFDD9SSpFku46JY=;
 b=gCQLWcztrQZ2psvlk5Z6dJr+Hslb0CC0YVmTlGi0m7SOUo7p20yaFVwvBhc2KL+Qe8
 uVaXrqgIGZ1VFuYTehp5CzleQL8ar+j7feusQs23JrNF7rC1FcpaMFo1CA1Stql8G5wz
 1SKoBL+ruvww1n19/tUm8xghHCDQPX4AT2fMBgkX/oDHAn6PO3uRXu11aSyjZu+H/o9z
 cPyn7qz25r0/S7Dho39B1x2F31ZbbWUfaFgmLg6lmGeKUfTkZa2WcFhJhN6yDZzPVAcJ
 H4tTzv9pUHLQ3MxB677k5ivdRaDFUrc3XpwatN4R9a1EK6MkhrbuBVr/kTxsBh8fRXFB
 5ECA==
X-Gm-Message-State: AOAM5315A6FXAFsFTrkPHBbxN6O7yvgCIz+hq0mTzS6TJxjPOkYepLYB
 /wxKpAfbDqLvctZdf2WU1YNcGAUtypy/hAhSQHgFNg==
X-Google-Smtp-Source: ABdhPJyk25+SRbkYekQDQJ+bvDq7iKExibiCGmG8lotCUoVOP1baVwgB8TmVGfmMZoT9mVGrkpJukeB9nO4/82DQEpg=
X-Received: by 2002:a1f:46c4:: with SMTP id t187mr4410vka.10.1630614380291;
 Thu, 02 Sep 2021 13:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-21-f4bug@amsat.org>
In-Reply-To: <20210902151715.383678-21-f4bug@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 2 Sep 2021 14:26:09 -0600
Message-ID: <CANCZdfpVhT2XmrRiqe+UJN7CG1R-6tt=r-wu4PFtkojgLEZWbQ@mail.gmail.com>
Subject: Re: [PATCH 20/24] target/sparc: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000e73e7f05cb08fe46"
Received-SPF: none client-ip=2607:f8b0:4864:20::a32;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

--000000000000e73e7f05cb08fe46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 2, 2021 at 9:19 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/sparc/cpu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index da6b30ec747..5a8a4ce7506 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -77,6 +77,7 @@ static void sparc_cpu_reset(DeviceState *dev)
>      env->cache_control =3D 0;
>  }
>
> +#ifndef CONFIG_USER_ONLY
>  static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request=
)
>  {
>      if (interrupt_request & CPU_INTERRUPT_HARD) {
> @@ -96,6 +97,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>      }
>      return false;
>  }
> +#endif /* !CONFIG_USER_ONLY */
>
>  static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info
> *info)
>  {
> @@ -863,10 +865,10 @@ static const struct SysemuCPUOps sparc_sysemu_ops =
=3D {
>  static const struct TCGCPUOps sparc_tcg_ops =3D {
>      .initialize =3D sparc_tcg_init,
>      .synchronize_from_tb =3D sparc_cpu_synchronize_from_tb,
> -    .cpu_exec_interrupt =3D sparc_cpu_exec_interrupt,
>      .tlb_fill =3D sparc_cpu_tlb_fill,
>
>  #ifndef CONFIG_USER_ONLY
> +    .cpu_exec_interrupt =3D sparc_cpu_exec_interrupt,
>      .do_interrupt =3D sparc_cpu_do_interrupt,
>      .do_transaction_failed =3D sparc_cpu_do_transaction_failed,
>      .do_unaligned_access =3D sparc_cpu_do_unaligned_access,
> --
> 2.31.1
>
>

--000000000000e73e7f05cb08fe46
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
=C2=A0target/sparc/cpu.c | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br></blockquote><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;</div><div class=3D"gmail=
-yj6qo gmail-ajU" style=3D"outline:none;padding:10px 0px;width:22px;margin:=
2px 0px 0px"><br class=3D"gmail-Apple-interchange-newline"></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c<br>
index da6b30ec747..5a8a4ce7506 100644<br>
--- a/target/sparc/cpu.c<br>
+++ b/target/sparc/cpu.c<br>
@@ -77,6 +77,7 @@ static void sparc_cpu_reset(DeviceState *dev)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;cache_control =3D 0;<br>
=C2=A0}<br>
<br>
+#ifndef CONFIG_USER_ONLY<br>
=C2=A0static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_requ=
est)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (interrupt_request &amp; CPU_INTERRUPT_HARD) {<br>
@@ -96,6 +97,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int in=
terrupt_request)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0}<br>
+#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info =
*info)<br>
=C2=A0{<br>
@@ -863,10 +865,10 @@ static const struct SysemuCPUOps sparc_sysemu_ops =3D=
 {<br>
=C2=A0static const struct TCGCPUOps sparc_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D sparc_tcg_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D sparc_cpu_synchronize_from_tb,=
<br>
-=C2=A0 =C2=A0 .cpu_exec_interrupt =3D sparc_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D sparc_cpu_tlb_fill,<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 .cpu_exec_interrupt =3D sparc_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D sparc_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D sparc_cpu_do_transaction_fai=
led,<br>
=C2=A0 =C2=A0 =C2=A0.do_unaligned_access =3D sparc_cpu_do_unaligned_access,=
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000e73e7f05cb08fe46--

