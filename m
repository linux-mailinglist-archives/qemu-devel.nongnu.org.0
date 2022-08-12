Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA45A59131F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 17:34:59 +0200 (CEST)
Received: from localhost ([::1]:57842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMWgc-0005rj-Ch
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 11:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMWZ1-0000YS-5O; Fri, 12 Aug 2022 11:27:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1oMWYy-00077S-Ck; Fri, 12 Aug 2022 11:27:05 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CFCQ9T024169;
 Fri, 12 Aug 2022 15:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=quO1ZqX0PZZooLYt33FKLNUTmilkQ5hU6ObUcit8368=;
 b=Rlla7wBecxyEHxRBLr1oojtrTU3St20jA2GjORl8f5CM7g+XBl9Fnws9RnN/O6uUPmXv
 cMNSsAuOtvR2MGRCXuihQaeC5qI+FzOORMjugSdSZb46CokPMj41dzg3bNP/qK6jl0vt
 CImErkKSVFji/ljvPLS9lljpTrz7UAIlrgxOmrVzUClNXsO7YViWXpN+08c3hMW1b7Wx
 8maa3nujab90fGxuqkMq/hBb5TmQqKScH+zR8dw/JON8bGXMJN9veOidCixYe9+nj9n0
 wyzVu5xfUe7hz85ZyISKHyw2yeexV7RDgNgI8b7t/aWY2vfCe+uOjTSGtKJJvkDXCrgA vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwsa28dbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 15:26:54 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CFDHR9027586;
 Fri, 12 Aug 2022 15:26:54 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwsa28da7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 15:26:54 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CFJZlu012235;
 Fri, 12 Aug 2022 15:26:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3huwvfthh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 15:26:51 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27CFQnv629753712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 15:26:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 266D64C044;
 Fri, 12 Aug 2022 15:26:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6BB94C046;
 Fri, 12 Aug 2022 15:26:48 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 12 Aug 2022 15:26:48 +0000 (GMT)
Message-ID: <9fbf2790-367a-d188-c0ba-0c0f12d3da95@linux.ibm.com>
Date: Fri, 12 Aug 2022 17:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.2 v4 09/11] ppc/pnv: change pnv_phb4_get_pec() to
 also retrieve chip10->pecs
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220811163950.578927-1-danielhb413@gmail.com>
 <20220811163950.578927-10-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220811163950.578927-10-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -u9wGCH9SrbZJXaBlm8SpZIsguaz0HnR
X-Proofpoint-GUID: 2YBe4jINROcC1VbrdWxQOZec4y8PHN5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=926 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208120041
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
> The function assumes that we're always dealing with a PNV9_CHIP()
> object. This is not the case when the pnv-phb device belongs to a
> powernv10 machine.
> 
> Change pnv_phb4_get_pec() to be able to work with PNV10_CHIP() if
> necessary.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/ppc/pnv.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index ec0558ed1c..e6c14fe231 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -284,17 +284,30 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
>   static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
>                                            Error **errp)
>   {
> -    Pnv9Chip *chip9 = PNV9_CHIP(chip);
> +    PnvPHB *phb_base = phb->phb_base;
> +    PnvPhb4PecState *pecs = NULL;
>       int chip_id = phb->chip_id;
>       int index = phb->phb_id;
>       int i, j;
>   
> +    if (phb_base->version == 4) {
> +        Pnv9Chip *chip9 = PNV9_CHIP(chip);
> +
> +        pecs = chip9->pecs;
> +    } else if (phb_base->version == 5) {
> +        Pnv10Chip *chip10 = PNV10_CHIP(chip);
> +
> +        pecs = chip10->pecs;
> +    } else {
> +        g_assert_not_reached();
> +    }
> +
>       for (i = 0; i < chip->num_pecs; i++) {
>           /*
>            * For each PEC, check the amount of phbs it supports
>            * and see if the given phb4 index matches an index.
>            */
> -        PnvPhb4PecState *pec = &chip9->pecs[i];
> +        PnvPhb4PecState *pec = &pecs[i];
>   
>           for (j = 0; j < pec->num_phbs; j++) {
>               if (index == pnv_phb4_pec_get_phb_id(pec, j)) {

