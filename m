Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B64610E771
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 10:12:02 +0100 (CET)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibhkP-0002d3-7h
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 04:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <longpeng2@huawei.com>) id 1ibhjW-00025G-H2
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 04:11:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <longpeng2@huawei.com>) id 1ibhjV-0004cN-IF
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 04:11:06 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:53474 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <longpeng2@huawei.com>)
 id 1ibhjV-0004OR-6O
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 04:11:05 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 89C9D3186B0E22340C12;
 Mon,  2 Dec 2019 17:10:49 +0800 (CST)
Received: from [127.0.0.1] (10.177.246.209) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 2 Dec 2019 17:10:40 +0800
From: "Longpeng (Mike)" <longpeng2@huawei.com>
Subject: vfio_pin_map_dma cause synchronize_sched wait too long
To: Alex Williamson <alex.williamson@redhat.com>, <pbonzini@redhat.com>
Message-ID: <2e53a9f0-3225-d416-98ff-55bd337330bc@huawei.com>
Date: Mon, 2 Dec 2019 17:10:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.246.209]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 Gonglei <arei.gonglei@huawei.com>, Huangzhichao <huangzhichao@huawei.com>,
 "Longpeng\(Mike\)" <longpeng.mike@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi guys,

Suppose there're two VMs: VM1 is bind to node-0 and calling vfio_pin_map_dma(),
VM2 is a migrate incoming VM which bind to node-1. We found the vm_start( QEMU
function) of VM2 will take too long occasionally, the reason is as follow.

- VM2 -
qemu: vm_start
        vm_start_notify
          virtio_vmstate_change
            virtio_pci_vmstate_change
              virtio_pci_start_ioeventfd
                virtio_device_start_ioeventfd_impl
                  event_notifier_init
                    eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC) <-- too long
kern: sys_eventfd2
        get_unused_fd_flags
          __alloc_fd
            expand_files
              expand_fdtable
                synchronize_sched <-- too long

- VM1 -
The VM1 is doing vfio_pin_map_dma at the same time.

The CPU must finish vfio_pin_map_dma and then rcu-sched grace period can be
elapsed, so synchronize_sched would wait for a long time.

Is there any solution to this ? Any suggestion would be greatly appreciated, thanks!

-- 
Regards,
Longpeng(Mike)


