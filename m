Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495364A3EC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:05:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kLu-0007lc-21; Mon, 12 Dec 2022 10:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1p4kLW-0007bs-En; Mon, 12 Dec 2022 10:03:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1p4kLS-0002vl-I5; Mon, 12 Dec 2022 10:03:58 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCEGncW040624; Mon, 12 Dec 2022 15:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YKePmJ8wFE4JFWXTQ4BDCk8B2zp7i+kTLiohRMNb0Fw=;
 b=LV+cRSyjKgkBmG1sjXuhyDwuUHqDNHwX75pU57FwcwFpAfKmGVqPFV9S/g1e4v2HfvZo
 A7vBj1wdQAimi2n7vEWH6f6NAkhKPhzHbAYVDUUuIgsCGDY2XcNAUiQIfgFlPu9bkIhC
 f+QOpVscGyTK1xRYqQXJ+2qsDWXwBs3M4M1n49IxwdKg2ALyvUwyIx8xjQPvkQEBarCv
 P9rLZ8c8y/U3ZRk+aYjfrXk0YGcAtY7q0DN4e7hWD5wlYOc9NfPkK2/Lm2aE/2EiLWx9
 gs1hleS5z/jFwDK66d2C7yrdkLnmnP40xOfsYHWX/0ySO82B9j02ml5hZUXyD8ettBbv Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me5x399bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 15:03:49 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCEGnRf040646;
 Mon, 12 Dec 2022 15:03:48 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3me5x399bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 15:03:48 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCEgSZn004323;
 Mon, 12 Dec 2022 15:03:47 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6dnqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 15:03:47 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCF3jHn30998914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 15:03:46 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAFEF5805C;
 Mon, 12 Dec 2022 15:03:45 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86CA358058;
 Mon, 12 Dec 2022 15:03:44 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.60.89.68]) by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 15:03:44 +0000 (GMT)
Message-ID: <5286577c87bed5509a08ea658ec5aa7dc062c5c5.camel@linux.ibm.com>
Subject: Re: [PATCH] s390x/pci: reset ISM passthrough devices on shutdown
 and system reset
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: pmorel@linux.ibm.com, schnelle@linux.ibm.com, thuth@redhat.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, iii@linux.ibm.com,
 qemu-devel@nongnu.org
Date: Mon, 12 Dec 2022 10:03:44 -0500
In-Reply-To: <20221209195700.263824-1-mjrosato@linux.ibm.com>
References: <20221209195700.263824-1-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rloNJRsT8yd2GSTPay4etnOEUfN9uRZo
X-Proofpoint-GUID: wWeRiDMRWoZEktiuPyyeq4EqHcWojLep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120138
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
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

