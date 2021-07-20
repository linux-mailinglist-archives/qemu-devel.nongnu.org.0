Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFD43CF9A0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:32:49 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ovY-00059Z-2F
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m5osc-0003pq-NC; Tue, 20 Jul 2021 08:29:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m5osa-0004RO-O4; Tue, 20 Jul 2021 08:29:46 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KC2pUH114803; Tue, 20 Jul 2021 08:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NXufod7yFP0YBwSnzJ71bahSl3+QTo2iwjOPj29nUYU=;
 b=MAUmE1XKoKTHuEfRWM48od2G4pQxLY6AhCeDa3gzA664JU1i1vRHX//zBrGDC0mtK9R8
 AVCKs8j5J5FOIw8TxnXjKRIS2KzUgMzDbAP2Ks5z3l2YnKMFWUDE+ilaZQyJrU7yzLgx
 uL1xeLRoiI4F/nyAmGgXIiQAkZgwvejslJE/W6WArsuCUE+ms4vTczOWUK9qnu2d7zmr
 1ssu1Vhr8Z3ZNcK5uQAMChi1PeKPTS0RAzq7+7JfrNNINd4VdobzZxMiG8MX+3FndZdt
 WG/55gxu1e7FwchzfaHbY1X82wlEgrOgDEdNhEX8MvqNokiKbE/I72+gPBGurAVYKVVj Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wuv6vj45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 08:29:42 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16KC3VbZ122968;
 Tue, 20 Jul 2021 08:29:41 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wuv6vj3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 08:29:41 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16KCRarn013170;
 Tue, 20 Jul 2021 12:29:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 39upu88rff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 12:29:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16KCRCF127656586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 12:27:12 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8562DA404D;
 Tue, 20 Jul 2021 12:29:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE02CA405E;
 Tue, 20 Jul 2021 12:29:35 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.7.187])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 12:29:35 +0000 (GMT)
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <0801e122-0e9c-e266-42e8-d5cddb16c237@linux.ibm.com>
 <87bl73df9y.fsf@dusky.pond.sub.org> <87y2a6bp5f.fsf@redhat.com>
 <YPFO/NPdyHjf1Cyu@redhat.com> <87pmvibkri.fsf@redhat.com>
 <YPFkJUgbE9ku0tI7@redhat.com> <87czre9uar.fsf@redhat.com>
 <ecb2932e-7595-c4a4-5480-9c77ecf3e34d@linux.ibm.com>
 <87wnpl8kgy.fsf@redhat.com>
 <49614371-1357-47dd-c000-c8ff6ff845b1@linux.ibm.com>
 <YPaVL9hIL2ob9/Hv@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <643046ca-2cec-cb5a-54b6-92789e33e5fe@linux.ibm.com>
Date: Tue, 20 Jul 2021 14:29:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPaVL9hIL2ob9/Hv@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EJjPeiFtw0MYEGZ73Twapm9s4bR_r7wm
X-Proofpoint-ORIG-GUID: 5Fct7I93VtGzYYtxpoc48Edie-Q8WO-Z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_05:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107200077
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
 Cornelia Huck <cohuck@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/20/21 11:19 AM, Daniel P. Berrangé wrote:
> On Tue, Jul 20, 2021 at 10:46:31AM +0200, Pierre Morel wrote:
>>
>>
>> On 7/20/21 10:20 AM, Cornelia Huck wrote:
>>> On Tue, Jul 20 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:
>>>
>>>> On 7/19/21 5:50 PM, Cornelia Huck wrote:
>>>>> On Fri, Jul 16 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>> Is the book/drawer thing architecture specific, or is it machine
>>>>>> type / CPU specific. ie do /all/ the s390x machine types / CPUS
>>>>>> QEMU support the book/drawer concept, or only a subset.
>>>>>
>>>>> Should not be by machine type, but might be by cpu model (e.g. older
>>>>> hardware lacking the needed support for exposing this to the guest.) IBM
>>>>> folks, please correct me if I'm wrong.
>>>>
>>>>
>>>> Looks correct to me this is an information indicated by a facility
>>>> introduced with Z10 if I do not make an error.
>>>
>>> Hm. Would that become a problem if we made availability of parameters
>>> dependent upon a value in the machine (see the other thread I cc:ed you
>>> on?)
>>>
>>
>> Why?
>> The parameter can always be there, it is just that with older cpu model we
>> will not report the topology information to the guest.
> 
> I mostly see this as an error reporting problem, perhaps with an optional
> capabilitty reporting facility.
> 
> eg if someone requests 'z9'  or older together with books > 1 or
> drawers > 1, it would be ideal if QEMU reports an error message,
> rather than silently ignoring it and not reporting this info to
> the guest.
> 
> Taking it further, it some app queries CPU models  via QMP, it
> could be desirable if the CPU model data returned indicates whether
> drawers/books > 1 are conceptually available.  Likewise for dies
> on x86, since I cna't imagine guest OS doing sensible things
> with an i486 CPU and dies=2
> 
> Regards,
> Daniel
> 

Thanks,
I will rework this based on what is done on x86 and dies.

regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

