Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3FD495490
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 20:02:32 +0100 (CET)
Received: from localhost ([::1]:45800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAchb-0007rT-Gu
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 14:02:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgm-0004Jo-1H
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:16 -0500
Received: from [2a00:1450:4864:20::333] (port=45853
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgi-0003Ji-BX
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:15 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso13332088wms.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7nY0b1HBA88jl9CMGGuocMVxAzKzMYWQu1cE8ZasydY=;
 b=pHLdSz+Z2SIihC83B0T6o8VKtH04rkbW7yOb9Fza740qSuxIuSUbjatDMFDG6DaLsV
 61ZEYR9Rz2Sp5anw90Y4922J9SO9nTSvrKPe0P9jPA5yMqmN9J6gylPxKoRehW1grGgG
 4pyebBrBGcpNFODtArlZvUCOuFpokN5kugY01MKxZ0g7TYXvy4BWCFlwtjjBAXCvFlUh
 WPAyCyRroq17tIfRvCzXLpYMXbhQ0SkPQZgPSBkQ00oowbEzWkEbfo4SQJfgHYSVNZSV
 U3M7vf9J0KG+aW+Cc624LHNlCamNKUJPq6zaGxiW1Uws/3o3HJ58sJBnDc0r3PtI/q5K
 ESiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7nY0b1HBA88jl9CMGGuocMVxAzKzMYWQu1cE8ZasydY=;
 b=VrXKGCqXNEFFDQLAgOPt5n+qF5Mx4dctU3u51AB3cGypgt6VpvRHgnwPy0lntFy/Ab
 nm0C2OsX+Jut/RX2QVdS2CxOyFsnL2yjbVxHaiWItvHnqfxlTT1ZN/Lfr2sRaTWdKW3h
 bmXgitszIb5hBSkVi+AD7rTtG/cMpUW4GEUmRh+x7/BoiW6y/4bVoQ9CPjUo0dMTXOa7
 Gv+DiFRzxm9SNmNq2axGsymIL39dlTNatjL6gEbkLjAdRSTJWOvkCKDQ1DPpvBjQcFV8
 X6jtE7QCWhysGa2gg0ZpHZh8RS0oavH7eeaQ5r91USkukllnSGHLJF3fRCrbVOWI3qnN
 xByQ==
X-Gm-Message-State: AOAM532OhmbJrwXXqYy6Px3V86v/VwjzHHqxIazcjMDdsYTm/88i9JOM
 2WFB1V1orcxczLCWjQLaX6SAyeyrXXe32Q==
X-Google-Smtp-Source: ABdhPJyMZO+xndlTS73mJ+TQ1seqDEI/Egk1bpWtzQ5ERMzdxPuB76Ooax+14ZX1TH4/G4HiwR4e5Q==
X-Received: by 2002:a5d:5601:: with SMTP id l1mr33999802wrv.213.1642682227156; 
 Thu, 20 Jan 2022 04:37:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/38] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapti()
Date: Thu, 20 Jan 2022 12:36:24 +0000
Message-Id: <20220120123630.267975-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Fix process_mapti() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220111171048.3545974-9-peter.maydell@linaro.org
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


