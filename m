Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765CA3DBC4C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:28:03 +0200 (CEST)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9UQc-00038D-C5
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1m9UPm-0002Sl-Sk
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:27:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8100
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1m9UPj-00073I-DI
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:27:10 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UF48rx113949; Fri, 30 Jul 2021 11:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=aqn/4Zx8ac2H9omLZN8L3X67iMOP2cqhlqgK7m+PP2o=;
 b=LhmshsnB/FjHUkyzcriapReEbfzSHqBZ9u6LNe7OOI5zH9hE+Fig4k1w+OTXiLo4j5E2
 s15sxeYexk4sZqOUJ7wR/JIdbPjo4khZarQi+krCWmE2ETAka7axijPpUCueIP8WLLeg
 uaNgGoAoY9+VTUAz5gQvR3JcEVSbUHYwERrhR98dqsj5a9lSN4vKt91Bri6Ug2Gv8n/x
 cgK55CvVyIPHkRN3k6/95abjaJxp9+LEXzQYRzj99668ciGosJPF/aSP6zpOqA6oYZrn
 NuZmg1c9MnNJ6s26EWDz1xWalXZFMvZiavrN3uGVw5X93eFQb6rVN4cyWgRu0+MdmHML xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a4jmb30ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 11:26:55 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16UF4rcP123030;
 Fri, 30 Jul 2021 11:26:55 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a4jmb30u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 11:26:55 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16UFQh5q002460;
 Fri, 30 Jul 2021 15:26:53 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3a235stsad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 15:26:53 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16UFQqY933554924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 15:26:53 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAA34AE077;
 Fri, 30 Jul 2021 15:26:52 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19D9CAE071;
 Fri, 30 Jul 2021 15:26:52 +0000 (GMT)
Received: from [9.211.43.195] (unknown [9.211.43.195])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Jul 2021 15:26:51 +0000 (GMT)
Subject: Re: [PATCH] gitlab-ci.d/buildtest: Mark the aarch64 and ppc64-s390x
 CFI jobs as manual
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210728075141.400816-1-thuth@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <0a4da13e-2e38-53f3-4948-f2d1f23104e2@linux.vnet.ibm.com>
Date: Fri, 30 Jul 2021 11:26:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728075141.400816-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: t1dJqb2E-KTw0TCTabHq6VTlDC336-Bf
X-Proofpoint-GUID: 00iiWmfeQ44A_Q4RY2CmdbxuoNMnnV-n
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_08:2021-07-30,
 2021-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1011 malwarescore=0 suspectscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300099
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I agree, making these manual tasks until we find a fix for this is the 
only solution I can think of too.

Daniele

On 7/28/2021 3:51 AM, Thomas Huth wrote:
> These two jobs are currently failing very often - the linker seems to
> get killed due to out-of-memory problems. Since apparently nobody has
> currently an idea how to fix that nicely, let's mark the jobs as manual
> for the time being until someone comes up with a proper fix.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 63f1903f07..3537c6f1a1 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -416,6 +416,12 @@ build-cfi-aarch64:
>       expire_in: 2 days
>       paths:
>         - build
> +  rules:
> +    # FIXME: This job is often failing, likely due to out-of-memory problems in
> +    # the constraint containers of the shared runners. Thus this is marked as
> +    # manual until the situation has been solved.
> +    - when: manual
> +      allow_failure: true
> 
>   check-cfi-aarch64:
>     extends: .native_test_job_template
> @@ -452,6 +458,12 @@ build-cfi-ppc64-s390x:
>       expire_in: 2 days
>       paths:
>         - build
> +  rules:
> +    # FIXME: This job is often failing, likely due to out-of-memory problems in
> +    # the constraint containers of the shared runners. Thus this is marked as
> +    # manual until the situation has been solved.
> +    - when: manual
> +      allow_failure: true
> 
>   check-cfi-ppc64-s390x:
>     extends: .native_test_job_template
> 

