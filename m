Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395D5495463
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:48:53 +0100 (CET)
Received: from localhost ([::1]:34616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcUN-0007Pl-0X
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:48:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgm-0004Jk-0C
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:16 -0500
Received: from [2a00:1450:4864:20::32c] (port=40954
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgh-0003JM-Q0
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:13 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 r9-20020a1c4409000000b0034e043aaac7so478103wma.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FV6II8ZvS26ggR3zDxlxn/8r1SJGmBVBBb/p5eFPFnU=;
 b=kuHE566h+TwPCGujnAHerLS3A0i3cRCSBjPX3pI8VYmWviV/HyEgYDAKhv3nBzTQjV
 mYKww9c0XC0B+05KINmWPQOej9KoMf19gbgb8vthfUrtpYRdeQ3xsxow12KRhZAg6sGe
 0aJYl6OTNmiKjv1MMGobiE8G5f6UhCpfEjxWeRAIVx2yMrGizSawSxFBkJcF187oZ1Fp
 FJMEpinF43yRWu/r+Q+PV0bjJx7iocyKRahu9iw/VKu9dHjG7u1YfVgRVqbtFmA1jma8
 Ih8eF0lhYbhZ5EZ79jSjCs2Se/fbsfN+Q110tF2hlZRhYiWSTzT3xkGcxF/yzhCdwEc1
 GoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FV6II8ZvS26ggR3zDxlxn/8r1SJGmBVBBb/p5eFPFnU=;
 b=GJhG2G4jGgWSaNl9ZMu7c4+kgAuJRl8dagXAr1LZmPniAqeTqtFsCHj+BY7EfROHNo
 Vs6zNlE/mUYYL0nxdV4pVi3rFSfO6pmd5eRnbO8oLv/+nJHG/S+BARtj+mXky4D7kv9l
 hJc184i6ZvJjdAm1dfBii+GFDgVagGHhKqUeA5etWf66fpy6T4RyMQd3E422haFoCd0m
 usETGlSPftVhOUjNy182xYoPe9loZ9AWt8cOQeSYq1KNYwPEn8Lq4DXXekpPtwmScqjb
 KTDgllIs51VLRNkjZfujb6i1zFPwclY3XIwt0jEJ/xC3+J/Ebpc2UNX1lMvvhUBaaJKc
 uLRg==
X-Gm-Message-State: AOAM532FXaUYxYBhBuevaQrB7cPlYYO1i0Ak1GZJyviuyXx3bEyW2rKQ
 UPjFYQ0CmRpV6KPm5cFDA3vzBL+s5Ggp2A==
X-Google-Smtp-Source: ABdhPJx7PzS5DG27DKfrbm4VSk39JS/S/hkQWghr60qhqyjg/NnYS2Sv1ALYNhGXuhxHSkGzJiN/pQ==
X-Received: by 2002:adf:fa91:: with SMTP id h17mr418725wrr.189.1642682225095; 
 Thu, 20 Jan 2022 04:37:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/38] hw/intc/arm_gicv3_its: Use enum for return value of
 process_* functions
Date: Thu, 20 Jan 2022 12:36:21 +0000
Message-Id: <20220120123630.267975-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

When an ITS detects an error in a command, it has an
implementation-defined (CONSTRAINED UNPREDICTABLE) choice of whether
to ignore the command, proceeding to the next one in the queue, or to
stall the ITS command queue, processing nothing further.  The
behaviour required when the read of the command packet from memory
fails is less clearly documented, but the same set of choices as for
command errors seem reasonable.

The intention of the QEMU implementation, as documented in the
comments, is that if we encounter a memory error reading the command
packet or one of the various data tables then we should stall, but
for command parameter errors we should ignore the queue and continue.
However, we don't actually do this.  To get the desired behaviour,
the various process_* functions need to return true to cause
process_cmdq() to advance to the next command and keep processing,
and false to stall command processing.  What they mostly do is return
false for any kind of error.

To make the code clearer, replace the 'bool' return from the process_
functions with an enum which may be either CMD_STALL or CMD_CONTINUE.
In this commit no behaviour changes; in subsequent commits we will
adjust the error-return paths for the process_ functions one by one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220111171048.3545974-6-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 59 ++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index c1f76682d04..10901a5e709 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -45,6 +45,23 @@ typedef struct {
     uint64_t itel;
 } IteEntry;
 
+/*
+ * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
+ * if a command parameter is not correct. These include both "stall
+ * processing of the command queue" and "ignore this command, and
+ * keep processing the queue". In our implementation we choose that
+ * memory transaction errors reading the command packet provoke a
+ * stall, but errors in parameters cause us to ignore the command
+ * and continue processing.
+ * The process_* functions which handle individual ITS commands all
+ * return an ItsCmdResult which tells process_cmdq() whether it should
+ * stall or keep going.
+ */
+typedef enum ItsCmdResult {
+    CMD_STALL = 0,
+    CMD_CONTINUE = 1,
+} ItsCmdResult;
+
 static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
 {
     uint64_t result = 0;
@@ -217,8 +234,8 @@ static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
  * 3. handling of ITS CLEAR command
  * 4. handling of ITS DISCARD command
  */
-static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
-                            ItsCmdType cmd)
+static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
+                                    uint32_t offset, ItsCmdType cmd)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
@@ -231,7 +248,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
     uint64_t rdbase;
 
     if (cmd == NONE) {
@@ -324,15 +341,15 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
         if (cmd == DISCARD) {
             IteEntry ite = {};
             /* remove mapping from interrupt translation table */
-            result = update_ite(s, eventid, dte, ite);
+            result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
         }
     }
 
     return result;
 }
 
