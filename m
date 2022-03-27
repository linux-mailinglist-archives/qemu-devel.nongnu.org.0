Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B3F4E8812
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 16:26:27 +0200 (CEST)
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYTqb-0005P3-Iz
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 10:26:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1nYTos-0003nK-JU; Sun, 27 Mar 2022 10:24:38 -0400
Received: from vps-a2bccee9.vps.ovh.net ([51.75.19.47]:48212
 helo=ursule.remlab.net) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1nYTon-0004w2-KY; Sun, 27 Mar 2022 10:24:38 -0400
Received: from ursule.remlab.net (localhost [IPv6:::1])
 by ursule.remlab.net (Postfix) with ESMTP id EFF77C0231;
 Sun, 27 Mar 2022 17:24:29 +0300 (EEST)
Received: from basile.remlab.net ([2001:14ba:a080:a501:23a6:ebae:8f2a:4d73])
 by ursule.remlab.net with ESMTPSA id PtUAOJ1zQGIZqRwAwZXkwQ
 (envelope-from <remi@remlab.net>); Sun, 27 Mar 2022 17:24:29 +0300
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 1/3] target/arm: Check VSTCR.SW when assigning the stage 2
 output PA space
Date: Sun, 27 Mar 2022 17:24:29 +0300
Message-ID: <5551410.DvuYhMxLoT@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20220327093427.1548629-2-idan.horowitz@gmail.com>
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-2-idan.horowitz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=51.75.19.47; envelope-from=remi@remlab.net;
 helo=ursule.remlab.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le sunnuntaina 27. maaliskuuta 2022, 12.34.26 EEST Idan Horowitz a =C3=A9cr=
it :
> As per the AArch64.SS2OutputPASpace() psuedo-code in the ARMv8 ARM when t=
he
> PA space of the IPA is non secure, the output PA space is secure if and o=
nly
> if all of the bits VTCR.<NSW, NSA>, VSTCR.<SW, SA> are not set.
>=20
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 812ca591f4..d0265b760f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -12697,7 +12697,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong
> address, } else {
>                      attrs->secure =3D
>                          !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA |
> VTCR_NSW)) -                        || (env->cp15.vstcr_el2.raw_tcr &
> VSTCR_SA)); +                        || (env->cp15.vstcr_el2.raw_tcr &
> (VSTCR_SA | VSTCR_SW))); }

The VTCR_EL2 specification says that the NSA bit "behaves as 1 for all purp=
oses=20
other than reading back the value of the bit when one of the following is t=
rue=20
(...)
* The value of VTCR_EL2.NSW is 1.
* The value of VSTCR_EL2.SA is 1."

Sorry but I don't see any reason to check the SW bit here.

=2D-=20
=D0=A0=D0=B5=D0=BC=D0=B8 =D0=94=D1=91=D0=BD=D0=B8-=D0=9A=D1=83=D1=80=D0=BC=
=D0=BE=D0=BD
http://www.remlab.net/




