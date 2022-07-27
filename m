Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21A75831BD
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 20:14:50 +0200 (CEST)
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGlYM-00059Y-DN
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 14:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl4Z-0005dP-AP; Wed, 27 Jul 2022 13:43:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl4X-0000yi-Fz; Wed, 27 Jul 2022 13:43:51 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHfg8x013499;
 Wed, 27 Jul 2022 17:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TZDtRL6Nm1AUYftR/Wx0I4jEYPfjJRLUQBatHx9HD5M=;
 b=BPUE+k5aeMmSN45LEm34ZBavo4JaYWSBtiPbt1wP5nRWbbCknVMYoJHWJXw+ih7Byosy
 hU8rapdfDYlYGBBFgm/yM2vzWKiG32ewCCMrskB/S1DZq1zie8Rl1HCSclETqtDwjCsH
 MxQHu2BAQzExfioBc4ExJVn+/IJrNYAHoqGttGVfneZug0jHTch0L7KxhPuInaOBunbG
 TfOIIgLz+F0BGZ3v3sHV4FN0xpb/9sFXxz5+7JNHWY52mWycTcthl7iBl6Y9vAYU17mD
 SOqtwUKzFrDYk8L3edDmCWniFB/QR/QS6Ppl0O+kkf8BYTRiGebmLgEjNyPWGPmpWxNa QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9mc8xu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:43:45 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHg6HL015493;
 Wed, 27 Jul 2022 17:43:44 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hk9mc8xtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:43:44 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHZha9029870;
 Wed, 27 Jul 2022 17:43:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tdb1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:43:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26RHhdnB11600142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:43:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D38BC11C04C;
 Wed, 27 Jul 2022 17:43:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A0AE11C04A;
 Wed, 27 Jul 2022 17:43:39 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:43:39 +0000 (GMT)
Message-ID: <ebeb7869-0e06-504b-4585-5098cc01f6a3@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 09/12] ppc/pnv: remove root port name from
 pnv_phb_attach_root_port()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-10-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-10-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YzhjlyxUVMkT44yebt3p7Z3J45jRQH-L
X-Proofpoint-GUID: Dt3SCXIbPvv_a39aMh1buxuDBJawHaoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 24/06/2022 10:49, Daniel Henrique Barboza wrote:
> We support only a single root port, PNV_PHB_ROOT_PORT.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb.c | 7 +------
>   hw/ppc/pnv.c          | 9 +++++----
>   include/hw/ppc/pnv.h  | 3 +--
>   3 files changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index da729e89e7..cc15a949c9 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -24,7 +24,6 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>       PnvPHB *phb = PNV_PHB(dev);
>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>       g_autofree char *phb_typename = NULL;
> -    g_autofree char *phb_rootport_typename = NULL;
>   
>       if (!phb->version) {
>           error_setg(errp, "version not specified");
> @@ -34,15 +33,12 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>       switch (phb->version) {
>       case 3:
>           phb_typename = g_strdup(TYPE_PNV_PHB3);
> -        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
>           break;
>       case 4:
>           phb_typename = g_strdup(TYPE_PNV_PHB4);
> -        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
>           break;
>       case 5:
>           phb_typename = g_strdup(TYPE_PNV_PHB5);
> -        phb_rootport_typename = g_strdup(TYPE_PNV_PHB_ROOT_PORT);
>           break;
>       default:
>           g_assert_not_reached();
> @@ -73,8 +69,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
>           pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
>       }
>   
> -    pnv_phb_attach_root_port(pci, phb_rootport_typename,
> -                             phb->phb_id, phb->chip_id);
> +    pnv_phb_attach_root_port(pci, phb->phb_id, phb->chip_id);
>   }
>   
>   static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 159899103e..5b7cbfc699 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1199,11 +1199,12 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
>    * QOM id. 'chip_id' is going to be used as PCIE chassis for the
>    * root port.
>    */
> -void pnv_phb_attach_root_port(PCIHostState *pci, const char *name,
> -                              int index, int chip_id)
> +void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
>   {
> -    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
> -    g_autofree char *default_id = g_strdup_printf("%s[%d]", name, index);
> +    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
> +    g_autofree char *default_id = g_strdup_printf("%s[%d]",
> +                                                  TYPE_PNV_PHB_ROOT_PORT,
> +                                                  index);
>       const char *dev_id = DEVICE(root)->id;
>   
>       object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 33b7b52f45..fbad11d6a7 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -190,8 +190,7 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>                            TYPE_PNV_CHIP_POWER10)
>   
>   PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
> -void pnv_phb_attach_root_port(PCIHostState *pci, const char *name,
> -                              int index, int chip_id);
> +void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id);
>   
>   #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>   typedef struct PnvMachineClass PnvMachineClass;

