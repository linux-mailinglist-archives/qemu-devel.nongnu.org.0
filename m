Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F804715C2
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:38:05 +0100 (CET)
Received: from localhost ([::1]:42774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw8C4-0003CL-Fp
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:38:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mr-00052L-QN
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:02 -0500
Received: from [2a00:1450:4864:20::331] (port=43694
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mo-0006HX-SD
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:01 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so8946346wmc.2
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ubjue5TlSdk5h9YsUVm9ScV9BOtkzubh7xmfHrmHOSk=;
 b=xWynYBngiAD1GSYobxiR457/RG1aT6VAGAM5YN+5cCpRQ6N7sxfB2Vrp1VDVtFrDSL
 G+auUisv5XgyVQWYuXBTIOo/fbCj/FHhekacfiw1t4JfxEtcl2WJ1bERGXkfF97gWr0t
 jvoSaf0SEW8x0iMwrTH4UQhV/dtpcWDBJZ5p25Vfov9OANf1rKsuvZFGt3MUl5U7rH8s
 XQ4Cwf9ibja9amg77fKDur27Mk3xdsGKF+FSLMeVPamADGaMAfdu+cnCqls1ewDgRzMe
 rpcaWz9bnDij27pwJ4O9gezMp+my0/Tsov4qfdnDZIiHFpTbem+cJfrcQyBEjpIwIQSa
 J6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ubjue5TlSdk5h9YsUVm9ScV9BOtkzubh7xmfHrmHOSk=;
 b=OahWRP+LHn9VxUPr/+OMbvfEZHM+HjknlrX2/Gt8XBWVQsZjzxk0Vij/zzHwzlP2Ho
 /PDIuDEe+758ufQJILZW9vJ/pyTjk5ugX7brKB0PdKzGpKj+wzo+pWnLFc3OrjYWW4Jr
 mdx85raAwEDZ6cqxgy1a9cFNzpd+QowUwvUe31Hu+ymBBY71zTNDscMWRfGyUm9NjzT9
 9g6jwkm977LJXfBvaSv1llknC1DhwdSbOu1sDkofxBz/5Fbwtun2Sev8hH9jtzphNOuV
 B8R/pvkoBlaZxnJcEOQBE3KvL5eW1C1HBQFBqlVmUCASyztM/yoyUv/p3s5VsD98gH8O
 dAhw==
X-Gm-Message-State: AOAM530q8hTH2Fgb/+ZriOHDqyvmqUmybuCNRXuw5wLmhc5vzXGS7aKb
 ROrlYmPzqAbTQGXmeXG9Vy0NIw==
X-Google-Smtp-Source: ABdhPJy2ZKFKs/wQGrfHc9l1J3p9kPBCbLIndm3qQdEUFR1Gfb9BF5nHOCmWLYF5MJNyMuzy2MCmwQ==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr25437616wmj.149.1639249914248; 
 Sat, 11 Dec 2021 11:11:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/26] hw/intc/arm_gicv3_its: Refactor process_its_cmd() to
 reduce nesting
Date: Sat, 11 Dec 2021 19:11:31 +0000
Message-Id: <20211211191135.1764649-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
---
 hw/intc/arm_gicv3_its.c | 103 +++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 53 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 3a2254ea7c7..275af620058 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -273,78 +273,75 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
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
                       "%s: invalid command attributes: eventid %d > %d\n",
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


