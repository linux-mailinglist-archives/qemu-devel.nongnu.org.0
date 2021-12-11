Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6444715C8
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:47:37 +0100 (CET)
Received: from localhost ([::1]:56544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw8LI-0004RW-D5
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:47:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7n2-0005HW-Ac
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:16 -0500
Received: from [2a00:1450:4864:20::42b] (port=44583
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mq-0006I7-Rq
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:05 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t18so20291629wrg.11
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZRdimySV2tzC3ZHoL/w1SnZpTEUgmFudXJ6uGktXNE=;
 b=YCoP3t/dzGidjiJUkM3yK3uA5zmXuWnDqPBJPT/QCzpo/8n0vHlwoe1sc8cYlky0mE
 8vWDy03rqc5i9J20dOnsf03Ax4gPT5sR6SlneZhnwNN/xZNVgZFBoPEHVUoLDldgHNNF
 iVWn/3gLnFfwlys3cd7kO+p2qwY5isE24mZO2S+k/gE8y8alVg0I/6ta6Z+ixfL8/V+6
 LMpOY05gM/Qnv68dfSTghIrG8gvv+CwiuaRkigzY78cNE+Vs3+cfnf289UMKYFPMPa/h
 7QgTia22M9i91hA3QYcX2WL32sbq8spqaPeAGB22mXcSrZweAPzjGoiQKyTsGLmoGl8T
 SMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RZRdimySV2tzC3ZHoL/w1SnZpTEUgmFudXJ6uGktXNE=;
 b=RP+ZdR4QfT7jhUVDTUS1XMo4l86bSLsLd3FzeZtWTSKKsETugN8IX5Xi6+5gWHafDC
 qz3PF+/Zb3Z6LgQ27paFajuHVhf/dGg3rIGZkrSibMQkwrK0lxqDt8DqIp975nJ25BXH
 CmXSm+Wt7ScobyO3m9JL0A/FX/+NOQiBYLEetYitem5AL+SmGxqWyhDRYIyJpfl4lNzl
 ya5RGzoUD4tzPsx/dcbpSTID3DUsdGlQEA/sykaFAILBHUBiqhCh8GF1/MGihIDzliHT
 XYYcHAWvyPMvdMPMzl2Ku1uS7Gav90wxsmZV/vXTy4lDQwkKvvEcUvVOELlWId9Vzbs+
 wV7w==
X-Gm-Message-State: AOAM533NU2jdU7FYGL2QFVTsxIM3In744iDKLaDnAA86d3HPBlZ3t4oV
 LqGteSffAMVyGEMCgrlaiSHKqg==
X-Google-Smtp-Source: ABdhPJwIGWtIdtnIST8DH+Rs4rtBcALtna4QB+47LOnXvDW9/tIoWvTD/aZ+MM119wfQR9vXiBbttA==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr21791800wry.360.1639249914991; 
 Sat, 11 Dec 2021 11:11:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapti()
Date: Sat, 11 Dec 2021 19:11:32 +0000
Message-Id: <20211211191135.1764649-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
---
 hw/intc/arm_gicv3_its.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 275af620058..5b25347de12 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -355,7 +355,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
     uint64_t dte = 0;
-    ItsCmdResult result = CMD_STALL;
+    IteEntry ite = {};
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
     offset += NUM_BYTES_IN_DW;
@@ -363,7 +363,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     eventid = (value & EVENTID_MASK);
@@ -379,7 +379,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     icid = value & ICID_MASK;
@@ -387,7 +387,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
@@ -407,19 +407,17 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
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


