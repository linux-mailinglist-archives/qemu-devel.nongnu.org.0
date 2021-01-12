Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AFC2F2900
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:35:51 +0100 (CET)
Received: from localhost ([::1]:53054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzEDW-0004KG-4n
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzEBn-0003jb-3i; Tue, 12 Jan 2021 02:34:03 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54816
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzEBl-0005sJ-CU; Tue, 12 Jan 2021 02:34:02 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id A13DC5FCEF;
 Tue, 12 Jan 2021 08:33:58 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 16/18] target/arm: add ARMv8.4-SEL2 extension
Date: Tue, 12 Jan 2021 09:33:58 +0200
Message-ID: <4284205.LvFx2qVVIh@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <4e32ca89-51aa-85d1-0a8f-e9aa7e037be4@linaro.org>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-16-remi.denis.courmont@huawei.com>
 <4e32ca89-51aa-85d1-0a8f-e9aa7e037be4@linaro.org>
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

Le tiistaina 12. tammikuuta 2021, 2.13.29 EET Richard Henderson a =C3=A9cri=
t :
> On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> > @@ -3297,7 +3301,7 @@ typedef ARMCPU ArchCPU;
> >=20
> >   * We put flags which are shared between 32 and 64 bit mode at the top
> >   * of the word, and flags which apply to only one mode at the bottom.
> >   *
> >=20
> > - *  31          20    18    14          9              0
> > + *  31          20    19    14          9              0
> >=20
> >   * +--------------+-----+-----+----------+--------------+
> >   * |              |     |   TBFLAG_A32   |              |
> >   * |              |     +-----+----------+  TBFLAG_AM32 |
> >=20
> > @@ -3346,6 +3350,7 @@ FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
> >=20
> >   * the same thing as the current security state of the processor!
> >   */
> > =20
> >  FIELD(TBFLAG_A32, NS, 17, 1)
> >=20
> > +FIELD(TBFLAG_A32, EEL2, 18, 1)
>=20
> Note that via other in-flight patch sets we have run out of bits here.  I=
've
> rearranged them in
>=20
> https://patchew.org/QEMU/20210111190113.303726-1-richard.henderson@linaro=
=2Eor
> g/
>=20
> This should be nothing but a minor confict to fix up.

I think we should get rid of that flag that's hardly if at all ever going t=
o be=20
used. It should be possible to bypass gen_exception*() straight to=20
gen_helper_exception_with_syndrome(), so that the target EL can be computed=
 at=20
run-time.

=2D-=20
R=C3=A9mi Denis-Courmont



