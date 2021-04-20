Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D8A365A68
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:44:54 +0200 (CEST)
Received: from localhost ([::1]:45754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYqgO-0008Pk-RP
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1lYqdz-00074i-09; Tue, 20 Apr 2021 09:42:23 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60768
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1lYqds-00022S-V8; Tue, 20 Apr 2021 09:42:22 -0400
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id ABECA5FAC1;
 Tue, 20 Apr 2021 15:42:09 +0200 (CEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/arm: Flush correct TLBs in tlbi_aa64_vae2is_write()
Date: Tue, 20 Apr 2021 16:42:05 +0300
Message-ID: <4341655.kkdRbAU0bc@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20210420123106.10861-1-peter.maydell@linaro.org>
References: <20210420123106.10861-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le tiistaina 20. huhtikuuta 2021, 15.31.06 EEST Peter Maydell a =C3=A9crit :
> In tlbi_aa64_vae2is_write() the calculation
>   bits =3D tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,
>                             pageaddr)
>=20
> has the two arms of the ?: expression reversed. Fix the bug.
>=20
> Fixes: b6ad6062f1e5
> Reported-by: Rebecca Cran <rebecca@nuviainc.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d9220be7c5a..957f4247010 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4742,7 +4742,7 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env,
> const ARMCPRegInfo *ri, uint64_t pageaddr =3D sextract64(value << 12, 0, =
56);
>      bool secure =3D arm_is_secure_below_el3(env);
>      int mask =3D secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
> -    int bits =3D tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 :
> ARMMMUIdx_SE2, +    int bits =3D tlbbits_for_regime(env, secure ?
> ARMMMUIdx_SE2 : ARMMMUIdx_E2, pageaddr);
>=20
>      tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask,
> bits);

Reviewed-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>

=2D-=20
R=C3=A9mi Denis-Courmont
http://www.remlab.net/




