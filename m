Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B5B629A2F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouvxA-00024k-0E; Tue, 15 Nov 2022 08:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ouvx3-00020d-GW; Tue, 15 Nov 2022 08:26:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ouvwy-0002Xb-Sd; Tue, 15 Nov 2022 08:26:09 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFD4ugu017508; Tue, 15 Nov 2022 13:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=xxRp848TnkloG1OhV9F2C7mDMo4d66FTue9Ek2NODgA=;
 b=Bcr3OQ8q7Rpg0JzQYNg6zOxJeW75TyIkCvU3LgU8QgkDlTTLoEaqUz9pB28sJJAgkIjn
 7PtSwZ/t7uiHYOydRqxdNqjcZnthh2oCclIqHNN4tOIg2B86DyLypFLslj8GzSbEPsno
 rZbJ14wcNlsVf9oXBUU7TRwglqL8arCa8aYq0Etsldm273ulLtX8Fh5jWwegxrN+U0G/
 S+iZ6gYtE+BXzSHZDJI2Lcfj+y5CMyD2Nmz4bgIaBPDbOIfYNzDF9kXrTZXWWbzRSCDX
 9uOib5HdC1gaFwRx6q/6shYDkjHZs7oED5Mqiy8ogGx16cTLu7AMQG4E++LPspvq4MJo mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvbb4gemw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 13:25:42 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AFD4qgg017357;
 Tue, 15 Nov 2022 13:25:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvbb4gekv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 13:25:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AFDJmoI028460;
 Tue, 15 Nov 2022 13:25:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3kt34938rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 13:25:38 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AFDQFRh33030558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Nov 2022 13:26:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1295742045;
 Tue, 15 Nov 2022 13:25:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41DE64203F;
 Tue, 15 Nov 2022 13:25:35 +0000 (GMT)
Received: from [9.171.2.61] (unknown [9.171.2.61])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Nov 2022 13:25:35 +0000 (GMT)
Message-ID: <27322d6f-1a5f-211b-a991-3cb9b4f2a761@linux.ibm.com>
Date: Tue, 15 Nov 2022 14:25:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 5/9] hw/virtio: introduce virtio_device_should_start
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:virtiofs" <virtio-fs@redhat.com>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
 <20221114113518-mutt-send-email-mst@kernel.org>
 <aaae3f2a-c5bb-8e62-09d4-4f6f43efe37b@linux.ibm.com>
 <20221114115549-mutt-send-email-mst@kernel.org>
 <2bd5f801-a203-2598-3e6e-ed8f5dad5159@linux.ibm.com>
 <20221114121959-mutt-send-email-mst@kernel.org>
 <69fbc17f-cd78-a849-f7fc-31f8b3945ded@linux.ibm.com>
 <20221115062535-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20221115062535-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ND6kx_hkekBYK7ZUrHG2zY8kRe5tYAbZ
