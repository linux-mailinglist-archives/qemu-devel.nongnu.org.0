Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8E546B855
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:03:18 +0100 (CET)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXJd-0004NH-2J
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:03:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXHA-0003K2-W2; Tue, 07 Dec 2021 05:00:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXH8-0001w0-Q7; Tue, 07 Dec 2021 05:00:44 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B79Bl3d018955; 
 Tue, 7 Dec 2021 10:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aRDCaf+riHDsgoC0lh7WzgCq1YLTvFbWDhldkiIdl/8=;
 b=KijjcGV2XnsmbHeMVSnVtBMnuBasR1PFjukLAu6Pck5HL0taFdXRuTT7Lbjp/pMAvnhB
 6PVYxhpSmQieMFpSFm4eMnv91yKu6DGaqOTqVx1y1DL9Fq9k2Z/GPl9ZJlO8pg91iSRe
 6RqnOVEVP3HpR5F3MVcBBvLwmLLUCCd4k9b2tYUNTijPoTb1JnVu0woLQ0TU5hJ+r6Ly
 BJRRHbU+x2hs7lvIuAsaLCwOC80CTGJR33r/N7PkxTruOGCvUsHSijAgBmyHeAHXfAMU
 gA+gDuSSjiOH9kNUUAyhM1wkKVY2IkfQyhYcNYogKQm+QCs+MG9z9LxsHkTsavq1Ijqx hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct2nwbm43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:00:31 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79V0Jk029568;
 Tue, 7 Dec 2021 10:00:31 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct2nwbm2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:00:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B79r9kd017112;
 Tue, 7 Dec 2021 10:00:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3cqyyamv7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:00:27 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B7A0P9b19923288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 10:00:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FFB311C05B;
 Tue,  7 Dec 2021 10:00:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6D5B11C074;
 Tue,  7 Dec 2021 10:00:24 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 10:00:24 +0000 (GMT)
Message-ID: <453c5cc3-5ac5-c6ff-fa7f-5ccb8492e314@linux.ibm.com>
Date: Tue, 7 Dec 2021 11:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/14] ppc/pnv: Introduce a num_pecs class attribute for
 PHB4 PEC devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-8-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-8-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fj-4up4nTQT7uWCifaMyzOwK2lDpcjR6
X-Proofpoint-ORIG-GUID: G7lpkf_yCoOPGwAG4sCzM7P1e4KeQmqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
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
> POWER9 processor comes with 3 PHB4 PECs (PCI Express Controller) and
> each PEC can have several PHBs :
> 
>    * PEC0 provides 1 PHB  (PHB0)
>    * PEC1 provides 2 PHBs (PHB1 and PHB2)
>    * PEC2 provides 3 PHBs (PHB3, PHB4 and PHB5)
> 
> A num_pecs class attribute represents better the logic units of the
> POWER9 chip. Use that instead of num_phbs which fits POWER8 chips.
> This will ease adding support for user created devices.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

With this patch, chip->num_phbs is only defined and used on P8. We may 
want to add a comment to make it clear.

As I review this series, something is bugging me though: the difference 
of handling between P8 and P9.
On P9, we seem to have a more logical hiearachy:
phb <- PCI controller (PEC) <- chip

With P8, we don't have an explicit PEC, but we have a PBCQ object, which 
is somewhat similar. The hierarchy seems also more convoluted.
I don't see why it's treated differently. It seems both chips could be 
treated the same, which would make the code easier to follow.
That's outside of the scope of this series though. So maybe for a future 
patch? Who knows, I might volunteer...

   Fred



>   include/hw/ppc/pnv.h |  2 ++
>   hw/ppc/pnv.c         | 20 +++++++++-----------
>   2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 247379ef1f88..f2c238062f4a 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -53,6 +53,7 @@ struct PnvChip {
>       PnvCore      **cores;
>   
>       uint32_t     num_phbs;
> +    uint32_t     num_pecs;
>   
>       MemoryRegion xscom_mmio;
>       MemoryRegion xscom;
> @@ -136,6 +137,7 @@ struct PnvChipClass {
>       uint64_t     chip_cfam_id;
>       uint64_t     cores_mask;
>       uint32_t     num_phbs;
> +    uint32_t     num_pecs;
>   
>       DeviceRealize parent_realize;
>   
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 45d8ecbf2bf7..185464a1d443 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -658,7 +658,7 @@ static void pnv_chip_power9_pic_print_info(PnvChip *chip, Monitor *mon)
>       pnv_xive_pic_print_info(&chip9->xive, mon);
>       pnv_psi_pic_print_info(&chip9->psi, mon);
>   
> -    for (i = 0; i < PNV9_CHIP_MAX_PEC; i++) {
> +    for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip9->pecs[i];
>           for (j = 0; j < pec->num_stacks; j++) {
>               pnv_phb4_pic_print_info(&pec->stacks[j].phb, mon);
> @@ -1330,15 +1330,14 @@ static void pnv_chip_power9_instance_init(Object *obj)
>   
>       object_initialize_child(obj, "homer", &chip9->homer, TYPE_PNV9_HOMER);
>   
> -    for (i = 0; i < PNV9_CHIP_MAX_PEC; i++) {
> +    if (defaults_enabled()) {
> +        chip->num_pecs = pcc->num_pecs;
> +    }
> +
> +    for (i = 0; i < chip->num_pecs; i++) {
>           object_initialize_child(obj, "pec[*]", &chip9->pecs[i],
>                                   TYPE_PNV_PHB4_PEC);
>       }
> -
> -    /*
> -     * Number of PHBs is the chip default
> -     */
> -    chip->num_phbs = pcc->num_phbs;
>   }
>   
>   static void pnv_chip_quad_realize(Pnv9Chip *chip9, Error **errp)
> @@ -1374,7 +1373,7 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>       int i, j;
>       int phb_id = 0;
>   
> -    for (i = 0; i < PNV9_CHIP_MAX_PEC; i++) {
> +    for (i = 0; i < chip->num_pecs; i++) {
>           PnvPhb4PecState *pec = &chip9->pecs[i];
>           PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
>           uint32_t pec_nest_base;
> @@ -1402,8 +1401,7 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>           pnv_xscom_add_subregion(chip, pec_nest_base, &pec->nest_regs_mr);
>           pnv_xscom_add_subregion(chip, pec_pci_base, &pec->pci_regs_mr);
>   
> -        for (j = 0; j < pec->num_stacks && phb_id < chip->num_phbs;
> -             j++, phb_id++) {
> +        for (j = 0; j < pec->num_stacks; j++, phb_id++) {
>               PnvPhb4PecStack *stack = &pec->stacks[j];
>               Object *obj = OBJECT(&stack->phb);
>   
> @@ -1559,7 +1557,7 @@ static void pnv_chip_power9_class_init(ObjectClass *klass, void *data)
>       k->xscom_core_base = pnv_chip_power9_xscom_core_base;
>       k->xscom_pcba = pnv_chip_power9_xscom_pcba;
>       dc->desc = "PowerNV Chip POWER9";
> -    k->num_phbs = 6;
> +    k->num_pecs = PNV9_CHIP_MAX_PEC;
>   
>       device_class_set_parent_realize(dc, pnv_chip_power9_realize,
>                                       &k->parent_realize);
> 

