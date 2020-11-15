Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA952B3550
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 15:33:17 +0100 (CET)
Received: from localhost ([::1]:36766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keJ5g-0004M8-98
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 09:33:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1keJ4f-0003l2-3e; Sun, 15 Nov 2020 09:32:13 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1keJ4W-0008CP-Kk; Sun, 15 Nov 2020 09:32:12 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CYvlb2S1Zz15JTD;
 Sun, 15 Nov 2020 22:31:23 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Sun, 15 Nov 2020 22:31:28 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
Subject: [RFC] vfio-pci/migration: Dirty logging of the Memory BAR region?
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Message-ID: <fd18627a-e012-1af8-9d9f-9ae8a1415258@huawei.com>
Date: Sun, 15 Nov 2020 22:31:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yuzenghui@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 09:31:36
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi folks,

While trying the new vfio-pci migration on my arm64 server, I noticed an
error at the very beginning:

qemu-system-aarch64: kvm_set_user_memory_region: 
KVM_SET_USER_MEMORY_REGION failed, slot=5, start=0x8000000000, 
size=0x100000: Invalid argument

The reason is that we've registered the Memory BAR region as ram device
region (mr->ram_device is set) and tried to track dirty pages of this
region during migration.  QEMU tries to request tracking of it (via kvm
memory listener's log_start() callback) whilst KVM/arm64 clearly refuses
to do so [1]:

 > int kvm_arch_prepare_memory_region(struct kvm *kvm, ...)
 > {
 > 		/* IO region dirty page logging not allowed */
 > 		if (memslot->flags & KVM_MEM_LOG_DIRTY_PAGES) {
 > 			ret = -EINVAL;
 > 			goto out;
 > 		}
 > }

If I understand things correctly, the Memory BAR region generally
contains internal device-specific registers which shouldn't (and can't)
be tracked by QEMU's dirty logging mechanism.  I've patched QEMU with
the following diff and it seems work for me, but all of these still
require for comments.


diff --git a/softmmu/memory.c b/softmmu/memory.c
index 71951fe4dc..0958db1a08 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1806,7 +1806,10 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
  uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
  {
      uint8_t mask = mr->dirty_log_mask;
-    if (global_dirty_log && (mr->ram_block || 
memory_region_is_iommu(mr))) {
+    RAMBlock *rb = mr->ram_block;
+
+    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
+                             memory_region_is_iommu(mr))) {
          mask |= (1 << DIRTY_MEMORY_MIGRATION);
      }
      return mask;


Thanks,
Zenghui

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kvm/mmu.c

