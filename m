Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0934C02E5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 21:13:50 +0100 (CET)
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMbXh-0000sF-Cr
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 15:13:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nMbBC-00006G-6T
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:50:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nMbB2-00018u-0X
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:50:33 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21MHYh9u025950
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 19:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ihSZ3QZJfVwTmE2Ox+g3mu21UgmQYjzOkXXOI26bxDc=;
 b=e/UjcFeav+8FeiYnX/FNOLtFEZatKVK+rVYcE0HPif9b3ldFrn9TyO1sk/oKXW9CdQ9b
 nUbUZI0AvNTwzzxk+2HIJChK6BBcUGPChbtI5SlyAv0W7tDUELeAX9nXOt1ObESG/gZQ
 zXc8UUHAdN47JPyGo/V7NQXUExoqBANqst5GkbjFQ83hLwmkjRK592+GpvzLkryRRSg4
 Zm2J8nhCEbHRId273mvg78UqMgXi2eOfEdri6HzUlxZyxcaYu/x/YEmXjLlhgg7CM0cz
 NGbWI/84878WlwQ+PN61RimNKth/t2VJ445ygnh8F1F1gGeBcRhJyasrkmSdXlNg8ldn zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ed2prxbg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 19:50:18 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21MJdM27031559
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 19:50:18 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ed2prxbfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 19:50:18 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21MJlWTD025145;
 Tue, 22 Feb 2022 19:50:17 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3ed22de4kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 19:50:17 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21MJoFXg29229426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 19:50:15 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C28D86E050;
 Tue, 22 Feb 2022 19:50:15 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CA6A6E04E;
 Tue, 22 Feb 2022 19:50:15 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 22 Feb 2022 19:50:15 +0000 (GMT)
Message-ID: <adf9e3b4-2e72-a2e7-86ee-720c8342130a@linux.ibm.com>
Date: Tue, 22 Feb 2022 14:50:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 20/22] hw/tpm/tpm_tis_isa: Disuse isa_init_irq()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-21-shentey@gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220222193446.156717-21-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XoyDawZfxAkbOAVE_obOsBz28P1keMVw
X-Proofpoint-ORIG-GUID: 5QTx8E8xFLKvFRLMsvXrCH6jJvQ9lpZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_06,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202220119
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/22/22 14:34, Bernhard Beschow wrote:
> isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
> Use the original instead such that isa_init_irq() can be removed
> eventually.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   hw/tpm/tpm_tis_isa.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
> index 10d8a14f19..3477afd735 100644
> --- a/hw/tpm/tpm_tis_isa.c
> +++ b/hw/tpm/tpm_tis_isa.c
> @@ -127,7 +127,7 @@ static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
>           return;
>       }
>
> -    isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
> +    s->irq = isa_get_irq(ISA_DEVICE(dev), s->irq_num);
>
>       memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
>                                   TPM_TIS_ADDR_BASE, &s->mmio);

