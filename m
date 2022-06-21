Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AD1552D65
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:51:19 +0200 (CEST)
Received: from localhost ([::1]:57900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ZbR-0004c9-MG
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o3ZZJ-0003gy-R3; Tue, 21 Jun 2022 04:49:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11732
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o3ZZH-0007TR-9N; Tue, 21 Jun 2022 04:49:05 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L8hMWa000334;
 Tue, 21 Jun 2022 08:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Imsqd4YQPkQbGT3qlwlhrbAqLc5aXL3ko5e5l2IHQ9c=;
 b=RIc6xc1tUFeMewxueQP92Q3I3WIaUait1yHe36N27q9dYa6rsckjoVD7cklsSBYey4wI
 7zpZfMK6CcJjUL6ZqA9O40ycv4tg88ZlD99MzD1Ui0qfh0c6FhPL66vFJKdEyVDOl3GC
 FilTecRsWj3HEeq9Ad5M3OsfxotKYnBiYJXf687VtXQfxuG3M451lT8qlvRGKfDR5B4K
 lxBa3etGrJT3iyJAXEoHGtWhdExDeMQRm9Z1Eopw4LjwRfatA8PL3WElWUQu3MVe9PWy
 SkAFUlgc3Hv4Zz6O3ucbXIdUdqsrgX6SFkxeoNGPRvpaz08VDlS2b3SnrvAS4WNo14Pg Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3guaqnr5nk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 08:48:58 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25L8hhX6001033;
 Tue, 21 Jun 2022 08:48:58 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3guaqnr5m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 08:48:58 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25L8b7Sf020863;
 Tue, 21 Jun 2022 08:48:56 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3gs6b8tw57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 08:48:56 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 25L8mxPF21561846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jun 2022 08:48:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAE5C11C054;
 Tue, 21 Jun 2022 08:48:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9580411C050;
 Tue, 21 Jun 2022 08:48:53 +0000 (GMT)
Received: from [9.145.155.216] (unknown [9.145.155.216])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jun 2022 08:48:53 +0000 (GMT)
Message-ID: <6d522359-1c33-6cd1-c4c0-05d5d7509693@linux.ibm.com>
Date: Tue, 21 Jun 2022 10:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/9] ppc/pnv: make pnv_ics_get() use the chip8->phbs[]
 array
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220618110202.87735-1-danielhb413@gmail.com>
 <20220618110202.87735-6-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220618110202.87735-6-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s1AK81sb7kQ_cNvhEL6ukjEoCmWPHeRH
X-Proofpoint-GUID: 77rvAQmj53f8c4UkQTFv-eOk4Eq2NcCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_03,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=602 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210036
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
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



On 18/06/2022 13:01, Daniel Henrique Barboza wrote:
> The function is working today by getting all the child objects of the
> chip, interacting with each of them to check whether the child is a PHB,
> and then doing what needs to be done.
> 
> We have all the chip PHBs in the phbs[] array so interacting with all
> child objects is unneeded. Open code pnv_ics_get_phb_ics() into
> pnv_ics_get() and remove both pnv_ics_get_phb_ics() and the
> ForeachPhb3Args struct.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/ppc/pnv.c | 38 +++++++++++---------------------------
>   1 file changed, 11 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 40e0cbd84d..ff7f803662 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1939,44 +1939,28 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
>       return NULL;
>   }
>   
> -typedef struct ForeachPhb3Args {
> -    int irq;
> -    ICSState *ics;
> -} ForeachPhb3Args;
> -
> -static int pnv_ics_get_child(Object *child, void *opaque)
> -{
> -    ForeachPhb3Args *args = opaque;
> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> -
> -    if (phb3) {
> -        if (ics_valid_irq(&phb3->lsis, args->irq)) {
> -            args->ics = &phb3->lsis;
> -        }
> -        if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
> -            args->ics = ICS(&phb3->msis);
> -        }
> -    }
> -    return args->ics ? 1 : 0;
> -}
> -
>   static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
> -    ForeachPhb3Args args = { irq, NULL };
> -    int i;
> +    int i, j;
>   
>       for (i = 0; i < pnv->num_chips; i++) {
> -        PnvChip *chip = pnv->chips[i];
>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>   
>           if (ics_valid_irq(&chip8->psi.ics, irq)) {
>               return &chip8->psi.ics;
>           }
>   
> -        object_child_foreach(OBJECT(chip), pnv_ics_get_child, &args);
> -        if (args.ics) {
> -            return args.ics;
> +        for (j = 0; j < chip8->num_phbs; j++) {
> +            PnvPHB3 *phb3 = &chip8->phbs[j];
> +
> +            if (ics_valid_irq(&phb3->lsis, irq)) {
> +                return &phb3->lsis;
> +            }
> +
> +            if (ics_valid_irq(ICS(&phb3->msis), irq)) {
> +                return ICS(&phb3->msis);
> +            }
>           }
>       }
>       return NULL;

