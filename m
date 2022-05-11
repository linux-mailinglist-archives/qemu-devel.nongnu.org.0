Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7C852307E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 12:14:20 +0200 (CEST)
Received: from localhost ([::1]:49620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nojMJ-0007cl-JF
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 06:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1nojKS-0005pP-1h; Wed, 11 May 2022 06:12:24 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rashmica.g@gmail.com>)
 id 1nojKQ-0007Fa-BA; Wed, 11 May 2022 06:12:23 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i24so1565827pfa.7;
 Wed, 11 May 2022 03:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version;
 bh=kyMmBz10AVukZ+GG5AxhZ1o/FnDVPx4r80kNawsr/pE=;
 b=F8wXf/5uz/MelO56Qtiv2HWne7Bad2cXJhh5wUoXW7GbQcXMDbxHBJndv/7pOT6MnQ
 tGGjFOZ/THeo8iqSH86Tc6c/6eUX7Eb04gtZ9+BGwxQljZ6Y7KXb7PVllkDUTdbHURPU
 2w2JhTbOAPxpI7gtrR9tQUXdUAv80mUoHlGDsG33C8BVLY1y8O9umd6rvybbmwnwwxht
 645HM5qga8ueUKnaQwu34FRAjDH9jhXIy/+Ic63Batu0oaXoe+yo4H1TeBXQzbC/yFIZ
 +8q9Y7kFZAIFjAG2Ka0c6CRdYQx1xxZWlxfH8t/LFWvqwE9t5Z/q2jeHAiY9CA1nb66k
 HN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version;
 bh=kyMmBz10AVukZ+GG5AxhZ1o/FnDVPx4r80kNawsr/pE=;
 b=jIjExO52AxI+DoJ8qAz/g3IlZ4QyvH54syPt29+W9tvjApHWRn0z0R7jYG0WCwr14S
 /xcUkXtbiAe0EYX1ITFG9fQYLj4nYDDCDbVyEB8TgBAMrdm/g6OvqhvmiuxoVfLjwj9x
 G/LfYyipZweKtC7bphDnUutdPAYHZaJs8S/szoLoptUhL8xCGCQBvUmLmh6EL1XRDVz2
 1Qf1v5D+OoUimJQO7NDtm4iuqgSpadW0dFjfnnVRYOWRzLEw5/AkxF5uDdlbqSyguPFx
 VDu7wWOAfPMEhQvvknxBztKPybl1TKtYHA5rrrbDubG4XHJglTOWnC5Jcz7K/D9CcIZA
 wIag==
X-Gm-Message-State: AOAM531Mvk5AQTxcJLFM1olJ04XH6w6YR5rvM9q+gV1YSthV/IvZV0cG
 BmASlj5kD6WTFQhmVHTnsLE=
X-Google-Smtp-Source: ABdhPJyi5svuAeNYksWUmaFOBehiQ4WwFaiRaSHppSpxGbGWvDxusnN78CyGdZXZYwlaSEz1yqiwAg==
X-Received: by 2002:a05:6a00:124f:b0:510:7d6d:ecb2 with SMTP id
 u15-20020a056a00124f00b005107d6decb2mr24273362pfi.82.1652263940563; 
 Wed, 11 May 2022 03:12:20 -0700 (PDT)
Received: from [10.0.30.13] (116-255-17-40.ip4.superloop.com. [116.255.17.40])
 by smtp.googlemail.com with ESMTPSA id
 d8-20020aa797a8000000b0050dc76281f8sm1284437pfq.210.2022.05.11.03.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 03:12:19 -0700 (PDT)
Message-ID: <457382f10aac806ede80ffa013f9fbf3e263c075.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] target/ppc: Fix FPSCR.FI changing in
 float_overflow_excp()
From: Rashmica Gupta <rashmica.g@gmail.com>
To: =?ISO-8859-1?Q?V=EDctor?= Colombo <victor.colombo@eldorado.org.br>, 
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au, 
 groug@kaod.org, richard.henderson@linaro.org
Date: Wed, 11 May 2022 20:12:14 +1000
In-Reply-To: <20220510204610.100867-3-victor.colombo@eldorado.org.br>
References: <20220510204610.100867-1-victor.colombo@eldorado.org.br>
 <20220510204610.100867-3-victor.colombo@eldorado.org.br>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-SW7EEqZecVdz0fOIs5s7"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=rashmica.g@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--=-SW7EEqZecVdz0fOIs5s7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-05-10 at 17:46 -0300, V=C3=ADctor Colombo wrote:
> This patch fixes another not-so-clear situation in Power ISA
> regarding the inexact bits in FPSCR. The ISA states that:
>=20
> """
> When Overflow Exception is disabled (OE=3D0) and an
> Overflow Exception occurs, the following actions are
> taken:
> ...
> 2. Inexact Exception is set
> XX <- 1
> ...
> FI is set to 1
> ...
> """
>=20
> However, when tested on a Power 9 hardware, some instructions that
> trigger an OX don't set the FI bit:
>=20
> xvcvdpsp(0x4050533fcdb7b95ff8d561c40bf90996) =3D FI: CLEARED -> CLEARED
> xvnmsubmsp(0xf3c0c1fc8f3230, 0xbeaab9c5) =3D FI: CLEARED -> CLEARED
> (just a few examples. Other instructions are also affected)