-static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
-                          bool ignore_pInt)
+static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
+                                  uint32_t offset, bool ignore_pInt)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
@@ -343,7 +360,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
     uint64_t dte = 0;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
     offset += NUM_BYTES_IN_DW;
@@ -404,7 +421,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
         ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
-        result = update_ite(s, eventid, dte, ite);
+        result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -472,14 +489,14 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
     }
 }
 
-static bool process_mapc(GICv3ITSState *s, uint32_t offset)
+static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint16_t icid;
     uint64_t rdbase;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
     uint64_t value;
 
     offset += NUM_BYTES_IN_DW;
@@ -509,7 +526,7 @@ static bool process_mapc(GICv3ITSState *s, uint32_t offset)
          * command in the queue
          */
     } else {
-        result = update_cte(s, icid, valid, rdbase);
+        result = update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -578,7 +595,8 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
     }
 }
 
-static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
+static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
+                                 uint32_t offset)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid;
@@ -586,7 +604,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
     uint64_t itt_addr;
     bool valid;
     MemTxResult res = MEMTX_OK;
-    bool result = false;
+    ItsCmdResult result = CMD_STALL;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
 
@@ -623,7 +641,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
          * command in the queue
          */
     } else {
-        result = update_dte(s, devid, valid, size, itt_addr);
+        result = update_dte(s, devid, valid, size, itt_addr) ? CMD_CONTINUE : CMD_STALL;
     }
 
     return result;
@@ -641,7 +659,6 @@ static void process_cmdq(GICv3ITSState *s)
     uint64_t data;
     AddressSpace *as = &s->gicv3->dma_as;
     MemTxResult res = MEMTX_OK;
-    bool result = true;
     uint8_t cmd;
     int i;
 
@@ -668,6 +685,8 @@ static void process_cmdq(GICv3ITSState *s)
     }
 
     while (wr_offset != rd_offset) {
+        ItsCmdResult result = CMD_CONTINUE;
+
         cq_offset = (rd_offset * GITS_CMDQ_ENTRY_SIZE);
         data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
                                     MEMTXATTRS_UNSPECIFIED, &res);
@@ -726,18 +745,16 @@ static void process_cmdq(GICv3ITSState *s)
         default:
             break;
         }
-        if (result) {
+        if (result == CMD_CONTINUE) {
             rd_offset++;
             rd_offset %= s->cq.num_entries;
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, OFFSET, rd_offset);
         } else {
-            /*
-             * in this implementation, in case of dma read/write error
-             * we stall the command processing
-             */
+            /* CMD_STALL */
             s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: %x cmd processing failed\n", __func__, cmd);
+                          "%s: 0x%x cmd processing failed, stalling\n",
+                          __func__, cmd);
             break;
         }
     }
-- 
2.25.1


