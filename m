Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFE1487B82
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:36:09 +0100 (CET)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t9s-0000cl-VB
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:36:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw3-00056S-Qa
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:53 -0500
Received: from [2a00:1450:4864:20::431] (port=47059
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw2-0007t5-4w
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id l25so1495815wrb.13
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OIDDMkIyA7MpvRn1rUvUntrwxdB6HAz6Cx4m2eprMqU=;
 b=r+2K89bY2aZgaNEybGtQDFDuPirf8SpZbGEqqeX8UQIbD8jU4sEW4Si9R7zTSEVqqL
 bSxisAoQdxmfAKC4Q6EwqKExmFd5TLRVy47ylra7Lqcgap1DdmUzdq/PqdGvIKXyf5Hx
 4bDNczs4nhO6RJrXwsVOymEOuYCGaTLfrUrqyf2xBRrawju1sKAxsNCAupf0XVB5Bk/X
 Hlt8Fsr6+osdxTTHAlgtfJSsQkWkHckZIjJtmxLD6wAP/zZHXr2YMrRaJY1fmSECV1eO
 55l2PTk5l5nhgbOAGele8dsA3uYOrF7q0P91lbb96yAzgfnq7DXHcYXZ7vpg3Qi5DDxM
 xVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OIDDMkIyA7MpvRn1rUvUntrwxdB6HAz6Cx4m2eprMqU=;
 b=BZzrDQuwN3pIoCbBySF7icR0iYe4oXA7PwtEVUptOrovDdtDUcswNYN7gtAh6hGczl
 1m9X6tnMWVtKJC9fO8d0+lycFtsQ/0Mcbafx2mSVvCgWGGvFbdNAwz3kiqaTJaNHoCi7
 52SIz2EGQ7pcA26ziyQWoIxxlnPXl63dqpYkF8QjEQVYhhP5FbrQ8MWSTzsAGgVI66Yp
 +6DwGWm2Re6CxkTWMnamyZ7zeyvX6fkNqghl41mSvMrL0eTF95kLNei9c/hbDnXAd0Eg
 maRhoa0I2HmngHUKbT+cWgHxnt6EANmdXRqMIgohym/vb87WZfHW7+mv66bgeAncPp5s
 Z5lQ==
X-Gm-Message-State: AOAM531jY+iYLq77CyuZke5zez2pK/4pSX5G6ITFxFL9v/yXS0Ge+QxX
 QZP4ZnF1uXyZplsXqoLiqJAGLFFD4sbvTA==
X-Google-Smtp-Source: ABdhPJxJfAwBH8WahlzzyLU8xEL4n0VW2J7PLOMKf09l3Fdql6HSJzaGImdbJtpc+Hsw7bjFHkkN2Q==
X-Received: by 2002:adf:b60e:: with SMTP id f14mr32534972wre.11.1641576108846; 
 Fri, 07 Jan 2022 09:21:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/19] hw/intc/arm_gicv3_its: Reduce code duplication in
 extract_table_params()
