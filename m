Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA8F619DE6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:59:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or01Y-0001lK-2P; Fri, 04 Nov 2022 12:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1or01V-0001kr-5d
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:58:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1or01Q-0006jp-Py
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:58:28 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4FJ41k020747;
 Fri, 4 Nov 2022 16:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dPoKPHMqPYHzq8j2WPQLuET57f3msdpQlXvMyx20GM0=;
 b=pXb4HarTd90iNImzJ7Tk7EamCvyC4dARAFC6ZWvtUM16Ckbnhpj3+vnO0Y/dpah9u9JX
 jCSdxsx3rEfIvK5MWqqcqwvMX6JDm/g6iA9YY90vEywivfCjlIYf9ufyw3UJAbSwhK+O
 Tv3VZHUDakVkPOlv+Nvzc+OXtzn8QyXjTRraB4EPp+ilmZnumkWMJp+hIC1ldTQcMcha
 ISxwIlOY2+AU1TUjWYdisAqXcJy+J6lnpu05+RodmNqD1U2Z0MneKfJiqudHXgBI4iq7
 5jZJmPcYoTingbg4PM1uIkPX3W6v+ScGJOtK9MUdMzJvQVnbUgLADKXqxKB6PUyWoKsO JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpjref70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 16:58:22 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4Dd4KO025646;
 Fri, 4 Nov 2022 16:58:22 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpjref6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 16:58:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4GoiRG010838;
 Fri, 4 Nov 2022 16:58:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3kgut9anng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 16:58:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A4GwIU259900296
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Nov 2022 16:58:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11BA511C04C;
 Fri,  4 Nov 2022 16:58:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCDE511C04A;
 Fri,  4 Nov 2022 16:58:17 +0000 (GMT)
Received: from [9.179.4.209] (unknown [9.179.4.209])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Nov 2022 16:58:17 +0000 (GMT)
Message-ID: <e858e92d-79db-9e75-f3c2-abd40974dc9f@linux.ibm.com>
Date: Fri, 4 Nov 2022 17:58:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH] virtio: re-order vm_running and use_started checks
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20221014132108.2559156-1-alex.bennee@linaro.org>
 <20221104115340-mutt-send-email-mst@kernel.org>
 <302d7a5f-069a-f071-b1c2-56bdbb1f625f@linux.ibm.com>
 <20221104121339-mutt-send-email-mst@kernel.org>
 <dc6522b4-0bae-d0b9-431a-6c635fe0492c@linux.ibm.com>
In-Reply-To: <dc6522b4-0bae-d0b9-431a-6c635fe0492c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HzqpQrKz5qUvOZCZjdjtYXykTmRnqHGt
X-Proofpoint-ORIG-GUID: 7xO-id2E_VZufoVouowM2anw0dQST8m5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040105
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 04.11.22 um 17:51 schrieb Christian Borntraeger:
> 
> 
> Am 04.11.22 um 17:14 schrieb Michael S. Tsirkin:
>> On Fri, Nov 04, 2022 at 04:59:35PM +0100, Christian Borntraeger wrote:
>>>
>>>
>>> Am 04.11.22 um 16:56 schrieb Michael S. Tsirkin:
>>>> On Fri, Oct 14, 2022 at 02:21:08PM +0100, Alex Bennée wrote:
>>>>> During migration the virtio device state can be restored before we
>>>>> restart the VM. As no devices can be running while the VM is paused it
>>>>> makes sense to bail out early in that case.
>>>>>
>>>>> This returns the order introduced in:
>>>>>
>>>>>    9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
>>>>>
>>>>> to what virtio-sock was doing longhand.
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
>>>>
>>>>
>>>> What happens now:
>>>>
>>>> with this applied I get:
>>>>
>>>> https://gitlab.com/mitsirkin/qemu/-/pipelines/685829158/failures
>>>>
>>>> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
>>>> stderr:
>>>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
>>>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-QLKXU1/reconnect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-QLKXU1/reconnect.sock,server=on
>>>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
>>>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: -chardev socket,id=chr-connect-fail,path=/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on
>>>> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to read msg header. Read 0 instead of 12. Original request 1.
>>>> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: vhost_backend_init failed: Protocol error
>>>> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to init vhost_net for queue 0
>>>> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on
>>>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
>>>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: -chardev socket,id=chr-flags-mismatch,path=/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=on
>>>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
>>>> qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
>>>> qemu-system-arm: unable to start vhost net: 22: falling back on userspace virtio
>>>> vhost lacks feature mask 0x40000000 for backend
>>>> qemu-system-arm: failed to init vhost_net for queue 0
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
>>>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 3 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
>>>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
>>>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
>>>> qemu-system-arm: Failed to set msg fds.
>>>> qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
>>>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
>>>> qemu-system-arm: vhost VQ 0 ring restore failed: -5: Input/output error (5)
>>>> qemu-system-arm: ../hw/virtio/virtio-bus.c:211: void virtio_bus_release_ioeventfd(VirtioBusState *): Assertion `bus->ioeventfd_grabbed != 0' failed.
>>>> ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
>>>> **
>>>> ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [8735]) failed unexpectedly
>>>> (test program exited with status code -6)
>>>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>>>
>>>>
>>>>
>>>>
>>>> without this it passes:
>>>>
>>>> https://gitlab.com/mitsirkin/qemu/-/jobs/3275949777
>>>>
>>>>
>>>> this only triggers under github, clang-system job.
>>>> trying to decide what to do now. revert just this?
>>> When we revert this save/restore for vsock is broken. Not sure, maybe we must use a more fine-grained fix as outlined in my initial mail?
>>
>>
>>
>> Could you take a look here pls?
>>
>> https://gitlab.com/mitsirkin/qemu/-/tree/testrevert1
> 
> I kicked of our regression test suite for s390.

This branch also seems to fix my original problem.
Regression is still running but looks good so far.

