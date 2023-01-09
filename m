Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C537663241
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 22:08:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEzMO-0006yb-VK; Mon, 09 Jan 2023 16:07:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pEzMH-0006yK-8s
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 16:07:05 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pEzMC-0007lx-Dz
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 16:07:03 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309JI3og031005
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 21:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mVLn6aB+pEOXoLM6FNz4u97dKC7MuwesFBsSUBkm9y8=;
 b=JEqZ2WNMGPDchkoVzlZ2nvo+cYNfEAiahN98A49StqcQ6Hpb209nygQhI1/cKWpYqQ8p
 Ml5rw5Zj7JGlKozHkoi55ez1E78PkonrsDsE/QZhWc7u0I2T1LFkb3ae9LkDNe2qO267
 iwcTRhnM3iFochkieCq6U2bKEAuFTnqfBUOh6VIV5icwPrxPvzulprVvRyzzLTb6AHWo
 nHtNAsfh/fvu2WyKfIyWYkd0KjdgpUr0gVh8IsSmfKj0wNoaJJr87+YtcGg60WNi2J+6
 xEp58Qf26/KdnpQTQHB8+w0mifZjLmoICHIlsu4YVYDcKbGQf8lBCp2amPj+/ypgjxry aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n0rya2c4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 21:06:35 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309Ktrf5004115
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 21:06:35 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n0rya2c43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 21:06:35 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309Iv6NB029230;
 Mon, 9 Jan 2023 21:06:34 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3my0c7hevx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 21:06:34 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309L6XLa1114762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 21:06:33 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51F4758056;
 Mon,  9 Jan 2023 21:06:33 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 049C85806F;
 Mon,  9 Jan 2023 21:06:33 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 21:06:32 +0000 (GMT)
Message-ID: <c15c7dd1-0ac2-a00c-0895-2ea41eb7414d@linux.ibm.com>
Date: Mon, 9 Jan 2023 16:06:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
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
In-Reply-To: <a7472cd7-97b2-a063-0065-a78e49d0509a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MD6JALKSvC2XyfNP1238pvWvFChuBGQp
X-Proofpoint-GUID: 3aO1oEdnGP5L0RlHtzS13K17gMpkDN4B
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_14,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090147
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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



On 1/9/23 14:01, Stefan Berger wrote:
> 
> 
> On 1/9/23 13:51, James Bottomley wrote:
>> On Mon, 2023-01-09 at 13:34 -0500, Stefan Berger wrote:
>>> 
>>> 
>>> On 1/9/23 12:55, James Bottomley wrote:
>>>> On Mon, 2023-01-09 at 17:52 +0000, Dr. David Alan Gilbert 
>>>> wrote:
>>>>> * James Bottomley (jejb@linux.ibm.com) wrote:
>>>> [...]
>>>>>> external MSSIM TPM emulator has to be kept running to 
>>>>>> preserve the state.  If you restart it, the migration will 
>>>>>> fail.
>>>>> 
>>>>> Document that and we're getting there.
>>>> 
>>>> 
>>>> The documentation in the current patch series says
>>>> 
>>>> ---- The mssim backend supports snapshotting and migration,
>>>> but the state of the Microsoft Simulator server must be
>>>> preserved (or the server kept running) outside of QEMU for
>>>> restore to be successful. ----
>>>> 
>>>> What, beyond this would you want to see?
>>> 
>>> mssim today lacks the functionality of marshalling and 
>>> unmarshalling the permanent and volatile state of the TPM 2, 
>>> which are both needed for snapshot support. How does this work 
>>> with mssim?
>> 
>> You preserve the state by keeping the simulator running as the 
>> above says.  As long as you can preserve the state, there's no 
>> maximum time between snapshots.  There's no need of 
>> marshal/unmarshal if you do this
> 
> From 
> https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg03146.html
> 
> "VM snapshotting is basically VM suspend / resume on steroids 
> requiring permanent and volatile state to be saved and restoreable 
> from possible very different points in time with possibly different 
> seeds, NVRAM locations etc. How the mssim protocol does this is 
> non-obvious to me and how one coordinates the restoring and saving
> of the TPM's state without direct coordination by QEMU is also 
> non-obvious."

One thing, though: I am aware of the issues that may arise due to
support for TPM state migration. However, whether TPM state migration becomes an issue
depends on how you use the TPM 2.

If the use case is to use the TPM 2 as a local crypto device then state migration
is  likely not an issue. You may have different keys in the TPM 2 at
different points in time and even snapshotting may not be an issue but possibly
quite a welcome feature to have along with support of scenarios of VM suspend + host
upgrade + host reboot + VM resume.

If you use TPM 2 for attestation then certain TPM 2 state migration scenarios
may become problematic. One could construct a scenario where attestation preceeds
some action that requires trust to have been established in the system in the
preceeding attestation step and support for snapshotting the state of the TPM 2
could become an issue if I was to wait for the attestation to have been concluded
and then I quickly restart a different snapshot that is not trustworthy and the client
proceeds thinking that the system is trustworthy (maybe a few SYNs from the client
went into the void)

Eliminating TPM 2 state migration is probably not a good idea, because  environments
where attestation may occur may also support VM suspend/resume along  with upgrading
a host and rebooting the host or VM migration for some sort of host evacuation
before upgrade.


When it comes to snapshotting and using the TPM 2 as a crypto device just saying that
VM snapshot is supported by leaving the TPM 2 running and not touching it doesn't make
this function correctly for all scenarios where the TPM 2 may have had different keys
loaded. It is even a worse idea for attestation where I could construct a snapshot A
and wait until the attestation has passed and then resume with a snapshot A' that runs
untrustworty software but uses the state of the TPM 2 from snapshot A times and remains
happy to quote the state of the PCRs from before. If launching a snapshot also restores
the state of the PCRs that goes along with the state of the system at that time then
that at least allows for quotes to have valid contents of PCRs that reflects the
system state at snapshot A'.

Kexec also comes to mind in this context where I could quickly start a new system
post attestation. So physical system could possibly be used for fooling clients as well.

A solution for how to resolve this may involve some sort of protocol and a  connection
that may not be broken *while* the system needs to be in a trusted state. The protocol
would have to help detection of substantial changes of state such as resume of some
snapshot or kexec into a system. Repeated attestation (with correctly restored TPM 2 state)
  may also help resolve the issue.

Cheers!
   Stefan




> 
> 
> Stefan .
>> 
>> James
>>

> 

