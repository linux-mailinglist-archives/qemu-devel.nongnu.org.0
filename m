Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB642629F36
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouyza-0002Dw-HF; Tue, 15 Nov 2022 11:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ouyzX-0002DX-0c; Tue, 15 Nov 2022 11:40:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ouyzU-0002wv-H4; Tue, 15 Nov 2022 11:40:54 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AFFmRe3018295; Tue, 15 Nov 2022 16:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=RtdeYydEU+P81IiDHhpljtmTXanV625VSb911L8YzmY=;
 b=THsPRXZa7JgPkdz8iEs5nfiFK+5iZaxFUUHLtpq75+j4mvp8mHT9/CrkRmNTdwgoYPmv
 XWSVBTgPDnIeVdNvcQt+vgh8faI7mubKaANGCAxGSckPJf8Khr9zLv52F5gP2BBxbIi5
 qXVd+1EzrQnrlMte0VPE+0m6YJQpuAqHfFrua3PH8r4CGcRa1XuZN6D6YBipxEpzsvH3
 g31fDBpzkFiqQC3V6sbt3vOYENy69pxfqyweuSFlIyaJ2cY4QZeoaHNbwi8Pl/tktvbh
 vnRHDqR0PxEW6fgt9yNuajGmSbfNOFV/In0HR2s3Y4LBl26Ewu1birKtxOOmP87HbthR cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvdr29ghb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 16:40:27 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AFFoVlN028936;
 Tue, 15 Nov 2022 16:40:27 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kvdr29gg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 16:40:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AFGageQ025383;
 Tue, 15 Nov 2022 16:40:24 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3kt2rjcn0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 16:40:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AFGeLeX1573552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Nov 2022 16:40:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D011B42041;
 Tue, 15 Nov 2022 16:40:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15F6A42042;
 Tue, 15 Nov 2022 16:40:21 +0000 (GMT)
Received: from [9.171.2.61] (unknown [9.171.2.61])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Nov 2022 16:40:21 +0000 (GMT)
Message-ID: <471b71ad-1892-8ab4-a94b-c0ec3d34e6b1@linux.ibm.com>
Date: Tue, 15 Nov 2022 17:40:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 5/9] hw/virtio: introduce virtio_device_should_start
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Raphael Norwitz <raphael.norwitz@nutanix.com>, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
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
 <20221114121959-mutt-send-email-mst@kernel.org> <87tu309tlk.fsf@linaro.org>
 <26b4e8d8-784d-d1ce-67a3-b61896701bf7@linux.ibm.com>
 <87leoc9p98.fsf@linaro.org>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <87leoc9p98.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6-zzHfGeJE8_8kWDRV5qtcFU3N_7afgF
X-Proofpoint-ORIG-GUID: DIUTwz5Q1duakeJbqiGacJCCOtFU2gmA
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211150111
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



