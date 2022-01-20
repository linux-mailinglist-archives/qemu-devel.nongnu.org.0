Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA14952F0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:12:41 +0100 (CET)
Received: from localhost ([::1]:40360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAazH-0007Ka-SF
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:12:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgw-0004ZG-7r
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:26 -0500
Received: from [2a00:1450:4864:20::330] (port=34395
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgu-0003Mn-Hj
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:25 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so6873257wmb.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PdLeVPRL/oM31cFXR0agK/+hdIG6BeN/CCyvokLYiU4=;
 b=RtkS6dB7lk6dmKZxg8NqhyTDCU8Y0M9/1fFdw+ZTRG2jjQ+3uWipUs92T/r6wBZe4P
 juCvp6FCIMngru2jtXG9dSCZf33cFUBdu50G6W+ultQi3jtIZPqMKTB+4qQhhq/XQLg0
 eMSSIOU2m/sHshHAaLkWzogzMhjRwYDryqniR4NtKHYi9W7nrwL7NC8cYjLd9cMPKwto
 Div5zV5tH9hd/WNojuwfr2G7oIP+/CCy9phlxR7r0wcUQ7jZgZv+dbDi+eNkJDxWXS5X
 sNTCIU3vHVhIhrsMmN1nZalLvCxbaLPMoSat1ai9fVWohf3vDmk3NFJCNIMWyebLlLx5
 FhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdLeVPRL/oM31cFXR0agK/+hdIG6BeN/CCyvokLYiU4=;
 b=nAlGsAwqhJPfQc5IQTs8G684Xiu2f57Hg6Uc7LWC4LRhlBj9W5I+lz7L6guszY5k5c
 sSRT3B++BI+llUrFsmfvNPlvmVpvvMMZhPmveBApZ5FUA4a2azaiE6x1ALgrQovq6ohd
 l28xlpcRMISf0TBQc7hCxaTcLoos2GL95o1JGdRZScjm6ESpfX0i7oNuqX7F0eU7uPs1
 +D3k6VrsCm2kAo8Yr2+DTmy+mBQRcsJTmHizojY7UEXrxHHFsOmCkr42WFG+d1TlXbD1
 Rmkznym/FGaoRrfLKBGm3DujVMLmXsgDE8k9p/tZ2cd52rZEvCwYtLT/9Z90tiYpWK2a
 HDPQ==
X-Gm-Message-State: AOAM531cN68AKCCFchzpfCCvxG5Lq3O7wKxuv1ag93XtIr/KWqi2715F
 h/JC4ukSYDY3fBAiYl6AlcqWx5ZNQmNGEQ==
X-Google-Smtp-Source: ABdhPJx2yOHnjg3863r/+qk+bk4qP02CAAa98i+f+MCb8CqNygG1+9D8eHhFf/c+kZySpN8XwISy5w==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr18914008wrz.76.1642682243280; 
 Thu, 20 Jan 2022 04:37:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/38] hw/intc/arm_gicv3_its: Check indexes before use,
 not after
Date: Thu, 20 Jan 2022 12:36:28 +0000
Message-Id: <20220120123630.267975-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

In a few places in the ITS command handling functions, we were
doing the range-check of an event ID or device ID only after using
it as a table index; move the checks to before the uses.

This misordering wouldn't have very bad effects because the
tables are in guest memory anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20220111171048.3545974-13-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 42 ++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 985e316eda9..ef6c0f55ff9 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -255,6 +255,13 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
 
     eventid = (value & EVENTID_MASK);
 
+    if (devid >= s->dt.num_ids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: devid %d>=%d",
+                      __func__, devid, s->dt.num_ids);
+        return CMD_CONTINUE;
+    }
+
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
@@ -272,6 +279,14 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
 
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d >= %"
+                      PRId64 "\n",
+                      __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
+    }
+
     ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
     if (res != MEMTX_OK) {
         return CMD_STALL;
@@ -296,20 +311,6 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         return CMD_CONTINUE;
     }
 
-    if (devid >= s->dt.num_ids) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_ids);
-        return CMD_CONTINUE;
-    }
-    if (eventid >= num_eventids) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: eventid %d >= %"
-                      PRId64 "\n",
-                      __func__, eventid, num_eventids);
-        return CMD_CONTINUE;
-    }
-
     /*
      * Current implementation only supports rdbase == procnum
      * Hence rdbase physical address is ignored
@@ -375,6 +376,13 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
 
     icid = value & ICID_MASK;
 
+    if (devid >= s->dt.num_ids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: devid %d>=%d",
+                      __func__, devid, s->dt.num_ids);
+        return CMD_CONTINUE;
+    }
+
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
@@ -384,14 +392,14 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
-    if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
+    if ((icid >= s->ct.num_ids)
             || !dte_valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
-                      "devid %d or icid %d or eventid %d or pIntid %d or"
-                      "unmapped dte %d\n", __func__, devid, icid, eventid,
+                      "icid %d or eventid %d or pIntid %d or"
+                      "unmapped dte %d\n", __func__, icid, eventid,
                       pIntid, dte_valid);
         /*
          * in this implementation, in case of error
-- 
2.25.1


