Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9E48C536
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:55:45 +0100 (CET)
Received: from localhost ([::1]:33352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7e6K-0001a3-FI
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:55:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7cq4-0005kf-33
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:34:52 -0500
Received: from [2607:f8b0:4864:20::102a] (port=51862
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n7cq2-0005Rx-KZ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:34:51 -0500
Received: by mail-pj1-x102a.google.com with SMTP id o3so4551683pjs.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 04:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9398uluQ3UaPAanVmaeZZQZJORfgy33T6dydFjIdCk4=;
 b=nZppzDVGFbnWP2Dq4XhaGOPAV+Oa2CGZ53Sz6z+7lFhgVPht0QzVMiU7AHckvuPj3w
 KEscJWsPFFrl0uhnkfo3vVfoNTXewL7fduRBlhG8sreKAd+ESpz70J2PDhxADNE7Jf/I
 xy/aCKvCStlFxv6AhBexcajWhy4Fayrm24ry3758qF0n3Fo3KzMwfqlWFA7N5CHX9HCs
 m/pMkP9ToeUYem3X5z3q2QrgosxyNds2S3gHVxcmhqxD10KoZy5XV3H0rbi5fi9AAmny
 Qq9qoi8AQ465Uj45gFT32oPVVh16wfMD6fD1ILGzZcTRF2zXoqVZKRNLgtvDJGvWS3wg
 acUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9398uluQ3UaPAanVmaeZZQZJORfgy33T6dydFjIdCk4=;
 b=WznAG3Hg4SMicDLixnWt1j6mIANyKdjmEm4cfBNGT7pow6WtVzlEkCl57TjTovmQqi
 hals/bccNuJaHqSgyx8MEZUmDQR5oMfnpkDKGsJZ0Lm/viry59ARdVFhW+15TAIrA8+V
 NmWmhzJArt3ejtzkXD8xEajMGzPtklPifYc0flsuPEi1U/OkJKEcCFqF2d+Q1EAhLOKV
 1HeRrxOSaKELa0BW53Vw2X5vDe3koqQ2Puu/uOnBaBwic+Uka813aAqtiVoYmV2o1f43
 /vqGxCHmbRvcXQOUFhkNYM/e5HhcnJWXwhhpxZkrSMLtcOSdUz/B9VTKiAqST/8OZf6N
 TZ6g==
X-Gm-Message-State: AOAM532iz57XPW08RpGr365SKy/pHkQf4YqmE60YHu1WrIjyHPkz7RSy
 CNXAp6Bw760oPb71T8WAumXzYg==
X-Google-Smtp-Source: ABdhPJwjuRYb8CI5nAihsWxd9tyUOjrpQn1pjOoq5za52ASgjpi8Txk8Rla7XPfUJxf6ksJSB/LPJg==
X-Received: by 2002:a17:902:c401:b0:14a:5f50:ece7 with SMTP id
 k1-20020a170902c40100b0014a5f50ece7mr5220376plk.29.1641990889443; 
 Wed, 12 Jan 2022 04:34:49 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com.
 [209.85.216.50])
 by smtp.gmail.com with ESMTPSA id y4sm5674207pfi.83.2022.01.12.04.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:34:48 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso11702789pjm.4; 
 Wed, 12 Jan 2022 04:34:48 -0800 (PST)
X-Received: by 2002:a17:90b:3e84:: with SMTP id
 rj4mr7210972pjb.195.1641990888339; 
 Wed, 12 Jan 2022 04:34:48 -0800 (PST)
MIME-Version: 1.0
References: <20211230123539.52786-1-anup@brainfault.org>
 <20211230123539.52786-7-anup@brainfault.org>
In-Reply-To: <20211230123539.52786-7-anup@brainfault.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 12 Jan 2022 20:34:37 +0800
X-Gmail-Original-Message-ID: <CANzO1D2yJDwZ_sRfndi3QsrziWza_AY+akz8SKU+GsuNC4bNKg@mail.gmail.com>
Message-ID: <CANzO1D2yJDwZ_sRfndi3QsrziWza_AY+akz8SKU+GsuNC4bNKg@mail.gmail.com>
Subject: Re: [PATCH v6 06/23] target/riscv: Add AIA cpu feature
To: Anup Patel <anup@brainfault.org>
Content-Type: multipart/alternative; boundary="0000000000009fbe7405d561cb04"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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

--0000000000009fbe7405d561cb04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Anup Patel <anup@brainfault.org> =E6=96=BC 2021=E5=B9=B412=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:36=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Anup Patel <anup.patel@wdc.com>
>
> We define a CPU feature for AIA CSR support in RISC-V CPUs which
> can be set by machine/device emulation. The RISC-V CSR emulation
> will also check this feature for emulating AIA CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1bdd03731f..d0c1725eaf 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -75,7 +75,8 @@ enum {
>      RISCV_FEATURE_MMU,
>      RISCV_FEATURE_PMP,
>      RISCV_FEATURE_EPMP,
> -    RISCV_FEATURE_MISA
> +    RISCV_FEATURE_MISA,
> +    RISCV_FEATURE_AIA
>  };
>
>  #define PRIV_VERSION_1_10_0 0x00011000
> --
> 2.25.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--0000000000009fbe7405d561cb04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Anup Patel &lt;<a href=3D"mailto:anup@bra=
infault.org">anup@brainfault.org</a>&gt; =E6=96=BC 2021=E5=B9=B412=E6=9C=88=
30=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:36=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com=
" target=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
<br>
We define a CPU feature for AIA CSR support in RISC-V CPUs which<br>
can be set by machine/device emulation. The RISC-V CSR emulation<br>
will also check this feature for emulating AIA CSRs.<br>
<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@wdc.com" target=
=3D"_blank">anup.patel@wdc.com</a>&gt;<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup@brainfault.org" target=
=3D"_blank">anup@brainfault.org</a>&gt;<br>
Reviewed-by: Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com" target=3D"_=
blank">bmeng.cn@gmail.com</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 1bdd03731f..d0c1725eaf 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -75,7 +75,8 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0RISCV_FEATURE_MMU,<br>
=C2=A0 =C2=A0 =C2=A0RISCV_FEATURE_PMP,<br>
=C2=A0 =C2=A0 =C2=A0RISCV_FEATURE_EPMP,<br>
-=C2=A0 =C2=A0 RISCV_FEATURE_MISA<br>
+=C2=A0 =C2=A0 RISCV_FEATURE_MISA,<br>
+=C2=A0 =C2=A0 RISCV_FEATURE_AIA<br>
=C2=A0};<br>
<br>
=C2=A0#define PRIV_VERSION_1_10_0 0x00011000<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com=
</a>&gt;=C2=A0=C2=A0</div></div></div>

--0000000000009fbe7405d561cb04--