On Fri, 2022-12-09 at 14:57 -0500, Matthew Rosato wrote:
> ISM device firmware stores unique state information that can
> can cause a wholesale unmap of the associated IOMMU (e.g. when
> we get a termination signal for QEMU) to trigger firmware errors
> because firmware believes we are attempting to invalidate entries
> that are still in-use by the guest OS (when in fact that guest is
> in the process of being terminated or rebooted).
> To alleviate this, register both a shutdown notifier (for unexpected
> termination cases e.g. virsh destroy) as well as a reset callback
> (for cases like guest OS reboot).=C2=A0 For each of these scenarios,
> trigger
> PCI device reset; this is enough to indicate to firmware that the
> IOMMU
> is no longer in-use by the guest OS, making it safe to invalidate any
> associated IOMMU entries.
>=20
> Fixes: 15d0e7942d3b ("s390x/pci: don't fence interpreted devices
> without MSI-X")
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>

I realize Thomas already queued this, but for the record:

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
> =C2=A0hw/s390x/s390-pci-bus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 28 ++++++++++++++++++++++++++++
> =C2=A0hw/s390x/s390-pci-vfio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 2 ++
> =C2=A0include/hw/s390x/s390-pci-bus.h |=C2=A0 5 +++++
> =C2=A03 files changed, 35 insertions(+)
>=20
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 977e7daa15..02751f3597 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -24,6 +24,8 @@
> =C2=A0#include "hw/pci/msi.h"
> =C2=A0#include "qemu/error-report.h"
> =C2=A0#include "qemu/module.h"
> +#include "sysemu/reset.h"
> +#include "sysemu/runstate.h"
> =C2=A0
> =C2=A0#ifndef DEBUG_S390PCI_BUS
> =C2=A0#define DEBUG_S390PCI_BUS=C2=A0 0
> @@ -150,10 +152,30 @@ out:
> =C2=A0=C2=A0=C2=A0=C2=A0 psccb->header.response_code =3D cpu_to_be16(rc);
> =C2=A0}
> =C2=A0
> +static void s390_pci_shutdown_notifier(Notifier *n, void *opaque)
> +{
> +=C2=A0=C2=A0=C2=A0 S390PCIBusDevice *pbdev =3D container_of(n, S390PCIBu=
sDevice,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shutdown_notifier);
> +
> +=C2=A0=C2=A0=C2=A0 pci_device_reset(pbdev->pdev);
> +}
> +
> +static void s390_pci_reset_cb(void *opaque)
> +{
> +=C2=A0=C2=A0=C2=A0 S390PCIBusDevice *pbdev =3D opaque;
> +
> +=C2=A0=C2=A0=C2=A0 pci_device_reset(pbdev->pdev);
> +}
> +
> =C2=A0static void s390_pci_perform_unplug(S390PCIBusDevice *pbdev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 HotplugHandler *hotplug_ctrl;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 if (pbdev->pft =3D=3D ZPCI_PFT_ISM) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 notifier_remove(&pbdev->shutd=
own_notifier);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu_unregister_reset(s390_pc=
i_reset_cb, pbdev);
> +=C2=A0=C2=A0=C2=A0 }
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Unplug the PCI device */
> =C2=A0=C2=A0=C2=A0=C2=A0 if (pbdev->pdev) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState *pdev =3D DE=
VICE(pbdev->pdev);
> @@ -1111,6 +1133,12 @@ static void s390_pcihost_plug(HotplugHandler
> *hotplug_dev, DeviceState *dev,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pbdev->fh |=3D FH_SHM_VFIO;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pbdev->forwarding_assist =3D false;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Re=
gister shutdown notifier and reset callback for ISM
> devices */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p=
bdev->pft =3D=3D ZPCI_PFT_ISM) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 pbdev->shutdown_notifier.notify =3D
> s390_pci_shutdown_notifier;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 qemu_register_shutdown_notifier(&pbdev-
> >shutdown_notifier);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 qemu_register_reset(s390_pci_reset_cb, pbdev);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
pbdev->fh |=3D FH_SHM_EMUL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/* Always intercept emulated devices */
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index 5f0adb0b4a..419763f829 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -122,6 +122,8 @@ static void s390_pci_read_base(S390PCIBusDevice
> *pbdev,
> =C2=A0=C2=A0=C2=A0=C2=A0 /* The following values remain 0 until we suppor=
t other FMB
> formats */
> =C2=A0=C2=A0=C2=A0=C2=A0 pbdev->zpci_fn.fmbl =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0 pbdev->zpci_fn.pft =3D 0;
> +=C2=A0=C2=A0=C2=A0 /* Store function type separately for type-specific b=
ehavior */
> +=C2=A0=C2=A0=C2=A0 pbdev->pft =3D cap->pft;
> =C2=A0}
> =C2=A0
> =C2=A0static bool get_host_fh(S390PCIBusDevice *pbdev, struct
> vfio_device_info *info,
> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-
> pci-bus.h
> index 0605fcea24..4c812c65db 100644
> --- a/include/hw/s390x/s390-pci-bus.h
> +++ b/include/hw/s390x/s390-pci-bus.h
> @@ -39,6 +39,9 @@
> =C2=A0#define UID_CHECKING_ENABLED 0x01
> =C2=A0#define ZPCI_DTSM 0x40
> =C2=A0
> +/* zPCI Function Types */
> +#define ZPCI_PFT_ISM 5
> +
> =C2=A0OBJECT_DECLARE_SIMPLE_TYPE(S390pciState, S390_PCI_HOST_BRIDGE)
> =C2=A0OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBus, S390_PCI_BUS)
> =C2=A0OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBusDevice, S390_PCI_DEVICE)
> @@ -343,6 +346,7 @@ struct S390PCIBusDevice {
> =C2=A0=C2=A0=C2=A0=C2=A0 uint16_t noi;
> =C2=A0=C2=A0=C2=A0=C2=A0 uint16_t maxstbl;
> =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t sum;
> +=C2=A0=C2=A0=C2=A0 uint8_t pft;
> =C2=A0=C2=A0=C2=A0=C2=A0 S390PCIGroup *pci_group;
> =C2=A0=C2=A0=C2=A0=C2=A0 ClpRspQueryPci zpci_fn;
> =C2=A0=C2=A0=C2=A0=C2=A0 S390MsixInfo msix;
> @@ -351,6 +355,7 @@ struct S390PCIBusDevice {
> =C2=A0=C2=A0=C2=A0=C2=A0 MemoryRegion msix_notify_mr;
> =C2=A0=C2=A0=C2=A0=C2=A0 IndAddr *summary_ind;
> =C2=A0=C2=A0=C2=A0=C2=A0 IndAddr *indicator;
> +=C2=A0=C2=A0=C2=A0 Notifier shutdown_notifier;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool pci_unplug_request_processed;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool unplug_requested;
> =C2=A0=C2=A0=C2=A0=C2=A0 bool interp;


