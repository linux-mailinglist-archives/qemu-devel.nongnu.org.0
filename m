Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FF63CF64F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 10:48:04 +0200 (CEST)
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5lQ3-0006Yi-Ij
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 04:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m5lOl-0005qE-2F; Tue, 20 Jul 2021 04:46:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m5lOj-0002Cm-E4; Tue, 20 Jul 2021 04:46:42 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16K8jORL004018; Tue, 20 Jul 2021 04:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CsSGMH4zComlUjatBzpOHR5bMJqpSQWHkCSK6uaQ/2Y=;
 b=ns8zlRfSYTvt/ogNb6u29CNXzQkRYtGDm99JPuk21zOQp6WFP+9JEekFevkzZrw2xEo8
 JuYTA4IzBLedKcZdhXaQ7U9+HOPWD1qelqXVHYIgtPhMvxkRoo5zD0XNSO+WSQhyVb19
 2mVXwBWhF2SsPjgKk59QkRNsRxOVUGcQe8lXsfmvS5XSF6dTvLO9coRdQngkwlRHXO5l
 IzII285gYAPTiftYizlH64CLtQqSISvA7m2sUNOmx5WipJbNc8k8PEkmjPlSjIAkqnmq
 t8tnA4pczIcOvH1biwpYitvprrFjGqjOXW7Y8/GPK+3nM6LVPpSnAJOQFDX8A8HmmEfH Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wu8qr0j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 04:46:38 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16K8jolc004573;
 Tue, 20 Jul 2021 04:46:38 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wu8qr0hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 04:46:38 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16K8gsUE000874;
 Tue, 20 Jul 2021 08:46:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 39vng70t6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 08:46:35 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16K8i8sm33751526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Jul 2021 08:44:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57519A404D;
 Tue, 20 Jul 2021 08:46:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0059A4051;
 Tue, 20 Jul 2021 08:46:31 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.7.187])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Jul 2021 08:46:31 +0000 (GMT)
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
 <ecb2932e-7595-c4a4-5480-9c77ecf3e34d@linux.ibm.com>
 <87wnpl8kgy.fsf@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <49614371-1357-47dd-c000-c8ff6ff845b1@linux.ibm.com>
Date: Tue, 20 Jul 2021 10:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87wnpl8kgy.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fQvaTZPyyFMsiyo6DuVzYq8W_X5C46nQ
X-Proofpoint-ORIG-GUID: BkDwZodsjqu6wyYMi8Hgy663WO0zKvyq
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_04:2021-07-19,
 2021-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107200051
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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



On 7/20/21 10:20 AM, Cornelia Huck wrote:
> On Tue, Jul 20 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>> On 7/19/21 5:50 PM, Cornelia Huck wrote:
>>> On Fri, Jul 16 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>> Is the book/drawer thing architecture specific, or is it machine
>>>> type / CPU specific. ie do /all/ the s390x machine types / CPUS
>>>> QEMU support the book/drawer concept, or only a subset.
>>>
>>> Should not be by machine type, but might be by cpu model (e.g. older
>>> hardware lacking the needed support for exposing this to the guest.) IBM
>>> folks, please correct me if I'm wrong.
>>
>>
>> Looks correct to me this is an information indicated by a facility
>> introduced with Z10 if I do not make an error.
> 
> Hm. Would that become a problem if we made availability of parameters
> dependent upon a value in the machine (see the other thread I cc:ed you
> on?)
> 

Why?
The parameter can always be there, it is just that with older cpu model 
we will not report the topology information to the guest.

The discussion on dies and on smp_dies_supported in this thread will be 
interesting to follow because in my opinion dies for X or books/drawers 
for Z are to be treated equally.

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

