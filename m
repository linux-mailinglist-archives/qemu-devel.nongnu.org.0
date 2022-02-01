Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491FF4A697F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 02:13:06 +0100 (CET)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF4Ch-0007SB-M8
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 20:13:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytB-0001nP-4C
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:32 -0500
Received: from [2a00:1450:4864:20::434] (port=38555
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEysx-0002WW-EC
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:16 -0500
Received: by mail-wr1-x434.google.com with SMTP id h7so2240842wrc.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K0nLPSuvZhVnaozrSckCXHtamDQkkON8hOQuG5n7HiU=;
 b=yIbPQlnf8scHcROhpf5AY1WQ0ehLAqmw9oatx2UqtJN4Nu0/1VCkOjPQDSomDN3eSE
 LukTVVBtpaG4DD/tZEZZepIyD10g9eYyesHo+AnlybNeEMIuRuzXx4870Gu4YOLlvA3a
 xP1EWxcDheqzHevu+kQwBFNKhGTH98d9UziCrBiDQ+hGlO1zrdH6YVKLW4CDo7crwEfY
 GoZFawtSlm91L9x62E2DXLlgZHG5SCX88Cy50LM4vXL61IM/1+5l7d3o5Z4EgB26sWyd
 e0BnUmpuAtRDcIRmC34MCBbOVC7DXbSuKE42g26quCKYiMb3TeeJRpSVwqihSckOdR74
 5E6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K0nLPSuvZhVnaozrSckCXHtamDQkkON8hOQuG5n7HiU=;
 b=hAQUj9AFS8zxHltv8Uhz+WN4Qdzu5xzAGbtXwGwbgaQ/YZ4sZkN6aiSCtIClOYTr+y
 tfJdCY+BghZCYQsX6JfxXoCo/bkXYSgdj6OeQ0ew/jVqOGJb0XmQHQxngA79WQiJB5kv
 IUiTMiRmyVrqgAfhfZ/0h3n5DnaeC27PyCf2wZ1j4thGTldainmO7XAqttgPnzNi5R0b
 4gb3rlN2Au3adhciWc8MH/uKqO+Vsmpleric49A7y3GiPMaPkQOuYNd74bNMh5iSIs2v
 t4FRA0iEOBziXykAWXSewyn1IylpS0WS6RFIhVXf+AoKFc0OrT5GVNaAnC1t3fcAPC2f
 eM0Q==
X-Gm-Message-State: AOAM5304ROIDwjkYMfTWYkeJ2d0LfUM6x4FnZW51s8lTcs8bSJhHQ/Ew
 E6pLGaDdzsimD/OzYwx8Pu0BEA==
X-Google-Smtp-Source: ABdhPJzd7vSWsocdk98qnrgohzJj18Z9UsL34ykboMedi9sr4hR2TeXaeE7/5/6ZyLzEObWW5BbxkA==
X-Received: by 2002:a05:6000:10c:: with SMTP id
 o12mr22533087wrx.299.1643743934027; 
 Tue, 01 Feb 2022 11:32:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:32:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/13] hw/intc/arm_gicv3_its: Pass CTEntry to update_cte()
Date: Tue,  1 Feb 2022 19:31:59 +0000
Message-Id: <20220201193207.2771604-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Make update_cte() take a CTEntry struct rather than all the fields
of the new CTE as separate arguments.

This brings it into line with the update_dte() API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 482a71ba73c..b94775fd379 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -418,22 +418,25 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
-static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
-                       uint64_t rdbase)
+/*
+ * Update the Collection Table entry for @icid to @cte. Returns true
+ * on success, false if there was a memory access error.
+ */
+static bool update_cte(GICv3ITSState *s, uint16_t icid, const CTEntry *cte)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint64_t entry_addr;
-    uint64_t cte = 0;
+    uint64_t cteval = 0;
     MemTxResult res = MEMTX_OK;
 
     if (!s->ct.valid) {
         return true;
     }
 
-    if (valid) {
+    if (cte->valid) {
         /* add mapping entry to collection table */
-        cte = FIELD_DP64(cte, CTE, VALID, 1);
-        cte = FIELD_DP64(cte, CTE, RDBASE, rdbase);
+        cteval = FIELD_DP64(cteval, CTE, VALID, 1);
+        cteval = FIELD_DP64(cteval, CTE, RDBASE, cte->rdbase);
     }
 
     entry_addr = table_entry_addr(s, &s->ct, icid, &res);
@@ -446,27 +449,26 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
         return true;
     }
 
-    address_space_stq_le(as, entry_addr, cte, MEMTXATTRS_UNSPECIFIED, &res);
+    address_space_stq_le(as, entry_addr, cteval, MEMTXATTRS_UNSPECIFIED, &res);
     return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint16_t icid;
-    uint64_t rdbase;
-    bool valid;
+    CTEntry cte;
 
     icid = cmdpkt[2] & ICID_MASK;
 
-    rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
-    rdbase &= RDBASE_PROCNUM_MASK;
+    cte.rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
+    cte.rdbase &= RDBASE_PROCNUM_MASK;
 
-    valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
+    cte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
 
-    if ((icid >= s->ct.num_entries) || (rdbase >= s->gicv3->num_cpu)) {
+    if ((icid >= s->ct.num_entries) || (cte.rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
-                      "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
+                      "icid %d rdbase %u\n",  icid, cte.rdbase);
         /*
          * in this implementation, in case of error
          * we ignore this command and move onto the next
@@ -475,7 +477,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
+    return update_cte(s, icid, &cte) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
-- 
2.25.1


