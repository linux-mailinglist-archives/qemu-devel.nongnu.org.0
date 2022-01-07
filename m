Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FDC487B86
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:38:39 +0100 (CET)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5tCI-00073d-Tm
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:38:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw7-00057p-51
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:55 -0500
Received: from [2a00:1450:4864:20::42f] (port=36572
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw4-0007tq-Nc
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:54 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r10so4676938wrc.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tSOlgz2UaWbHd7u1uudXrhAizaLypdvlSN/6koFWLOY=;
 b=C7uVl7tfHyVy2n7Ct6yNIfM930Kl1maSvVA8E8o9Z2ld2wV4NzEiNXgWHWZUEag5cv
 dvsjwapAZnpvkKrFzYqkD5hvVVErFufGjo7T5PtBOuvFf4pShdHn+O0LSCXUBuiaf8Za
 VT/xiCFVR8KFUwzAeTNUY+ZaIEQvC5w0itK0GctXdXZbnslKhVni6CjOfm1pqYwsSfl3
 zypAuqlplactUwDuyzgEnbnkL7WKpsw6iGw4M6KscPTD5EJ7K3xbh2s8gAQQZB/OdJ03
 TxZJuUjDD79tlPjF0I95AlotNUlBWEl3HSe+SmJgGooCzeGWO5ypw0mxl3b8QvQYG91i
 hM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSOlgz2UaWbHd7u1uudXrhAizaLypdvlSN/6koFWLOY=;
 b=FpR293zV54kPB/FMUgpZoA447sRIyQi/dkp/2hYptuM06yguNNMHx48COOAKj0Eyla
 /UsmYqAGgor/aTc83SM2IcGw526ExS/LrN1U60NTBxnJa4EY5BDwO7khLZfu9fAMrbgI
 /mLKtxBX7BQYTJ15whN18vvgBVIcoBh1SZfQ/6swwfYGuB2Ea24ZkWzUNiVrSF68A4Nr
 HG+s0p80YVJ/aFViw+P5X18dpMVKwK4IbI8z8KvGx3FDYEyhwDXxD1PXvH5REouB9J0k
 VeTbII1ICbs/TGtnIiErcUYvFRF3FCCiMW6aVpaUR+mcfX4RlVEQx8sd8LsBbVxuAaht
 b9sQ==
X-Gm-Message-State: AOAM530th2ZCqvYcKNHhpXCUM8BWDQqM5ID/O9sWUpMGXbaFwN93n8MP
 Mwsmm6ArjCr1IcbPOxU01zP5cJPQ+USQgg==
X-Google-Smtp-Source: ABdhPJwelehcB1ZTm3MCE43fudJA1Hxvh9bRZjHzG2U0KiY58qcL9zZssTqei1lnj4/AzYam6LgIIg==
X-Received: by 2002:adf:e902:: with SMTP id f2mr929189wrm.662.1641576110384;
 Fri, 07 Jan 2022 09:21:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/19] hw/intc/arm_gicv3_its: Correct handling of MAPI
Date: Fri,  7 Jan 2022 17:21:33 +0000
Message-Id: <20220107172142.2651911-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MAPI command takes arguments DeviceID, EventID, ICID, and is
defined to be equivalent to MAPTI DeviceID, EventID, EventID, ICID.
(That is, where MAPTI takes an explicit pINTID, MAPI uses the EventID
as the pINTID.)

We didn't quite get this right.  In particular the error checks for
MAPI include "EventID does not specify a valid LPI identifier", which
is the same as MAPTI's error check for the pINTID field.  QEMU's code
skips the pINTID error check entirely in the MAPI case.

We can fix this bug and in the process simplify the code by switching
to the obvious implementation of setting pIntid = eventid early
if ignore_pInt is true.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 15eb72a0a15..6f21c56fba2 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -354,7 +354,9 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
 
     eventid = (value & EVENTID_MASK);
 
-    if (!ignore_pInt) {
+    if (ignore_pInt) {
+        pIntid = eventid;
+    } else {
         pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
     }
 
@@ -377,14 +379,12 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
 
     max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
 
-    if (!ignore_pInt) {
-        max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
-    }
+    max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
             || !dte_valid || (eventid > max_eventid) ||
-            (!ignore_pInt && (((pIntid < GICV3_LPI_INTID_START) ||
-            (pIntid > max_Intid)) && (pIntid != INTID_SPURIOUS)))) {
+            (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
+             (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
                       "devid %d or icid %d or eventid %d or pIntid %d or"
@@ -400,11 +400,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         IteEntry ite = {};
         ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
         ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-        if (ignore_pInt) {
-            ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, eventid);
-        } else {
-            ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
-        }
+        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
         ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
         ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
-- 
2.25.1


