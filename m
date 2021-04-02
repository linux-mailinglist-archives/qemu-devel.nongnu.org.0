Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD9352765
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 10:22:58 +0200 (CEST)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSF4z-000125-BQ
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 04:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lSF3f-0000SZ-89
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:21:36 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lSF3d-0007N5-JI
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:21:34 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so3989698wml.2
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 01:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/kkhhXrv9zALTxYnf0aoOrh65wTIbb7FoLwL6ANAmNM=;
 b=Pv7Koy83AqyuWHSmJAXt1WeFBVqACWfbmEv9psz1fyfM7ITDFnwEqWGRSkJUN2rkmx
 s/yJl/+uU4CBu+oqCjI+olPGEfiQqEh/bQzd+JzkaHJ0DCRhe3Fu99qDIeCesOns/MAq
 NDncKPHcgCdgCwgALlYv55UycJx71MhXvlqmIVldjIYKVT4MGNzlQH5f7pzFFWEWZ5M2
 VdP9zLoRaBE9HgbQxq4DkBbBRKTjPGgh6ZiBopH5QpULG/e4kF8ijNZG0lHZ5KWha4NI
 5Ql2Ol9f9iRQsFhLTImdwdaa63v52MDsSl7PVxLn7ZPQzRLv5d9HzpO3or0WxUAE26dI
 /Spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/kkhhXrv9zALTxYnf0aoOrh65wTIbb7FoLwL6ANAmNM=;
 b=TJfOAocmeq1wAJkU6KjF/luhNIayqAFd9vNFMu/svAFtRJ2CT23psWd5zpAudp5pKe
 NLFekRz2i1r6d0BCsL7QtViAp3tM6ChQCC3ayzsMCj+2taSKpn9266oFZxYgcjkMFbiL
 N0rP6zQXj/m9Pxo1eoV1G3XBWf8KgJNbmpzVXsB5zE27j1DN010gS1aubb/+o6SUW173
 9J96hF7xfod5tlTYIebVkN56WEMRSjOTWbZOj22cDJo6rfrXiN8H1wpuWPbfOhBD/RQs
 CBm/smglzjzQABuI0jA/NGDzzfsaOpq7sS4Tj2lLUl+VaGEteXsoTzK+V/xPyWBiIiKm
 kOTQ==
X-Gm-Message-State: AOAM530zH1N0JCE64VQyhpDIB896TGVkTgRnH2wlIL+1BLhembsPLvtN
 nXs4cDzVgJHwmL+veWTUEq+ZTZv1hJE=
X-Google-Smtp-Source: ABdhPJyPlHCdYj0da4wQnjjVwrRh7SZphOCQqhcv4T7q9eXhq7dQGTPTyBHSrrtLhKC7krSP8fyjFw==
X-Received: by 2002:a7b:ce06:: with SMTP id m6mr11298045wmc.38.1617351690075; 
 Fri, 02 Apr 2021 01:21:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id o2sm11330841wme.19.2021.04.02.01.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 01:21:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.0] x86: rename oem-id and oem-table-id properties
Date: Fri,  2 Apr 2021 10:21:28 +0200
Message-Id: <20210402082128.13854-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After introducing non-scalar machine properties, it would be preferrable
to have a single acpitable property which includes both generic
information (such as the OEM ids) and custom tables currently
passed via -acpitable.

Do not saddle ourselves with legacy oem-id and oem-table-id
properties, instead mark them as experimental.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/virt.c                  | 8 ++++----
 include/hw/i386/x86.h          | 4 ++--
 tests/qtest/bios-tables-test.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..bc5f948367 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2670,19 +2670,19 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable "
                                           "ITS instantiation");
 
-    object_class_property_add_str(oc, "oem-id",
+    object_class_property_add_str(oc, "x-oem-id",
                                   virt_get_oem_id,
                                   virt_set_oem_id);
-    object_class_property_set_description(oc, "oem-id",
+    object_class_property_set_description(oc, "x-oem-id",
                                           "Override the default value of field OEMID "
                                           "in ACPI table header."
                                           "The string may be up to 6 bytes in size");
 
 
-    object_class_property_add_str(oc, "oem-table-id",
+    object_class_property_add_str(oc, "x-oem-table-id",
                                   virt_get_oem_table_id,
                                   virt_set_oem_table_id);
-    object_class_property_set_description(oc, "oem-table-id",
+    object_class_property_set_description(oc, "x-oem-table-id",
                                           "Override the default value of field OEM Table ID "
                                           "in ACPI table header."
                                           "The string may be up to 8 bytes in size");
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 26c9cc45a4..c09b648dff 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -78,8 +78,8 @@ struct X86MachineState {
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
-#define X86_MACHINE_OEM_ID           "oem-id"
-#define X86_MACHINE_OEM_TABLE_ID     "oem-table-id"
+#define X86_MACHINE_OEM_ID           "x-oem-id"
+#define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e020c83d2a..156d4174aa 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -73,7 +73,7 @@
 
 #define OEM_ID             "TEST"
 #define OEM_TABLE_ID       "OEM"
-#define OEM_TEST_ARGS      "-machine oem-id="OEM_ID",oem-table-id="OEM_TABLE_ID
+#define OEM_TEST_ARGS      "-machine x-oem-id="OEM_ID",x-oem-table-id="OEM_TABLE_ID
 
 typedef struct {
     bool tcg_only;
-- 
2.30.1


