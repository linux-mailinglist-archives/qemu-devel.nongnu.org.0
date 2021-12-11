Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9B4715C6
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:43:57 +0100 (CET)
Received: from localhost ([::1]:49864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw8Hk-0008KK-Ui
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:43:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mo-00050u-W8
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:00 -0500
Received: from [2a00:1450:4864:20::336] (port=41544
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mg-0006FR-ND
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:54 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so8983247wmb.0
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v5QRtWEq9rai4ta3s3hwqSptGk7HWdb5keOPgoZDODQ=;
 b=lwxO+Srnzar7Oi0uaGR+cSK0htOHFhQhORvO+4mgfn9RDmM581xBAn4l2xbcXNn/Fa
 u3ZxLPHWQZcwF9Ra0VF4ZWoQdDrAe2uDeRIAj+LfjuoFoWDuGHSYMP/X8rKGrqWWj86I
 b2PwHiQ024BHPS10n4SjgFBkyMNh3msnAD+D+6FcMi0zCh9cNpWnv+oBk80uqUAknnQn
 jAPKDzoOp3yqLLFTBJlutxtXHzsPmtVVQt+7di43CTreONQQx3mml8Ixd0O6suKTGZ1T
 k8bLwM0vJCh2U1rO0WcdQ2V0lxbFC6o78wwHAe0seVVIEvBitAMP9epLAMkNmFuhXsFa
 wQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5QRtWEq9rai4ta3s3hwqSptGk7HWdb5keOPgoZDODQ=;
 b=N47LR17z4ZVTlJGT1E4P9Tt1acTwRPcs9fHSLboMHnLFH2Q3k2N31cMdnOJgSWgpP6
 fiNbCB24/6lcv9tNZAxx8dNIj9LkGUdxqptGfWFp7Se2aGlKAjo2ZgPpYQrzYZ7OHCo9
 y+xwidCbL935cmuKE8e7ON527wcL3QhYCHMlGZoNAFwOfQdHbAIO1djx1ZV6O8vajpXK
 MNPHWXUSz30HnnLVQf9jkcJoEX9N3kkuba8bPxbkmg/LoGAYrlhJ7L8ZRaMoP2zXvi7e
 Hymf8KJ1kPgDJlzjvT6tFNom+8zaiUYrF0vLo1f1DjNoD1i0aeAtT8/AYLD0knFqg2k/
 drLA==
X-Gm-Message-State: AOAM531OngzM/jxj3p5dO8L+sUer//QCOYE6NfZQepwqruxYopZp/Un/
 35iC+N+hQjcLYAhg5J6mhlv77A==
X-Google-Smtp-Source: ABdhPJy4znj2VtfrOyx41sb9jQjyN9jGI44EV8Axp+8h7Inp0r9ia+xT1hVC0YI+DKqnsBYB1bpUMA==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr3475969wmj.45.1639249908879; 
 Sat, 11 Dec 2021 11:11:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/26] hw/intc/arm_gicv3_its: Fix various off-by-one errors
Date: Sat, 11 Dec 2021 19:11:23 +0000
Message-Id: <20211211191135.1764649-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The ITS code has to check whether various parameters passed in
commands are in-bounds, where the limit is defined in terms of the
number of bits that are available for the parameter.  (For example,
the GITS_TYPER.Devbits ID register field specifies the number of
DeviceID bits minus 1, and device IDs passed in the MAPTI and MAPD
command packets must fit in that many bits.)

Currently we have off-by-one bugs in many of these bounds checks.
The typical problem is that we define a max_foo as 1 << n. In
the Devbits example, we set
  s->dt.max_ids = 1UL << (GITS_TYPER.Devbits + 1).
However later when we do the bounds check we write
  if (devid > s->dt.max_ids) { /* command error */ }
which incorrectly permits a devid of 1 << n.

These bugs will not cause QEMU crashes because the ID values being
checked are only used for accesses into tables held in guest memory
which we access with address_space_*() functions, but they are
incorrect behaviour of our emulation.

Fix them by standardizing on this pattern:
 * bounds limits are named num_foos and are the 2^n value
   (equal to the number of valid foo values)
 * bounds checks are either
   if (fooid < num_foos) { good }
   or
   if (fooid >= num_foos) { bad }

In this commit we fix the handling of the number of IDs
in the device table and the collection table, and the number
of commands that will fit in the command queue.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv3_its_common.h |  6 +++---
 hw/intc/arm_gicv3_its.c                | 26 +++++++++++++-------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 85a144b0e49..b32c697207f 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -46,14 +46,14 @@ typedef struct {
     bool indirect;
     uint16_t entry_sz;
     uint32_t page_sz;
-    uint32_t max_entries;
-    uint32_t max_ids;
+    uint32_t num_entries;
+    uint32_t num_ids;
     uint64_t base_addr;
 } TableDesc;
 
 typedef struct {
     bool valid;
-    uint32_t max_entries;
+    uint32_t num_entries;
     uint64_t base_addr;
 } CmdQDesc;
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index ab6ce09dbc2..7b50d3a29f0 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -286,10 +286,10 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
      * In this implementation, in case of guest errors we ignore the
      * command and move onto the next command in the queue.
      */
-    if (devid > s->dt.max_ids) {
+    if (devid >= s->dt.num_ids) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: devid %d>%d",
-                      __func__, devid, s->dt.max_ids);
+                      "%s: invalid command attributes: devid %d>=%d",
+                      __func__, devid, s->dt.num_ids);
 
     } else if (!dte_valid || !ite_valid || !cte_valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -379,7 +379,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
-    if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
+    if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
             || !dte_valid || (eventid > max_eventid) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
              (pIntid != INTID_SPURIOUS))) {
@@ -497,7 +497,7 @@ static bool process_mapc(GICv3ITSState *s, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((icid > s->ct.max_ids) || (rdbase >= s->gicv3->num_cpu)) {
+    if ((icid >= s->ct.num_ids) || (rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
                       "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
@@ -610,7 +610,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((devid > s->dt.max_ids) ||
+    if ((devid >= s->dt.num_ids) ||
         (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPD: invalid device table attributes "
@@ -649,7 +649,7 @@ static void process_cmdq(GICv3ITSState *s)
 
     wr_offset = FIELD_EX64(s->cwriter, GITS_CWRITER, OFFSET);
 
-    if (wr_offset > s->cq.max_entries) {
+    if (wr_offset >= s->cq.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid write offset "
                       "%d\n", __func__, wr_offset);
@@ -658,7 +658,7 @@ static void process_cmdq(GICv3ITSState *s)
 
     rd_offset = FIELD_EX64(s->creadr, GITS_CREADR, OFFSET);
 
-    if (rd_offset > s->cq.max_entries) {
+    if (rd_offset >= s->cq.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid read offset "
                       "%d\n", __func__, rd_offset);
@@ -721,7 +721,7 @@ static void process_cmdq(GICv3ITSState *s)
         }
         if (result) {
             rd_offset++;
-            rd_offset %= s->cq.max_entries;
+            rd_offset %= s->cq.num_entries;
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
         } else {
             /*
@@ -824,13 +824,13 @@ static void extract_table_params(GICv3ITSState *s)
         td->entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE) + 1;
         td->base_addr = baser_base_addr(value, page_sz);
         if (!td->indirect) {
-            td->max_entries = (num_pages * page_sz) / td->entry_sz;
+            td->num_entries = (num_pages * page_sz) / td->entry_sz;
         } else {
-            td->max_entries = (((num_pages * page_sz) /
+            td->num_entries = (((num_pages * page_sz) /
                                   L1TABLE_ENTRY_SIZE) *
                                  (page_sz / td->entry_sz));
         }
-        td->max_ids = 1ULL << idbits;
+        td->num_ids = 1ULL << idbits;
     }
 }
 
@@ -845,7 +845,7 @@ static void extract_cmdq_params(GICv3ITSState *s)
     s->cq.valid = FIELD_EX64(value, GITS_CBASER, VALID);
 
     if (s->cq.valid) {
-        s->cq.max_entries = (num_pages * GITS_PAGE_SIZE_4K) /
+        s->cq.num_entries = (num_pages * GITS_PAGE_SIZE_4K) /
                              GITS_CMDQ_ENTRY_SIZE;
         s->cq.base_addr = FIELD_EX64(value, GITS_CBASER, PHYADDR);
         s->cq.base_addr <<= R_GITS_CBASER_PHYADDR_SHIFT;
-- 
2.25.1


