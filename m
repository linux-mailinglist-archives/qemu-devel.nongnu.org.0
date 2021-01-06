Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758272EBA68
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 08:19:27 +0100 (CET)
Received: from localhost ([::1]:49260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx36M-0006nK-86
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 02:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kx34Z-0006Dk-VI; Wed, 06 Jan 2021 02:17:35 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kx34Y-0000Xm-BJ; Wed, 06 Jan 2021 02:17:35 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D9gdW66kzzMG23;
 Wed,  6 Jan 2021 15:16:15 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.184.42) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 15:17:18 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>
Subject: [PATCH v2] Docs/RCU: Correct sample code of qatomic_rcu_set
Date: Wed, 6 Jan 2021 15:17:10 +0800
Message-ID: <20210106071710.15836-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.184.42]
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correct sample code to avoid confusing readers.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Cc: qemu-trivial@nongnu.org
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---

v2:
 - Add Cc and R-b.

---
 docs/devel/rcu.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/rcu.txt b/docs/devel/rcu.txt
index cdf002edd8..2e6cc607a1 100644
--- a/docs/devel/rcu.txt
+++ b/docs/devel/rcu.txt
@@ -392,7 +392,7 @@ Instead, we store the size of the array with the array itself:
 
             /* Removal phase.  */
             old_array = global_array;
-            qatomic_rcu_set(&new_array->data, new_array);
+            qatomic_rcu_set(&global_array, new_array);
             synchronize_rcu();
 
             /* Reclamation phase.  */
-- 
2.19.1


