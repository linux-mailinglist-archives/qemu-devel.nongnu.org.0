Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B945A2F28EB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:30:27 +0100 (CET)
Received: from localhost ([::1]:47888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzE8I-0001rQ-4A
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzE66-0001Ht-37; Tue, 12 Jan 2021 02:28:11 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54768
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzE5y-0003rw-CI; Tue, 12 Jan 2021 02:28:08 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 7CAC75FCEF;
 Tue, 12 Jan 2021 08:27:57 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 14/18] target/arm: secure stage 2 translation regime
Date: Tue, 12 Jan 2021 09:27:54 +0200
Message-ID: <11670958.O9o76ZdvQC@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <785079cf-fb1f-a380-00bc-783126090a07@linaro.org>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-14-remi.denis.courmont@huawei.com>
 <785079cf-fb1f-a380-00bc-783126090a07@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le tiistaina 12. tammikuuta 2021, 2.19.55 EET Richard Henderson a =C3=A9cri=
t :
> On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> > @@ -11286,8 +11299,10 @@ static bool get_phys_addr_lpae(CPUARMState *en=
v,
> > uint64_t address,>=20
> >      ap =3D extract32(attrs, 4, 2);
> >=20
> > -    if (mmu_idx =3D=3D ARMMMUIdx_Stage2) {
> > -        ns =3D true;
> > +    if (mmu_idx =3D=3D ARMMMUIdx_Stage2 || mmu_idx =3D=3D ARMMMUIdx_St=
age2_S) {
> > +        if (mmu_idx =3D=3D ARMMMUIdx_Stage2) {
> > +            ns =3D true;
> > +        }
> >=20
> >          xn =3D extract32(attrs, 11, 2);
>=20
> Does this want an unconditional
>=20
>   ns =3D mmu_idx =3D=3D ARMMMUIdx_Stage2;
>=20
> When can ns be true and mmu_idx =3D=3D ARMMMUIdx_Stage2_S?

Actually there's a bug. ns is not set at all in secure state 2.

=2D-=20
R=C3=A9mi Denis-Courmont