Am 15.11.22 um 17:05 schrieb Alex Bennée:
> 
> Christian Borntraeger <borntraeger@linux.ibm.com> writes:
> 
>> Am 15.11.22 um 15:31 schrieb Alex Bennée:
>>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>>
>>>> On Mon, Nov 14, 2022 at 06:15:30PM +0100, Christian Borntraeger wrote:
>>>>>
>>>>>
>>>>> Am 14.11.22 um 18:10 schrieb Michael S. Tsirkin:
>>>>>> On Mon, Nov 14, 2022 at 05:55:09PM +0100, Christian Borntraeger wrote:
>>>>>>>
>>>>>>>
>>>>>>> Am 14.11.22 um 17:37 schrieb Michael S. Tsirkin:
>>>>>>>> On Mon, Nov 14, 2022 at 05:18:53PM +0100, Christian Borntraeger wrote:
>>>>>>>>> Am 08.11.22 um 10:23 schrieb Alex Bennée:
>>>>>>>>>> The previous fix to virtio_device_started revealed a problem in its
>>>>>>>>>> use by both the core and the device code. The core code should be able
>>>>>>>>>> to handle the device "starting" while the VM isn't running to handle
>>>>>>>>>> the restoration of migration state. To solve this dual use introduce a
>>>>>>>>>> new helper for use by the vhost-user backends who all use it to feed a
>>>>>>>>>> should_start variable.
>>>>>>>>>>
>>>>>>>>>> We can also pick up a change vhost_user_blk_set_status while we are at
>>>>>>>>>> it which follows the same pattern.
>>>>>>>>>>
>>>>>>>>>> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
>>>>>>>>>> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio device)
>>>>>>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>>>>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>>>>>>>
>>>>>>>>> Hmmm, is this
>>>>>>>>> commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
>>>>>>>>> Author:     Alex Bennée <alex.bennee@linaro.org>
>>>>>>>>> AuthorDate: Mon Nov 7 12:14:07 2022 +0000
>>>>>>>>> Commit:     Michael S. Tsirkin <mst@redhat.com>
>>>>>>>>> CommitDate: Mon Nov 7 14:08:18 2022 -0500
>>>>>>>>>
>>>>>>>>>         hw/virtio: introduce virtio_device_should_start
>>>>>>>>>
>>>>>>>>> and older version?
>>>>>>>>
>>>>>>>> This is what got merged:
>>>>>>>> https://lore.kernel.org/r/20221107121407.1010913-1-alex.bennee%40linaro.org
>>>>>>>> This patch was sent after I merged the RFC.
>>>>>>>> I think the only difference is the commit log but I might be missing
>>>>>>>> something.
>>>>>>>>
>>>>>>>>> This does not seem to fix the regression that I have reported.
>>>>>>>>
>>>>>>>> This was applied on top of 9f6bcfd99f which IIUC does, right?
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>> QEMU master still fails for me for suspend/resume to disk:
>>>>>>>
>>>>>>> #0  0x000003ff8e3980a6 in __pthread_kill_implementation () at /lib64/libc.so.6
>>>>>>> #1  0x000003ff8e348580 in raise () at /lib64/libc.so.6
>>>>>>> #2  0x000003ff8e32b5c0 in abort () at /lib64/libc.so.6
>>>>>>> #3  0x000003ff8e3409da in __assert_fail_base () at /lib64/libc.so.6
>>>>>>> #4  0x000003ff8e340a4e in  () at /lib64/libc.so.6
>>>>>>> #5 0x000002aa1ffa8966 in vhost_vsock_common_pre_save
>>>>>>> (opaque=<optimized out>) at
>>>>>>> ../hw/virtio/vhost-vsock-common.c:203
>>>>>>> #6  0x000002aa1fe5e0ee in vmstate_save_state_v
>>>>>>>        (f=f@entry=0x2aa21bdc170, vmsd=0x2aa204ac5f0
>>>>>>> <vmstate_virtio_vhost_vsock>, opaque=0x2aa21bac9f8,
>>>>>>> vmdesc=vmdesc@entry=0x3fddc08eb30,
>>>>>>> version_id=version_id@entry=0) at ../migration/vmstate.c:329
>>>>>>> #7 0x000002aa1fe5ebf8 in vmstate_save_state
>>>>>>> (f=f@entry=0x2aa21bdc170, vmsd=<optimized out>,
>>>>>>> opaque=<optimized out>, vmdesc_id=vmdesc_id@entry=0x3fddc08eb30)
>>>>>>> at ../migration/vmstate.c:317
>>>>>>> #8 0x000002aa1fe75bd0 in vmstate_save (f=f@entry=0x2aa21bdc170,
>>>>>>> se=se@entry=0x2aa21bdbe90, vmdesc=vmdesc@entry=0x3fddc08eb30) at
>>>>>>> ../migration/savevm.c:908
>>>>>>> #9 0x000002aa1fe79584 in
>>>>>>> qemu_savevm_state_complete_precopy_non_iterable
>>>>>>> (f=f@entry=0x2aa21bdc170, in_postcopy=in_postcopy@entry=false,
>>>>>>> inactivate_disks=inactivate_disks@entry=true)
>>>>>>>        at ../migration/savevm.c:1393
>>>>>>> #10 0x000002aa1fe79a96 in qemu_savevm_state_complete_precopy
>>>>>>> (f=0x2aa21bdc170, iterable_only=iterable_only@entry=false,
>>>>>>> inactivate_disks=inactivate_disks@entry=true) at
>>>>>>> ../migration/savevm.c:1459
>>>>>>> #11 0x000002aa1fe6d6ee in migration_completion (s=0x2aa218ef600) at ../migration/migration.c:3314
>>>>>>> #12 migration_iteration_run (s=0x2aa218ef600) at ../migration/migration.c:3761
>>>>>>> #13 migration_thread (opaque=opaque@entry=0x2aa218ef600) at ../migration/migration.c:3989
>>>>>>> #14 0x000002aa201f0b8c in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:505
>>>>>>> #15 0x000003ff8e396248 in start_thread () at /lib64/libc.so.6
>>>>>>> #16 0x000003ff8e41183e in thread_start () at /lib64/libc.so.6
>>>>>>>
>>>>>>> Michael, your previous branch did work if I recall correctly.
>>>>>>
>>>>>> That one was failing under github CI though (for reasons we didn't
>>>>>> really address, such as disconnect during stop causing a recursive
>>>>>> call to stop, but there you are).
>>>>> Even the double revert of everything?
>>>>
>>>> I don't remember at this point.
>>>>
>>>>> So how do we proceed now?
>>>>
>>>> I'm hopeful Alex will come up with a fix.
>>> I need to replicate the failing test for that. Which test is
>>> failing?
>>
>>
>> Pretty much the same as before. guest with vsock, managedsave and
>> restore.
> 
> If this isn't in our test suite I'm going to need exact steps.

Just get any libvirt guest, add
     <vsock model='virtio'>
       <cid auto='yes'/>
     </vsock>

to your libvirt xml. Start the guest (with the new xml).
Run virsh managedsave - qemu crashes. On x86 and s390.

