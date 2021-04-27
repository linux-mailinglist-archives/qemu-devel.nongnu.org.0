Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D56336C86B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:12:35 +0200 (CEST)
Received: from localhost ([::1]:56738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPO6-0006iV-9f
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <su_yuheng@foxmail.com>)
 id 1lbNWP-0003eB-NK
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:13:01 -0400
Received: from out203-205-221-231.mail.qq.com ([203.205.221.231]:60406
 helo=qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <su_yuheng@foxmail.com>)
 id 1lbNWG-0000Wf-C7
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1619529161;
 bh=zsCTlQiBLf2DM31rU6FksdvN1DBmBvK6Rsa4w+orFHM=;
 h=From:To:Cc:Subject:Date;
 b=WhHg+FNOS4Bnhpxp1Zv0xNgu2930RZ4j7X7uXgZXzS7ZaW6E1/ylROGKIUJRZkyfO
 jEZdL20Rzf4n+5wSGhHTxpBrUve4344X3Pr5imj+HmkemCOV/TPqR7+0kMmMUHrKIq
 t53VeoXmgYcTMtlVOGsQhCv9ARRdjNDJD82W0NHY=
Received: from n248-149-034.byted.org. ([121.30.179.175])
 by newxmesmtplogicsvrszb7.qq.com (NewEsmtp) with SMTP
 id 12593828; Tue, 27 Apr 2021 21:04:37 +0800
X-QQ-mid: xmsmtpt1619528677t8kqsohzr
Message-ID: <tencent_F4EF5FC4638158CB96B434014DF9CBF62405@qq.com>
X-QQ-XMAILINFO: OGv74GxX8vTYbmWGewXqyb4bUJMKAfrXk3DkQxAdPjt0K5us3ySOMnt2haBoEM
 FuTQdic+NbqC2FmrlY99expZ2BOJTMwxN29pF0NZCpp0l3GFb+jpPOmQ6LKf6C3s85U9Huhb5cuZ
 qf/tX02ZgPutIsr/0gZ/kbxOFrhNdGCdX0XNqqGLfKrW6jmDTuMzwxwoIO3HS+spENRjy1+OPCUT
 rQw0uVZKOKdrs2K9Jkxfv4IdCddwwTEZxu6LoRJwPZbkZRKQ2Lpfx60GHC+C+UnKnG49qlOwC51v
 SkhTsKSIVWGSl4pwi1Snviiu6CQmMUx5oVW7w9j9f1na7/tnUJnlUNwNfiOnzNS2o4WE0rIbhnAo
 BkM6Ne7bOelY0jfKyry1FFRWGXr/lroWi67my/Sifwqd4DDUk1PLIZ0pemPoSrtYYQ28+md3eaO9
 CWIrfiu62entUzhhuLmLpxUn6IIEe2EiTRNFKhn9tAE17vMpJDrAFdYPTHaopdXNFW59EYtOp6pD
 dHpVNlpmSFaTlTVb6rHVb241JscH9O8ToyFTsYJd0+U8TUyRj29AzRxcLJT8NR1/pHAFxvwf0jyf
 VV4nu7Yv9K/56aQNS/eFIWRU4u9NhNkLKraIL5eWa1o5IDpqxb9uiY7PRIN3vo1ZCYnjsRa7SUGo
 3mdJXbRtSwTnPg8E6y2HiAR8LuVbh1LJs3KCSPQJFfKo3/Gdxq8AMZdZzwwFmzXHB5O8Ic/OmzCF
 2v6SZRID40ejsu8APGF23+5GpzLTbo+U4ayJ1pom+RyHyOW8Oaqe9NovIFmF6X9T9fuPX1vVwwAA
 wUWOmhFnTw2bFpoEexrIVq3Xj3v+A7pT5zFYPxrOBSvEuXsVoWBpxc
From: suyuheng <su_yuheng@foxmail.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com
Subject: [PATCH] microvm: Enable hotplug of pcie
Date: Tue, 27 Apr 2021 21:04:27 +0800
X-OQ-MSGID: <20210427130427.581484-1-su_yuheng@foxmail.com>
X-Mailer: git-send-email 2.11.0
Received-SPF: pass client-ip=203.205.221.231;
 envelope-from=su_yuheng@foxmail.com; helo=qq.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_DYNAMIC=0.982,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Apr 2021 11:08:51 -0400
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
Cc: Yuheng Su <suyuheng@bytedance.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuheng Su <suyuheng@bytedance.com>

Signed-off-by: Yuheng Su <suyuheng@bytedance.com>
---
 hw/i386/acpi-microvm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index ccd3303aac..4f32bf512f 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -26,6 +26,7 @@
 
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pci.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
@@ -209,6 +210,16 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
                     ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
                     x86ms->oem_table_id);
 
+    acpi_add_table(table_offsets, tables_blob);
+    {
+        AcpiMcfgInfo mcfg = {
+           .base = mms->gpex.ecam.base,
+           .size = mms->gpex.ecam.size,
+        };
+        build_mcfg(tables_blob, tables->linker, &mcfg, x86ms->oem_id,
+                   x86ms->oem_table_id);
+    }
+
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
                x86ms->oem_table_id);
-- 
2.11.0


