Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C744715C3
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:40:50 +0100 (CET)
Received: from localhost ([::1]:45428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw8Eg-00059K-Dw
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:40:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mr-00052G-35
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:02 -0500
Received: from [2a00:1450:4864:20::42d] (port=41747
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mo-0006HE-HX
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:00 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a9so20323150wrr.8
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d84nUQsl/62yYA2cXx0hg5Dh0WRkFm1Ipdz1tRw31fY=;
 b=W7IUKAOCffWvViOo6v5jZDt5IChO+9DVIRpAECDEVFgrB1nWjlwk5b/2hxy7vSN3D6
 9Rdxhq22/vWdSH4H3xmBc4lJ2/TUtJAOjx1Rjcz2q/zSYc0KIDueD8MoOAwb8lUgxA8Y
 pXPIKPG5QRx53UJBFMHofxBjjmVwjw8UGoifgsdkGsksV9LCgjJqzC9akhlJ738jmFk3
 RijDdIZ8wLmhwegILDUVdMfXVB+dEEbPj6yfRa8Y+gnlgFrsRhXDjLhUMG1Joc6KAw/M
 bz8NiN8X25j6u4PjTW40VfvWPsPu9+L3SO68Heynp+aHQhEJbjC+OZGIgxoS3TZNi/JQ
 SZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d84nUQsl/62yYA2cXx0hg5Dh0WRkFm1Ipdz1tRw31fY=;
 b=fBIgAk5JATexUJNmLIfT7o+OJyrrL9j6dP1dZBYsZW9kNNdcVetAUldGwhCaHI0Ps1
 Yp4wmJWaD0EU+pX+JL+i0mzynBmiHSAnRiCHzRW+6xEpBAbK7+9yPt3CUSOkQ6CSQkM2
 esZGcEugY6TOGjrYPI8spuc9grigjdHy0PZwgAMc0sg6nOkuETEnAKXk4ngY3DRheYkq
 //3VLU3a6hx/AnoJGCZqFmoz4rFHMfiUsPs7BtkWAsc4u9gUt58NIBpfS1qW5CzEiT5e
 q62Dr2FiXj3lXw7TKvbo7QBx9hvVFj0BGERFntEV+3sgiJhT6nsG3hBhoLRi1E6txLg4
 SrZw==
X-Gm-Message-State: AOAM530DZqPEIAp8lkY0ZwpjyfSpldd4CDjN9xsQ1XveYJdZBf7peFpL
 6E7KaiOaUoehvql3EUMs0bhNFg==
X-Google-Smtp-Source: ABdhPJzFztVZlkEeS6hGjDwKl4qArczseJvfehNrB3n67btltUOUr7a+2QOadOh0xcYV+4WMUlQeyA==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr22015266wry.422.1639249913517; 
 Sat, 11 Dec 2021 11:11:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 21/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_its_cmd()
Date: Sat, 11 Dec 2021 19:11:30 +0000
Message-Id: <20211211191135.1764649-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
---
 hw/intc/arm_gicv3_its.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 59dd564d91c..3a2254ea7c7 100644
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
@@ -316,10 +315,12 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
                       dte_valid ? "valid" : "invalid",
                       ite_valid ? "valid" : "invalid",
                       cte_valid ? "valid" : "invalid");
+        return CMD_CONTINUE;
     } else if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d > %d\n",
                       __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
     } else {
         /*
          * Current implementation only supports rdbase == procnum
@@ -328,7 +329,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         rdbase = FIELD_EX64(cte, CTE, RDBASE);
 
         if (rdbase >= s->gicv3->num_cpu) {
-            return result;
+            return CMD_CONTINUE;
         }
 
         if ((cmd == CLEAR) || (cmd == DISCARD)) {
@@ -340,11 +341,10 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
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


