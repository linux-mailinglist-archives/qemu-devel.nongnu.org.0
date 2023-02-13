Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC5B694F93
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:41:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdlI-0007f9-Hk; Mon, 13 Feb 2023 13:41:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRdlB-0007YJ-P7; Mon, 13 Feb 2023 13:41:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRdl6-0007wT-Az; Mon, 13 Feb 2023 13:41:02 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DIQ1Ec004302; Mon, 13 Feb 2023 18:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=h9Q8gRgrz23X72wo8LGKjRZ+sLEnI1TMBVDjzLNLP5Q=;
 b=n3ZRI/6wVaQ4FhYBuNlRUCVMlUR/XfgbVAJh3pxIp7HBz97T26G50Vn0m706DbuaRAJh
 WqO0wfBIBFNgUsZ3RWGBLvRQ5az1VAKHthTk24mprHNuThzfPisPXnv0y5//vWDTLfs+
 PmDWR0sBK3XUCFLrORuTRchP9rK6RzG28gAXiwH/IrP3FRRbM9gZiI67VHLvrIzvnh+x
 DAdQUPUkf97osgmss8Bzrp5E3mqmRBQTnl3qQeQjLMi8sr5h4WK00sgcEuWwZwAUReJt
 qmOjWBCR20pW56Ue2kPuzOjwbJzYEHt9HnJ4iEPEclbqOOIvJ0NnaO7JmnPxLYP/KZCe rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqtfwgbrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 18:40:57 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DIR8Ce006915;
 Mon, 13 Feb 2023 18:40:57 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqtfwgbqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 18:40:57 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DIZHFk024146;
 Mon, 13 Feb 2023 18:40:55 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3np2n76vxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 18:40:55 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DIerv56619720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 18:40:54 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8FBF58056;
 Mon, 13 Feb 2023 18:40:53 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ADA558050;
 Mon, 13 Feb 2023 18:40:52 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.60.89.68]) by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 18:40:52 +0000 (GMT)
Message-ID: <2b226a1bc57d0502a67ab031ab4279c85db5281b.camel@linux.ibm.com>
Subject: Re: [PATCH v3 5/6] hw/vfio/ccw: Remove pointless S390CCWDevice
 variable
From: Eric Farman <farman@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Eduardo
 Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>
Date: Mon, 13 Feb 2023 13:40:51 -0500
In-Reply-To: <20230213170145.45666-6-philmd@linaro.org>
References: <20230213170145.45666-1-philmd@linaro.org>
 <20230213170145.45666-6-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vA-l3pLPwK9xmjM6pay7uCwgVxG_60C3
X-Proofpoint-ORIG-GUID: ApYpqvVFAmAJ-VKFy-CTwxgwR976Qeo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130165
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

On Mon, 2023-02-13 at 18:01 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> QOM parenthood relationship is:
>=20
> =C2=A0 VFIOCCWDevice -> S390CCWDevice -> CcwDevice -> DeviceState
>=20
> No need to double-cast, call CCW_DEVICE() on VFIOCCWDevice.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
> =C2=A0hw/vfio/ccw.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 2ea7b4a63c..cd66b66742 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -314,8 +314,7 @@ static void vfio_ccw_io_notifier_handler(void
> *opaque)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 VFIOCCWDevice *vcdev =3D opaque;
> =C2=A0=C2=A0=C2=A0=C2=A0 struct ccw_io_region *region =3D vcdev->io_regio=
n;
> -=C2=A0=C2=A0=C2=A0 S390CCWDevice *cdev =3D S390_CCW_DEVICE(vcdev);
> -=C2=A0=C2=A0=C2=A0 CcwDevice *ccw_dev =3D CCW_DEVICE(cdev);
> +=C2=A0=C2=A0=C2=A0 CcwDevice *ccw_dev =3D CCW_DEVICE(vcdev);
> =C2=A0=C2=A0=C2=A0=C2=A0 SubchDev *sch =3D ccw_dev->sch;
> =C2=A0=C2=A0=C2=A0=C2=A0 SCHIB *schib =3D &sch->curr_status;
> =C2=A0=C2=A0=C2=A0=C2=A0 SCSW s;


