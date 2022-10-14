Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3865FEB2A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:51:48 +0200 (CEST)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojGPy-0006t2-FF
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ojGJP-0003Oy-0U
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:44:59 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ojGJN-0008OK-0r
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:44:58 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E75wVv020263;
 Fri, 14 Oct 2022 08:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ge8mhqYtumSiwf3fU01FXx7uQDnA7mQ0nkcWc0Prfiw=;
 b=tapB4aDQEZBTr+7LApb41dXh2BD0M7Rb4sfAHzV/vmKyXuuq9vV+9BOWPhg+xFMQygbM
 a6cDIzNdIAVstnQKZr4l7jOjVx4dHjM/+AAJ5WZJZVuFrmFMwlKvA8wZeEkhpT2qPa9J
 o6i5LFedC+IaQPpjXP7hmfWY2ZfrtTZ0vb3MqvsU/Gz/hRDVf/d67P3JRLUggExVeScA
 vToYx4GeNs0Bhvt3aSt7n+/MOjUHYbUrXk5R/E5HKv5ZgHCaeLoyU+zsEAJUCH8n5KGx
 6+twWec0vr3qWV8Ly9Nim+QzP0PTW1TZdFUQROqWGDmcaKpvMV4odYVM5hwAe6hdhlMQ zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6naws1s6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 08:44:54 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29E86QZv010832;
 Fri, 14 Oct 2022 08:44:53 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k6naws1r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 08:44:53 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29E8d9f2024567;
 Fri, 14 Oct 2022 08:44:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3k30u9gvaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 08:44:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 29E8jLpE50856262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 08:45:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F79B11C08B;
 Fri, 14 Oct 2022 08:44:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D356811C04A;
 Fri, 14 Oct 2022 08:44:48 +0000 (GMT)
Received: from [9.171.35.51] (unknown [9.171.35.51])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Oct 2022 08:44:48 +0000 (GMT)
Message-ID: <df661f39-b5da-65c9-ec13-27a218717060@linux.ibm.com>
Date: Fri, 14 Oct 2022 10:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Regression save/restore of vsock: (was [PULL 07/55] hw/virtio:
 move vm_running check to virtio_device_started)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com
References: <20221010172813.204597-1-mst@redhat.com>
 <20221010172813.204597-8-mst@redhat.com>
 <3a002a6a-9135-ad45-3fed-7dd270450d0b@linux.ibm.com>
 <87pmeuol2i.fsf@linaro.org>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <87pmeuol2i.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: phs1oAaOgbc-34Kqf4j7x-le1aWRMeBx
X-Proofpoint-ORIG-GUID: jd4262-4cFjXoANNaWc3LdU2-nkedljq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_04,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=945 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140049
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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


Am 14.10.22 um 10:37 schrieb Alex Bennée:
> 
> Christian Borntraeger <borntraeger@linux.ibm.com> writes:
> 
>> Am 10.10.22 um 19:29 schrieb Michael S. Tsirkin:
>>> From: Alex Bennée <alex.bennee@linaro.org>
>>> All the boilerplate virtio code does the same thing (or should at
>>> least) of checking to see if the VM is running before attempting to
>>> start VirtIO. Push the logic up to the common function to avoid
>>> getting a copy and paste wrong.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-Id: <20220802095010.3330793-11-alex.bennee@linaro.org>
>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> This results in a regression for our s390x CI when doing save/restore of guests with vsock:
>>
>>
>>                  #1  0x000003ff9a248580 raise (libc.so.6 + 0x48580)
>>                  #2  0x000003ff9a22b5c0 abort (libc.so.6 + 0x2b5c0)
>>                  #3  0x000003ff9a2409da __assert_fail_base (libc.so.6 + 0x409da)
>>                  #4  0x000003ff9a240a4e __assert_fail (libc.so.6 + 0x40a4e)
>>                  #5  0x000002aa2d69a066 vhost_vsock_common_pre_save (qemu-system-s390x + 0x39a066)
>>                  #6  0x000002aa2d55570e vmstate_save_state_v (qemu-system-s390x + 0x25570e)
>>                  #7  0x000002aa2d556218 vmstate_save_state (qemu-system-s390x + 0x256218)
>>                  #8 0x000002aa2d570ba4
>> qemu_savevm_state_complete_precopy_non_iterable (qemu-system-s390x +
>> 0x270ba4)
>>                  #9  0x000002aa2d5710b6 qemu_savevm_state_complete_precopy (qemu-system-s390x + 0x2710b6)
>>                  #10 0x000002aa2d564d0e migration_completion (qemu-system-s390x + 0x264d0e)
>>                  #11 0x000002aa2d8db25c qemu_thread_start (qemu-system-s390x + 0x5db25c)
>>                  #12 0x000003ff9a296248 start_thread (libc.so.6 + 0x96248)
>>                  #13 0x000003ff9a31183e thread_start (libc.so.6 + 0x11183e)
> 
> Which test does this break?

migrate to file and restore.

> 
> Looking at the change the only thing I can think of is there is a subtle
> change in the order of checks because if the device is set as
> use_started we return the result regardless of vm or config state:
> 
>      if (vdev->use_started) {
>          return vdev->started;
>      }
> 
> Could some printfs confirm that?

Right. The problem is we now ignore the vm state and thus run into the assertion in vhost_vsock_common_pre_save.
Removing the asserting then results in virtio errors, which really indicates that the device must not be started.

