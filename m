Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241E1CFA64
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 18:18:33 +0200 (CEST)
Received: from localhost ([::1]:36838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYXc0-0005Sk-Km
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 12:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1jYXaM-0004xK-IM; Tue, 12 May 2020 12:16:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59596
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1jYXaL-0007ke-GH; Tue, 12 May 2020 12:16:50 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04CG5N2I036890; Tue, 12 May 2020 12:16:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ws0nr714-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 12:16:47 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04CG5eeq038406;
 Tue, 12 May 2020 12:16:47 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ws0nr70u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 12:16:47 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04CGFNL2029738;
 Tue, 12 May 2020 16:16:46 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 30wm56an8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 16:16:46 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04CGGkB242140006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 May 2020 16:16:46 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 094A7AC05B;
 Tue, 12 May 2020 16:16:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C04CFAC059;
 Tue, 12 May 2020 16:16:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.150.178])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 12 May 2020 16:16:45 +0000 (GMT)
Subject: Re: [PATCH v1 2/8] s390/sclp: check sccb len before filling in data
To: Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20200508230823.22956-1-walling@linux.ibm.com>
 <20200508230823.22956-3-walling@linux.ibm.com>
 <58bc496c-28bb-26f8-ab46-aba6ad141717@linux.ibm.com>
 <737869a8-13b2-1831-00c6-629d5a109d9c@redhat.com>
 <05ab2e59-10c0-c7df-c014-b54883ddccd3@linux.ibm.com>
 <9a39a948-91a1-7cfe-f2a5-d30e5564f318@redhat.com>
 <20200512180140.4be69d60.cohuck@redhat.com>
From: Collin Walling <walling@linux.ibm.com>
Message-ID: <dc423845-2b63-7c08-774e-9546c2defe58@linux.ibm.com>
Date: Tue, 12 May 2020 12:16:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200512180140.4be69d60.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_04:2020-05-11,
 2020-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2005120117
Received-SPF: pass client-ip=148.163.158.5; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 10:46:45
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Janosch Frank <frankja@linux.ibm.com>, mst@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, svens@linux.ibm.com, pbonzini@redhat.com,
 mihajlov@linux.ibm.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/20 12:01 PM, Cornelia Huck wrote:
> On Mon, 11 May 2020 17:02:06 +0200
> David Hildenbrand <david@redhat.com> wrote:
> 
>> On 11.05.20 16:50, Janosch Frank wrote:
>>> On 5/11/20 4:44 PM, David Hildenbrand wrote:
>>>> On 11.05.20 16:36, Janosch Frank wrote:
>>>>> On 5/9/20 1:08 AM, Collin Walling wrote:
>>>>>> The SCCB must be checked for a sufficient length before it is filled
>>>>>> with any data. If the length is insufficient, then the SCLP command
>>>>>> is suppressed and the proper response code is set in the SCCB header.
>>>>>>
>>>>>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
>>>>>
>>>>> Fixes tag?
> 
> Probably
> 
> Fixes: 832be0d8a3bb ("s390x: sclp: Report insufficient SCCB length")
> 
> ?
> 

Sounds reasonable. This patch doesn't fix any explicitly-known bugs 
AFAIK. The s390 Linux kernel is hard-coded to use a 4K size SCCB when
executing these commands.

I suppose this could introduce a bug if things change in the Linux 
kernel or if some other OS wants to use this command. That should be 
enough of a justification, right? (Just want to make sure I understand 
the use of the tag correctly).

>>>>> Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
>>>>
>>>> This is not a fix AFAIKs.
>>>> sclp_service_call()/sclp_service_call_protected() always supplies a full
>>>> SCCB of exactly 4k size.
>>>>   
>>>
>>> We don't check for QEMU's 4k buffer here, but for the length that was
>>> specified by the guest.
>>>
>>> It's valid for the guest to request cpu info and state that its buffer
>>> is only 1k. We can't write everything in 1k if we have ~200 cpus, so
>>> we'll report the insufficient length rc.
>>>
>>> What he fixes here is the time of the length check, it should be done
>>> before any changes are being done to the work_sccb.
>>
>> I don't have access to the spec, especially, if the guest can expect
>> nothing else in the sccb to change in case we report an error code. So
>> whatever you tell me, I have to trust you :)
> 
> Same here. Sounds plausible, but I have to trust the folks with the
> documentation :)
> 

Sorry I can't be of much help here :/

-- 
--
Regards,
Collin

Stay safe and stay healthy

