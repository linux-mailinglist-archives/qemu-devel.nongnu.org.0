Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32102FB464
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 09:43:25 +0100 (CET)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1mbk-0008Ht-Qz
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 03:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVb-0008La-DD
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:03 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]:40845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l1mVZ-0003WI-1V
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 03:37:02 -0500
Received: by mail-wm1-f50.google.com with SMTP id c127so454462wmf.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 00:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82040SlXkePZdzPsM+5O3xrDuN6hQ94MWNkWdWB/RtM=;
 b=SOcNXFGq6JsB/0JhUXprh2DS4FlsHfu+L31+EpcMvotInLIiMhzAEX33bTYiuuG6eB
 MunPJV3PTskGk0vEoPyJFkc1bVtxNq4804liPVWS0QbnseVNmRCPt+gWGJ3AD86PRXEQ
 gTuRPlB1FZQOWQhERjtp1aqjiE6LOl7XPVWLJQY34MvNJi6gnxPDp9l+5+ctu3Ot/oTf
 oAm1jtp1qZWevMUA4sfjlY/WeVBJPZ9gVbqETgWHBaBgRrl7OmpFMD7bZbBeFyzC674W
 0jayJqhHvOXOLqd+M+2STlHPdmEwnxLqNFOMCuRQaIvQqPGy+QTxy14dmSynFZVnBsZG
 l9Og==
X-Gm-Message-State: AOAM533h+StK5wkYd3WarKKXzpmtSmDFxkpVC4P3+GGcX7dkEnYnqc0q
 nWK+8HvDL0m40Gr5seV8QL+GFgpTuA8=
X-Google-Smtp-Source: ABdhPJz1MeapYtDenA0eRj4MBre1WajUelG1XlvtrUFcBLh9kFYwKvo7XpI92MjFIeW/jFzkSZw+aQ==
X-Received: by 2002:a7b:c31a:: with SMTP id k26mr2924228wmj.72.1611045419262; 
 Tue, 19 Jan 2021 00:36:59 -0800 (PST)
Received: from localhost.localdomain (pd9e83aed.dip0.t-ipconnect.de.
 [217.232.58.237])
 by smtp.gmail.com with ESMTPSA id z14sm540833wrm.5.2021.01.19.00.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 00:36:59 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/11] hw/m68k/next-cube: Add vmstate for NeXTPC device
Date: Tue, 19 Jan 2021 09:36:16 +0100
Message-Id: <20210119083617.6337-11-huth@tuxfamily.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
References: <20210119083617.6337-1-huth@tuxfamily.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.50; envelope-from=th.huth@gmail.com;
 helo=mail-wm1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Add the vmstate for the new NeXTPC devic; this is in theory
a migration compatibility break, but this machine doesn't have
working migration currently anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210115201206.17347-11-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 hw/m68k/next-cube.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index 1f6a2d58a1..92b45d760f 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "ui/console.h"
 #include "target/m68k/cpu.h"
+#include "migration/vmstate.h"
 
 /* #define DEBUG_NEXT */
 #ifdef DEBUG_NEXT
@@ -891,6 +892,37 @@ static Property next_pc_properties[] = {
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
@@ -899,7 +931,7 @@ static void next_pc_class_init(ObjectClass *klass, void *data)
     dc->realize = next_pc_realize;
     dc->reset = next_pc_reset;
     device_class_set_props(dc, next_pc_properties);
-    /* We will add the VMState in a later commit */
+    dc->vmsd = &next_pc_vmstate;
 }
 
 static const TypeInfo next_pc_info = {
-- 
2.29.2


