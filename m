Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E923B5261
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 08:53:05 +0200 (CEST)
Received: from localhost ([::1]:53158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxOfA-0005Wr-CA
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 02:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxOdI-0004k0-13
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 02:51:08 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxOdE-0008Ct-Dh
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 02:51:07 -0400
Received: by mail-pg1-x529.google.com with SMTP id u14so5976978pga.11
 for <qemu-devel@nongnu.org>; Sat, 26 Jun 2021 23:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pBvp7SbkEAv+4B2nNrJHjMc00zsodc4YKwKXlhDA/eI=;
 b=ZS4P03Bubo1RQxw2wZUaHMRBF8mWT98vqHPwXIrl1ayd9I2D3ku+4m/GHfInrS8VX+
 a78YpmH268rYfNweyRRet50SzfPpMcZWDltqFuJHT2e/DA9IVVRR+S8EJ2KEsPCZrN/L
 /W6oPE27XCAo/IaLihFtD5eXHoGFNTttn8+8L4rnE4zFiB3eIDIbTmWs9pmestu1Eptf
 X6Sc86EBQ/VGfXJqG19mymaTHYturvTLSzxLNCNHRIHy19ghz4cyV0ntappuaCyaZFSh
 tKDf3KyvTgz5bhY8qY4pcRRjHLYaQ/w0a4C97MsylV/FpKLEcdbojeA0qm+ncGfozH54
 1QRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pBvp7SbkEAv+4B2nNrJHjMc00zsodc4YKwKXlhDA/eI=;
 b=iFfg9JsI2NgfL+HBhwv0DXJ9pbXLl4xlMD8CzlfJ9gsXm11g0SCi4FtlJv2UbUDepU
 PeBcwgURs3D2wL6jS/kNDrZ9il5GWhuHeGY47tj4gZQuk+DX2aguGcy1oqDZfVQUDnSN
 aYKFVoJGVjTUMgff7bZGQrbtVH7BbPlSsyD8zyAPj9YlkPITJpcH4yGVghhKvBe7z+x9
 g+g4arb0JAFKcOuQsiagWEhfG1fUW/dkA8HRlcrvYMhbi5szErdDydgdvyQd5874VwJ3
 4xyy5lKMwg8zoUUNsAS31hmHQBHsT8ad5mm1QyJlEemvO4E+5YQpPmq8G1HL8D2uCMh3
 JpyQ==
X-Gm-Message-State: AOAM530noZSUrFK5eMzHLXB7nZDjUuF7luV9tamrHVgRjIqyJ0ub7TKs
 kI/Yey9STphoKkZB6qeUD6Cw0sscvKC75ilQ
X-Google-Smtp-Source: ABdhPJxc4W0JYCPEc0E6AS0NWbQdbjZzqJm/h5Y/VcKMXd45vlLu1xOWN0xE8TWazD9nHJ/umfrEuQ==
X-Received: by 2002:a05:6a00:6:b029:305:4ab6:90ba with SMTP id
 h6-20020a056a000006b02903054ab690bamr6294455pfk.1.1624776662582; 
 Sat, 26 Jun 2021 23:51:02 -0700 (PDT)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com.
 [209.85.210.182])
 by smtp.gmail.com with ESMTPSA id n5sm10201674pfv.159.2021.06.26.23.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 23:51:02 -0700 (PDT)
Received: by mail-pf1-f182.google.com with SMTP id y4so11268821pfi.9;
 Sat, 26 Jun 2021 23:51:02 -0700 (PDT)
X-Received: by 2002:a62:b40c:0:b029:2de:4a1e:a753 with SMTP id
 h12-20020a62b40c0000b02902de4a1ea753mr18962975pfn.64.1624776661891; Sat, 26
 Jun 2021 23:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-5-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-5-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 27 Jun 2021 14:50:51 +0800
X-Gmail-Original-Message-ID: <CANzO1D0Tx0oB=t8aLhFN95Kq00OP-=wv5mPOYesof_dG6Bap-w@mail.gmail.com>
Message-ID: <CANzO1D0Tx0oB=t8aLhFN95Kq00OP-=wv5mPOYesof_dG6Bap-w@mail.gmail.com>
Subject: Re: [RFC PATCH 04/11] target/riscv: Update CSR xie in CLIC mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="000000000000c5813805c5b9cb20"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c5813805c5b9cb20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:51=E5=AF=AB=E9=81=93=EF=BC=9A

