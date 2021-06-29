Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C1E3B7022
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:35:25 +0200 (CEST)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyA9M-0004Be-Oj
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lyA8B-0003FF-L9; Tue, 29 Jun 2021 05:34:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lyA83-0006eH-Vh; Tue, 29 Jun 2021 05:34:11 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GDfNP31DNzZnkT;
 Tue, 29 Jun 2021 17:30:45 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 29 Jun 2021 17:33:49 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 29 Jun 2021 17:33:49 +0800
To: Peter Maydell <peter.maydell@linaro.org>, Eric Auger
 <eric.auger@redhat.com>, "open list:ARM cores" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: [question] Shall we flush ITS tables into guest RAM when shutdown the
 VM?
Message-ID: <ef4df56d-5b60-99f1-fec6-fe2e62434d3f@huawei.com>
Date: Tue, 29 Jun 2021 17:33:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
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
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

Accroding to the patch cddafd8f353d2d251b1a5c6c948a577a85838582,
our original intention is to flush the ITS tables into guest RAM at the 
point
RUN_STATE_FINISH_MIGRATE, but sometimes the VM gets stopped before
migration launch so let's simply flush the tables each time the VM gets
stopped.

But I encountered an error when I shut down the virtual machine.

> qemu-system-aarch64: KVM_SET_DEVICE_ATTR failed: Group 4 attr 
> 0x0000000000000001: Permission denied

Shall we need to flush ITS tables into guest RAM when 'shutdown' the VM?
Or do you think this error is normal?

This error occurs in the following scenario:
Kunpeng 920 、enable GICv4、passthrough a accelerator Hisilicon SEC to the 
VM.

The flow is as follows:

QEMU:
vm_shutdown
     do_vm_stop(RUN_STATE_SHUTDOWN)
         vm_state_notify
             ...
             vm_change_state_handler (hw/intc/arm_gicv3_its_kvm.c)
                 kvm_device_access

Kernel:
     vgic_its_save_tables_v0
         vgic_its_save_device_tables
             vgic_its_save_itt

There is such a code in vgic_its_save_itt():
> /*
>  * If an LPI carries the HW bit, this means that this
>  * interrupt is controlled by GICv4, and we do not
>  * have direct access to that state without GICv4.1.
>  * Let's simply fail the save operation...
>  */
> if (ite->irq->hw && !kvm_vgic_global_state.has_gicv4_1)
>           return -EACCES;

Looking forward to your reply.

Thanks,
Kunkun Jiang







