Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78366694B3F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:34:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRapw-0003Yi-K5; Mon, 13 Feb 2023 10:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRapu-0003Ol-6E; Mon, 13 Feb 2023 10:33:46 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRaps-0006dM-Fo; Mon, 13 Feb 2023 10:33:45 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DF1xOK024492; Mon, 13 Feb 2023 15:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=F3oaY8VaeiZqMV/qLRAnaqKuaH8wM/sTcVKgvLGcM4Q=;
 b=NDUwY4SDnBqCCZPhRQkmATC6+ddvzKVLXjHUJ7EQq0Dd0wb6/GSl3+gceAdMp8y+Q9S0
 zKowTJnECoSCgqAZ6nNBfqp/9fZqCa2Pr8MUini3t3IZxP5lAwZf16cjKH3YN0zFigFx
 yyxsxYW+rs0QxK0RBfGRwRBSCrGg04WaFG2iNhNHU7KHJmXnU/H3EmZQr0SDDOBh/DQu
 uw/5mPZAmdMr7pNTA3Yrvm8ADvtaTzbkxVhZwBVFwmJvtoPgJavSTrxFgzbGpmBXoLIt
 5o3YsL5+RlO1ephIueWApAm05KTiDOUnWVRC10BAmaxo8R88iBZ8MdvYkihJVAoGHfwy tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqqg8grrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 15:29:36 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DF2VMP026844;
 Mon, 13 Feb 2023 15:29:35 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqqg8grrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 15:29:35 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DD89ui023595;
 Mon, 13 Feb 2023 15:29:35 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3np2n75x16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 15:29:34 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DFTXbV63635746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 15:29:33 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E17D58058;
 Mon, 13 Feb 2023 15:29:33 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B84D58059;
 Mon, 13 Feb 2023 15:29:32 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.60.89.68]) by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 15:29:32 +0000 (GMT)
Message-ID: <e036a2ff70eebeff03fc645685227fcc65fce40e.camel@linux.ibm.com>
Subject: Re: [PATCH v2 16/19] hw/vfio/ccw: Replace DO_UPCAST(VFIOCCWDevice)
 by VFIO_CCW()
From: Eric Farman <farman@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>, Li Qiang
 <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Alex Williamson
 <alex.williamson@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Date: Mon, 13 Feb 2023 10:29:32 -0500
In-Reply-To: <20230213070820.76881-17-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-17-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 64MaFgs0r1osV6jCAFN_8TrDiRm8lArY
X-Proofpoint-GUID: OvWjYZsMsc228ct39rLVPk5og35Dla_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130136
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 2023-02-13 at 08:08 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> Use the VFIO_CCW() QOM type-checking macro to avoid DO_UPCAST().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> =C2=A0hw/vfio/ccw.c | 35 ++++++++++++++++-------------------
> =C2=A01 file changed, 16 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 0354737666..a8aa5b48c4 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c

...snip...

> @@ -252,8 +248,8 @@ again:
> =C2=A0static void vfio_ccw_reset(DeviceState *dev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 CcwDevice *ccw_dev =3D DO_UPCAST(CcwDevice, pare=
nt_obj, dev);

If I'm not mistaken, I believe that this (and (un)realize below) could
be changed to:

   CcwDevice *ccw_dev =3D CCW_DEVICE(dev);

> -=C2=A0=C2=A0=C2=A0 S390CCWDevice *cdev =3D DO_UPCAST(S390CCWDevice, pare=
nt_obj,
> ccw_dev);
> -=C2=A0=C2=A0=C2=A0 VFIOCCWDevice *vcdev =3D DO_UPCAST(VFIOCCWDevice, cde=
v, cdev);
> +=C2=A0=C2=A0=C2=A0 S390CCWDevice *cdev =3D S390_CCW_DEVICE(ccw_dev);
> +=C2=A0=C2=A0=C2=A0 VFIOCCWDevice *vcdev =3D VFIO_CCW(cdev);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 ioctl(vcdev->vdev.fd, VFIO_DEVICE_RESET);
> =C2=A0}

...snip...

> @@ -657,9 +654,9 @@ static void vfio_ccw_realize(DeviceState *dev,
> Error **errp)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 VFIOGroup *group;
> =C2=A0=C2=A0=C2=A0=C2=A0 CcwDevice *ccw_dev =3D DO_UPCAST(CcwDevice, pare=
nt_obj, dev);
> -=C2=A0=C2=A0=C2=A0 S390CCWDevice *cdev =3D DO_UPCAST(S390CCWDevice, pare=
nt_obj,
> ccw_dev);
> -=C2=A0=C2=A0=C2=A0 VFIOCCWDevice *vcdev =3D DO_UPCAST(VFIOCCWDevice, cde=
v, cdev);
> +=C2=A0=C2=A0=C2=A0 S390CCWDevice *cdev =3D S390_CCW_DEVICE(ccw_dev);
> =C2=A0=C2=A0=C2=A0=C2=A0 S390CCWDeviceClass *cdc =3D S390_CCW_DEVICE_GET_=
CLASS(cdev);
> +=C2=A0=C2=A0=C2=A0 VFIOCCWDevice *vcdev =3D VFIO_CCW(cdev);
> =C2=A0=C2=A0=C2=A0=C2=A0 Error *err =3D NULL;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Call the class init function for subchannel. =
*/
> @@ -729,9 +726,9 @@ out_err_propagate:
> =C2=A0static void vfio_ccw_unrealize(DeviceState *dev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 CcwDevice *ccw_dev =3D DO_UPCAST(CcwDevice, pare=
nt_obj, dev);
> -=C2=A0=C2=A0=C2=A0 S390CCWDevice *cdev =3D DO_UPCAST(S390CCWDevice, pare=
nt_obj,
> ccw_dev);
> -=C2=A0=C2=A0=C2=A0 VFIOCCWDevice *vcdev =3D DO_UPCAST(VFIOCCWDevice, cde=
v, cdev);
> +=C2=A0=C2=A0=C2=A0 S390CCWDevice *cdev =3D S390_CCW_DEVICE(ccw_dev);
> =C2=A0=C2=A0=C2=A0=C2=A0 S390CCWDeviceClass *cdc =3D S390_CCW_DEVICE_GET_=
CLASS(cdev);
> +=C2=A0=C2=A0=C2=A0 VFIOCCWDevice *vcdev =3D VFIO_CCW(cdev);
> =C2=A0=C2=A0=C2=A0=C2=A0 VFIOGroup *group =3D vcdev->vdev.group;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW=
_REQ_IRQ_INDEX);


