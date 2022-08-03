Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA87588E2C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:03:30 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEy9-0004Ur-4L
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgh-0003A1-Ba; Wed, 03 Aug 2022 09:45:27 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:43907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEge-0004qO-6I; Wed, 03 Aug 2022 09:45:27 -0400
Received: by mail-vs1-xe30.google.com with SMTP id d187so17852557vsd.10;
 Wed, 03 Aug 2022 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=YXqK9e5fxI4gx+KF8RM0MQE1QbsFxEwQIIEctn4RagM=;
 b=qN6GJpuwV+/GqOuGT3fP9jMLBmyFXOXIiaZZT/By19zD9CsmQPdOrjo11lHpb6sa82
 n0/h7KJ/Z/7m2z3orL3kNlrOwP1snRwS3b47MH4oKCLMtlHhN+uwChgTR9gL7JZ2lt4U
 BmQWvGIdkFwRBf+ym7U1ik88yh2bkcXlaRLHnhLDuWeb06HalwQSBQB//JaiLg1F2oK/
 IukTQCAZU6XDmClUS7SGtUHNcrpPFEg0LfUAMtJpP9+Yq+6xIt12Ucy8BWiHZcm0WjCC
 HwiODIocdU4CYcBCMBibYc6M/yhhXwL3IdqHDEGw2AU7KS8zMg7s/7SJjTwGyFFN7ERR
 21pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YXqK9e5fxI4gx+KF8RM0MQE1QbsFxEwQIIEctn4RagM=;
 b=q1VitdmQ2n6xKdFT2PMCg/a+JRWy/lrPX7y8/ogXAITYce00TyqhKQX+U9HgvlreWK
 2LoY6K/BQe2L3qXTknVmpkOnxuIw406itoQe8JTx08P+xfcEk2nhuwyCQD5vTUk16Ocl
 ERA1as5xfx28PySa+9wctwNGuJjbjbO8u139YigloV5A+Cy4mlmjcGZb4Z5h6cVKcqxA
 T6WjukuaGHo67vMv9ERCsT0BzGqBFWZ+pmkl8khbd731sasJ1JDqqy2p6x/n6+JLpD71
 KZ/y7Y1bwv4VzsXbAwkZct8qpAgiy6gexymjN7McKoFz8l8iGi9OeDk3ymxae7bbaLUP
 gwug==
X-Gm-Message-State: ACgBeo0Vu/OxhmTGAYxkyZhc3IKMN+mTcg9E0pWMhlwaxYyWQm6Lxxg/
 CK/xZco69qPoHDAgWhWCxA8rhIpmHAI=
X-Google-Smtp-Source: AA6agR6GBvfq772/2blApDozht7vXUOyDKQy2MOkHY1YCm0yduVo8y3jVa1iBW8AkDj+abA7i9wd5w==
X-Received: by 2002:a67:cc1d:0:b0:387:8c03:7501 with SMTP id
 q29-20020a67cc1d000000b003878c037501mr4193290vsl.80.1659534319988; 
 Wed, 03 Aug 2022 06:45:19 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 07/10] ppc/pnv: add PHB4 helpers for user created
 pnv-phb
Date: Wed,  3 Aug 2022 10:44:56 -0300
Message-Id: <20220803134459.2633902-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe30.google.com
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


