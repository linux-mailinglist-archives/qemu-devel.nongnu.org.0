Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B10C446037
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 08:43:02 +0100 (CET)
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mitsL-0007Sv-7m
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 03:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mitrD-0006lu-CK
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 03:41:51 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52608
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mitrB-0007Db-8v
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 03:41:51 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A54tvS1003137; 
 Fri, 5 Nov 2021 07:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tAlJnD3fn2Z3X6yRIs8MjqYu/OgPcSsk6o46Op5oP3s=;
 b=p4qQU6Jls9iv/+37n4rfzo80RShouxctkD2Fb025PZgY7xvIIf2iq+w+zECuplJwIrlz
 lP1ZjyyfYGiyvT3N7+rUlGzJIdplYqkOe6vD/K29mdKCRsZTRLKPJnhrKun642yJOfyo
 97RvR99Zv2OoAqK9/qJMQplT8DgU2QfyoxFkUZqbedFsMjZdxjPAAlKT06l0OIUdoQyJ
 Gzp0/+GohBQ7Ht89EMwtPU3GzKAdCwsPmMEOmaKlRWaworZoV+AXKwJSGAr++g1COUEr
 ClI8beqH/IOCcrnowiB8hRCTjPatihDDcAKMYnP2sObLvCdKE57q0SncP9aAeBygCss9 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c4t5uehh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 07:41:46 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A57fIqd004417;
 Fri, 5 Nov 2021 07:41:46 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c4t5uehgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 07:41:46 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A57YC2c001319;
 Fri, 5 Nov 2021 07:41:44 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3c4t3x6fr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 07:41:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A57fhxB29032742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Nov 2021 07:41:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64742AE062;
 Fri,  5 Nov 2021 07:41:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B14BAE05C;
 Fri,  5 Nov 2021 07:41:40 +0000 (GMT)
Received: from [9.65.75.52] (unknown [9.65.75.52])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  5 Nov 2021 07:41:40 +0000 (GMT)
Message-ID: <5bf7ec04-5a82-9e38-657a-46312d855045@linux.ibm.com>
Date: Fri, 5 Nov 2021 09:41:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] sev/i386: Allow launching with -kernel if no OVMF
 hashes table found
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-2-dovmurik@linux.ibm.com>
 <YYKynfyEpwn3PRHW@redhat.com> <YYQj4hIiYckbRrZ/@work-vm>
 <YYQk4rI0sKpxCu78@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YYQk4rI0sKpxCu78@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GpVR5Mx-5tpJG1n7JnB9wo2OPftB0c7P
X-Proofpoint-ORIG-GUID: KiZnQTmnLiVu7NWTdCXZVVmNW5khHq74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-05_01,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111050041
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04/11/2021 20:22, Daniel P. Berrangé wrote:
> On Thu, Nov 04, 2021 at 06:18:10PM +0000, Dr. David Alan Gilbert wrote:
>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>> On Mon, Nov 01, 2021 at 10:21:34AM +0000, Dov Murik wrote:
>>>> Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
>>>> for measured linux boot", 2021-09-30) introduced measured direct boot
>>>> with -kernel, using an OVMF-designated hashes table which QEMU fills.
>>>>
>>>> However, if OVMF doesn't designate such an area, QEMU would completely
>>>> abort the VM launch.  This breaks launching with -kernel using older
>>>> OVMF images which don't publish the SEV_HASH_TABLE_RV_GUID.
>>>>
>>>> Instead, just warn the user that -kernel was supplied by OVMF doesn't
>>>> specify the GUID for the hashes table.  The following warning will be
>>>> displayed during VM launch:
>>>>
>>>>     qemu-system-x86_64: warning: SEV: kernel specified but OVMF has no hash table guid
>>>>
>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
>>>> ---
>>>>  target/i386/sev.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/i386/sev.c b/target/i386/sev.c
>>>> index eede07f11d..682b8ccf6c 100644
>>>> --- a/target/i386/sev.c
>>>> +++ b/target/i386/sev.c
>>>> @@ -1204,7 +1204,7 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
>>>>      int aligned_len;
>>>>  
>>>>      if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>>>> -        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
>>>> +        warn_report("SEV: kernel specified but OVMF has no hash table guid");
>>>>          return false;
>>>
>>> I'm pretty wary of doing this kind of thing.
>>>
>>> If someone is using QEMU and they required to have the hashes populated
>>> for their use case, they now don't get a fatal error if something goes
>>> wrong with the process. This is bad as it hides a serious mistake.
>>>
>>> If someone is using QEMU and they don't require to have the hashes
>>> populated and they knowingly use a firmware that doesn't support
>>> this, they'll now get a irrelevant warning every time they boot
>>> QEMU. This is bad because IME users will file bugs complaining
>>> about this bogus warning.
>>>
>>>
>>> If we genuinely need to support both uses cases, then we should have
>>> an explicit command line flag to request the desired behaviour.
>>>
>>> This could be a -machine option to indicate that the hashes must
>>> be populated.
>>>
>>>  - unset: try to populate hashes, *silently* ignore missing table
>>>           in ovmf
>>>  - set == on: try to populate hashes, report error on missing
>>>              table in ovmf
>>>   -set == off: never try to populate hashes, nor look for the
>>>                table in ovmf
>>
>> Or as a property on the sev-guest object.
> 
> Yep, I thought of that too, and I'm pretty undecided which is "best".
> 
> -machine makes sense as 'kernel' and 'initrd' are properties of
> the '-machine' and we're doing stuff related to the.
> 
> -object sev-guest makes sense as this is behaviour that's (currently)
> specific to SEV.

Thanks for the suggestions.

I'm going to go with '-object sev-guest,...,kernel_hashes=on' because
this whole function is defined in sev.c and only works with the AmdSev
OVMF target.

-Dov

