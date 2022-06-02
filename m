Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE1253B907
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:36:51 +0200 (CEST)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwk4I-0002g0-Df
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nwjWN-0003jT-5Y; Thu, 02 Jun 2022 08:01:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43260
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nwjWJ-0001xj-Th; Thu, 02 Jun 2022 08:01:46 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252Bhwpv024903;
 Thu, 2 Jun 2022 12:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 reply-to : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=fWwbZpwkewaA//9W3DI8CyQGi+oyj6jfRCsU02zlj4Y=;
 b=r1pb0qAe18Gh74iu752e95s9hP+JWJqGDPzAVAe6vl6hzbbyhlK0wnFQP6Ds3Wy4pzxv
 4Z1KXl67wPg/Tc+vmBNlhbvwbpI100FQ4NRjeVxbQh2wHkoh2vhcsQ4HCQCR8SKCI93Z
 39VIpcim/X+AjbkwQAve29KBJ2+/DAIed/S9jaVqWtDou7pcyUW6XPKVvSJsnhmsw3kv
 fOEURrmY+1wZO7iOoWzS7R7uskiuHoyHQIy2YcyMV0Hh6hqB7wH4SyhSOAye0jRgjA+n
 5v5B0xV54tuYW4lqromlxEgXa36efVb/rgDkI/K6cF3HiLccQNReY+2WUH80vde+4QI+ ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gevk389k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 12:01:31 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252BkRjf002725;
 Thu, 2 Jun 2022 12:01:30 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gevk389gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 12:01:29 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252Bp2QP025989;
 Thu, 2 Jun 2022 12:01:25 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3gd1ad8pp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 12:01:25 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 252C1ORD16450042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jun 2022 12:01:24 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEB85AC065;
 Thu,  2 Jun 2022 12:01:24 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 359A5AC059;
 Thu,  2 Jun 2022 12:01:23 +0000 (GMT)
Received: from [9.160.111.240] (unknown [9.160.111.240])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  2 Jun 2022 12:01:23 +0000 (GMT)
Message-ID: <39dbde9e-1287-c6f2-32aa-c2a575791ef1@linux.ibm.com>
Date: Thu, 2 Jun 2022 09:01:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 mopsfelder@gmail.com, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
 <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
 <5435bc6f-70c4-4a18-72b7-147ada5f6a1b@kaod.org>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <5435bc6f-70c4-4a18-72b7-147ada5f6a1b@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i3VDFNR1uvfnZBBI6NeKehYuHeJVPUlJ
X-Proofpoint-ORIG-GUID: LRuCTKyinMXVAPw2D2NMgwas9LcAuWCh
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_02,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020049
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

Hi, Cédric.

On 6/1/22 04:44, Cédric Le Goater wrote:
> On 6/1/22 09:27, Thomas Huth wrote:
>> On 31/05/2022 19.27, Murilo Opsfelder Araujo wrote:
>>> Update max alias to power10 so users can take advantage of a more
>>> recent CPU model when '-cpu max' is provided.
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1038
>>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> Cc: Cédric Le Goater <clg@kaod.org>
>>> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> Cc: Fabiano Rosas <farosas@linux.ibm.com>
>>> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>>> ---
>>>   target/ppc/cpu-models.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
>>> index 976be5e0d1..c15fcb43a1 100644
>>> --- a/target/ppc/cpu-models.c
>>> +++ b/target/ppc/cpu-models.c
>>> @@ -879,7 +879,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>>>       { "755", "755_v2.8" },
>>>       { "goldfinger", "755_v2.8" },
>>>       { "7400", "7400_v2.9" },
>>> -    { "max", "7400_v2.9" },
>>>       { "g4",  "7400_v2.9" },
>>>       { "7410", "7410_v1.4" },
>>>       { "nitro", "7410_v1.4" },
>>> @@ -910,6 +909,8 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
>>>       { "power8nvl", "power8nvl_v1.0" },
>>>       { "power9", "power9_v2.0" },
>>>       { "power10", "power10_v2.0" },
>>> +    /* Update the 'max' alias to the latest CPU model */
>>> +    { "max", "power10_v2.0" },
>>>   #endif
>>
>> I'm not sure whether "max" should really be fixed alias in this list here? What if a user runs with KVM on a POWER8 host - then "max" won't work this way, will it?
>>
>> And in the long run, it would also be good if this would work with other machines like the "g3beige", too (which don't support the new 64-bit POWER CPUs), so you should at least mention in the commit description that this is only a temporary hack for the pseries machine, I think.
>
> Yes. You are right, Thomas.
>
> s390 and x86 have a nice way to address "max".

If I understood the code correctly, they implement "-cpu max" based on
a CPU model with additional CPU features enabled.  The resulting
emulated CPU is not necessarily a CPU model that exists as a hardware.
So, the "-cpu max" never gets any CPU feature dropped.  Features are
only added in.

I'm not keen on this idea of having a CPU model that doesn't even
exist as a hardware.

--
Murilo


