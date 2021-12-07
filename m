Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D1F46B872
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:08:35 +0100 (CET)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXOk-0004JI-MF
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:08:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXMs-0002qh-GQ; Tue, 07 Dec 2021 05:06:38 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXMq-0002ul-Dy; Tue, 07 Dec 2021 05:06:38 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B79IegT005031; 
 Tue, 7 Dec 2021 10:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TpwI9t2Fn0KblUS7FF7pY5BVD+uiylXJ38W1JcsZsxA=;
 b=XYAKURfUsrDi6N2iLNt+0yZNvu4GE+xAgy+VnGt4c9KtfFoCUgVL/kYB1WOSy6qP9iA5
 cPpKXKdS1NjQiJ8/XRy1H6VR+mAcpXy34HCRcyh4Ovlx3sXiCjIJn4qF3cCc083rP8Ra
 UE5/1x5kkYzohYeCCAs0qPV17DeC5vDFlrjFkMgSCiaSXSXNuGgtiJjDPYgmTuIAGLW4
 DMU/452uzvVi1ldtIcm9pCLECgtPV9MogAtSkdTe/Ln83Qm5kpuRkrUapKSWfdrInB1o
 gDYkTa1DV5uToj8avZAoGy8z0a6rRT8prJNktcsXRXbs9ZhSeZsn/MyjU9RcU2nk+eWH OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4vagtwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:06:32 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79KRgK009874;
 Tue, 7 Dec 2021 10:06:31 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4vagtvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:06:31 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7A2Pd3003085;
 Tue, 7 Dec 2021 10:06:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3cqyy9by9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:06:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7A6Q7i27132282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 10:06:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D353311C050;
 Tue,  7 Dec 2021 10:06:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8661011C04A;
 Tue,  7 Dec 2021 10:06:26 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 10:06:26 +0000 (GMT)
Message-ID: <c600b004-e0ad-17e4-90d5-e53556e4bad3@linux.ibm.com>
Date: Tue, 7 Dec 2021 11:06:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/14] ppc/pnv: Compute the PHB index from the PHB4 PEC
 model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-12-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-12-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cWYkPTS42Ugm2bf1i8vFyf7fuesOyIhZ
X-Proofpoint-GUID: S_WaYbpG-2mWg3RMYk-LJ9tE34JffdAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
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
> Use the num_stacks class attribute to compute the PHB index depending
> on the PEC index :
> 
>    * PEC0 provides 1 PHB  (PHB0)
>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/pci-host/pnv_phb4_pec.c | 16 ++++++++++++++++
>   hw/ppc/pnv.c               |  4 +---
>   2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index 293909b5cb90..a7dd4173d598 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -374,6 +374,19 @@ static void pnv_pec_instance_init(Object *obj)
>       }
>   }
>   
> +static int pnv_pec_phb_offset(PnvPhb4PecState *pec)
> +{
> +    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
> +    int index = pec->index;
> +    int offset = 0;
> +
> +    while (index--) {
> +        offset += pecc->num_stacks[index];
> +    }
> +
> +    return offset;
> +}
> +


That seems overly complicated to me and not very readable. The log 
message is a lot more clear. I'd prefer we have a switch() statement 
returning the base PHB ID based on the PEC index.

   Fred



>   static void pnv_pec_realize(DeviceState *dev, Error **errp)
>   {
>       PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
> @@ -394,8 +407,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < pec->num_stacks; i++) {
>           PnvPhb4PecStack *stack = &pec->stacks[i];
>           Object *stk_obj = OBJECT(stack);
> +        int phb_id = pnv_pec_phb_offset(pec) + i;
>   
>           object_property_set_int(stk_obj, "stack-no", i, &error_abort);
> +        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
>           object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
>           if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
>               return;
> @@ -538,6 +553,7 @@ static void pnv_pec_stk_instance_init(Object *obj)
>       PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
>   
>       object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
> +    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
>   }
>   
>   static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 957f0bdfaa6b..f8b0b2a28383 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1371,7 +1371,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>   {
>       Pnv9Chip *chip9 = PNV9_CHIP(chip);
>       int i, j;
> -    int phb_id = 0;
>   
>       for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip9->pecs[i];
> @@ -1396,11 +1395,10 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>           pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
>           pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
>   
> -        for (j = 0; j < pec->num_stacks; j++, phb_id++) {
> +        for (j = 0; j < pec->num_stacks; j++) {
>               PnvPhb4PecStack *stack = &pec->stacks[j];
>               Object *obj = OBJECT(&stack->phb);
>   
> -            object_property_set_int(obj, "index", phb_id, &error_fatal);
>               object_property_set_int(obj, "chip-id", chip->chip_id,
>                                       &error_fatal);
>               object_property_set_int(obj, "version", pecc->version,
> 

