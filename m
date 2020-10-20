Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080428FDED
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 08:00:21 +0200 (CEST)
Received: from localhost ([::1]:48408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTImq-0005Ay-A2
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 02:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kTIhd-0006Ub-Em
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 01:54:57 -0400
Received: from mga01.intel.com ([192.55.52.88]:36641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1kTIhb-0005IO-JY
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 01:54:57 -0400
IronPort-SDR: FQTV2fXCtT414RUlfjyiuiJc/qAO6QXP92k0gbKe4Jmx8ldb9WmOk6jso0fHKtYF+aK1zJedzv
 jkULA8uJi2zQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9775"; a="184094675"
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="184094675"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 22:54:54 -0700
IronPort-SDR: cjWQPdLr8scN6dRxW2Gy8Y+otH8YJ+4DWoZvuFq2EetuAWjdbZjxGauEKsh1c/w3+iBBWgMMuM
 kBI8GOUcJJiQ==
X-IronPort-AV: E=Sophos;i="5.77,381,1596524400"; d="scan'208";a="464572865"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 22:54:51 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH V2 09/10] net/colo-compare.c: Add secondary old packet
 detection
Date: Fri, 16 Oct 2020 13:52:07 +0800
Message-Id: <20201016055208.7969-10-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016055208.7969-1-chen.zhang@intel.com>
References: <20201016055208.7969-1-chen.zhang@intel.com>
Received-SPF: pass client-ip=192.55.52.88; envelope-from=chen.zhang@intel.com;
 helo=mga01.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/16 01:54:36
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.996,
 FROM_WSP_TRAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Derek Su <dereksu@qnap.com>, Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Detect queued secondary packet to sync VM state in time.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 net/colo-compare.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 1263203e7f..0c87fd9e33 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -636,19 +636,26 @@ void colo_compare_unregister_notifier(Notifier *notify)
 static int colo_old_packet_check_one_conn(Connection *conn,
                                           CompareState *s)
 {
-    GList *result = NULL;
-
-    result = g_queue_find_custom(&conn->primary_list,
-                                 &s->compare_timeout,
-                                 (GCompareFunc)colo_old_packet_check_one);
+    if (!g_queue_is_empty(&conn->primary_list)) {
+        if (g_queue_find_custom(&conn->primary_list,
+                                &s->compare_timeout,
+                                (GCompareFunc)colo_old_packet_check_one))
+            goto out;
+    }
 
-    if (result) {
-        /* Do checkpoint will flush old packet */
-        colo_compare_inconsistency_notify(s);
-        return 0;
+    if (!g_queue_is_empty(&conn->secondary_list)) {
+        if (g_queue_find_custom(&conn->secondary_list,
+                                &s->compare_timeout,
+                                (GCompareFunc)colo_old_packet_check_one))
+            goto out;
     }
 
     return 1;
+
+out:
+    /* Do checkpoint will flush old packet */
+    colo_compare_inconsistency_notify(s);
+    return 0;
 }
 
 /*
-- 
2.17.1


