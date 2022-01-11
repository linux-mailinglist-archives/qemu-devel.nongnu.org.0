Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107BA48B44B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:45:47 +0100 (CET)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7LDO-0000cZ-5O
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:45:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfn-0005CR-0n
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:03 -0500
Received: from [2a00:1450:4864:20::32d] (port=50723
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfi-0007JW-Bt
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id w26so5695481wmi.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w59aiHtlS+UEJYF8KG6CIWjpdLxn3MFz4XhHlwys/7I=;
 b=EQ+HaxxkduJVaWIsuKcg1SxL4RTwBCXV5plq9SlbUL8ohC0krpLXg8Pssj6yfstU4R
 d1y5kPTVwGPB496iu9MYGoHNLGk4zryoSeQrXasNnUWX9toiE/IweRudNA3Kxp77J/Pw
 f13f3brJUkyddCOISRQtigWmSz1LKed5T74MHVG/lDEMDhmdKhb7h2Z+kOUs4HVq4tgc
 i7ftvRhC2o1wcC9JPRiObFVUEXKlZaoXv7gRHR53I1BCCGFFyhN0YJ0jpO5ce8LGB5h5
 6yD9387mHQKh0lb/MKM2XZWwnZcN4tqnkU9QUrmIskjadylTs3Jy7j0ZTKePiBHeu5n+
 MPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w59aiHtlS+UEJYF8KG6CIWjpdLxn3MFz4XhHlwys/7I=;
 b=r+EUdOFt8VvA4XukSIiWVXhPoFk5NfrwpAs1MYrYb90HPmBR2LsZdqm7wcj1zV0hsh
 EuVJ4NAfma6FCSe33XfL+Mogq5rbhPKEigyc7sEsPg4aJDUsH1ywjdQegQxb8Jo94h4n
 lICgDBPrr9bR+YJEOrbKF84IJU52KzIKSocVogMrtEzFNatZpUKVcOZkIAy4xc15ZcMS
 Fqu6soGisHq8nl7Zjt15oWgkgb8sdmVmXETZ8Y9Zs0Lh0fHwe+23aRmnK7IIPiLdCwTI
 0kt/ab3oQ8v/gDsqy3rXrXqB0lxudEo6J/LTheohNTKR9Ch7etpzCBzRUYDG/Fpyy1ma
 awEA==
X-Gm-Message-State: AOAM533LRHCfMgTmDolTSznv5Md2+/fCV5ZyjyT9MjipWmuSsyiLMa+P
 tNmMyRReM5yEQiNN86E6PI1QWA==
X-Google-Smtp-Source: ABdhPJy5wwNA5pen3pENXQDKZ4eHqaBzBw5BvpAxZLTBze0RV666OtoGDfexZe/ZNC1IJcMCm3Kn4w==
X-Received: by 2002:a1c:9803:: with SMTP id a3mr3251538wme.47.1641921055800;
 Tue, 11 Jan 2022 09:10:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/13] hw/intc/arm_gicv3_its: Refactor process_its_cmd() to
 reduce nesting
Date: Tue, 11 Jan 2022 17:10:42 +0000
Message-Id: <20220111171048.3545974-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refactor process_its_cmd() so that it consistently uses
the structure
  do thing;
  if (error condition) {
      return early;
  }
  do next thing;

rather than doing some of the work nested inside if (not error)
code blocks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 103 +++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 53 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 0929116c0fe..5dc6846fe3f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -273,79 +273,76 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
-    if (dte_valid) {
-        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
-
-        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
-
-        if (res != MEMTX_OK) {
-            return CMD_STALL;
-        }
-
-        if (ite_valid) {
-            cte_valid = get_cte(s, icid, &cte, &res);
-        }
-
-        if (res != MEMTX_OK) {
-            return CMD_STALL;
-        }
-    } else {
+    if (!dte_valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid dte: %"PRIx64" for %d (MEM_TX: %d)\n",
-                      __func__, dte, devid, res);
+                      "invalid dte: %"PRIx64" for %d\n",
+                      __func__, dte, devid);
         return CMD_CONTINUE;
     }
 
+    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+
+    ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    if (!ite_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: invalid ITE\n",
+                      __func__);
+        return CMD_CONTINUE;
+    }
+
+    cte_valid = get_cte(s, icid, &cte, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid cte: %"PRIx64"\n",
+                      __func__, cte);
+        return CMD_CONTINUE;
+    }
 
-    /*
-     * In this implementation, in case of guest errors we ignore the
-     * command and move onto the next command in the queue.
-     */
     if (devid >= s->dt.num_ids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
                       __func__, devid, s->dt.num_ids);
         return CMD_CONTINUE;
-    } else if (!dte_valid || !ite_valid || !cte_valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "dte: %s, ite: %s, cte: %s\n",
-                      __func__,
-                      dte_valid ? "valid" : "invalid",
-                      ite_valid ? "valid" : "invalid",
-                      cte_valid ? "valid" : "invalid");
-        return CMD_CONTINUE;
-    } else if (eventid >= num_eventids) {
+    }
+    if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d >= %"
                       PRId64 "\n",
                       __func__, eventid, num_eventids);
         return CMD_CONTINUE;
-    } else {
-        /*
-         * Current implementation only supports rdbase == procnum
-         * Hence rdbase physical address is ignored
-         */
-        rdbase = FIELD_EX64(cte, CTE, RDBASE);
+    }
 
-        if (rdbase >= s->gicv3->num_cpu) {
-            return CMD_CONTINUE;
-        }
+    /*
+     * Current implementation only supports rdbase == procnum
+     * Hence rdbase physical address is ignored
+     */
+    rdbase = FIELD_EX64(cte, CTE, RDBASE);
 
-        if ((cmd == CLEAR) || (cmd == DISCARD)) {
-            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
-        } else {
-            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
-        }
-
-        if (cmd == DISCARD) {
-            IteEntry ite = {};
-            /* remove mapping from interrupt translation table */
-            return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
-        }
+    if (rdbase >= s->gicv3->num_cpu) {
         return CMD_CONTINUE;
     }
+
+    if ((cmd == CLEAR) || (cmd == DISCARD)) {
+        gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+    } else {
+        gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+    }
+
+    if (cmd == DISCARD) {
+        IteEntry ite = {};
+        /* remove mapping from interrupt translation table */
+        return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    }
+    return CMD_CONTINUE;
 }
 
 static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
-- 
2.25.1


