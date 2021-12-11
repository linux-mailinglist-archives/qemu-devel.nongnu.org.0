Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8AE47159B
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:19:45 +0100 (CET)
Received: from localhost ([::1]:39282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7uK-0006gl-RT
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:19:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7md-0004xe-Ff
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:47 -0500
Received: from [2a00:1450:4864:20::432] (port=46074
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7ma-0006DE-VS
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:47 -0500
Received: by mail-wr1-x432.google.com with SMTP id o13so20287548wrs.12
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UU9Ga+a5TMHIVvedbmFulE35BgOQRPa9LBAE1rDIpwU=;
 b=PMm1wvheXPbQuQuB8P9oX/1LQyZdKtL8ThYojAzGabUTtYTvsXO3mj2WRXD9kCkewW
 mf4wXwhVNdavEt9R7aqpwUjuWxk3P8yN7lF18arLj7PLBc1SeC48u0k3lSrNgxGBCrdM
 cIq7NdQXzuyHhnZwp/sp/1b+PjJOdKMGkFWeE6bLcBVq+Mc9wSSu3QrSbBz+XpDkftAz
 aJMkpBNmxVaLcXm7rjS4VqR/AE9J7TiBJTGopFsB8f/M09f+YgKWsNxXHkP5dWZLZGU1
 tm5U4E0TlQ5EbmpXwlBHmonEildBYJcDXAv2nwlP+np/7hX4NPqWpkecGcHkjHhG4k4o
 nDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UU9Ga+a5TMHIVvedbmFulE35BgOQRPa9LBAE1rDIpwU=;
 b=ROCutcC0/Iu5KBxYOjB0y62kEo3y3LiOElW9BDChZKPky7DrZc/Wf2ewnsBvozpD+L
 URQ43U7yxi46MM9P4Vq6aQoGd14mvv0nutxcp5ELRzunryiDzWcc8BZLdcqiPr4f/brZ
 jlhCF5ucDvxoR2CiqP/agTq6dl+RdQuw3OjQzQJ2HvEEb9czzPu0p1HDSMLp7q7FZkYc
 gIk62rZxac2ecpb01A2761utVBngWoDimAWR+L2l671YVvCdZw0RGRmlCeyT1EqE8vjH
 QwP7HY7zziZfpGFgeCrSEG0jPetXHAlQTUJ7HWTeFbTqr0L23d3k7SvxN52ztGSe1Wx5
 UX/w==
X-Gm-Message-State: AOAM531GoTyOzWHsJtl1V4eXjPz6fgz73Ahq8QHtf6SOKF6ig5L31A+p
 GCBIDNuKMj1pwUPIzazY11pKfw==
X-Google-Smtp-Source: ABdhPJy0v+mXynBuIV53zTypPVUtsGr7bepsXujsumG96mGhhjl0hUH+jj4nHKBzBIuKST+Eh5CFWA==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr21380833wrr.223.1639249903595; 
 Sat, 11 Dec 2021 11:11:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/26] hw/intc/arm_gicv3_its: Reduce code duplication in
 extract_table_params()
Date: Sat, 11 Dec 2021 19:11:15 +0000
Message-Id: <20211211191135.1764649-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

The extract_table_params() decodes the fields in the GITS_BASER<n>
registers into TableDesc structs.  Since the fields are the same for
all the GITS_BASER<n> registers, there is currently a lot of code
duplication within the switch (type) statement.  Refactor so that the
cases include only what is genuinely different for each type:
the calculation of the number of bits in the ID value that indexes
into the table.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


