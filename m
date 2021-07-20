Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7E3CF56A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 09:39:15 +0200 (CEST)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5kLS-0001KF-G0
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 03:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m5kJt-0000b5-GI; Tue, 20 Jul 2021 03:37:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m5kJr-0006Na-MF; Tue, 20 Jul 2021 03:37:37 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16K7ZimX083149; Tue, 20 Jul 2021 03:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OTtgFRirCsnUrS2Rl3zE9mUYWzoGSZD/JxLw5nVASHI=;
 b=hEmk5RRo5RayCcVOJ9ewBHA/YB5wXrw+lS+P3YklXJDdDHBNJmKdJEXsMdOHsaeLthUU
 eVOsNl4Cd2NCsPjLlWKNKSAYhtl+yGGW8YmQEoguJgdeepACNqdXKGEmEUZ7L8FgWTME
 7rEFVaaCbuxvApW5dBS6MmTf3evPhfulzvag1x/HrcDi09ztsumqmhfaydyqk+6wzThU
 /AdMdoCrKD5r4Yu8owYBydicIX8N6/gnjvwvEyGa0Bs1IuSBom4y+4Ah8X52+0TsxJop
 8BWE5g+tzcUihs/uw9dj/On9a79ffZkvF3gXtvgXmbz5m7Du7gjsYAh0zTwZmeL+ivW7 HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wr5tucvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 03:37:31 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16K7a3t9085204;
 Tue, 20 Jul 2021 03:37:31 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wr5tucv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 03:37:31 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16K7XH7v004580;
 Tue, 20 Jul 2021 07:37:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 39upu88n4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 07:37:29 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16K7bPu920382194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 07:37:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63A83A4051;
 Tue, 20 Jul 2021 07:37:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC3F0A404D;
 Tue, 20 Jul 2021 07:37:24 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.7.187])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 07:37:24 +0000 (GMT)
Subject: Re: [PATCH v1 1/9] s390x: smp: s390x dedicated smp parsing
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-2-git-send-email-pmorel@linux.ibm.com>
 <871r7yd4gf.fsf@redhat.com> <YPFN83pKBt7F97kW@redhat.com>
 <e4865ad6-f8ec-e7ba-66ef-9c95334ba9b3@linux.ibm.com>
 <87fswa9un2.fsf@redhat.com> <YPWfol5y2pdK9mtC@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <da1ebcb0-e9a2-13cd-fb53-4846f75efe25@linux.ibm.com>
Date: Tue, 20 Jul 2021 09:37:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPWfol5y2pdK9mtC@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ElDKb_-sEqZSlR9sJ1h8CyOtfna4ZcP9
X-Proofpoint-GUID: Mfv4e44TvWijb6gSMJyYXYZxq2F91Bxu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_04:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=952 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107200043
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/19/21 5:52 PM, Daniel P. Berrangé wrote:
> On Mon, Jul 19, 2021 at 05:43:29PM +0200, Cornelia Huck wrote:
>> (restored cc:s)
>>
>> On Fri, Jul 16 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:
>>
>>> On 7/16/21 11:14 AM, Daniel P. Berrangé wrote:
>>>> I increasingly worry that we're making a mistake by going down the
>>>> route of having custom smp_parse implementations per target, as this
>>>> is showing signs of inconsistent behaviour and error reportings. I
>>>> think the differences / restrictions have granularity at a different
>>>> level that is being tested in many cases too.
>>>>
>>>> Whether threads != 1 is valid will likely vary depending on what
>>>> CPU model is chosen, rather than what architecture is chosen.
>>>> The same is true for dies != 1. We're not really checking this
>>>> closely even in x86 - for example I can request nonsense such
>>>> as a 25 year old i486 CPU model with hyperthreading and multiple
>>>> dies
>>>>
>>>>     qemu-system-x86_64 -cpu 486 -smp 16,cores=4,dies=2,threads=2
>>
>> Now that's what I'd call an upgrade :)
>>
>>>>
>>>> In this patch, there is no error reporting if the user specifies
>>>> dies != 1 or threads != 1 - it just silently ignores the request
>>>> which is not good.
>>>
>>> yes, I should change this
>>>
>>>>
>>>> Some machine types may have constraints on CPU sockets.
>>>>
>>>> This can of course all be handled by custom smp_parse impls, but
>>>> this is ultimately going to lead to alot of duplicated and
>>>> inconsistent logic I fear.
>>>>
>>>> I wonder if we would be better off having machine class callback
>>>> that can report topology constraints for the current configuration,
>>>> along lines ofsmp_constraints(MachineState *ms,
>>>>
>>>>        smp_constraints(MachineState *ms,
>>>>                        int *max_sockets,
>>>>                        int *max_dies,
>>>>                        int *max_cores,
>>>>                        int *max_threads)
>>>
>>> I find the idee good, but what about making it really machine agnostic
>>> by removing names and using a generic
>>>
>>> 	smp_constraints(MachineState *ms,
>>> 			int *nb_levels,
>>> 			int *levels[]
>>> 			);
>>>
>>> Level can be replaced by another name like container.
>>> The machine could also provide the level/container names according to
>>> its internal documentation.
>>
>> In theory, this could give us more flexibility; however, wouldn't
>> that still mean that the core needs to have some knowledge of the
>> individual levels? We also have the command line parsing to consider,
>> and that one uses concrete names (which may or may not make sense,
>> depending on what machine you are trying to configure), and we'd still
>> have to map these to 'levels'.
> 
> Yeah, we need to deal with names in several places, so I don't think
> abstracting it in one place is desirable, as it introduces the need
> to convert between the two and potentially obscures the semantics.
> 

Converting with names looks possible to me, every architecture can 
export a topology_name array or structure indicating names and other 
informations like the maximum possible count of entries at this level.

We have now the SMPConfiguration, couldn't we use it for this?

Regards,
Pierre

> 
> Regards,
> Daniel
> 

-- 
Pierre Morel
IBM Lab Boeblingen

