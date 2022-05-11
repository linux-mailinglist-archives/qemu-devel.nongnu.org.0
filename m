Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABCE52281B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 02:04:07 +0200 (CEST)
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noZpm-0004HS-HI
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 20:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1noZnr-0001rx-8w; Tue, 10 May 2022 20:02:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17944
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1noZnp-0000S1-By; Tue, 10 May 2022 20:02:06 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AMeZL6000519;
 Wed, 11 May 2022 00:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 reply-to : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=R1lYZZYbp2fUNW/8GvkSV2if6ymx6V/RZ7j4ACk2fkY=;
 b=ZwY3b68g1K3fBLVXh08bli7x3k3kR47R4G9dRxYrWg+6KJ0i8KdHWCGxh4lKag7NP4by
 BeJii6I9DYikvXMIkhovR2Erjjzhd0bo+0qkmDBxInLXd8ITVveA+c0exFQQytJg2NQZ
 76kWSj8ehcWR5194QiNFUB8st7UYDyzjQYNJY3k+vwuzdnbLpuHbTInovxfWthaT8Afz
 x93MF164eR+HgX98xbcy/BTTGRrURfrOt9Wr2ZT8bUMVS1vIcSyZ7FzmGgA9O6DfKZqF
 MDLkzP2B9w3dknSRgC5xc5eGFiAZi3TGvEAuXe69A4/rF8k/QhnoSScfdR3JDInyVkdE BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g00g91h51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 00:01:50 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24B00WI4005701;
 Wed, 11 May 2022 00:01:50 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g00g91h4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 00:01:50 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24ANr4jN015976;
 Wed, 11 May 2022 00:01:49 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3fwgdapgvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 00:01:49 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24B01mIQ10486038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 00:01:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E835DBE053;
 Wed, 11 May 2022 00:01:47 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA8DFBE04F;
 Wed, 11 May 2022 00:01:45 +0000 (GMT)
Received: from [9.65.84.66] (unknown [9.65.84.66])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 11 May 2022 00:01:45 +0000 (GMT)
Message-ID: <d0fa9d1f-bc09-5068-b222-f94cc5bc7810@linux.ibm.com>
Date: Tue, 10 May 2022 21:01:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH v2] mos6522: fix linking error when CONFIG_MOS6522 is not
 set
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-ppc@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mopsfelder@gmail.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>
References: <20220506011632.183257-1-muriloo@linux.ibm.com>
 <358f4e05-a29f-6e2f-5fc3-1df6c2b8315c@redhat.com>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <358f4e05-a29f-6e2f-5fc3-1df6c2b8315c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qP5AGIfAXr1etRgTtM_zHQNoHxZ5aMUo
X-Proofpoint-ORIG-GUID: c2yBWmeGIg21xQChrkcgjmrZCwubM0JJ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_07,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205100097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
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

Hi, Thomas.

On 5/10/22 04:24, Thomas Huth wrote:
> On 06/05/2022 03.16, Murilo Opsfelder Araujo wrote:
>> When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:
>>
>>      /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'
>>
>> Make devices configuration available in hmp-commands*.hx and check for
>> CONFIG_MOS6522.
>>
>> Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>> v2:
>> - Included devices configuration in monitor/misc.c
>>
>> v1:
>> - https://lore.kernel.org/qemu-devel/20220429233146.29662-1-muriloo@linux.ibm.com/
>>
>>   hmp-commands-info.hx | 2 ++
>>   monitor/misc.c       | 3 +++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index adfa085a9b..9ad784dd9f 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -881,6 +881,7 @@ SRST
>>   ERST
>>   #if defined(TARGET_M68K) || defined(TARGET_PPC)
>> +#if defined(CONFIG_MOS6522)
> 
> I think you could even get rid of the TARGET_ stuff now that the CONFIG line works!
> 
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
>> diff --git a/monitor/misc.c b/monitor/misc.c
>> index 6c5bb82d3b..3d2312ba8d 100644
>> --- a/monitor/misc.c
>> +++ b/monitor/misc.c
>> @@ -84,6 +84,9 @@
>>   #include "hw/s390x/storage-attributes.h"
>>   #endif
>> +/* Make devices configuration available for use in hmp-commands*.hx templates */
>> +#include CONFIG_DEVICES
> 
> Looks reasonable to me.
> 
> So with the "#if defined(TARGET_M68K) || defined(TARGET_PPC)" removed:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

I've sent v3 with your suggestion:

     https://lore.kernel.org/qemu-devel/20220510235439.54775-1-muriloo@linux.ibm.com/

Thank you for your review.

-- 
Murilo