X-Proofpoint-ORIG-GUID: lpabDY-GnCOKr1Qfth6OwOmezWPg2Cw6
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211150086
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 15.11.22 um 12:25 schrieb Michael S. Tsirkin:
> On Tue, Nov 15, 2022 at 09:18:27AM +0100, Christian Borntraeger wrote:
>>
>> Am 14.11.22 um 18:20 schrieb Michael S. Tsirkin:
>>> On Mon, Nov 14, 2022 at 06:15:30PM +0100, Christian Borntraeger wrote:
>>>>
>>>>
>>>> Am 14.11.22 um 18:10 schrieb Michael S. Tsirkin:
>>>>> On Mon, Nov 14, 2022 at 05:55:09PM +0100, Christian Borntraeger wrote:
>>>>>>
>>>>>>
>>>>>> Am 14.11.22 um 17:37 schrieb Michael S. Tsirkin:
>>>>>>> On Mon, Nov 14, 2022 at 05:18:53PM +0100, Christian Borntraeger wrote:
>>>>>>>> Am 08.11.22 um 10:23 schrieb Alex Bennée:
>>>>>>>>> The previous fix to virtio_device_started revealed a problem in its
>>>>>>>>> use by both the core and the device code. The core code should be able
>>>>>>>>> to handle the device "starting" while the VM isn't running to handle
>>>>>>>>> the restoration of migration state. To solve this dual use introduce a
>>>>>>>>> new helper for use by the vhost-user backends who all use it to feed a
>>>>>>>>> should_start variable.
>>>>>>>>>
>>>>>>>>> We can also pick up a change vhost_user_blk_set_status while we are at
>>>>>>>>> it which follows the same pattern.
>>>>>>>>>
>>>>>>>>> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
>>>>>>>>> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
>>>>>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>>>>>>
>>>>>>>> Hmmm, is this
>>>>>>>> commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
>>>>>>>> Author:     Alex Bennée <alex.bennee@linaro.org>
>>>>>>>> AuthorDate: Mon Nov 7 12:14:07 2022 +0000
>>>>>>>> Commit:     Michael S. Tsirkin <mst@redhat.com>
>>>>>>>> CommitDate: Mon Nov 7 14:08:18 2022 -0500
>>>>>>>>
>>>>>>>>         hw/virtio: introduce virtio_device_should_start
>>>>>>>>
>>>>>>>> and older version?
>>>>>>>
>>>>>>> This is what got merged:
>>>>>>> https://lore.kernel.org/r/20221107121407.1010913-1-alex.bennee%40linaro.org
>>>>>>> This patch was sent after I merged the RFC.
>>>>>>> I think the only difference is the commit log but I might be missing
>>>>>>> something.
>>>>>>>
>>>>>>>> This does not seem to fix the regression that I have reported.
>>>>>>>
>>>>>>> This was applied on top of 9f6bcfd99f which IIUC does, right?
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> QEMU master still fails for me for suspend/resume to disk:
>>>>>>
>>>>>> #0  0x000003ff8e3980a6 in __pthread_kill_implementation () at /lib64/libc.so.6
>>>>>> #1  0x000003ff8e348580 in raise () at /lib64/libc.so.6
>>>>>> #2  0x000003ff8e32b5c0 in abort () at /lib64/libc.so.6
>>>>>> #3  0x000003ff8e3409da in __assert_fail_base () at /lib64/libc.so.6
>>>>>> #4  0x000003ff8e340a4e in  () at /lib64/libc.so.6
>>>>>> #5  0x000002aa1ffa8966 in vhost_vsock_common_pre_save (opaque=<optimized out>) at ../hw/virtio/vhost-vsock-common.c:203
>>>>>> #6  0x000002aa1fe5e0ee in vmstate_save_state_v
>>>>>>        (f=f@entry=0x2aa21bdc170, vmsd=0x2aa204ac5f0 <vmstate_virtio_vhost_vsock>, opaque=0x2aa21bac9f8, vmdesc=vmdesc@entry=0x3fddc08eb30, version_id=version_id@entry=0) at ../migration/vmstate.c:329
>>>>>> #7  0x000002aa1fe5ebf8 in vmstate_save_state (f=f@entry=0x2aa21bdc170, vmsd=<optimized out>, opaque=<optimized out>, vmdesc_id=vmdesc_id@entry=0x3fddc08eb30) at ../migration/vmstate.c:317
>>>>>> #8  0x000002aa1fe75bd0 in vmstate_save (f=f@entry=0x2aa21bdc170, se=se@entry=0x2aa21bdbe90, vmdesc=vmdesc@entry=0x3fddc08eb30) at ../migration/savevm.c:908
>>>>>> #9  0x000002aa1fe79584 in qemu_savevm_state_complete_precopy_non_iterable (f=f@entry=0x2aa21bdc170, in_postcopy=in_postcopy@entry=false, inactivate_disks=inactivate_disks@entry=true)
>>>>>>        at ../migration/savevm.c:1393
>>>>>> #10 0x000002aa1fe79a96 in qemu_savevm_state_complete_precopy (f=0x2aa21bdc170, iterable_only=iterable_only@entry=false, inactivate_disks=inactivate_disks@entry=true) at ../migration/savevm.c:1459
>>>>>> #11 0x000002aa1fe6d6ee in migration_completion (s=0x2aa218ef600) at ../migration/migration.c:3314
>>>>>> #12 migration_iteration_run (s=0x2aa218ef600) at ../migration/migration.c:3761
>>>>>> #13 migration_thread (opaque=opaque@entry=0x2aa218ef600) at ../migration/migration.c:3989
>>>>>> #14 0x000002aa201f0b8c in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:505
>>>>>> #15 0x000003ff8e396248 in start_thread () at /lib64/libc.so.6
>>>>>> #16 0x000003ff8e41183e in thread_start () at /lib64/libc.so.6
>>>>>>
>>>>>> Michael, your previous branch did work if I recall correctly.
>>>>>
>>>>> That one was failing under github CI though (for reasons we didn't
>>>>> really address, such as disconnect during stop causing a recursive
>>>>> call to stop, but there you are).
>>>> Even the double revert of everything?
>>>
>>> I don't remember at this point.
>>>
>>>> So how do we proceed now?
>>>
>>> I'm hopeful Alex will come up with a fix.
>>
>>
>> The initial fix changed to qemu/master does still work for me
>>
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index a973811cbfc6..fb3072838119 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -411,14 +411,14 @@ static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
>>    */
>>   static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_t status)
>>   {
>> -    if (vdev->use_started) {
>> -        return vdev->started;
>> -    }
>> -
>>       if (!vdev->vm_running) {
>>           return false;
>>       }
>> +    if (vdev->use_started) {
>> +        return vdev->started;
>> +    }
>> +
>>       return status & VIRTIO_CONFIG_S_DRIVER_OK;
>>   }
> 
> Triggers failure on gitlab unfortunately:
> 
> https://gitlab.com/mstredhat/qemu/-/jobs/3323768122

So maybe we should go forward and revert the whole thing?
After all 9f6bcfd99f mostly looks like a cleanup patch and not something that was really necessary.

