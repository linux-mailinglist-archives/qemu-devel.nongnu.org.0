Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEAA56BAEC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:36:08 +0200 (CEST)
Received: from localhost ([::1]:44024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9o9P-0000S9-Hj
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzO-00039I-QE; Fri, 08 Jul 2022 09:25:46 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:43603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzM-00071j-4l; Fri, 08 Jul 2022 09:25:46 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-fe023ab520so29197704fac.10; 
 Fri, 08 Jul 2022 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LILgjFOOuRkzWRbMsHSI0e73MhG07wdHnKtjGOst+WE=;
 b=Yi8fJo6B9RW6kP++SmrRtFeSjf3ROtzlPM3BjroSbonBpnjbKSWfyCGa6mKYIJjHbv
 Ghi5DgkcCsCKe0HoGY/lGpGvdJ6z0adVESqJOChRn1Eb4bzqDsyh8WiwWsy1J+yxmXD1
 t2VcXbKeiWM2ny6REK6Dz+dbNvBS4AwX+adFr6pMBjQ22YtPCSeifk5vR0bmR2ocUdCz
 lX4kH6TfflioDMwHd96MGGgXLy4yo1o1smV+wFgW7LF7p0gjVS8/Oo9dF/tVPu1ozV5l
 At5qW0tuQ1wDRBQMrDX41ZlakCBdUuT2IMEMFRGprrCfEXGP3pst1UDy7oTCE6Brv8ee
 qReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LILgjFOOuRkzWRbMsHSI0e73MhG07wdHnKtjGOst+WE=;
 b=LWfmgYcNotvqG/4bFw76+OaApErGReYgk4aXPgWTRXPnJiHNVUDVTJO24eY3K46UpF
 cLG7WWlBp9IpsEsowcXqB6LkKUBM82Bj1P/nPnwCLqbt1Ryj9Us/vOGKvRVm3epmr8VR
 gSgsfT6g8+Yl+PQ6qmGKdJ8QPWDduralTdtAYyviI7JcbSt/3B87V59EDfB20Ek1u9ZZ
 Sa/URmyEeupKuVGbYe2CwUCS8iTudXFSXF89HH/DvYCmxhrheTJ96bInZdMOgFery/rV
 rCPbr/u9fFmjBqcGa+wZ8pKNddbKAQpkcfWeHh1J+xj9d0FFPyIdeVuaDPPb942+EWdN
 Ewsg==
X-Gm-Message-State: AJIora9s4jVrCJhwE12CGgG/aV7JJ5JHvD1XNXUzlTgHSEvzDA1hizjU
 GfKWPqFl3zOopiFPt0DnpT21zfQ3I/M=
X-Google-Smtp-Source: AGRyM1tljiUqmg2w+xI/u0gzsDvzf5b0VQt3Z2uivC0qSZsH27BadBskf2DMcxeYbLlQ93qYiCdp3w==
X-Received: by 2002:a05:6870:d90d:b0:108:6d45:ca16 with SMTP id
 gq13-20020a056870d90d00b001086d45ca16mr1859377oab.40.1657286743020; 
 Fri, 08 Jul 2022 06:25:43 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 08/10] ppc/pnv: enable user created pnv-phb powernv9
Date: Fri,  8 Jul 2022 10:25:20 -0300
Message-Id: <20220708132522.581382-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708132522.581382-1-danielhb413@gmail.com>
References: <20220708132522.581382-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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

Enable pnv-phb user created devices for powernv9 now that we have
everything in place.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c      | 2 +-
 hw/pci-host/pnv_phb4_pec.c | 6 ++++--
 hw/ppc/pnv.c               | 2 ++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 9807d093f5..c241e90036 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -211,7 +211,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    if (phb->version == 3 && !defaults_enabled()) {
+    if (!defaults_enabled()) {
         return;
     }
 
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 8dc363d69c..9871f462cd 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -146,8 +146,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     pec->num_phbs = pecc->num_phbs[pec->index];
 
     /* Create PHBs if running with defaults */
-    for (i = 0; i < pec->num_phbs; i++) {
-        pnv_pec_default_phb_realize(pec, i, errp);
+    if (defaults_enabled()) {
+        for (i = 0; i < pec->num_phbs; i++) {
+            pnv_pec_default_phb_realize(pec, i, errp);
+        }
     }
 
     /* Initialize the XSCOM regions for the PEC registers */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index f5af40ce39..32040a52c8 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2138,6 +2138,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
     pmc->dt_power_mgt = pnv_dt_power_mgt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
-- 
2.36.1


