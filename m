Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A9B4C0FBD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:02:33 +0100 (CET)
Received: from localhost ([::1]:44068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMoTf-0001ea-Oz
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:02:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnch-0001UB-JF
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnce-00022u-Pg
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:47 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 12D8721EBD;
 Wed, 23 Feb 2022 09:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaNB2TsWb8LnUxC0b8QE1vl0YRpFNbVBSRKKXrGk7SU=;
 b=a4eWfCz8NYAq91dTRS2o3vC21NfN3SZEYjYKIkCrrgGpEfuqympcdcTWgQFCDkjYHn+3NL
 TywpLsJxK8f/57GIthmSdLOFcfaEQcIOglYO6czm97TXbw8TAuz0gW0I4Szxyce95LkUgx
 6mJbQazOk7OwQMhdl5UOs+kyArWaIRo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 07/14] none-machine: add the NoneMachineState structure
Date: Wed, 23 Feb 2022 10:06:59 +0100
Message-Id: <20220223090706.4888-8-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223090706.4888-1-damien.hedde@greensocs.com>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
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
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The none machine was using the parent state structure.
We'll need a custom state to add a field in the following commit.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/null-machine.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index f586a4bef5..7eb258af07 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -17,6 +17,13 @@
 #include "exec/address-spaces.h"
 #include "hw/core/cpu.h"
 
+struct NoneMachineState {
+    MachineState parent;
+};
+
+#define TYPE_NONE_MACHINE MACHINE_TYPE_NAME("none")
+OBJECT_DECLARE_SIMPLE_TYPE(NoneMachineState, NONE_MACHINE)
+
 static void machine_none_init(MachineState *mch)
 {
     CPUState *cpu = NULL;
@@ -42,8 +49,10 @@ static void machine_none_init(MachineState *mch)
     }
 }
 
-static void machine_none_machine_init(MachineClass *mc)
+static void machine_none_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "empty machine";
     mc->init = machine_none_init;
     mc->max_cpus = 1;
@@ -56,4 +65,15 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_sdcard = 1;
 }
 
-DEFINE_MACHINE("none", machine_none_machine_init)
+static const TypeInfo none_machine_info = {
+    .name          = TYPE_NONE_MACHINE,
+    .parent        = TYPE_MACHINE,
+    .instance_size = sizeof(NoneMachineState),
+    .class_init    = machine_none_class_init,
+};
+
+static void none_machine_register_types(void)
+{
+    type_register_static(&none_machine_info);
+}
+type_init(none_machine_register_types);
-- 
2.35.1


