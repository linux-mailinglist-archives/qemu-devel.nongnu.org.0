Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F289155BB4C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:19:43 +0200 (CEST)
Received: from localhost ([::1]:51848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5sOk-0002O2-Ta
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1o5sC0-0003a7-Rr; Mon, 27 Jun 2022 13:06:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1o5sBm-00021A-PC; Mon, 27 Jun 2022 13:06:27 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RGhWlx022818;
 Mon, 27 Jun 2022 17:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=R9xMRZvg5HDAmjnO5iBZVEjyvt8Ay5rdCfcWW7bu8/w=;
 b=BIEAIHcxhLrPwdk90ro21hhEd0mRvKAUY5UX0hqFUKtrJPefdWnzmDOqEofvKtKbKAv3
 3BK6xl0wMOXMqmecP7d9FhFvPq+aA/FA+yvI6zv3SuY4KJKVlupDWOIJM7oYJXa30Mj+
 EtVRbekjHF+rnSRaBFhLDjk12dJmSXcRjQBTPQUF1d4iHAruTFmYHI/NU6kbPjQipYc2
 8INOUaITzf5UcTQjTBNotsxGI4LUgSxf8jjInMdQ4JeNwPUZdUc4MV9PEMH660lgKLY2
 aeTMHLYTEF8Q1f8gc8gReENCQfziSR5yoH4XL24jpH+3rea7wncjO/3Ok5d41RKdioph tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gygakgm7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 17:06:15 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RGhpmT023278;
 Mon, 27 Jun 2022 17:06:14 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gygakgm60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 17:06:14 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RGp5lN017504;
 Mon, 27 Jun 2022 17:06:13 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3gwt08u86n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 17:06:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 25RH5DDT23003612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jun 2022 17:05:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DE354C044;
 Mon, 27 Jun 2022 17:06:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53E2B4C040;
 Mon, 27 Jun 2022 17:06:10 +0000 (GMT)
Received: from [9.171.40.136] (unknown [9.171.40.136])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jun 2022 17:06:08 +0000 (GMT)
Message-ID: <c75a6e08-00e5-45cb-fa67-ff41a8ec67fe@linux.ibm.com>
Date: Mon, 27 Jun 2022 19:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] target/s390x/tcg: SPX: check validity of new prefix
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20220627131251.2832076-1-scgl@linux.ibm.com>
 <bb5c26f1-5b78-8abe-48ba-72cb78597d05@redhat.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <bb5c26f1-5b78-8abe-48ba-72cb78597d05@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tJk8FZmhpnmlPIKLFNJbDvmN6wltKOHs
X-Proofpoint-GUID: FiytZdXOJ0QLz6XozCiT_CJxyWDEEmh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=904 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270070
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/27/22 18:27, David Hildenbrand wrote:
> On 27.06.22 15:12, Janis Schoetterl-Glausch wrote:
>> According to the architecture, SET PREFIX must try to access the new
>> prefix area and recognize an addressing exception if the area is not
>> accessible.
>> For qemu this check prevents a crash in cpu_map_lowcore after an
>> inaccessible prefix area has been set.
> 
> I don't think that's possible. Our memory increments are 1 MiB and one
> would have to cross a 1~MiB range with the second page to trigger that.
> IIRC that's impossible with SPX address alignment requirements?
> 
Are you saying that checking the first page is sufficient?
I'm not sure that this the case for the architecture in general,
but I guess it is true for tcg. Do you want me to remove the second check?
> 
>>
>> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
>> ---
>>
>>
>> Is there a stricter check to see if the memory is accessible?
>>
>>
>>  target/s390x/tcg/misc_helper.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
>> index aab9c47747..c8447b36fc 100644
>> --- a/target/s390x/tcg/misc_helper.c
>> +++ b/target/s390x/tcg/misc_helper.c
>> @@ -158,6 +158,10 @@ void HELPER(spx)(CPUS390XState *env, uint64_t a1)
>>      if (prefix == old_prefix) {
>>          return;
>>      }
>> +    if (!mmu_absolute_addr_valid(prefix, true) ||
>> +        !mmu_absolute_addr_valid(prefix + TARGET_PAGE_SIZE, true)) {
>> +        tcg_s390_program_interrupt(env, PGM_ADDRESSING, GETPC());
>> +    }
>>  
>>      env->psa = prefix;
>>      HELPER_LOG("prefix: %#x\n", prefix);
>>
>> base-commit: 3a821c52e1a30ecd9a436f2c67cc66b5628c829f
> 
> 


