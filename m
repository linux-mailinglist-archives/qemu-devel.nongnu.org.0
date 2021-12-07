Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5539246B7B7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:43:00 +0100 (CET)
Received: from localhost ([::1]:58482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muWzy-0007Ok-48
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:42:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muWxy-0005eb-FN; Tue, 07 Dec 2021 04:40:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muWxw-0001fj-HU; Tue, 07 Dec 2021 04:40:54 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B79MXBM008878; 
 Tue, 7 Dec 2021 09:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aQ05iMcHwJF2++uAkXAxYRKblZhddX6ouUhw65/dlxI=;
 b=QVuntbesL89DwYP+bG9QC5Qvld9WKYiHahGCr6wT9k5wTbaRCXSnIPd9MzRr/IuWAebi
 lREbPI15Quj2OogVVxkNL7Ks3lfA0fuhwMmWINuiWArCfP7N5UQa5HTbBskl3AClH1Ew
 hb4T6fAUCJUa2FfWQRoXBbC2YB5KokgMtf3+6wPOiFSLVaQY603Hn0X5QMICxVrP8+Ks
 7T83iwiMoJZaVf0wHJAyHDGLks1c3TxLrSEmdzLt1tLoLx/IWoF9zNRzDy0mXLlJTNFQ
 iyCtXvD4JpMDfb3j/RofIqG6xN7agDorKjDSjJ9W3QrkWA9q8xmHM4p9DDYMPE5+OirD Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4x60a38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:40:48 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B79N8Z1010558;
 Tue, 7 Dec 2021 09:40:48 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4x60a2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:40:48 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B79bAvN027079;
 Tue, 7 Dec 2021 09:40:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3cqyyamqdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 09:40:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B79X2Ht29950336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 09:33:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E936911C050;
 Tue,  7 Dec 2021 09:40:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4C6911C054;
 Tue,  7 Dec 2021 09:40:42 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 09:40:42 +0000 (GMT)
Message-ID: <8e7e89cd-f8dd-00fd-8aca-1a8e2d40027a@linux.ibm.com>
Date: Tue, 7 Dec 2021 10:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 01/14] ppc/pnv: Reduce the maximum of PHB3 devices
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-2-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Px_4JZ-UrNLhcNTQbVgCP0ggwBeG9Bcz
X-Proofpoint-ORIG-GUID: SFbCll_5EKjwStQRdit8Qo7nfM_dx15w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070056
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
> All POWER8 machines have a maximum of 3 PHB3 devices. Adapt the
> PNV8_CHIP_PHB3_MAX definition for consistency.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


The Naples chip (Garrison) can have 4 PHBs and it seems we have a 
power8nvl machine type for it. So I guess we should keep a max PHB count 
of 4 there.

   Fred



>   include/hw/ppc/pnv.h | 2 +-
>   hw/ppc/pnv.c         | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index aa08d79d24de..6f498c8f1b5f 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -79,7 +79,7 @@ struct Pnv8Chip {
>       PnvOCC       occ;
>       PnvHomer     homer;
>   
> -#define PNV8_CHIP_PHB3_MAX 4
> +#define PNV8_CHIP_PHB3_MAX 3
>       PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
>   
>       XICSFabric    *xics;
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 71e45515f136..bd768dcc28ad 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1256,7 +1256,7 @@ static void pnv_chip_power8e_class_init(ObjectClass *klass, void *data)
>   
>       k->chip_cfam_id = 0x221ef04980000000ull;  /* P8 Murano DD2.1 */
>       k->cores_mask = POWER8E_CORE_MASK;
> -    k->num_phbs = 3;
> +    k->num_phbs = PNV8_CHIP_PHB3_MAX;
>       k->core_pir = pnv_chip_core_pir_p8;
>       k->intc_create = pnv_chip_power8_intc_create;
>       k->intc_reset = pnv_chip_power8_intc_reset;
> @@ -1280,7 +1280,7 @@ static void pnv_chip_power8_class_init(ObjectClass *klass, void *data)
>   
>       k->chip_cfam_id = 0x220ea04980000000ull; /* P8 Venice DD2.0 */
>       k->cores_mask = POWER8_CORE_MASK;
> -    k->num_phbs = 3;
> +    k->num_phbs = PNV8_CHIP_PHB3_MAX;
>       k->core_pir = pnv_chip_core_pir_p8;
>       k->intc_create = pnv_chip_power8_intc_create;
>       k->intc_reset = pnv_chip_power8_intc_reset;
> @@ -1304,7 +1304,7 @@ static void pnv_chip_power8nvl_class_init(ObjectClass *klass, void *data)
>   
>       k->chip_cfam_id = 0x120d304980000000ull;  /* P8 Naples DD1.0 */
>       k->cores_mask = POWER8_CORE_MASK;
> -    k->num_phbs = 3;
> +    k->num_phbs = PNV8_CHIP_PHB3_MAX;
>       k->core_pir = pnv_chip_core_pir_p8;
>       k->intc_create = pnv_chip_power8_intc_create;
>       k->intc_reset = pnv_chip_power8_intc_reset;
> 