> The xie CSR appears hardwired to zero in CLIC mode, replaced by separate
> memory-mapped interrupt enables (clicintie[i]). Writes to xie will be
> ignored and will not trap (i.e., no access faults).
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/csr.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4c31364967..74bc7a08aa 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -23,6 +23,10 @@
>  #include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
>
> +#if !defined(CONFIG_USER_ONLY)
> +#include "hw/intc/riscv_clic.h"
> +#endif
> +
>  /* CSR function table public API */
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
>  {
> @@ -611,13 +615,17 @@ static int write_mideleg(CPURISCVState *env, int
> csrno, target_ulong val)
>
>  static int read_mie(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> -    *val =3D env->mie;
> +    /* The xie CSR appears hardwired to zero in CLIC mode, (Section 4.3)
> */
> +    *val =3D riscv_clic_is_clic_mode(env) ? 0 : env->mie;
>      return 0;
>  }
>
>  static int write_mie(CPURISCVState *env, int csrno, target_ulong val)
>  {
> -    env->mie =3D (env->mie & ~all_ints) | (val & all_ints);
> +    /* Writes to xie will be ignored and will not trap. (Section 4.3) */
> +    if (!riscv_clic_is_clic_mode(env)) {
> +        env->mie =3D (env->mie & ~all_ints) | (val & all_ints);
> +    }
>      return 0;
>  }
>
> @@ -785,7 +793,8 @@ static int read_sie(CPURISCVState *env, int csrno,
> target_ulong *val)
>      if (riscv_cpu_virt_enabled(env)) {
>          read_vsie(env, CSR_VSIE, val);
>      } else {
> -        *val =3D env->mie & env->mideleg;
> +        /* The xie CSR appears hardwired to zero in CLIC mode. (Section
> 4.3) */
> +        *val =3D riscv_clic_is_clic_mode(env) ? 0 : env->mie & env->mide=
leg;
>      }
>      return 0;
>  }
> @@ -805,6 +814,10 @@ static int write_sie(CPURISCVState *env, int csrno,
> target_ulong val)
>      } else {
>          target_ulong newval =3D (env->mie & ~S_MODE_INTERRUPTS) |
>                                (val & S_MODE_INTERRUPTS);
> +        /* Writes to xie will be ignored and will not trap. (Section 4.3=
)
> */
> +        if (riscv_clic_is_clic_mode(env)) {
> +            return 0;
>
+        }
>

Minor:
This one can be omitted as write_sie() will eventually call write_mie().

Anyway,
Reviewed-by: Frank Chang <frank.chang@sifive.com>


>          write_mie(env, CSR_MIE, newval);
>      }
>
> --
> 2.25.1
>
>
>

--000000000000c5813805c5b9cb20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:51=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The xie CSR appears hardwired to zero in CLIC mode, re=
placed by separate<br>
memory-mapped interrupt enables (clicintie[i]). Writes to xie will be<br>
ignored and will not trap (i.e., no access faults).<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/csr.c | 19 ++++++++++++++++---<br>
=C2=A01 file changed, 16 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 4c31364967..74bc7a08aa 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -23,6 +23,10 @@<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
<br>
+#if !defined(CONFIG_USER_ONLY)<br>
+#include &quot;hw/intc/riscv_clic.h&quot;<br>
+#endif<br>
+<br>
=C2=A0/* CSR function table public API */<br>
=C2=A0void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)<br>
=C2=A0{<br>
@@ -611,13 +615,17 @@ static int write_mideleg(CPURISCVState *env, int csrn=
o, target_ulong val)<br>
<br>
=C2=A0static int read_mie(CPURISCVState *env, int csrno, target_ulong *val)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 *val =3D env-&gt;mie;<br>
+=C2=A0 =C2=A0 /* The xie CSR appears hardwired to zero in CLIC mode, (Sect=
ion 4.3) */<br>
+=C2=A0 =C2=A0 *val =3D riscv_clic_is_clic_mode(env) ? 0 : env-&gt;mie;<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int write_mie(CPURISCVState *env, int csrno, target_ulong val)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 env-&gt;mie =3D (env-&gt;mie &amp; ~all_ints) | (val &amp; a=
ll_ints);<br>
+=C2=A0 =C2=A0 /* Writes to xie will be ignored and will not trap. (Section=
 4.3) */<br>
+=C2=A0 =C2=A0 if (!riscv_clic_is_clic_mode(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mie =3D (env-&gt;mie &amp; ~all_ints) =
| (val &amp; all_ints);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
@@ -785,7 +793,8 @@ static int read_sie(CPURISCVState *env, int csrno, targ=
et_ulong *val)<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_cpu_virt_enabled(env)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_vsie(env, CSR_VSIE, val);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D env-&gt;mie &amp; env-&gt;mideleg;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The xie CSR appears hardwired to zero in CL=
IC mode. (Section 4.3) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D riscv_clic_is_clic_mode(env) ? 0 : en=
v-&gt;mie &amp; env-&gt;mideleg;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
@@ -805,6 +814,10 @@ static int write_sie(CPURISCVState *env, int csrno, ta=
rget_ulong val)<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong newval =3D (env-&gt;mie &amp=
; ~S_MODE_INTERRUPTS) |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(val &amp; S_MODE_INTERRUPTS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Writes to xie will be ignored and will not =
trap. (Section 4.3) */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_is_clic_mode(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br></blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<=
br></blockquote><div><br></div><div>Minor:</div><div>This one can be omitte=
d as write_sie() will eventually call write_mie().</div><div><br></div><div=
>Anyway,</div><div>Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.cha=
ng@sifive.com">frank.chang@sifive.com</a>&gt;</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mie(env, CSR_MIE, newval);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000c5813805c5b9cb20--

