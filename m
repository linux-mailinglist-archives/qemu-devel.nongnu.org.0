Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C66371E30
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:14:39 +0200 (CEST)
Received: from localhost ([::1]:45916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldc9W-0001lo-8E
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ldbvR-0007oB-2o
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:00:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ldbvO-0005ui-Rj
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:00:04 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143Giv9S047566; Mon, 3 May 2021 12:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jIS2NRAzz6BeIncUHj8EwDwR4ZZSI1TAMDGCEn9oOr4=;
 b=psy+lDQIjdMn08/0S4TV35rKnHqg1qQPd0W73j+DIIS+/sTCw/RcKOTC8ZuFddsc6C0W
 CoXlTnskZXP/fSYud8hN8EKSjpejIzsg7n1YMLWNLfgTkwquOHTpbpO6XWqO3mxF/K3s
 P9S3XMfMLpu8oLbYrnBoQ3fyAKH64rjQ0SftRyXEmGtT2nljik09S3Cqn4NFjpx1fSJP
 xQ3p5cFa6/AnkYj28VqSLUiiVAhXFEA7769IR+ldgPT8Pmk/hFtP9xgOc0o0DfyEwYVt
 rdDt3Ha5o6D3D+gs5Q6C7TxAM62q3TP3k33OZcQNbQ8DLBT7IUx7jg9GkWUqSVrgw9Hk Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38amybra9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 12:59:58 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 143Gj8hg048018;
 Mon, 3 May 2021 12:59:57 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38amybra9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 12:59:57 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 143GqPKL001711;
 Mon, 3 May 2021 16:59:57 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 388xm9394m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 16:59:57 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 143Gxuvt36241822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 16:59:56 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 812C4112063;
 Mon,  3 May 2021 16:59:56 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22996112061;
 Mon,  3 May 2021 16:59:56 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  3 May 2021 16:59:56 +0000 (GMT)
Subject: Re: [PATCH 1/3] tests/qtest/tpm-util.c: Free memory with correct free
 function
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210503165525.26221-1-peter.maydell@linaro.org>
 <20210503165525.26221-2-peter.maydell@linaro.org>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <12882aaa-62f0-9864-2cd0-d9e89c64ece2@linux.ibm.com>
Date: Mon, 3 May 2021 12:59:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503165525.26221-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wq8C5DQ_u0_QF49oKV-ZKQAG81htIGdb
X-Proofpoint-GUID: WOPsTJDdkxbU_nnIzbRdwYEHNGVL5O6P
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_13:2021-05-03,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030108
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/3/21 12:55 PM, Peter Maydell wrote:
> tpm_util_migration_start_qemu() allocates memory with g_strdup_printf()
> but frees it with free() rather than g_free(), which provokes Coverity
> complaints (CID 1432379, 1432350). Use the correct free function.
>
> Fixes: Coverity CID 1432379, CID 1432350
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> With newer glib (2.46 and up) g_free() is guaranteed to be the same
> as free(), but matching things up is neater anyway.
> ---
>   tests/qtest/tpm-util.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
> index b70cc32d600..3a40ff3f96c 100644
> --- a/tests/qtest/tpm-util.c
> +++ b/tests/qtest/tpm-util.c
> @@ -289,6 +289,6 @@ void tpm_util_migration_start_qemu(QTestState **src_qemu,
>
>       *dst_qemu = qtest_init(dst_qemu_args);
>
> -    free(src_qemu_args);
> -    free(dst_qemu_args);
> +    g_free(src_qemu_args);
> +    g_free(dst_qemu_args);
>   }


Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>



