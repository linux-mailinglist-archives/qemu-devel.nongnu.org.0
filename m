Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963562F4C12
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:14:01 +0100 (CET)
Received: from localhost ([::1]:37482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzfyK-0002MU-LA
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzfwd-0001ja-4y; Wed, 13 Jan 2021 08:12:15 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:45692
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzfwZ-0005TT-H6; Wed, 13 Jan 2021 08:12:14 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id B855C5FC25;
 Wed, 13 Jan 2021 14:12:05 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 17/19] target/arm: add ARMv8.4-SEL2 extension
Date: Wed, 13 Jan 2021 15:12:04 +0200
Message-ID: <4284476.LvFx2qVVIh@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <6ffaca60-2fa0-ac7d-b430-0bbaee18b25a@linaro.org>
References: <12681824.uLZWGnKmhe@basile.remlab.net>
 <20210112104511.36576-17-remi.denis.courmont@huawei.com>
 <6ffaca60-2fa0-ac7d-b430-0bbaee18b25a@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le tiistaina 12. tammikuuta 2021, 23.30.39 EET Richard Henderson a =C3=A9cr=
it :
> On 1/12/21 12:45 AM, remi.denis.courmont@huawei.com wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >=20
> > This adds handling for the SCR_EL3.EEL2 bit.
> >=20
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
>=20
> The patch title seems to have gone awry.
>=20
> > @@ -2832,9 +2832,19 @@ static bool msr_banked_access_decode
> >=20
> >          }
> >          if (s->current_el =3D=3D 1) {
> >         =20
> >              /* If we're in Secure EL1 (which implies that EL3 is AArch=
64)
> >=20
> > -             * then accesses to Mon registers trap to EL3
> > +             * then accesses to Mon registers trap to Secure EL2, if it
> > exists, +             * otherwise EL3.
> >=20
> >               */
> >=20
> > -            TCGv_i32 tcg_el =3D tcg_const_i32(3);
> > +            TCGv_i32 tcg_el;
> > +
> > +            if (dc_isar_feature(aa64_sel2, s)) {
> > +                /* Target EL is EL<3 minus SCR_EL3.EEL2> */
> > +                tcg_el =3D load_cpu_field(cp15.scr_el3);
> > +                tcg_gen_sextract_i32(tcg_el, tcg_el, ctz32(SCR_EEL2), =
1);
> > +                tcg_gen_addi_i32(tcg_el, tcg_el, 3);
> > +            } else {
> > +                tcg_el =3D tcg_const_i32(3);
> > +            }
>=20
> You can't test an aa64 feature without verifying that the cpu has aa64
> support (if the cpu is strictly aa32, the aa64 registers are
> undefined/uninitialized).  So:
>=20
>     if (arm_dc_feature(s, ARM_FEATURE_AARCH64) &&
>         dc_isar_feature(aa64_sel2, s)) {
>         ...
>=20

Hmm, yeah. Should this be an ifdef on TARGET_AARCH64 instead?

Also do we need to revector the exception code, or leave it mostly duplicat=
ed=20
as is?


> With those things changed,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
>=20
> r~


=2D-=20
R=C3=A9mi Denis-Courmont



