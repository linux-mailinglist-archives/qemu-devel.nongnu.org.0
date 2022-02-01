Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD7D4A699B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 02:28:19 +0100 (CET)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF4RW-0006rs-45
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 20:28:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytM-0001sx-86
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:40 -0500
Received: from [2a00:1450:4864:20::331] (port=43646
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytI-0002Xg-1y
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso2339489wms.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EUHw8m4RBKGoqre1Z9En7gX4Mxb4JnFHHHZdcEKUkCs=;
 b=PT4/03686p5mVTGJvRQrm4cVIIdOtAlPa/KD8mY1Rq5+bclMBYb+u55yDHaBPbkI8E
 nh7IOksZq5+jh6avyqzHYeqXMCs/eVYBJUOsd8/cY1yAqytRQXXzjVRk1NaudkXgrtB5
 ggE2Ev5EcGieE/YDd7tvbj56Pi/iVTpGQsEzhCLK4a1h7qzaFLI1m52W26SZhHy8gqM5
 zaurEAVMQ/sd4m4Jo1p+VIcu13NROFP9IgRewocuElJDRTMfkd65Cw5SiJ82HAN43r1R
 ExpyKFnopCf7sOWi0Cxtbcbw9F4/c1O+I47re0tPzJnEVK++hMUDB5hK7ZyoSk1ckQdJ
 WELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EUHw8m4RBKGoqre1Z9En7gX4Mxb4JnFHHHZdcEKUkCs=;
 b=MaGHWkjqjUKNJjoOjoFmkR2+gEuekSUvLe5MMcluiZmRGy5qo6V7m5/7roadIkknGD
 GMFBRmyU77RufXivjJn85luusaRYJpB7CISgGb9onfAYZFUo7H1yv/v0YN/tJAtSQezI
 8p8f2qKE/Im/rQk0hR+0g8A+B6ggfz3Ko7YNPEZkjtzuYvdQAzkaz+IcMv/qTNm6Hvbh
 3vO3U05a9s649zzViUazssRFe8tXMcIVh3RfgV6ZaP3QDA/l3Lcr0y/M3RFIplX0AsA0
 txPVbqbVKd89Few91BQmWxiSjfhcWUNe++YM1r/+idm7cHTwpiSeC39karLp19nMcaJB
 0fYg==
X-Gm-Message-State: AOAM530wutQ4G+RvTaFl5CuEn9dmzAQuoOuxnidg71WjToJkHq7gs8no
 gCQYcMNwrWbVBcVNimMq2NJ8cg==
X-Google-Smtp-Source: ABdhPJwiENaiStnlF9RXLepv/dPjLSLwoaK61gmupM4YlmD6gvR3vpmZuwQ6/m/mNlkduLty9S77Tw==
X-Received: by 2002:a05:600c:1f0a:: with SMTP id
 bd10mr3093343wmb.6.1643743938426; 
 Tue, 01 Feb 2022 11:32:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:32:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/13] hw/intc/arm_gicv3_its: Drop TableDesc and CmdQDesc
 valid fields
Date: Tue,  1 Feb 2022 19:32:04 +0000
Message-Id: <20220201193207.2771604-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

Currently we track in the TableDesc and CmdQDesc structs the state of
the GITS_BASER<n> and GITS_CBASER Valid bits.  However we aren't very
consistent abut checking the valid field: we test it in update_cte()
and update_dte(), but not anywhere else we look things up in tables.

The GIC specification says that it is UNPREDICTABLE if a guest fails
to set any of these Valid bits before enabling the ITS via
GITS_CTLR.Enabled.  So we can choose to handle Valid == 0 as
equivalent to a zero-length table.  This is in fact how we're already
catching this case in most of the table-access paths: when Valid is 0
we leave the num_entries fields in TableDesc or CmdQDesc set to zero,
and then the out-of-bounds check "index >= num_entries" that we have
to do anyway before doing any of these table lookups will always be
true, catching the no-valid-table case without any extra code.