I agree that the ISA could be clearer. These instructions are actually
listed in '7.4.3 Floating-Point Overflow Exception' as instructions
that don't modify FR, FI and FPRF. It would be ideal if the ISA
mentioned that there were exceptions in the part that you quoted!

This patch makes sense to me.

Reviewed-by: Rashmica Gupta <rashmica.g@gmail.com>

>=20
> The root cause for this seems to be that only instructions that list
> the bit FI in the "Special Registers Altered" should modify it.
>=20
> QEMU is, today, not working like the hardware:
>=20
> xvcvdpsp(0x4050533fcdb7b95ff8d561c40bf90996) =3D FI: CLEARED -> SET
> xvnmsubmsp(0xf3c0c1fc8f3230, 0xbeaab9c5) =3D FI: CLEARED -> SET
>=20
> (all tests assume FI is cleared beforehand)
>=20
> Fix this by making float_overflow_excp() return float_flag_inexact
> if it should update the inexact flags.
>=20
> Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
>=20
> ---
>=20
> v2:
> - remove the setting of FI from float_overflow_excp, making
> =C2=A0 do_float_check_status() the only responsible for it.
> - make float_overflow_excp() return float_flag_inexact if it should
> =C2=A0 update the inexact flags.
> ---
> =C2=A0target/ppc/fpu_helper.c | 13 +++++++------
> =C2=A01 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index f1ea4aa10e..88f9e756a5 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -329,24 +329,25 @@ static inline void
> float_zero_divide_excp(CPUPPCState *env, uintptr_t raddr)
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> -static inline void float_overflow_excp(CPUPPCState *env)
> +static inline int float_overflow_excp(CPUPPCState *env)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 CPUState *cs =3D env_cpu(env);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 env->fpscr |=3D FP_OX;
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Update the floating-point exception summary *=
/
> =C2=A0=C2=A0=C2=A0=C2=A0 env->fpscr |=3D FP_FX;
> -=C2=A0=C2=A0=C2=A0 if (env->fpscr & FP_OE) {
> +
> +=C2=A0=C2=A0=C2=A0 bool overflow_enabled =3D !!(env->fpscr & FP_OE);
> +=C2=A0=C2=A0=C2=A0 if (overflow_enabled) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* XXX: should adjust th=
e result */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Update the floating-p=
oint enabled exception summary */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env->fpscr |=3D FP_FEX;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We must update the ta=
rget FPR before raising the
> exception */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cs->exception_index =3D =
POWERPC_EXCP_PROGRAM;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env->error_code =3D POWE=
RPC_EXCP_FP | POWERPC_EXCP_FP_OX;
> -=C2=A0=C2=A0=C2=A0 } else {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env->fpscr |=3D FP_XX;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env->fpscr |=3D FP_FI;
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 return overflow_enabled ? 0 : float_flag_inexact;
> =C2=A0}
> =C2=A0
> =C2=A0static inline void float_underflow_excp(CPUPPCState *env)
> @@ -468,7 +469,7 @@ static void do_float_check_status(CPUPPCState
> *env, bool change_fi,
> =C2=A0=C2=A0=C2=A0=C2=A0 int status =3D get_float_exception_flags(&env->f=
p_status);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if (status & float_flag_overflow) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 float_overflow_excp(env);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status |=3D float_overflow_ex=
cp(env);
> =C2=A0=C2=A0=C2=A0=C2=A0 } else if (status & float_flag_underflow) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 float_underflow_excp(env=
);
> =C2=A0=C2=A0=C2=A0=C2=A0 }


--=-SW7EEqZecVdz0fOIs5s7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEERkA2etWI6dXQfX34cbqTfKjlEScFAmJ7i/4ACgkQcbqTfKjl
ESeEkgf+LMDluHN0mruR5Qvxevc9nl8U/2Af56uL2MFbF6XzMI3snn23Q23iPOM2
jh6nSMThTfioA+6C+a2VxOeAvritcBf6fvUP7ClWFTw8MTBNt47Vkst49VU623Rz
HS3LV2/YfuIPZwsoYyyST9CrThv8oLXtsaWCNxolCQI4eEcD0N2THNnmF4wZQZQi
zw5G6qD/A5QEG16NHAaN8k+9HPGGwxtroZXK2nbNGw6SHwBqq9nldOzTlBvBdr7I
3V3SPEEx+XmjdhvF3TJt+d1GVQQz5inx3EhvP2hr8XM07G0l50zF1ipc8gBiJY5U
d+xzpb3KpFilM4s75y4GqpI/2tvJEw==
=u/Qu
-----END PGP SIGNATURE-----

--=-SW7EEqZecVdz0fOIs5s7--

