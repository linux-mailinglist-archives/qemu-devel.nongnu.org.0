Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401E94952D7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:04:27 +0100 (CET)
Received: from localhost ([::1]:59708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAarJ-00011T-WA
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:04:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgm-0004Jq-3q
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:16 -0500
Received: from [2a00:1450:4864:20::329] (port=44979
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgi-0003Jf-Nw
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:15 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so13353929wms.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OmJMxXznZtS6wxSHqrH87o5Ap9DXYL7I0ggwF5gqjkw=;
 b=NEEkt/XkeLRErhDUz+LFpWSKSzuj+wyvUehnwiBfb3R0pfjXHspkXuUQTtQ+Xeyzom
 sOqFI9TglvY7kV4sQBiYm0pwGz3JUhhoMFuWiWIoqTDpCrtfhP6DKlFBAkPuWCL6Wb+8
 4k1dL5duvYDvLnCqIjQFTX+q0eOqfyk2M9jt+4m6eSFtGNVE7KJDIxDee83wrer8K8zI
 7SNOnD17HbHKDkbCmaMXkbKHPlp+gS1eE4WDmMZFiDdjbYI16LifzEMavAvzaqLpLXvF
 yJP6b6S94iSjga1yRfjWtCPcTPssaiUxDzHrDrnIgwUbH8iMXYjgagM9ERJYxd/sGPP+
 SRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OmJMxXznZtS6wxSHqrH87o5Ap9DXYL7I0ggwF5gqjkw=;
 b=pr1H7CsxMgIL5aWTcPeIl5oCj9t6LpDBrfRHMgnZn8f0H3FVvp+eYbnsEc+cQUjjBh
 C1WJ0jOCKVl8u1FS2fHmDHGqhwJCtizuWwrEF2M1Y7QC+jyA8xaU40p7XDZGMBA7IgWM
 7cW/g/t4bjOUnQnbgFbrkdbpr1JiOma/pGu1gpMfNl3Gk9JWJBKiSe19PCg5SJK9XsDC
 KgP7r9bkVD8e1a/heVuw6USt51faW8JsaudgYFq0b3sAebrPBZGI1834rREJYB2RQPem
 +S23p67cTs1Bn2k75xIcGPufN80Gflv9+oiIvsFaUTUBDAHJDLv0Dpy90hsBbTgwelea
 OiFA==
X-Gm-Message-State: AOAM533H/DfXGHWQG5Rpz2KfWXqQ5j7Z3fHADPNN+ijmuD3Yaihc14xI
 5inOsmaivpa0/Vsa8HRhNnuclZ+Tw69FEg==
X-Google-Smtp-Source: ABdhPJzfU8SNqhDErRj9ZPphug/tOBl3ouZKo3wqfECzVFSFW+O+Uw9P/5rpVQMumbO6L1dBCHkzSw==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr18212812wry.380.1642682226544; 
 Thu, 20 Jan 2022 04:37:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/38] hw/intc/arm_gicv3_its: Refactor process_its_cmd() to
 reduce nesting
Date: Thu, 20 Jan 2022 12:36:23 +0000
Message-Id: <20220120123630.267975-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Message-id: 20220111171048.3545974-8-peter.maydell@linaro.org
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


