Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DA92B6E80
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:22:35 +0100 (CET)
Received: from localhost ([::1]:47560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf6Yk-0004jy-PO
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kf6XA-0003mj-Gn; Tue, 17 Nov 2020 14:20:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kf6X8-0001t7-7f; Tue, 17 Nov 2020 14:20:56 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHJ44K1041816; Tue, 17 Nov 2020 14:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=r7Ft0EsQJLnQogwbohAGpFROMUkpyoNS1IJ6/PhGFl4=;
 b=Lmm6vPQEK/115NTBzS4LZkiVkkO2VmQ4FR3pr6JX1la6VcQ7IURxm8CO7WyzugSZCY7Y
 HwQMxQWPhhRRU7bMJ5vm9cHHqXIGx5KLtGAHNVs8MaS0XYTgu84ScvtRT5ptxy0+89An
 /5HcKD6b//O1rReg/G3moVYG47DWdVNqkNHBxANbN+h+UmxXhnCaGpQDt8HHlOrsls6x
 epi4m+Y9493mUYwKTM4oGKBS7r3LWJD+6+iF4+b3uSO7vXXj5v9+Ur/e0Qg8l943V2ID
 O5Og7I0jDAsk/jI+cIgA7p+RNI7aJJLsTKl0HnPelYN782V+rIV1gkVFam/gwpOzujMK pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34veevd9bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:20:50 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AHJ4GsF042971;
 Tue, 17 Nov 2020 14:20:49 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34veevd9b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:20:49 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHJIQCh016857;
 Tue, 17 Nov 2020 19:20:49 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 34t6v90r8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 19:20:49 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHJKmtD25428254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 19:20:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87180112065;
 Tue, 17 Nov 2020 19:20:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3078E112064;
 Tue, 17 Nov 2020 19:20:46 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.48.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Nov 2020 19:20:45 +0000 (GMT)
Subject: Re: [PATCH for-5.2] s390x/pci: fix endianness issues
To: Cornelia Huck <cohuck@redhat.com>
References: <20201117171340.1289659-1-cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <9a01d906-31f4-37a8-4886-da506782ca5b@linux.ibm.com>
Date: Tue, 17 Nov 2020 14:20:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201117171340.1289659-1-cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_07:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=2
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170133
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 13:19:10
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 12:13 PM, Cornelia Huck wrote:
> zPCI control blocks are big endian, we need to take care that we
> do proper accesses in order not to break tcg guests on little endian
> hosts.
> 
> Fixes: 28dc86a07299 ("s390x/pci: use a PCI Group structure")
> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
> Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> Works for me with virtio-pci devices for tcg on x86 and s390x, and for kvm.
> The vfio changes are not strictly needed; did not test them due to lack of
> hardware -- testing appreciated.
> 
> As this fixes a regression, I want this in 5.2.
> 
> ---
>   hw/s390x/s390-pci-bus.c  | 12 ++++++------
>   hw/s390x/s390-pci-inst.c |  4 ++--
>   hw/s390x/s390-pci-vfio.c |  8 ++++----
>   3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index e0dc20ce4a56..17e64e0b1200 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -787,12 +787,12 @@ static void s390_pci_init_default_group(void)
>   
>   static void set_pbdev_info(S390PCIBusDevice *pbdev)
>   {
> -    pbdev->zpci_fn.sdma = ZPCI_SDMA_ADDR;
> -    pbdev->zpci_fn.edma = ZPCI_EDMA_ADDR;
> -    pbdev->zpci_fn.pchid = 0;
> +    stq_p(&pbdev->zpci_fn.sdma, ZPCI_SDMA_ADDR);
> +    stq_p(&pbdev->zpci_fn.edma, ZPCI_EDMA_ADDR);
> +    stw_p(&pbdev->zpci_fn.pchid, 0);
>       pbdev->zpci_fn.pfgid = ZPCI_DEFAULT_FN_GRP;
> -    pbdev->zpci_fn.fid = pbdev->fid;
> -    pbdev->zpci_fn.uid = pbdev->uid;
> +    stl_p(&pbdev->zpci_fn.fid, pbdev->fid);
> +    stl_p(&pbdev->zpci_fn.uid, pbdev->uid);
>       pbdev->pci_group = s390_group_find(ZPCI_DEFAULT_FN_GRP);
>   }
>   
> @@ -871,7 +871,7 @@ static int s390_pci_msix_init(S390PCIBusDevice *pbdev)
>       memory_region_init_io(&pbdev->msix_notify_mr, OBJECT(pbdev),
>                             &s390_msi_ctrl_ops, pbdev, name, PAGE_SIZE);
>       memory_region_add_subregion(&pbdev->iommu->mr,
> -                                pbdev->pci_group->zpci_group.msia,
> +                                ldq_p(&pbdev->pci_group->zpci_group.msia),
>                                   &pbdev->msix_notify_mr);
>       g_free(name);
>   
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 58cd041d17fb..7bc6b79f10ce 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>           ClpReqQueryPciGrp *reqgrp = (ClpReqQueryPciGrp *)reqh;
>           S390PCIGroup *group;
>   
> -        group = s390_group_find(reqgrp->g);
> +        group = s390_group_find(ldl_p(&reqgrp->g));

So as I alluded to in my other email, this should really be:
+        group = s390_group_find(ldl_p(&reqgrp->g) & 
CLP_REQ_QPCIG_MASK_PFGID);

To ensure that only the 8b pfgid is used from the 32b 'g' - doing it 
this way ensure we've already accounted for endianness.  The other 24b 
are reserved 0s so that's why things are working anyway without this 
mask.  If you'd prefer to split this change off, we can do that too.

I took this for a spin (with AND without that 1-liner change) with 
vfio-pci, driving network and disk workloads using a fairly recent 
(5.10-rc3) kernel in host/guest.  I also rolled back the host to an 
older kernel (so, no hardware capabilities from vfio) to drive the 
default clp paths against vfio -- Everything works fine there.  I also 
tested (with AND without that 1-liner change) against a tcg guest on x86 
using a virtio-blk-pci device.

So either way, thank you and:

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>


>           if (!group) {
>               /* We do not allow access to unknown groups */
>               /* The group must have been obtained with a vfio device */
> @@ -788,7 +788,7 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>       /* Length must be greater than 8, a multiple of 8 */
>       /* and not greater than maxstbl */
>       if ((len <= 8) || (len % 8) ||
> -        (len > pbdev->pci_group->zpci_group.maxstbl)) {
> +        (len > lduw_p(&pbdev->pci_group->zpci_group.maxstbl))) {
>           goto specification_error;
>       }
>       /* Do not cross a 4K-byte boundary */
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index d5c78063b5bc..f455c6f20a1a 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -116,10 +116,10 @@ static void s390_pci_read_base(S390PCIBusDevice *pbdev,
>       }
>       cap = (void *) hdr;
>   
> -    pbdev->zpci_fn.sdma = cap->start_dma;
> -    pbdev->zpci_fn.edma = cap->end_dma;
> -    pbdev->zpci_fn.pchid = cap->pchid;
> -    pbdev->zpci_fn.vfn = cap->vfn;
> +    stq_p(&pbdev->zpci_fn.sdma, cap->start_dma);
> +    stq_p(&pbdev->zpci_fn.edma, cap->end_dma);
> +    stw_p(&pbdev->zpci_fn.pchid, cap->pchid);
> +    stw_p(&pbdev->zpci_fn.vfn, cap->vfn);
>       pbdev->zpci_fn.pfgid = cap->gid;
>       /* The following values remain 0 until we support other FMB formats */
>       pbdev->zpci_fn.fmbl = 0;
> 


