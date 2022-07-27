Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D0A583178
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 20:08:16 +0200 (CEST)
Received: from localhost ([::1]:46038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGlS9-0000HL-Mn
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 14:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl5p-0006g3-Sl; Wed, 27 Jul 2022 13:45:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oGl5W-00012F-2S; Wed, 27 Jul 2022 13:45:01 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RHhMiq016030;
 Wed, 27 Jul 2022 17:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hMTe7Mtj65hpRDNnK+sEFl3V+Gt+d+X+4wiajcLwcac=;
 b=HEsZ8aFg/FoELja884tF2WxGWHeh8b/ehT/12BxZmmz09NaR7RKzNf0lR1cbsNCd1G9v
 yUqWBe7tYLvwnWiJQADuNLAjtMt3jT4u/zwJlnTn2cl5s35l1Rzfy/4iOtV1OGcWdU1s
 1HMNzSbCrol5cuS0/ejuFFK7ERA+cH0ZFyUhOY5Sc3gWV8GcnVV1PmmR1h/LM3vRncjC
 QwW8nI0qt1ITQG5ZWhmHU/BFFeKQAfrPTivNGOif4EC/BQkZe5pNgZtFL3buoQqoOTiv
 5v1GT+/IvaUqW1X3xcIRSHHCqkVgXg4zlKymCeKaNYLlhwn8lonbBeWkqCHT1BQuvrvg lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka0rg1y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:44:42 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26RHi0FA018076;
 Wed, 27 Jul 2022 17:44:41 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hka0rg1v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:44:41 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26RHZKEm019571;
 Wed, 27 Jul 2022 17:44:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3hg96wnc12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jul 2022 17:44:39 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26RHipUo17433082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 17:44:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B97D111C04C;
 Wed, 27 Jul 2022 17:44:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E53611C04A;
 Wed, 27 Jul 2022 17:44:37 +0000 (GMT)
Received: from [9.171.34.118] (unknown [9.171.34.118])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jul 2022 17:44:37 +0000 (GMT)
Message-ID: <6263ea8b-fe2b-492e-087e-d15b33d91863@linux.ibm.com>
Date: Wed, 27 Jul 2022 19:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 12/12] ppc/pnv: move attach_root_port helper to
 pnv-phb.c
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220624084921.399219-1-danielhb413@gmail.com>
 <20220624084921.399219-13-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220624084921.399219-13-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _8o2_2Q0bIxjexGccuqf5AzvGM_BiUHK
X-Proofpoint-ORIG-GUID: wxCEwVRQMeTw68LHTk-zEh5f5J6UcMGD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
> The helper is only used in this file.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb.c | 24 ++++++++++++++++++++++++
>   hw/ppc/pnv.c          | 25 -------------------------
>   include/hw/ppc/pnv.h  |  1 -
>   3 files changed, 24 insertions(+), 26 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
> index cc15a949c9..c47ed92462 100644
> --- a/hw/pci-host/pnv_phb.c
> +++ b/hw/pci-host/pnv_phb.c
> @@ -18,6 +18,30 @@
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
>   
> +/*
> + * Attach a root port device.
> + *
> + * 'index' will be used both as a PCIE slot value and to calculate
> + * QOM id. 'chip_id' is going to be used as PCIE chassis for the
> + * root port.
> + */
> +static void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
> +{
> +    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
> +    g_autofree char *default_id = g_strdup_printf("%s[%d]",
> +                                                  TYPE_PNV_PHB_ROOT_PORT,
> +                                                  index);
> +    const char *dev_id = DEVICE(root)->id;
> +
> +    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
> +                              OBJECT(root));
> +
> +    /* Set unique chassis/slot values for the root port */
> +    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
> +    qdev_prop_set_uint16(DEVICE(root), "slot", index);
> +
> +    pci_realize_and_unref(root, pci->bus, &error_fatal);
> +}
>   
>   static void pnv_phb_realize(DeviceState *dev, Error **errp)
>   {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 5b7cbfc699..d649ed6b1b 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1192,31 +1192,6 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
>       }
>   }
>   
> -/*
> - * Attach a root port device.
> - *
> - * 'index' will be used both as a PCIE slot value and to calculate
> - * QOM id. 'chip_id' is going to be used as PCIE chassis for the
> - * root port.
> - */
> -void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
> -{
> -    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
> -    g_autofree char *default_id = g_strdup_printf("%s[%d]",
> -                                                  TYPE_PNV_PHB_ROOT_PORT,
> -                                                  index);
> -    const char *dev_id = DEVICE(root)->id;
> -
> -    object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
> -                              OBJECT(root));
> -
> -    /* Set unique chassis/slot values for the root port */
> -    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
> -    qdev_prop_set_uint16(DEVICE(root), "slot", index);
> -
> -    pci_realize_and_unref(root, pci->bus, &error_fatal);
> -}
> -
>   static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>   {
>       PnvChipClass *pcc = PNV_CHIP_GET_CLASS(dev);
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index fbad11d6a7..033d907287 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -190,7 +190,6 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>                            TYPE_PNV_CHIP_POWER10)
>   
>   PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
> -void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id);
>   
>   #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>   typedef struct PnvMachineClass PnvMachineClass;

