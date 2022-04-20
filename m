Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D65509299
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:21:46 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIhl-0004jv-88
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIcd-00073u-Ce; Wed, 20 Apr 2022 18:16:27 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:40748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIcb-00061x-On; Wed, 20 Apr 2022 18:16:27 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 r12-20020a056830418c00b006054e1142acso2046188otu.7; 
 Wed, 20 Apr 2022 15:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kGxZRbx9WXJUivEDQO2tFqBprKkdKlsGwyGqUDwNJN4=;
 b=l0AdLQnzvaTcrlyf31WCE1WBwY4vniX3XGx98rlTAA/6MQf73nUfWtIxdPF+IjwuPZ
 M4jrwHJtJumKZlwY17/VKrqOGk9sMcU4bL1Lw7q89h6binboFIRQWSg/lQQymNPiYGuq
 SsZYUPKlY5wSmBju5U3tMkHHXX61nxCbQMUpxjmZwXabNvJueFbOvEw/57TcoJo9plhr
 ttMawvCe/UAXHaaJ/z/+8hXaTh4LFFHhd5lmkfX8rnJIh7+yz/ZmeUHuohLNNiPmmnTr
 KrbcMRkReQqElatjEgARbfJVzKHUf0mT0qmArqnIsQ29KddQDxNSngWBbPdqPI8eDvuu
 9okQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kGxZRbx9WXJUivEDQO2tFqBprKkdKlsGwyGqUDwNJN4=;
 b=MYhmXJ1iiJyHr83QsqpvcIoz8GKCNhP2SjBUUwMEq+Ah9fZYA0msTjkn6aX5EXZ30Z
 WBKgugf4o3lqIgQqzGRJgOjCZzRgNJRcMWQ6LCeho19ySMXleKbcABc2angxs5Oryy0d
 h7AJW5CfHm/HCIGIR7RCo5a5GzTlob8x3vCAlbwNfX4d0xK3sqBnmcxbgb5bLYJS+lip
 I3u9Mfxekie8+rFYA4AEeu/qr7ZBy4X3S4/BwdJ/aUohcAv3OZ0PW0UlYpVM/TY56L0Z
 2Q/9mxApaVVH9w/t6RLTOc4LxXLw9MIcFqWTKR59brW61hg3ogBdR6DLu5L+I4hm0J3G
 Z5YQ==
X-Gm-Message-State: AOAM533TR3AxXCKXAvHw0HR5l3YmGlWyECtz00rrr+PIPzimhVzJ5GFc
 qbE/BHWq63bLkTCMIJFSweAidEVDZB8=
X-Google-Smtp-Source: ABdhPJxMhI2psdNQ/sIpUvKwerek+LRqUuKJ0gYEx9YCKI6Aoz5h9M1mPDe4/ZeZU7oaxu2mu0K8nA==
X-Received: by 2002:a9d:7f07:0:b0:605:6d56:99bf with SMTP id
 j7-20020a9d7f07000000b006056d5699bfmr1131259otq.42.1650492984058; 
 Wed, 20 Apr 2022 15:16:24 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:15:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/23] ppc/pnv: Fix PSI IRQ definition
Date: Wed, 20 Apr 2022 19:13:09 -0300
Message-Id: <20220420221329.169755-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

On HW, the PSI and FSP interrupt levels are muxed under the same
interrupt number. For coding reasons, an extra IRQ number was
introduced to index register values in an array. It increased the
count of IRQs which do not fit in the PSI IRQ range anymore.

The PSI and FSP interrupts should be modeled with an extra level of
GPIO lines but since QEMU does not support them, simply drop the extra
number to stay within the IRQ range.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220323072846.1780212-2-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv_psi.c         | 9 +++------
 include/hw/ppc/pnv_psi.h | 3 +--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 466fb79798..c588a506c7 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -184,8 +184,7 @@ static void pnv_psi_set_irsn(PnvPsi *psi, uint64_t val)
 /*
  * FSP and PSI interrupts are muxed under the same number.
  */
-static const uint32_t xivr_regs[] = {
-    [PSIHB_IRQ_PSI]       = PSIHB_XSCOM_XIVR_FSP,
+static const uint32_t xivr_regs[PSI_NUM_INTERRUPTS] = {
     [PSIHB_IRQ_FSP]       = PSIHB_XSCOM_XIVR_FSP,
     [PSIHB_IRQ_OCC]       = PSIHB_XSCOM_XIVR_OCC,
     [PSIHB_IRQ_FSI]       = PSIHB_XSCOM_XIVR_FSI,
@@ -194,8 +193,7 @@ static const uint32_t xivr_regs[] = {
     [PSIHB_IRQ_EXTERNAL]  = PSIHB_XSCOM_XIVR_EXT,
 };
 
-static const uint32_t stat_regs[] = {
-    [PSIHB_IRQ_PSI]       = PSIHB_XSCOM_CR,
+static const uint32_t stat_regs[PSI_NUM_INTERRUPTS] = {
     [PSIHB_IRQ_FSP]       = PSIHB_XSCOM_CR,
     [PSIHB_IRQ_OCC]       = PSIHB_XSCOM_IRQ_STAT,
     [PSIHB_IRQ_FSI]       = PSIHB_XSCOM_IRQ_STAT,
@@ -204,8 +202,7 @@ static const uint32_t stat_regs[] = {
     [PSIHB_IRQ_EXTERNAL]  = PSIHB_XSCOM_IRQ_STAT,
 };
 
-static const uint64_t stat_bits[] = {
-    [PSIHB_IRQ_PSI]       = PSIHB_CR_PSI_IRQ,
+static const uint64_t stat_bits[PSI_NUM_INTERRUPTS] = {
     [PSIHB_IRQ_FSP]       = PSIHB_CR_FSP_IRQ,
     [PSIHB_IRQ_OCC]       = PSIHB_IRQ_STAT_OCC,
     [PSIHB_IRQ_FSI]       = PSIHB_IRQ_STAT_FSI,
diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
index eb841b34a1..6d9f8ce7c0 100644
--- a/include/hw/ppc/pnv_psi.h
+++ b/include/hw/ppc/pnv_psi.h
@@ -1,7 +1,7 @@
 /*
  * QEMU PowerPC PowerNV Processor Service Interface (PSI) model
  *
- * Copyright (c) 2015-2017, IBM Corporation.
+ * Copyright (c) 2015-2022, IBM Corporation.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -85,7 +85,6 @@ struct PnvPsiClass {
 
 /* The PSI and FSP interrupts are muxed on the same IRQ number */
 typedef enum PnvPsiIrq {
-    PSIHB_IRQ_PSI, /* internal use only */
     PSIHB_IRQ_FSP, /* internal use only */
     PSIHB_IRQ_OCC,
     PSIHB_IRQ_FSI,
-- 
2.35.1


