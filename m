Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447455BFFF1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:33:37 +0200 (CEST)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0nA-0005a2-1Y
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1ob0gr-0008Lk-SM
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:27:05 -0400
Received: from [106.39.185.57] (port=58616 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>) id 1ob0gp-0000c3-Gh
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 10:27:05 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id 3FBB0FC0203;
 Wed, 21 Sep 2022 22:20:53 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain
 (1.39.88.218.broad.cd.sc.dynamic.163data.com.cn [218.88.39.1])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P51403T281471017283952S1663770049191260_; 
 Wed, 21 Sep 2022 22:20:53 +0800 (CST)
X-UNIQUE-TAG: <2cae69e47f0c9847aff47c7583668b2c>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: qemu-devel@nongnu.org
X-RCPT-COUNT: 4
X-SENDER-IP: 218.88.39.1
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: luzhipeng <luzhipeng@cestc.cn>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: michael.roth@amd.com, Konstantin Kostiuk <kkostiuk@redhat.com>,
 lu zhipeng <luzhipeng@cestc.cn>
Subject: [PATCH] qga: fix possible memory leak
Date: Wed, 21 Sep 2022 22:20:36 +0800
Message-Id: <20220921142036.1758-1-luzhipeng@cestc.cn>
X-Mailer: git-send-email 2.34.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.57 (failed)
Received-SPF: pass client-ip=106.39.185.57; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: lu zhipeng <luzhipeng@cestc.cn>

Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
---
 qga/main.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/qga/main.c b/qga/main.c
index 5f1efa2333..73ea1aae65 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -1287,7 +1287,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
     if (g_mkdir_with_parents(config->state_dir, S_IRWXU) == -1) {
         g_critical("unable to create (an ancestor of) the state directory"
                    " '%s': %s", config->state_dir, strerror(errno));
-        return NULL;
+        goto failed;
     }
 #endif
 
@@ -1312,7 +1312,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
             if (!log_file) {
                 g_critical("unable to open specified log file: %s",
                            strerror(errno));
-                return NULL;
+                goto failed;
             }
             s->log_file = log_file;
         }
@@ -1323,7 +1323,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
                                s->pstate_filepath,
                                ga_is_frozen(s))) {
         g_critical("failed to load persistent state");
-        return NULL;
+        goto failed;
     }
 
     config->blacklist = ga_command_blacklist_init(config->blacklist);
@@ -1344,7 +1344,7 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
 #ifndef _WIN32
     if (!register_signal_handlers()) {
         g_critical("failed to register signal handlers");
-        return NULL;
+        goto failed;
     }
 #endif
 
@@ -1357,12 +1357,21 @@ static GAState *initialize_agent(GAConfig *config, int socket_activation)
     s->wakeup_event = CreateEvent(NULL, TRUE, FALSE, TEXT("WakeUp"));
     if (s->wakeup_event == NULL) {
         g_critical("CreateEvent failed");
-        return NULL;
+        goto failed;
     }
 #endif
 
     ga_state = s;
     return s;
+
+failed:
+    g_free(s->pstate_filepath);
+    g_free(s->state_filepath_isfrozen);
+    if (s->log_file && s->log_file != stderr) {
+        fclose(s->log_file);
+    }
+    g_free(s);
+    return NULL;
 }
 
 static void cleanup_agent(GAState *s)
-- 
2.31.1




