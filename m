Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B63543DD0E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 10:43:54 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg10r-0006gs-5T
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 04:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mg0z3-0005wn-Lr
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:42:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mg0yn-0003gg-V1
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:42:01 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S7keF4017079; 
 Thu, 28 Oct 2021 08:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+3gJO6QYkCfYIpkFHI+Iaj+PK8SWReKUYd8HopUIZhQ=;
 b=OxJlE+PuX8CvyuB1yJMiu5sB8KsL9UC2Xvm4E1/6F7TveXPxgDDVss0/LX2xC8P+S+9k
 7w7qr0kpNJ3TNeCBLpg8GVZXBjJGvPdUQd4FO6/b45nbY1HZEwAePRp6YE3xpGnxq/+Z
 VNQlYhtNUdLn0IKELry/Qkmv5b977eMU2xafoGehNApi4u49awuws6pw/sFDixk+rRyW
 fr7oKgKw14v2Ks9LDIf5EgjU5AYaJHX3nYTYee4PigCAQXSpu3PRl8k4d4WgytBwXhVP
 f+W706/Bi2rnOxYktDfU1dX539aK8l9k+oqwWbvpk9Oi/fzvW+zlg+gavjfRxZcEskDZ 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3byqs794ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 08:41:40 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19S8AV1D019293;
 Thu, 28 Oct 2021 08:41:40 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3byqs794dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 08:41:40 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19S8XXAt023313;
 Thu, 28 Oct 2021 08:41:39 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3bx4f8r7ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 08:41:39 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19S8faeM29163876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 08:41:36 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A78DBE063;
 Thu, 28 Oct 2021 08:41:36 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AA9BBE062;
 Thu, 28 Oct 2021 08:41:31 +0000 (GMT)
Received: from [9.65.231.191] (unknown [9.65.231.191])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Oct 2021 08:41:31 +0000 (GMT)
Message-ID: <8a68184e-5653-a7b6-5173-a685322e9491@linux.ibm.com>
Date: Thu, 28 Oct 2021 11:41:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v4 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
Content-Language: en-US
To: Brijesh Singh <brijesh.singh@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
References: <20210930054915.13252-1-dovmurik@linux.ibm.com>
 <20210930054915.13252-2-dovmurik@linux.ibm.com>
 <3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com>
 <9474f5d8-68c5-606b-a123-419556afe5d4@linux.ibm.com>
 <c94afa49-fdfc-0f33-a4d8-2a9c30dd7812@amd.com>
 <001dd81a-282d-c307-a657-e228480d4af3@amd.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <001dd81a-282d-c307-a657-e228480d4af3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DgGvQ5X0-kACoFUPu6ZcAKoMCPDvJBZS
X-Proofpoint-GUID: pLbMK8ZqUXmrrXIU4TWHlnTgK8HNoOKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280044
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.847, SPF_HELO_NONE=0.001,
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
Cc: Dov Murik <dovmurik@linux.ibm.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 27/10/2021 22:43, Brijesh Singh wrote:
> Hi Dov,
> 
> Sorry for coming a bit late on it but I am seeing another issue with
> this patch. The hash build logic looks for a SEV_HASH_TABLE_RV_GUID in
> the GUID list. If found, it uses the base address to store the hash'es.
> Looking at the OVMF, it seems that base address for this GUID is zero.

Yes, I managed to reproduce this.  With the OvmfPkgX64 build I see that
the GUID exists but base=0 and size=0.  That size should be illegal
anyway for QEMU to fill.


> It seems that by default the Base Address is non-zero for the AmdSev
> Package build only.
> 
> Can we add a check in the sev_add_kernel_loader_hashes() to verify that
> base address is non-zero and at the same time improve OVMF to update
> *.fdf to reserve this page in the MEMFD ?

I'll prepare QEMU fixes:

