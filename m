Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9B469327
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:01:42 +0100 (CET)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muAoX-0003xO-OZ
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:01:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1muAm2-00030z-TN; Mon, 06 Dec 2021 04:59:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11772
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1muAm0-00043T-KQ; Mon, 06 Dec 2021 04:59:06 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B68r5dq005446; 
 Mon, 6 Dec 2021 09:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O9xxr7Tv86EAP8H2rAWvxu5PBNBZq3Ep2L3rdxpeemU=;
 b=El9hYa5kUSn4gvyyaKwI+XHbC8ysgGZjS82qWNQC4i+fdBuhpnG1gQR+k/wgs0ncb9OA
 LCACSv02AuNQEpmSCmIp4Q3sLX5Da+K8b+TFN9dTNmhg6q/2EqIDz0nZQ3g0xjIYecTd
 qVoKFm305LVluW+ClKgHfjpOGH4Qwl7Z86tVa8HhmUjdS5/bT/NWwld/7aw08vTuIxI4
 NDSIBdb9g0tte6gwDfeZHQq3PTC4yoTeiW51svQmxkZ3JRG9oooZfaXy0DLrbrkdNpkV
 siUJIhGKqfuLUAg0ndDALavvc2vnMhY290BHE10rwYEoi52qOX+kavdoMqCv6DbHuD28 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3csfd0s3qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:58:56 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B69wuiq014150;
 Mon, 6 Dec 2021 09:58:56 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3csfd0s3qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:58:56 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B69qaU1024197;
 Mon, 6 Dec 2021 09:58:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3cqykhtxun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:58:54 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B69pCCZ29360572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 09:51:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3D8EAE055;
 Mon,  6 Dec 2021 09:58:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DF8EAE053;
 Mon,  6 Dec 2021 09:58:50 +0000 (GMT)
Received: from [9.171.36.79] (unknown [9.171.36.79])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Dec 2021 09:58:50 +0000 (GMT)
Message-ID: <3ff513c8-0d1e-ff23-0844-17e0838edac7@linux.ibm.com>
Date: Mon, 6 Dec 2021 10:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 4/4] s390x/pci: add supported DT information to clp
 response
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211203142706.427279-1-mjrosato@linux.ibm.com>
 <20211203142706.427279-5-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20211203142706.427279-5-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IhOS3Oy2-Mgk2ENzPx6WqaA5T5P1S9nU
X-Proofpoint-GUID: Fha3UQLWaR4Ho0J7mxFS_Osj88JnjISr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_03,2021-12-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112060056
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.076,
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
Cc: farman@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/3/21 15:27, Matthew Rosato wrote:
> The DTSM is a mask that specifies which I/O Address Translation designation
> types are supported.  Today QEMU only supports DT=1.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-bus.c         | 1 +
>   hw/s390x/s390-pci-inst.c        | 1 +
>   hw/s390x/s390-pci-vfio.c        | 1 +
>   include/hw/s390x/s390-pci-bus.h | 1 +
>   include/hw/s390x/s390-pci-clp.h | 3 ++-
>   5 files changed, 6 insertions(+), 1 deletion(-)
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
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 07bab85ce5..6d400d4147 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -329,6 +329,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>           stw_p(&resgrp->i, group->zpci_group.i);
>           stw_p(&resgrp->maxstbl, group->zpci_group.maxstbl);
>           resgrp->version = group->zpci_group.version;
> +        resgrp->dtsm = group->zpci_group.dtsm;
>           stw_p(&resgrp->hdr.rsp, CLP_RC_OK);
>           break;
>       }
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
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>


-- 
Pierre Morel
IBM Lab Boeblingen

