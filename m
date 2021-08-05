Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00073E17CC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:22:46 +0200 (CEST)
Received: from localhost ([::1]:54008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBfCn-0001DE-UE
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mBfBM-00087m-F7; Thu, 05 Aug 2021 11:21:16 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mBfBJ-00017m-I4; Thu, 05 Aug 2021 11:21:16 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 175F5Y5T008931; Thu, 5 Aug 2021 11:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lDRaHkCjvmJc3cVq6ugXLHNJRRarOTKWa5feNwETuXI=;
 b=TnkfV99DRW+4AmoqHSRumaHHdF263tLFsEWcLzxR0H3baL0rchIDS5sJ2eHc8keHNFZc
 TvOoen0oL3OQXh98/O2hCr184iCI8FmQiR3ulzmF4WuHwobIcGQ9yUnu9ltzvlAA/P/A
 HrLrpLLB9R57Sza2HiUqeh7gRjYKDDOdXyQci/GOzso3tpwhhHJmxsYePtwm+BXEJp3F
 H9va6T4zqhO6PxseElk8GLNCjlXZrMsbohuKiBPk2RkV3XmxO21jy+JeMj/F8YkIUwjg
 FOg0fMP+uZ82SIEcHPyrqWIvpWoOOMSZ5ejTFykdDm8Oil3mChrlod4JWA9wYRiVTIMB pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a846bemg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 11:21:10 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 175F6e2Y012434;
 Thu, 5 Aug 2021 11:21:10 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a846bemf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 11:21:10 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175FELF0029094;
 Thu, 5 Aug 2021 15:21:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3a4wsj28c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 15:21:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 175FL5Mm55705972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 15:21:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A1ADA405E;
 Thu,  5 Aug 2021 15:21:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFCD3A407B;
 Thu,  5 Aug 2021 15:21:04 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.37.89])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 15:21:04 +0000 (GMT)
Subject: Re: [PATCH v1] s390x/ioinst: Fix wrong MSCH alignment check on little
 endian
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210805143753.86520-1-david@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <6d1ce2bc-40ba-bf25-7b10-064e980d7813@linux.ibm.com>
Date: Thu, 5 Aug 2021 17:21:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805143753.86520-1-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nuUwoRfKeeFRV75_jOkwstsyhYwqYIax
X-Proofpoint-GUID: 82V3BAiLRx9g2GsohlPTGpy9CGxg1vxv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_05:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108050092
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.132,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/5/21 4:37 PM, David Hildenbrand wrote:
> schib->pmcw.chars is 32bit, not 16bit. This fixes the kvm-unit-tests
> "css" test, which fails with:
> 
>    FAIL: Channel Subsystem: measurement block format1: Unaligned MB origin:
>    Program interrupt: expected(21) == received(0)
> 
> Because we end up not injecting an operand program exception.
> 
> Fixes: a54b8ac340c2 ("css: SCHIB measurement block origin must be aligned")
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Pierre Morel <pmorel@linux.ibm.com>
> Cc: qemu-s390x@nongnu.org
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   target/s390x/ioinst.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
> index 4eb0a7a9f8..bdae5090bc 100644
> --- a/target/s390x/ioinst.c
> +++ b/target/s390x/ioinst.c
> @@ -123,7 +123,7 @@ static int ioinst_schib_valid(SCHIB *schib)
>       }
>       /* for MB format 1 bits 26-31 of word 11 must be 0 */
>       /* MBA uses words 10 and 11, it means align on 2**6 */
> -    if ((be16_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
> +    if ((be32_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
>           (be64_to_cpu(schib->mba) & 0x03fUL)) {
>           return 0;
>       }
> 

It is obviously a 32bit.

Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>


-- 
Pierre Morel
IBM Lab Boeblingen

