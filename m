Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320446B7CB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:44:36 +0100 (CET)
Received: from localhost ([::1]:36990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muX1X-0003Ql-8D
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muWyE-0006Dh-Ty; Tue, 07 Dec 2021 04:41:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muWyC-0001ky-14; Tue, 07 Dec 2021 04:41:10 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B78rJxD013755; 
 Tue, 7 Dec 2021 09:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cY/ZtCWZPuFsf2A5HIGNnFPPMSTLbGROjpvidCJxw+A=;
 b=JH+8VPqRRdtY9+eaeLclCsY6ewNMw5ngasAa0/z9RxgXXDV65+X+4QPBML8paJPeHQJG
 l0cfjgtFUFbBiMmPN54ryu8vWaWGYWbT2AiV7f0MUFWxGbltzH/+VwFzz8amCDhp7RJs
 B30Eo09zm9kx+8D+ldqywnOyFSHzk7BucpDDgMguTesL6/abva35Wom/b5pA4C4x+5hr
 bPVyWgiivRrumt574MIgODZ2mCwyI1NypQUQI6MBzaDPwJVMsiIRsKZrOueglkx829lM
 xofPGCvzbV5Vp/974Lgf6U/M+I80atZG+doGEsncxQ0JMXjrYvlYnr9UoQkDkhZMjIli Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4ge8u2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:41:05 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79bFbO003445;
 Tue, 7 Dec 2021 09:41:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4ge8u2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:41:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B79cgki002968;
 Tue, 7 Dec 2021 09:41:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3cqykj4ucx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:41:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B79f0AD29884884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 09:41:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B16311C05E;
 Tue,  7 Dec 2021 09:41:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 666D611C050;
 Tue,  7 Dec 2021 09:41:00 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 09:41:00 +0000 (GMT)
Message-ID: <6d8c79ed-78b3-c1f9-d9cc-28d74128db64@linux.ibm.com>
Date: Tue, 7 Dec 2021 10:41:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 03/14] ppc/pnv: Move mapping of the PHB3 CQ regions under
 pnv_pbcq_realize()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-4-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3bpY27oLhDmOwwJG-XETUIk6ETiHpdEc
X-Proofpoint-GUID: wG2F1G6OCI6KIIlq3wbidErFdyvBuAF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070056
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/12/2021 15:42, Cédric Le Goater wrote:
> This requires a link to the chip to add the regions under the XSCOM
> address space. This change will help us providing support for user
> created PHB3 devices.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   include/hw/pci-host/pnv_phb3.h |  3 +++
>   hw/pci-host/pnv_phb3.c         |  1 +
>   hw/pci-host/pnv_phb3_pbcq.c    | 11 +++++++++++
>   hw/ppc/pnv.c                   | 14 ++------------
>   4 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index e2a2e3624532..e9c13e6bd821 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -16,6 +16,7 @@
>   #include "qom/object.h"
>   
>   typedef struct PnvPHB3 PnvPHB3;
> +typedef struct PnvChip PnvChip;
>   
>   /*
>    * PHB3 XICS Source for MSIs
> @@ -157,6 +158,8 @@ struct PnvPHB3 {
>       PnvPHB3RootPort root;
>   
>       QLIST_HEAD(, PnvPhb3DMASpace) dma_spaces;
> +
> +    PnvChip *chip;
>   };
>   
>   uint64_t pnv_phb3_reg_read(void *opaque, hwaddr off, unsigned size);
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index a7f96850055a..3aa42ef9d4b9 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1092,6 +1092,7 @@ static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
>   static Property pnv_phb3_properties[] = {
>           DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
>           DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
> +        DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
>           DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/pci-host/pnv_phb3_pbcq.c b/hw/pci-host/pnv_phb3_pbcq.c
> index a0526aa1eca3..c7426cd27a20 100644
> --- a/hw/pci-host/pnv_phb3_pbcq.c
> +++ b/hw/pci-host/pnv_phb3_pbcq.c
> @@ -284,6 +284,17 @@ static void pnv_pbcq_realize(DeviceState *dev, Error **errp)
>       pnv_xscom_region_init(&pbcq->xscom_spci_regs, OBJECT(dev),
>                             &pnv_pbcq_spci_xscom_ops, pbcq, name,
>                             PNV_XSCOM_PBCQ_SPCI_SIZE);
> +
> +    /* Populate the XSCOM address space. */
> +    pnv_xscom_add_subregion(phb->chip,
> +                            PNV_XSCOM_PBCQ_NEST_BASE + 0x400 * phb->phb_id,
> +                            &pbcq->xscom_nest_regs);
> +    pnv_xscom_add_subregion(phb->chip,
> +                            PNV_XSCOM_PBCQ_PCI_BASE + 0x400 * phb->phb_id,
> +                            &pbcq->xscom_pci_regs);
> +    pnv_xscom_add_subregion(phb->chip,
> +                            PNV_XSCOM_PBCQ_SPCI_BASE + 0x040 * phb->phb_id,
> +                            &pbcq->xscom_spci_regs);
>   }
>   
>   static int pnv_pbcq_dt_xscom(PnvXScomInterface *dev, void *fdt,
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 988b305398b2..de277c457838 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1221,25 +1221,15 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>       /* PHB3 controllers */
>       for (i = 0; i < chip->num_phbs; i++) {
>           PnvPHB3 *phb = &chip8->phbs[i];
> -        PnvPBCQState *pbcq = &phb->pbcq;
>   
>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
>           object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
>                                   &error_fatal);
> +        object_property_set_link(OBJECT(phb), "chip", OBJECT(chip),
> +                                 &error_fatal);
>           if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>               return;
>           }
> -
> -        /* Populate the XSCOM address space. */
> -        pnv_xscom_add_subregion(chip,
> -                                PNV_XSCOM_PBCQ_NEST_BASE + 0x400 * phb->phb_id,
> -                                &pbcq->xscom_nest_regs);
> -        pnv_xscom_add_subregion(chip,
> -                                PNV_XSCOM_PBCQ_PCI_BASE + 0x400 * phb->phb_id,
> -                                &pbcq->xscom_pci_regs);
> -        pnv_xscom_add_subregion(chip,
> -                                PNV_XSCOM_PBCQ_SPCI_BASE + 0x040 * phb->phb_id,
> -                                &pbcq->xscom_spci_regs);
>       }
>   }
>   
> 

