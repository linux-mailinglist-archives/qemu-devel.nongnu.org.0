Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41F25159F4
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 04:58:42 +0200 (CEST)
Received: from localhost ([::1]:54726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkdJh-0006Xd-M1
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 22:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkdIW-0005j9-0x
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 22:57:28 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:38486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nkdIT-0004JB-Uy
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 22:57:27 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id q2so9210249vsr.5
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e39/Dk+DUBWYhP4RJWwncUHnS14s+nldUn+5Uq7Mnj8=;
 b=OE07CNyUTSJGFFQ5yM5SSLlRu3Zr2Sax6X8FwFtk2snzhy6tnWWZvcI3PRkx92zkFg
 jKyJo3vstMowVedm07myBCWFrXzZPgwz5jK5qbnWbiRHxMqbUJKP56ItlTR5oO/CEnTg
 6AHMLriC/YL2khtjQ21aZAElj2l3BWkfaElsziK5q3I/555JbzVpj9oFxpPvaPyIpdgP
 FXrpHEWI+j299L20xbww5aqgL1qg7Q/MktHAXO6lDbz+l6tzeV7ffXClHthxtYduqIcK
 MPkRIjcvHnEPqQ9Lx7xdK1uFrqpSAcOG7LbGLCgx4nL9ZNU+F1Xq7naCyon3YRFW4Aht
 SL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e39/Dk+DUBWYhP4RJWwncUHnS14s+nldUn+5Uq7Mnj8=;
 b=G4FZjPwxrO19WNDbOIzcfTZvbWqfAb+3xSFXco8ZVTznfwtJa64+GdqIR+1gFGtIxX
 DtBAva7U4hAOqaLIEzmH1AhjsFZYm6ZaWOonRelnxEReeTbBNIlmPNAHdIG5wXFQ1RKQ
 k8N3o+TTyA70DuiKqap+82ubgg0gKItakRimMV8H3qaOqKUR0mce3QPgnH5gvgg3Tcc/
 +d9PJQiyxkuhPIpCX24WfipR+Jsw1PYEC6koPZrDNg3d6bd/yQFOzxpLP822RT0ksG7p
 vzCuRygfodzwjeOiLaqHzSwW7OKLC5+lV3wtxaFWkKhAEq+z9qf3Fkyraw+9XFAq0Hm5
 oyaA==
X-Gm-Message-State: AOAM531XHiWEbc3eyTkLIBXA6j9iRLOY7wdQIr5jNVVOCpAM1hUDGem+
 zkqi+1PZxnUFKL+aEiJMTS10jIYbUkf7Ug==
X-Google-Smtp-Source: ABdhPJyzOwXFjPHA/j1F5UaqwXiHDsS4sAb81yEphwfKSYzgIoL8dQX8x0De3pZB+4g8TK2jywC7Mg==
X-Received: by 2002:a67:c905:0:b0:32c:69bd:18a3 with SMTP id
 w5-20020a67c905000000b0032c69bd18a3mr674331vsk.5.1651287441533; 
 Fri, 29 Apr 2022 19:57:21 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44]) by smtp.gmail.com with ESMTPSA id
 y15-20020a1f7d0f000000b0034e6f1fd056sm131349vkc.32.2022.04.29.19.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 19:57:20 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id bl31so1704129vsb.12;
 Fri, 29 Apr 2022 19:57:20 -0700 (PDT)
X-Received: by 2002:a67:df10:0:b0:32d:ba4:8f73 with SMTP id
 s16-20020a67df10000000b0032d0ba48f73mr754345vsk.74.1651287440420; Fri, 29 Apr
 2022 19:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220429153431.308829-1-apatel@ventanamicro.com>
 <20220429153431.308829-2-apatel@ventanamicro.com>
In-Reply-To: <20220429153431.308829-2-apatel@ventanamicro.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sat, 30 Apr 2022 10:57:09 +0800
X-Gmail-Original-Message-ID: <CANzO1D21gBFqfJwZ3KZaVj+oFgmwZTyELs-RQdbvthF6uRq4-w@mail.gmail.com>
Message-ID: <CANzO1D21gBFqfJwZ3KZaVj+oFgmwZTyELs-RQdbvthF6uRq4-w@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/riscv: Don't force update priv spec version to
 latest
To: Anup Patel <apatel@ventanamicro.com>
Content-Type: multipart/alternative; boundary="0000000000004ef42d05ddd65159"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=frank.chang@sifive.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004ef42d05ddd65159
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Frank Chang <frank.chang@sifive.com>

On Fri, Apr 29, 2022 at 11:41 PM Anup Patel <apatel@ventanamicro.com> wrote:

