Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0555A2DA874
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 08:22:53 +0100 (CET)
Received: from localhost ([::1]:34302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp4fb-0002ZF-JL
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 02:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp4dH-0001N5-Li; Tue, 15 Dec 2020 02:20:29 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp4d8-0008R9-El; Tue, 15 Dec 2020 02:20:27 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cw8lL4nTgz15f1g;
 Tue, 15 Dec 2020 15:19:26 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 15:19:56 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Peter Xu" <peterx@redhat.com>
Subject: [PATCH 1/2] accel: kvm: Fix memory waste under mismatch page size
Date: Tue, 15 Dec 2020 15:19:47 +0800
Message-ID: <20201215071948.23940-2-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20201215071948.23940-1-zhukeqian1@huawei.com>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
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
Cc: jiangkunkun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When handle dirty log, we face qemu_real_host_page_size and
TARGET_PAGE_SIZE. The first one is the granule of KVM dirty
bitmap, and the second one is the granule of QEMU dirty bitmap.

Generally speaking, qemu_real_host_page_size >= TARGET_PAGE_SIZE,
so misuse TARGET_PAGE_SIZE to init kvmslot dirty_bmap may waste
memory. For example, when qemu_real_host_page_size is 64K and
TARGET_PAGE_SIZE is 4K, this bugfix can save 93.75% memory.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 accel/kvm/kvm-all.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index baaa54249d..c5e06288eb 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -620,8 +620,12 @@ static void kvm_memslot_init_dirty_bitmap(KVMSlot *mem)
      * too, in most cases).
      * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
      * a hope that sizeof(long) won't become >8 any time soon.
+     *
+     * Note: the granule of kvm dirty log is qemu_real_host_page_size.
+     * And mem->memory_size is aligned to it (otherwise this mem can't
+     * be registered to KVM).
      */
-    hwaddr bitmap_size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
+    hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
                                         /*HOST_LONG_BITS*/ 64) / 8;
     mem->dirty_bmap = g_malloc0(bitmap_size);
 }
-- 
2.23.0


