Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1F2E7F24
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 10:56:49 +0100 (CET)
Received: from localhost ([::1]:49072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuuhL-0007Bq-TN
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 04:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kuugb-0006dW-6o; Thu, 31 Dec 2020 04:56:01 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:45296
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kuugZ-0003rD-4e; Thu, 31 Dec 2020 04:56:00 -0500
Received: from philogene.localnet (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 211115FAD0;
 Thu, 31 Dec 2020 10:55:51 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 1/3] target/arm: keep translation start level unsigned
Date: Thu, 31 Dec 2020 11:55:50 +0200
Message-ID: <3026104.eZJBrJkB2l@philogene>
Organization: Remlab Tmi
In-Reply-To: <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <20201218143321.102872-1-remi.denis.courmont@huawei.com>
 <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 remi.denis.courmont@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le jeudi 31 d=E9cembre 2020, 00:10:09 EET Richard Henderson a =E9crit :
> On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
> > From: R=E9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >=20
> > Signed-off-by: R=E9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> > ---
> >=20
> >  target/arm/helper.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> The patch does more than what is described above.

No? It removes generating negative values, and handling them, for translati=
on=20
levels.

> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index df195c314c..b927e53ab0 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> >=20
> > @@ -10821,17 +10821,12 @@ do_fault:
> >   * Returns true if the suggested S2 translation parameters are OK and
> >   * false otherwise.
> >   */
> >=20
> > -static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
> > +static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t lev=
el,
> >=20
> >                                 int inputsize, int stride)
> > =20
> >  {
> > =20
> >      const int grainsize =3D stride + 3;
> >      int startsizecheck;
> >=20
> > -    /* Negative levels are never allowed.  */
> > -    if (level < 0) {
> > -        return false;
> > -    }
> > -
>=20
> I would expect this to be the only hunk from the patch description.=20
> Probably changing this negative check to a >=3D 3 check.

You could do that but you'd end up relying on implicity conversion from sig=
ned=20
to unsigned negative. That seems needlessly confusing to me in this case,=20
considering that (positive) values larger than 3 cannot actually happen.

>=20
> r~
>=20
> >      startsizecheck =3D inputsize - ((3 - level) * stride + grainsize);
> >      if (startsizecheck < 1 || startsizecheck > stride + 4) {
> >     =20
> >          return false;
> >=20
> > @@ -10856,6 +10851,9 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool
> > is_aa64, int level,>=20
> >              if (level =3D=3D 0 && pamax <=3D 42) {
> >             =20
> >                  return false;
> >             =20
> >              }
> >=20
> > +            if (level =3D=3D 3) {
> > +                return false;
> > +            }
> >=20
> >              break;
> >         =20
> >          default:
> >              g_assert_not_reached();
> >=20
> > @@ -10871,7 +10869,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool
> > is_aa64, int level,>=20
> >          /* AArch32 only supports 4KB pages. Assert on that.  */
> >          assert(stride =3D=3D 9);
> >=20
> > -        if (level =3D=3D 0) {
> > +        if (level =3D=3D 0 || level >=3D 3) {
> >=20
> >              return false;
> >         =20
> >          }
> >     =20
> >      }
> >=20
> > @@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *env,
> > uint64_t address,>=20
> >          if (!aarch64 || stride =3D=3D 9) {
> >         =20
> >              /* AArch32 or 4KB pages */
> >=20
> > -            startlevel =3D 2 - sl0;
> > +            startlevel =3D (2 - sl0) & 3;
> >=20
> >          } else {
> >         =20
> >              /* 16KB or 64KB pages */
> >              startlevel =3D 3 - sl0;


=2D-=20
R=E9mi Denis-Courmont



