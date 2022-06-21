Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0343C552F32
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:54:48 +0200 (CEST)
Received: from localhost ([::1]:47038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aas-0006oQ-PH
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aR1-0007nc-2H; Tue, 21 Jun 2022 05:44:35 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:46633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQz-0007Of-Hb; Tue, 21 Jun 2022 05:44:34 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 93-20020a9d02e6000000b0060c252ee7a4so10252842otl.13; 
 Tue, 21 Jun 2022 02:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svUkRWP5wlLbdXls872JxaD3X8JWFFzuJPhQ18Bbx7s=;
 b=hDnJtOxmroGlHOodWkYzznQHuXsrPJpfcwUkNL+i56Qhpxl7xYGqVwJlhenGPGWTqm
 FUmavQwmP0SCAgj0jTuw2aJsdlwHwDzjBdiFiuztR1+AdGrxAdmPLAi/YGqvrCYas7XO
 QxmtNmgKFA3RwCaYw+KgmOVsmgu1ih44lIs0yi9eX49b2/ynzKNoDt/ntc9jYslA49m1
 pCxRoWU5dUIxUXVNBUkLJiwA/mU+h175WCfXCfzePSjuZt1k4VBI9UEhzJFrMGaDvpqN
 0aAATZuS1c7MRHuKmH8aNXKvgo1a3UaBN6Gb12KgkWqwjC1GBG3q9wTA20DijL6ppGZ3
 1kMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=svUkRWP5wlLbdXls872JxaD3X8JWFFzuJPhQ18Bbx7s=;
 b=yRFUzXvqaqLrt+nuEYLMqblu4qJNOkcKnOu8Ica4wy6uTpunz8IoSlB+JdSfTmqbVn
 B/emLOeWITY1MgAIGnsilDNshUuMIvTHgBBADHx7kBqO1EjE9pzZzZXOqWETa3MSI+83
 MsBf99DMPLp/SN3zbS7rb17GtVoaN9FopLzLU2v1al/Hhano1/q7ZWtLtF8NxHeNjhTI
 f3XP/KdiRFfDDsS6yj5bQ1FZzJy7leN1pSzsJo51W+lGXxQB7aBLaRRjoxOblC37qfu/
 NY1KTxsulQITqj2aVcmdvRBMHtSdCPY57764bbwh0WWpI+dHrZeO5mWGItZXSRVIa/Ms
 yoFg==
X-Gm-Message-State: AJIora/xxUKlRLnhDDfPuxRBUr00lja5N9I0sSuWo2I/8DWg1blaHCDX
 Jj+Eab8ittCgAegJvS1mGMiqv5QVigMliA==
X-Google-Smtp-Source: AGRyM1sKMosk7RnxriQMYPCRKGgBTk22glWWgT21YOE+21P8PPnnh3IkuuU9ZSrVWOA4BlXJk20szw==
X-Received: by 2002:a05:6830:43ab:b0:610:45bd:b8c8 with SMTP id
 s43-20020a05683043ab00b0061045bdb8c8mr6478249otv.252.1655804671965; 
 Tue, 21 Jun 2022 02:44:31 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 11/15] pnv/xive2: Access direct mapped thread contexts from all
 chips
Date: Tue, 21 Jun 2022 06:43:56 -0300
Message-Id: <20220621094400.122800-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Frederic Barrat <fbarrat@linux.ibm.com>

When accessing a thread context through the IC BAR, the offset of the
page in the BAR identifies the CPU. From that offset, we can compute
the PIR (processor ID register) of the CPU to do the data structure
lookup. On P10, the current code assumes an access for node 0 when
computing the PIR. Everything is almost in place to allow access for
other nodes though. So this patch reworks how the PIR value is
computed so that we can access all thread contexts through the IC BAR.

The PIR is already correct on P9, so no need to modify anything there.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220602165310.558810-1-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/intc/pnv_xive2.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index a39e070e82..f31c53c28d 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -1574,6 +1574,12 @@ static const MemoryRegionOps pnv_xive2_ic_sync_ops = {
  * When the TM direct pages of the IC controller are accessed, the
  * target HW thread is deduced from the page offset.
  */
+static uint32_t pnv_xive2_ic_tm_get_pir(PnvXive2 *xive, hwaddr offset)
+{
+    /* On P10, the node ID shift in the PIR register is 8 bits */
+    return xive->chip->chip_id << 8 | offset >> xive->ic_shift;
+}
+
 static XiveTCTX *pnv_xive2_get_indirect_tctx(PnvXive2 *xive, uint32_t pir)
 {
     PnvChip *chip = xive->chip;
@@ -1596,10 +1602,12 @@ static uint64_t pnv_xive2_ic_tm_indirect_read(void *opaque, hwaddr offset,
                                               unsigned size)
 {
     PnvXive2 *xive = PNV_XIVE2(opaque);
-    uint32_t pir = offset >> xive->ic_shift;
-    XiveTCTX *tctx = pnv_xive2_get_indirect_tctx(xive, pir);
+    uint32_t pir;
+    XiveTCTX *tctx;
     uint64_t val = -1;
 
+    pir = pnv_xive2_ic_tm_get_pir(xive, offset);
+    tctx = pnv_xive2_get_indirect_tctx(xive, pir);
     if (tctx) {
         val = xive_tctx_tm_read(NULL, tctx, offset, size);
     }
@@ -1611,9 +1619,11 @@ static void pnv_xive2_ic_tm_indirect_write(void *opaque, hwaddr offset,
                                            uint64_t val, unsigned size)
 {
     PnvXive2 *xive = PNV_XIVE2(opaque);
-    uint32_t pir = offset >> xive->ic_shift;
-    XiveTCTX *tctx = pnv_xive2_get_indirect_tctx(xive, pir);
+    uint32_t pir;
+    XiveTCTX *tctx;
 
+    pir = pnv_xive2_ic_tm_get_pir(xive, offset);
+    tctx = pnv_xive2_get_indirect_tctx(xive, pir);
     if (tctx) {
         xive_tctx_tm_write(NULL, tctx, offset, val, size);
     }
-- 
2.36.1


