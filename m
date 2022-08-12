Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B312E5912E5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 17:29:40 +0200 (CEST)
Received: from localhost ([::1]:53430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMWbT-0002Z7-Jr
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 11:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMWVv-00062F-5o; Fri, 12 Aug 2022 11:23:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMWVt-0006XH-4D; Fri, 12 Aug 2022 11:23:54 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CErUQY017363;
 Fri, 12 Aug 2022 15:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nIEBdOoL5VbkgP9pus8AFVMYbCG2CKK0LEFNY0XN3AQ=;
 b=VGGWEDwgN/Jri7bbWxXjJCMSwnq7nprjOVr4/Qe6Dfva15psufkq0tcnjnG+PyzigWgP
 CuY0vhGbiRLkQi+u/eYQaJ1HPD2v/BOpxt2U/w+16gVJQrEjGYlKwuMHLAGUKsR5VjR7
 Q7MZ1H4C+vNQQrwwlPd6Z0BRcO+j6SySHrU1lcBE6g8XXSbDbGQ9y63T+DNk7m0p3Yfs
 mdCqYCTTT/pWA7iAYWLK8nefy/YuA6PHeEE2z+Mp0KkEkEY30vGiNZmh6bKJq1d76P+5
 bURBBOhd+wYSWgNbTD4qJyDCxvpa03+8p2AMVpYOaiztVgq3zvPIV4eBO9C/gCXMliXp uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hws16h23b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 15:23:48 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CEsPWb021225;
 Fri, 12 Aug 2022 15:23:48 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hws16h22c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 15:23:48 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CFLoFr020999;
 Fri, 12 Aug 2022 15:23:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3hvdjusuwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 15:23:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27CFO10p11796742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 15:24:01 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93CD94C044;
 Fri, 12 Aug 2022 15:23:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A2354C040;
 Fri, 12 Aug 2022 15:23:43 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 15:23:43 +0000 (GMT)
Message-ID: <085b7dbd-cff3-659d-6cb7-baddca7a8626@linux.ibm.com>
Date: Fri, 12 Aug 2022 17:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 07/11] ppc/pnv: add PHB4 helpers for user
 created pnv-phb
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-8-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220811163950.578927-8-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jv6f6gk9DgkMeLYz6yhZkQBEEp0wwKIa
X-Proofpoint-GUID: DxFP5QfhR0thQEeUjO2M1p31vTWVRPuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120041
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
> The PHB4 backend relies on a link with the corresponding PEC element.
> This is trivial to do during machine_init() time for default devices,
> but not so much for user created ones.
> 
> pnv_phb4_get_pec() is a small variation of the function that was
> reverted by commit 9c10d86fee "ppc/pnv: Remove user-created PHB{3,4,5}
> devices". We'll use it to determine the appropriate PEC for a given user
> created pnv-phb that uses a PHB4 backend.
> 
> This is done during realize() time, in pnv_phb_user_device_init().
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/ppc/pnv.c | 35 ++++++++++++++++++++++++++++++++---
>   1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index e82d6522f0..0644f45a1d 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -281,6 +281,34 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
>       g_free(reg);
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
> +    error_setg(errp,
> +               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
> +               chip_id, index);
> +
> +    return NULL;
> +}
> +
>   /*
>    * Adds a PnvPHB to the chip. Returns the parent obj of the
>    * PHB which varies with each version (phb version 3 is parented
> @@ -302,10 +330,11 @@ Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
>           chip8->num_phbs++;
>   
>           return OBJECT(chip);
> -    } else {
> -        /* phb4 support will be added later */
> -        return NULL;
>       }
> +
> +    phb->pec = pnv_phb4_get_pec(chip, PNV_PHB4(phb->backend), errp);
> +
> +    return OBJECT(phb->pec);
>   }
>   
>   static void pnv_chip_power8_dt_populate(PnvChip *chip, void *fdt)

