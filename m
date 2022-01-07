Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A945B487B7A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:33:19 +0100 (CET)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t78-0004Bu-Oz
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:33:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw2-00055d-SI
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:51 -0500
Received: from [2a00:1450:4864:20::332] (port=54051
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw1-0007sd-5Q
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:50 -0500
Received: by mail-wm1-x332.google.com with SMTP id l4so4392821wmq.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ioH2wN0+IBcuS87mhMbPJHAa9Z11TnOXzEVoVj3sswY=;
 b=Yn2i9fdoKJW56+bSTSmdanunvkVsQEiSy5bup0onp7lomGjcLPJkqIpnllyKBfjxYC
 1P1mukrWy5zKvaGfA12HzNgMzd5gipoyTV+oXEF/sQ8CtcvH6mUcsqv/SfXV70k+EM1y
 fIKXLRWOvUk9nCINTzc17iUKbMJ6cTlvHgRwDuJAbWSFsDfO3Mpe0wMSc2ZCzUsK/L8+
 U1SByG34WYhmt752QCesFoQdXuzKrmq61Ut0bHPND/nwg4iP8occTUV3pGTJ16K1kRij
 pAZuam1J8Q84gwheCuOn5MvV4os8J17gRJ1wdEyy/SgZMxmkAlDV+SGEDhFHNtpODff+
 ft/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ioH2wN0+IBcuS87mhMbPJHAa9Z11TnOXzEVoVj3sswY=;
 b=gb+fWgdMCjDPCi7AoKsoACRB0iiExdeuxVbxcJKJdf+nNerXQIh32fS8VFLjk8BiQF
 czCJbX7FMdZC0dh1LVleJ59+Cpc1orT+1uRvGkWGGu76/Zbdqaa1U2Owc7766Y03elT6
 +djjDWX+SGU05V/zSrRXdvRS7SI/33oDaxv8MUtRjUxponOKMP1thdbRQkBdpyftqPp5
 aCawhAcVtXMusduuZLWPlkdk9RspHHKzbdcNYlrgeR+UeJcj2PmZIFpX0slL4pjfAW7S
 EM+1hONUJN6dczx/D+dc+hTQOi9LpIKCp0GK+ZocOsTKM5xDYYfeibM9TuxVvnGZxn+d
 SVHQ==
X-Gm-Message-State: AOAM531UDAG+RLx/E0VVnpOyUOlb2UEVAGG6BUtw/pF9kzgdVvGPLv8s
 cD9qn6u+LQQONEfYrlrDhsFFuB6cJXgjWg==
X-Google-Smtp-Source: ABdhPJwRiVSRIHAXP7crypeikOhxTIK1rS/d77uho9XqQhA7Heu1GE50coteEHDVW1VNX4ojeMwGKw==
X-Received: by 2002:a05:600c:1c26:: with SMTP id
 j38mr11774503wms.101.1641576107561; 
 Fri, 07 Jan 2022 09:21:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/19] hw/intc/arm_gicv3_its: Remove maxids union from TableDesc
Date: Fri,  7 Jan 2022 17:21:28 +0000
Message-Id: <20220107172142.2651911-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