> The riscv_cpu_realize() sets priv spec verion to v1.12 when it is
> when "env->priv_ver == 0" (i.e. default v1.10) because the enum
> value of priv spec v1.10 is zero.
>
> Due to above issue, the sifive_u machine will see priv spec v1.12
> instead of priv spec v1.10.
>
> To fix this issue, we set latest priv spec version (i.e. v1.12)
> for base rv64/rv32 cpu and riscv_cpu_realize() will override priv
> spec version only when "cpu->cfg.priv_spec != NULL".
>
> Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f0a702fee6..02ee7d45d8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -169,6 +169,8 @@ static void rv64_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV64, 0);
> +    /* Set latest version of privileged specification */
> +    set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
>
>  static void rv64_sifive_u_cpu_init(Object *obj)
> @@ -204,6 +206,8 @@ static void rv32_base_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      /* We set this in the realise function */
>      set_misa(env, MXL_RV32, 0);
> +    /* Set latest version of privileged specification */
> +    set_priv_version(env, PRIV_VERSION_1_12_0);
>  }
>
>  static void rv32_sifive_u_cpu_init(Object *obj)
> @@ -509,7 +513,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error
> **errp)
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      CPUClass *cc = CPU_CLASS(mcc);
> -    int priv_version = 0;
> +    int priv_version = -1;
>      Error *local_err = NULL;
>
>      cpu_exec_realizefn(cs, &local_err);
> @@ -533,10 +537,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error
> **errp)
>          }
>      }
>
> -    if (priv_version) {
> +    if (priv_version >= PRIV_VERSION_1_10_0) {
>          set_priv_version(env, priv_version);
> -    } else if (!env->priv_ver) {
> -        set_priv_version(env, PRIV_VERSION_1_12_0);
>      }
>
>      if (cpu->cfg.mmu) {
> --
> 2.34.1
>
>
>

--0000000000004ef42d05ddd65159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Reviewed-by: Frank Chang &lt;<a href=3D"m=
ailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt;</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 29,=
 2022 at 11:41 PM Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicro.com"=
>apatel@ventanamicro.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">The riscv_cpu_realize() sets priv spec verion to v1=
.12 when it is<br>
when &quot;env-&gt;priv_ver =3D=3D 0&quot; (i.e. default v1.10) because the=
 enum<br>
value of priv spec v1.10 is zero.<br>
<br>
Due to above issue, the sifive_u machine will see priv spec v1.12<br>
instead of priv spec v1.10.<br>
<br>
To fix this issue, we set latest priv spec version (i.e. v1.12)<br>
for base rv64/rv32 cpu and riscv_cpu_realize() will override priv<br>
spec version only when &quot;cpu-&gt;cfg.priv_spec !=3D NULL&quot;.<br>
<br>
Fixes: 7100fe6c2441 (&quot;target/riscv: Enable privileged spec version 1.1=
2&quot;)<br>
Signed-off-by: Anup Patel &lt;<a href=3D"mailto:apatel@ventanamicro.com" ta=
rget=3D"_blank">apatel@ventanamicro.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 10 ++++++----<br>
=C2=A01 file changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index f0a702fee6..02ee7d45d8 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -169,6 +169,8 @@ static void rv64_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV64, 0);<br>
+=C2=A0 =C2=A0 /* Set latest version of privileged specification */<br>
+=C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0}<br>
<br>
=C2=A0static void rv64_sifive_u_cpu_init(Object *obj)<br>
@@ -204,6 +206,8 @@ static void rv32_base_cpu_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0/* We set this in the realise function */<br>
=C2=A0 =C2=A0 =C2=A0set_misa(env, MXL_RV32, 0);<br>
+=C2=A0 =C2=A0 /* Set latest version of privileged specification */<br>
+=C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_12_0);<br>
=C2=A0}<br>
<br>
=C2=A0static void rv32_sifive_u_cpu_init(Object *obj)<br>
@@ -509,7 +513,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);<br>
=C2=A0 =C2=A0 =C2=A0CPUClass *cc =3D CPU_CLASS(mcc);<br>
-=C2=A0 =C2=A0 int priv_version =3D 0;<br>
+=C2=A0 =C2=A0 int priv_version =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0cpu_exec_realizefn(cs, &amp;local_err);<br>
@@ -533,10 +537,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (priv_version) {<br>
+=C2=A0 =C2=A0 if (priv_version &gt;=3D PRIV_VERSION_1_10_0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_priv_version(env, priv_version);<br>
-=C2=A0 =C2=A0 } else if (!env-&gt;priv_ver) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_priv_version(env, PRIV_VERSION_1_12_0);<br=
>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.mmu) {<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000004ef42d05ddd65159--

