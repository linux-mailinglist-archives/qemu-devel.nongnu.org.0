Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CABA56BAD1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:33:18 +0200 (CEST)
Received: from localhost ([::1]:37176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9o6e-0004C0-BI
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzO-00036d-0s; Fri, 08 Jul 2022 09:25:46 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:41620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzL-00077c-G7; Fri, 08 Jul 2022 09:25:45 -0400
Received: by mail-oi1-x229.google.com with SMTP id t189so26976074oie.8;
 Fri, 08 Jul 2022 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXqK9e5fxI4gx+KF8RM0MQE1QbsFxEwQIIEctn4RagM=;
 b=jQCSpTR7ToFRNWhex7Lti9cmZESlm62NEQXtwGd2EJtX5NfEFGJqy7NkNvQZy/SBJn
 3v2xbd/nB/U+yhk/59JOQt5Ww4A8i6H08q9g/cdF9ZJaaY8gZgbh7VY5HkgMnVaHd+Lp
 vwD9t70Asr48OsfvsXTW7StJHAuMZi3eopahslpZDvwag8BTIPx/Vr2zZwG7VApnLNAy
 1cNG28p1bNgVmDGrEVZKM/NBdte2dwhz1ebOB5mK2fM/aZPZqutIuQrMgnYW2c8WTrBR
 O19qY9J26Akb9eZuOTjy13IWGSWx5uqSK2fsqjAYHsr8peCLnlOt3XzRBDLYMP86SBix
 2qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YXqK9e5fxI4gx+KF8RM0MQE1QbsFxEwQIIEctn4RagM=;
 b=LXIPs9S4nj3H25wM9if+9WvzCFwVh3KRULMUczws+hmdP0WbUg4Y1n6k+5BsQ9JArL
 5DIoxiEuu01yEZz1VRAEr7wqvs8T3qdlwzYcWSS2+UNkacnY3/eNyVTdQ/4sEjvAGV8E
 SUYmamSmu+6GRhsc6n544f1En9rfEg0/kirqmXE2Y6JYkzXGbUDCKoXWFRB1+XAlQSyF
 EgiMfZwzT3ihSYwfXk/u6PvPDMc67zPbhxpXsPbsEy86YpSFKyH/11+ryxQ02FxsDA/O
 ailYaWKBTojPfmugrWqkcGlpu0G9QN4nu2b50OvqRb3+czuKNrdV9zJ79JSU0yE8N51A
 2nUQ==
X-Gm-Message-State: AJIora+mTXyMHzBhVC385ks5ZAL4lSSsE7MobNPrFBpW3vlmTCfC5sY/
 pED3bcrz4v+AxLIlpzHi1dyHd1+XZr4=
X-Google-Smtp-Source: AGRyM1vM0zW+jMn9WzwWAbJ+NbCC1QRue5rr8FxxAXH2JlTFkdz0C2R9mA8KKLpCVhDvtNdcmndfqQ==
X-Received: by 2002:a05:6808:17a6:b0:337:bc20:4bcb with SMTP id
 bg38-20020a05680817a600b00337bc204bcbmr1805797oib.16.1657286741202; 
 Fri, 08 Jul 2022 06:25:41 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 07/10] ppc/pnv: add PHB4 helpers for user created pnv-phb
Date: Fri,  8 Jul 2022 10:25:19 -0300
Message-Id: <20220708132522.581382-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708132522.581382-1-danielhb413@gmail.com>
References: <20220708132522.581382-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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

The PHB4 backend relies on a link with the corresponding PEC element.
This is trivial to do during machine_init() time for default devices,
but not so much for user created ones.

pnv_phb4_get_pec() is a small variation of the function that was
reverted by commit 9c10d86fee "ppc/pnv: Remove user-created PHB{3,4,5}
devices". We'll use it to determine the appropriate PEC for a given user
created pnv-phb that uses a PHB4 backend.

This is done during realize() time, in pnv_phb_user_device_init().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 953c384bf6..9807d093f5 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -50,6 +50,34 @@ static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child)
     }
 }
 
+static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
+                                         Error **errp)
+{
+    Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    int chip_id = phb->chip_id;
+    int index = phb->phb_id;
+    int i, j;
+
+    for (i = 0; i < chip->num_pecs; i++) {
+        /*
+         * For each PEC, check the amount of phbs it supports
+         * and see if the given phb4 index matches an index.
+         */
+        PnvPhb4PecState *pec = &chip9->pecs[i];
+
+        for (j = 0; j < pec->num_phbs; j++) {
+            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
+                return pec;
+            }
+        }
+    }
+    error_setg(errp,
+               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
+               chip_id, index);
+
+    return NULL;
+}
+
 /*
  * Attach a root port device.
  *
@@ -99,6 +127,17 @@ static void pnv_phb_user_device_init(PnvPHB *phb)
         chip8->num_phbs++;
 
         parent = OBJECT(phb->chip);
+    } else {
+        Error *local_err = NULL;
+
+        phb->pec = pnv_phb4_get_pec(chip, PNV_PHB4(phb->backend), &local_err);
+
+        if (local_err) {
+            error_propagate(&error_fatal, local_err);
+            return;
+        }
+
+        parent = OBJECT(phb->pec);
     }
 
     /*
-- 
2.36.1


