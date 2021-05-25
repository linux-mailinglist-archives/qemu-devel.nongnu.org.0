Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D546F390770
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:22:37 +0200 (CEST)
Received: from localhost ([::1]:49854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llalI-0006qp-S8
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1llZhk-00040l-F9
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:14:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8596
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1llZhh-0004Gk-Lj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:14:52 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PGC7YU055404; Tue, 25 May 2021 12:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=l51DtlhC1FwGvLkyr8biRsZNP+7+/ARfHk9f2eO8bS4=;
 b=LBcYy7TwqkAj6dQ3vYjctIYC0Dgzq+Cbu3ztN/+PkQ7s0UCgy41L8ERxMVdaEU6V1amK
 qX89z74Eq9Y2oe4iyHeTFKFN+Oqo6y4v2V6lTNIloIUzGL3HbGf3pAUaFAYMTrGrggpu
 ogvv5Twaumflx2oV2lhdZ3KVDiwvtHGnTWjF4RgsRhvKB3nYuoTzH664ExxXyq4dX6dO
 a7qFopfthoh0ekuGWhTLYTmawlKA30Ty0SCWSWsl+1TaU3QluM+NM7SaDYTV1zTUyQUT
 6UA0M2aD997Nch41bSCaNUCAPotX926HzyEcJg38CVoF8WmoFkZKcxiRPdyWykWwPIOH JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s44v10ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 12:14:47 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14PGD0EB061214;
 Tue, 25 May 2021 12:14:47 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s44v10u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 12:14:47 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PG8a4h022559;
 Tue, 25 May 2021 16:14:46 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 38s1gw1qjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 16:14:46 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PGEkRk27197742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 16:14:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DE8B112064;
 Tue, 25 May 2021 16:14:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6B1E112062;
 Tue, 25 May 2021 16:14:45 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 16:14:45 +0000 (GMT)
Subject: Re: [PATCH 3/6] tests/qtest/hd-geo-test: Fix checks on mkstemp()
 return value
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210525134458.6675-1-peter.maydell@linaro.org>
 <20210525134458.6675-4-peter.maydell@linaro.org>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <828c3092-392b-40d0-0473-54dbe1946d48@linux.ibm.com>
Date: Tue, 25 May 2021 12:14:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525134458.6675-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hGnxzSE471WqUfOaiKgpN9rKNs01LLG7
X-Proofpoint-ORIG-GUID: Hyc9MF0PRccJiK5PlQHTOr_u2KGQzVGT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_07:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/25/21 9:44 AM, Peter Maydell wrote:
> Coverity notices that the checks against mkstemp() failing in
> create_qcow2_with_mbr() are wrong: mkstemp returns -1 on failure but
> the check is just "g_assert(fd)".  Fix to use "g_assert(fd >= 0)",
> matching the correct check in create_test_img().
>
> Fixes: Coverity CID 1432274
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   tests/qtest/hd-geo-test.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index f7b7cfbc2d1..113126ae06c 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -464,7 +464,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
>       }
>
>       fd = mkstemp(raw_path);
> -    g_assert(fd);
> +    g_assert(fd >= 0);
>       close(fd);
>
>       fd = open(raw_path, O_WRONLY);
> @@ -474,7 +474,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
>       close(fd);
>
>       fd = mkstemp(qcow2_path);
> -    g_assert(fd);
> +    g_assert(fd >= 0);
>       close(fd);
>
>       qemu_img_path = getenv("QTEST_QEMU_IMG");

