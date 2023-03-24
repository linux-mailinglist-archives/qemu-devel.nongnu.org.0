Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7046C8176
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:39:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfd0l-00013o-FU; Fri, 24 Mar 2023 04:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im@samsung.com>)
 id 1pfd0j-00013e-RJ
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:42:57 -0400
Received: from mailout3.samsung.com ([203.254.224.33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im@samsung.com>)
 id 1pfd0Y-0000Yl-Je
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:42:57 -0400
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230324084209epoutp03d32001fd10fceb68bb08c725b0357b83~PTljhwiEx2051220512epoutp03f
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 08:42:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230324084209epoutp03d32001fd10fceb68bb08c725b0357b83~PTljhwiEx2051220512epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1679647329;
 bh=TQiXCxqqyUtk1JKo95SNiZqeM+PnZqK5aryqB3LfRDs=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=Q4GhxAmQpW3GKJdnB8NOtjoSR6k+tiIx3crhkahl7vDhlQ5XJioOjmH2MkhB93Wfp
 pth830tr7nEFUTIYCH4E+QNvUR/3zEOMgEMtTkQniLYKWkp6waO5lGnysReYOtCb0g
 MCtkM1DTdfY3cYGPi4geJ0REw98iIHir7+r9yYTk=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230324084208epcas2p1a0bf4d41a2a107960fffd0df98b7457a~PTli0sfRQ2872428724epcas2p12;
 Fri, 24 Mar 2023 08:42:08 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.69]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4PjbL82Tb4z4x9Q7; Fri, 24 Mar
 2023 08:42:08 +0000 (GMT)
X-AuditID: b6c32a45-8bdf87000001f1e7-d2-641d6260ac1d
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 0A.28.61927.0626D146; Fri, 24 Mar 2023 17:42:08 +0900 (KST)
Mime-Version: 1.0
Subject: RE: [PATCH] vfio/pci: add support for VF token
From: Minwoo Im <minwoo.im@samsung.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: =?UTF-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, SSDR Gost Dev
 <gost.dev@samsung.com>, Klaus Birkelund Jensen <k.jensen@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20230323124610.10a55a29.alex.williamson@redhat.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230324084207epcms2p45c4bb3c4d0081349e3c23c52959d463b@epcms2p4>
Date: Fri, 24 Mar 2023 17:42:07 +0900
X-CMS-MailID: 20230324084207epcms2p45c4bb3c4d0081349e3c23c52959d463b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKKsWRmVeSWpSXmKPExsWy7bCmhW5CkmyKwc3dQhbf/vewWTR072Oz
 uHlgJ5PFycY9rBbHe3ewOLB67D0l7fHk2mYmj/f7rrJ59G1ZxRjAEpVtk5GamJJapJCal5yf
 kpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQO0V0mhLDGnFCgUkFhcrKRvZ1OU
 X1qSqpCRX1xiq5RakJJTYF6gV5yYW1yal66Xl1piZWhgYGQKVJiQnXF6xxHmggU2Fe9eHmBu
 YNxl1cXIySEhYCLx+NYMdhBbSGAHo8SquUldjBwcvAKCEn93CIOEhQXMJW5emccCEhYSkJf4
 8coAIqwp8W73GVYQm01AXaJh6isWEFtEwEDi6+cJTF2MXBzMAgcZJR5fm8AMsYpXYkb7UxYI
 W1pi+/KtjCA2p4CjxOZNc6HiGhI/lvVC1YtK3Fz9lh3Gfn9sPiOELSLReu8sVI2gxIOfu6Hi
 UhL758+FsqslGo4/Y4KwKyR+vX8AVW8u8fv+brCjeQV8JVruPgarZxFQlfgD9YyEgIvEliWf
 weLMAtoSyxa+Zgb5nRno4fW79EFMCQFliSO3WCAq+CQ6Dv9lh/lwx7wnUFuVJT4eOgS1VVJi
 +aXXbBC2h8TUy2cZJzAqzkKE8ywku2Yh7FrAyLyKUSy1oDg3PbXYqMAQHrPJ+bmbGMHpT8t1
 B+Pktx/0DjEycTAeYpTgYFYS4X0XIpsixJuSWFmVWpQfX1Sak1p8iNEU6MuJzFKiyfnABJxX
 Em9oYmlgYmZmaG5kamCuJM4rbXsyWUggPbEkNTs1tSC1CKaPiYNTqoEpmdN8bb2FFt9qjUDH
 64v4z4eWcX3867G04VTiyVReIaOtjef1j85OeblwaqVf2p4HgaukbbpaTxZKJ833/B/+/1d+
 RUdmXfr59yL6mS/dHPitpuwJXaag8+1dRCjPivTjV/dqdwWr/3y0OKjsypG1dxtnaPcs2TpJ
 0PuHxjw2xuhDy5b8jfmdKRlifIL9N+ORuqnb02wqt1vsqTUrZXab4Hr4pWft7NCNadme02In
 z9xoEqwfo5d6PST18CtZZ6FDm65cyZ47zSp4d2CDWpNlsUu00ZF731IkNE/yWDq+sQspnRS7
 r+T8sokW5m4phb6h23ynzbzKdmL+d11G55S83523N9+LuRY5f5NNvboSS3FGoqEWc1FxIgDh
 N7bgCAQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780
