Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558EB58FDDA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 15:56:56 +0200 (CEST)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM8gB-0002RR-FJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 09:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1oM8dq-0000y8-SP
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:54:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36312
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1oM8do-0001bz-Sw
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:54:30 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BDe5vc013354;
 Thu, 11 Aug 2022 13:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EP0mYcVX70PcME5IhbLDnDnKFXIKmk++3SgFR1HqLtw=;
 b=j2+zlNQlqwtSHLVkqIoQeAUq7FFGmjvfyOhHTlSPDpkJASXRKy0PHmLOyZVsSACnB/cT
 CH6T5zPL3+/KEMYC0nSf0W7rVbbaRkwDVD4jaWxBMSZbxjMZAsMU4IthyPaLnTdULQy8
 v0uw9Y1PQjpTY++5rfREPQgDVAH4SwsV1kVwBs9/qfKlm1gBBmyrx99LdLG82sZPO1B9
 etnfaPfy02Sml3YfgHlvxhcpNxJ7IFfnF8LU9DRdd0KgymvFTbDQiolaSkrhdDnmhsBP
 rmJNdWhUj/jSHpvYPbo2E9o58DmKgQl+c+LO4RGSqJZ+BQ4Q4u0M8zQiQSsAHSSqEAHI Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw2un0gmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 13:54:24 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BDe8Ou013542;
 Thu, 11 Aug 2022 13:54:23 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw2un0gkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 13:54:23 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BDoLTO025595;
 Thu, 11 Aug 2022 13:54:22 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3huww0stmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 13:54:21 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27BDpjLT33096162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 13:51:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADC5542045;
 Thu, 11 Aug 2022 13:54:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25CDD42041;
 Thu, 11 Aug 2022 13:54:18 +0000 (GMT)
Received: from [9.171.20.228] (unknown [9.171.20.228])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 13:54:18 +0000 (GMT)
Message-ID: <661b0850-41a8-184f-8abf-2f0c1dbdff34@de.ibm.com>
Date: Thu, 11 Aug 2022 15:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, frankja@linux.ibm.com,
 fiuczy@linux.ibm.com, pasic@linux.ibm.com, alex.bennee@linaro.org,
 armbru@redhat.com
References: <20220809064024.15259-1-imbrenda@linux.ibm.com>
 <YvT1wC0vi2juO5n3@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <YvT1wC0vi2juO5n3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c3NdDl2ZaonF8JS0TIhnayodGJPP1J0T
X-Proofpoint-GUID: s_a8XOzzIf2k7GoDvz7sKpIEmjYTxECE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_10,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1011 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110044
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
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



Am 11.08.22 um 14:27 schrieb Daniel P. Berrangé:
[...]
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -4743,6 +4743,23 @@ HXCOMM Internal use
>>   DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
>>   DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
>>   
>> +#ifdef __linux__
>> +DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
>> +    "-async-teardown enable asynchronous teardown\n",
>> +    QEMU_ARCH_ALL)
>> +#endif
>> +SRST
>> +``-async-teardown``
>> +    Enable asynchronous teardown. A new teardown process will be
>> +    created at startup, using clone. The teardown process will share
>> +    the address space of the main qemu process, and wait for the main
>> +    process to terminate. At that point, the teardown process will
>> +    also exit. This allows qemu to terminate quickly if the guest was
>> +    huge, leaving the teardown of the address space to the teardown
>> +    process. Since the teardown process shares the same cgroups as the
>> +    main qemu process, accounting is performed correctly.
>> +ERST
>> +
>>   DEF("msg", HAS_ARG, QEMU_OPTION_msg,
>>       "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
>>       "                control error message format\n"
> 
> It occurrs to me that we've got a general goal of getting away from
> adding new top level command line arguments. Most of the time there's
> an obvious existing place to put them, but I'm really not sure
> where this particular  option would fit ?
> 
> it isn't tied to any aspect of the VM backend configuration nor
> hardware frontends.
> 
> The closest match is the lifecycle action option (-no-shutdown)
> which were merged into a -action arg, but even that's a bit of a
> stretch.
> 
> Markus/Paolo:  do you have suggestions ?

Also extending this to libvirt, would it make sense to add this to the event list
<on_poweroff>
<on_reboot>
<on_crash>
<on_lockfailure>

as
<on_teardown> with async/sync

This might give an indication where to put it in qemu.

