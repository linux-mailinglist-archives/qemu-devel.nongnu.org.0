Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370D13EA3D0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 13:36:40 +0200 (CEST)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE90n-0001Cv-R7
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 07:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <narmstrong@baylibre.com>)
 id 1mE8x0-0000TA-Sq
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:32:42 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <narmstrong@baylibre.com>)
 id 1mE8ww-0004zm-7S
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:32:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id g138so4228441wmg.4
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 04:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KeJE4dkFdbpAZW/2KBoAiJK9ZOBqRTvkDmsRWOyZ1vc=;
 b=lqHJ5Sr3G8+rt9y1jD+OKTQw8oGlZu6hsaxa2EK9eiFUunzKbvdgH8eOxNwyBwUoUV
 ZiPsjY0402jMcjt3T5I4iWxNewljkFdzwTh1tt1DPLdav4T9aSiHZuc0a1HyWdP6t5KS
 TZJPoTomdWLo9YPPxddQdVWFg66n6h2Wrk9TzkhEI+PFeWZcABGKtkbbYvgUo+jJzMae
 9B6WQyAfZ7ap7B058ODKfXP3dmczebBpHldRcdm5v+08qq6Hoz48U44cNP4KqtPVZYjj
 BaAXJUorJ14YZVL9YE8A/LrHsSde7pmqXKUbURVm6gPomOsj65oF5m5nQcTr3Dbnj6Ye
 +0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KeJE4dkFdbpAZW/2KBoAiJK9ZOBqRTvkDmsRWOyZ1vc=;
 b=njkdxXNXWfteYVx9bEKH2+kWOaws4/nXX9Awal1XVNUMLqk3BhMkhGAL9lcyR+G4j1
 CkMVnQYEDFJAkXzpWFcHglmjAX4NuUg5i7xvE4pk+s2aWXHJPVI8+DohM6zW05sdS0Zl
 odygRH1AgshpXo3zcrdWHQerh90DE/+6A2jS45UrOoJbMYw170HUjA4IWDyZGdrc4zIi
 g8WhLyYdZmwxbImswc5+YrqRyBBTEyd0lv6VowRE9pSosSPqm/U9TBIHr09C2kAM39hG
 t3M7tuGzjlYsuDnllrBYFejw9qNN7oh0/Ih6SQg3o1qgyVyDIvSLvV+Kt2GT6mQivBwo
 ZwSA==
X-Gm-Message-State: AOAM5309AhsVTt8q2/qv8/Gt/jFBdr6hBEH1gvZyZHmfbq+UMF1rtQX7
 MmqalxmusrNCjLvKvkeYrABZiQ==
X-Google-Smtp-Source: ABdhPJwhJzHxosM2i98pwMYUTXMXS5OZtutCyEljyRBsxAppmulDTbdxXVUMO7Y6YQtr/Mo4/tqr3A==
X-Received: by 2002:a05:600c:198e:: with SMTP id
 t14mr3403989wmq.167.1628767953753; 
 Thu, 12 Aug 2021 04:32:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:ff68:9b5a:54d3:146c])
 by smtp.gmail.com with ESMTPSA id 19sm2709293wmj.23.2021.08.12.04.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 04:32:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jslaby@suse.cz
Subject: [PATCH] misc: edu: add MSI-X interrupt generation aswell
Date: Thu, 12 Aug 2021 13:32:30 +0200
Message-Id: <20210812113230.2462428-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=narmstrong@baylibre.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add MSI-X aswell since either MSI or MSI-X are optional and
MSI can still be used without any issues.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 hw/misc/edu.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index e935c418d4..5d0643e1bd 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -27,6 +27,7 @@
 #include "hw/pci/pci.h"
 #include "hw/hw.h"
 #include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
 #include "qemu/timer.h"
 #include "qom/object.h"
 #include "qemu/main-loop.h" /* iothread mutex */
@@ -77,6 +78,11 @@ struct EduState {
     uint64_t dma_mask;
 };
 
+static bool edu_msix_enabled(EduState *edu)
+{
+    return msix_enabled(&edu->pdev);
+}
+
 static bool edu_msi_enabled(EduState *edu)
 {
     return msi_enabled(&edu->pdev);
@@ -86,7 +92,9 @@ static void edu_raise_irq(EduState *edu, uint32_t val)
 {
     edu->irq_status |= val;
     if (edu->irq_status) {
-        if (edu_msi_enabled(edu)) {
+        if (edu_msix_enabled(edu)) {
+            msix_notify(&edu->pdev, 0);
+        } else if (edu_msi_enabled(edu)) {
             msi_notify(&edu->pdev, 0);
         } else {
             pci_set_irq(&edu->pdev, 1);
@@ -369,6 +377,10 @@ static void pci_edu_realize(PCIDevice *pdev, Error **errp)
     if (msi_init(pdev, 0, 1, true, false, errp)) {
         return;
     }
+    if (msix_init_exclusive_bar(pdev, 1, 1, errp)) {
+        return;
+    }
+    msix_vector_use(pdev, 0);
 
     timer_init_ms(&edu->dma_timer, QEMU_CLOCK_VIRTUAL, edu_dma_timer, edu);
 
@@ -397,6 +409,7 @@ static void pci_edu_uninit(PCIDevice *pdev)
 
     timer_del(&edu->dma_timer);
     msi_uninit(pdev);
+    msix_uninit_exclusive_bar(pdev);
 }
 
 static void edu_instance_init(Object *obj)
-- 
2.25.1


