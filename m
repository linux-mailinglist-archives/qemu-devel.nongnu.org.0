Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F50E46B815
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:52:59 +0100 (CET)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muX9e-0005hk-GG
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:52:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muX8Y-0004Io-VC; Tue, 07 Dec 2021 04:51:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muX8W-0006yO-GP; Tue, 07 Dec 2021 04:51:50 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B79IaeZ004968; 
 Tue, 7 Dec 2021 09:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cEY1uDwBLR0Ukw9YrAEveAgWMgw4OzVS6PfShfhhR3Y=;
 b=jJgQRHxOO73PpBhRAcaRzP/HyeC/G6LxxNldrSRhSOvplO+sU0M3RiSWsbijLUrHmS3r
 FwF4CYDx+eCVXxoP+Kyo99WZb7dw7Y8D2T5XK7JKMHr+fGM/60YOdpGOnnxgScHpy0WF
 txnKsU0wHGd9NMopnFcou+eSX6TU+eGvUFZt+ATjVss6whH1H1pfT78yH9dxBnsFsxFQ
 7k6GSfsyPR53g6Tw6jdmu/215MpAqhRhUZgzOGdPCmNwwgKU4532J2kV2Mcg3+bvTjLO
 MC/rXeyHvifCU+3zQ3+JnlB50zTuHFg8MvKCdBwDZniZ1Y/D9O+fTWm9nifMMYlYm5St 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4vaghb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:51:38 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79i6ul027507;
 Tue, 7 Dec 2021 09:51:38 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4vaghag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:51:38 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B79lnjN005680;
 Tue, 7 Dec 2021 09:51:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3cqyy9vtyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:51:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B79pXDR25559520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 09:51:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D57B011C050;
 Tue,  7 Dec 2021 09:51:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71EDB11C054;
 Tue,  7 Dec 2021 09:51:33 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 09:51:33 +0000 (GMT)
Message-ID: <0e06023d-1662-d757-0a02-d15a8fa2c28b@linux.ibm.com>
Date: Tue, 7 Dec 2021 10:51:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 05/14] ppc/pnv: Reparent user created PHB3 devices to the
 PnvChip
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-6-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eryAWVZn3iG3BCf4nGwORhQSlV-77LkB
X-Proofpoint-GUID: CSU58ahInKOKjPbziB0espcHHEwHVspl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070056
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 02/12/2021 15:42, Cédric Le Goater wrote:
> The powernv machine uses the object hierarchy to populate the device
> tree and each device should be parented to the chip it belongs to.
> This is not the case for user created devices which are parented to
> the container "/unattached".
> 
> Make sure a PHB3 device is parented to its chip by reparenting the
> object if necessary.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


It will also be used later for P9, which explains why it's done that 
way, I think. Looks ok to me.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   include/hw/ppc/pnv.h   |  1 +
>   hw/pci-host/pnv_phb3.c |  6 ++++++
>   hw/ppc/pnv.c           | 17 +++++++++++++++++
>   3 files changed, 24 insertions(+)
> 
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 0710673a7fd8..247379ef1f88 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -175,6 +175,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>                            TYPE_PNV_CHIP_POWER10)
>   
>   PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
> +void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index);
>   
>   #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>   typedef struct PnvMachineClass PnvMachineClass;
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index dd1cf37288a0..e91f658b0060 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -1005,6 +1005,12 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>               error_setg(errp, "invalid chip id: %d", phb->chip_id);
>               return;
>           }
> +
> +        /*
> +         * Reparent user created devices to the chip to build
> +         * correctly the device tree.
> +         */
> +        pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
>       }
>   
>       /* LSI sources */
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d7fe92cb082d..9a458655efd9 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1784,6 +1784,23 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
>       return NULL;
>   }
>   
> +void pnv_chip_parent_fixup(PnvChip *chip, Object *obj, int index)
> +{
> +    Object *parent = OBJECT(chip);
> +    g_autofree char *default_id =
> +        g_strdup_printf("%s[%d]", object_get_typename(obj), index);
> +
> +    if (obj->parent == parent) {
> +        return;
> +    }
> +
> +    object_ref(obj);
> +    object_unparent(obj);
> +    object_property_add_child(
> +        parent, DEVICE(obj)->id ? DEVICE(obj)->id : default_id, obj);
> +    object_unref(obj);
> +}
> +
>   PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
>   {
>       int i;
> 

