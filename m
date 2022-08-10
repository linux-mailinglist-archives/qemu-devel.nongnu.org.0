Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361158EA8C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:41:14 +0200 (CEST)
Received: from localhost ([::1]:41306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLj9F-0008WS-0p
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLibN-0006ty-Mw; Wed, 10 Aug 2022 06:06:13 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:33461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLibK-0000vr-8h; Wed, 10 Aug 2022 06:06:12 -0400
Received: by mail-pg1-x52d.google.com with SMTP id l64so13979430pge.0;
 Wed, 10 Aug 2022 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rmwbtPJ+wl4vPKAG1DeSZaLWkVBVKEyAd96z2OfRu9A=;
 b=qmaBmRkbYLvYxkvKPxynPBHQcYhGp5rj3cQjF43dI29Z/WRogCSGauYAA+J2SZ+MMI
 sZYnEhhq4QFAownx+oOmpa4+J3+qq2V0Q2Dztau9x4cN6XDNBX7r8zXR57tXaysyrhdZ
 rez9cbBAJkb0vi63EULiFZlXH7nzChvkPunm1QVDX2dro/v40WudKSZlx4QAxC3Nr/G0
 VhP2EKcFNGxkVzu/xEykjiXubhOAraX0hG0LlJ5PcIEp6lrHgCqmPyjjaBtsb9n9pKQ2
 qoyJ8oqzRs3YaP5euvYwAYyoHPJ7lJ8f5KLmSS1W6uNx0r6j9cGLi+yj2pLchxqC1Mi8
 M5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rmwbtPJ+wl4vPKAG1DeSZaLWkVBVKEyAd96z2OfRu9A=;
 b=pRrdaFbGqmwN8AHQ5vn+ffTT2o8o0iPZN3rSSEAODCoJUwzAMLb6yDZwIBQsH1Ixvw
 f5z0Q5PhMYSdxCBaTyaXBFL1JqNEVXugxOewDcZ7+2TXc1qyl45gTsTsniMx6CSIC1DM
 mJlaiabisLQGm8YtQKeBbqIU4RgF6Fj5BLbUFwRly4nW1s/efwPlOWCFfQYlLTs7K4b6
 W5lmwvUsqBgo8OYhEFFBGsURgvK9fDj3DUQRbybZm1tqC+Jwf//yzRAZcyCW8oZCxTUN
 sNVpXMEPjsgQBLfhDeE9XbUPMh75dDsU2i7YcP2UESFvL27E6D80EBXSUpIqG5J6Ek/P
 aPcQ==
X-Gm-Message-State: ACgBeo3UsVk7SVoqbtVe9xiPw/w8StIBZAsEMOAlsl7ju5TIYBt5+VSA
 pndBxv3sspyE+6Kj7YKXFPIjCczpCz4=
X-Google-Smtp-Source: AA6agR6pUhCdU6UnN7gwkbHGWlL/QtSeDvKJFtIySAbsqmi9y2XrQlAdwFSaqLUtj0xkKL+8YXCYBQ==
X-Received: by 2002:a67:dd04:0:b0:388:5a2d:3c5c with SMTP id
 y4-20020a67dd04000000b003885a2d3c5cmr10633871vsj.26.1660125957804; 
 Wed, 10 Aug 2022 03:05:57 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:05:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 07/11] ppc/pnv: add PHB4 helpers for user created
 pnv-phb
Date: Wed, 10 Aug 2022 07:05:32 -0300
Message-Id: <20220810100536.473859-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810100536.473859-1-danielhb413@gmail.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=danielhb413@gmail.com; helo=mail-pg1-x52d.google.com
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
 hw/pci-host/pnv_phb.c | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 887b25d49e..f9516fdc4a 100644
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
@@ -100,8 +128,16 @@ static void pnv_phb_user_device_init(PnvPHB *phb)
 
         parent = OBJECT(chip);
     } else {
-        /* phb4 support will be added later */
-        return;
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


