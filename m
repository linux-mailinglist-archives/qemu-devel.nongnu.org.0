Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F9353B915
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:43:00 +0200 (CEST)
Received: from localhost ([::1]:60768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwkAF-0000M3-2K
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nwjry-0001Sf-Ol; Thu, 02 Jun 2022 08:24:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nwjrw-0002dG-Rz; Thu, 02 Jun 2022 08:24:06 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252CFrFF002503;
 Thu, 2 Jun 2022 12:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 reply-to : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=cRgW2X5Lqh9k8/7B5FtAZuqVubcprjG4V77AdweExJs=;
 b=MCpvroCRDGVfffqMazkFDshQu60VojzMrWhfLZygeFzJrweRBJ6U9QnI8phs1obwsexD
 ORz7luhKHa1EP7n3IKQonQx2ZK+0FNeJtriIq16gs2U+1nYENqkYcQfr1+AMzq9dr+g8
 vksYBSGo2gm9+drbwlcIr2MBOAICDtj0eUYx9H+bh+ZLknQ9tfjstW0Fjno4MDa0SMUS
 qNBqqmf97YX2Hgvb6eAaMqT6EiswVh1lszr9oEGX/Gr1az5snZPTCPDDVZFgJP/82bHs
 j5WK4fmE0w59f7EVzuQYNh+NeJQ0O3S6zkug6HDdAXfvPPjZjgwqFatO8tN7T6hVvWLo /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gew2c03sg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 12:23:56 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252CGs7x005345;
 Thu, 2 Jun 2022 12:23:55 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gew2c03s6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 12:23:55 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252CMG97011186;
 Thu, 2 Jun 2022 12:23:54 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3gcxt5sywx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 12:23:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 252CNr6N39715312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jun 2022 12:23:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6DF7AC05F;
 Thu,  2 Jun 2022 12:23:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F1F8AC059;
 Thu,  2 Jun 2022 12:23:52 +0000 (GMT)
Received: from [9.160.111.240] (unknown [9.160.111.240])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Jun 2022 12:23:52 +0000 (GMT)
Message-ID: <c7c8d391-4fa5-9dbf-cf86-1a6fc84ab3c4@linux.ibm.com>
Date: Thu, 2 Jun 2022 09:23:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 mopsfelder@gmail.com, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
 <3b96fc19-8857-8a63-8ab0-5f37ef1177ce@eldorado.org.br>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <3b96fc19-8857-8a63-8ab0-5f37ef1177ce@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c4KkXbKcTBpqAWAI9jxAsCJpv6d67m5E
X-Proofpoint-ORIG-GUID: xSl9rvPjAzfYGOO42hmWI_JgE_xsNo3S
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_03,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0 impostorscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020052
Received-SPF: pass client-ip=148.163.156.1; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Reply-To: muriloo@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Matheus.

On 5/31/22 15:04, Matheus K. Ferst wrote:
> On 31/05/2022 14:27, Murilo Opsfelder Araujo wrote:
>> Update max alias to power10 so users can take advantage of a more
>> recent CPU model when '-cpu max' is provided.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1038
>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: Cédric Le Goater <clg@kaod.org>
>> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> ---
>>   target/ppc/cpu-models.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
>> index 976be5e0d1..c15fcb43a1 100644
>> --- a/target/ppc/cpu-models.c
>> +++ b/target/ppc/cpu-models.c
>> @@ -879,7 +879,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>>       { "755", "755_v2.8" },
>>       { "goldfinger", "755_v2.8" },
>>       { "7400", "7400_v2.9" },
>> -    { "max", "7400_v2.9" },
>>       { "g4",  "7400_v2.9" },
>>       { "7410", "7410_v1.4" },
>>       { "nitro", "7410_v1.4" },
>> @@ -910,6 +909,8 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>>       { "power8nvl", "power8nvl_v1.0" },
>>       { "power9", "power9_v2.0" },
>>       { "power10", "power10_v2.0" },
>> +    /* Update the 'max' alias to the latest CPU model */
>> +    { "max", "power10_v2.0" },
>>   #endif
>>
>>       /* Generic PowerPCs */
>> --
>> 2.36.1
>>
>>
>
> Hi Murilo,
>
> I guess we need a "max" for qemu-system-ppc too, so maybe something like
>
>  >     /* Update the 'max' alias to the latest CPU model */
>  > #if defined(TARGET_PPC64)
>  >     { "max", "power10_v2.0" },
>  > #else
>  >     { "max", "7457a_v1.2" },
>  > #endif

Thanks for reviewing.

I'm more inclined to the idea of selecting the default CPU type of the
machine, as other folks suggested in the replies, instead of
hard-coding an alias.

Cheers!

--
Murilo


