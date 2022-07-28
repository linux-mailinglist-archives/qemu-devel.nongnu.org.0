Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE6583E19
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 13:53:43 +0200 (CEST)
Received: from localhost ([::1]:39122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH25G-00051V-Hr
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 07:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH22P-0002yB-49
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 07:50:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH22L-0006td-7p
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 07:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659009038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yfFi/9vlFe4SVrqhiHG4ydC0DVI6vxRGfvaF+wwWuB8=;
 b=cn5pAldJeY58BFX2qJsR0VYrtx3vydWXGTgChHlKmCyLqtxvevs7+grRTpI3ONNwOqAb+d
 AWDTXy9MP1iuGhGQuA8xElyh9A0musq+wYBxoB8lf07ZDBk5CFXquDFECwp4UHJ7Hgbc1n
 wRObKdd0geKF+jLehy1gTeiBNW978TU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-DAvmA9NGPDOJ7V70rZHCCQ-1; Thu, 28 Jul 2022 07:50:37 -0400
X-MC-Unique: DAvmA9NGPDOJ7V70rZHCCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 953441C05AC2;
 Thu, 28 Jul 2022 11:50:36 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 505C9141511F;
 Thu, 28 Jul 2022 11:50:35 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 peter.maydell@linaro.org, ani@anisinha.ca, dgilbert@redhat.com,
 mst@redhat.com
Subject: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
Date: Thu, 28 Jul 2022 07:50:34 -0400
Message-Id: <20220728115034.1327988-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
  $ qemu-system-mips -monitor stdio
  (qemu) migrate "exec:gzip -c > STATEFILE.gz"
  Segmentation fault (core dumped)

It happens due to PIIX4_PM trying to parse hotplug vmstate structures
which are valid only for x86 and not for MIPS (as it requires ACPI
tables support which is not existent for ithe later)

Issue was probably exposed by trying to cleanup/compile out unused
ACPI bits from MIPS target (but forgetting about migration bits).

Disable compiled out features using compat properties as the least
risky way to deal with issue.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
PS:
another approach could be setting defaults to disabled state and
enabling them using compat props on PC machines (which is more
code to deal with => more risky) or continue with PIIX4_PM
refactoring to split x86-shism out (which I'm not really
interested in due to risk of regressions for not much of
benefit)
---
 hw/mips/malta.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 7a0ec513b0..0e932988e0 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device = {
     .instance_init = mips_malta_instance_init,
 };
 
+GlobalProperty malta_compat[] = {
+    { "PIIX4_PM", "memory-hotplug-support", "off" },
+    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
+    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
+    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
+};
+const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
+
 static void mips_malta_machine_init(MachineClass *mc)
 {
     mc->desc = "MIPS Malta Core LV";
@@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass *mc)
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
 #endif
     mc->default_ram_id = "mips_malta.ram";
+    compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
 }
 
 DEFINE_MACHINE("malta", mips_malta_machine_init)
-- 
2.31.1


