Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4E7487B77
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:32:26 +0100 (CET)
Received: from localhost ([::1]:60864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t6H-0003DS-SG
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:32:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw6-00057m-Bl
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:55 -0500
Received: from [2a00:1450:4864:20::433] (port=37726
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw4-0007u0-NS
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id t28so5580218wrb.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9ONi2g/IZ5sSRQKd44Qd5XV4aNl9CKkjHv/QJp0hkkE=;
 b=r+CklIvi3CtCtH+a6EUZPMUwmuBGTQMhvod/J3S2OyAj9qJ/pyMzwODKAZ5uxCSrJ4
 0UFd3ZhXIGBg/NEauZv72HGb5B5YHjBfFrK+kfTjRv/5tWmHuA8oWTVHpIGEULqE0gPU
 IibU3VL14sbdgKtUM9suO0Lz5HLlhBqOR7csDmAfl7tEO9djKLLoYZHnT/KSWwvwuTpO
 Lc/6uJtEl1sO1AtlrzZq5Djq30i82stgCi7v2ToIB/g1DkNffd+XGlXNpB29hdYN9mzm
 4H0+1uInlDzJfBsRd4OkwfcPVixaLnvCoGDjHunZ4qnxNA49Xe3h3cmQlcpgusHFGaQq
 WhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ONi2g/IZ5sSRQKd44Qd5XV4aNl9CKkjHv/QJp0hkkE=;
 b=yW1bWc+oPW6ndieohk0iadpwwrl7sF6r1dazw5ponCWO/A2qY24xcume/1rCKBwEhk
 vCQCvVdsnJV4LrfPo+lBZ6OHb+AyBwmB0a2hMcqdcdRlI1y/k7W9pIEmzQHuwCHBK02i
 SSSh0mruLOcwBf7+FuaBN0Bj8p+dvpkvNc/yCFZLt9JaeOirMzukTlUfAG+pxU0TSUWE
 Fkg2a6r+UO5YU6ux441IUPHx+uBQgDbTO1kVFM2z9z+CPrbejuhkcZ3ZOQxIj1vNsGuY
 NUrWVXXS5QmaclYYf/4o4fDwK5nmOO8PAhzk/NyRSldCbmlGn6SKVyURT4deYih620B/
 chRg==
X-Gm-Message-State: AOAM531xxzZz20HqNLg/idjWkV/vAqPhANKGwXnMknwnHSKcHNZD/Byr
 E3mTDk3EfeXfjuGoLlUCzJDcqnWIjq+HuQ==
X-Google-Smtp-Source: ABdhPJzT7fRhonJLkTUvQMGmyv3rwEln6MXAXjsH/ip45CzNbJ8FIr7xaoilB7wbqQn1UixvzK8KLA==
X-Received: by 2002:adf:f6ca:: with SMTP id y10mr3053828wrp.80.1641576110948; 
 Fri, 07 Jan 2022 09:21:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/19] hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
Date: Fri,  7 Jan 2022 17:21:34 +0000
Message-Id: <20220107172142.2651911-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Currently the ITS code that reads and writes DTEs uses open-coded
shift-and-mask to assemble the various fields into the 64-bit DTE
word.  The names of the macros used for mask and shift values are
also somewhat inconsistent, and don't follow our usual convention
that a MASK macro should specify the bits in their place in the word.
Replace all these with use of the FIELD macro.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/gicv3_internal.h |  7 ++++---
 hw/intc/arm_gicv3_its.c  | 20 +++++++++-----------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 5a63e9ed5ce..6a3b145f377 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -393,9 +393,10 @@ FIELD(ITE_H, VPEID, 16, 16)
  * Valid = 1 bit,ITTAddr = 44 bits,Size = 5 bits
  */
 #define GITS_DTE_SIZE                 (0x8ULL)
-#define GITS_DTE_ITTADDR_SHIFT           6
-#define GITS_DTE_ITTADDR_MASK         MAKE_64BIT_MASK(GITS_DTE_ITTADDR_SHIFT, \
-                                                      ITTADDR_LENGTH)
+
+FIELD(DTE, VALID, 0, 1)
+FIELD(DTE, SIZE, 1, 5)
+FIELD(DTE, ITTADDR, 6, 44)
 
 /*
  * 8 bytes Collection Table Entry size
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6f21c56fba2..7a217b00f89 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -114,7 +114,7 @@ static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
     uint64_t itt_addr;
     MemTxResult res = MEMTX_OK;
 
-    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
+    itt_addr = FIELD_EX64(dte, DTE, ITTADDR);
     itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
 
     address_space_stq_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
@@ -141,7 +141,7 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
     bool status = false;
     IteEntry ite = {};
 
-    itt_addr = (dte & GITS_DTE_ITTADDR_MASK) >> GITS_DTE_ITTADDR_SHIFT;
+    itt_addr = FIELD_EX64(dte, DTE, ITTADDR);
     itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
 
     ite.itel = address_space_ldq_le(as, itt_addr +
@@ -255,10 +255,10 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     if (res != MEMTX_OK) {
         return result;
     }
-    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
+    dte_valid = FIELD_EX64(dte, DTE, VALID);
 
     if (dte_valid) {
-        max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
+        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
@@ -375,10 +375,8 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     if (res != MEMTX_OK) {
         return result;
     }
-    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
-
-    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
-
+    dte_valid = FIELD_EX64(dte, DTE, VALID);
+    max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
@@ -529,9 +527,9 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
     if (s->dt.valid) {
         if (valid) {
             /* add mapping entry to device table */
-            dte = (valid & TABLE_ENTRY_VALID_MASK) |
-                  ((size & SIZE_MASK) << 1U) |
-                  (itt_addr << GITS_DTE_ITTADDR_SHIFT);
+            dte = FIELD_DP64(dte, DTE, VALID, 1);
+            dte = FIELD_DP64(dte, DTE, SIZE, size);
+            dte = FIELD_DP64(dte, DTE, ITTADDR, itt_addr);
         }
     } else {
         return true;
-- 
2.25.1


