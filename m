Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D57C2AF155
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:58:59 +0100 (CET)
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpiE-00018z-4r
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mimu@linux.ibm.com>)
 id 1kcpbH-0000CI-Nk; Wed, 11 Nov 2020 07:51:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mimu@linux.ibm.com>)
 id 1kcpbF-0003Uk-Ei; Wed, 11 Nov 2020 07:51:47 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ABCXCuF097843; Wed, 11 Nov 2020 07:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=reply-to : subject : to
 : cc : references : from : message-id : date : mime-version : in-reply-to
 : content-type : content-transfer-encoding; s=pp1;
 bh=QeZqbOdqiRp6U8Z5dU6E/61uz4gFbFEFVj7xSjnQD8k=;
 b=mk5McbgSX3kq7lP+ruCeekZf+beqPitC7ChvO6e78Z7WTVjncwvFfgI30rZpYZBibDdr
 A4zCjUmZTaRxRq8KuucTQd8jPCDbWk2tR7z7J466LdrksMjNrL0+3+nSyHNNJAS0vAGz
 b4e+aQm11P5RMZ9jIbUKQWkgBwrXbFk6k2SgviERe1Eo33QFo546+P1M9dRP/l6XMWrw
 ZoNiSH7/5u3Rbq7aWhmCZ8VwzHohMZMU78wl9E3eO/R9eTrpSc+cyXOcCDEahBoOhsRN
 j216MKyrIGwP6KlpTgGboUYtxa2xlEntNy9QYvmNCh4uK5d6j91c24RQjQMqtfb1gpkr Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34r6brr5kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 07:51:39 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0ABCls1Q172947;
 Wed, 11 Nov 2020 07:51:29 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34r6brr4qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 07:51:29 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ABCi56G023171;
 Wed, 11 Nov 2020 12:49:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 34njuh27ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Nov 2020 12:49:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0ABCn9YD57475378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Nov 2020 12:49:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D1FF4C050;
 Wed, 11 Nov 2020 12:49:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1DA94C044;
 Wed, 11 Nov 2020 12:49:08 +0000 (GMT)
Received: from [9.152.224.120] (unknown [9.152.224.120])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Nov 2020 12:49:08 +0000 (GMT)
Subject: Re: [PATCH 1/1] virtio-blk-ccw: tweak the default for num_queues
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
References: <20201109154831.20779-1-pasic@linux.ibm.com>
 <20201109170616.6875f610.cohuck@redhat.com>
 <20201109195303.459f6fba.pasic@linux.ibm.com>
 <4a3d24e0-399f-f509-9a5c-c66c57b2d28a@linux.ibm.com>
 <e27547cf-1462-6e0f-c830-dde5a6f8c1f6@linux.ibm.com>
 <20201111133815.10b8f3b7.cohuck@redhat.com>
From: Michael Mueller <mimu@linux.ibm.com>
Organization: IBM
Message-ID: <d13e61ad-8e98-4de8-141e-43eb7b513880@linux.ibm.com>
Date: Wed, 11 Nov 2020 13:49:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201111133815.10b8f3b7.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_02:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=mimu@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 07:51:43
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: mimu@linux.ibm.com
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11.11.20 13:38, Cornelia Huck wrote:
> On Wed, 11 Nov 2020 13:26:11 +0100
> Michael Mueller <mimu@linux.ibm.com> wrote:
> 
>> On 10.11.20 15:16, Michael Mueller wrote:
>>>
>>>
>>> On 09.11.20 19:53, Halil Pasic wrote:
>>>> On Mon, 9 Nov 2020 17:06:16 +0100
>>>> Cornelia Huck <cohuck@redhat.com> wrote:
>>>>   
>>>>>> @@ -20,6 +21,11 @@ static void
>>>>>> virtio_ccw_blk_realize(VirtioCcwDevice *ccw_dev, Error **errp)
>>>>>>    {
>>>>>>        VirtIOBlkCcw *dev = VIRTIO_BLK_CCW(ccw_dev);
>>>>>>        DeviceState *vdev = DEVICE(&dev->vdev);
>>>>>> +    VirtIOBlkConf *conf = &dev->vdev.conf;
>>>>>> +
>>>>>> +    if (conf->num_queues == VIRTIO_BLK_AUTO_NUM_QUEUES) {
>>>>>> +        conf->num_queues = MIN(4, current_machine->smp.cpus);
>>>>>> +    }
>>>>>
>>>>> I would like to have a comment explaining the numbers here, however.
>>>>>
>>>>> virtio-pci has a pretty good explanation (use 1:1 for vqs:vcpus if
>>>>> possible, apply some other capping). 4 seems to be a bit arbitrary
>>>>> without explanation, although I'm sure you did some measurements :)
>>>>
>>>> Frankly, I don't have any measurements yet. For the secure case,
>>>> I think Mimu has assessed the impact of multiqueue, hence adding Mimu to
>>>> the cc list. @Mimu can you help us out.
>>>>
>>>> Regarding the normal non-protected VMs I'm in a middle of producing some
>>>> measurement data. This was admittedly a bit rushed because of where we
>>>> are in the cycle. Sorry to disappoint you.
>>>
>>> I'm talking with the perf team tomorrow. They have done some
>>> measurements with multiqueue for PV guests and I asked for a comparison
>>> to non PV guests as well.
>>
>> The perf team has performed measurements for us that show that a *PV
>> KVM guest* benefits in terms of throughput for random read, random write
>> and sequential read (no difference for sequential write) by a multi
>> queue setup. CPU cost are reduced as well due to reduced spinlock
>> contention.
> 
> Just to be clear, that was with 4 queues?

Yes, we have seen it with 4 and also with 9 queues.

Halil,

still I would like to know what the exact memory consumption per queue
is that you are talking about. Have you made a calculation? Thanks.

> 
>>
>> For a *standard KVM guest* it currently has no throughput effect. No
>> benefit and no harm. I have asked them to finalize their measurements
>> by comparing the CPU cost as well. I will receive that information on
>> Friday.
> 
> Thank you for checking!
> 
>>
>> Michael
>>
>>
>>>
>>> Michael
>>>    
>>>>
>>>> The number 4 was suggested by Christian, maybe Christian does have some
>>>> readily available measurement data for the normal VM case. @Christian:
>>>> can you help me out?
>>>>
>>>> Regards,
>>>> Halil
>>>>   
>>>    
>>
>>
> 


