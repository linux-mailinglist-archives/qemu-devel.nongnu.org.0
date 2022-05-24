Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FC6532BDA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 16:00:59 +0200 (CEST)
Received: from localhost ([::1]:44360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntV5l-0003il-QI
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 10:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ntUtW-0002gS-6D
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:48:18 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:53556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1ntUtT-0001e4-Hs
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:48:17 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPS id 0571321A87;
 Tue, 24 May 2022 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1653400091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kGbmojpONS/3zhVqPidkTxkp029lvf47gykf1NPvoaE=;
 b=S1jsl5zvPCr08CbX9qKvwqQ8VsK+UGYwLq7N8LT5z+t02SRGAs1e8i+XvTG3I47SDeA84a
 egXSIYasQDrInVBZ4xm/bnWPC9s9ehj+CcbwiWAS2iGqIPL3V9u6wnCrJmXnaDbih+flub
 BA52uqXzn7VPKXkUfSzE1ocnQRxSjfw=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v5 1/3] none-machine: allow cold plugging sysbus devices
Date: Tue, 24 May 2022 15:48:07 +0200
Message-Id: <20220524134809.40732-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220524134809.40732-1-damien.hedde@greensocs.com>
References: <20220524134809.40732-1-damien.hedde@greensocs.com>
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

Allow plugging any sysbus device on this machine (the sysbus
devices still need to be 'user-creatable').

This commit is needed to use the 'none' machine as a base, and
subsequently to dynamically populate it with sysbus devices using
qapi commands.

Note that this only concern cold-plug: sysbus devices can not be
hot-plugged because the sysbus bus does not support it.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

v5:
  + fix commit message (Philippe)
---
 hw/core/null-machine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index f586a4bef5..21bc2aca23 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -16,6 +16,7 @@
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "hw/core/cpu.h"
+#include "hw/sysbus.h"
 
 static void machine_none_init(MachineState *mch)
 {
@@ -54,6 +55,9 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->no_sdcard = 1;
+
+    /* allow cold plugging any any "user-creatable" sysbus device */
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SYS_BUS_DEVICE);
 }
 
 DEFINE_MACHINE("none", machine_none_machine_init)
-- 
2.36.1


