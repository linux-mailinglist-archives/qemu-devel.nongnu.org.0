Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE3F2F8695
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:21:50 +0100 (CET)
Received: from localhost ([::1]:41720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VbR-0006HO-OB
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSJ-00061D-4n
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:23 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSH-0008KT-G4
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:22 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c5so10489855wrp.6
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dg8m2zopNi5seDJ3Lmhy2PyjbDdEnmQIoHpz7Tv3WJ0=;
 b=An9KiHFNFETVmRotcwHqKM+RF+JovbGf2v9i085a+6hxTkNGR6ruM83Joq8QEuWxWu
 qpX54O7tszG32oU6D59VDPkFQbJSb6te+bELwZwbU/LWiEAvtZ6c8RuvOHXW9Gh4q5n6
 jOCCdlnqG90l2ckHRbaldMOYBPS9Z5enEYBXNefM8MfpWlHUINoELvmJ3jzfzKlChZN+
 mtXMCMrJmp6gJcxhOynRbG7/aM0pTxQKaKiiffa6Noo733vwDfnTZJbm4fdjoRAbzBix
 IqK4515OpETRlmLloLPo+cUswdDGtTTpPw/Kqcn4JETBD3KZj1rG3m29IGSQKq+BZwKk
 ppPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dg8m2zopNi5seDJ3Lmhy2PyjbDdEnmQIoHpz7Tv3WJ0=;
 b=KK3qmDihRY2DPqA84peBdu5Kp1oIK298bA3EOCGFiFzEcZkzKPwWv+PaM3p5hC7/tO
 AiJtwJdbrIn2X2Cvo9b7UAJS8IfU9s9aClNO2p5cpHQrDm3iSgDBNsrx0cx21Fg0Eb+U
 Is4V/tXolDC68ZRfQnrImhTmZTky2EFFeIv6LqEnP6YxoG/tmdmPYssq0vS/c7+CULah
 laXjQM4XZpr16qGa6A0Ab6J6TcJEXwnDluERUSjZh80mg9RkBIqLxjSFigjhjjLCIBdq
 eRkwCRIMgt//WpOpT+GA+jATueDkm115yOsOH03Ismj2fJv9lpjUIY8jeabyKmRxt7RB
 Z/vw==
X-Gm-Message-State: AOAM5330YEWSf0kqUXtMg3ZtOVZkLw1t5022+1z3EiKszD1W5n6vvOL4
 fG23Ay/frcE8THc/pqSL75ow2q07IyLlrA==
X-Google-Smtp-Source: ABdhPJwnem4bDAnPqb+sk6nhOMJK9t+ibAYGa1mO3JjTe58l5x0ULnW6E2rT2fN9POhoddLwPVVT1g==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr15033769wrq.425.1610741539913; 
 Fri, 15 Jan 2021 12:12:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] hw/m68k/next-cube: Add vmstate for NeXTPC device
Date: Fri, 15 Jan 2021 20:12:05 +0000
Message-Id: <20210115201206.17347-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the vmstate for the new NeXTPC devic; this is in theory
a migration compatibility break, but this machine doesn't have
working migration currently anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/m68k/next-cube.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index dd0a2a5aea0..9eb1e31752b 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "ui/console.h"
 #include "target/m68k/cpu.h"
+#include "migration/vmstate.h"
 
 /* #define DEBUG_NEXT */
 #ifdef DEBUG_NEXT
@@ -890,6 +891,37 @@ static Property next_pc_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static const VMStateDescription next_rtc_vmstate = {
+    .name = "next-rtc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8_ARRAY(ram, NextRtc, 32),
+        VMSTATE_UINT8(command, NextRtc),
+        VMSTATE_UINT8(value, NextRtc),
+        VMSTATE_UINT8(status, NextRtc),
+        VMSTATE_UINT8(control, NextRtc),
+        VMSTATE_UINT8(retval, NextRtc),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static const VMStateDescription next_pc_vmstate = {
+    .name = "next-pc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(scr1, NeXTPC),
+        VMSTATE_UINT32(scr2, NeXTPC),
+        VMSTATE_UINT32(int_mask, NeXTPC),
+        VMSTATE_UINT32(int_status, NeXTPC),
+        VMSTATE_UINT8(scsi_csr_1, NeXTPC),
+        VMSTATE_UINT8(scsi_csr_2, NeXTPC),
+        VMSTATE_STRUCT(rtc, NeXTPC, 0, next_rtc_vmstate, NextRtc),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static void next_pc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -898,7 +930,7 @@ static void next_pc_class_init(ObjectClass *klass, void *data)
     dc->realize = next_pc_realize;
     dc->reset = next_pc_reset;
     device_class_set_props(dc, next_pc_properties);
-    /* We will add the VMState in a later commit */
+    dc->vmsd = &next_pc_vmstate;
 }
 
 static const TypeInfo next_pc_info = {
-- 
2.20.1


