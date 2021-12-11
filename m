Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA647158C
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:15:08 +0100 (CET)
Received: from localhost ([::1]:56838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7pr-0007ud-BY
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:15:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mY-0004lW-H6
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:42 -0500
Received: from [2a00:1450:4864:20::429] (port=41741
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mV-0006BQ-MJ
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:42 -0500
Received: by mail-wr1-x429.google.com with SMTP id a9so20322555wrr.8
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCxczYnF9ENjygSdEdbIw8X3a8w7yrOW7vR3UKB8V04=;
 b=ZNPLTguMsjyMtt/U2jDu3AuCfHr6fLpsRayXnhFsJMoXzGrmxwapNyVwYferI0C8zg
 8Cj52vWdqsqFw05QtRWGN2AK2ZquQIb8xQo90ZgwV00XvUTDi5AZnQqz22Tk7re9u519
 mUzntddDebSKieWIyDa5yZ2l436kugWftRak3bx39XNVwa4BsGIJJXgyUBU/am6jx53F
 w3wDYijsZhQUpJWvxsmqchgoPx/pPll1WwQQA0o7xVPHHeAIU1N2n6avMLgcnMiqKN3Q
 6Fn0S2oWWvP31K3RcbLNgriW8eErOsChMIsFGQK9eKpaoCR1Si8ZHHGzFOHXF7KCPXqU
 ZVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCxczYnF9ENjygSdEdbIw8X3a8w7yrOW7vR3UKB8V04=;
 b=R82TO1UozDI8Q9+AU9pm9vuOC0vYiEwMiY30/Bn6NRuLQHXUg/5agu3vZcU3Q4nGN0
 4JvXqwV0nOmgAqlkEMsOkSHRusMOdGdiZI0TFf+d7IYZwPeK9hhR9Vy+kXERCwqSVxhE
 NzkbICzSLZNZZEBZxzt6RmN1QmHZXOZik5lDROf8WVB2lPXx5C58+TnotRYB+IMb6GOP
 jesqK3I9Y2fQd4hAsXBqF2uBOUjUaGhwbur2FhoITiPKvwE0yGltcg9EVVGSkN09rPqm
 gOX+Np0vYMRgZ0+gzG4CkQaCl3SFhevcq2tvdk9P82+lmlrFKrHAEmBWsjFuHiIVbw5G
 zcMA==
X-Gm-Message-State: AOAM533gzfnPToCk52l/h+fGzOWg1zvXjlJW+85ROrPjz0862q019PyA
 3ntXiCKMtL2mQcln2Y03QSiUcw==
X-Google-Smtp-Source: ABdhPJzuUrId9CT2bbs1t1vU0clOXJx3/BjVoK+FMs1rL4YzQZhsc5TI0oA3nYnmcCThumNseX4kXA==
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr21586049wry.66.1639249897800; 
 Sat, 11 Dec 2021 11:11:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/26] hw/intc: clean-up error reporting for failed ITS cmd
Date: Sat, 11 Dec 2021 19:11:10 +0000
Message-Id: <20211211191135.1764649-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index c929a9cb5c3..b99e63d58f7 100644
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
2.25.1


