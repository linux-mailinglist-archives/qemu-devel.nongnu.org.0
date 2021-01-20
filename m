Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F192FD7EA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:13:15 +0100 (CET)
Received: from localhost ([::1]:34370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Hyk-0006kb-SF
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1l2Hwc-0005Pz-MA
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:11:02 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1l2Hwa-0007te-4h
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:11:02 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10KI6GPC140495
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 13:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IXURaFwm626sLuPcCwETEZxKOptWQZXrZFH5d9lYqBk=;
 b=rgHfhh0aU97+RuCetRQRVfvhxJnMTUlAVW9Fnn4dgZ35AlmPKiYEFdOVsKNURCH2I/43
 cUw0o9I4Is74FrKZ7e+2KO9z58PjClXxCE4nhVQaPVEsZ5duFS1bp2JODY5GUAo/i69b
 3dA8+AK7dD+K5lRJmhsCRKJfAnTiimv9M1FncmrTG1SHUq34IoZxEFBeZ7XHSRtz+1oQ
 5hIpfD1us6HOQztUho0ATNWbL3T3xZFWsvoGTbgj+bSeewXdUXBE7Y5r2T4SsfFhMngg
 3kM9N4PbZ14km96aiiWyI9ScAl1NdYvJ0YAnSXfSxTVeAPWx1MX5nfUPb3jyJ1CTrUwc 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366rj91kg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 13:10:57 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10KI6qBX143622
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 13:10:57 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366rj91ke9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 13:10:57 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10KI76F6023335;
 Wed, 20 Jan 2021 18:10:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3668nwrwgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 18:10:54 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10KIAk0L36176288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 18:10:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38E1642047;
 Wed, 20 Jan 2021 18:10:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCE1442041;
 Wed, 20 Jan 2021 18:10:50 +0000 (GMT)
Received: from [9.65.219.40] (unknown [9.65.219.40])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jan 2021 18:10:50 +0000 (GMT)
Subject: Re: [PATCH] qmp-shell: Suppress banner and prompt when stdin is not a
 TTY
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210117072742.119377-1-dovmurik@linux.vnet.ibm.com>
 <f6b88346-9dac-2679-385c-17d4a0e245c4@redhat.com>
 <1d63a097-27d5-5b3a-2ce6-f6a2402e135e@linux.vnet.ibm.com>
 <20210120094539.GC3015589@redhat.com>
 <0d56a477-d4dd-ca59-9b16-90ea8c7a1c45@redhat.com>
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
Message-ID: <12f642e1-0a56-41bc-bae1-f7b3a90e0de8@linux.vnet.ibm.com>
Date: Wed, 20 Jan 2021 20:10:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0d56a477-d4dd-ca59-9b16-90ea8c7a1c45@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_10:2021-01-20,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200102
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 20/01/2021 17:46, John Snow wrote:
> On 1/20/21 4:45 AM, Daniel P. Berrangé wrote:
>> On Wed, Jan 20, 2021 at 10:25:25AM +0200, Dov Murik wrote:
>>> Hi John,
>>>
>>> On 19/01/2021 22:02, John Snow wrote:
>>>> On 1/17/21 2:27 AM, Dov Murik wrote:
>>>>> Detect whether qmp-shell's standard input is not a TTY; in such case,
>>>>> assume a non-interactive mode, which suppresses the welcome banner and
>>>>> the "(QEMU)" prompt.  This allows for easier consumption of 
>>>>> qmp-shell's
>>>>> output in scripts.
>>>>>
>>>>> Example usage before this change:
>>>>>
>>>>>       $ printf "query-status\nquery-kvm\n" | sudo
>>>>> scripts/qmp/qmp-shell qmp-unix-sock
>>>>>       Welcome to the QMP low-level shell!
>>>>>       Connected to QEMU 5.1.50
>>>>>
>>>>>       (QEMU) {"return": {"status": "running", "singlestep": false,
>>>>> "running": true}}
>>>>>       (QEMU) {"return": {"enabled": true, "present": true}}
>>>>>       (QEMU)
>>>>>
>>>>> Example usage after this change:
>>>>>
>>>>>       $ printf "query-status\nquery-kvm\n" | sudo
>>>>> scripts/qmp/qmp-shell qmp-unix-sock
>>>>>       {"return": {"status": "running", "singlestep": false,
>>>>> "running": true}}
>>>>>       {"return": {"enabled": true, "present": true}}
>>>>>
>>>>> Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
>>>>
>>>> Hiya! I've been taking lead on modernizing a lot of our python
>>>> infrastructure, including our QMP library and qmp-shell.
>>>>
>>>> (Sorry, not in MAINTAINERS yet; but I am in the process of moving these
>>>> scripts and tools over to ./python/qemu/qmp.)
>>>
>>> Thanks for this effort.
>>>
>>>>
>>>> This change makes me nervous, because qmp-shell is not traditionally a
>>>> component we've thought of as needing to preserve backwards-compatible
>>>> behavior. Using it as a script meant to be consumed in a headless
>>>> fashion runs a bit counter to that assumption.
>>>>
>>>> I'd be less nervous if the syntax of qmp-shell was something that was
>>>> well thought-out and rigorously tested, but it's a hodge-podge of
>>>> whatever people needed at the moment. I am *very* reluctant to cement
>>>> it.
>>>
>>> Yes, I understand your choice.
>>>
>>>
>>>>
>>>> Are you trying to leverage the qmp.py library from bash?
>>>
>>> Yes, I want to send a few QMP commands and record their output.  If I 
>>> use
>>> socat to the unix-socket I need to serialize the JSON request myself, so
>>> using qmp-shell saves me that; also not sure if there's any 
>>> negotiation done
>>> at the beginning by qmp-shell.
>>
>> There is a handshake, but it is just a single json message.
>>
>> See docs/interop/qmp-intro.txt and qmp-spec.txt for guidance.
>>
>>> Is there an easier way to script qmp commands, short of writing my own
>>> python program which uses the qmp.py library?
>>
>> Yes, writing your own python program is probably best. Doing anything
>> complex is shell is almost always a mistake, as it is a very crude
>> and poor language compared to something like managing QEMU/QMP.
>>
>> Note that I don't believe that we've declared qmp.py to be a long
>> term stable interface for users outside of QEMU either. An alternative
>> is to just use the python sockets APIs directly to speak to QEMU/QMP
>>
> 
> Right. qmp.py is technically not stable either, but it at least doesn't 
> use an invented syntax we don't have a spec for ... and it is used by 
> quite a few other things in the tree, so I trust it /slightly/ more. I 
> cannot promise compatibility for scripts that aren't in the tree at this 
> time, though.
> 
> (I am working on an asyncio variant of the QMP library that I do hope to 
> promise stability for, but that's probably not something you can hope to 
> see in the short term. It will likely have an API that is at least 
> somewhat similar to the existing library, but will use asyncio 
> coroutines instead of blocking calls.)
> 
> You can look at ./tests/qemu-iotests/ for some examples of using the QMP 
> library that we have today; grep for '.qmp(' to find examples.
> 
> The connection for these tests is established in python/qemu/machine.py, 
> look at the 'self._qmp_connection' field. This connection is exposed via 
> the qmp(...) method, which the tests use. The library handles the (very 
> small) handshake.

Thanks John and Daniel for these pointers.  If we ever add documentation 
for qmp-shell itself (man page or similar), maybe we should add a 
warning there (not to consume its output in scripts).



> 
> There are also bash tests in ./tests/qemu-iotests/ that handle some QMP 
> by themselves, and might be up your alley for very simple cases. Test 
> 060 sets up its own QMP connection and just echoes JSON into the pipe.

Constructing and echoing JSON in bash is ugly.  Look at the code for 
_filter_qmp in common.filter -- that looks fragile.  That's why I tried 
to script qmp-shell to begin with and started messing with its welcome 
banner.  Instead I should switch to Python (or anything with a proper 
JSON parse/unparse).

-Dov

