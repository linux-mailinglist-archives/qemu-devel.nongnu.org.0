Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D65694F8C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:39:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdja-00063A-Tf; Mon, 13 Feb 2023 13:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRdjI-0005z5-IM; Mon, 13 Feb 2023 13:39:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1pRdjE-0007Li-IN; Mon, 13 Feb 2023 13:39:07 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DIctZI029619; Mon, 13 Feb 2023 18:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8bknLKHv9lydjQx7E6nDIah/hXrdvC0TcX67OLl6LyI=;
 b=dPeON2ICzYrgEllIKI4smV67YNOFH68rYIed+QqdVcpWB1nOiH+QQXu9vCJA/msikX7b
 TdkCRP71jDsFAVKDKAFtnmRNoj67Q/IH9NqNYfRgw2oHcY8YXUNz+MG3aJIIAM9w5Yvq
 h8AX1ZeJg8T3L9t5yjDCO6YbO+iQf35YDDbX5UUwL6/hYb5inliQHt0U/ZeIyjBVRbjy
 PQRas3uvFPThnJS4/Xzs6aObXvGlYdtp9JpJOEOtNa/ELsLvqW2SfPpuzZWqfK7eX56V
 Vx7YbML1/PH5a4EVE+cJjYAWVkBlQV5FhXONPkVlxNhnGdN53ITBmz7tFmCVJp25ZWmI YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqsd1a3q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 18:38:59 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DIBOpK002015;
 Mon, 13 Feb 2023 18:38:59 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqsd1a3pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 18:38:59 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DGg7ni016681;
 Mon, 13 Feb 2023 18:38:58 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3np2n73wsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Feb 2023 18:38:58 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31DIcuK38585780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 18:38:57 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99BD358050;
 Mon, 13 Feb 2023 18:38:56 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B84958045;
 Mon, 13 Feb 2023 18:38:55 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.60.89.68]) by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Feb 2023 18:38:55 +0000 (GMT)
Message-ID: <30c2a5088df9b8f27a1bf76d654212964b35b66a.camel@linux.ibm.com>
Subject: Re: [PATCH v3 2/6] hw/vfio/ccw: Simplify using DEVICE() macro
From: Eric Farman <farman@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Eduardo
 Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>
Date: Mon, 13 Feb 2023 13:38:54 -0500
In-Reply-To: <20230213170145.45666-3-philmd@linaro.org>
References: <20230213170145.45666-1-philmd@linaro.org>
 <20230213170145.45666-3-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pS2imEkh7g_dkROXuyn-JxStP16Ve7_j
X-Proofpoint-GUID: Aibz-nMWxLPuQV11l1hSrvnXuxxBB972
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302130165
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> We can directly use the QOM DEVICE() macro to get the parent object.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
> =C2=A0hw/vfio/ccw.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 0354737666..503de94ce1 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -618,7 +618,7 @@ static void vfio_ccw_get_device(VFIOGroup *group,
> VFIOCCWDevice *vcdev,
> =C2=A0=C2=A0=C2=A0=C2=A0 vcdev->vdev.ops =3D &vfio_ccw_ops;
> =C2=A0=C2=A0=C2=A0=C2=A0 vcdev->vdev.type =3D VFIO_DEVICE_TYPE_CCW;
> =C2=A0=C2=A0=C2=A0=C2=A0 vcdev->vdev.name =3D name;
> -=C2=A0=C2=A0=C2=A0 vcdev->vdev.dev =3D &vcdev->cdev.parent_obj.parent_ob=
j;
> +=C2=A0=C2=A0=C2=A0 vcdev->vdev.dev =3D DEVICE(vcdev);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 return;
> =C2=A0