So we can remove the checks on the valid field from update_cte()
and update_dte(): since these happen after the bounds check there
was never any case when the test could fail. That means the valid
fields would be entirely unused, so just remove them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv3_its_common.h |  2 --
 hw/intc/arm_gicv3_its.c                | 31 ++++++++++++--------------
 2 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 3e2ad2dff60..0f130494dd3 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -42,7 +42,6 @@
 #define GITS_TRANSLATER  0x0040
 
 typedef struct {
-    bool valid;
     bool indirect;
     uint16_t entry_sz;
     uint32_t page_sz;
@@ -51,7 +50,6 @@ typedef struct {
 } TableDesc;
 
 typedef struct {
-    bool valid;
     uint32_t num_entries;
     uint64_t base_addr;
 } CmdQDesc;
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index e3b63efddcc..9735d609df2 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -442,10 +442,6 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, const CTEntry *cte)
     uint64_t cteval = 0;
     MemTxResult res = MEMTX_OK;
 
-    if (!s->ct.valid) {
-        return true;
-    }
-
     if (cte->valid) {
         /* add mapping entry to collection table */
         cteval = FIELD_DP64(cteval, CTE, VALID, 1);
@@ -504,15 +500,11 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, const DTEntry *dte)
     uint64_t dteval = 0;
     MemTxResult res = MEMTX_OK;
 
-    if (s->dt.valid) {
-        if (dte->valid) {
-            /* add mapping entry to device table */
-            dteval = FIELD_DP64(dteval, DTE, VALID, 1);
-            dteval = FIELD_DP64(dteval, DTE, SIZE, dte->size);
-            dteval = FIELD_DP64(dteval, DTE, ITTADDR, dte->ittaddr);
-        }
-    } else {
-        return true;
+    if (dte->valid) {
+        /* add mapping entry to device table */
+        dteval = FIELD_DP64(dteval, DTE, VALID, 1);
+        dteval = FIELD_DP64(dteval, DTE, SIZE, dte->size);
+        dteval = FIELD_DP64(dteval, DTE, ITTADDR, dte->ittaddr);
     }
 
     entry_addr = table_entry_addr(s, &s->dt, devid, &res);
@@ -901,7 +893,6 @@ static void extract_table_params(GICv3ITSState *s)
         }
 
         memset(td, 0, sizeof(*td));
-        td->valid = FIELD_EX64(value, GITS_BASER, VALID);
         /*
          * If GITS_BASER<n>.Valid is 0 for any <n> then we will not process
          * interrupts. (GITS_TYPER.HCC is 0 for this implementation, so we
@@ -909,8 +900,15 @@ static void extract_table_params(GICv3ITSState *s)
          * for the register corresponding to the Collection table but we
          * still have to process interrupts using non-memory-backed
          * Collection table entries.)
+         * The specification makes it UNPREDICTABLE to enable the ITS without
+         * marking each BASER<n> as valid. We choose to handle these as if
+         * the table was zero-sized, so commands using the table will fail
+         * and interrupts requested via GITS_TRANSLATER writes will be ignored.
+         * This happens automatically by leaving the num_entries field at
+         * zero, which will be caught by the bounds checks we have before
+         * every table lookup anyway.
          */
-        if (!td->valid) {
+        if (!FIELD_EX64(value, GITS_BASER, VALID)) {
             continue;
         }
         td->page_sz = page_sz;
@@ -936,9 +934,8 @@ static void extract_cmdq_params(GICv3ITSState *s)
     num_pages = FIELD_EX64(value, GITS_CBASER, SIZE) + 1;
 
     memset(&s->cq, 0 , sizeof(s->cq));
-    s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
 
-    if (s->cq.valid) {
+    if (FIELD_EX64(value, GITS_CBASER, VALID)) {
         s->cq.num_entries = (num_pages * GITS_PAGE_SIZE_4K) /
                              GITS_CMDQ_ENTRY_SIZE;
         s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
-- 
2.25.1


