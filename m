Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20848B3B5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:23:30 +0100 (CET)
Received: from localhost ([::1]:57510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Krp-00025k-Oe
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:23:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kff-0005AV-NN
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:56 -0500
Received: from [2a00:1450:4864:20::42b] (port=41770
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfe-0007HR-2r
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:55 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v6so34157753wra.8
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ob5bbn/w0TzbvNqJivAvBR3jtD/48+Yhebkf8RVzKMw=;
 b=sWVfeHV953skZ1ANSKtB6LVaJUAudCwVCsUQs+r8/tdWImub794kbVVD3TW1Opdqed
 9TfNlbHkP6MPWkT8mstz6mmXvnb/vAkns130luOY4YUZiyW5TOLZxYryuQeT4kSiWNql
 135tWjwhc6Wvk9DnHXG74LTAJu97ZKHm6aF4UsDscpnT6pE8ZRPmBlI5ZpNFPk46ZXWl
 G+NPPFsxqr/kGaIfATL2Y++B3o6dKYEO/mV+ut3avaXtfh6ldGyTXeKCKaz0jM5NZqdL
 ewkV+j0LzkBLV8mbRbNUTKa9tX37Fn6Oz/Oqi2ND6V66W3vEawcLQ3+goAW3nbt+CeIg
 teWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ob5bbn/w0TzbvNqJivAvBR3jtD/48+Yhebkf8RVzKMw=;
 b=Ztus0ilw6ciVLNOacqMoBtvKFsOczhgzNCbm1wseiPATYrzICrEvU1p8cz6O/NHp0K
 Zsh9j0ppik+1XoBOUF3Fjz+C/vZookZqs0FTVESwmzr6+fyIJKL2IVRE5bk4UwsrRXBg
 bhDEJiDvNYXziz432bBGpMByVFgrCM4yYFin149go7SPhGBkveKGDR0My9KTZsFLPVqG
 26Ld3qFlXyk6Dv19jJxOi9pVfeSPsTDenmhTlzHZW3ZBa0A/0zhSRwhYYQj+Fz8KC9xm
 OAl/s8cp/lHLhl+AtX2u9KF61IUrMDLQXk+rnkx71HcpXgknjzJWlEgho1rAPbHq8aGK
 PuXA==
X-Gm-Message-State: AOAM530YaZfO0TPpG7SZXW5NLgxB6YaUUlGf0N6wX8wvNs+QzW8wmynv
 gk6iqwFyqraeIur4ULCMoZbNew==
X-Google-Smtp-Source: ABdhPJz+6tiYN8uN+ZbhGRQryNbfTu0AoimJeMiEJLMOi/9RtBm49pzsvfHk65PpTpam9N0/qNZdXQ==
X-Received: by 2002:a05:6000:1883:: with SMTP id
 a3mr4811160wri.565.1641921051657; 
 Tue, 11 Jan 2022 09:10:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/13] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Date: Tue, 11 Jan 2022 17:10:36 +0000
Message-Id: <20220111171048.3545974-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
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

In process_its_cmd() and process_mapti() we must check the
event ID against a limit defined by the size field in the DTE,
which specifies the number of ID bits minus one. Convert
this code to our num_foo convention:
 * change the variable names
 * use uint64_t and 1ULL when calculating the number
   of valid event IDs, because DTE.SIZE is 5 bits and
   so num_eventids may be up to 2^32
 * fix the off-by-one error in the comparison

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index fa3cdb57554..6d11fa02040 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -225,7 +225,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     bool dte_valid;
     uint64_t dte = 0;
-    uint32_t max_eventid;
+    uint64_t num_eventids;
     uint16_t icid = 0;
     uint32_t pIntid = 0;
     bool ite_valid = false;
@@ -258,7 +258,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
     if (dte_valid) {
-        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
@@ -299,10 +299,11 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
                       dte_valid ? "valid" : "invalid",
                       ite_valid ? "valid" : "invalid",
                       cte_valid ? "valid" : "invalid");
-    } else if (eventid > max_eventid) {
+    } else if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: eventid %d > %d\n",
-                      __func__, eventid, max_eventid);
+                      "%s: invalid command attributes: eventid %d >= %"
+                      PRId64 "\n",
+                      __func__, eventid, num_eventids);
     } else {
         /*
          * Current implementation only supports rdbase == procnum
@@ -336,7 +337,8 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
-    uint32_t max_eventid, max_Intid;
+    uint64_t num_eventids;
+    uint32_t max_Intid;
     bool dte_valid;
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
@@ -376,11 +378,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         return result;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
-    max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
-            || !dte_valid || (eventid > max_eventid) ||
+            || !dte_valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.25.1


