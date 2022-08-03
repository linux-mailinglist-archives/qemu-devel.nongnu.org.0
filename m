Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3462B588E44
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:09:22 +0200 (CEST)
Received: from localhost ([::1]:57246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJF3n-0005a8-Jo
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgh-00039n-8d; Wed, 03 Aug 2022 09:45:27 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:47090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgf-0004tG-8t; Wed, 03 Aug 2022 09:45:26 -0400
Received: by mail-vs1-xe34.google.com with SMTP id x125so17833841vsb.13;
 Wed, 03 Aug 2022 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fr3ghyevK9vsVAzKmFGfsmqLPnplPGI8L5S5Df8BMxk=;
 b=j9DK83A/rbIy0wIdT+C70qX+XTmzGzSYLi4I6gQJncwEuPzhTnXdlJrRdo1deqUEck
 FO9Xz6eXiDcKkXDoxQ4ep49LA12LOd5fIdgOoExg/2BVEwC/G0YMBjaeZ70KI6iplpnc
 WrAPWcZITY4Gtx4HVnQwyFfutEeYvo3lyIGK+2+m8gN9lA7EmGT2KbweeqU1Ps2rJpyj
 5RmoIRAHuc6auEHCUWno2L8cMxAg8wgs6HzAZqo7DA6AF8BssZF6/SsCTfzh9VogPqNa
 acva7+OqjkzO7bL7hy1d7GpqHDafpNAI7vkurdbVdlr+hhQ45RhnMeNmtXiS6JeNPoqW
 I7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fr3ghyevK9vsVAzKmFGfsmqLPnplPGI8L5S5Df8BMxk=;
 b=dYVYLsoD8KKH3QqN+wje4haqb5UEdaG/ls6gJTDQRd9ZqW9VtlJ+BCfRfNio1QQVOF
 hB0BQ06bgbgIlyFFJim7KWdhUlS9wIywW+lziSVS4elNDAJ3ttwXZ3Zy29xsuZnzhiYn
 xEJ+0lVSnHl3guH4b6Wb6rvfKiXR0txa2Vn8SmBI5pKUoCgYDdPBZvI3qtESg0QJR1QV
 WBJr2SQiicfxnx4vJ3ZnqOTBtl7lfgi66pTzDIgsZa6gviwuyHDeH0cdoCcboIfAqfCf
 2fZpR6DSNr1HCkGjYLXz5ikB7hDJ4Wtko80VO80fJmVM05DVCuwde+m8oYx5R62D2XW+
 UC7w==
X-Gm-Message-State: ACgBeo2rJc8vYg8rcliHFzBIign61H2vimGGJGqeQAdyvXepMdfnit0X
 IJLwWxfeTjZ8qptmJQlOiLlxngFPo5M=
X-Google-Smtp-Source: AA6agR4btZgpAIbW3mCdAUezI/GNQXpMqmF2NqPI3EW29eVsKm7vXL7q+UFunnd+N8nOB5MF8YTlXw==
X-Received: by 2002:a67:cb9c:0:b0:388:4ee6:5b4f with SMTP id
 h28-20020a67cb9c000000b003884ee65b4fmr1443048vsl.83.1659534323541; 
 Wed, 03 Aug 2022 06:45:23 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 09/10] ppc/pnv: change pnv_phb4_get_pec() to also
 retrieve chip10->pecs
Date: Wed,  3 Aug 2022 10:44:58 -0300
Message-Id: <20220803134459.2633902-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe34.google.com
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

The function assumes that we're always dealing with a PNV9_CHIP()
object. This is not the case when the pnv-phb device belongs to a
powernv10 machine.

Change pnv_phb4_get_pec() to be able to work with PNV10_CHIP() if
necessary.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index c241e90036..a5f3a8d256 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -53,17 +53,30 @@ static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child)
 static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
                                          Error **errp)
 {
-    Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    PnvPHB *phb_base = phb->phb_base;
+    PnvPhb4PecState *pecs = NULL;
     int chip_id = phb->chip_id;
     int index = phb->phb_id;
     int i, j;
 
+    if (phb_base->version == 4) {
+        Pnv9Chip *chip9 = PNV9_CHIP(chip);
+
+        pecs = chip9->pecs;
+    } else if (phb_base->version == 5) {
+        Pnv10Chip *chip10 = PNV10_CHIP(chip);
+
+        pecs = chip10->pecs;
+    } else {
+        return NULL;
+    }
+
     for (i = 0; i < chip->num_pecs; i++) {
         /*
          * For each PEC, check the amount of phbs it supports
          * and see if the given phb4 index matches an index.
          */
-        PnvPhb4PecState *pec = &chip9->pecs[i];
+        PnvPhb4PecState *pec = &pecs[i];
 
         for (j = 0; j < pec->num_phbs; j++) {
             if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
-- 
2.36.1