Date: Fri,  7 Jan 2022 17:21:30 +0000
Message-Id: <20220107172142.2651911-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The extract_table_params() decodes the fields in the GITS_BASER<n>
registers into TableDesc structs.  Since the fields are the same for
all the GITS_BASER<n> registers, there is currently a lot of code
duplication within the switch (type) statement.  Refactor so that the
cases include only what is genuinely different for each type:
the calculation of the number of bits in the ID value that indexes
into the table.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv3_its.c | 97 +++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 57 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index c97b9982ae1..84808b1e298 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -758,6 +758,9 @@ static void extract_table_params(GICv3ITSState *s)
     uint64_t value;
 
     for (int i = 0; i < 8; i++) {
+        TableDesc *td;
+        int idbits;
+
         value = s->baser[i];
 
         if (!value) {
@@ -789,73 +792,53 @@ static void extract_table_params(GICv3ITSState *s)
         type = FIELD_EX64(value, GITS_BASER, TYPE);
 
         switch (type) {
-
         case GITS_BASER_TYPE_DEVICE:
-            memset(&s->dt, 0 , sizeof(s->dt));
-            s->dt.valid = FIELD_EX64(value, GITS_BASER, VALID);
-
-            if (!s->dt.valid) {
-                break;
-            }
-
-            s->dt.page_sz = page_sz;
-            s->dt.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
-            s->dt.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
-
-            if (!s->dt.indirect) {
-                s->dt.max_entries = (num_pages * page_sz) / s->dt.entry_sz;
-            } else {
-                s->dt.max_entries = (((num_pages * page_sz) /
-                                     L1TABLE_ENTRY_SIZE) *
-                                     (page_sz / s->dt.entry_sz));
-            }
-
-            s->dt.max_ids = (1UL << (FIELD_EX64(s->typer, GITS_TYPER,
-                                                DEVBITS) + 1));
-
-            s->dt.base_addr = baser_base_addr(value, page_sz);
-
+            td = &s->dt;
+            idbits = FIELD_EX64(s->typer, GITS_TYPER, DEVBITS) + 1;
             break;
-
         case GITS_BASER_TYPE_COLLECTION:
-            memset(&s->ct, 0 , sizeof(s->ct));
-            s->ct.valid = FIELD_EX64(value, GITS_BASER, VALID);
-
-            /*
-             * GITS_TYPER.HCC is 0 for this implementation
-             * hence writes are discarded if ct.valid is 0
-             */
-            if (!s->ct.valid) {
-                break;
-            }
-
-            s->ct.page_sz = page_sz;
-            s->ct.indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
-            s->ct.entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
-
-            if (!s->ct.indirect) {
-                s->ct.max_entries = (num_pages * page_sz) / s->ct.entry_sz;
-            } else {
-                s->ct.max_entries = (((num_pages * page_sz) /
-                                     L1TABLE_ENTRY_SIZE) *
-                                     (page_sz / s->ct.entry_sz));
-            }
-
+            td = &s->ct;
             if (FIELD_EX64(s->typer, GITS_TYPER, CIL)) {
-                s->ct.max_ids = (1UL << (FIELD_EX64(s->typer,
-                                                    GITS_TYPER, CIDBITS) + 1));
+                idbits = FIELD_EX64(s->typer, GITS_TYPER, CIDBITS) + 1;
             } else {
                 /* 16-bit CollectionId supported when CIL == 0 */
-                s->ct.max_ids = (1UL << 16);
+                idbits = 16;
             }
-
-            s->ct.base_addr = baser_base_addr(value, page_sz);
-
             break;
-
         default:
-            break;
+            /*
+             * GITS_BASER<n>.TYPE is read-only, so GITS_BASER_RO_MASK
+             * ensures we will only see type values corresponding to
+             * the values set up in gicv3_its_reset().
+             */
+            g_assert_not_reached();
         }
+
+        memset(td, 0, sizeof(*td));
+        td->valid = FIELD_EX64(value, GITS_BASER, VALID);
+        /*
+         * If GITS_BASER<n>.Valid is 0 for any <n> then we will not process
+         * interrupts. (GITS_TYPER.HCC is 0 for this implementation, so we
+         * do not have a special case where the GITS_BASER<n>.Valid bit is 0
+         * for the register corresponding to the Collection table but we
+         * still have to process interrupts using non-memory-backed
+         * Collection table entries.)
+         */
+        if (!td->valid) {
+            continue;
+        }
+        td->page_sz = page_sz;
+        td->indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
+        td->entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+        td->base_addr = baser_base_addr(value, page_sz);
+        if (!td->indirect) {
+            td->max_entries = (num_pages * page_sz) / td->entry_sz;
+        } else {
+            td->max_entries = (((num_pages * page_sz) /
+                                  L1TABLE_ENTRY_SIZE) *
+                                 (page_sz / td->entry_sz));
+        }
+        td->max_ids = 1ULL << idbits;
     }
 }
 
-- 
2.25.1


