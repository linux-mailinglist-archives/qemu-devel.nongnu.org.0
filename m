Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE42834633B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:47:20 +0100 (CET)
Received: from localhost ([::1]:42084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjFX-0005w0-SG
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lOjDX-0004wR-4V
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:45:15 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:52380
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lOjDM-0007sp-SZ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:45:14 -0400
HMM_SOURCE_IP: 172.18.0.218:28606.507872797
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.57?logid-930dace71f6841cb8c46f55272279289
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id AD661280099;
 Tue, 23 Mar 2021 23:44:43 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by App0025 with ESMTP id 930dace71f6841cb8c46f55272279289 for
 qemu-devel@nongnu.org; Tue Mar 23 23:44:51 2021
X-Transaction-ID: 930dace71f6841cb8c46f55272279289
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] tests/migration: fix parameter of auto-converge migration
Date: Tue, 23 Mar 2021 23:43:58 +0800
Message-Id: <0195d34a317ce3cc417b3efd275e30cad35a7618.1616513998.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?=
 <huangy81@chinatelecom.cn>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

when execute the following test command:
$ ./guestperf-batch.py --auto-converge \
    --auto-converge-step {percent} ...
test aborts and error message be throwed as the following:
"Parameter 'x-cpu-throttle-increment' is unexpected"

The reason is that 'x-cpu-throttle-increment' has been
deprecated and 'cpu-throttle-increment' was introduced
Since v2.7. Use the new parameter instead.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 tests/migration/guestperf/engine.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index e399447..6b49aed 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -102,7 +102,7 @@ def _migrate_progress(self, vm):
             info.get("downtime", 0),
             info.get("expected-downtime", 0),
             info.get("setup-time", 0),
-            info.get("x-cpu-throttle-percentage", 0),
+            info.get("cpu-throttle-percentage", 0),
         )

     def _migrate(self, hardware, scenario, src, dst, connect_uri):
@@ -135,7 +135,7 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                                      "state": True }
                                ])
             resp = src.command("migrate-set-parameters",
-                               x_cpu_throttle_increment=scenario._auto_converge_step)
+                               cpu_throttle_increment=scenario._auto_converge_step)

         if scenario._post_copy:
             resp = src.command("migrate-set-capabilities",
--
1.8.3.1


