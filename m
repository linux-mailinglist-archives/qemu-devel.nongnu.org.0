Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D580047159A
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:19:21 +0100 (CET)
Received: from localhost ([::1]:38262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7tw-00061B-Vz
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:19:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mb-0004sX-2c
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:45 -0500
Received: from [2a00:1450:4864:20::330] (port=47029
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mY-0006CL-NO
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:44 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso8944410wmr.5
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dGKwMD+9WuccUDXkjtypH8IassS21mNAMYjauEbj4To=;
 b=EUGkDwZ4L/3RJmAKzoQmMssnjOp60ex1bKVMvKnDNbyWSb8GbXzPF8zEPd4YhvvRWz
 A9akBPt483ANcigqeWWv7eje6bfbrLz8n+yCfxzSp9yQ+OZ4yjAZpJsM1GQOrjNf3cOp
 BuuLU/erV6Kvyi/1kxKxpNBIlrQy45/fkextu3Jxm/o+9wD96WIbTX8iBmtpm8YHOhyW
 afxGVlEurdMQ5H8BeUdxVUw6/Mb5q8/Jvsoar18MNQnO7lofreWAXL1oYsFetYKlhIOR
 16LGDS+Zoc24YnOUeBHWPXbaGF+19CF+eXnfF2TNl5j2rwICVJ4Br6vtMAU2hJkrWDek
 pYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dGKwMD+9WuccUDXkjtypH8IassS21mNAMYjauEbj4To=;
 b=xL38EbZEQLWMFmPs2XMDpKO7AGdOl1Jpg6NALbofdlTqbdY40Ccis1aeuaTH7w/Exp
 We5F7Ri8xr7oBTzW2rQgx+xxsuslfHH83AOxk7eyI1ddPDVkMM3eodKN2PuuIbHCbnNu
 GxpI7LX7SUFF5zL2f2qY9qr1KgSCW8wu+jMpZRN5trgrM+P5clD7lr3pHh3YO+lb3vyn
 t5za8MAnn4wm/HvEd7bmh5CJTAhKevXgRCbzfA9DnCjZHkqa2Lf2+2p8m7xT/RJz4LHl
 GBuC73yZ9cM6Fx/0Nwckql/ino0VlNZMt29bh8J34tKL7f0cQZziXahOWMu5OwT1dWhA
 MQew==
X-Gm-Message-State: AOAM533tygoUKgvpxcjD7xSBkimwCxLf3V1faPJUOqZnc2W4cvLmhSRF
 /FGv2V2gmn2a7QfqUW1aEGDkdg==
X-Google-Smtp-Source: ABdhPJwt1ZEayZvkYmQuQi4eL6V40p64hIeD3jrxYaWDCXNobGNyfljiVZ5N/2QVZ2VduEp5JB/B6g==
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr25577883wml.21.1639249901211; 
 Sat, 11 Dec 2021 11:11:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/26] hw/intc/arm_gicv3_its: Remove maxids union from
 TableDesc
Date: Sat, 11 Dec 2021 19:11:13 +0000
Message-Id: <20211211191135.1764649-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

The TableDesc struct defines properties of the in-guest-memory tables
which the guest tells us about by writing to the GITS_BASER<n>
registers.  This struct currently has a union 'maxids', but all the
fields of the union have the same type (uint32_t) and do the same
thing (record one-greater-than the maximum ID value that can be used
as an index into the table).

We're about to add another table type (the GICv4 vPE table); rather
than adding another specifically-named union field for that table
type with the same type as the other union fields, remove the union
entirely and just have a 'uint32_t max_ids' struct field.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv3_its_common.h |  5 +----
 hw/intc/arm_gicv3_its.c                | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 4e79145dde3..85a144b0e49 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -47,10 +47,7 @@ typedef struct {
     uint16_t entry_sz;
     uint32_t page_sz;
     uint32_t max_entries;
-    union {
-        uint32_t max_devids;
-        uint32_t max_collids;
-    } maxids;
+    uint32_t max_ids;
     uint64_t base_addr;
 } TableDesc;
 
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 985ae03f5fc..f321f10189e 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -287,10 +287,10 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
      * In this implementation, in case of guest errors we ignore the
      * command and move onto the next command in the queue.
      */
-    if (devid > s->dt.maxids.max_devids) {
+    if (devid > s->dt.max_ids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>%d",
-                      __func__, devid, s->dt.maxids.max_devids);
+                      __func__, devid, s->dt.max_ids);
 
     } else if (!dte_valid || !ite_valid || !cte_valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -384,7 +384,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
     }
 
-    if ((devid > s->dt.maxids.max_devids) || (icid > s->ct.maxids.max_collids)
+    if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
             || !dte_valid || (eventid > max_eventid) ||
             (!ignore_pInt && (((pIntid < GICV3_LPI_INTID_START) ||
             (pIntid > max_Intid)) && (pIntid != INTID_SPURIOUS)))) {
@@ -505,7 +505,7 @@ static bool process_mapc(GICv3ITSState *s, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((icid > s->ct.maxids.max_collids) || (rdbase >= s->gicv3->num_cpu)) {
+    if ((icid > s->ct.max_ids) || (rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
                       "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
@@ -618,7 +618,7 @@ static bool process_mapd(GICv3ITSState *s, uint64_t value, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((devid > s->dt.maxids.max_devids) ||
+    if ((devid > s->dt.max_ids) ||
         (size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPD: invalid device table attributes "
@@ -810,8 +810,8 @@ static void extract_table_params(GICv3ITSState *s)
                                      (page_sz / s->dt.entry_sz));
             }
 
-            s->dt.maxids.max_devids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
-                                       DEVBITS) + 1));
+            s->dt.max_ids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
+                                                DEVBITS) + 1));
 
             s->dt.base_addr = baser_base_addr(value, page_sz);
 
@@ -842,11 +842,11 @@ static void extract_table_params(GICv3ITSState *s)
             }
 
             if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
-                s->ct.maxids.max_collids = (1UL << (FIELD_EX64(s->typer,
-                                            GITS_TYPER, CIDBITS) + 1));
+                s->ct.max_ids = (1UL << (FIELD_EX64(s->typer,
+                                                    GITS_TYPER, CIDBITS) + 1));
             } else {
                 /* 16-bit CollectionId supported when CIL == 0 */
-                s->ct.maxids.max_collids = (1UL << 16);
+                s->ct.max_ids = (1UL << 16);
             }
 
             s->ct.base_addr = baser_base_addr(value, page_sz);
-- 
2.25.1


