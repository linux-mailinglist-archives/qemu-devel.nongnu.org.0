Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B164E208
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 20:58:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5uMQ-0000mZ-Nf; Thu, 15 Dec 2022 14:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p5uMO-0000mL-2T
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 14:57:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1p5uML-0001cS-Nv
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 14:57:39 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BFJJi9A023448
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DwaAm6J1jAYZz7+du4qBHWdMwBT660oLvDJAFqLxV5I=;
 b=cp1nGZN9EuhF0ZGjfi0BsOtR8hP7f6q0VmhOKZ+5a1MI0jBv0HoCfTh7TaOtlNJX6gEI
 NNzBpAIxZZnBdQtDneV9HV7cVTdulfaJ95CIW8Blv5g1Yo7UYu3eQeHJFZvM2MytSgBv
 IPAHvcI4bZxifHO0rOcK4HoZmEqVVkyHkDcEsbjv9q89Y+ovOXEW6i9SqbC0bGHCd62f
 HTJ/4Sqfslr6ofAty9m+viu2I05a4rk0zBL8YnPwwcln6kAbc0eyz/ksdY04XVXlH/Rm
 K/r6YhsUYpryyXUmLMel8K/DwjbAheNp5AJH3+6gEwkaQVLGUd8rzyAJ5hF5atovyiUA +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg8n5tawe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:57:35 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BFJO5W2009635
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 19:57:34 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg8n5taw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 19:57:34 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFI4BuT019358;
 Thu, 15 Dec 2022 19:57:33 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3mf03agf4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Dec 2022 19:57:33 +0000
Received: from smtpav01.dal12v.mail.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BFJvWuX5046812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Dec 2022 19:57:32 GMT
Received: from smtpav01.dal12v.mail.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25C6C58062;
 Thu, 15 Dec 2022 19:57:32 +0000 (GMT)
Received: from smtpav01.dal12v.mail.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D34658057;
 Thu, 15 Dec 2022 19:57:31 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.dal12v.mail.com (Postfix) with ESMTP;
 Thu, 15 Dec 2022 19:57:31 +0000 (GMT)
Message-ID: <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
Date: Thu, 15 Dec 2022 14:57:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221215180125.24632-1-jejb@linux.ibm.com>
 <20221215180125.24632-3-jejb@linux.ibm.com>
 <b5cafbd3-d529-3a84-0604-c49aa30bf916@linux.ibm.com>
 <6fd1144d09777ddcdb7a1a1ba58cbbec345da9ef.camel@linux.ibm.com>
 <e77a3a76-c874-d279-52bf-18a4e3a36ba2@linux.ibm.com>
 <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <77bc5a11fcb7b06deba1c54b1ef2de28e0c53fb1.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B2T2NUDvdc_BoyofJnA5R0uyZSuaQ11f
X-Proofpoint-GUID: -zRNUu3ydGqDWg8PQAzO3JApKn08HEqj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_11,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212150164
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/15/22 14:40, James Bottomley wrote:
> On Thu, 2022-12-15 at 14:35 -0500, Stefan Berger wrote:
>>
>>
>> On 12/15/22 14:22, James Bottomley wrote:
>>> On Thu, 2022-12-15 at 13:46 -0500, Stefan Berger wrote:
>>>>
>>>>
>>>> On 12/15/22 13:01, James Bottomley wrote:
>>>>> From: James Bottomley <James.Bottomley@HansenPartnership.com>
>>>>>
>>>>> The Microsoft Simulator (mssim) is the reference emulation
>>>>> platform
>>>>> for the TCG TPM 2.0 specification.
>>>>>
>>>>> https://github.com/Microsoft/ms-tpm-20-ref.git
>>>>>
>>>>> It exports a fairly simple network socket baset protocol on two
>>>>> sockets, one for command (default 2321) and one for control
>>>>> (default
>>>>> 2322).  This patch adds a simple backend that can speak the
>>>>> mssim
>>>>> protocol over the network.  It also allows the host, and two
>>>>> ports
>>>>> to
>>>>> be specified on the qemu command line.  The benefits are
>>>>> twofold:
>>>>> firstly it gives us a backend that actually speaks a standard
>>>>> TPM
>>>>> emulation protocol instead of the linux specific TPM driver
>>>>> format
>>>>> of
>>>>> the current emulated TPM backend and secondly, using the
>>>>> microsoft
>>>>> protocol, the end point of the emulator can be anywhere on the
>>>>> network, facilitating the cloud use case where a central TPM
>>>>> service
>>>>> can be used over a control network.
>>>>>
>>>>> The implementation does basic control commands like power
>>>>> off/on,
>>>>> but
>>>>> doesn't implement cancellation or startup.  The former because
>>>>> cancellation is pretty much useless on a fast operating TPM
>>>>> emulator
>>>>> and the latter because this emulator is designed to be used
>>>>> with
>>>>> OVMF
>>>>> which itself does TPM startup and I wanted to validate that.
>>>>>
>>>>> To run this, simply download an emulator based on the MS
>>>>> specification
>>>>> (package ibmswtpm2 on openSUSE) and run it, then add these two
>>>>> lines
>>>>> to the qemu command and it will use the emulator.
>>>>>
>>>>>        -tpmdev mssim,id=tpm0 \
>>>>>        -device tpm-crb,tpmdev=tpm0 \
>>>>>
>>>>> to use a remote emulator replace the first line with
>>>>>
>>>>>        -tpmdev
>>>>> "{'type':'mssim','id':'tpm0','command':{'type':inet,'host':'rem
>>>>> ote'
>>>>> ,'port':'2321'}}"
>>>>>
>>>>> tpm-tis also works as the backend.
>>>>
>>>> Since this device does not properly support migration you have to
>>>> register a migration blocker.
>>>
>>> Actually it seems to support migration just fine.  Currently the
>>> PCR's
>>> get zero'd which is my fault for doing a TPM power off/on, but
>>> switching that based on state should be an easy fix.
>>
>> How do you handle virsh save  -> host reboot -> virsh restore?
> 
> I didn't.  I just pulled out the TPM power state changes and followed
> the guide here using the migrate "exec:gzip -c > STATEFILE.gz" recipe:
> 
> https://www.linux-kvm.org/page/Migration
> 
> and verified the TPM pcrs and the null name were unchanged.

> 
>> You should also add a description to docs/specs/tpm.rst.
> 
> Description of what?  It functions exactly like passthrough on

Please describe all the scenarios so that someone else can repeat them when trying out **your** device.

There are sections describing how things for swtpm and you should add how things work for the mssim TPM.

https://github.com/qemu/qemu/blob/master/docs/specs/tpm.rst#the-qemu-tpm-emulator-device
https://github.com/qemu/qemu/blob/master/docs/specs/tpm.rst#migration-with-the-tpm-emulator


> migration.  Since the TPM state is retained in the server a
> reconnection just brings everything back to where it was.

So it's remote. And the ports are always open and someone can just connect to the open ports and power cycle the device?

This may not be the most important scenario but nevertheless I wouldn't want to deal with bug reports if someone does 'VM snapshotting' -- how this is correctly handled would be of interest.

    Stefan

> 
> James
> 

