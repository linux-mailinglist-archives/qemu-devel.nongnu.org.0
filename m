Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FB8496D87
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 20:08:02 +0100 (CET)
Received: from localhost ([::1]:38232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLk1-0004mp-Vn
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 14:08:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4z-0005nA-NH
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:39 -0500
Received: from [2a00:1450:4864:20::431] (port=40723
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4u-0007hj-O3
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:37 -0500
Received: by mail-wr1-x431.google.com with SMTP id s18so5903541wrv.7
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MVgp6Ydys3b4ZUYTxQ7NMxi3s2REQ8l+tqo9NG4Dx+g=;
 b=WEWtf1prF/r0AoWHJ50DAOT1HyPSZWocu/NqtlB+sKgw96e2GmeHnQz462C7nShxyF
 NzyqG5H/la+WTvVtBwL6nXg3dIdeNffsNpFTfJQTONeUtNNtX5NkwNU8ImaIhY2lTDR7
 kEezG3Z5Q9gZcId5+suVJOKa9NrsTW/OpGuPRcFedmeriy2n4OdZ6j0sc6IaZ5+et5+Z
 mhlbePPOfa/poK0PT64UEF7TPUVO1pO75ykF9OGA6p6uuWi7CGrhj8fwB+5lXApPQ+V0
 EnUtHiYy3S/Ec9mzF+pff/8aRjD4pEIVT3HJzuNGpjP+tmOqppvRbK+rB8P0Y1LI0Ma2
 4AqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MVgp6Ydys3b4ZUYTxQ7NMxi3s2REQ8l+tqo9NG4Dx+g=;
 b=eC88E6biAaZl2gupjZw7ieNvmQBsrofZlkgn/fJLXg2khT7xhE6ti7LT77GXTGjnfv
 aFppVyy+GFbedtLPwRnLB7bDSt4SeWx4/vhC270z16JBcD8wBNulyQ2eiglsO3uz9Agv
 YvvSOhuL/fctEwFQVodqt1b0jF0J19EYw1TiIc0nHkHDQFEuSnBTOaLJzXMO7FPeKzjy
 51lTxzrpbDfWMrDGnLFhINwJv6QGvAOxQi6UtIV4ODBdh+y05h/UXv+ZspYLkScpnpda
 3kMRB1sNDFaGZyg9jM56Y4TWwNJnlFa1wQbdDeBJgWGeW2uj9QGiCTS5S8KAeU2RsWIm
 YOjQ==
X-Gm-Message-State: AOAM530Rcd8dNTs4DWF0ZC7I6Uogj23lbkFqRbLtvY2O1DO13oVKBdq7
 ffNSaL8oXvLurSsRTv2TcxeVUA==
X-Google-Smtp-Source: ABdhPJyCIp6F5YifLPMjl8licT+rBw27eKwXgqyIOxNR9V4AdVPTFoEM+TXk2cNTMIaIkw7hGxYEGQ==
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr8235096wrs.592.1642875894841; 
 Sat, 22 Jan 2022 10:24:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/14] hw/intc/arm_gicv3_its: Check table bounds against
 correct limit
Date: Sat, 22 Jan 2022 18:24:42 +0000
Message-Id: <20220122182444.724087-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


