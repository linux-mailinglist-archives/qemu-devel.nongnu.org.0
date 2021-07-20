Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2771F3CF58A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 09:53:01 +0200 (CEST)
Received: from localhost ([::1]:37532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5kYl-0003vL-TZ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 03:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m5kXy-0003DE-R0; Tue, 20 Jul 2021 03:52:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m5kXx-0007ia-6r; Tue, 20 Jul 2021 03:52:10 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16K7jDGu137356; Tue, 20 Jul 2021 03:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AA4GPXe4Ob9oxQ3Nj31Fkl/2NupfEl6RQgWleqpTfAA=;
 b=fN6BOMkkb2R0OLVNn7gTDhAZWdU2XAoWjhO5STZdobz6OGNYqdGvUeO0mHR29UsicFXH
 VjY7KfWGuOviTeDQaPAahgCDcelfsVPZE7Ze1j7GBw/xKvnKuR78F1WT5CEQuX7eKN7J
 NBb0uMOHUfQ2hgbAJhWk8DPHobp+IoYtnXxRGOLWt71Z9yhHpRcKMlPXujUT86QRFrzz
 vg4jVluox+QlFwlaaTz+4NYI1cQpnCkQ4uYSX+zfnaMxHReK3mZ2rjneAWuSHTtM0T+R
 NSnlPPyfc/EuoXrSCqgHO7wHAYxb97JeBi1objNr47kRyBoO1fvwR2B7ySvIY44z4vAI ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wtce84v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 03:52:07 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16K7kQpp140909;
 Tue, 20 Jul 2021 03:52:06 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wtce84um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 03:52:06 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16K7nEeh020647;
 Tue, 20 Jul 2021 07:52:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 39upu8951q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 07:52:04 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16K7q17A27197700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 07:52:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C16B0A404D;
 Tue, 20 Jul 2021 07:52:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32290A4055;
 Tue, 20 Jul 2021 07:52:01 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.7.187])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 07:52:01 +0000 (GMT)
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
To: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
 <87y2a8cda7.fsf@dusky.pond.sub.org>
 <0801e122-0e9c-e266-42e8-d5cddb16c237@linux.ibm.com>
 <87bl73df9y.fsf@dusky.pond.sub.org> <87y2a6bp5f.fsf@redhat.com>
 <YPFO/NPdyHjf1Cyu@redhat.com> <87pmvibkri.fsf@redhat.com>
 <YPFkJUgbE9ku0tI7@redhat.com> <87czre9uar.fsf@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <ecb2932e-7595-c4a4-5480-9c77ecf3e34d@linux.ibm.com>
Date: Tue, 20 Jul 2021 09:52:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87czre9uar.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DVIC0OyKuUhkg9moL32Ac6Z_EcbQMrKZ
X-Proofpoint-GUID: gzds-s2kB8CjPDErAapIlG-qyH4PeKJ5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_04:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/19/21 5:50 PM, Cornelia Huck wrote:
> On Fri, Jul 16 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
>> On Fri, Jul 16, 2021 at 12:44:49PM +0200, Cornelia Huck wrote:
>>> On Fri, Jul 16 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>>> On Fri, Jul 16, 2021 at 11:10:04AM +0200, Cornelia Huck wrote:
>>>>> On Thu, Jul 15 2021, Markus Armbruster <armbru@redhat.com> wrote:
>>>>>
>>>>>> Pierre Morel <pmorel@linux.ibm.com> writes:
>>>>>>
>>>>>>> On 7/15/21 8:16 AM, Markus Armbruster wrote:
>>>>>>>> Pierre Morel <pmorel@linux.ibm.com> writes:
>>>>>>>>
>>>>>>>>> Drawers and Books are levels 4 and 3 of the S390 CPU
>>>>>>>>> topology.
>>>>>>>>> We allow the user to define these levels and we will
>>>>>>>>> store the values inside the S390CcwMachineState.
>>>>>>>>
>>>>>>>> Double-checking: are these members specific to S390?
>>>>>>>
>>>>>>> Yes AFAIK
>>>>>>
>>>>>> Makes me wonder whether they should be conditional on TARGET_S390X.
>>>>>>
>>>>>> What happens when you specify them for another target?  Silently
>>>>>> ignored, or error?
>>>>>
>>>>> I'm wondering whether we should include them in the base machine state
>>>>> and treat them as we treat 'dies' (i.e. the standard parser errors out
>>>>> if they are set, and only the s390x parser supports them.)
>>>>
>>>> To repeat what i just wrote in my reply to patch 1, I think we ought to
>>>> think  about a different approach to handling the usage constraints,
>>>> which doesn't require full re-implementation of the smp_parse method
>>>> each time.  There should be a way for each target to report topology
>>>> constraints, such the the single smp_parse method can do the right
>>>> thing, especially wrt error reporting for unsupported values.
>>>
>>> That would mean that all possible fields would need to go into common
>>> code, right?
>>
>> Yes, that is an implication of what i'm suggesting.
>>
>>> I'm wondering whether there are more architecture/cpu specific values
>>> lurking in the corner, it would get unwieldy if we need to go beyond the
>>> existing fields and drawers/books.
>>
>> Is the book/drawer thing architecture specific, or is it machine
>> type / CPU specific. ie do /all/ the s390x machine types / CPUS
>> QEMU support the book/drawer concept, or only a subset.
> 
> Should not be by machine type, but might be by cpu model (e.g. older
> hardware lacking the needed support for exposing this to the guest.) IBM
> folks, please correct me if I'm wrong.


Looks correct to me this is an information indicated by a facility 
introduced with Z10 if I do not make an error.

Regards,
Pierre

> 
>> If only a subset, then restricting it per target on QAPI doesn't
>> fully solve the root problem, and we instead are better focusing
>> on accurate runtime error reporting.
> 
> Nod. Runtime error reporting should also be more flexible.
> 

-- 
Pierre Morel
IBM Lab Boeblingen

