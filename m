Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DCA2D23F8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 07:57:50 +0100 (CET)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmWwX-00080X-F9
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 01:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kmWrp-000528-Gm
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 01:52:57 -0500
Received: from smtp.h3c.com ([60.191.123.56]:54536 helo=h3cspam01-ex.h3c.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tu.guoyi@h3c.com>) id 1kmWrl-0004rl-6F
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 01:52:57 -0500
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([10.8.0.66])
 by h3cspam01-ex.h3c.com with ESMTP id 0B86qVB8002961;
 Tue, 8 Dec 2020 14:52:31 +0800 (GMT-8)
 (envelope-from tu.guoyi@h3c.com)
Received: from localhost.localdomain (10.125.33.161) by
 DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 8 Dec 2020 14:52:33 +0800
From: Tuguoyi <tu.guoyi@h3c.com>
To: Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: [PATCH 1/2] savevm: Remove dead code in save_snapshot()
Date: Tue, 8 Dec 2020 14:53:35 +0800
Message-ID: <1607410416-13563-2-git-send-email-tu.guoyi@h3c.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607410416-13563-1-git-send-email-tu.guoyi@h3c.com>
References: <1607410416-13563-1-git-send-email-tu.guoyi@h3c.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.125.33.161]
X-ClientProxiedBy: BJSMTP01-EX.srv.huawei-3com.com (10.63.20.132) To
 DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66)
X-DNSRBL: 
X-MAIL: h3cspam01-ex.h3c.com 0B86qVB8002961
Received-SPF: pass client-ip=60.191.123.56; envelope-from=tu.guoyi@h3c.com;
 helo=h3cspam01-ex.h3c.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: tuguoyi@outlook.com, qemu-devel@nongnu.org, Tuguoyi <tu.guoyi@h3c.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The snapshot in each bs is deleted at the beginning, so there is no need
to find the snapshot again.

Signed-off-by: Tuguoyi <tu.guoyi@h3c.com>
---
 migration/savevm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 5f937a2..601b514 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2728,7 +2728,7 @@ int qemu_load_device_state(QEMUFile *f)
 int save_snapshot(const char *name, Error **errp)
 {
     BlockDriverState *bs, *bs1;
-    QEMUSnapshotInfo sn1, *sn = &sn1, old_sn1, *old_sn = &old_sn1;
+    QEMUSnapshotInfo sn1, *sn = &sn1;
     int ret = -1, ret2;
     QEMUFile *f;
     int saved_vm_running;
@@ -2797,13 +2797,7 @@ int save_snapshot(const char *name, Error **errp)
     }
 
     if (name) {
-        ret = bdrv_snapshot_find(bs, old_sn, name);
-        if (ret >= 0) {
-            pstrcpy(sn->name, sizeof(sn->name), old_sn->name);
-            pstrcpy(sn->id_str, sizeof(sn->id_str), old_sn->id_str);
-        } else {
-            pstrcpy(sn->name, sizeof(sn->name), name);
-        }
+        pstrcpy(sn->name, sizeof(sn->name), name);
     } else {
         /* cast below needed for OpenBSD where tv_sec is still 'long' */
         localtime_r((const time_t *)&tv.tv_sec, &tm);
-- 
2.7.4


