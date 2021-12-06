Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCFE46992C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:39:28 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muF9L-00074p-Ci
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:39:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1muF4T-00075y-LB; Mon, 06 Dec 2021 09:34:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20146
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1muF4R-0004M2-1B; Mon, 06 Dec 2021 09:34:25 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6DLNef003609; 
 Mon, 6 Dec 2021 14:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=kusg7zozu6tlZux31yVAzcO3bjE9yGp3nDcR2zNb2vY=;
 b=k/S+3XS86s3xLD52e7VQb/t6+Amg70zyYtVsK6i1G0ZzZhGCoUj+sKSwv+D+ZiskDFDp
 /MHs06idmxSx9hfxokIXcbUqwCYyu6qXbpN2k2Wjk4Ss6TPjFw2m0kUKzHB8Rk7GTcX3
 XWDDcsBaDxifG4tHrvumZZWKuiytPVNvGPU40CilYEg5u/H0gcmM40VUzsuBGcNFrJ2k
 ZTDv+t+2Uom13bn1wVX2N456Wt5mV2YwTXW6HRg5tzbd2AGKLEIM/F2c/gZnB0IcbAef
 BhPN3ddXrqAu7DCESeDcbLfcq69iAnhH2EFSlGkUIje/46zSFWX0Qgbxn/kj8tLouy0K aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cskb39hbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 14:34:20 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B6DUOcE008140;
 Mon, 6 Dec 2021 14:34:19 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cskb39hbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 14:34:19 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B6ERl7E024776;
 Mon, 6 Dec 2021 14:34:18 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 3cqyy9q0x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 14:34:18 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B6EYHRD32702956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 14:34:17 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54704BE056;
 Mon,  6 Dec 2021 14:34:17 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 640ACBE05A;
 Mon,  6 Dec 2021 14:34:16 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.70.80])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  6 Dec 2021 14:34:16 +0000 (GMT)
Message-ID: <695d48c2db44ab02e333ad817779d9265832a3a9.camel@linux.ibm.com>
Subject: Re: [PATCH v3 4/4] s390x/pci: add supported DT information to clp
 response
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Mon, 06 Dec 2021 09:34:15 -0500
In-Reply-To: <20211203142706.427279-5-mjrosato@linux.ibm.com>
References: <20211203142706.427279-1-mjrosato@linux.ibm.com>
 <20211203142706.427279-5-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NGw4hmPW1EJc3KrQHJgZXwze-kIAGzx7
X-Proofpoint-GUID: CToQkQ_nL_2dfcsaC02p1ZvJwOO8U2j-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_05,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060091
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-12-03 at 09:27 -0500, Matthew Rosato wrote:
> The DTSM is a mask that specifies which I/O Address Translation
> designation
> types are supported.  Today QEMU only supports DT=1.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
>  hw/s390x/s390-pci-bus.c         | 1 +
>  hw/s390x/s390-pci-inst.c        | 1 +
>  hw/s390x/s390-pci-vfio.c        | 1 +
>  include/hw/s390x/s390-pci-bus.h | 1 +
>  include/hw/s390x/s390-pci-clp.h | 3 ++-
>  5 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 1b51a72838..01b58ebc70 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -782,6 +782,7 @@ static void s390_pci_init_default_group(void)
>      resgrp->i = 128;
>      resgrp->maxstbl = 128;
>      resgrp->version = 0;
> +    resgrp->dtsm = ZPCI_DTSM;
>  }
>  
>  static void set_pbdev_info(S390PCIBusDevice *pbdev)
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 07bab85ce5..6d400d4147 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -329,6 +329,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2,
> uintptr_t ra)
>          stw_p(&resgrp->i, group->zpci_group.i);
>          stw_p(&resgrp->maxstbl, group->zpci_group.maxstbl);
>          resgrp->version = group->zpci_group.version;
> +        resgrp->dtsm = group->zpci_group.dtsm;
>          stw_p(&resgrp->hdr.rsp, CLP_RC_OK);
>          break;
>      }
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index 2a153fa8c9..6f80a47e29 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -160,6 +160,7 @@ static void s390_pci_read_group(S390PCIBusDevice
> *pbdev,
>          resgrp->i = cap->noi;
>          resgrp->maxstbl = cap->maxstbl;
>          resgrp->version = cap->version;
> +        resgrp->dtsm = ZPCI_DTSM;
>      }
>  }
>  
> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-
> pci-bus.h
> index 2727e7bdef..da3cde2bb4 100644
> --- a/include/hw/s390x/s390-pci-bus.h
> +++ b/include/hw/s390x/s390-pci-bus.h
> @@ -37,6 +37,7 @@
>  #define ZPCI_MAX_UID 0xffff
>  #define UID_UNDEFINED 0
>  #define UID_CHECKING_ENABLED 0x01
> +#define ZPCI_DTSM 0x40
>  
>  OBJECT_DECLARE_SIMPLE_TYPE(S390pciState, S390_PCI_HOST_BRIDGE)
>  OBJECT_DECLARE_SIMPLE_TYPE(S390PCIBus, S390_PCI_BUS)
> diff --git a/include/hw/s390x/s390-pci-clp.h b/include/hw/s390x/s390-
> pci-clp.h
> index 96b8e3f133..cc8c8662b8 100644
> --- a/include/hw/s390x/s390-pci-clp.h
> +++ b/include/hw/s390x/s390-pci-clp.h
> @@ -163,7 +163,8 @@ typedef struct ClpRspQueryPciGrp {
>      uint8_t fr;
>      uint16_t maxstbl;
>      uint16_t mui;
> -    uint64_t reserved3;
> +    uint8_t dtsm;
> +    uint8_t reserved3[7];
>      uint64_t dasm; /* dma address space mask */
>      uint64_t msia; /* MSI address */
>      uint64_t reserved4;


