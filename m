Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062AD44EBCD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 18:07:52 +0100 (CET)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mla1m-0004ND-Kq
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 12:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlZzL-0002OC-0t
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 12:05:20 -0500
Received: from [2a00:1450:4864:20::42f] (port=35790
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mlZz9-0005fQ-Lr
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 12:05:13 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i5so16722682wrb.2
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 09:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95Wgalf5MOiFzNlLWuVk8PBNFBGJmLjT5TdyR/c1o0o=;
 b=p56ZP+oTY9nQ0eGR4g/g4Ex5NmkK42JYLPP08I56yxKe/CWy4XhdD7bovhNN9lEwdW
 Fm8n+jVpUrvgN5DAsbY1OhEyImUO0mntNPqi0mQJzgp1D/anTe2y41Z2v1Asat3xJEFK
 yhhoO5nggJIEoJdA6y9dB7pqak5XYdVBPbO8Ot76G3RxdbD+hnQ8XlA6SVuyMRTKBDYw
 NLuNENvteeHfgwBzMcZhuMcESM9SVlgrx3nREdFCIYpuiv7TR2zJjZJqHCydoA6uhuJc
 bY9iSMyguPqu9t03la1o402YjAeYdDFqr3N0tynv4R2HTcv46dMu/O/INgdH3KCQuAPA
 W42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95Wgalf5MOiFzNlLWuVk8PBNFBGJmLjT5TdyR/c1o0o=;
 b=bjl1DLhe8TyCR3c8V0DKTG+jjAhgTTfKIFy06pDBiG0q7TLo4dGKas6R3nJuklyF59
 XImJMCyxC/gglHO44Ct6EvY82/zRNs64CXfb/j4dKndesr90zPffw+mZ1EMB5SS/kjBj
 SNdobTUJm4qPTy5XUlMlbKl9eqPaarL/9azTH7fDBdNbNvxgmh2tof7C6UCMQGelQ9pT
 ghhCXOXfXUoYHoCfHqS+fubUkXGbPUjfTo27O5/po40nMrHP4/VT2TvAaknEZnMuk9lP
 RPN8D2EsPSlDyUvtzk2F8bPS9ZX7gFOESiiuXV4xVZgvdMQOyT4L9DJYabs/tR1ceD8O
 FOeQ==
X-Gm-Message-State: AOAM531jtiDEqo8R1HaJfdsVqvx4N7O0MzXuX3DNhSyDOzTM0moP1UTi
 evln6g4JdHk7E5w+fdcgKA0J4w==
X-Google-Smtp-Source: ABdhPJwVcsyTCTATt4hAIDb5PStbqWFbdJMqE+8VJH242YAiPkY/XR0Qu1AIopKUU/pTsnkxfi3yKg==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr20026255wrm.299.1636736703896; 
 Fri, 12 Nov 2021 09:05:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c11sm8729789wmq.27.2021.11.12.09.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 09:05:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 316421FF96;
 Fri, 12 Nov 2021 17:05:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] hw/intc: clean-up error reporting for failed ITS cmd
Date: Fri, 12 Nov 2021 17:04:54 +0000
Message-Id: <20211112170454.3158925-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While trying to debug a GIC ITS failure I saw some guest errors that
had poor formatting as well as leaving me confused as to what failed.
As most of the checks aren't possible without a valid dte split that
check apart and then check the other conditions in steps. This avoids
us relying on undefined data.

I still get a failure with the current kvm-unit-tests but at least I
know (partially) why now:

  Exception return from AArch64 EL1 to AArch64 EL1 PC 0x40080588
  PASS: gicv3: its-trigger: inv/invall: dev2/eventid=20 now triggers an LPI
  ITS: MAPD devid=2 size = 0x8 itt=0x40430000 valid=0
  INT dev_id=2 event_id=20
  process_its_cmd: invalid command attributes: invalid dte: 0 for 2 (MEM_TX: 0)
  PASS: gicv3: its-trigger: mapd valid=false: no LPI after device unmap
  SUMMARY: 6 tests, 1 unexpected failures

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 84bcbb5f56..d5267814ab 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -274,21 +274,36 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
         if (res != MEMTX_OK) {
             return result;
         }
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid dte: %"PRIx64" for %d (MEM_TX: %d)\n",
+                      __func__, dte, devid, res);
+        return result;
     }
 
-    if ((devid > s->dt.maxids.max_devids) || !dte_valid || !ite_valid ||
-            !cte_valid || (eventid > max_eventid)) {
+
+    /*
+     * In this implementation, in case of guest errors we ignore the
+     * command and move onto the next command in the queue.
+     */
+    if (devid > s->dt.maxids.max_devids) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes "
-                      "devid %d or eventid %d or invalid dte %d or"
-                      "invalid cte %d or invalid ite %d\n",
-                      __func__, devid, eventid, dte_valid, cte_valid,
-                      ite_valid);
-        /*
-         * in this implementation, in case of error
-         * we ignore this command and move onto the next
-         * command in the queue
-         */
+                      "%s: invalid command attributes: devid %d>%d",
+                      __func__, devid, s->dt.maxids.max_devids);
+
+    } else if (!dte_valid || !ite_valid || !cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "dte: %s, ite: %s, cte: %s\n",
+                      __func__,
+                      dte_valid ? "valid" : "invalid",
+                      ite_valid ? "valid" : "invalid",
+                      cte_valid ? "valid" : "invalid");
+    } else if (eventid > max_eventid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d > %d\n",
+                      __func__, eventid, max_eventid);
     } else {
         /*
          * Current implementation only supports rdbase == procnum
-- 
2.30.2


