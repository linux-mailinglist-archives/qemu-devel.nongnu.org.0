Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0780548520
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:31:24 +0200 (CEST)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jE3-0002NC-3G
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1o0j9f-0008PM-H7
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:26:51 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1o0j9d-0001sS-7l
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:26:51 -0400
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LM9l02wydzjXZw;
 Mon, 13 Jun 2022 20:25:32 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 20:26:35 +0800
Subject: [Bug] Take more 150s to boot qemu on ARM64
To: <paulmck@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <linuxarm@huawei.com>
Message-ID: <36a0c658-ee5d-3a1c-416c-c041dc344bff@hisilicon.com>
Date: Mon, 13 Jun 2022 20:26:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga01-in.huawei.com
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
Reply-to:  "chenxiang (M)" <chenxiang66@hisilicon.com>
From:  "chenxiang (M)" via <qemu-devel@nongnu.org>

Hi all,

I encounter a issue with kernel 5.19-rc1 on a ARM64 board:  it takes 
about 150s between beginning to run qemu command and beginng to boot 
Linux kernel ("EFI stub: Booting Linux Kernel...").

But in kernel 5.18-rc4, it only takes about 5s. I git bisect the kernel 
code and it finds c2445d387850 ("srcu: Add contention check to 
call_srcu() srcu_data ->lock acquisition").

The qemu (qemu version is 6.2.92) command i run is :

./qemu-system-aarch64 -m 4G,slots=4,maxmem=8g \
--trace "kvm*" \
-cpu host \
-machine virt,accel=kvm,gic-version=3  \
-machine smp.cpus=2,smp.sockets=2 \
-no-reboot \
-nographic \
-monitor unix:/home/cx/qmp-test,server,nowait \
-bios /home/cx/boot/QEMU_EFI.fd \
-kernel /home/cx/boot/Image  \
-device 
pcie-root-port,port=0x8,chassis=1,id=net1,bus=pcie.0,multifunction=on,addr=0x1 
\
-device vfio-pci,host=7d:01.3,id=net0 \
-device virtio-blk-pci,drive=drive0,id=virtblk0,num-queues=4  \
-drive file=/home/cx/boot/boot_ubuntu.img,if=none,id=drive0 \
-append "rdinit=init console=ttyAMA0 root=/dev/vda rootfstype=ext4 rw " \
-net none \
-D /home/cx/qemu_log.txt

I am not familiar with rcu code, and don't know how it causes the issue. 
Do you have any idea about this issue?


Best Regard,

Xiang Chen



