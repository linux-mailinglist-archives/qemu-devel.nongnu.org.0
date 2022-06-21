Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FE1552D6B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:52:42 +0200 (CEST)
Received: from localhost ([::1]:60724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Zcn-0006ej-8J
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o3Zaq-0004sn-1R; Tue, 21 Jun 2022 04:50:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o3Zan-00082I-Vo; Tue, 21 Jun 2022 04:50:39 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25L8CCCc026263;
 Tue, 21 Jun 2022 08:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JDMs0FoGTugkUP0RFvt2lzcW/7xnTqeUgyAnD1EAtyw=;
 b=bhHXx3G2Cp9gxBgWVNaG5uSnEdu02xblNhOduIdPaNT9Kzp/7TwgACawMlQSgs2FF7ch
 j85at0ik61l+Xat7R79q9/7QI1cLpIYxmQy4F96xVKA6xNGGMwYwCUhtzBYz5nvGCfth
 6F8uasaCAATADLVL0VdbhC+5cItYVnAjSXzNeOuBeqrigeZuMItjX3Ui0cKy23NEp5iz
 XE3eagqWROHSerQ1S3axpAQQXvw8tjZzNNEGiPdQXL6ayPY8YE81lnjdJYda94sVl/vi
 FcSIKIV9gurCCitlZ6eW+2Q1qE7IH4IFCEeBlNQUHwUnqiN5MUIak0M1JOx9UR/uzAD6 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gua8w114m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 08:50:32 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25L8Cbwt029080;
 Tue, 21 Jun 2022 08:50:32 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gua8w113e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 08:50:31 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25L8bAKd020870;
 Tue, 21 Jun 2022 08:50:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3gs6b8tw6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jun 2022 08:50:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25L8oQ0l21168498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jun 2022 08:50:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3EC111C04C;
 Tue, 21 Jun 2022 08:50:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53B8911C04A;
 Tue, 21 Jun 2022 08:50:26 +0000 (GMT)
Received: from [9.145.155.216] (unknown [9.145.155.216])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jun 2022 08:50:26 +0000 (GMT)
Message-ID: <0b7324dc-2c49-2ff5-af5b-2d4cf016fab3@linux.ibm.com>
Date: Tue, 21 Jun 2022 10:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 6/9] ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220618110202.87735-1-danielhb413@gmail.com>
 <20220618110202.87735-7-danielhb413@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220618110202.87735-7-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zVBUnjQAhdiPtpFx0dSdNuDfLyJbnBff
X-Proofpoint-ORIG-GUID: G_2xL8j5gl5NFJN1uZQSb8twXzGi1cl_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_03,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 mlxlogscore=571 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210036
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



On 18/06/2022 13:01, Daniel Henrique Barboza wrote:
> pnv_ics_resend() is scrolling through all the child objects of the chip
> to search for the PHBs. It's faster and simpler to just use the phbs[]
> array.
> 
> pnv_ics_resend_child() was folded into pnv_ics_resend() since it's too
> simple to justify its own function.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---


Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred

>   hw/ppc/pnv.c | 22 ++++++++--------------
>   1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index ff7f803662..08136def8e 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1979,28 +1979,22 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
>       return NULL;
>   }
>   
> -static int pnv_ics_resend_child(Object *child, void *opaque)
> -{
> -    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
> -
> -    if (phb3) {
> -        ics_resend(&phb3->lsis);
> -        ics_resend(ICS(&phb3->msis));
> -    }
> -    return 0;
> -}
> -
>   static void pnv_ics_resend(XICSFabric *xi)
>   {
>       PnvMachineState *pnv = PNV_MACHINE(xi);
> -    int i;
> +    int i, j;
>   
>       for (i = 0; i < pnv->num_chips; i++) {
> -        PnvChip *chip = pnv->chips[i];
>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>   
>           ics_resend(&chip8->psi.ics);
> -        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
> +
> +        for (j = 0; j < chip8->num_phbs; j++) {
> +            PnvPHB3 *phb3 = &chip8->phbs[j];
> +
> +            ics_resend(&phb3->lsis);
> +            ics_resend(ICS(&phb3->msis));
> +        }
>       }
>   }
>   

