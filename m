Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20799694CC4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:29:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbhb-0007nw-SO; Mon, 13 Feb 2023 11:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRbhP-0007gp-UL; Mon, 13 Feb 2023 11:29:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRbhM-0000tu-Sc; Mon, 13 Feb 2023 11:29:03 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DGGbfx009668; Mon, 13 Feb 2023 16:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Zs0Bdy8OmtF+RVRGx9Q5zlfKOH0wpb1JKAHh7tFmJ1w=;
 b=U6di3LwwZ/YUz4oBbSFRk3TEUouB8vz4BpqZE4//sy/NxTdnBGqJxrJMVjNytwh8hWZc
 mYVyqsUUUaxpGtmMMXLF5oVs8ebrWOx2YLlF/ajoisfgS9uojTx9bKyrxWkoufFBnJR5
 P7157idySGgXVBglzb4cmcBvkVu3mwHWBAhXT3PUqT8LeT8ZX/coofu31O0gYCf8CziQ
 zz6iAnX8j5Q18YpgKMO/ttOKqHZ4+9pO8LEe9f78g6s8MbNmjUWt/Xy0lXL1P59FPPef
 M1CbAYnunTNIymlJZjILpQjvhDQogtWpYp1tkyHVEQsWtBWjkHL1x7AS317of/ufZ7R3 Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqrk6g5tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 16:24:51 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DGIOi5019311;
 Mon, 13 Feb 2023 16:24:51 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqrk6g5t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 16:24:51 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DFtnm6010487;
 Mon, 13 Feb 2023 16:24:50 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3np2n7e6f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 16:24:50 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com
 [10.39.53.233])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DGOmLs44499690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 16:24:49 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A16A85804E;
 Mon, 13 Feb 2023 16:24:48 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D0F65803F;
 Mon, 13 Feb 2023 16:24:47 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.60.89.68]) by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 16:24:47 +0000 (GMT)
Message-ID: <f1a92e40dec55f77e95a4512dbf6fcd3a6ae235b.camel@linux.ibm.com>
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
Date: Mon, 13 Feb 2023 11:24:46 -0500
In-Reply-To: <b95e2be0-cf08-a04a-5667-063f7a9fc039@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-17-philmd@linaro.org>
 <e036a2ff70eebeff03fc645685227fcc65fce40e.camel@linux.ibm.com>
 <499a75a2-5a43-6ec6-bedb-f6bc46aa60fe@linaro.org>
 <b95e2be0-cf08-a04a-5667-063f7a9fc039@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eaGbKPeYyKIPpyd0tQgZ1DATln994wUO
X-Proofpoint-GUID: 9T43TxIJ-vw1xGcjrv5tIhX6kQ5EdQsx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_11,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302130145
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On Mon, 2023-02-13 at 17:10 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> On 13/2/23 16:51, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 13/2/23 16:29, Eric Farman wrote:
> > > On Mon, 2023-02-13 at 08:08 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> > > > Use the VFIO_CCW() QOM type-checking macro to avoid
> > > > DO_UPCAST().
> > > >=20
> > > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > > > ---
> > > > =C2=A0=C2=A0hw/vfio/ccw.c | 35 ++++++++++++++++-------------------
> > > > =C2=A0=C2=A01 file changed, 16 insertions(+), 19 deletions(-)
> > > >=20
> > > > diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> > > > index 0354737666..a8aa5b48c4 100644
> > > > --- a/hw/vfio/ccw.c
> > > > +++ b/hw/vfio/ccw.c
> > >=20
> > > ...snip...
> > >=20
> > > > @@ -252,8 +248,8 @@ again:
> > > > =C2=A0=C2=A0static void vfio_ccw_reset(DeviceState *dev)
> > > > =C2=A0=C2=A0{
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CcwDevice *ccw_dev =3D DO_UPCAST(Ccw=
Device, parent_obj,
> > > > dev);
> > >=20
> > > If I'm not mistaken, I believe that this (and (un)realize below)
> > > could
> > > be changed to:
> > >=20
> > > =C2=A0=C2=A0=C2=A0 CcwDevice *ccw_dev =3D CCW_DEVICE(dev);
> >=20
> > Even ...
> >=20
> > > > -=C2=A0=C2=A0=C2=A0 S390CCWDevice *cdev =3D DO_UPCAST(S390CCWDevice=
, parent_obj,
> > > > ccw_dev);
> > > > -=C2=A0=C2=A0=C2=A0 VFIOCCWDevice *vcdev =3D DO_UPCAST(VFIOCCWDevic=
e, cdev,
> > > > cdev);
> > > > +=C2=A0=C2=A0=C2=A0 S390CCWDevice *cdev =3D S390_CCW_DEVICE(ccw_dev=
);
> > > > +=C2=A0=C2=A0=C2=A0 VFIOCCWDevice *vcdev =3D VFIO_CCW(cdev);
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VFIOCCWDevice *vcdev =
=3D VFIO_CCW(dev);

Ha, I didn't look to see if we cared about the intermediary ones, but
this is true here. (Realize cares a bit, but that's easy enough.)

> >=20
> > But I somehow got scared to of removing too many casts...
> >=20
> > Are these paths covered by a "make check-qtest" on a s390x host?
>=20
> They are covered by the Avocado tests :)
>=20
> $ avocado --show=3Dapp,console run -t arch:s390x tests/avocado
>=20

Woo! Then I'm happy with the big squash then.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

