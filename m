Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429846C5A7F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:35:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7gq-0005Xw-E0; Wed, 22 Mar 2023 19:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im@samsung.com>)
 id 1pf7gl-0005X3-PO
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 19:16:16 -0400
Received: from mailout1.samsung.com ([203.254.224.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im@samsung.com>)
 id 1pf7gi-00048j-Kv
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 19:16:15 -0400
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230322211946epoutp013ec6a45504569d662227d074fccefe00~O2oeUZ1OF0303703037epoutp01H
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 21:19:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230322211946epoutp013ec6a45504569d662227d074fccefe00~O2oeUZ1OF0303703037epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1679519986;
 bh=q3Mx+tFrpm50/INklgaCX01vrfi/g8TsU98MzNC68bY=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=gzRCBPTVIQu6qDMZG/UwtceHNMm9ffeYeeFyb6FyHHRRDauSk1Yhcbmng+M8SKX7q
 xJsJNGgdVFCEbFtghUBCTpinrms5r4OjbG63I5ILRjnjcm0LCMFPCwgmkqfZ7R9+OA
 KBLAVDm4kzJnDpKA3MI/6gIOtmMN2se4xHP5QLEA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20230322211946epcas2p11b4645c708a3918d5f6cb20eb0f6f786~O2od0jID_0176601766epcas2p1J;
 Wed, 22 Mar 2023 21:19:46 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.98]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4PhhFG05Y1z4x9Pq; Wed, 22 Mar
 2023 21:19:46 +0000 (GMT)
X-AuditID: b6c32a46-743fa70000007a4b-60-641b70f148ee
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 7C.21.31307.1F07B146; Thu, 23 Mar 2023 06:19:45 +0900 (KST)
Mime-Version: 1.0
Subject: RE: [PATCH] vfio/pci: add support for VF token
From: Minwoo Im <minwoo.im@samsung.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: =?UTF-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, SSDR Gost Dev
 <gost.dev@samsung.com>, Klaus Birkelund Jensen <k.jensen@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20230320093931.29015496.alex.williamson@redhat.com>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230322211945epcms2p4fdcdcfdc3857d2451f24ac229f3992a8@epcms2p4>
Date: Thu, 23 Mar 2023 06:19:45 +0900
X-CMS-MailID: 20230322211945epcms2p4fdcdcfdc3857d2451f24ac229f3992a8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKKsWRmVeSWpSXmKPExsWy7bCmme7HAukUg5udZhbf/vewWTR072Oz
 uHlgJ5PFycY9rBbHe3ewOLB67D0l7fHk2mYmj/f7rrJ59G1ZxRjAEpVtk5GamJJapJCal5yf
 kpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQO0V0mhLDGnFCgUkFhcrKRvZ1OU
 X1qSqpCRX1xiq5RakJJTYF6gV5yYW1yal66Xl1piZWhgYGQKVJiQnbH21jXmgjsaFUun/2Ru
 YDyj3sXIySEhYCIx4fUcpi5GLg4hgR2MEjde3wByODh4BQQl/u4QBqkRFjCXuHllHgtIWEhA
 XuLHKwOIsKbEu91nWEFsNgF1iYapr1hAbBEBA4mvnyeAjWQWOMgo8fjaBGaIXbwSM9qfskDY
 0hLbl29lBJnJKeAo8W9ZNURYQ+LHsl6oclGJm6vfssPY74/NZ4SwRSRa752FqhGUePBzN1Rc
 SmL//LlQdrVEw/FnTBB2hcSv9w+g6s0lft/fDXYzr4CvxNF368DqWQRUJTb9uwZV7yKxf8V2
 NhCbWUBbYtnC18wgZzID/bt+lz6IKSGgLHHkFgtEBZ9Ex+G/7DAP7pj3BGqKssTHQ4egtkpK
 LL/0mg3C9pCYevks4wRGxVmIYJ6FZNcshF0LGJlXMYqlFhTnpqcWGxUYwWM2OT93EyM4/Wm5
 7WCc8vaD3iFGJg7GQ4wSHMxKIrxuzBIpQrwpiZVVqUX58UWlOanFhxhNgb6cyCwlmpwPTMB5
 JfGGJpYGJmZmhuZGpgbmSuK80rYnk4UE0hNLUrNTUwtSi2D6mDg4pRqYTshPu8UgbpDOKJEW
 5XNQd4Nobvw31/dNDTk/t+4It1Q5nrlL3uu+pUx2RahQQLraPLa8tAVd4QYLFkyKj8hJY+G3
 Y5l9edqeD6dOHEtddUVRs7XtrvGf/t/zhDjLDzKJ9jMlml66ci2xP8DBvKNhr3IG5z6b1gXd
 V5aeNz3lZy5Y4b3acnW3tObrA0V5Wmx+lY98zh6bn5Z0TijoxBOjs4/16j6V+Kr5XKjIfvde
 Wmb5uT+24v+vXxT6JfvrkN7zZ0Izex2DN2pqumlOPf4mds09xoW3Xqwxf3mGO9x+0xPODRFl
 G0RXXHoaVrfqXIbO+ZKsy93/xXgvr2Gw7z7wuThVhb3auNot6twGs89KLMUZiYZazEXFiQBE
 8J8JCAQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780
