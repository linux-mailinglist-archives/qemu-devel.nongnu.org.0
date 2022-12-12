Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C857F64A109
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:34:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iwk-00014k-Am; Mon, 12 Dec 2022 08:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1p4iwX-0000wT-Cn; Mon, 12 Dec 2022 08:34:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1p4iwV-00042o-2s; Mon, 12 Dec 2022 08:34:05 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCBfdXV009621; Mon, 12 Dec 2022 13:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2NnLIoFHWQMaKytHZA9fSHvy4pLnUhiq8TEo3sOR2LA=;
 b=oLhqcqit2AxLPNF9jLrY0P8CcK01ytNo9205qD0kDejjUD+Mx0/lKh6ZRi8nb4oeLpR+
 AKEOcZMSbWULo6OzsHN43c6zzO0pVGbN8Oh7awkkFp45oLjfR4exh9jKws8kY0x/KqWH
 daNsReN2j0M0HjN0uBzV5y8mUnyNCyb5YSXJZpOB9T8Kr1+pqjS7CR5snZhMSOM49aH/
 +pw8i7ggNa07i68rm7TWeoeBlfRAqMrDODkVnFtoqeMH+SiqVuTA+IO7vpAGfxACQN9L
 O8KktKEvdi+cwCbHwFO5r9iY32/b76wXQqYr+dSgk7tPwPM9KepiT2E8ZMG3g8o9uSmD QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3xr26k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 13:33:58 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BCConSb023901;
 Mon, 12 Dec 2022 13:33:58 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3xr26jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 13:33:58 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCBL1ve032064;
 Mon, 12 Dec 2022 13:33:57 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3mchr6575f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 13:33:57 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BCDXtwA63570182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 13:33:55 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D20458062;
 Mon, 12 Dec 2022 13:33:55 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56A4E5804E;
 Mon, 12 Dec 2022 13:33:54 +0000 (GMT)
Received: from [9.65.240.147] (unknown [9.65.240.147])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 13:33:54 +0000 (GMT)
Message-ID: <1a63bce5-85db-667d-e0c0-5daaa7d0d7a1@linux.ibm.com>
Date: Mon, 12 Dec 2022 08:33:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] s390x/pci: reset ISM passthrough devices on shutdown and
 system reset
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, schnelle@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, iii@linux.ibm.com,
 qemu-devel@nongnu.org
References: <20221209195700.263824-1-mjrosato@linux.ibm.com>
 <8a0aa955-6637-789a-cac3-063c384111dc@redhat.com>
Content-Language: en-US
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <8a0aa955-6637-789a-cac3-063c384111dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J-j2yc1MfwznZ-IE2ZkEl2ni1M8_mfoz
X-Proofpoint-ORIG-GUID: h9JIKVPhOna6GqFrzHM22dkVYTNms7Xt
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120125
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 12/12/22 6:34 AM, Thomas Huth wrote:
> On 09/12/2022 20.57, Matthew Rosato wrote:
>> ISM device firmware stores unique state information that can
>> can cause a wholesale unmap of the associated IOMMU (e.g. when
>> we get a termination signal for QEMU) to trigger firmware errors
>> because firmware believes we are attempting to invalidate entries
>> that are still in-use by the guest OS (when in fact that guest is
>> in the process of being terminated or rebooted).
>> To alleviate this, register both a shutdown notifier (for unexpected
>> termination cases e.g. virsh destroy) as well as a reset callback
>> (for cases like guest OS reboot).  For each of these scenarios, trigger
>> PCI device reset; this is enough to indicate to firmware that the IOMMU
>> is no longer in-use by the guest OS, making it safe to invalidate any
>> associated IOMMU entries.
>>
>> Fixes: 15d0e7942d3b ("s390x/pci: don't fence interpreted devices without MSI-X")
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> ---
>>   hw/s390x/s390-pci-bus.c         | 28 ++++++++++++++++++++++++++++
>>   hw/s390x/s390-pci-vfio.c        |  2 ++
>>   include/hw/s390x/s390-pci-bus.h |  5 +++++
>>   3 files changed, 35 insertions(+)
>>
>> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
>> index 977e7daa15..02751f3597 100644
>> --- a/hw/s390x/s390-pci-bus.c
>> +++ b/hw/s390x/s390-pci-bus.c
>> @@ -24,6 +24,8 @@
>>   #include "hw/pci/msi.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/module.h"
>> +#include "sysemu/reset.h"
>> +#include "sysemu/runstate.h"
>>     #ifndef DEBUG_S390PCI_BUS
>>   #define DEBUG_S390PCI_BUS  0
>> @@ -150,10 +152,30 @@ out:
>>       psccb->header.response_code = cpu_to_be16(rc);
>>   }
>>   +static void s390_pci_shutdown_notifier(Notifier *n, void *opaque)
>> +{
>> +    S390PCIBusDevice *pbdev = container_of(n, S390PCIBusDevice,
>> +                                           shutdown_notifier);
>> +
>> +    pci_device_reset(pbdev->pdev);
>> +}
>> +
>> +static void s390_pci_reset_cb(void *opaque)
>> +{
>> +    S390PCIBusDevice *pbdev = opaque;
>> +
>> +    pci_device_reset(pbdev->pdev);
>> +}
>> +
>>   static void s390_pci_perform_unplug(S390PCIBusDevice *pbdev)
>>   {
>>       HotplugHandler *hotplug_ctrl;
>>   +    if (pbdev->pft == ZPCI_PFT_ISM) {
>> +        notifier_remove(&pbdev->shutdown_notifier);
>> +        qemu_unregister_reset(s390_pci_reset_cb, pbdev);
>> +    }
>> +
>>       /* Unplug the PCI device */
>>       if (pbdev->pdev) {
>>           DeviceState *pdev = DEVICE(pbdev->pdev);
>> @@ -1111,6 +1133,12 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>>                   pbdev->fh |= FH_SHM_VFIO;
>>                   pbdev->forwarding_assist = false;
>>               }
>> +            /* Register shutdown notifier and reset callback for ISM devices */
>> +            if (pbdev->pft == ZPCI_PFT_ISM) {
>> +                pbdev->shutdown_notifier.notify = s390_pci_shutdown_notifier;
>> +                qemu_register_shutdown_notifier(&pbdev->shutdown_notifier);
>> +                qemu_register_reset(s390_pci_reset_cb, pbdev);
>> +            }
>>           } else {
>>               pbdev->fh |= FH_SHM_EMUL;
>>               /* Always intercept emulated devices */
>> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
>> index 5f0adb0b4a..419763f829 100644
>> --- a/hw/s390x/s390-pci-vfio.c
>> +++ b/hw/s390x/s390-pci-vfio.c
>> @@ -122,6 +122,8 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
>>       /* The following values remain 0 until we support other FMB formats */
>>       pbdev->zpci_fn.fmbl = 0;
>>       pbdev->zpci_fn.pft = 0;
>> +    /* Store function type separately for type-specific behavior */
>> +    pbdev->pft = cap->pft;
>>   }
> 
> Thanks, queued:
> 
>  https://gitlab.com/thuth/qemu/-/commits/s390x-next/
> 
> I had to adjust the hunk in s390_pci_read_base() due to a conflict with your earlier patch, please check whether it looks sane to you.

Yep, that adjustment is good (and FWIW, was the same on my local branch).  Thanks!

Matt




