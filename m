Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580B05912A0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 17:08:05 +0200 (CEST)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMWGZ-0001eP-UT
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 11:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMW1P-0003B0-CQ; Fri, 12 Aug 2022 10:52:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMW1M-0001fK-Hx; Fri, 12 Aug 2022 10:52:23 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CEgIik027980;
 Fri, 12 Aug 2022 14:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=K+tknSAREW7LgBRVsAxD2UUvIgHqVR2Bvl1jChek82Y=;
 b=MILd22IB4MriWiLwW7Zeygnk4tNYUZfm6PHqePlpSH6bhFayh2/XQIjjcHwWVS9St6TA
 8FwPFec7mvVCbvVVGqkwHr5PN1Z0rqVbDQJUGASr7eo4t0n2k/7klfmw9FNYPFC4Jboc
 +Tufq/4iJ9KggAa/ZNKo2i2zywPGCw/yCGtETS8GyMwD2Gcj21mSeI0bhaHI58vairNQ
 lOYS0005U+8VJnKXXN4J3hcjGpZgHgdtR6kr6kueC3dr9z0IxeJjnhBLe0sucsbVSXI6
 4bzruPjZJnWkOsKZoIWDC8+nSjHA4w9lVd6hO1Qi1Woa1r7WxOIV0126NRTwYacgAgl3 pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwruxga7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:52:10 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CEkRhB013880;
 Fri, 12 Aug 2022 14:52:10 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwruxga69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:52:10 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CEaada017235;
 Fri, 12 Aug 2022 14:52:08 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3huww0tqhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 14:52:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27CEq52126345926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 14:52:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DEEA4C046;
 Fri, 12 Aug 2022 14:52:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21D8F4C044;
 Fri, 12 Aug 2022 14:52:05 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 14:52:04 +0000 (GMT)
Message-ID: <32f26acd-104d-fdcb-cff3-481b9ccff950@linux.ibm.com>
Date: Fri, 12 Aug 2022 16:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 05/11] ppc/pnv: turn chip8->phbs[] into a
 PnvPHB* array
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-6-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220811163950.578927-6-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: w8IG34dt4CA6irtuvpWC9J0cWvt42S5s
X-Proofpoint-GUID: vVbmt7CcfquCBkMqnkeD8cJd2AguQcwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_09,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208120040
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



On 11/08/2022 18:39, Daniel Henrique Barboza wrote:
> When enabling user created PHBs (a change reverted by commit 9c10d86fee)
> we were handling PHBs created by default versus by the user in different
> manners. The only difference between these PHBs is that one will have a
> valid phb3->chip that is assigned during pnv_chip_power8_realize(),
> while the user created needs to search which chip it belongs to.
> 
> Aside from that there shouldn't be any difference. Making the default
> PHBs behave in line with the user created ones will make it easier to
> re-introduce them later on. It will also make the code easier to follow
> since we are dealing with them in equal manner.
> 
> The first step is to turn chip8->phbs[] into a PnvPHB3 pointer array.
> This will allow us to assign user created PHBs into it later on. The way
> we initilize the default case is now more in line with that would happen
> with the user created case: the object is created, parented by the chip
> because pnv_xscom_dt() relies on it, and then assigned to the array.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/ppc/pnv.c         | 27 ++++++++++++++++++++++-----
>   include/hw/ppc/pnv.h |  6 +++++-
>   2 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 2deaac17f7..e53e9e297d 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -294,6 +294,13 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
>   Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
>   {
>       if (phb->version == 3) {
> +        Pnv8Chip *chip8 = PNV8_CHIP(chip);
> +
> +        phb->chip = chip;
> +
> +        chip8->phbs[chip8->num_phbs] = phb;
> +        chip8->num_phbs++;
> +
>           return OBJECT(chip);
>       } else {
>           /* phb4 support will be added later */
> @@ -681,7 +688,7 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>       ics_pic_print_info(&chip8->psi.ics, mon);
>   
>       for (i = 0; i < chip8->num_phbs; i++) {
> -        PnvPHB *phb = &chip8->phbs[i];
> +        PnvPHB *phb = chip8->phbs[i];
>           PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
>   
>           pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
> @@ -1174,7 +1181,17 @@ static void pnv_chip_power8_instance_init(Object *obj)
>       chip8->num_phbs = pcc->num_phbs;
>   
>       for (i = 0; i < chip8->num_phbs; i++) {
> -        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
> +        Object *phb = object_new(TYPE_PNV_PHB);
> +
> +        /*
> +         * We need the chip to parent the PHB to allow the DT
> +         * to build correctly (via pnv_xscom_dt()).
> +         *
> +         * TODO: the PHB should be parented by a PEC device that, at
> +         * this moment, is not modelled powernv8/phb3.
> +         */
> +        object_property_add_child(obj, "phb[*]", phb);
> +        chip8->phbs[i] = PNV_PHB(phb);
>       }
>   
>   }
> @@ -1290,7 +1307,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>   
>       /* PHB controllers */
>       for (i = 0; i < chip8->num_phbs; i++) {
> -        PnvPHB *phb = &chip8->phbs[i];
> +        PnvPHB *phb = chip8->phbs[i];
>   
>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
>           object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
> @@ -1958,7 +1975,7 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>           }
>   
>           for (j = 0; j < chip8->num_phbs; j++) {
> -            PnvPHB *phb = &chip8->phbs[j];
> +            PnvPHB *phb = chip8->phbs[j];
>               PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
>   
>               if (ics_valid_irq(&phb3->lsis, irq)) {
> @@ -1997,7 +2014,7 @@ static void pnv_ics_resend(XICSFabric *xi)
>           ics_resend(&chip8->psi.ics);
>   
>           for (j = 0; j < chip8->num_phbs; j++) {
> -            PnvPHB *phb = &chip8->phbs[j];
> +            PnvPHB *phb = chip8->phbs[j];
>               PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
>   
>               ics_resend(&phb3->lsis);
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index 781d0acffa..49433281d7 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -81,7 +81,11 @@ struct Pnv8Chip {
>       PnvHomer     homer;
>   
>   #define PNV8_CHIP_PHB3_MAX 4
> -    PnvPHB       phbs[PNV8_CHIP_PHB3_MAX];
> +    /*
> +     * The array is used to allow quick access to the phbs by
> +     * pnv_ics_get_child() and pnv_ics_resend_child().
> +     */
> +    PnvPHB       *phbs[PNV8_CHIP_PHB3_MAX];
>       uint32_t     num_phbs;
>   
>       XICSFabric    *xics;

