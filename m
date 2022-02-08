Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691DC4AD884
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:08:10 +0100 (CET)
Received: from localhost ([::1]:54284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQE5-0001IU-DV
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:08:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrT-00016B-4f
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:45 -0500
Received: from [2a00:1450:4864:20::32f] (port=34754
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOr2-0002O2-Jr
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so720660wmb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9dw3Bqc9gNOZYBlhUw891b5p3LngTxqnCKTzWHfYZ8A=;
 b=kniUN/ugRfQJXfQCvFtnfLC/C0dWt0YtVPWI64g4xjt9NVF7iLXUGVV8/8Hj6Ve4om
 Hz4rqRw7UKAsPyVdCyqAYvS1Y1Lacxe+jyB3GdaPolhmOfFaPAphPNP3mV4f9xSDAiYV
 BY1Q6zBgcnInyNq7F2BZQQrz/epRQRrV6pXAwnxBZ76G4N4MMRtugR7o22iUPdZRaJxn
 DPLRhSjcjdNC8p06FZCdDmX1KD3gbnGNAfR8bKCafJ+5S8R1FbR5vSNtFDHC7pTfMadX
 WQZWo6XtY6dBLFW208aPQ6LHys0jC2Tb+K/vGspdjmUD2K0NaIbywIcscrlhdRjmQ3qx
 XAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dw3Bqc9gNOZYBlhUw891b5p3LngTxqnCKTzWHfYZ8A=;
 b=QsOCJxm4DGNSWeSIrMrQE7zK4TUUGpxzfuoufOCtFPpT4EPfdr1YKRhA+9fcrEpjBw
 D6RwEGcZ2eFS63SWxq0hoy/kikFtGe+BixXBYhnV0Gh45SFLgoZmxa5ZF4tJ/3TZNn3w
 mnP3cITlqj3UXj/WntvxIGnyBfb7Ca6CVozoTgp6OzMh7Wcpz02T2HBSKDfezIN53vr+
 QYjAvyGKA/OYcHLWxYNH8hgiDlLuz8OYLHT4zP9Gh3HfpfdYIC+b5Cb4y4pW3H+DiGLf
 q3RJFMswGoHAd07TFRY1NcpQnL1dD9odDLBeu9a3hbkyPe4F/BLH+AJJxAOyvtx1bPqr
 khqA==
X-Gm-Message-State: AOAM533emDfc6JLe4TilgXDSLpsvO1I2xPV7eLV/62DR5ayrJckdCYYd
 EDTWqZMUBfIlKE9N3AX5urnZdd6T1G+aJw==
X-Google-Smtp-Source: ABdhPJxRIqXBP6J1PntmoiGi94XcfzMMdliVyUM7CDmQ2C5F+NSh52vzqDnAaQqfsQhUPLpJhmzEng==
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr789318wmc.192.1644320415325; 
 Tue, 08 Feb 2022 03:40:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/39] hw/intc/arm_gicv3_its: Split error checks
Date: Tue,  8 Feb 2022 11:39:47 +0000
Message-Id: <20220208113948.3217356-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In most of the ITS command processing, we check different error
possibilities one at a time and log them appropriately. In
process_mapti() and process_mapd() we have code which checks
multiple error cases at once, which means the logging is less
specific than it could be. Split those cases up.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-14-peter.maydell@linaro.org
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


