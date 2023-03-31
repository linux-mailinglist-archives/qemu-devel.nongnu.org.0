Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD36D1DA7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 12:11:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piBhn-0006Zo-Nu; Fri, 31 Mar 2023 06:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1piBhl-0006YF-If
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:09:57 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1piBhj-0003uF-P9
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:09:57 -0400
Received: by mail-ed1-x52e.google.com with SMTP id eg48so87453103edb.13
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680257393;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h9af1lSdqqFuGqOlXprH7XXugQwSJlYdPbXQkuK5d/I=;
 b=hMkgYGLjp5bTyoN7ajtdYJmozflBLWMz8wzXehVFSS+qbGKjkt+9D2ZHpxFkaqHfha
 piKFO2W0ywRqiEtdQS2KGRLo2nZp1istyH6E7I0i6uMznYTFxGNocY17/P62MII1wu7I
 QBLSBVrD1XMiQRSCsXGo437pA0x5tL+qApYdHkbOM++fZNXfoD+f9BhI8BmS3DU52Woe
 8v5Zo40eud9hWBF7bXPeEhXlDzNe6cIlD5p5jGSYraCwncT4NW9ZAZkyXlioTpLsSfeh
 3igJebvsQ9ZAlGRmjUwrWFNjyY4wKZgz5rbZCwALrvH2vNOWOaqxnukFntHgYj49aXh3
 TxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680257393;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h9af1lSdqqFuGqOlXprH7XXugQwSJlYdPbXQkuK5d/I=;
 b=HRNUCSUc3oZN5OPTrGV+65emNLyrU3XM2suJAnKyNIJL3Y2X3b1zbsQATYpsfF/Eyx
 17vPlNJcsvuUzOQef8WuKoAuIYEo/3wMPgHQWgVoMe1jz5SvvSb9Xi68sIHNCtyccpqa
 sI3wDIMzyG7fR/vemcl8hemk4ysaCzcvCqAPx6i1c92PcTc4GMO7DE9nIs3Nvvaki+iq
 JQaDRUwCvukiBkD4wzheoVobV2i+u/3zajYvllUzCjogK1sz7YU4LRxnhvkrG8PrR/qF
 CQFV+bmqPIDd0lUxXf+Cu+aw3CJD1LsksHM7wgsuZAfeBYd5zFRN6EMgOFRbJzCX3bcX
 Ip0A==
X-Gm-Message-State: AAQBX9elmd2z17MH2GCUi/UB593mbunAj+zMLlbYWTlWrGV/aZNvySZ5
 JRnrnIOynSWQtjFKWv7H3UszWU/IFRcaxKc0+D0=
X-Google-Smtp-Source: AKy350ZItIbfQDGniyOWfFJa4JA6ZX5BOHDeFi1GsVLsdqW+cNy6E8V2b1HtwGp2niC/Y3UTe1KLoAMRQhySWe61Erw=
X-Received: by 2002:a17:906:4f1a:b0:930:528b:91e5 with SMTP id
 t26-20020a1709064f1a00b00930528b91e5mr13046478eju.4.1680257393260; Fri, 31
 Mar 2023 03:09:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230323182811.2641044-1-crauer@google.com>
In-Reply-To: <20230323182811.2641044-1-crauer@google.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Fri, 31 Mar 2023 12:09:41 +0200
Message-ID: <CAJy5ezqP50f3frM0tBNOHo4-4PaeaMA7-YXAd8G_w+iRqu2cjw@mail.gmail.com>
Subject: Re: [PATCH] hw/ssi: Fix Linux driver init issue with xilinx_spi
To: Chris Rauer <crauer@google.com>
Cc: alistair@alistair23.me, peter.maydell@linaro.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000e7d3905f82f695e"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000000e7d3905f82f695e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 7:29=E2=80=AFPM Chris Rauer <crauer@google.com> wro=
te:

> The problem is that the Linux driver expects the master transaction inhib=
it
> bit(R_SPICR_MTI) to be set during driver initialization so that it can
> detect the fifo size but QEMU defaults it to zero out of reset.  The
> datasheet indicates this bit is active on reset.
>
> See page 25, SPI Control Register section:
>
> https://www.xilinx.com/content/dam/xilinx/support/documents/ip_documentat=
ion/axi_quad_spi/v3_2/pg153-axi-quad-spi.pdf
>
>
Yes, MTI should be set when the device comes out of reset.

Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>



> Signed-off-by: Chris Rauer <crauer@google.com>
> ---
>  hw/ssi/xilinx_spi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
> index 552927622f..d4de2e7aab 100644
> --- a/hw/ssi/xilinx_spi.c
> +++ b/hw/ssi/xilinx_spi.c
> @@ -156,6 +156,7 @@ static void xlx_spi_do_reset(XilinxSPI *s)
>      txfifo_reset(s);
>
>      s->regs[R_SPISSR] =3D ~0;
> +    s->regs[R_SPICR] =3D R_SPICR_MTI;
>      xlx_spi_update_irq(s);
>      xlx_spi_update_cs(s);
>  }
> --
> 2.40.0.348.gf938b09366-goog
>
>
>

--0000000000000e7d3905f82f695e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 23, 2023 at 7:29=E2=80=AFPM C=
hris Rauer &lt;<a href=3D"mailto:crauer@google.com">crauer@google.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The pr=
oblem is that the Linux driver expects the master transaction inhibit<br>
bit(R_SPICR_MTI) to be set during driver initialization so that it can<br>
detect the fifo size but QEMU defaults it to zero out of reset.=C2=A0 The<b=
r>
datasheet indicates this bit is active on reset.<br>
<br>
See page 25, SPI Control Register section:<br>
<a href=3D"https://www.xilinx.com/content/dam/xilinx/support/documents/ip_d=
ocumentation/axi_quad_spi/v3_2/pg153-axi-quad-spi.pdf" rel=3D"noreferrer" t=
arget=3D"_blank">https://www.xilinx.com/content/dam/xilinx/support/document=
s/ip_documentation/axi_quad_spi/v3_2/pg153-axi-quad-spi.pdf</a><br>
<br></blockquote><div><br></div><div>Yes, MTI should be set when the device=
 comes out of reset.</div><div><br></div><div>Reviewed-by: Edgar E. Iglesia=
s &lt;<a href=3D"mailto:edgar@zeroasic.com">edgar@zeroasic.com</a>&gt;<br><=
/div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
Signed-off-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" target=
=3D"_blank">crauer@google.com</a>&gt;<br>
---<br>
=C2=A0hw/ssi/xilinx_spi.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c<br>
index 552927622f..d4de2e7aab 100644<br>
--- a/hw/ssi/xilinx_spi.c<br>
+++ b/hw/ssi/xilinx_spi.c<br>
@@ -156,6 +156,7 @@ static void xlx_spi_do_reset(XilinxSPI *s)<br>
=C2=A0 =C2=A0 =C2=A0txfifo_reset(s);<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;regs[R_SPISSR] =3D ~0;<br>
+=C2=A0 =C2=A0 s-&gt;regs[R_SPICR] =3D R_SPICR_MTI;<br>
=C2=A0 =C2=A0 =C2=A0xlx_spi_update_irq(s);<br>
=C2=A0 =C2=A0 =C2=A0xlx_spi_update_cs(s);<br>
=C2=A0}<br>
-- <br>
2.40.0.348.gf938b09366-goog<br>
<br>
<br>
</blockquote></div></div>

--0000000000000e7d3905f82f695e--

