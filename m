Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE14C0F3E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:31:15 +0100 (CET)
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnzO-0003fX-Gk
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:31:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncg-0001U6-9o
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMnce-00022x-Pu
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:46 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 0087A21EC1;
 Wed, 23 Feb 2022 09:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qt+ol21qgIv6OQQUWDXZLUHokTiPWEUZfPCAlGQbiHQ=;
 b=CAnnmbHtIMpukq/EvDYei3hLMi+AEAu604k3MyOjhFdjMxZ2JS2a41FjDQt+EAxY3QFMWh
 a7Pptsj1qaDsOKNjPZ7MQqKg4W2KIAT//C9KLXyoqLHRz7nhZiaKtHKQKT/LxGTOmYH3o7
 3u0A1Tw4g5RmLgOyqPaKoJFQ4MQ0oH4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 09/14] none-machine: allow cold plugging sysbus devices
Date: Wed, 23 Feb 2022 10:07:01 +0100
Message-Id: <20220223090706.4888-10-damien.hedde@greensocs.com>
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

Allow plugging any sysbus device on this machine (the sysbus
devices still need to be 'user-creatable').

This commit is needed to use the 'none' machine as a base, and
subsequently to dynamically populate it with sysbus devices using
qapi commands.

Note that this only concern cold-plug: sysbus devices cann't be hot
plugged because the sysbus bus does not support it.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/null-machine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index 5fd1cc0218..702b56232d 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -17,6 +17,7 @@
 #include "exec/address-spaces.h"
 #include "hw/core/cpu.h"
 #include "qapi/visitor.h"
+#include "hw/sysbus.h"
 
 struct NoneMachineState {
     MachineState parent;
@@ -93,6 +94,9 @@ static void machine_none_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "ram-addr",
         "Base address of the RAM (default is 0)");
+
+    /* allow cold plugging any any "user-creatable" sysbus device */
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
 }
 
 static const TypeInfo none_machine_info = {
-- 
2.35.1


