Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7846B89F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:16:03 +0100 (CET)
Received: from localhost ([::1]:60994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXVy-0005kG-1s
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:16:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXQm-0006n2-QB; Tue, 07 Dec 2021 05:10:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXQh-0003Px-5R; Tue, 07 Dec 2021 05:10:38 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B78mJEJ015818; 
 Tue, 7 Dec 2021 10:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=W8mZO20fyRW3krX39PwA2t8uqtw2+txoUpKo8ABnXgA=;
 b=GHzm2hYnDGqCuiqlvZc01JDdFZT/6DARMHBYnbTUkfCJijNe9Id91yVOvPPVEfEUn7du
 zasDj2o3GARm4MLhX3Hpt6N9/RAYeJ/xIv/P7bdyC9REYZ3xPV6/GBALXUSb8aDuIbyg
 dkJz8Eryx+h4qkN/keFt5A7TvbXsT8kfZNwjhqULx5Zq79sAwAI4NEM84N5iOlBf5uG/
 hmpuqrJ3xBJkKpqQjykErQWNEjF2ljF1wdh934AFJ9NfGFtalyYiX1/bZWdDcWEzdasl
 ke72B85ununDXKoyr+GphuZ2w5YoiyIl7PyoFE1VzNQwEvB4N14Rg34C/6dim2IwzFF7 xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4e41fnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:10:31 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79VdOw011196;
 Tue, 7 Dec 2021 10:10:30 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4e41fmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:10:30 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7A1o28026650;
 Tue, 7 Dec 2021 10:10:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3cqyy9w0pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:10:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7AAPVj31129882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 10:10:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCE0711C058;
 Tue,  7 Dec 2021 10:10:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72E2A11C04C;
 Tue,  7 Dec 2021 10:10:25 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 10:10:25 +0000 (GMT)
Message-ID: <5dd72325-89b9-bcbf-a0fe-db76c3bd0acf@linux.ibm.com>
Date: Tue, 7 Dec 2021 11:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 13/14] ppc/pnv: Move realize of PEC stacks under the PEC
 model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-14-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-14-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kSGD1PMjyGCBjrnjxxyhkUFb9qjYhbTT
X-Proofpoint-GUID: 1-KuGsmBTKxEdudyfzsy8_FNPzlxWREw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070060
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
> This change will help us providing support for user created PHB4
> devices.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/pci-host/pnv_phb4_pec.c | 36 ++++++++++++++++++++++++++++++++----
>   hw/ppc/pnv.c               | 31 +------------------------------
>   2 files changed, 33 insertions(+), 34 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index dfed2af0f7df..9b081d543057 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -556,6 +556,10 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
>       PnvPhb4PecState *pec = stack->pec;
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    PnvChip *chip = pec->chip;
> +    uint32_t pec_nest_base;
> +    uint32_t pec_pci_base;
>       char name[64];
>   
>       assert(pec);
> @@ -579,10 +583,34 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
>       pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
>                             &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
>   
> -    /*
> -     * Let the machine/chip realize the PHB object to customize more
> -     * easily some fields
> -     */
> +    {
> +        Object *obj = OBJECT(&stack->phb);
> +
> +        object_property_set_int(obj, "chip-id", pec->chip_id, &error_fatal);
> +        object_property_set_int(obj, "version", pecc->version, &error_fatal);
> +        object_property_set_int(obj, "device-id", pecc->device_id,
> +                                &error_fatal);
> +        object_property_set_link(obj, "stack", OBJECT(stack),
> +                                 &error_abort);
> +        if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
> +            return;
> +        }
> +    }


Do we really need the extra sub-scope here? It looks off.


> +
> +    pec_nest_base = pecc->xscom_nest_base(pec);
> +    pec_pci_base = pecc->xscom_pci_base(pec);
> +
> +    /* Populate the XSCOM address space. */
> +    pnv_xscom_add_subregion(chip,
> +                            pec_nest_base + 0x40 * (stack->stack_no + 1),
> +                            &stack->nest_regs_mr);
> +    pnv_xscom_add_subregion(chip,
> +                            pec_pci_base + 0x40 * (stack->stack_no + 1),
> +                            &stack->pci_regs_mr);
> +    pnv_xscom_add_subregion(chip,
> +                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
> +                            0x40 * stack->stack_no,
> +                            &stack->phb_regs_mr);
>   }
>   
>   static Property pnv_pec_stk_properties[] = {
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 3a550eed0f36..7e13b15241fd 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1370,7 +1370,7 @@ static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
>   static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>   {


With that change, we should really rename pnv_chip_power9_phb_realize() 
to pnv_chip_power9_pec_realize().

   Fred


>       Pnv9Chip *chip9 = PNV9_CHIP(chip);
> -    int i, j;
> +    int i;
>   
>       for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip9->pecs[i];
> @@ -1392,35 +1392,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>   
>           pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
>           pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
> -
> -        for (j = 0; j < pec->num_stacks; j++) {
> -            PnvPhb4PecStack *stack = &pec->stacks[j];
> -            Object *obj = OBJECT(&stack->phb);
> -
> -            object_property_set_int(obj, "chip-id", chip->chip_id,
> -                                    &error_fatal);
> -            object_property_set_int(obj, "version", pecc->version,
> -                                    &error_fatal);
> -            object_property_set_int(obj, "device-id", pecc->device_id,
> -                                    &error_fatal);
> -            object_property_set_link(obj, "stack", OBJECT(stack),
> -                                     &error_abort);
> -            if (!sysbus_realize(SYS_BUS_DEVICE(obj), errp)) {
> -                return;
> -            }
> -
> -            /* Populate the XSCOM address space. */
> -            pnv_xscom_add_subregion(chip,
> -                                   pec_nest_base + 0x40 * (stack->stack_no + 1),
> -                                   &stack->nest_regs_mr);
> -            pnv_xscom_add_subregion(chip,
> -                                    pec_pci_base + 0x40 * (stack->stack_no + 1),
> -                                    &stack->pci_regs_mr);
> -            pnv_xscom_add_subregion(chip,
> -                                    pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
> -                                    0x40 * stack->stack_no,
> -                                    &stack->phb_regs_mr);
> -        }
>       }
>   }
>   
> 

