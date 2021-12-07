Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0271046B884
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:11:33 +0100 (CET)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXRb-0007Km-RE
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:11:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXOm-0005FH-V4; Tue, 07 Dec 2021 05:08:36 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1muXOl-0003AE-A5; Tue, 07 Dec 2021 05:08:36 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B78mLmM015861; 
 Tue, 7 Dec 2021 10:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=09aoYs5zJwhOPXZHekOPfRtkEfPfkQ79CdlSEweKgz4=;
 b=MkwbIm10bcgCmZuNkBlsaaMYOVls40LP7CpOZjGqawe30CUPxOmGEafjkr8XSZ69xL93
 qezXmR6wI6O9mYmylAjypFIZjO9B72eruHtWKtmi+TOiYruIlS67BtzE0tK3IxxLWReR
 pPJCepy4ulOtFo3oOOlgBbFDKLJAJUr1fP+TEAq0uP7zlrAQXWwFPMgYMsGtV1d9nqTW
 jOKl6mogzcWCdm2LYJzdaoPWj8VwRB800Sd4yhTFFQDnSbAz/+SnydRBKHMewVE9eQPX
 LZCjxbul+W86B6uq02fRLyHDUzRmwqXS2eaHt2FrlAK8QST5dFWrnbJoYdboIeq00Mx9 TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4e41eem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:08:25 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B7A3aoN026035;
 Tue, 7 Dec 2021 10:08:25 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ct4e41ee5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:08:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7A2gI1004749;
 Tue, 7 Dec 2021 10:08:22 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3cqykj52x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:08:22 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7A8KSa24838404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 10:08:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3352411C04A;
 Tue,  7 Dec 2021 10:08:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9BCF11C05E;
 Tue,  7 Dec 2021 10:08:19 +0000 (GMT)
Received: from [9.145.165.107] (unknown [9.145.165.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 10:08:19 +0000 (GMT)
Message-ID: <37a13a84-8e5c-7115-20b9-b23305a6bbd4@linux.ibm.com>
Date: Tue, 7 Dec 2021 11:08:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 12/14] ppc/pnv: Remove "system-memory" property for he
 PHB4 PEC model
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211202144235.1276352-1-clg@kaod.org>
 <20211202144235.1276352-13-clg@kaod.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20211202144235.1276352-13-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KILffpph3kdR1kriA6cEyFnK7oJCvmaM
X-Proofpoint-GUID: QpJxVQC-n3-GqH_KGrX2cq_yQLMrHS7O
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
> This is not useful and will be in the way for support of user created
> PHB4 devices.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---


I doubt I see all the implications here, but it doesn't look wrong to 
me, so:
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


>   hw/pci-host/pnv_phb4_pec.c | 6 +-----
>   hw/ppc/pnv.c               | 2 --
>   2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
> index a7dd4173d598..dfed2af0f7df 100644
> --- a/hw/pci-host/pnv_phb4_pec.c
> +++ b/hw/pci-host/pnv_phb4_pec.c
> @@ -124,7 +124,7 @@ static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
>   static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
>   {
>       PnvPhb4PecState *pec = stack->pec;
> -    MemoryRegion *sysmem = pec->system_memory;
> +    MemoryRegion *sysmem = get_system_memory();
>       uint64_t bar_en = stack->nest_regs[PEC_NEST_STK_BAR_EN];
>       uint64_t bar, mask, size;
>       char name[64];
> @@ -394,8 +394,6 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
>       char name[64];
>       int i;
>   
> -    assert(pec->system_memory);
> -
>       if (pec->index >= PNV_CHIP_GET_CLASS(pec->chip)->num_pecs) {
>           error_setg(errp, "invalid PEC index: %d", pec->index);
>           return;
> @@ -486,8 +484,6 @@ static Property pnv_pec_properties[] = {
>           DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
>           DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
>                            PnvChip *),
> -        DEFINE_PROP_LINK("system-memory", PnvPhb4PecState, system_memory,
> -                     TYPE_MEMORY_REGION, MemoryRegion *),
>           DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index f8b0b2a28383..3a550eed0f36 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1383,8 +1383,6 @@ static void pnv_chip_power9_phb_realize(PnvChip *chip, Error **errp)
>                                   &error_fatal);
>           object_property_set_link(OBJECT(pec), "chip", OBJECT(chip),
>                                    &error_fatal);
> -        object_property_set_link(OBJECT(pec), "system-memory",
> -                                 OBJECT(get_system_memory()), &error_abort);
>           if (!qdev_realize(DEVICE(pec), NULL, errp)) {
>               return;
>           }
> 

