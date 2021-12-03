Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC4467719
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:09:24 +0100 (CET)
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt7NT-0006Yh-Bm
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:09:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt7LD-0004bW-2y; Fri, 03 Dec 2021 07:07:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45830
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt7LA-0003sx-QC; Fri, 03 Dec 2021 07:07:02 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3BkhTG017437; 
 Fri, 3 Dec 2021 12:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tZ9fEsWZiJdAY2JOM3CKdQo+XK+XmBBd1nC70B8sfB8=;
 b=ETYGGAu5WCio34smXvXVQvoPL0uBjbHV6vlOzLs/G6iXmsmJwkM55QZjQOLYh8C8ONgF
 vFs01PTsCYy1vm5oBYR7v3oGb1jFq309OTiiIPAUYrbkUajVdqmDy6ttQISjIWHX7ZJO
 /02JGPm9cWh8m+yLIidYsg72N0350ncsjmMbF+vX73qJXvRjR+neHxQEAkOlmmQT/Oyf
 rr6l6Ec9jpGW0DhQQibo0WRTzQVqm3aAnRUW0TK6XL8qdQIO1/0SM1i9KPn6cNBmCJY1
 xGnWuvnvcbziMX/7e172DHYkP3VW02Ha6Nk1nZd6066QVVndo++RPhRci2M4QYqPvLLM 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqjnrgcdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:06:59 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3Bkj4t017545;
 Fri, 3 Dec 2021 12:06:58 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cqjnrgcd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:06:58 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3C4CuN026899;
 Fri, 3 Dec 2021 12:06:57 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3cn5f1njcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:06:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3C6uIW21299598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 12:06:56 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 277F778063;
 Fri,  3 Dec 2021 12:06:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E3447805F;
 Fri,  3 Dec 2021 12:06:55 +0000 (GMT)
Received: from [9.211.96.25] (unknown [9.211.96.25])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 12:06:54 +0000 (GMT)
Message-ID: <5d6fb517-bd8f-26cc-89cd-6c19c773ef8b@linux.ibm.com>
Date: Fri, 3 Dec 2021 07:06:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/4] s390x/pci: add supported DT information to clp
 response
Content-Language: en-US
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-5-mjrosato@linux.ibm.com>
In-Reply-To: <20211202164110.326947-5-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LQAVY8i-240IHx6HRDOVbf1i9-rYPIIV
X-Proofpoint-ORIG-GUID: vkX8FdS6gQa509Qaiq657CBpSPNoS5Xc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_06,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 mlxscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030076
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 11:41 AM, Matthew Rosato wrote:
> The DTSM is a mask that specifies which I/O Address Translation designation
> types are supported.  A linux guest today does not look at this field but
> could in the future; let's advertise what QEMU actually supports.

Will send a v2, this patch is missing a line in clp_service_call to copy 
the byte into the guest payload (forgot it's not a memcpy anymore)

> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c         | 1 +
>   hw/s390x/s390-pci-vfio.c        | 1 +
>   include/hw/s390x/s390-pci-bus.h | 1 +
>   include/hw/s390x/s390-pci-clp.h | 3 ++-
>   4 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 1b51a72838..01b58ebc70 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -782,6 +782,7 @@ static void s390_pci_init_default_group(void)
>       resgrp->i = 128;
>       resgrp->maxstbl = 128;
>       resgrp->version = 0;
> +    resgrp->dtsm = ZPCI_DTSM;
>   }
>   
>   static void set_pbdev_info(S390PCIBusDevice *pbdev)
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index 2a153fa8c9..6f80a47e29 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -160,6 +160,7 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
>           resgrp->i = cap->noi;
>           resgrp->maxstbl = cap->maxstbl;
>           resgrp->version = cap->version;
> +        resgrp->dtsm = ZPCI_DTSM;
>       }
>   }
>   
> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
> index 2727e7bdef..da3cde2bb4 100644
> --- a/include/hw/s390x/s390-pci-bus.h
> +++ b/include/hw/s390x/s390-pci-bus.h
> @@ -37,6 +37,7 @@
>   #define ZPCI_MAX_UID 0xffff
>   #define UID_UNDEFINED 0
>   #define UID_CHECKING_ENABLED 0x01
> +#define ZPCI_DTSM 0x40
>   
>   OBJECT_DECLARE_SIMPLE_TYPE(S390pciState, S390_PCI_HOST_BRIDGE)
>   OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBus, S390_PCI_BUS)
> diff --git a/include/hw/s390x/s390-pci-clp.h b/include/hw/s390x/s390-pci-clp.h
> index 96b8e3f133..cc8c8662b8 100644
> --- a/include/hw/s390x/s390-pci-clp.h
> +++ b/include/hw/s390x/s390-pci-clp.h
> @@ -163,7 +163,8 @@ typedef struct ClpRspQueryPciGrp {
>       uint8_t fr;
>       uint16_t maxstbl;
>       uint16_t mui;
> -    uint64_t reserved3;
> +    uint8_t dtsm;
> +    uint8_t reserved3[7];
>       uint64_t dasm; /* dma address space mask */
>       uint64_t msia; /* MSI address */
>       uint64_t reserved4;
> 


