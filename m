Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727AC2DA879
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 08:26:02 +0100 (CET)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp4if-0005nO-9d
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 02:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp4dI-0001NC-Db; Tue, 15 Dec 2020 02:20:29 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp4d8-0008SV-FF; Tue, 15 Dec 2020 02:20:27 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cw8lR607jzhsXP;
 Tue, 15 Dec 2020 15:19:31 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 15:19:57 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Peter Xu" <peterx@redhat.com>
Subject: [PATCH 2/2] accel: kvm: Add aligment check for kvm_log_clear_one_slot
Date: Tue, 15 Dec 2020 15:19:48 +0800
Message-ID: <20201215071948.23940-3-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20201215071948.23940-1-zhukeqian1@huawei.com>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The parameters start and size are transfered from QEMU memory
emulation layer. It can promise that they are TARGET_PAGE_SIZE
aligned. However, KVM needs they are qemu_real_page_size aligned.

Though no caller breaks this aligned requirement currently, we'd
better add an explicit check to avoid future breaking.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 accel/kvm/kvm-all.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index c5e06288eb..3d0e3aa872 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -701,6 +701,11 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
     unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
     int ret;
 
+    /* Make sure start and size are psize aligned */
+    if (!QEMU_IS_ALIGNED(start, psize) || !QEMU_IS_ALIGNED(size, psize)) {
+        return -EINVAL;
+    }
+
     /*
      * We need to extend either the start or the size or both to
      * satisfy the KVM interface requirement.  Firstly, do the start
-- 
2.23.0