References: <20230320093931.29015496.alex.williamson@redhat.com>
 <20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
 <7db48667-11e2-b806-03f7-eb516a7be157@kaod.org>
 <CGME20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=minwoo.im@samsung.com; helo=mailout1.samsung.com
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

> On Mon, 20 Mar 2023 11:03:40 +0100
> C=C3=A9dric=20Le=20Goater=20<clg=40kaod.org>=20wrote:=0D=0A>=20=0D=0A>=20=
>=20On=203/20/23=2008:35,=20Minwoo=20Im=20wrote:=0D=0A>=20>=20>=20VF=20toke=
n=20was=20introduced=20=5B1=5D=20to=20kernel=20vfio-pci=20along=20with=20SR=
-IOV=0D=0A>=20>=20>=20support=20=5B2=5D.=20=20This=20patch=20adds=20support=
=20VF=20token=20among=20PF=20and=20VF(s).=20To=0D=0A>=20>=20>=20passthu=20P=
CIe=20VF=20to=20a=20VM,=20kernel=20>=3D=20v5.7=20needs=20this.=0D=0A>=20>=
=20>=0D=0A>=20>=20>=20It=20can=20be=20configured=20with=20UUID=20like:=0D=
=0A>=20>=20>=0D=0A>=20>=20>=20=20=20=20-device=20vfio-pci,host=3DDDDD:BB:DD=
:F,vf-token=3D<uuid>,...=0D=0A>=20>=20>=0D=0A>=20>=20>=20=5B1=5D=20https://=
lore.kernel.org/linux-=0D=0A>=20pci/158396393244.5601.10297430724964025753.=
stgit=40gimli.home/=0D=0A>=20>=20>=20=5B2=5D=20https://lore.kernel.org/linu=
x-=0D=0A>=20pci/158396044753.5601.14804870681174789709.stgit=40gimli.home/=
=0D=0A>=20>=20>=0D=0A>=20>=20>=20Cc:=20Alex=20Williamson=20<alex.williamson=
=40redhat.com>=0D=0A>=20>=20>=20Signed-off-by:=20Minwoo=20Im=20<minwoo.im=
=40samsung.com>=0D=0A>=20>=20>=20Reviewed-by:=20Klaus=20Jensen=20<k.jensen=
=40samsung.com>=0D=0A>=20>=20>=20---=0D=0A>=20>=20>=20=20=20hw/vfio/pci.c=
=20=7C=2013=20++++++++++++-=0D=0A>=20>=20>=20=20=20hw/vfio/pci.h=20=7C=20=
=201=20+=0D=0A>=20>=20>=20=20=202=20files=20changed,=2013=20insertions(+),=
=201=20deletion(-)=0D=0A>=20>=20>=0D=0A>=20>=20>=20diff=20--git=20a/hw/vfio=
/pci.c=20b/hw/vfio/pci.c=0D=0A>=20>=20>=20index=20ec9a854361..cf27f28936=20=
100644=0D=0A>=20>=20>=20---=20a/hw/vfio/pci.c=0D=0A>=20>=20>=20+++=20b/hw/v=
fio/pci.c=0D=0A>=20>=20>=20=40=40=20-2856,6=20+2856,8=20=40=40=20static=20v=
oid=20vfio_realize(PCIDevice=20*pdev,=20Error=20**errp)=0D=0A>=20>=20>=20=
=20=20=20=20=20=20int=20groupid;=0D=0A>=20>=20>=20=20=20=20=20=20=20int=20i=
,=20ret;=0D=0A>=20>=20>=20=20=20=20=20=20=20bool=20is_mdev;=0D=0A>=20>=20>=
=20+=20=20=20=20char=20uuid=5BUUID_FMT_LEN=5D;=0D=0A>=20>=20>=20+=20=20=20=
=20char=20*name;=0D=0A>=20>=20>=0D=0A>=20>=20>=20=20=20=20=20=20=20if=20(=
=21vbasedev->sysfsdev)=20=7B=0D=0A>=20>=20>=20=20=20=20=20=20=20=20=20=20=
=20if=20(=21(=7Evdev->host.domain=20=7C=7C=20=7Evdev->host.bus=20=7C=7C=0D=
=0A>=20>=20>=20=40=40=20-2936,7=20+2938,15=20=40=40=20static=20void=20vfio_=
realize(PCIDevice=20*pdev,=20Error=20**errp)=0D=0A>=20>=20>=20=20=20=20=20=
=20=20=20=20=20=20goto=20error;=0D=0A>=20>=20>=20=20=20=20=20=20=20=7D=0D=
=0A>=20>=20>=0D=0A>=20>=20>=20-=20=20=20=20ret=20=3D=20vfio_get_device(grou=
p,=20vbasedev->name,=20vbasedev,=20errp);=0D=0A>=20>=20>=20+=20=20=20=20if=
=20(=21qemu_uuid_is_null(&vdev->vf_token))=20=7B=0D=0A>=20>=20>=20+=20=20=
=20=20=20=20=20=20qemu_uuid_unparse(&vdev->vf_token,=20uuid);=0D=0A>=20>=20=
>=20+=20=20=20=20=20=20=20=20name=20=3D=20g_strdup_printf(=22%s=20vf_token=
=3D%s=22,=20vbasedev->name,=20uuid);=0D=0A>=20>=20>=20+=20=20=20=20=7D=20el=
se=20=7B=0D=0A>=20>=20>=20+=20=20=20=20=20=20=20=20name=20=3D=20vbasedev->n=
ame;=0D=0A>=20>=20>=20+=20=20=20=20=7D=0D=0A>=20>=20>=20+=0D=0A>=20>=20>=20=
+=20=20=20=20ret=20=3D=20vfio_get_device(group,=20name,=20vbasedev,=20errp)=
;=0D=0A>=20>=20>=20+=20=20=20=20g_free(name);=0D=0A>=20>=20>=20=20=20=20=20=
=20=20if=20(ret)=20=7B=0D=0A>=20>=20>=20=20=20=20=20=20=20=20=20=20=20vfio_=
put_group(group);=0D=0A>=20>=20>=20=20=20=20=20=20=20=20=20=20=20goto=20err=
or;=0D=0A>=20>=0D=0A>=20>=20Shouldn't=20we=20set=20the=20VF=20token=20in=20=
the=20kernel=20also=20?=20See=20this=20QEMU=20implementation=0D=0A>=20>=0D=
=0A>=20>=20=20=20=20https://lore.kernel.org/lkml/20200204161737.34696b91=40=
w520.home/=0D=0A>=20>=0D=0A>=20>=20May=20be=20I=20misunderstood.=0D=0A>=20>=
=0D=0A>=20=0D=0A>=20I=20think=20you're=20referring=20to=20the=20part=20ther=
e=20that=20calls=0D=0A>=20VFIO_DEVICE_FEATURE=20in=20order=20to=20set=20a=
=20VF=20token.=20=20I=20don't=20think=20that's=0D=0A>=20necessarily=20appli=
cable=20here.=20=20I=20believe=20this=20patch=20is=20only=20trying=20to=0D=
=0A>=20make=20it=20so=20that=20QEMU=20can=20consume=20a=20VF=20associated=
=20with=20a=20PF=20owned=20by=20a=0D=0A>=20userspace=20vfio=20driver,=20ie.=
=20not=20QEMU.=0D=0A=0D=0AYes,=20that's=20what=20this=20patch=20exactly=20d=
oes.=0D=0A=0D=0A>=20=0D=0A>=20Setting=20the=20VF=20token=20is=20only=20rele=
vant=20to=20PFs,=20which=20would=20require=0D=0A>=20significantly=20more=20=
SR-IOV=20infrastructure=20in=20QEMU=20than=20sketched=20out=20in=0D=0A>=20t=
hat=20proof-of-concept=20patch.=20=20Even=20if=20we=20did=20have=20a=20QEMU=
=20owned=20PF=20where=0D=0A>=20we=20wanted=20to=20generate=20VFs,=20the=20t=
oken=20we=20use=20in=20that=20case=20would=20likely=0D=0A>=20need=20to=20be=
=20kept=20private=20to=20QEMU,=20not=20passed=20on=20the=20command=20line.=
=0D=0A>=20Thanks,=0D=0A=0D=0ACan=20we=20also=20take=20a=20command=20line=20=
property=20for=20the=20PF=20for=20that=20case=20that=0D=0AQEMU=20owns=20a=
=20PF?=20=20I=20think=20the=20one=20who=20wants=20to=20make=20QEMU=20owns=
=20PF=20or=20VF=0D=0Ashould=20know=20the=20VF=20token.=20=20If=20I've=20mis=
sed=20anything,=20please=20let=20me=20know.=0D=0A=0D=0AThanks=21

