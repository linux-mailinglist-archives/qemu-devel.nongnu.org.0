Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC28590D79
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 10:37:47 +0200 (CEST)
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMQAq-0002eV-WC
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 04:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wanghao232@huawei.com>)
 id 1oMQ5c-0000ol-Fc
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 04:32:20 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:5169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wanghao232@huawei.com>)
 id 1oMQ5Z-0005JY-6l
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 04:32:20 -0400
Received: from kwepemi500011.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M3xh54y44zGpTc;
 Fri, 12 Aug 2022 16:30:29 +0800 (CST)
Received: from [10.174.185.207] (10.174.185.207) by
 kwepemi500011.china.huawei.com (7.221.188.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 16:31:56 +0800
Subject: [BUG] Qemu abort with error "kvm_mem_ioeventfd_add: error adding
 ioeventfd: File exists (17)"
To: <qemu-devel@nongnu.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Xiexiangyou <xiexiangyou@huawei.com>
Message-ID: <de9c479a-e144-17b6-3eb5-6d548fd176ac@huawei.com>
Date: Fri, 12 Aug 2022 16:31:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.207]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500011.china.huawei.com (7.221.188.124)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wanghao232@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Hao Wang <wanghao232@huawei.com>
From:  Hao Wang via <qemu-devel@nongnu.org>

Hi list,

When I did some tests in my virtual domain with live-attached virtio deivces, I got a coredump file of Qemu.

The error print from qemu is "kvm_mem_ioeventfd_add: error adding ioeventfd: File exists (17)".
And the call trace in the coredump file displays as below:
#0  0x0000ffff89acecc8 in ?? () from /usr/lib64/libc.so.6
#1  0x0000ffff89a8acbc in raise () from /usr/lib64/libc.so.6
#2  0x0000ffff89a78d2c in abort () from /usr/lib64/libc.so.6
#3  0x0000aaaabd7ccf1c in kvm_mem_ioeventfd_add (listener=<optimized out>, section=<optimized out>, match_data=<optimized out>, data=<optimized out>, e=<optimized out>) at ../accel/kvm/kvm-all.c:1607
#4  0x0000aaaabd6e0304 in address_space_add_del_ioeventfds (fds_old_nb=164, fds_old=0xffff5c80a1d0, fds_new_nb=160, fds_new=0xffff5c565080, as=0xaaaabdfa8810 <address_space_memory>)
    at ../softmmu/memory.c:795
#5  address_space_update_ioeventfds (as=0xaaaabdfa8810 <address_space_memory>) at ../softmmu/memory.c:856
#6  0x0000aaaabd6e24d8 in memory_region_commit () at ../softmmu/memory.c:1113
#7  0x0000aaaabd6e25c4 in memory_region_transaction_commit () at ../softmmu/memory.c:1144
#8  0x0000aaaabd394eb4 in pci_bridge_update_mappings (br=br@entry=0xaaaae755f7c0) at ../hw/pci/pci_bridge.c:248
#9  0x0000aaaabd394f4c in pci_bridge_write_config (d=0xaaaae755f7c0, address=44, val=<optimized out>, len=4) at ../hw/pci/pci_bridge.c:272
#10 0x0000aaaabd39a928 in rp_write_config (d=0xaaaae755f7c0, address=44, val=128, len=4) at ../hw/pci-bridge/pcie_root_port.c:39
#11 0x0000aaaabd6df328 in memory_region_write_accessor (mr=0xaaaae63898d0, addr=65580, value=<optimized out>, size=4, shift=<optimized out>, mask=<optimized out>, attrs=...) at ../softmmu/memory.c:494
#12 0x0000aaaabd6dcb6c in access_with_adjusted_size (addr=addr@entry=65580, value=value@entry=0xffff817adc78, size=size@entry=4, access_size_min=<optimized out>, access_size_max=<optimized out>,
    access_fn=access_fn@entry=0xaaaabd6df284 <memory_region_write_accessor>, mr=mr@entry=0xaaaae63898d0, attrs=attrs@entry=...) at ../softmmu/memory.c:556
#13 0x0000aaaabd6e0dc8 in memory_region_dispatch_write (mr=mr@entry=0xaaaae63898d0, addr=65580, data=<optimized out>, op=MO_32, attrs=attrs@entry=...) at ../softmmu/memory.c:1534
#14 0x0000aaaabd6d0574 in flatview_write_continue (fv=fv@entry=0xffff5c02da00, addr=addr@entry=275146407980, attrs=attrs@entry=..., ptr=ptr@entry=0xffff8aa8c028, len=len@entry=4,
    addr1=<optimized out>, l=<optimized out>, mr=mr@entry=0xaaaae63898d0) at /usr/src/debug/qemu-6.2.0-226.aarch64/include/qemu/host-utils.h:165
#15 0x0000aaaabd6d4584 in flatview_write (len=4, buf=0xffff8aa8c028, attrs=..., addr=275146407980, fv=0xffff5c02da00) at ../softmmu/physmem.c:3375
#16 address_space_write (as=<optimized out>, addr=275146407980, attrs=..., buf=buf@entry=0xffff8aa8c028, len=4) at ../softmmu/physmem.c:3467
#17 0x0000aaaabd6d462c in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=..., attrs@entry=..., buf=buf@entry=0xffff8aa8c028, len=<optimized out>, is_write=<optimized out>)
    at ../softmmu/physmem.c:3477
#18 0x0000aaaabd7cf6e8 in kvm_cpu_exec (cpu=cpu@entry=0xaaaae625dfd0) at ../accel/kvm/kvm-all.c:2970
#19 0x0000aaaabd7d09bc in kvm_vcpu_thread_fn (arg=arg@entry=0xaaaae625dfd0) at ../accel/kvm/kvm-accel-ops.c:49
#20 0x0000aaaabd94ccd8 in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:559


By printing more info in the coredump file, I found that the addr of fds_old[146] and fds_new[146] are same, but fds_old[146] belonged to a live-attached virtio-scsi device while fds_new[146] was owned by another live-attached virtio-net.
The reason why addr conflicted was then been found from vm's console log. Just before qemu aborted, the guest kernel crashed and kdump.service booted the dump-capture kernel where re-alloced address for the devices.
Because those virtio devices were live-attached after vm creating, different addr may been assigned to them in the dump-capture kernel:

the initial kernel booting log:
[    1.663297] pci 0000:00:02.1: BAR 14: assigned [mem 0x11900000-0x11afffff]
[    1.664560] pci 0000:00:02.1: BAR 15: assigned [mem 0x8001800000-0x80019fffff 64bit pref]

the dump-capture kernel booting log:
[    1.845211] pci 0000:00:02.0: BAR 14: assigned [mem 0x11900000-0x11bfffff]
[    1.846542] pci 0000:00:02.0: BAR 15: assigned [mem 0x8001800000-0x8001afffff 64bit pref]


I think directly aborting the qemu process may not be the best choice in this case cuz it will interrupt the work of kdump.service so that failed to generate memory dump of the crashed guest kernel.
Perhaps, IMO, the error could be simply ignored in this case and just let kdump to reboot the system after memory-dump finishing, but I failed to find a suitable judgment in the codes.

Any solution for this problem? Hope I can get some helps here.

Hao

