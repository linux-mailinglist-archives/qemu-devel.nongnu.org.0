Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF3B59051E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:53:39 +0200 (CEST)
Received: from localhost ([::1]:59558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBRC-0004dA-W7
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBEH-0001Xi-C2; Thu, 11 Aug 2022 12:40:20 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBED-0003iV-JZ; Thu, 11 Aug 2022 12:40:16 -0400
Received: by mail-ua1-x92a.google.com with SMTP id r12so7137632uaf.7;
 Thu, 11 Aug 2022 09:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5xn+FDJgIDAqBv2l8fvbgG1WYMOdEPn2Qv0Y5zaBxUA=;
 b=ArkpSreKKTw9eORaLJeerp5ywXYFFZeYiUSAkdkIvBamrTa2mRgKYddhGw416jdC80
 BbIjcsHlPnTiMBcC6qrhwR8OlwL7XSYkvwFd4gAuGZtoOkFcaNpjb/u6R4c2bFruhd7e
 Z8CTW7DvfPkDao6esEoXI47xI0pPc3mddPGKB6rpRjA0jLsLUAkqGtlN8BR7OqWicPlm
 k+R1/OJ2OnBvFl7H7FbibtgZboUxVF8+dYcLA09PU6uLWdOc/f4VsoySvM6U3iB9Ybtj
 zf1xk6XbaHMWD628mFdhpsLquwjdaBPhSiMT/R92GfjrRfjpPrZKJPuIOEGF86DoxrAc
 dH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5xn+FDJgIDAqBv2l8fvbgG1WYMOdEPn2Qv0Y5zaBxUA=;
 b=Sy6T4IOxaWZEZBYloW1q87DtU7TVkPWYQQUElelvdRO45ceGRrUZM9pRBbcG9B2Rm1
 lsrbbC7TySd3zCDP8NF0L06e/B8tSGurqIJPtsI6dNxIJv7eZExpVzndVLtz1aNrqRDS
 cV0GJwa1ikWg5QS5t13Nc3weanjxPuHsqtsL7Gpy6jicHNLMmhkgfbYPO66PeeDDtPwK
 oPOjeCAD+WdyWlxJmJxuLSx07bRwOXzA1zOYrYayqCa+dG61ICtLSCovbecI1Kr2UJx/
 8bFHIL6fXTli1z4/JH94RaOCQsVQG1NJNz5u0DfOs+jLfVRpJvG/yGGz6MjHxEU1NEC1
 1j8Q==
X-Gm-Message-State: ACgBeo0szt7m6VA/en6nYIs1U1CXg8jxhi70gRz8sIxAMvRaaVCiZQCV
 6JC6i8c94TYhdD2zxo0g9kABPmuJAtE=
X-Google-Smtp-Source: AA6agR5iYuVNI1J5+8RqpZ8brkbgRzX9d92V4C6GsnIVqcp6NTW2VwVX4L7n6x4tiRoUiZaSAJ5s1A==
X-Received: by 2002:ab0:2505:0:b0:384:cc62:9a75 with SMTP id
 j5-20020ab02505000000b00384cc629a75mr8937uan.36.1660236012250; 
 Thu, 11 Aug 2022 09:40:12 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:40:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 08/11] ppc/pnv: enable user created pnv-phb for
 powernv9
Date: Thu, 11 Aug 2022 13:39:47 -0300
Message-Id: <20220811163950.578927-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92a.google.com
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

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c      | 2 +-
 hw/pci-host/pnv_phb4_pec.c | 6 ++++--
 hw/ppc/pnv.c               | 2 ++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 1f53ff77c5..17d9960aa1 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -167,7 +167,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
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
index 0644f45a1d..ec0558ed1c 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2188,6 +2188,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
     pmc->dt_power_mgt = pnv_dt_power_mgt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
-- 
2.36.1


