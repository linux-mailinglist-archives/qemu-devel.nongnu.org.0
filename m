Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A50B390789
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:25:51 +0200 (CEST)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaoQ-0005AZ-7Y
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1llZiB-0004tD-VX
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:15:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14524
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1llZiA-0004Yw-3n
 for qemu-devel@nongnu.org; Tue, 25 May 2021 12:15:19 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PGC53I055328; Tue, 25 May 2021 12:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=y0G4CWBA/JT8jVj1vQ8hDgs+Y7sV2MIQcMixoQvhcYc=;
 b=sUXtjYGoTbPsl87Yk141YkrN+LlybKcYd8KwLKnoV/XiMFXfnfGepy/eHs5KN6jYP4+J
 EfG6esr66tqu0fSMFfOoGwUoiyjrgL4XfB0LBFk4CS5gpAOBH/IdUjgVQ9d12BBG8/0y
 zObylZllxcnY9lEJFBp0hhBE8w1I85ct9g1T599JVhaSBhM3lmuFOMCYpdWNNhx8moaw
 0RsQA5336eAnwE/wBsladHDwVdK298IQIatf84PBQ8AKgZ3UXSXo4JFG809bw/c85ZnA
 76bvc03mGFamWbx/Nh/bOPZnYRkf0F1cINOdYpYREA9dm/ekO7B1lMAL6zDrJEG7bKgQ CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s44v11fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 12:15:15 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14PGFEqj070829;
 Tue, 25 May 2021 12:15:14 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s44v11et-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 12:15:14 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PG7Xrp000360;
 Tue, 25 May 2021 16:15:14 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 38s1v9st84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 16:15:14 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PGFDLf9896538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 16:15:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65CB9112065;
 Tue, 25 May 2021 16:15:13 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D88E112062;
 Tue, 25 May 2021 16:15:13 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 May 2021 16:15:13 +0000 (GMT)
Subject: Re: [PATCH 1/6] tests/qtest/bios-tables-test: Check for dup2() failure
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210525134458.6675-1-peter.maydell@linaro.org>
 <20210525134458.6675-2-peter.maydell@linaro.org>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <5c40c934-c5c9-79bd-8239-643005314252@linux.ibm.com>
Date: Tue, 25 May 2021 12:15:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525134458.6675-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T2w-X45j-m15FdpKXnrWYSkpjwkNSuO-
X-Proofpoint-ORIG-GUID: dCqcArJadRaniIFcKYQILGuKKNOk4roX
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
> Coverity notes that we don't check for dup2() failing.  Add some
> assertions so that if it does ever happen we get some indication.
> (This is similar to how we handle other "don't expect this syscall to
> fail" checks in this test code.)
>
> Fixes: Coverity CID 1432346
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


> ---
>   tests/qtest/bios-tables-test.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 156d4174aa3..51d3a4e2390 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -489,10 +489,14 @@ static void test_acpi_asl(test_data *data)
>                                                    exp_sdt->asl_file, sdt->asl_file);
>                       int out = dup(STDOUT_FILENO);
>                       int ret G_GNUC_UNUSED;
> +                    int dupret;
>
> -                    dup2(STDERR_FILENO, STDOUT_FILENO);
> +                    g_assert(out >= 0);
> +                    dupret = dup2(STDERR_FILENO, STDOUT_FILENO);
> +                    g_assert(dupret >= 0);
>                       ret = system(diff) ;
> -                    dup2(out, STDOUT_FILENO);
> +                    dupret = dup2(out, STDOUT_FILENO);
> +                    g_assert(dupret >= 0);
>                       close(out);
>                       g_free(diff);
>                   }

