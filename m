Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CBF4ED981
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:18:34 +0200 (CEST)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtl3-0005jZ-77
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:18:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZtMi-00061n-3H
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:53:26 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:54046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZtMb-00005g-OT
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:53:23 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id BEBF321C39;
 Thu, 31 Mar 2022 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648727593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dsQmNcNr3FKvvqlW4Fm/tpXyRbUqSTE4gpq1FzHqJIY=;
 b=CY4M9NwccVDz3xvaHOXKuB5tNhZbON/w5pKw2FVG2iSPoKMaqhMO87Jx93EYx8oUZmTPNS
 EHXgESlw+G/lGZtaRpyi1x7/E0klL8ESOXNW1Fq+PR/CPg1uo6m7vw9FVrQlm9jKx3agyn
 UhqUdh0zs7dTK3xJ173fbeLeOFAjcp8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] qdev: add user_creatable_requires_machine_allowance
 class flag
Date: Thu, 31 Mar 2022 13:53:08 +0200
Message-Id: <20220331115312.30018-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331115312.30018-1-damien.hedde@greensocs.com>
References: <20220331115312.30018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This flag will be used in device_add to check if
the device needs special allowance from the machine
model.

It will replace the current check based only on the
device being a TYPE_SYB_BUS_DEVICE.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

v2:
 + change the flag name and put it just below user_creatable
---
 include/hw/qdev-core.h | 9 +++++++++
 hw/core/qdev.c         | 1 +
 hw/core/sysbus.c       | 1 +
 3 files changed, 11 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 92c3d65208..6a040fcd3b 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -122,6 +122,15 @@ struct DeviceClass {
      * TODO remove once we're there
      */
     bool user_creatable;
+    /*
+     * Some devices can be user created under certain conditions (eg:
+     * specific machine support for sysbus devices), but it is
+     * preferable to prevent global allowance for the reasons
+     * described above.
+     * This flag is an additional constraint over user_creatable:
+     * user_creatable still needs to be set to true.
+     */
+    bool user_creatable_requires_machine_allowance;
     bool hotpluggable;
 
     /* callbacks */
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 84f3019440..0844c85a21 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -833,6 +833,7 @@ static void device_class_init(ObjectClass *class, void *data)
      */
     dc->hotpluggable = true;
     dc->user_creatable = true;
+    dc->user_creatable_requires_machine_allowance = false;
     vc->get_id = device_vmstate_if_get_id;
     rc->get_state = device_get_reset_state;
     rc->child_foreach = device_reset_child_foreach;
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 05c1da3d31..5f771ed1e9 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -325,6 +325,7 @@ static void sysbus_device_class_init(ObjectClass *klass, void *data)
      * subclass needs to override it and set user_creatable=true.
      */
     k->user_creatable = false;
+    k->user_creatable_requires_machine_allowance = true;
 }
 
 static const TypeInfo sysbus_device_type_info = {
-- 
2.35.1


