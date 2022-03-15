Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CF84D9E57
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:07:53 +0100 (CET)
Received: from localhost ([::1]:48196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU8m8-0005FJ-Bx
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:07:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1nU8l4-0004HI-7Q; Tue, 15 Mar 2022 11:06:46 -0400
Received: from vps-a2bccee9.vps.ovh.net ([51.75.19.47]:50262
 helo=ursule.remlab.net) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1nU8l2-0005XU-6b; Tue, 15 Mar 2022 11:06:45 -0400
Received: from ursule.remlab.net (localhost [IPv6:::1])
 by ursule.remlab.net (Postfix) with ESMTP id 8FD3EC0233;
 Tue, 15 Mar 2022 17:06:40 +0200 (EET)
Received: from basile.remlab.net ([2001:14ba:a080:a501:23a6:ebae:8f2a:4d73])
 by ursule.remlab.net with ESMTPSA id OpAGIICrMGIKLxYAwZXkwQ
 (envelope-from <remi@remlab.net>); Tue, 15 Mar 2022 17:06:40 +0200
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/arm: Fix pauth_check_trap vs SEL2
Date: Tue, 15 Mar 2022 17:06:40 +0200
Message-ID: <2620199.mvXUDI8C0e@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20220315021205.342768-1-richard.henderson@linaro.org>
References: <20220315021205.342768-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le tiistaina 15. maaliskuuta 2022, 4.12.05 EET Richard Henderson a =C3=A9cr=
it :
> When arm_is_el2_enabled was introduced, we missed
> updating pauth_check_trap.
>=20
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/788
> Fixes: e6ef0169264b ("target/arm: use arm_is_el2_enabled() where
> applicable") Signed-off-by: Richard Henderson
> <richard.henderson@linaro.org>
> ---
>  target/arm/pauth_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index cd6df18150..739aa520dd 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -390,7 +390,7 @@ static void QEMU_NORETURN pauth_trap(CPUARMState *env,
> int target_el,
>=20
>  static void pauth_check_trap(CPUARMState *env, int el, uintptr_t ra)
>  {
> -    if (el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
> +    if (el < 2 && arm_is_el2_enabled(env)) {
>          uint64_t hcr =3D arm_hcr_el2_eff(env);
>          bool trap =3D !(hcr & HCR_API);
>          if (el =3D=3D 0) {

Ack.

=2D-=20
R=C3=A9mi Denis-Courmont
http://www.remlab.net/




