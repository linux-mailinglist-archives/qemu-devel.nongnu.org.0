Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2D53B5340
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 14:09:54 +0200 (CEST)
Received: from localhost ([::1]:50882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxTbl-00027F-T8
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 08:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxTae-0001JC-Ei
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 08:08:44 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lxTac-0006tM-Av
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 08:08:44 -0400
Received: by mail-pl1-x629.google.com with SMTP id m17so7268925plx.7
 for <qemu-devel@nongnu.org>; Sun, 27 Jun 2021 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=529Jg8diNjCqAYKwfg5t1RSS4KtlY7q1QmMjZ6EDDWc=;
 b=U8/pR4qN034njtlKpBkdXDTLm7E5wE9MFWJG8WI0KbcAIkiz3xz1RKiOAj855kUXJ9
 5cFnzsbzP8p4IMSonkzXtaLamfWxhNCXlysBVR5/YxTeK/NytfPCSJ77Y3eafMe1SSz+
 fQ9A0hJhnijYWolWDW9xa0E4W/1S87fpbnrNtRSgg1B56xbxq8FdaIY/2QMfuJ0FGiUW
 0lOyCI/F+fG5+56fn6E/O7KB/QJsBqB8aZ4wJor9E5q5ovTJFNcoBbMMuVzMO5v67XK9
 tRvX8QrVhZ4E9rMOPhpkgVXqb2fihMeKgkmeES4AEJ9CdzotP1daeqHT5o7pr8ywJ4WI
 ePOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=529Jg8diNjCqAYKwfg5t1RSS4KtlY7q1QmMjZ6EDDWc=;
 b=ABnk3UyxNr8TPt2oUKwp46C0TCur9IAN88rW2Ud9qijDQqGSUQUqSIKN9K161N1eSL
 KzvOgI3jRCAm/RWLzXvOenQan0dJiH8+maenzWIJ6WW69D9zTrwX4AkPrxiRwm4NDPJa
 l8fkDsPcWlZbVDFP6t+YplXGZ9hmCpA6ZL2QDnd1jQ9gTYoHxZNmkKxCyip1WpfLsOak
 5QIg9NUIWrXdV/b8Sedvk40j/v70FADtbHZT5AZ/Ww25LDGpgySpklJOiati1M5RpSyt
 9FUXV8w0RDvlyDIjzeotbLx54w8hs7xmzhl2NrW7Oe6pOPXiPjSPSXBIP7+IAJtxU1xf
 OzVA==
X-Gm-Message-State: AOAM533lHBLvnq05RxL+kRTyPSMXWELh/mXP23769beeor8oqnjt9upp
 MecXKDwzxI8o2HQ3cbgzDA8PURiHYtAtp19B
X-Google-Smtp-Source: ABdhPJxWMHWSS7oIdS+GU3/ugop5+Md0XtTLJLDdveGOxAS8HovrgoIOrqK9OZds1duG0V5RK85ndg==
X-Received: by 2002:a17:90a:1b25:: with SMTP id
 q34mr31195217pjq.163.1624795720871; 
 Sun, 27 Jun 2021 05:08:40 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com.
 [209.85.214.177])
 by smtp.gmail.com with ESMTPSA id c5sm10660801pfv.47.2021.06.27.05.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 05:08:40 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id c15so7261328pls.13;
 Sun, 27 Jun 2021 05:08:40 -0700 (PDT)
X-Received: by 2002:a17:90a:9302:: with SMTP id
 p2mr21364671pjo.202.1624795720202; 
 Sun, 27 Jun 2021 05:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210409074857.166082-1-zhiwei_liu@c-sky.com>
 <20210409074857.166082-12-zhiwei_liu@c-sky.com>
In-Reply-To: <20210409074857.166082-12-zhiwei_liu@c-sky.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Sun, 27 Jun 2021 20:08:29 +0800
X-Gmail-Original-Message-ID: <CANzO1D3oQJHHDzXgFN6yb3xsp=WrVwohmkNAG01W+HGVnCCZZA@mail.gmail.com>
Message-ID: <CANzO1D3oQJHHDzXgFN6yb3xsp=WrVwohmkNAG01W+HGVnCCZZA@mail.gmail.com>
Subject: Re: [RFC PATCH 11/11] target/riscv: Update interrupt return in CLIC
 mode
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: multipart/alternative; boundary="000000000000bc3d7d05c5be3b77"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
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

--000000000000bc3d7d05c5be3b77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LIU Zhiwei <zhiwei_liu@c-sky.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:55=E5=AF=AB=E9=81=93=EF=BC=9A

