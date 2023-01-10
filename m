Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8B664481
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFG7z-0003Wu-WF; Tue, 10 Jan 2023 10:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFG7U-0003JO-OZ
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:01:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFG7S-00007w-4Q
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:00:56 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30AEeBTP007624
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 15:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=i6y9Z2Yqc5afugt3k/TRcTfBStA+GdJyJalOQFdI8To=;
 b=DBz68UdYH4V3uq08fIJNJudiU23exQcm8bcUf1CjFIgHCm5SbGHb+93s25p+b3gyNR8o
 t2bD/gmq7EWVMS7+dvXlUIJC8OJsWiZ+bJf8t8ItZKH1/Xx5GxHkAlQCEPzwlyudQye6
 8+iDL9ZoF5WwAYkpW4Wb7mWokSKop7WbjthKfI2xFqzOc5Zw257Jwh9FvIUUdUQj/3JT
 LrKGxPRvWssf0+27kb6yLG1w5IjQ2VRh22R5GXpVLDuQ2eM/mjwSxIANPhzxvKXrlxAF
 Dqq3OwXmDvxBlr3LJMacRMxiyChoK83V6Xte1iJxAANzV+ptxsTFP43j4PJLjjU5Q8ZI NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1a020gmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 15:00:44 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30AEeTM2008509
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 15:00:43 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1a020gmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 15:00:43 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30ACnWLO017992;
 Tue, 10 Jan 2023 15:00:43 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3my0c7t9sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 15:00:43 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30AF0gQm39322088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 15:00:42 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A88758069;
 Tue, 10 Jan 2023 15:00:42 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C5D55805D;
 Tue, 10 Jan 2023 15:00:41 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 10 Jan 2023 15:00:41 +0000 (GMT)
Message-ID: <cf9b083b-94fc-3b39-7b28-32d6b7eb8d0b@linux.ibm.com>
Date: Tue, 10 Jan 2023 10:00:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Content-Language: en-US
To: jejb@linux.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com> <Y7xH1i0Uvbo0FUwG@work-vm>
 <5c07f6ab6adfe53f7e7fbeeda67f2eb62afccdfa.camel@linux.ibm.com>
 <Y7xUVq9PT9ohGfCj@work-vm>
 <af22847d6e8f3a64720c4d4d00b93f57ea63ad3e.camel@linux.ibm.com>
 <f2e036a7-5cff-4f95-902f-b31fce3c0ade@linux.ibm.com>
 <f928986fd4095b1f27c83ede96f3b0dd65ad965e.camel@linux.ibm.com>
 <a7472cd7-97b2-a063-0065-a78e49d0509a@linux.ibm.com>
 <c15c7dd1-0ac2-a00c-0895-2ea41eb7414d@linux.ibm.com>
 <8a62ef36fe784fe8ef71bcd795d2bba169502ef7.camel@linux.ibm.com>
 <f9d38975-d3b1-fc66-b587-167be426d47e@linux.ibm.com>
 <7fb9b26957f5a544bb6e1cc03d7f40ca1b3ee7b6.camel@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <7fb9b26957f5a544bb6e1cc03d7f40ca1b3ee7b6.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EROMpxOyG1MQ79Rv2HxePRQ7MhjcgOxQ
X-Proofpoint-ORIG-GUID: bFZ9T2wkAseV7hcHAzy6LK5kJGYuZEW3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_06,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301100090
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
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



On 1/10/23 09:55, James Bottomley wrote:
> On Tue, 2023-01-10 at 09:47 -0500, Stefan Berger wrote:
>> On 1/10/23 09:14, James Bottomley wrote:
>>> On Mon, 2023-01-09 at 16:06 -0500, Stefan Berger wrote:
>>>> On 1/9/23 14:01, Stefan Berger wrote:
>>> [...]
>>>> If you use TPM 2 for attestation then certain TPM 2 state
>>>> migration scenarios may become problematic. One could construct a
>>>> scenario where attestation preceeds some action that requires
>>>> trust to have been established in the system in the preceeding
>>>> attestation step and support for snapshotting the state of the
>>>> TPM 2 could become an issue if I was to wait for the attestation
>>>> to have been concluded and then I quickly restart a different
>>>> snapshot that is not trustworthy and the client proceeds thinking
>>>> that the system is trustworthy (maybe a few SYNs from the client
>>>> went into the void)
>>>
>>> You're over thinking this.  For a non-confidential VM, Migration
>>> gives you a saved image you can always replay from (this is seen as
>>> a feature for fast starts) and if you use the tpm_simulator the TPM
>>> state is stored in the migration image, so you can always roll it
>>> back if you
>>
>> 'How' is it stored in the migration image? Does tpm_simulator marshal
>> and unmarshal the state so that it is carried inside the save image?
>> For the tpm_emulator backend this particular code is here:
>> -
>> https://github.com/qemu/qemu/blob/master/backends/tpm/tpm_emulator.c#L758
>> -
>> https://github.com/qemu/qemu/blob/master/backends/tpm/tpm_emulator.c#L792
> 
> We seem to be going around in circles: your TPM simulator stores the
> TPM state in the migration image, mine keeps it in the external TPM.
> The above paragraph is referring to your simulator.

My simulator is typically called 'swtpm'.


> 
>>> have access to the migration file.  Saving the image state is also
>>> a huge problem because the TPM seeds are in the clear if the
>>> migration image isn't encrypted.  The other big problem is that an
>>> external
>>
>> True. DAC protection of the file versus protection via encryption.
>> Neither really helps against malicious root.
>>
>>> software TPM is always going to give up its state to the service
>>> provider, regardless of migration, so you have to have some trust
>>> in the provider and thus you'd also have to trust them with the
>>> migration replay policy.  For Confidential VMs, this is a bit
>>> different because the vTPM runs in a secure ring inside the
>>> confidential enclave and the secure migration agent ensures that
>>> either migration and startup happen or migration doesn't happen at
>>> all, so for them you don't have to worry about rollback.
>>
>> what is the enclave here? Is it an SGX enclave or is it running
>> somewhere inside the address space of the VM?
> 
> The only current one we're playing with is the SEV-SNP SVSM vTPM which
> runs the TPM in VMPL0.

And how is this related to this PR?

> 
>>>
>>> Provided you can trust the vTPM provider, having external state not
>>> stored in the migration image has the potential actually to solve
>>> the rollback problem because you could keep the TPM clock running
>>> and potentially increase the reset count, so migrations would show
>>> up in TPM quotes and you don't have control of the state of the
>>> vTPM to replay it.
>>
>> I just don't see how you do that and prevent scenarios where VM A is
>> suspended and then the tpm_simulator just sits there with
>> the state and one resumes VM B with the state.
> 
> You can't with your TPM simulator because it stores state in the image.
> If the state is external (not stored in the image) then rolling back
> the image doesn't roll back the TPM state.

And resuming VM B with the TPM state of suspend VM A is considered 'good'?

    Stefan

> 
> James
> 

