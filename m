Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4BA44D437
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 10:40:26 +0100 (CET)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6ZF-0005w5-I2
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 04:40:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ml6Xw-0004Y4-QB
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:39:04 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ml6Xt-0006Dh-A9
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 04:39:03 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB8gH3Y022140; 
 Thu, 11 Nov 2021 09:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Emb/8/vSlR3qg77k8mDRRsMBMzR0uxv0M71e3fLN+uI=;
 b=VWDaRzskBAX09hXtTRqBQpd002ux66mYKR0dl3QY82YC8T3T9S+6PhkuXLayaoWscnMo
 r2D5Ol3BwZCPDfinf62hB3avZ641rc8wAmNVBtAUrEQYiFER6wmjhupK29UCzHQTvSSU
 IdnYZJZ63SLCsxwPJozsu590uoWLPdo4xOwY5EvvCooIKuJcKGa8zrcQi89BacG2g9Mv
 FMNoG8Y+1pSVJHLFSLGTX09/lfY+HrQp67KivR8ZOgpQAeSFV529kSitDJjFyZgKcnyy
 8NM5voiY8JMq2SpDS0TJmKFWkw0pqHU4jsPtRp5LHPQESxa2WMsJ/DJx3SWuACur7Q6+ zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8wbp4wpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 09:38:49 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AB9SWPJ014061;
 Thu, 11 Nov 2021 09:38:49 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8wbp4wnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 09:38:49 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9Xed8025035;
 Thu, 11 Nov 2021 09:38:47 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3c5hbd870y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 09:38:47 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AB9ckrw45482466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 09:38:46 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 467BF7806D;
 Thu, 11 Nov 2021 09:38:46 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5063F7806A;
 Thu, 11 Nov 2021 09:38:42 +0000 (GMT)
Received: from [9.160.77.174] (unknown [9.160.77.174])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Nov 2021 09:38:41 +0000 (GMT)
Message-ID: <968f87c8-6c2f-1bec-9572-376b2806c7ef@linux.ibm.com>
Date: Thu, 11 Nov 2021 11:38:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/6] qapi/qom,target/i386: sev-guest: Introduce
 kernel-hashes=on|off option
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211108134840.2757206-1-dovmurik@linux.ibm.com>
 <20211108134840.2757206-2-dovmurik@linux.ibm.com>
 <87h7cmk5n5.fsf@dusky.pond.sub.org>
 <32a065bb-ec2e-f2e7-356b-68b41531aab1@linux.ibm.com>
 <YYzhqUkFqpgsDIyC@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YYzhqUkFqpgsDIyC@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SC5jJZKrsPaSmNWhej2Bt1E8924e2q35
X-Proofpoint-GUID: _faYYjPf3cAWunTdm3-tqiFf8Iqfk4rW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_02,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110056
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/11/2021 11:26, Daniel P. Berrangé wrote:
> On Mon, Nov 08, 2021 at 08:20:48PM +0200, Dov Murik wrote:
>>
>>
>> On 08/11/2021 17:51, Markus Armbruster wrote:
>>> Dov Murik <dovmurik@linux.ibm.com> writes:
>>>
>>>> Introduce new boolean 'kernel-hashes' option on the sev-guest object.
>>>> It will be used to to decide whether to add the hashes of
>>>> kernel/initrd/cmdline to SEV guest memory when booting with -kernel.
>>>> The default value is 'off'.
>>>>
>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>> ---
>>>>  qapi/qom.json     |  7 ++++++-
>>>>  target/i386/sev.c | 20 ++++++++++++++++++++
>>>>  qemu-options.hx   |  6 +++++-
>>>>  3 files changed, 31 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/qapi/qom.json b/qapi/qom.json
>>>> index ccd1167808..4fd5d1716b 100644
>>>> --- a/qapi/qom.json
>>>> +++ b/qapi/qom.json
>>>> @@ -769,6 +769,10 @@
>>>>  # @reduced-phys-bits: number of bits in physical addresses that become
>>>>  #                     unavailable when SEV is enabled
>>>>  #
>>>> +# @kernel-hashes: if true, add hashes of kernel/initrd/cmdline to a
>>>> +#                 designated guest firmware page for measured boot
>>>> +#                 with -kernel (default: false)
>>>
>>> Missing: (since 7.0)
>>>
>>
>> I agree the "since" clause is missing, but I think this series (at least
>> patches 1-4) should be considered a bug fix (because booting with
>> -kernel will break in 6.2 for older OVMF which doesn't have guest
>> firmware area for hashes).
>>
>> I think it should be added for 6.2.
>>
>> Paolo?
>>
>>
>> If agreed, the hunk should be:
> 
> Yes, the kernel hashes feature was introduced in this 6.2 dev
> cycle, and this patch is fixing a significant behavioural
> problem with it. We need this included in the 6.2 release
> 

Thanks for reviewing.

I'll shortly send a v3 with the minor doc/string changes suggested here
(patches 1 and 3).

-Dov