> When a vectored interrupt is selected and serviced, the hardware will
> automatically clear the corresponding pending bit in edge-triggered mode.
> This may lead to a lower priviledge interrupt pending forever.
>
> Therefore when interrupts return, pull a pending interrupt to service.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/op_helper.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 1eddcb94de..42563b22ba 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -24,6 +24,10 @@
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
>
> +#if !defined(CONFIG_USER_ONLY)
> +#include "hw/intc/riscv_clic.h"
> +#endif
> +
>  /* Exceptions processing helpers */
>  void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
>                                            uint32_t exception, uintptr_t
> pc)
> @@ -130,6 +134,17 @@ target_ulong helper_sret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
>          mstatus =3D set_field(mstatus, MSTATUS_SPIE, 1);
>          mstatus =3D set_field(mstatus, MSTATUS_SPP, PRV_U);
>          env->mstatus =3D mstatus;
> +
> +        if (riscv_clic_is_clic_mode(env)) {
> +            CPUState *cs =3D env_cpu(env);
> +            target_ulong spil =3D get_field(env->scause, SCAUSE_SPIL);
> +            env->mintstatus =3D set_field(env->mintstatus, MINTSTATUS_SI=
L,
> spil);
> +            env->scause =3D set_field(env->scause, SCAUSE_SPIE, 0);
>

Should scause.spie set to 1?


> +            env->scause =3D set_field(env->scause, SCAUSE_SPP, PRV_U);
> +            qemu_mutex_lock_iothread();
> +            riscv_clic_get_next_interrupt(env->clic, cs->cpu_index);
> +            qemu_mutex_unlock_iothread();
> +        }
>      }
>
>      riscv_cpu_set_mode(env, prev_priv);
> @@ -172,6 +187,16 @@ target_ulong helper_mret(CPURISCVState *env,
> target_ulong cpu_pc_deb)
>          riscv_cpu_set_virt_enabled(env, prev_virt);
>      }
>
> +    if (riscv_clic_is_clic_mode(env)) {
> +        CPUState *cs =3D env_cpu(env);
> +        target_ulong mpil =3D get_field(env->mcause, MCAUSE_MPIL);
> +        env->mintstatus =3D set_field(env->mintstatus, MINTSTATUS_MIL,
> mpil);
> +        env->mcause =3D set_field(env->mcause, MCAUSE_MPIE, 0);
>

Should mcause.mpie set to 1?
  The xcause.xpp and xcause.xpie fields are modified following the behavior
  previously defined for xstatus.xpp and xstatus.xpie respectively.

RISC-V Privilege spec:
  When executing an xRET instruction, xPIE is set to 1.

Regards,
Frank Chang


> +        env->mcause =3D set_field(env->mcause, MCAUSE_MPP, PRV_U);
> +        qemu_mutex_lock_iothread();
> +        riscv_clic_get_next_interrupt(env->clic, cs->cpu_index);
> +        qemu_mutex_unlock_iothread();
> +    }
>      return retpc;
>  }
>
> --
> 2.25.1
>
>
>

--000000000000bc3d7d05c5be3b77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_l=
iu@c-sky.com">zhiwei_liu@c-sky.com</a>&gt; =E6=96=BC 2021=E5=B9=B44=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:55=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">When a vectored interrupt is selected and serviced, th=
e hardware will<br>
automatically clear the corresponding pending bit in edge-triggered mode.<b=
r>
This may lead to a lower priviledge interrupt pending forever.<br>
<br>
Therefore when interrupts return, pull a pending interrupt to service.<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/op_helper.c | 25 +++++++++++++++++++++++++<br>
=C2=A01 file changed, 25 insertions(+)<br>
<br>
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c<br>
index 1eddcb94de..42563b22ba 100644<br>
--- a/target/riscv/op_helper.c<br>
+++ b/target/riscv/op_helper.c<br>
@@ -24,6 +24,10 @@<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;exec/helper-proto.h&quot;<br>
<br>
+#if !defined(CONFIG_USER_ONLY)<br>
+#include &quot;hw/intc/riscv_clic.h&quot;<br>
+#endif<br>
+<br>
=C2=A0/* Exceptions processing helpers */<br>
=C2=A0void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t exception, uintptr_t pc)<br>
@@ -130,6 +134,17 @@ target_ulong helper_sret(CPURISCVState *env, target_ul=
ong cpu_pc_deb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mstatus =3D set_field(mstatus, MSTATUS_SP=
IE, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mstatus =3D set_field(mstatus, MSTATUS_SP=
P, PRV_U);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mstatus =3D mstatus;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_clic_is_clic_mode(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong spil =3D get_field(=
env-&gt;scause, SCAUSE_SPIL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mintstatus =3D set_field=
(env-&gt;mintstatus, MINTSTATUS_SIL, spil);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;scause =3D set_field(env=
-&gt;scause, SCAUSE_SPIE, 0);<br></blockquote><div><br></div><div>Should sc=
ause.spie set to 1?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;scause =3D set_field(env=
-&gt;scause, SCAUSE_SPP, PRV_U);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_get_next_interrupt(en=
v-&gt;clic, cs-&gt;cpu_index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0riscv_cpu_set_mode(env, prev_priv);<br>
@@ -172,6 +187,16 @@ target_ulong helper_mret(CPURISCVState *env, target_ul=
ong cpu_pc_deb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_cpu_set_virt_enabled(env, prev_virt=
);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (riscv_clic_is_clic_mode(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ulong mpil =3D get_field(env-&gt;mcause=
, MCAUSE_MPIL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mintstatus =3D set_field(env-&gt;mints=
tatus, MINTSTATUS_MIL, mpil);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mcause =3D set_field(env-&gt;mcause, M=
CAUSE_MPIE, 0);<br></blockquote><div><br></div><div>Should mcause.mpie set =
to 1?</div><div>=C2=A0 The xcause.xpp and xcause.xpie fields are modified f=
ollowing the behavior<br></div><div>=C2=A0 previously defined for xstatus.x=
pp and xstatus.xpie respectively.<br></div><div><br></div><div>RISC-V Privi=
lege spec:</div><div>=C2=A0 When executing an xRET instruction, xPIE is set=
 to 1.<br></div><div><br></div><div>Regards,<br></div><div>Frank Chang</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mcause =3D set_field(env-&gt;mcause, M=
CAUSE_MPP, PRV_U);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock_iothread();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_clic_get_next_interrupt(env-&gt;clic, cs=
-&gt;cpu_index);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock_iothread();<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0return retpc;<br>
=C2=A0}<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000bc3d7d05c5be3b77--

