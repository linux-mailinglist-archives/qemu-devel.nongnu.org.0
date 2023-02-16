Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05B6999C0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:19:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgyu-00086s-4n; Thu, 16 Feb 2023 11:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pSgyd-0007yA-J9
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:19 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pSgyb-000532-Oo
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:19:19 -0500
HMM_SOURCE_IP: 172.18.0.188:50698.1319324123
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.27 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 6E2F22800E1;
 Fri, 17 Feb 2023 00:19:09 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([118.116.19.27])
 by app0023 with ESMTP id d38a131cea4c4d9391f8998fd4db1557 for
 qemu-devel@nongnu.org; Fri, 17 Feb 2023 00:19:14 CST
X-Transaction-ID: d38a131cea4c4d9391f8998fd4db1557
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 118.116.19.27
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH v4 02/10] softmmu/dirtylimit: Add parameter check for hmp
 "set_vcpu_dirty_limit"
Date: Fri, 17 Feb 2023 00:18:31 +0800
Message-Id: <1ee7b30a16ebc76bf5503a7c5a8919f3d813edbd.1676563222.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

dirty_rate paraemter of hmp command "set_vcpu_dirty_limit" is invalid
if less than 0, so add parameter check for it.

Note that this patch also delete the unsolicited help message and
clean up the code.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 softmmu/dirtylimit.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
index 065ed18afc..dcab9bf2b1 100644
--- a/softmmu/dirtylimit.c
+++ b/softmmu/dirtylimit.c
@@ -514,14 +514,15 @@ void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict)
     int64_t cpu_index = qdict_get_try_int(qdict, "cpu_index", -1);
     Error *err = NULL;
 
-    qmp_set_vcpu_dirty_limit(!!(cpu_index != -1), cpu_index, dirty_rate, &err);
-    if (err) {
-        hmp_handle_error(mon, err);
-        return;
+    if (dirty_rate < 0) {
+        error_setg(&err, "invalid dirty page limit %ld", dirty_rate);
+        goto out;
     }
 
-    monitor_printf(mon, "[Please use 'info vcpu_dirty_limit' to query "
-                   "dirty limit for virtual CPU]\n");
+    qmp_set_vcpu_dirty_limit(!!(cpu_index != -1), cpu_index, dirty_rate, &err);
+
+out:
+    hmp_handle_error(mon, err);
 }
 
 static struct DirtyLimitInfo *dirtylimit_query_vcpu(int cpu_index)
-- 
2.17.1


