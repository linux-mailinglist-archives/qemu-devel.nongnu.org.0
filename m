Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13E55FEDD8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 14:12:08 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojJXr-00006m-6H
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 08:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ojJLE-0001pc-FJ
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:59:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ojJLA-0006Ih-6N
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:59:03 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EBwMWX013287;
 Fri, 14 Oct 2022 11:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=j0inD2W7mpQlMGHysOuaabyIle0Zfex/rprt99z5/yU=;
 b=eP2RY4t0JmwmMKSidBG3rR8AY0CM716KlZ+FlGOqXhHG9OR6NhGp5TpyhkDADOOl/4fs
 25aSthqerVdcX0YksOH0/4cWrgX8/v5nmvxyO+dtDlnPxtJyE2YnRqjK8vwNYuHbDWQO
 H+tXtC8uJP0yIzC1/WJVulocBD21ceSNsfh6gBfjxc1IjAd6y4R5mgE0o22EGIp2f40s
 ZIgvrKVFz8kkPggePoJ3U5EpghY6/Bat+zjaXOsvHGH74cjK9O5k6F3xCvHoowTXQv7N
 pnPG3GmKXdcGf2Gz4Iwl3x0AKF+pCJpbaRAHdX0+1QMdsZLCuqDmZeG4hRFL0dhJmeIl pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6dc9ngx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 11:58:57 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29EBwuoP017261;
 Fri, 14 Oct 2022 11:58:56 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6dc9ngwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 11:58:56 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29EBq8s0026716;
 Fri, 14 Oct 2022 11:58:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3k30u9euw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 11:58:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29EBwpsd47645056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 11:58:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C22552050;
 Fri, 14 Oct 2022 11:58:51 +0000 (GMT)
Received: from [9.171.35.51] (unknown [9.171.35.51])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 18A185204E;
 Fri, 14 Oct 2022 11:58:51 +0000 (GMT)
Message-ID: <f82d0672-00e0-fb6f-fcce-1c9dd605b95d@linux.ibm.com>
Date: Fri, 14 Oct 2022 13:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Regression save/restore of vsock: (was [PULL 07/55] hw/virtio:
 move vm_running check to virtio_device_started)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com
References: <20221010172813.204597-1-mst@redhat.com>
 <20221010172813.204597-8-mst@redhat.com>
 <3a002a6a-9135-ad45-3fed-7dd270450d0b@linux.ibm.com>
 <1c400131-59f6-f14f-e7e0-3871cc0d1815@linux.ibm.com>
 <87czauoe6y.fsf@linaro.org>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <87czauoe6y.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pZgifqZDS3xDw6Nho_XE4FaE6_MfiYdh
X-Proofpoint-ORIG-GUID: kLLMdtxpZAL5-sOACGNlFziws910Qfq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_06,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210140066
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.856,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 14.10.22 um 13:07 schrieb Alex Bennée:
> 
> Christian Borntraeger <borntraeger@linux.ibm.com> writes:
> 
>> Am 14.10.22 um 09:30 schrieb Christian Borntraeger:
>>> Am 10.10.22 um 19:29 schrieb Michael S. Tsirkin:
>>>> From: Alex Bennée <alex.bennee@linaro.org>
>>>>
>>>> All the boilerplate virtio code does the same thing (or should at
>>>> least) of checking to see if the VM is running before attempting to
>>>> start VirtIO. Push the logic up to the common function to avoid
>>>> getting a copy and paste wrong.
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Message-Id: <20220802095010.3330793-11-alex.bennee@linaro.org>
>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>> This results in a regression for our s390x CI when doing
>>> save/restore of guests with vsock:
>>>                   #1  0x000003ff9a248580 raise (libc.so.6 + 0x48580)
>>>                   #2  0x000003ff9a22b5c0 abort (libc.so.6 + 0x2b5c0)
>>>                   #3  0x000003ff9a2409da __assert_fail_base (libc.so.6 + 0x409da)
>>>                   #4  0x000003ff9a240a4e __assert_fail (libc.so.6 + 0x40a4e)
>>>                   #5  0x000002aa2d69a066 vhost_vsock_common_pre_save (qemu-system-s390x + 0x39a066)
>>>                   #6  0x000002aa2d55570e vmstate_save_state_v (qemu-system-s390x + 0x25570e)
>>>                   #7  0x000002aa2d556218 vmstate_save_state (qemu-system-s390x + 0x256218)
>>>                   #8  0x000002aa2d570ba4
>>> qemu_savevm_state_complete_precopy_non_iterable (qemu-system-s390x +
>>> 0x270ba4)
>>>                   #9  0x000002aa2d5710b6 qemu_savevm_state_complete_precopy (qemu-system-s390x + 0x2710b6)
>>>                   #10 0x000002aa2d564d0e migration_completion (qemu-system-s390x + 0x264d0e)
>>>                   #11 0x000002aa2d8db25c qemu_thread_start (qemu-system-s390x + 0x5db25c)
>>>                   #12 0x000003ff9a296248 start_thread (libc.so.6 + 0x96248)
>>>                   #13 0x000003ff9a31183e thread_start (libc.so.6 + 0x11183e)
>>>
>>
>>
>> Something like
>> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>> index 7dc3c7393122..b4d056ae6f01 100644
>> --- a/hw/virtio/vhost-vsock.c
>> +++ b/hw/virtio/vhost-vsock.c
>> @@ -73,6 +73,10 @@ static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
>>       bool should_start = virtio_device_started(vdev, status);
>>       int ret;
>>   +    if (!vdev->vm_running) {
>> +        should_start = false;
>> +    }
>> +
>>       if (vhost_dev_is_started(&vvc->vhost_dev) == should_start) {
>>           return;
>>       }
>>
>> helps.
>>
>> The problem seems to be that virtio_device_started does ignore
>> vm_running when use_start is set.
> 
> Wouldn't it make more sense to re-order the check there, something like:
> 
>    static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
>    {
>        if (!vdev->vm_running) {
>            return false;
>        }
> 
>        if (vdev->use_started) {
>            return vdev->started;
>        }
> 
>        return status & VIRTIO_CONFIG_S_DRIVER_OK;
>    }

That does work as well. (and it restores the original ordering so that makes sense).

> 
> Is the problem that vdev->started gets filled during the migration but
> because the VM isn't running yet we can never actually run?

I dont know.

