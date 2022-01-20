Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267D349548D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 20:01:12 +0100 (CET)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcgI-0006LC-H3
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 14:01:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgm-0004Jm-0u
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:16 -0500
Received: from [2a00:1450:4864:20::334] (port=38747
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgi-0003JY-Ee
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso14909865wmb.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=W4eM+QRaRgOHtqGkNTPcc7i4Kuj5O/84dOpIzymjzbs=;
 b=nJ0r9eM/a7YjpCqT4uBqGkvkWXiYxpi3D/IkktBmmxQpn6dTTxirqk5Rk4iaz4xW2E
 JcxvAlAG7p9Nrt3GwpPdb24nhEClUdAY9susO8+MACg2lUf7sWfNVP6Uz7AOxnyVrvwn
 nBH7A8joRoaB+SLqjjLM1LG5fXAGhh0zUq0y4tIyjAgxDtHLXmrkK7SX3viEXBNBY8+n
 YKMARI7SWUg763RzDzO8ZDbjsN5OPFnsaBld68Xjka3aKvh4ft47BVQvmBmv8h++WIMe
 cBJqubzFFaufDIPhj+YuwXQjylfA0onAwHjA+zHXyQKKZ2M6qQ5YZUFxna2/EhzgJCr/
 7yDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W4eM+QRaRgOHtqGkNTPcc7i4Kuj5O/84dOpIzymjzbs=;
 b=23hIuTuzZmoyWMEDdF1da8XDWQgpI5hPh3jeEztBRU4OicH2jX+EHoSrODhPjVxm/b
 vnBUbvRFjjEZ6ptTjc9fIq1FSrTD35Ti2VKPyOE3IJ4itjbT3iI7KVWqA9jLsnn/hmYo
 f0xBBqEL5Ed9t9y3J47UkcQD35zDXxncBEeZqJ/IoFMl4LgoAoUwQUlhacrYc58JWUJF
 Y29CEdPPcl3j7XWwq48i0SRxcd41CaifXBRsnBFEolhWe0K2uby1AE12YelfVAyLKGKf
 1UhJMTBJH1Ik/CBMPHyvRK2hDjna+UKPbOgao53NEe1KhW+kCfBeWYDC9eYIz0vwkilp
 Rlig==
X-Gm-Message-State: AOAM532ZA4mztl1eqEnkJxP9wVxqItxrBV3sqLl70VgioDg9NVQkGUzL
 EaSjL3V09QFHiS6aJfyXYgty+I8yJWoZ/g==
X-Google-Smtp-Source: ABdhPJwHjU1rH7etNTgOGFJx1BFilFFMbVhSoq3o2lNrtj0vp5Llzq4o3qzxFNzzMwewDXOP9ms3DQ==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr13185338wri.8.1642682225839;
 Thu, 20 Jan 2022 04:37:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/38] hw/intc/arm_gicv3_its: Fix return codes in
 process_its_cmd()
Date: Thu, 20 Jan 2022 12:36:22 +0000
Message-Id: <20220120123630.267975-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Fix process_its_cmd() to consistently return CMD_STALL for
memory errors and CMD_CONTINUE for parameter errors, as
we claim in the comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220111171048.3545974-7-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 10901a5e709..0929116c0fe 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -248,7 +248,6 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
-    ItsCmdResult result = CMD_STALL;
     uint64_t rdbase;
 
     if (cmd == NONE) {
@@ -262,7 +261,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     }
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     eventid = (value & EVENTID_MASK);
@@ -270,7 +269,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
@@ -280,7 +279,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
         if (res != MEMTX_OK) {
-            return result;
+            return CMD_STALL;
         }
 
         if (ite_valid) {
@@ -288,14 +287,14 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         }
 
         if (res != MEMTX_OK) {
-            return result;
+            return CMD_STALL;
         }
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
                       "invalid dte: %"PRIx64" for %d (MEM_TX: %d)\n",
                       __func__, dte, devid, res);
-        return result;
+        return CMD_CONTINUE;
     }
 
 
@@ -307,7 +306,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
                       __func__, devid, s->dt.num_ids);
-
+        return CMD_CONTINUE;
     } else if (!dte_valid || !ite_valid || !cte_valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
@@ -316,11 +315,13 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
                       dte_valid ? "valid" : "invalid",
                       ite_valid ? "valid" : "invalid",
                       cte_valid ? "valid" : "invalid");
+        return CMD_CONTINUE;
     } else if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d >= %"
                       PRId64 "\n",
                       __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
     } else {
         /*
          * Current implementation only supports rdbase == procnum
@@ -329,7 +330,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         rdbase = FIELD_EX64(cte, CTE, RDBASE);
 
         if (rdbase >= s->gicv3->num_cpu) {
-            return result;
+            return CMD_CONTINUE;
         }
 
         if ((cmd == CLEAR) || (cmd == DISCARD)) {
@@ -341,11 +342,10 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         if (cmd == DISCARD) {
             IteEntry ite = {};
             /* remove mapping from interrupt translation table */
-            result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+            return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
         }
+        return CMD_CONTINUE;
     }
-
-    return result;
 }
 
 static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
-- 
2.25.1


