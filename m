Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6563753BCAB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 18:41:53 +0200 (CEST)
Received: from localhost ([::1]:39944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwntQ-0003Lf-3c
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 12:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nwnlx-0005ne-Sx; Thu, 02 Jun 2022 12:34:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nwnlv-0003TC-KM; Thu, 02 Jun 2022 12:34:09 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252F2OVn013401;
 Thu, 2 Jun 2022 16:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Xx/S3ZAS7bBZAis7NRy6d1fGd/lxCqrMcRn7m/1Yxs4=;
 b=iLKq091gT3y+HKGsFQXq36NFTv6h/lxrsBLzuArrrQk9Wi+6Ou/zR6EdPdnLwDCPWv50
 eTGJnadPZO0HH0FispxZSfYUy0tcK6i7Ayg8NAsAa5CVNATHWUKaoRfmd6N4piQkcILn
 n/ZQs2X4SUwrte6v6xueH1tjnGVco4jwqHpn5FuZk7x7ZeOuY+DM74OMY0E+DTa6BC8Y
 Ir09RfdzFeHYPUz38GsTi61Q0HETuBd3VSQ/w/pd8NHniX7G8/QnZwzF8Kob64OcU9xT
 4f3w7Mx+3mgbmrFeJn8zbgEJtu9GU8NI71AXOrkKLoslyuL++ub4xw3XSbzfsGNdFzEP Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3geyg6sq7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:33:50 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252FfxrU005345;
 Thu, 2 Jun 2022 16:33:50 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3geyg6sq72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:33:50 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252GL5DX011813;
 Thu, 2 Jun 2022 16:33:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3gbc7h7asj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 16:33:47 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 252GXjU140436062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jun 2022 16:33:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F156AE04D;
 Thu,  2 Jun 2022 16:33:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3DFEAE045;
 Thu,  2 Jun 2022 16:33:44 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Jun 2022 16:33:44 +0000 (GMT)
Message-ID: <d2ae2236-7a49-22e7-3950-cb635697721a@linux.ibm.com>
Date: Thu, 2 Jun 2022 18:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 08/16] ppc/pnv: user created pnv-phb for powernv9
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk
References: <20220531214917.31668-1-danielhb413@gmail.com>
 <20220531214917.31668-9-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220531214917.31668-9-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TPEmR_W0r8YH67Va-WPv1SDPnQKvZNvL
X-Proofpoint-ORIG-GUID: R02O63nfJiE4ZmqfTbFnQm9pFT7LIlja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_05,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=728 bulkscore=0 clxscore=1015
 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020068
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



On 31/05/2022 23:49, Daniel Henrique Barboza wrote:
> To enable user creatable PnvPHB devices for powernv9 we'll revert the
> powernv9 related changes made in 9c10d86fee "ppc/pnv: Remove
> user-created PHB{3,4,5} devices".
> 
> This change alone isn't enough to enable user creatable devices for powernv10
> due to how pnv_phb4_get_pec() currently works. For now let's just enable it
> for powernv9 alone.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/pci-host/pnv_phb4.c     | 58 +++++++++++++++++++++++++++++++++++++-
>   hw/pci-host/pnv_phb4_pec.c |  6 ++--
>   hw/ppc/pnv.c               |  2 ++
>   3 files changed, 63 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
> index 22cf1c2a5e..a5c8ae494b 100644
> --- a/hw/pci-host/pnv_phb4.c
> +++ b/hw/pci-host/pnv_phb4.c
> @@ -1571,13 +1571,69 @@ void pnv_phb4_bus_init(DeviceState *dev, PnvPHB4 *phb)
>       pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
>   }
>   
> +static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
> +                                         Error **errp)
> +{
> +    Pnv9Chip *chip9 = PNV9_CHIP(chip);
> +    int chip_id = phb->chip_id;
> +    int index = phb->phb_id;
> +    int i, j;
> +
> +    for (i = 0; i < chip->num_pecs; i++) {
> +        /*
> +         * For each PEC, check the amount of phbs it supports
> +         * and see if the given phb4 index matches an index.
> +         */
> +        PnvPhb4PecState *pec = &chip9->pecs[i];
> +
> +        for (j = 0; j < pec->num_phbs; j++) {
> +            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
> +                return pec;
> +            }
> +        }
> +    }
> +
> +    error_setg(errp,
> +               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
> +               chip_id, index);
> +
> +    return NULL;
> +}
> +
>   static void pnv_phb4_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPHB4 *phb = PNV_PHB4(dev);
> +    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
> +    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
>       XiveSource *xsrc = &phb->xsrc;
> +    BusState *s;
> +    Error *local_err = NULL;
>       int nr_irqs;
>       char name[32];
>   
> +    if (!chip) {
> +        error_setg(errp, "invalid chip id: %d", phb->chip_id);
> +        return;
> +    }
> +
> +    /* User created PHBs need to be assigned to a PEC */
> +    if (!phb->pec) {
> +        phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +    }
> +
> +    /* Reparent the PHB to the chip to build the device tree */
> +    pnv_chip_parent_fixup(chip, OBJECT(phb->phb_base), phb->phb_id);


Didn't you mean to do that only for the user-created case? And why not 
attaching the PHB to the PEC instead of the chip, like in 
pnv_pec_default_phb_realize() ? I think it makes more sense to keep the 
chip->PEC->PHB parenting in the qom tree (and incidentally, that's where 
I'd prefer to have the phb3 model move to).
Also, the comment seems wrong to me. The qom parenting doesn't matter 
when building the device tree. We only iterate over the PHBs found in 
the array of the PEC object (cf. pnv_pec_dt_xscom())



> +    s = qdev_get_parent_bus(DEVICE(chip));
> +    if (!qdev_set_parent_bus(DEVICE(phb->phb_base), s, &local_err)) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }


Same comment, I think that's only desirable for user-created devices. 
We're already calling sysbus_realize() for the default case.


Silly question: where does it break if a user tries to create 2 PHBs 
with the same index?


   Fred




>       /* Set the "big_phb" flag */
>       phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
>   
> @@ -1803,7 +1859,7 @@ static void pnv_phb4_root_port_class_init(ObjectClass *klass, void *data)
>       PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
>   
>       dc->desc     = "IBM PHB4 PCIE Root Port";
> -    dc->user_creatable = false;
> +    dc->user_creatable = true;
>   
>       device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
>                                       &rpc->parent_realize);
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 888ecbe8f3..0e67f3a338 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -146,8 +146,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       pec->num_phbs = pecc->num_phbs[pec->index];
>   
>       /* Create PHBs if running with defaults */
> -    for (i = 0; i < pec->num_phbs; i++) {
> -        pnv_pec_default_phb_realize(pec, i, errp);
> +    if (defaults_enabled()) {
> +        for (i = 0; i < pec->num_phbs; i++) {
> +            pnv_pec_default_phb_realize(pec, i, errp);
> +        }
>       }
>   
>       /* Initialize the XSCOM regions for the PEC registers */
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 3b0b230e49..697a2b5302 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -2186,6 +2186,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
>       pmc->compat = compat;
>       pmc->compat_size = sizeof(compat);
>       pmc->dt_power_mgt = pnv_dt_power_mgt;
> +
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
>   }
>   
>   static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)

