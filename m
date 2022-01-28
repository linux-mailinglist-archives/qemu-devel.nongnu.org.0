Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14AB49FE15
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:32:45 +0100 (CET)
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUB2-0001hH-CI
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:32:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDN-0002G0-W9
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:06 -0500
Received: from [2a00:1450:4864:20::436] (port=45774
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDK-0006Qx-Rw
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id m14so11326644wrg.12
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nt57404GQCCDte9pU9fRtCALvozcsS/OoqOX4/fyBcM=;
 b=hvP1BxRHrVVGIC+2SZ/e041kduzkcI+ouJCDxTVLcVJBWZOzy5spcDjh19lAnzg4Uf
 AjguVEmYS0IasvYwSsb6tmWPi0AHJeAhFg1k7OtobyuyizsxLPf5SPTJ8ZrQSz70G2Tm
 spG2MDUEl69VzfGuC42emtQG55g8O7fRmgRwsX1QvpWWMp20NKw36y6raWdrjYZzvd67
 Vg4tlwVKIsU8nJnxTjdpj4/0ZbTXX0Rv1XKa/eO6t9sW+KgaI9HlrDLYmTmjXbytU65r
 +I9+5DQgLOnvbP0N4atrnXPNLGnJhW1g44s3HyApFhn+liFbAagLdhi5+mEE6634fSoI
 1tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nt57404GQCCDte9pU9fRtCALvozcsS/OoqOX4/fyBcM=;
 b=hD9BHdv3Y1cxPgc6ysq6nnkv6U2RemerkGvaZHFoz8GadLHC9tCbJ7v74Z0e54amOS
 2rNt6v6FWLqnW4QQ7aNy8yF9QipNXE9RT5SFS1yCKG7OPMKRhhYdR4+QNoEBVwSk6jJh
 ntD2dEpDA6SBRNzxly1hUT4tvX1u7gEvGLGtIXwb1nks4x8CZEM+XUxEsHCbNraOAhxV
 iLK1McKcshNhRRFwzxtK7iEoQfPgAJcZ86ppr0u93vm41BZvGLzPm0/0Z9ZPFvg+Ih48
 5hCOvU/xChfCsEVTR5tZ99GLVZKmAqeJsvo0tXJK5k553ti/+xnPf+wZNaj4oHsI1VFx
 X09A==
X-Gm-Message-State: AOAM530QsKxiZj4NYEJEVn7GT4ItzC0YkKEndn1mCgcf/retSxva/Ico
 RDusFSy17DsPLN7iXkA6PZh889cqMMCEQQ==
X-Google-Smtp-Source: ABdhPJzbFduWPRkOSy/ozR19uwdbbh35PrAwseSJyc2sEHNW0j8Otf3UkGXZ0W0I2hMGEybD45bpUw==
X-Received: by 2002:a05:6000:1448:: with SMTP id
 v8mr7309817wrx.43.1643383840083; 
 Fri, 28 Jan 2022 07:30:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/32] hw/intc/arm_gicv3_its: Check table bounds against
 correct limit
Date: Fri, 28 Jan 2022 15:30:05 +0000
Message-Id: <20220128153009.2467560-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently when we fill in a TableDesc based on the value the guest
has written to the GITS_BASER<n> register, we calculate both:
 * num_entries : the number of entries in the table, constrained
   by the amount of memory the guest has given it
 * num_ids : the number of IDs we support for this table,
   constrained by the implementation choices and the architecture
   (eg DeviceIDs are 16 bits, so num_ids is 1 << 16)

When validating ITS commands, however, we check only num_ids,
thus allowing a broken guest to specify table entries that
index off the end of it. This will only corrupt guest memory,
but the ITS is supposed to reject such commands as invalid.

Instead of calculating both num_entries and num_ids, set
num_entries to the minimum of the two limits, and check that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-13-peter.maydell@linaro.org
---
 include/hw/intc/arm_gicv3_its_common.h |  1 -
 hw/intc/arm_gicv3_its.c                | 18 +++++++++---------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index b32c697207f..3e2ad2dff60 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -47,7 +47,6 @@ typedef struct {
     uint16_t entry_sz;
     uint32_t page_sz;
     uint32_t num_entries;
-    uint32_t num_ids;
     uint64_t base_addr;
 } TableDesc;
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 237198845d7..3f2ead45369 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -256,10 +256,10 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
 
     eventid = (value & EVENTID_MASK);
 
-    if (devid >= s->dt.num_ids) {
+    if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_ids);
+                      __func__, devid, s->dt.num_entries);
         return CMD_CONTINUE;
     }
 
@@ -300,7 +300,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         return CMD_CONTINUE;
     }
 
-    if (icid >= s->ct.num_ids) {
+    if (icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
                       __func__, icid);
@@ -384,10 +384,10 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
 
     icid = value & ICID_MASK;
 
-    if (devid >= s->dt.num_ids) {
+    if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
-                      __func__, devid, s->dt.num_ids);
+                      __func__, devid, s->dt.num_entries);
         return CMD_CONTINUE;
     }
 
@@ -400,7 +400,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
-    if ((icid >= s->ct.num_ids)
+    if ((icid >= s->ct.num_entries)
             || !dte_valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
              (pIntid != INTID_SPURIOUS))) {
@@ -485,7 +485,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((icid >= s->ct.num_ids) || (rdbase >= s->gicv3->num_cpu)) {
+    if ((icid >= s->ct.num_entries) || (rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
                       "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
@@ -566,7 +566,7 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((devid >= s->dt.num_ids) ||
+    if ((devid >= s->dt.num_entries) ||
         (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPD: invalid device table attributes "
@@ -791,7 +791,7 @@ static void extract_table_params(GICv3ITSState *s)
                                   L1TABLE_ENTRY_SIZE) *
                                  (page_sz / td->entry_sz));
         }
-        td->num_ids = 1ULL << idbits;
+        td->num_entries = MIN(td->num_entries, 1ULL << idbits);
     }
 }
 
-- 
2.25.1


