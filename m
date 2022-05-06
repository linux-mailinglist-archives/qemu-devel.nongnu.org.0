Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E7451E297
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 01:48:19 +0200 (CEST)
Received: from localhost ([::1]:49210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn7gI-0006vz-Gv
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 19:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nn7cc-0004es-T4; Fri, 06 May 2022 19:44:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nn7ca-0005TC-U0; Fri, 06 May 2022 19:44:30 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246LewAk003413;
 Fri, 6 May 2022 23:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : reply-to : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=2GB3HhJJ3aerBzstImMGiKdIjPPmMoK4KqDSmNRWDAY=;
 b=lWd5Qf2X1DauoZhlfsyURsVCCKDs9Yhtmp1H7sc4IGWRSRoxBN7aMWNIp8WcV6goQFwo
 qmf0YMp2umwzGAwLFF3AllksPU5Btpe/k5AGo46Zc7vMwkWBh2PtPt8dj06vy1F1Qo75
 IQjL9GYXvQNO6tBKDPgo7CqeoqNQJEa4l6ye8ND7T34tu/2Zs5RBJdCj28iQz6ASN1lt
 bqGxsQ7+epLb9nNS9JelWJyYAKWmfpovMbqWfgVqOxLhzQr8Nxc7Eq0Mz3wcW/IbgSdm
 FiQa78Z+k6SzF/QYi9cLzF7DObQViOh46t3b/KUAibI7ikA1qKqTvfn1J5KPNO0N2xMi jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw65p7pd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 23:44:10 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 246NiASk002601;
 Fri, 6 May 2022 23:44:10 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw65p7pd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 23:44:10 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 246Ngf2S026654;
 Fri, 6 May 2022 23:44:09 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3frvraxd09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 23:44:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 246Ni7w228377388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 23:44:07 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BF17BE051;
 Fri,  6 May 2022 23:44:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17413BE053;
 Fri,  6 May 2022 23:44:06 +0000 (GMT)
Received: from [9.65.249.17] (unknown [9.65.249.17])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri,  6 May 2022 23:44:05 +0000 (GMT)
Message-ID: <56cae01e-7944-8775-e3a2-3071c18f2da1@linux.ibm.com>
Date: Fri, 6 May 2022 20:44:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.0
Subject: Re: [PATCH] mos6522: fix linking error when CONFIG_MOS6522 is not set
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RyZH5quWcZFfAoP_U8Lmaznjn_0g02nU
X-Proofpoint-GUID: _xsgT5v8uGX7JcpIDRSWt_x_yNSyE15T
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_07,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205060118
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

On 5/2/22 06:43, Mark Cave-Ayland wrote:
> On 30/04/2022 00:31, Murilo Opsfelder Araujo wrote:
> 
>> When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:
>>
>>      /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'
>>      clang-13: error: linker command failed with exit code 1 (use -v to see invocation)
>>
>> Add CONFIG_MOS6522 check for hmp_info_via in hmp-commands-info.hx to fix
>> such linking error.
>>
>> Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>   hmp-commands-info.hx | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index adfa085a9b..9ad784dd9f 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -881,6 +881,7 @@ SRST
>>   ERST
>>   #if defined(TARGET_M68K) || defined(TARGET_PPC)
>> +#if defined(CONFIG_MOS6522)
>>       {
>>           .name         = "via",
>>           .args_type    = "",
>> @@ -889,6 +890,7 @@ ERST
>>           .cmd          = hmp_info_via,
>>       },
>>   #endif
>> +#endif
>>   SRST
>>     ``info via``
> 
> Hmmm. The patch in its proposed form isn't correct, since device CONFIG_* defines aren't declared when processing hmp-commands-info.hx. This was something that was discovered and discussed in the original thread for which the current workaround is to use the per-target TARGET_* defines instead.

I've sent a v2 of this patch that addresses this, i.e.: the CONFIG_* options are available in hmp-commands-info.hx:

     https://lore.kernel.org/qemu-devel/20220506011632.183257-1-muriloo@linux.ibm.com/

I hope it can resolve the build issue in the short-term.
I'd appreciate if you or anyone on this thread could review it.

Thank you, Mark, for the discussion and knowledge sharing!

Cheers!

-- 
Murilo

