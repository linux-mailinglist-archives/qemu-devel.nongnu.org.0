Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842E366451F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:44:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFul-0006Nt-43; Tue, 10 Jan 2023 09:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFFug-0006EJ-09
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:47:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFFuc-0004FJ-QS
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:47:41 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30AEH9hY032859
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aaX8K4aaScgOU9dqr3NkcqLKc64htKKZ2agRxpAkCHM=;
 b=Fl2HuZQXYhVkg1an9LO8Pk1Ep5YJvfz68ObmLbiFeS4UzCe5mT0QO02/+sK2k9FvN8Pu
 y6UtxjgBx6WUAitpYk0gG3PHjWC4pv3dE6r9ts10Ve6I+2ywd97agc8CJSegyZBCyE0E
 aDcO8wlBXb6B1ex9vrJz3CHscSIUbS+s5I+guURpv1jhd00UMW42FXxS20fB3agAjda+
 VjJ4jUQXxE8pA/TZ8amnbeNxxbpBxk0CUbPfdaxzWuWBjGp3Rc98q1MT+n7Cevify3LT
 lnr0jixfgFFQs9FZBx4EuBmPPpInf2I1Aeh3ukJk+Vcajw3bV1wmNPE3suUCkMH3vhIN bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n19n2rwsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:47:37 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30AEHCYI032941
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:47:37 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n19n2rwrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 14:47:36 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30ACK7Hg007029;
 Tue, 10 Jan 2023 14:47:36 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3my0c7prab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 14:47:36 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30AElYi743844092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 14:47:35 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1A4F58059;
 Tue, 10 Jan 2023 14:47:34 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F65E58065;
 Tue, 10 Jan 2023 14:47:34 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 10 Jan 2023 14:47:34 +0000 (GMT)
Message-ID: <f9d38975-d3b1-fc66-b587-167be426d47e@linux.ibm.com>
Date: Tue, 10 Jan 2023 09:47:33 -0500
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
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <8a62ef36fe784fe8ef71bcd795d2bba169502ef7.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h5v4c1LltCcYiSsoUk1u5oBzOxf0jdG9
X-Proofpoint-GUID: _umgfA-KfF440C8zhY-51eqwlywmi-pT
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_04,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100088
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



On 1/10/23 09:14, James Bottomley wrote:
> On Mon, 2023-01-09 at 16:06 -0500, Stefan Berger wrote:
>> On 1/9/23 14:01, Stefan Berger wrote:
> [...]
>> If you use TPM 2 for attestation then certain TPM 2 state migration
>> scenarios may become problematic. One could construct a scenario
>> where attestation preceeds some action that requires trust to have
>> been established in the system in the preceeding attestation step and
>> support for snapshotting the state of the TPM 2 could become an issue
>> if I was to wait for the attestation to have been concluded and then
>> I quickly restart a different snapshot that is not trustworthy and
>> the client proceeds thinking that the system is trustworthy (maybe a
>> few SYNs from the client went into the void)
> 
> You're over thinking this.  For a non-confidential VM, Migration gives
> you a saved image you can always replay from (this is seen as a feature
> for fast starts) and if you use the tpm_simulator the TPM state is
> stored in the migration image, so you can always roll it back if you

'How' is it stored in the migration image? Does tpm_simulator marshal and unmarshal the state so
that it is carried inside the save image? For the tpm_emulator backend this particular code is
here:
- https://github.com/qemu/qemu/blob/master/backends/tpm/tpm_emulator.c#L758
- https://github.com/qemu/qemu/blob/master/backends/tpm/tpm_emulator.c#L792

> have access to the migration file.  Saving the image state is also a
> huge problem because the TPM seeds are in the clear if the migration
> image isn't encrypted.  The other big problem is that an external

True. DAC protection of the file versus protection via encryption. Neither really helps against malicious root.

> software TPM is always going to give up its state to the service
> provider, regardless of migration, so you have to have some trust in
> the provider and thus you'd also have to trust them with the migration
> replay policy.  For Confidential VMs, this is a bit different because
> the vTPM runs in a secure ring inside the confidential enclave and the
> secure migration agent ensures that either migration and startup happen
> or migration doesn't happen at all, so for them you don't have to worry
> about rollback.

what is the enclave here? Is it an SGX enclave or is it running somewhere inside the address space of the VM?

> 
> Provided you can trust the vTPM provider, having external state not
> stored in the migration image has the potential actually to solve the
> rollback problem because you could keep the TPM clock running and
> potentially increase the reset count, so migrations would show up in
> TPM quotes and you don't have control of the state of the vTPM to
> replay it.

I just don't see how you do that and prevent scenarios where VM A is suspended and then the tpm_simulator just sits there with
the state and one resumes VM B with the state.

   Stefan

> 
> James
> 

