Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9BE48B3AD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:21:12 +0100 (CET)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7KpZ-00063E-Co
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:21:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfl-0005CH-L5
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:03 -0500
Received: from [2a00:1450:4864:20::32f] (port=41492
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfi-0007Ju-7L
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:59 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so13771wme.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dMGaDtUlyJEJ3dvWwIKR4xUcpNypUeqgEu0z6OQaSkc=;
 b=F1l2anL8f77Vvt7h8eVK7CskwcxalUSFMqfDWrXQosjsMABIWsCe3xh84tk2HjE8qY
 SIlrlne48Qb4jz5TpxR8L5PbdZFvLQ6Ro2h01DxBTbPMwu+RXgcNx7cxzET/727ome6d
 gGQCUMb+ih3xNUkuxC9zKiGauScd3Rrvud/byoTLpRKn5b7ouE5QLndtHU0jqce6jaKZ
 Ng+whuiPwvmQr2R1DQfZcI7CLaC9nIjUY7hseo+bBsm1bB9Zmeq3R3ucgc6DOEWyDZcc
 rjHBrGJ9bjVwpOs7gCkgvuQy7etUq1KAo2HhIAbq89qr22eixdJ9wCX34u6buEqedzO8
 K+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dMGaDtUlyJEJ3dvWwIKR4xUcpNypUeqgEu0z6OQaSkc=;
 b=J8C8S1YrVCrp9UMLRCYw/4CGAoex7+o57ztQI4KjSDX8tpbYoZCciGDRrvUIBHFECS
 x7WgNOlB8vHJDkwK2qMc8EePH4DeP8UzStS3zFw5UL/No1awBZ+lKpKBGS3GV+SvF4EJ
 B4rS52X68k0gvBt0r9H9HuSqDWLPvzxvw2qhvFxJi/7nxPeZKdm8PNgpi4dYfXcvq2in
 RNZBf86aPeKeMKuV0vY4qDKVXTLK/aw+7FELazBvbxlqWTwZ12RV1jjXVf7uufj1FnV/
 fwAzkRR2PC2yRy78cGuTn6SAiwOSkJskmzXGWFqunsaLA+Z+O/ioV/GT7UGNt4ibBOw9
 dwhA==
X-Gm-Message-State: AOAM5339X5CQQU3adGPU2UJ+sFqkPWAn4JDgrrsRGtbgnloTmtgTgOzq
 0WKwfgnT57lgN+rZ9B9jJ9Yo+Q==
X-Google-Smtp-Source: ABdhPJw5FCGHS7+hLkLNRSMtOGkoTY8eqPRfCKpwshyaDQrD9tFOlyA66/s4N79zb7D4hjfoXslJhQ==
X-Received: by 2002:a05:600c:5025:: with SMTP id
 n37mr3315436wmr.18.1641921056521; 
 Tue, 11 Jan 2022 09:10:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapti()
Date: Tue, 11 Jan 2022 17:10:43 +0000
Message-Id: <20220111171048.3545974-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix process_mapti() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 5dc6846fe3f..010779a9fdc 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -357,7 +357,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
     uint64_t dte = 0;
-    ItsCmdResult result = CMD_STALL;
+    IteEntry ite = {};
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
     offset += NUM_BYTES_IN_DW;
@@ -365,7 +365,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     eventid = (value & EVENTID_MASK);
@@ -381,7 +381,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     icid = value & ICID_MASK;
@@ -389,7 +389,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
@@ -409,19 +409,17 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
          * we ignore this command and move onto the next
          * command in the queue
          */
-    } else {
-        /* add ite entry to interrupt translation table */
-        IteEntry ite = {};
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
-        ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
-
-        result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+        return CMD_CONTINUE;
     }
 
-    return result;
+    /* add ite entry to interrupt translation table */
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
+    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
+
+    return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
-- 
2.25.1


