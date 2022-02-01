Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EC64A678B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:09:51 +0100 (CET)
Received: from localhost ([::1]:60104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1LS-0000bM-TH
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:09:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytK-0001rN-Mu
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:39 -0500
Received: from [2a00:1450:4864:20::42c] (port=35422
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytH-0002Y7-Qf
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:38 -0500
Received: by mail-wr1-x42c.google.com with SMTP id e2so34081640wra.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=blUi2JCgQAd+TDFPkf/imnCCaFxJVC4UZRRy+Dtpxxo=;
 b=Epm9qyHDdpnxH7Z88f8KwOkgSGjMCXSRBY8G7Lyr47NzN3KxePExIUIVWbAZ7SF8bj
 /PNHB2KTLr9oDsVDwdJWr1br25bG7uwEy3BvXZi70O/O3GpnYMVn7JbI+3SM1bFkE81Q
 k8HBdrHI6zk7o9ccNbeX9HsOm8ToLGb5VB1o9S9VoNhwMEUPMGLV+gz0bAYQa1MesyBh
 xrV7UA71TrFqV/eOFOKI6VxXOEDTqkX17io4Y+wT/78lEnwHkzApHNheuK2zt9On4sKp
 MvY1rrZK4z1m9xKc+hw0iW2ipU8xyreBglUkqqE+Hp4b6RyEBUIrLtW7StW3UHp1NcIS
 6SPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=blUi2JCgQAd+TDFPkf/imnCCaFxJVC4UZRRy+Dtpxxo=;
 b=41jK18RVziUoqHtE8Jy+93EJMf/nn+YA2l72+KatJiufLbWntkhNjGeksWkWSZA5ms
 5x7UIzFnu7NAClJEeaLEg9IDXX6i42nd/dZSHWV9AUYaDRrg6j6zBytH8xAaZn/+SbHn
 P4PLkfyafPy4kf8R8+1w363cpfD1mzGKDdkICnyGUDUc0u4lvuCbzslAlFYIA/Ds1oDc
 ENqq1ebfQZbAF02f3sz2VJ2c1uVIPe0bXbzn+1hUvZFQCFv0F6F8nYrnGskL/q25di80
 87qFqTpZagoHgNEMktXeTpTfbggMssa4vN9DFjLOl8iL3Q9t2XomF+0pQ11S2sBE0ZcO
 RyEA==
X-Gm-Message-State: AOAM530AuzJKKh7q7vChClkmAZxZN1uDiT+/rIr+Q8g8mKzzAEPGMXf+
 HGLBS16HEUnxjPDWHeoGN2DZ6w==
X-Google-Smtp-Source: ABdhPJztY4hlw7tj2DNUREwQ9koDN1FczEpkO004+Rp5PdYypWIq8PJrI5JiBzH2L6wT0ueOY5XGKQ==
X-Received: by 2002:adf:d1e9:: with SMTP id g9mr17579790wrd.645.1643743940740; 
 Tue, 01 Feb 2022 11:32:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:32:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/13] hw/intc/arm_gicv3_its: Split error checks
Date: Tue,  1 Feb 2022 19:32:07 +0000
Message-Id: <20220201193207.2771604-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In most of the ITS command processing, we check different error
possibilities one at a time and log them appropriately. In
process_mapti() and process_mapd() we have code which checks
multiple error cases at once, which means the logging is less
specific than it could be. Split those cases up.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 52 ++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 8dade9440ac..4f598d3c14f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -404,19 +404,29 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     num_eventids = 1ULL << (dte.size + 1);
     num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
-    if ((icid >= s->ct.num_entries)
-            || !dte.valid || (eventid >= num_eventids) ||
-            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)))) {
+    if (icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes "
-                      "icid %d or eventid %d or pIntid %d or"
-                      "unmapped dte %d\n", __func__, icid, eventid,
-                      pIntid, dte.valid);
-        /*
-         * in this implementation, in case of error
-         * we ignore this command and move onto the next
-         * command in the queue
-         */
+                      "%s: invalid ICID 0x%x >= 0x%x\n",
+                      __func__, icid, s->ct.num_entries);
+        return CMD_CONTINUE;
+    }
+
+    if (!dte.valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: no valid DTE for devid 0x%x\n", __func__, devid);
+        return CMD_CONTINUE;
+    }
+
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid event ID 0x%x >= 0x%" PRIx64 "\n",
+                      __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
+    }
+
+    if (pIntid < GICV3_LPI_INTID_START || pIntid >= num_intids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid interrupt ID 0x%x\n", __func__, pIntid);
         return CMD_CONTINUE;
     }
 
@@ -529,16 +539,16 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
     dte.ittaddr = (cmdpkt[2] & ITTADDR_MASK) >> ITTADDR_SHIFT;
     dte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
 
-    if ((devid >= s->dt.num_entries) ||
-        (dte.size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
+    if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "ITS MAPD: invalid device table attributes "
-                      "devid %d or size %d\n", devid, dte.size);
-        /*
-         * in this implementation, in case of error
-         * we ignore this command and move onto the next
-         * command in the queue
-         */
+                      "ITS MAPD: invalid device ID field 0x%x >= 0x%x\n",
+                      devid, s->dt.num_entries);
+        return CMD_CONTINUE;
+    }
+
+    if (dte.size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ITS MAPD: invalid size %d\n", dte.size);
         return CMD_CONTINUE;
     }
 
-- 
2.25.1