1. (reported by Tom) when no SEV_HASH_TABLE_RV_GUID entry is found -
just warn and continue boot.
2. (reported by Brijesh) verify that base != 0 (supposedly GPA 0 is a
valid address, but I'm willing to take a chance here and not allow it)
and size is big enough for the hashes table structure+padding. If not,
warn and continue boot.

Separately I'll try to solve the issue in the other OVMF *.fdf's.



Thanks for reporting this.

-Dov


> 
> Thanks
> Brijesh
> 
> On 10/20/21 10:26 AM, Tom Lendacky wrote:
>> On 10/19/21 1:18 AM, Dov Murik wrote:
>>> On 18/10/2021 21:02, Tom Lendacky wrote:
>>>> On 9/30/21 12:49 AM, Dov Murik wrote:
>>>>
>>>> ...
>>>>
>>>>> +/*
>>>>> + * Add the hashes of the linux kernel/initrd/cmdline to an encrypted
>>>>> guest page
>>>>> + * which is included in SEV's initial memory measurement.
>>>>> + */
>>>>> +bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error
>>>>> **errp)
>>>>> +{
>>>>> +    uint8_t *data;
>>>>> +    SevHashTableDescriptor *area;
>>>>> +    SevHashTable *ht;
>>>>> +    uint8_t cmdline_hash[HASH_SIZE];
>>>>> +    uint8_t initrd_hash[HASH_SIZE];
>>>>> +    uint8_t kernel_hash[HASH_SIZE];
>>>>> +    uint8_t *hashp;
>>>>> +    size_t hash_len = HASH_SIZE;
>>>>> +    int aligned_len;
>>>>> +
>>>>> +    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data,
>>>>> NULL)) {
>>>>> +        error_setg(errp, "SEV: kernel specified but OVMF has no hash
>>>>> table guid");
>>>>> +        return false;
>>>>> +    }
>>>>
>>>> This breaks backwards compatibility with an older OVMF image. Any older
>>>> OVMF image with SEV support that doesn't have the hash table GUID will
>>>> now fail to boot using -kernel/-initrd/-append, where it used to be
>>>> able
>>>> to boot before.
>>>>
>>>
>>>
>>> Thanks Tom for noticing this.
>>>
>>> Just so we're on the same page: this patch is already merged.
>>
>> Right, just not in a release, yet.
>>
>>>
>>>
>>> We're dealing with a scenario of launching a guest with SEV enabled and
>>> with -kernel.  The behaviours are:
>>>
>>>
>>> A. With current QEMU:
>>>
>>> A1. New AmdSev OVMF build: OVMF will verify the hashes and boot
>>> correctly.
>>> A2. New Generic OvmfPkgX64 build: No verification but will boot
>>> correctly.
>>>
>>> A3. Old AmdSev OVMF build: QEMU aborts the launch because there's no
>>> hash table GUID.
>>> A4. Old Generic OvmfPkgX64 build: QEMU aborts the launch because there's
>>> no hash table GUID.
>>>
>>>
>>> B. With older QEMU (before this patch was merged):
>>>
>>> B1. New AmdSev OVMF build: OVMF will try to verify the hashes but they
>>> are not populated; boot aborted.
>>> B2. New Generic OvmfPkgX64 build: No verification but will boot
>>> correctly.
>>>
>>> B3. Old AmdSev OVMF build: OVMF aborts the launch because -kernel is not
>>> supported at all.
>>> B4. Old Generic OvmfPkgX64 build: No verification but will boot
>>> correctly.
>>>
>>>
>>> So the problem you are raising is scenario A4 (as opposed to previous
>>> behaviour B4).
>>
>> Correct, scenario A4.
>>
>>>
>>>
>>>
>>>> Is that anything we need to be concerned about?
>>>>
>>>
>>> Possible solutions:
>>>
>>> 1. Do nothing. For users that encounter this: tell them to upgrade OVMF.
>>> 2. Modify the code: remove the line: error_setg(errp, "SEV: kernel
>>> specified but OVMF has no hash table guid")
>>>
>>> I think that option 2 will not degrade security *if* the Guest Owner
>>> verifies the measurement (which is mandatory anyway; otherwise the
>>> untrusted host can replace OVMF with a "malicious" version that doesn't
>>> verify the hashes). Skipping silently might make debugging a bit harder.
>>> Maybe we can print a warning and return, and then the guest launch will
>>> continue?
>>
>> That sounds like it might be the best approach if there are no
>> security concerns. I agree with printing a message, either
>> informational or warning is ok by me.
>>
>> Lets see if anyone else has some thoughts/ideas.
>>
>> Thanks,
>> Tom
>>
>>>
>>> Other ideas?
>>>
>>>
>>> -Dov
>>>

