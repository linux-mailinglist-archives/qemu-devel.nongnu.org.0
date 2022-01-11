Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A502848B426
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:39:57 +0100 (CET)
Received: from localhost ([::1]:58158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7L7k-0007M4-On
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:39:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfl-0005CF-Ka
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:03 -0500
Received: from [2a00:1450:4864:20::429] (port=34625
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfg-0007J8-9z
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:58 -0500
Received: by mail-wr1-x429.google.com with SMTP id h10so24085322wrb.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=77Xvvb93kRuq0kwxqLtAzTJqRqACUWX5HzdBepSqjy8=;
 b=fB1udekkew8p9fl1lMj8nTubohB41kthGpHkzhz96ijoAwJs56H5h7fvkBXnS86AGS
 dlVSZUn8jhIT1uHjjiZUR41Y0RgYtWE5xpufZbOyDnYt+j9aYtfQ677xzgKcR0BRgus8
 dexklcYGB1CHJTIfXtPkR2mMaBK83LeHfPMU5PE5Tz+CmCrmuhBHX7qIT2ymJdJtJxbe
 nVLxbXlqGkL360D6GUzWrYMOn60gbnxJpOj46fP1Y1WzoIL1CGIEElNldKRZgHeKwW15
 bfTm3W2brplHZ6ar3WA2NrxdntReNkCFkUfMNwE9YVS8wUnpxd51IcNCLKvnB70UeaAd
 YtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=77Xvvb93kRuq0kwxqLtAzTJqRqACUWX5HzdBepSqjy8=;
 b=Y2uSxxsXfjwE6MfrdxrDBD4t4sVYvhRt8E0g7rtjuGa8cXLIfkeBC0/og5+J+BKK/K
 XVVOIciFeRIegYJyCGlwmWkTY2v/i1lrlrbEIFbtaCssPDtDkxl+vc7ZlIpYrmPJ7Qo7
 QO4vEshcuOQ40oKBnswUH/UhQVqEsRQXPOkO2YH0Y6QaNbMqi0Q8VaU2voSIe+UiN8wr
 i/Bktk3b7Y6D+CdLhaB9opMm13FPHhzrWd4Uf+wEQWP0C4YArxT8XCYVvBtA14zHMZEW
 RC1Tido0Eax1+GhhJcPDbqQHZ9nroTV5TgOMwQWM+xNgnAWQ9TduqTDgn/Bptov0J9wB
 OyKQ==
X-Gm-Message-State: AOAM531SFJ3g6Ms01I/cbVdrsGYldew1+vSFsMo560p3MNekHUgsvhN8
 UFH9C0X+Emso9kCUWk/wAqmziw==
X-Google-Smtp-Source: ABdhPJznJ9+oka+YpbyoUZdjte7wkJrizD1mRILeW9z63s3EIZofOzDGmCeYJUH4ZWWHeoUnyMXnNw==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr4719929wrl.586.1641921055060; 
 Tue, 11 Jan 2022 09:10:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/13] hw/intc/arm_gicv3_its: Fix return codes in
 process_its_cmd()
Date: Tue, 11 Jan 2022 17:10:41 +0000
Message-Id: <20220111171048.3545974-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
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

Fix process_its_cmd() to consistently return CMD_STALL for
memory errors and CMD_CONTINUE for parameter errors, as
we claim in the comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


