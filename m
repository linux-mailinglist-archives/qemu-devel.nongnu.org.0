Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75460390750
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:17:51 +0200 (CEST)
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llagg-00040M-DO
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1llZhx-0004O4-Se
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:15:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3558
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1llZhv-0004Rz-Py
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:15:05 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PG2sNV153563; Tue, 25 May 2021 12:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hm6mkwNXJDW2NLAkpmDLMaksq41/sbdVHlWEKeIE0BQ=;
 b=hysShD5HwLA5mZ3EC+ySCz2r4z7OAgRHNeOic/WaxF9Yphq46xVzBiSXVlbJCXr/M2qq
 rWI/GCfyvPmq6otCAv1PhOwXbHdH//vHBT8kzCq204LOQ3jSM0FkRoTsBlpU86KC1IO3
 +RoF3bFyD60aH1QW39HsxCFhqnEJCo2H7a530wRm7Ky4D5hHke+vy9NtcyYI7nEa4NMk
 eeuhNbAL+I/6KxH5+n1Izzta3NRE93xcI8/QfiyjX4YMgOSrGGQc95PEs1bnZ8RwQerb
 iQyONaaPqieUxIVoIsd/Wh7k15EAF2Rn319BRZtyF532PkruxEUE1yxatBgrSFFuLRMA tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s4c8rmdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 12:15:02 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14PG3I9F156448;
 Tue, 25 May 2021 12:15:02 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s4c8rmd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 12:15:02 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PG7beR012127;
 Tue, 25 May 2021 16:15:01 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 38s1q6hjs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 16:15:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PGF17Z39977464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 16:15:01 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02A6F112063;
 Tue, 25 May 2021 16:15:01 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E267A112064;
 Tue, 25 May 2021 16:15:00 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 16:15:00 +0000 (GMT)
Subject: Re: [PATCH 2/6] tests/qtest/e1000e-test: Check qemu_recv() succeeded
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210525134458.6675-1-peter.maydell@linaro.org>
 <20210525134458.6675-3-peter.maydell@linaro.org>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <42ba52e6-21c8-fcca-2beb-e8dfd7b93f86@linux.ibm.com>
Date: Tue, 25 May 2021 12:15:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525134458.6675-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FR5UNYaQAOjBRdP350Ax66cmFhaPbtAb
X-Proofpoint-ORIG-GUID: bjGJ3T_SJdmTLibsuzoZWzmoFJ9OL4vc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_07:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> The e1000e_send_verify() test calls qemu_recv() but doesn't
> check that the call succeeded, which annoys Coverity. Add
> an explicit test check for the length of the data.
>
> (This is a test check, not a "we assume this syscall always
> succeeds", so we use g_assert_cmpint() rather than g_assert().)
>
> Fixes: Coverity CID 1432324
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   tests/qtest/e1000e-test.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
> index fc226fdfeb5..0273fe4c156 100644
> --- a/tests/qtest/e1000e-test.c
> +++ b/tests/qtest/e1000e-test.c
> @@ -93,7 +93,8 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
>       /* Check data sent to the backend */
>       ret = qemu_recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
>       g_assert_cmpint(ret, == , sizeof(recv_len));
> -    qemu_recv(test_sockets[0], buffer, 64, 0);
> +    ret = qemu_recv(test_sockets[0], buffer, 64, 0);
> +    g_assert_cmpint(ret, >=, 5);
>       g_assert_cmpstr(buffer, == , "TEST");
>
>       /* Free test data buffer */

