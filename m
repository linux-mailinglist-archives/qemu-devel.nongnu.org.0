Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF707619C95
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:09:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzFN-00020s-3U; Fri, 04 Nov 2022 12:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1oqzFL-0001vF-KQ; Fri, 04 Nov 2022 12:08:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1oqzFH-0007vr-Qa; Fri, 04 Nov 2022 12:08:43 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4FYXX7003940;
 Fri, 4 Nov 2022 16:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5C4x3R2Hebm2gFN01IpK4eukbDhFfG/K0Ab5A/n2+WY=;
 b=YRNbrWzWmZi3SCPcwmq7tbxashA8NZCL405F1NUcPQkA5OQS8defNJTD6s3wc77+uHGq
 Y1NLtE1NFEDIoate2cQfHwI1ZKD/UKIwy1AZWKkQxZkQpNq6I+CiUtThtg/4eEVp2oj4
 eMaKxRXAFlpFfTVlQ/Pk9GZFsb6PHZv78x8yQ0hZqcyMditg+oeneQDHVRLtYqM3MMmv
 vQBSsM3oDG+CHrksy30sW0VcN881cdWESeVSvRcS8ejuoVnF7Turr4e+913IIgJCwwex
 K+2omcnOT09/ap8epNySdnOaBWdDTegzbbYM5A6SUXud6O3Qdh5vj/SMNE4Wo6PtylnP WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmq0847pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 16:08:37 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4DPCNe006867;
 Fri, 4 Nov 2022 16:08:37 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmq0847p0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 16:08:37 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4G6YQj027840;
 Fri, 4 Nov 2022 16:08:36 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3kguta99nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 16:08:36 +0000
Received: from smtpav03.wdc07v.mail.ibm.com ([9.208.128.112])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A4G8Z0A19858066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Nov 2022 16:08:35 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2098158054;
 Fri,  4 Nov 2022 16:08:35 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B34FC5805A;
 Fri,  4 Nov 2022 16:08:33 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.65.225.56]) by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  4 Nov 2022 16:08:33 +0000 (GMT)
Message-ID: <72949a8eae1a19c1a4023d47678e59ba815d16c4.camel@linux.ibm.com>
Subject: Re: [PATCH 3/3] s390x/pci: shrink DMA aperture to be bound by vfio
 DMA limit
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: pmorel@linux.ibm.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, qemu-devel@nongnu.org
Date: Fri, 04 Nov 2022 12:08:33 -0400
In-Reply-To: <20221028194758.204007-4-mjrosato@linux.ibm.com>
References: <20221028194758.204007-1-mjrosato@linux.ibm.com>
 <20221028194758.204007-4-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vLyvI-4bYMPmw59Q4WpzzQ2HqWyKTuEI
X-Proofpoint-ORIG-GUID: JPVCw2SZMh9vY1Mhh4VBWSS1_3zEfo_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_09,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040104
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 2022-10-28 at 15:47 -0400, Matthew Rosato wrote:
> Currently, s390x-pci performs accounting against the vfio DMA
> limit and triggers the guest to clean up mappings when the limit
> is reached. Let's go a step further and also limit the size of
> the supported DMA aperture reported to the guest based upon the
> initial vfio DMA limit reported for the container (if less than
> than the size reported by the firmware/host zPCI layer).=C2=A0 This
> avoids processing sections of the guest DMA table during global
> refresh that, for common use cases, will never be used anway, and
> makes exhausting the vfio DMA limit due to mismatch between guest
> aperture size and host limit far less likely and more indicitive
> of an error.
>=20
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
> =C2=A0hw/s390x/s390-pci-vfio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 11 +++++++++++
> =C2=A0include/hw/s390x/s390-pci-bus.h |=C2=A0 1 +
> =C2=A02 files changed, 12 insertions(+)
>=20
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index 2aefa508a0..99806e2a84 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -84,6 +84,7 @@ S390PCIDMACount
> *s390_pci_start_dma_count(S390pciState *s,
> =C2=A0=C2=A0=C2=A0=C2=A0 cnt->users =3D 1;
> =C2=A0=C2=A0=C2=A0=C2=A0 cnt->avail =3D avail;
> =C2=A0=C2=A0=C2=A0=C2=A0 QTAILQ_INSERT_TAIL(&s->zpci_dma_limit, cnt, link=
);
> +=C2=A0=C2=A0=C2=A0 pbdev->iommu->max_dma_limit =3D avail;
> =C2=A0=C2=A0=C2=A0=C2=A0 return cnt;
> =C2=A0}
> =C2=A0
> @@ -103,6 +104,7 @@ static void s390_pci_read_base(S390PCIBusDevice
> *pbdev,
> =C2=A0=C2=A0=C2=A0=C2=A0 struct vfio_info_cap_header *hdr;
> =C2=A0=C2=A0=C2=A0=C2=A0 struct vfio_device_info_cap_zpci_base *cap;
> =C2=A0=C2=A0=C2=A0=C2=A0 VFIOPCIDevice *vpci =3D=C2=A0 container_of(pbdev=
->pdev, VFIOPCIDevice,
> pdev);
> +=C2=A0=C2=A0=C2=A0 uint64_t vfio_size;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 hdr =3D vfio_get_device_info_cap(info,
> VFIO_DEVICE_INFO_CAP_ZPCI_BASE);
> =C2=A0
> @@ -122,6 +124,15 @@ static void s390_pci_read_base(S390PCIBusDevice
> *pbdev,
> =C2=A0=C2=A0=C2=A0=C2=A0 /* The following values remain 0 until we suppor=
t other FMB
> formats */
> =C2=A0=C2=A0=C2=A0=C2=A0 pbdev->zpci_fn.fmbl =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0 pbdev->zpci_fn.pft =3D 0;
> +
> +=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0 * If appropriate, reduce the size of the suppor=
ted DMA aperture
> reported
> +=C2=A0=C2=A0=C2=A0=C2=A0 * to the guest based upon the vfio DMA limit.
> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0 vfio_size =3D pbdev->iommu->max_dma_limit << TARGET_P=
AGE_BITS;
> +=C2=A0=C2=A0=C2=A0 if (vfio_size < (cap->end_dma - cap->start_dma + 1)) =
{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pbdev->zpci_fn.edma =3D cap->=
start_dma + vfio_size - 1;
> +=C2=A0=C2=A0=C2=A0 }
> =C2=A0}
> =C2=A0
> =C2=A0static bool get_host_fh(S390PCIBusDevice *pbdev, struct
> vfio_device_info *info,
> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-
> pci-bus.h
> index 0605fcea24..1c46e3a269 100644
> --- a/include/hw/s390x/s390-pci-bus.h
> +++ b/include/hw/s390x/s390-pci-bus.h
> @@ -278,6 +278,7 @@ struct S390PCIIOMMU {
> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t g_iota;
> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t pba;
> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t pal;
> +=C2=A0=C2=A0=C2=A0 uint64_t max_dma_limit;
> =C2=A0=C2=A0=C2=A0=C2=A0 GHashTable *iotlb;
> =C2=A0=C2=A0=C2=A0=C2=A0 S390PCIDMACount *dma_limit;
> =C2=A0};


