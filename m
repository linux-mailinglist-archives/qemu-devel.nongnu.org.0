Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA4F4C0F9C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:54:21 +0100 (CET)
Received: from localhost ([::1]:60406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoLk-0001nA-PD
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:54:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncc-0001Tw-EL
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncP-0001zO-Qc
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:36 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 1043221C36;
 Wed, 23 Feb 2022 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZWF8zdWv3oxTpKzce+G0IL5UnOX2sfeDOvbB9FkH8s=;
 b=srEBmfvUH4+v0bT36pQ8mXdeNYKa4Hqlk06CMeqnwPz0OlOlWtBA9lr9kyydCWoKwyRgg0
 W5rUEunRvV2q2ndEn2szLo/8f43bwzAZt4Koe2LnAHDWBVK26rF/aihggJ7XAH9ppJPxTl
 QZ55sPXcUZQfl7500gOw/TA/AqjjE8U=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 01/14] machine: add phase_get() and document
 phase_check()/advance()
Date: Wed, 23 Feb 2022 10:06:53 +0100
Message-Id: <20220223090706.4888-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223090706.4888-1-damien.hedde@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

phase_get() returns the current phase, we'll use it in next
commit.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
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
2.35.1


