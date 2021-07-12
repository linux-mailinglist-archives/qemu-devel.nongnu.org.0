Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527A53C5F83
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:42:47 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2y50-0006mY-3L
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2d-0003zg-Ve
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:23 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2V-0000vi-0l
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:14 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h1so9405944plf.6
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZ18+TbN3l0IvM4lcz8To1nUnlGMGwhY3IWR1y85/oQ=;
 b=gI6xTTdnbo+dVvl890e3D1fB75Er7s3Y9ef+qEIB1HhVEAfhMqqIKNmOC051ZQ7kDh
 YYraKEY6edBRoF8atXLg42hzlFsOmLMhJiFeMbuVLzQ+rfcK/kCObuuhaH6t5nxuV5+Z
 VOjjp5X3iAqHPwNOge2CJL88BIMbmIrGCt0E+PTKmWLRcbAX8mgvq065U7l1v7QhhOqE
 5NFES8AyXAiw+gtyPic4Baozvl0JsJJtb9xh6BQts1lenfU5uzf6q+/ulo25RKXgIcuK
 6o1PAfg9w286WMF7WZGRCrZV6d/W66WU1cUXqoh+PNwXfCN+FN04wQYGMLHKcbuJgtue
 mE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZ18+TbN3l0IvM4lcz8To1nUnlGMGwhY3IWR1y85/oQ=;
 b=uQjOGo6qw566X2fO+2LGG+/Zvi96A1akMMNkLfwjanRW2SUDZrcfHxplGj4zbtoXDf
 DQOMl8KA4XtIslU/pDnwm+jB1bdpV8d5EHwYvnTxjGwkskH6pDpmxA3tAzTMnSB8lQnh
 S2sAQjtYHm2dK3adV5+9uaARFlcnn5N4lrAJDFwhfrzJrhOa8UXT8VII/k7hTkeCYiwj
 Ovf7NKfyHRdYBEK8/bVtuhfoC6fZkrzXtRhyl5N18rVhUsDYQDyoTcta2V9tvmcGDq/b
 lDNXJr28gS9Rrq16gekyWrp9fX1UIc7qDS+OXx6aLETAfHcIg/PTNc5Df+It9X2oZXDM
 eLbQ==
X-Gm-Message-State: AOAM5301ZG/OyukaonJyQwdUTlacFCJMBibOx7rDP1myCKGdBbLCPZwC
 v7SDIY0jtmqIkntY7AQq1SsAuhs4tzvIMA==
X-Google-Smtp-Source: ABdhPJzlIwcESTdLMrsDegvt1h+A9OxIaBabWXg6U+HehjhOskaH96U3a4sO9frHxiG9qrUqDhsyvA==
X-Received: by 2002:a17:90a:bd94:: with SMTP id
 z20mr10211718pjr.214.1626104409474; 
 Mon, 12 Jul 2021 08:40:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b33sm18247635pgb.92.2021.07.12.08.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:40:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/10] accel/tcg: Move cflags lookup into tb_find
Date: Mon, 12 Jul 2021 08:40:01 -0700
Message-Id: <20210712154004.1410832-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly require the guest pc for computing cflags,
so move the choice just after cpu_get_tb_cpu_state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5bb099174f..4d043a11aa 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -502,15 +502,29 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 
 static inline TranslationBlock *tb_find(CPUState *cpu,
                                         TranslationBlock *last_tb,
-                                        int tb_exit, uint32_t cflags)
+                                        int tb_exit)
 {
     CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
-    uint32_t flags;
+    uint32_t flags, cflags;
 
     cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
 
+    /*
+     * When requested, use an exact setting for cflags for the next
+     * execution.  This is used for icount, precise smc, and stop-
+     * after-access watchpoints.  Since this request should never
+     * have CF_INVALID set, -1 is a convenient invalid value that
+     * does not require tcg headers for cpu_common_reset.
+     */
+    cflags = cpu->cflags_next_tb;
+    if (cflags == -1) {
+        cflags = curr_cflags(cpu);
+    } else {
+        cpu->cflags_next_tb = -1;
+    }
+
     tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         mmap_lock();
@@ -868,21 +882,7 @@ int cpu_exec(CPUState *cpu)
         int tb_exit = 0;
 
         while (!cpu_handle_interrupt(cpu, &last_tb)) {
-            uint32_t cflags = cpu->cflags_next_tb;
-            TranslationBlock *tb;
-
-            /* When requested, use an exact setting for cflags for the next
-               execution.  This is used for icount, precise smc, and stop-
-               after-access watchpoints.  Since this request should never
-               have CF_INVALID set, -1 is a convenient invalid value that
-               does not require tcg headers for cpu_common_reset.  */
-            if (cflags == -1) {
-                cflags = curr_cflags(cpu);
-            } else {
-                cpu->cflags_next_tb = -1;
-            }
-
-            tb = tb_find(cpu, last_tb, tb_exit, cflags);
+            TranslationBlock *tb = tb_find(cpu, last_tb, tb_exit);
             cpu_loop_exec_tb(cpu, tb, &last_tb, &tb_exit);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
-- 
2.25.1


