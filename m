Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DDA39074B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:17:35 +0200 (CEST)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llagQ-0003KC-1L
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1llZh9-0003Ea-6E
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:14:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15304
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1llZh6-0003u2-Lx
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:14:14 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PG3LiK141562; Tue, 25 May 2021 12:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4XU48JOBh0xD3STeCSN9erwIy13s9a6ChIaAKAsY0E8=;
 b=jvnGrNUSN/FKeqn7ug7r8f46uJFZoRYOFKkzDp7u9f3BBPO7MQ4Stsb6ldHRoT6z63+u
 frI0tE4EvcmSo5ND5u+bVD3q6Ryxtbg2KdEYVcCNh7vlIKDoBnjmNdbE/VjsPckrJeSf
 01nRZmmKWGYe36xQ483uZ9mSt0hHQfjFZtlCrM8lpegTKIjF5nmfiMXos7Z9l5M9aPir
 Z4bDv8kjGjecfejHWbySYP44Lg+M8eM7jX/BSSipVHZdvMUEr9uNYPNmgYSowP5zdfee
 zPpZUCxwSVoZ6JmrkkKZ1eIsx9OVxH3g9WjKPcX3MvWPuPtSn0ukiBjxBupt7frPLVgb hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s44wsaby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 12:14:10 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14PG3fZX143880;
 Tue, 25 May 2021 12:14:10 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s44wsabt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 12:14:10 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PG7Wrr000337;
 Tue, 25 May 2021 16:14:09 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 38s1v9ssxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 16:14:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PGE8w637290342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 16:14:08 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF38511206B;
 Tue, 25 May 2021 16:14:08 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D3C7112065;
 Tue, 25 May 2021 16:14:08 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 16:14:08 +0000 (GMT)
Subject: Re: [PATCH 5/6] tests/qtest/tpm-tests: Remove unnecessary NULL checks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210525134458.6675-1-peter.maydell@linaro.org>
 <20210525134458.6675-6-peter.maydell@linaro.org>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <306e148f-79c3-4f95-3cf3-c6b0437c88f6@linux.ibm.com>
Date: Tue, 25 May 2021 12:14:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525134458.6675-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZjAujAMNEWOyoGZ9rdDKuvtHOUhBRDoE
X-Proofpoint-GUID: SynYV3UKF30bW6WeJPi9FrsKl_YMW3Ix
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_07:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> Coverity points out that in tpm_test_swtpm_migration_test() we
> assume that src_tpm_addr and dst_tpm_addr are non-NULL (we
> pass them to tpm_util_migration_start_qemu() which will
> unconditionally dereference them) but then later explicitly
> check them for NULL. Remove the pointless checks.
>
> Fixes: Coverity CID 1432367, 1432359
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   tests/qtest/tpm-tests.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/tests/qtest/tpm-tests.c b/tests/qtest/tpm-tests.c
> index 0da3a8a4df5..25073d1f9e9 100644
> --- a/tests/qtest/tpm-tests.c
> +++ b/tests/qtest/tpm-tests.c
> @@ -123,14 +123,10 @@ void tpm_test_swtpm_migration_test(const char *src_tpm_path,
>       qtest_quit(src_qemu);
>
>       tpm_util_swtpm_kill(dst_tpm_pid);
> -    if (dst_tpm_addr) {
> -        g_unlink(dst_tpm_addr->u.q_unix.path);
> -        qapi_free_SocketAddress(dst_tpm_addr);
> -    }
> +    g_unlink(dst_tpm_addr->u.q_unix.path);
> +    qapi_free_SocketAddress(dst_tpm_addr);
>
>       tpm_util_swtpm_kill(src_tpm_pid);
> -    if (src_tpm_addr) {
> -        g_unlink(src_tpm_addr->u.q_unix.path);
> -        qapi_free_SocketAddress(src_tpm_addr);
> -    }
> +    g_unlink(src_tpm_addr->u.q_unix.path);
> +    qapi_free_SocketAddress(src_tpm_addr);
>   }

