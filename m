Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2763E52D873
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:45:19 +0200 (CEST)
Received: from localhost ([::1]:50850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriKz-0003xd-3K
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAe-0001al-4k
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:38 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:48996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nriAY-0007oV-9m
 for qemu-devel@nongnu.org; Thu, 19 May 2022 11:34:33 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id B824E20896;
 Thu, 19 May 2022 15:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1652974465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yn/s3Oq39rzmoejHaHV+Y/8l9ePpuMuVvPWS30BJqRc=;
 b=tePtb47uxCR+s8BRM3dV4PG45OkcPCEVKVM/+IkXy/ibaM0wtKpVX/5n/VNXniKYej4W18
 Vcm5VRQ+zY2c3/BXB0ld5ZxFUu7a1qj2lAWUPcEKDqXag0lZDF236sMDxBIVCceuUEeuiU
 Oj9M7FmIq9SFwCbDJFZmxBeVaXLbREc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, edgari@xilinx.com,
 Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v5 1/6] machine: add phase_get() and document
 phase_check()/advance()
Date: Thu, 19 May 2022 17:33:57 +0200
Message-Id: <20220519153402.41540-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519153402.41540-1-damien.hedde@greensocs.com>
References: <20220519153402.41540-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

phase_get() returns the current phase, we'll use it in next
commit.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-core.h | 19 +++++++++++++++++++
 hw/core/qdev.c         |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..e29c705b74 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -887,7 +887,26 @@ typedef enum MachineInitPhase {
     PHASE_MACHINE_READY,
 } MachineInitPhase;
 
+/*
+ * phase_get:
+ * Returns the current phase
+ */
+MachineInitPhase phase_get(void);
+
+/**
+ * phase_check:
+ * Test if current phase is at least @phase.
+ *
+ * Returns true if this is the case.
+ */
 extern bool phase_check(MachineInitPhase phase);
+
+/**
+ * @phase_advance:
+ * Update the current phase to @phase.
+ *
+ * Must only be used to make a single phase step.
+ */
 extern void phase_advance(MachineInitPhase phase);
 
 #endif
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..632dc0a4be 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -910,6 +910,11 @@ Object *qdev_get_machine(void)
 
 static MachineInitPhase machine_phase;
 
+MachineInitPhase phase_get(void)
+{
+    return machine_phase;
+}
+
 bool phase_check(MachineInitPhase phase)
 {
     return machine_phase >= phase;
-- 
2.36.1