References: <20230323124610.10a55a29.alex.williamson@redhat.com>
 <20230320093931.29015496.alex.williamson@redhat.com>
 <20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
 <7db48667-11e2-b806-03f7-eb516a7be157@kaod.org>
 <20230322211945epcms2p4fdcdcfdc3857d2451f24ac229f3992a8@epcms2p4>
 <CGME20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=minwoo.im@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: minwoo.im@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: qemu-devel-bounces+minwoo.im=3Dsamsung.com=40nongnu.org <qemu-devel=
-
> bounces+minwoo.im=3Dsamsung.com=40nongnu.org> On Behalf Of Alex Williamso=
n
> Sent: Friday, March 24, 2023 3:46 AM
> To: Minwoo Im <minwoo.im=40samsung.com>
> Cc: C=C3=A9dric=20Le=20Goater=20<clg=40kaod.org>;=20qemu-devel=40nongnu.o=
rg;=20SSDR=20Gost=20Dev=0D=0A>=20<gost.dev=40samsung.com>;=20Klaus=20Birkel=
und=20Jensen=20<k.jensen=40samsung.com>=0D=0A>=20Subject:=20Re:=20=5BPATCH=
=5D=20vfio/pci:=20add=20support=20for=20VF=20token=0D=0A>=20=0D=0A>=20On=20=
Thu,=2023=20Mar=202023=2006:19:45=20+0900=0D=0A>=20Minwoo=20Im=20<minwoo.im=
=40samsung.com>=20wrote:=0D=0A>=20=0D=0A>=20>=20>=20On=20Mon,=2020=20Mar=20=
2023=2011:03:40=20+0100=0D=0A>=20>=20>=20C=C3=A9dric=20Le=20Goater=20<clg=
=40kaod.org>=20wrote:=0D=0A>=20>=20>=0D=0A>=20>=20>=20>=20On=203/20/23=2008=
:35,=20Minwoo=20Im=20wrote:=0D=0A>=20>=20>=20>=20>=20VF=20token=20was=20int=
roduced=20=5B1=5D=20to=20kernel=20vfio-pci=20along=20with=20SR-IOV=0D=0A>=
=20>=20>=20>=20>=20support=20=5B2=5D.=20=20This=20patch=20adds=20support=20=
VF=20token=20among=20PF=20and=20VF(s).=20To=0D=0A>=20>=20>=20>=20>=20passth=
u=20PCIe=20VF=20to=20a=20VM,=20kernel=20>=3D=20v5.7=20needs=20this.=0D=0A>=
=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20It=20can=20be=20configured=20with=
=20UUID=20like:=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20=20=20=20-d=
evice=20vfio-pci,host=3DDDDD:BB:DD:F,vf-token=3D<uuid>,...=0D=0A>=20>=20>=
=20>=20>=0D=0A>=20>=20>=20>=20>=20=5B1=5D=20https://lore.kernel.org/linux-=
=0D=0A>=20>=20>=20pci/158396393244.5601.10297430724964025753.stgit=40gimli.=
home/=0D=0A>=20>=20>=20>=20>=20=5B2=5D=20https://lore.kernel.org/linux-=0D=
=0A>=20>=20>=20pci/158396044753.5601.14804870681174789709.stgit=40gimli.hom=
e/=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20Cc:=20Alex=20Williamson=
=20<alex.williamson=40redhat.com>=0D=0A>=20>=20>=20>=20>=20Signed-off-by:=
=20Minwoo=20Im=20<minwoo.im=40samsung.com>=0D=0A>=20>=20>=20>=20>=20Reviewe=
d-by:=20Klaus=20Jensen=20<k.jensen=40samsung.com>=0D=0A>=20>=20>=20>=20>=20=
---=0D=0A>=20>=20>=20>=20>=20=20=20hw/vfio/pci.c=20=7C=2013=20++++++++++++-=
=0D=0A>=20>=20>=20>=20>=20=20=20hw/vfio/pci.h=20=7C=20=201=20+=0D=0A>=20>=
=20>=20>=20>=20=20=202=20files=20changed,=2013=20insertions(+),=201=20delet=
ion(-)=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20diff=20--git=20a/hw/=
vfio/pci.c=20b/hw/vfio/pci.c=0D=0A>=20>=20>=20>=20>=20index=20ec9a854361..c=
f27f28936=20100644=0D=0A>=20>=20>=20>=20>=20---=20a/hw/vfio/pci.c=0D=0A>=20=
>=20>=20>=20>=20+++=20b/hw/vfio/pci.c=0D=0A>=20>=20>=20>=20>=20=40=40=20-28=
56,6=20+2856,8=20=40=40=20static=20void=20vfio_realize(PCIDevice=20*pdev,=
=20Error=0D=0A>=20**errp)=0D=0A>=20>=20>=20>=20>=20=20=20=20=20=20=20int=20=
groupid;=0D=0A>=20>=20>=20>=20>=20=20=20=20=20=20=20int=20i,=20ret;=0D=0A>=
=20>=20>=20>=20>=20=20=20=20=20=20=20bool=20is_mdev;=0D=0A>=20>=20>=20>=20>=
=20+=20=20=20=20char=20uuid=5BUUID_FMT_LEN=5D;=0D=0A>=20>=20>=20>=20>=20+=
=20=20=20=20char=20*name;=0D=0A>=20>=20>=20>=20>=0D=0A>=20>=20>=20>=20>=20=
=20=20=20=20=20=20if=20(=21vbasedev->sysfsdev)=20=7B=0D=0A>=20>=20>=20>=20>=
=20=20=20=20=20=20=20=20=20=20=20if=20(=21(=7Evdev->host.domain=20=7C=7C=20=
=7Evdev->host.bus=20=7C=7C=0D=0A>=20>=20>=20>=20>=20=40=40=20-2936,7=20+293=
8,15=20=40=40=20static=20void=20vfio_realize(PCIDevice=20*pdev,=20Error=0D=
=0A>=20**errp)=0D=0A>=20>=20>=20>=20>=20=20=20=20=20=20=20=20=20=20=20goto=
=20error;=0D=0A>=20>=20>=20>=20>=20=20=20=20=20=20=20=7D=0D=0A>=20>=20>=20>=
=20>=0D=0A>=20>=20>=20>=20>=20-=20=20=20=20ret=20=3D=20vfio_get_device(grou=
p,=20vbasedev->name,=20vbasedev,=20errp);=0D=0A>=20>=20>=20>=20>=20+=20=20=
=20=20if=20(=21qemu_uuid_is_null(&vdev->vf_token))=20=7B=0D=0A>=20>=20>=20>=
=20>=20+=20=20=20=20=20=20=20=20qemu_uuid_unparse(&vdev->vf_token,=20uuid);=
=0D=0A>=20>=20>=20>=20>=20+=20=20=20=20=20=20=20=20name=20=3D=20g_strdup_pr=
intf(=22%s=20vf_token=3D%s=22,=20vbasedev->name,=20uuid);=0D=0A>=20>=20>=20=
>=20>=20+=20=20=20=20=7D=20else=20=7B=0D=0A>=20>=20>=20>=20>=20+=20=20=20=
=20=20=20=20=20name=20=3D=20vbasedev->name;=0D=0A>=20>=20>=20>=20>=20+=20=
=20=20=20=7D=0D=0A>=20>=20>=20>=20>=20+=0D=0A>=20>=20>=20>=20>=20+=20=20=20=
=20ret=20=3D=20vfio_get_device(group,=20name,=20vbasedev,=20errp);=0D=0A>=
=20>=20>=20>=20>=20+=20=20=20=20g_free(name);=0D=0A>=20>=20>=20>=20>=20=20=
=20=20=20=20=20if=20(ret)=20=7B=0D=0A>=20>=20>=20>=20>=20=20=20=20=20=20=20=
=20=20=20=20vfio_put_group(group);=0D=0A>=20>=20>=20>=20>=20=20=20=20=20=20=
=20=20=20=20=20goto=20error;=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=20Should=
n't=20we=20set=20the=20VF=20token=20in=20the=20kernel=20also=20?=20See=20th=
is=20QEMU=0D=0A>=20implementation=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=20=
=20=20=20https://lore.kernel.org/lkml/20200204161737.34696b91=40w520.home/=
=0D=0A>=20>=20>=20>=0D=0A>=20>=20>=20>=20May=20be=20I=20misunderstood.=0D=
=0A>=20>=20>=20>=0D=0A>=20>=20>=0D=0A>=20>=20>=20I=20think=20you're=20refer=
ring=20to=20the=20part=20there=20that=20calls=0D=0A>=20>=20>=20VFIO_DEVICE_=
FEATURE=20in=20order=20to=20set=20a=20VF=20token.=20=20I=20don't=20think=20=
that's=0D=0A>=20>=20>=20necessarily=20applicable=20here.=20=20I=20believe=
=20this=20patch=20is=20only=20trying=20to=0D=0A>=20>=20>=20make=20it=20so=
=20that=20QEMU=20can=20consume=20a=20VF=20associated=20with=20a=20PF=20owne=
d=20by=20a=0D=0A>=20>=20>=20userspace=20vfio=20driver,=20ie.=20not=20QEMU.=
=0D=0A>=20>=0D=0A>=20>=20Yes,=20that's=20what=20this=20patch=20exactly=20do=
es.=0D=0A>=20>=0D=0A>=20>=20>=0D=0A>=20>=20>=20Setting=20the=20VF=20token=
=20is=20only=20relevant=20to=20PFs,=20which=20would=20require=0D=0A>=20>=20=
>=20significantly=20more=20SR-IOV=20infrastructure=20in=20QEMU=20than=20ske=
tched=20out=20in=0D=0A>=20>=20>=20that=20proof-of-concept=20patch.=20=20Eve=
n=20if=20we=20did=20have=20a=20QEMU=20owned=20PF=20where=0D=0A>=20>=20>=20w=
e=20wanted=20to=20generate=20VFs,=20the=20token=20we=20use=20in=20that=20ca=
se=20would=20likely=0D=0A>=20>=20>=20need=20to=20be=20kept=20private=20to=
=20QEMU,=20not=20passed=20on=20the=20command=20line.=0D=0A>=20>=20>=20Thank=
s,=0D=0A>=20>=0D=0A>=20>=20Can=20we=20also=20take=20a=20command=20line=20pr=
operty=20for=20the=20PF=20for=20that=20case=20that=0D=0A>=20>=20QEMU=20owns=
=20a=20PF?=20=20I=20think=20the=20one=20who=20wants=20to=20make=20QEMU=20ow=
ns=20PF=20or=20VF=0D=0A>=20>=20should=20know=20the=20VF=20token.=20=20If=20=
I've=20missed=20anything,=20please=20let=20me=20know.=0D=0A>=20=0D=0A>=20II=
RC,=20the=20only=20case=20where=20a=20VF=20token=20is=20required=20for=20a=
=20PF=20is=20if=20there=0D=0A>=20are=20existing=20VFs=20in=20use.=20=20Open=
ing=20the=20PF=20would=20then=20require=20a=20token=0D=0A>=20matching=20the=
=20VFs.=20=20In=20general=20though,=20if=20the=20PF=20is=20owned=20by=20QEM=
U,=20the=0D=0A>=20VF=20token=20should=20likely=20be=20an=20internal=20secre=
t=20to=20QEMU.=20=20Configuring=20the=0D=0A>=20PF=20device=20with=20a=20tok=
en=20suggests=20that=20VFs=20could=20be=20created=20and=20bound=20to=0D=0A>=
=20other=20userspace=20drivers=20outside=20of=20the=20control=20of=20the=20=
QEMU=20instance=0D=0A>=20that=20owns=20the=20PF.=20=20Therefore=20I=20would=
=20not=20suggest=20adding=20the=20ability=20to=0D=0A>=20set=20the=20VF=20to=
ken=20for=20a=20PF=20without=20a=20strong=20use=20case=20in-hand,=20an=0D=
=0A>=20certainly=20not=20when=20QEMU=20doesn't=20expose=20SR-IOV=20support=
=20to=20be=20able=20to=0D=0A>=20manage=20VFs=20itself.=20=20Thanks,=0D=0A>=
=20=0D=0A>=20Alex=0D=0A>=20=0D=0A=0D=0AThanks=20for=20the=20explanation=21

