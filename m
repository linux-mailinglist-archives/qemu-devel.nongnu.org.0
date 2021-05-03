Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC937137C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:14:00 +0200 (CEST)
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVaR-0004IW-Me
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1ldVXO-0002rW-UY; Mon, 03 May 2021 06:10:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36750
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1ldVXM-0006My-8V; Mon, 03 May 2021 06:10:50 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143A3k8W073559; Mon, 3 May 2021 06:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dAUT+z/+bm/5IgTkjci/sN/4dzZZDA4jK03LXTIO2QM=;
 b=LPLx83wwxVR+sX2qpYTbDMFxLejfuXVx6klN4v33FZXtRN1I75wgcYLb9hWvrikskLGq
 HZYcm8oM7zakF/j/MRiYGt/c8OZqh5tlcSceipeX1YsQ1kHNbUiwiAVYU6iBvgRAafHQ
 v7RGL7baHT7XMhSPxbxYsN0S3yRBeRepHomv1fZsM+xXlT65z4TaPJdnmWyYwN8bzeQw
 Xgrzl1DMmV+wxRnnaG0Cc9+NViHQr4Oztrc9ELryj3K+4uqut7JR03N0iP8fhaiy0w6J
 LsIAdgq2levYiw6NOIYchkdyiRZeNJUGpyqi4HzzE5in3+K4oC/EHrbFujPqr1mShioV Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38af2e0662-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 06:10:45 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 143A4NX0075381;
 Mon, 3 May 2021 06:10:44 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38af2e064v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 06:10:44 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 143A9OM4003046;
 Mon, 3 May 2021 10:10:43 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 388xm88bx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 10:10:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 143AAe7F44368354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 May 2021 10:10:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D06CA4051;
 Mon,  3 May 2021 10:10:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C845A4040;
 Mon,  3 May 2021 10:10:40 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.76.192])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 May 2021 10:10:39 +0000 (GMT)
Subject: Re: [PATCH 4/4] pc-bios/s390-ccw: Allow building with Clang, too
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-5-thuth@redhat.com>
 <87r1iofm61.fsf@dusky.pond.sub.org>
 <15271277-98c2-3925-5937-b9f04ad376b3@redhat.com>
 <3808e5d4-b755-bce5-a25f-2d46ed6a59e7@redhat.com>
 <87mttcdy4n.fsf@dusky.pond.sub.org>
 <20210503111457.6f8e3597.cohuck@redhat.com>
 <9a0823a5-3782-c004-bbe6-7c5bc6830465@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <d6b6fe9a-f095-5587-6e38-8bf16157aed8@de.ibm.com>
Date: Mon, 3 May 2021 12:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <9a0823a5-3782-c004-bbe6-7c5bc6830465@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jJ_XFQX8NA8wN1JVOsi1_TRzzYSUoDS5
X-Proofpoint-ORIG-GUID: 0MDReXg_vskkyauv0cFAfkEiTJ6jYp6H
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_06:2021-04-30,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105030066
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 03.05.21 11:31, Thomas Huth wrote:
> On 03/05/2021 11.14, Cornelia Huck wrote:
>> On Mon, 03 May 2021 10:23:20 +0200
>> Markus Armbruster <armbru@redhat.com> wrote:
>>
>>> David Hildenbrand <david@redhat.com> writes:
>>>
>>>> On 03.05.21 07:17, Thomas Huth wrote:
>>>>> On 03/05/2021 06.58, Markus Armbruster wrote:
>>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>>> Clang unfortunately does not support generating code for the z900
>>>>>>> architecture level and starts with the z10 instead. Thus to be able
>>>>>>> to support compiling with Clang, we have to check for the supported
>>>>>>> compiler flags. The disadvantage is of course that the bios image
>>>>>>> will only run with z10 guest CPUs upwards (which is what most people
>>>>>>> use anyway), so just in case let's also emit a warning in that case.
>>>>>>
>>>>>> What happens when you try to use this bios with an old CPU anyway?
>>>>>
>>>>> Interesting question. I was expecting the guest to crash since it would be
>>>>> using a CPU instruction that is not supported on the old CPU model. But I
>>>>> just gave it a try, and there was no crash. The guest booted just fine.
>>>>> Either Clang only emits instructions that work with the old z900 anyway, or
>>>>> our emulation in QEMU is imprecise and we allow newer instructions to be
>>>>> executed on old models, too.
>>>>
>>>> Yes, that's currently still done. We once thought about disabling that
>>>> (there was a patch from Richard), but decided against it because -- back
>>>> then -- the default QEMU model was still very basic and would have
>>>> essentially disabled all more recent instructions as default.
>>>>
>>>> We can most probably do that change soon as we have a "fairly new"
>>>> default QEMU CPU model. I can glue it to my z14 change.
>>>
>>> In case this makes the BIOS crash with old CPUs: when a guest refuses to
>>> start because the BIOS was compiled the wrong way for it, configure
>>> having told you so back then is not a nice user experience.  Can we do
>>> better, with reasonable effort?
>>
>> I fear the experience will be as bad as for any guest that is using
>> features from a newer cpu level (i.e. random crashes when the guest
>> actually tries to use that newer instruction.)
>>
>> I see two options:
>> - Just try to start and hope that it works.
>> - Deprecate any cpu model older than z10.
>>
>> Anyone have a better idea? I don't particularly like any of the two.
> 
> I think we should simply continue to build the default bios with GCC and -mz900. So the normal user (who does not explicitly use the freshly compiled binaries but the pre-built ones) will never experience any problem here. The Clang builds are (at least right now) rather only meant for us developers to check the sources from time to time with this compiler, to see whether it detects some additional issues compared to GCC.

Ack.

