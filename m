Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685672AD75E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 14:20:38 +0100 (CET)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcTZd-0006oI-03
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 08:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kcTXw-0005wS-Kl; Tue, 10 Nov 2020 08:18:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kcTXs-0006N6-Uh; Tue, 10 Nov 2020 08:18:52 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AADIPLw103813; Tue, 10 Nov 2020 08:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AbvmXpda6vzXzCt/D/Pfssaiy1xeJds2p2HAIw4LPZA=;
 b=FXcH9aQVDnUbXaj3QBx5BZBosoyZd+qd6BGC/THyTJtQ6aEWOWJ/SW4xa3bXQRid9oFx
 lxs177zCHc5V2lENLa23ERLoSGBHgujDz0XQxLwv0tKA5Yyggvxz/qV3UYvL3Ugte0lO
 c4OxIJIv1G+Sv11oWEHv9OfpB1BerrcupaRK5hoqA5wDtuCyfndaW7VKGIJB+ykWw7IW
 zCj9hJx14uAUzP5aw1BFg1go2SrUnss4rk2DlDJNH4byy7X+OrwL9NFbpryhzNBwC/7W
 nUqfHazQFoRlzHx/D1/8Q/75B+xbyJc2kLFY/l8QWc0NkeJgV7/cyeEn1WAP8OnUmArD aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34qdpsyd21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 08:18:46 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AADIj9C105431;
 Tue, 10 Nov 2020 08:18:45 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34qdpsyd0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 08:18:45 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AADHYUM002373;
 Tue, 10 Nov 2020 13:18:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 34nk789m99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 13:18:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AADIetH7209472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 13:18:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AAF14C04A;
 Tue, 10 Nov 2020 13:18:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B78584C081;
 Tue, 10 Nov 2020 13:18:39 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.80.78])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Nov 2020 13:18:39 +0000 (GMT)
Subject: Re: [PATCH 1/1] virtio-blk-ccw: tweak the default for num_queues
To: Halil Pasic <pasic@linux.ibm.com>
References: <20201109154831.20779-1-pasic@linux.ibm.com>
 <20201109170616.6875f610.cohuck@redhat.com>
 <20201109195303.459f6fba.pasic@linux.ibm.com>
 <0a6d17ce-ed7f-98e8-2937-f266bb4f0f5a@de.ibm.com>
 <20201110114015.1ba4cdac.pasic@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <f8c4f54b-3439-1c35-2b2e-c9dae0f5241c@de.ibm.com>
Date: Tue, 10 Nov 2020 14:18:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201110114015.1ba4cdac.pasic@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_05:2020-11-10,
 2020-11-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 mlxlogscore=880 bulkscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011100092
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:18:46
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Mueller <mimu@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10.11.20 11:40, Halil Pasic wrote:
> On Tue, 10 Nov 2020 09:47:51 +0100
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
>>
>>
>> On 09.11.20 19:53, Halil Pasic wrote:
>>> On Mon, 9 Nov 2020 17:06:16 +0100
>>> Cornelia Huck <cohuck@redhat.com> wrote:
>>>
>>>>> @@ -20,6 +21,11 @@ static void virtio_ccw_blk_realize(VirtioCcwDevice *ccw_dev, Error **errp)
>>>>>  {
>>>>>      VirtIOBlkCcw *dev = VIRTIO_BLK_CCW(ccw_dev);
>>>>>      DeviceState *vdev = DEVICE(&dev->vdev);
>>>>> +    VirtIOBlkConf *conf = &dev->vdev.conf;
>>>>> +
>>>>> +    if (conf->num_queues == VIRTIO_BLK_AUTO_NUM_QUEUES) {
>>>>> +        conf->num_queues = MIN(4, current_machine->smp.cpus);
>>>>> +    }  
>>>>
>>>> I would like to have a comment explaining the numbers here, however.
>>>>
>>>> virtio-pci has a pretty good explanation (use 1:1 for vqs:vcpus if
>>>> possible, apply some other capping). 4 seems to be a bit arbitrary
>>>> without explanation, although I'm sure you did some measurements :)
>>>
>>> Frankly, I don't have any measurements yet. For the secure case,
>>> I think Mimu has assessed the impact of multiqueue, hence adding Mimu to
>>> the cc list. @Mimu can you help us out.
>>>
>>> Regarding the normal non-protected VMs I'm in a middle of producing some
>>> measurement data. This was admittedly a bit rushed because of where we
>>> are in the cycle. Sorry to disappoint you.
>>>
>>> The number 4 was suggested by Christian, maybe Christian does have some
>>> readily available measurement data for the normal VM case. @Christian:
>>> can you help me out?
>> My point was to find a balance between performance gain and memory usage.
>> As a matter of fact, virtqueue do consume memory. So 4 looked like a
>> reasonable default for me for large guests as long as we do not have directed
>> interrupts.
>>
>> Now, thinking about this again: If we want to change the default to something
>> else in the future (e.g. to num vcpus) then the compat handling will get
>> really complicated.
> 
> Regarding compat handling, I believe we would need a new property for
> virtio-blk-ccw: something like def_num_queues_max. Then logic would
> morph to MIN(def_num_queues_max, current_machine->smp.cpus), and we could
> relatively freely do compat stuff on def_num_queues_max.
> 
> IMHO not pretty but certainly doable.
> 
>>
>> So we can
>> - go with num queues = num cpus. But this will consume memory
>> for guests with lots of CPUs.
> 
> In absence of data that showcases the benefit outweighing the obvious
> detriment, I lean towards finding this option the least favorable.
> 
>> - go with the proposed logic of min(4,vcpus) and accept that future compat handling
>> is harder
> 
> IMHO not a bad option, but I think I would still feel better about a
> more informed decision. In the end, the end user can already specify the
> num_queues explicitly, so I don't think this is urgent.
> 
>> - defer this change
> 
> So I tend to lean towards deferring.

Yes, I was pushing this for 5.2 to avoid compat handling. But maybe it is better
to wait and do it later. But we should certainly continue the discussion to have
something for the next release.

> 
> Another thought is, provided the load is about evenly spread on the
> different virtqueues, if the game is about vCPU locality, one could
> think of decreasing the size of each individual virtqueue while
> increasing their number, with the idea of not paying much more in terms
> of memory. The queue size however needs to be a power of 2,
> so there is a limit on the granularity.
> 
> Regarding secure VMs, currently we have to cramp at least the swiotlb and
> the virtqueues into ZONE_DMA. So increasing the number of
> virtqueues heavily may get us into new trouble with exotic configs.
> 
> Regards,
> Halil
> 

