Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D110C48C8CB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 17:49:41 +0100 (CET)
Received: from localhost ([::1]:43900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7goe-0002tJ-Nd
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 11:49:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7gmj-0000l3-4w
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:47:43 -0500
Received: from [2607:f8b0:4864:20::102e] (port=46631
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7gmf-0000ej-VL
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:47:40 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so5850383pjb.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 08:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7yyDFnQw4D/qVnf88RvaxNYzkT5fTB+CqrIZIK8yZcM=;
 b=lIqvoJunxqoG42oDUid83ASm3wXfrgJ2jisuWlloGBlTRN0iQwK/6Q3s+bDFZ/iLMk
 GrQIWDx7w0CVcE/uZ80FmwhnDUINTgoOY7bpZZj4733tD710sVaN1KkmXFIoSVPN5zvF
 bgGfmFsXlULwrRF23Qovbjlg88BhuRt0nhviqq1AR8fapQ2kDvBmmsOlKsvVoDK/Q211
 KcgVwMQ7AF091I/hG3Ubzw/6AItJDojDCKxOHJbey8kfQsCO6zm99ZPpLPMy1QNnHMVC
 LZfy1vBT9LQjhjqKdPdXdN1BDvH1DWP/GLnzSQUk/ZjGim5gn19vYY3QfoHcsg2TwZEl
 RSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7yyDFnQw4D/qVnf88RvaxNYzkT5fTB+CqrIZIK8yZcM=;
 b=atvIsWeETmwjuOtWDY7eBxLe3RC7iyu16WxjstYyR1VPmu9v1NvIRRYbH6yKJ4lMLZ
 4RNVeC5YDr04siSv7rm1touxxzkJxp0QhnzmgtiuE249ZKJTs/Ny0YQlYPGC7BjhOy8b
 NmzdRT4e90ir+RDLf6VZUTE1tCl/dBXET/0omg4Vmie5XKd8NtCk+Hbm0STQ6QXHIBWJ
 95E6XWgoequ53LZfZ3p7SxQgp9TY1qFBDPDzYh1LQER3/3yPViaierHQZB+p0xuutaLS
 QqYLFomcrCtxfabDF/hGp8KZXpVo9+70246wmVzpZBeZnmK8ofrwmgSfa/iOqyiFaX1b
 1R/w==
X-Gm-Message-State: AOAM533J7/2NX6W2ddJnLlSLgL2lniKhbZ+Jjdj/LTSe5xitaUzTMVv1
 luWvcr8E0BBRPCWCJ/QGO/IWthUtidLEAKdZ
X-Google-Smtp-Source: ABdhPJy1yMMrjWWAC3XtIZyp61i/fWwW3Z3GyM4wwx7H8igSxGkkehAznE6mmOxlDALx0JirJJLgZg==
X-Received: by 2002:a17:90b:1b46:: with SMTP id
 nv6mr373979pjb.161.1642006056225; 
 Wed, 12 Jan 2022 08:47:36 -0800 (PST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com.
 [209.85.216.54])
 by smtp.gmail.com with ESMTPSA id e11sm220844pjh.14.2022.01.12.08.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 08:47:35 -0800 (PST)
Received: by mail-pj1-f54.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so13291738pja.1; 
 Wed, 12 Jan 2022 08:47:35 -0800 (PST)
X-Received: by 2002:a17:902:b710:b0:14a:28ee:fe6b with SMTP id
 d16-20020a170902b71000b0014a28eefe6bmr271882pls.119.1642006054853; Wed, 12
 Jan 2022 08:47:34 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-17-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-17-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 13 Jan 2022 00:47:23 +0800
X-Gmail-Original-Message-ID: <CANzO1D03XK4RWfKWGkBEB7Y+dmLFpTUQyrht+5W1qk4sOuRdfw@mail.gmail.com>
Message-ID: <CANzO1D03XK4RWfKWGkBEB7Y+dmLFpTUQyrht+5W1qk4sOuRdfw@mail.gmail.com>
Subject: Re: [PATCH v6 16/23] hw/riscv: virt: Use AIA INTC compatible string
 when available
To: Anup Patel <anup@brainfault.org>
Content-Type: multipart/alternative; boundary="0000000000009e5fdd05d5655314"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009e5fdd05d5655314
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:59=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> We should use the AIA INTC compatible string in the CPU INTC
> DT nodes when the CPUs support AIA feature. This will allow
> Linux INTC driver to use AIA local interrupt CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3af074148e..720641b1dd 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -211,8 +211,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s=
,
> int socket,
>          qemu_fdt_add_subnode(mc->fdt, intc_name);
>          qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
>              intc_phandles[cpu]);
> -        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> -            "riscv,cpu-intc");
> +        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> +                          RISCV_FEATURE_AIA)) {
> +            static const char * const compat[2] =3D {
> +                "riscv,cpu-intc-aia", "riscv,cpu-intc"
> +            };
> +            qemu_fdt_setprop_string_array(mc->fdt, intc_name,
> "compatible",
> +                                      (char **)&compat,
> ARRAY_SIZE(compat));
> +        } else {
> +            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> +                "riscv,cpu-intc");
> +        }
>          qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller",
> NULL, 0);
>          qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1)=
;
>
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--0000000000009e5fdd05d5655314
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:59=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
We should use the AIA INTC compatible string in the CPU INTC<br>
DT nodes when the CPUs support AIA feature. This will allow<br>
Linux INTC driver to use AIA local interrupt CSRs.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0hw/riscv/virt.c | 13 +++++++++++--<br>
=C2=A01 file changed, 11 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
index 3af074148e..720641b1dd 100644<br>
--- a/hw/riscv/virt.c<br>
+++ b/hw/riscv/virt.c<br>
@@ -211,8 +211,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, =
int socket,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_add_subnode(mc-&gt;fdt, intc_nam=
e);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_setprop_cell(mc-&gt;fdt, intc_na=
me, &quot;phandle&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intc_phandles[cpu]);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;fdt, intc_name,=
 &quot;compatible&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv,cpu-intc&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_feature(&amp;s-&gt;soc[socket].harts=
[cpu].env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 RISCV_FEATURE_AIA)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static const char * const compat=
[2] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv,cpu-in=
tc-aia&quot;, &quot;riscv,cpu-intc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string_array(mc=
-&gt;fdt, intc_name, &quot;compatible&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (char **)&amp;c=
ompat, ARRAY_SIZE(compat));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;f=
dt, intc_name, &quot;compatible&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv,cpu-in=
tc&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_setprop(mc-&gt;fdt, intc_name, &=
quot;interrupt-controller&quot;, NULL, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_fdt_setprop_cell(mc-&gt;fdt, intc_na=
me, &quot;#interrupt-cells&quot;, 1);<br>
<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0</div></div></div>

--0000000000009e5fdd05d5655314--

