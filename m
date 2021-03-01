Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7AA3281E2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:12:03 +0100 (CET)
Received: from localhost ([::1]:56370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkDK-0001K2-8r
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxinxin.wang@huawei.com>)
 id 1lGkAp-0007Kv-06
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:09:27 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxinxin.wang@huawei.com>)
 id 1lGkAl-00008J-DE
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:09:26 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Dq3XR3fYxzYF0M;
 Mon,  1 Mar 2021 23:07:35 +0800 (CST)
Received: from dggema716-chm.china.huawei.com (10.3.20.80) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 1 Mar 2021 23:09:06 +0800
Received: from dggema771-chm.china.huawei.com (10.1.198.213) by
 dggema716-chm.china.huawei.com (10.3.20.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 1 Mar 2021 23:09:00 +0800
Received: from dggema771-chm.china.huawei.com ([10.9.128.123]) by
 dggema771-chm.china.huawei.com ([10.9.128.123]) with mapi id 15.01.2106.006;
 Mon, 1 Mar 2021 23:09:00 +0800
From: "Wangxin (Alexander)" <wangxinxin.wang@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [RFC]migration: stop/start device at the end of live migration
 concurrently
Thread-Topic: [RFC]migration: stop/start device at the end of live migration
 concurrently
Thread-Index: AdcOrIzBJVDdoqTXSMWIMcUnmEwV9w==
Date: Mon, 1 Mar 2021 15:09:00 +0000
Message-ID: <c716d92c659149f6bdb00c9aa642abf9@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.149.106]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangxinxin.wang@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "Wuchenye \(karot, Cloud Infrastructure Service
 Product Dept\)" <wuchenye@huawei.com>,
 "Zhoujian \(jay\)" <jianjay.zhou@huawei.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

We found that the downtime of migration will reach a few seconds when live
migrating a huge VM with 224vCPU/180GiB/16 vhost-user nics (x32 queues)/
24 vhost-user-blk disks(x4 queues), most of the time is spent in the
position of stopping the device at src and starting device at dst.

Our idea is to stop the device through multiple threads during the end of
migration. To be more specific, we create thread pool at the beginning of l=
ive
migraion, when migration thread call virtio_vmstate_change callback to stop=
 or
start device in vm_state_notify, it will submits request to thread pool to
handle the callback concurrently.

We live migrate the vm and count the cost time at different stages of
stopping/starting devices.

  -       -     -                 Cost: Original    With state change concu=
rrently
                get vring base             36ms          18ms
        disk    disable guest notify       48ms          32ms
                disable host notify        300ms         120ms
Src             get vring base             1376ms        294ms
        net     disable host notify        1011ms        116ms
                disable guest notify       59ms          40ms
 -       -      -
                enable guest notify        310ms         97ms
        net     set memtable               48ms          20ms
                enable host notify         2022ms        114ms=20
Dst             enable host notify         312ms         78ms
        disk    enable guest notify        32ms          23ms
                set memTable               16ms          10ms
Total Downtime                             5600ms        962ms

However, there are some side effects:
1. When disable host notify or guest notify concurrently, the vm will be cr=
ashed
due to disabling same notify at the different threads, we now add two diffe=
rent lock
to solve this problem, it is hacking to do so and may be resulting in other=
 problems.

2. As the QEMU BQL will be held by migration thread before stopping device =
in
migration_completion, there will be deadlock in the following scene:
migration_thread                              [thread 1]
  set_up_multithread
  ...
  migration_completion()# get QEMU BQL
    qemu_mutex_lock_iothread()
    vm_stop_force_state()
    ...
      submit stopping device request
      to thread pool
                                           virtio_vmstate_change
                                             virtio_set_status
                                             ...
                                               memory_region_transaction_be=
gin
                                               ...
                                                 prepare_mmio_access
                                                   qemu_mutex_iothread_lock=
ed()# N
                                                   qemu_mutex_lock_iothread=
()# deadlock

Now we add another lock to replace the BQL in this scene to solve the probl=
em,
but we think this is not reliable enough and has potential risk that other
processes will also use the QEMU BQL during the process of stopping device.=
 My
question is: how to deal with the conflict with QEMU BQL properly.

Any advice will be appreciated, thanks.

