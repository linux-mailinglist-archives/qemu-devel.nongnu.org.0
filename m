Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3453A417758
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:17:40 +0200 (CEST)
Received: from localhost ([::1]:37580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmxH-0005xQ-9t
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1mTmvN-0004Xu-QM
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:15:41 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:34553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mrolnik@gmail.com>) id 1mTmvM-00017U-8u
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:15:41 -0400
Received: by mail-qk1-x72c.google.com with SMTP id i132so28637909qke.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 08:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RG4+rx0CgIY1MzzqpNngu5oUdMnCU+VALy/71d5xtNI=;
 b=UEzXFTn9hWZZB8z7Vtj5k7riH5gr4dgSyA2xCJ7DGYgaHgJL7fNYAlFUB2hCt2Qinx
 QFG/ZOVsreNMVPVu7MdSPZ2p7qvFMrAbGp68NbFKYZ2TEgPwj5teVXuqay4nU23oQtwR
 UNuhtFAZlWwBsjGIyH8MDDlRVVu4kOu6olzjCvdGlXy60yU3/XaVVICtapqYjlJ3qn55
 WtV2bJcgK0xgsfkq7phY8fVWvRJyxorcDl+WQjk/NRQVZEFZ24MiTTof3Xn4aRrpcSVJ
 t5YqXeIcVgbFCnl3BwIRcQLHSMAnSAjBr0FIcDGhoMofT70Ilm8W8xlhgLk/uZ9maU9Q
 MiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RG4+rx0CgIY1MzzqpNngu5oUdMnCU+VALy/71d5xtNI=;
 b=MqaFvEj7yYTyHfaIdmwRBy27Zpv1He5oF/z3FMZuKATo0CTgS+tkMw/2SO2HoAs2gd
 CxstOLMZO+K5DrLLYrbpyU+L0bJemtgmfan/K+Sl3HKvc1PH7OyX7aKWvzrRKRiAH/mn
 1FzE6GbI2d/cNFAFKrmS0bTaTa1pBHnLhxhE9QRu5h1GTFLnDLCIbiiJlk+SH7nGknu6
 IPsZr4lfEnjfKuuuDtDlO1jif/0r76eKXHMjMQsRR5jBCc2V3TkE5BlQdMarZATgGf/T
 ZrJaZaBiW8D5C021j4+6kyD341mLf5jRo62B9vwGljY518hgwGdmHlpbho/nsdXF44pU
 bkgQ==
X-Gm-Message-State: AOAM533NQrmuYcMnuRijvAbmNXCJXB4K4H1RaPAagB++/Wnxhle+hr8R
 Nwn4H2bLxUbBnWuKRul2ZGO7uTf7DPZkL4nB0io=
X-Google-Smtp-Source: ABdhPJyXl6mtUlBAHp8DLwZ8cncFvX9apnNzwJ7+i6O01NonjD6xoLSik9KOfWSeGLOGXEY8D53i6Mfpx1Eka9gkA2Q=
X-Received: by 2002:a37:a795:: with SMTP id
 q143mr10658058qke.317.1632496535579; 
 Fri, 24 Sep 2021 08:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210924093847.1014331-1-f4bug@amsat.org>
 <20210924093847.1014331-20-f4bug@amsat.org>
In-Reply-To: <20210924093847.1014331-20-f4bug@amsat.org>
From: Michael Rolnik <mrolnik@gmail.com>
Date: Fri, 24 Sep 2021 18:14:59 +0300
Message-ID: <CAK4993gz1qOUJ07HoCveBj=ZN=jBc4XmZWU-E9HzwYhiTc8qLg@mail.gmail.com>
Subject: Re: [PATCH v6 19/40] target/avr: Restrict has_work() handler to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000019ae3f05ccbf383e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=mrolnik@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000019ae3f05ccbf383e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>

On Fri, Sep 24, 2021 at 12:40 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Restrict has_work() to sysemu.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/avr/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 5d70e34dd54..6d51f91ca2c 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -195,6 +195,7 @@ static const struct SysemuCPUOps avr_sysemu_ops =3D {
>  static const struct TCGCPUOps avr_tcg_ops =3D {
>      .initialize =3D avr_cpu_tcg_init,
>      .synchronize_from_tb =3D avr_cpu_synchronize_from_tb,
> +    .has_work =3D avr_cpu_has_work,
>      .cpu_exec_interrupt =3D avr_cpu_exec_interrupt,
>      .tlb_fill =3D avr_cpu_tlb_fill,
>      .do_interrupt =3D avr_cpu_do_interrupt,
> @@ -211,7 +212,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void
> *data)
>
>      cc->class_by_name =3D avr_cpu_class_by_name;
>
> -    cc->has_work =3D avr_cpu_has_work;
>      cc->dump_state =3D avr_cpu_dump_state;
>      cc->set_pc =3D avr_cpu_set_pc;
>      cc->memory_rw_debug =3D avr_cpu_memory_rw_debug;
> --
> 2.31.1
>
>

--=20
Best Regards,
Michael Rolnik

--00000000000019ae3f05ccbf383e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Michael Rolnik &lt;<a href=3D"mailto:mrolnik@=
gmail.com">mrolnik@gmail.com</a>&gt;</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 24, 2021 at 12:40 PM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Restrict has_work() to sysemu.<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0target/avr/cpu.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target/avr/cpu.c b/target/avr/cpu.c<br>
index 5d70e34dd54..6d51f91ca2c 100644<br>
--- a/target/avr/cpu.c<br>
+++ b/target/avr/cpu.c<br>
@@ -195,6 +195,7 @@ static const struct SysemuCPUOps avr_sysemu_ops =3D {<b=
r>
=C2=A0static const struct TCGCPUOps avr_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D avr_cpu_tcg_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D avr_cpu_synchronize_from_tb,<b=
r>
+=C2=A0 =C2=A0 .has_work =3D avr_cpu_has_work,<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_interrupt =3D avr_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.tlb_fill =3D avr_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D avr_cpu_do_interrupt,<br>
@@ -211,7 +212,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *d=
ata)<br>
<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;class_by_name =3D avr_cpu_class_by_name;<br>
<br>
-=C2=A0 =C2=A0 cc-&gt;has_work =3D avr_cpu_has_work;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;dump_state =3D avr_cpu_dump_state;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;set_pc =3D avr_cpu_set_pc;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;memory_rw_debug =3D avr_cpu_memory_rw_debug;<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Best Regards,<br>Michael Rolnik</div>

--00000000000019ae3f05ccbf383e--

