Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6A74ED5E1
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 10:38:45 +0200 (CEST)
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqKK-0005a4-Sr
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 04:38:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nZqI8-0003B4-OP
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nZqI7-00067r-7k
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648715786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGBotSzTitf7mNiiMR4fxuWNYFf65UbjechOAyNR/hM=;
 b=JZ1ZPD3Xj7Yh//D5aFOk8sQrzHS+0k7Tm9AoVcAYjJ/HdzH//EEmLs9p4nYwlVYv+OaKII
 ZYl1UPe25IN8tlAVsIsdVjqAbYUVOCQo3CfyXk2iFPuk9Am6ma1gI66dkZUMabtnWHaPZ0
 fA8pwyZ5TPOHz65BxObaZXt9oyE5alM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-O0MtPEI1Po-u8aCJ_qpaeA-1; Thu, 31 Mar 2022 04:36:25 -0400
X-MC-Unique: O0MtPEI1Po-u8aCJ_qpaeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FBC8299E776;
 Thu, 31 Mar 2022 08:36:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7BB112131E;
 Thu, 31 Mar 2022 08:35:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7FCBF18003AA; Thu, 31 Mar 2022 10:35:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] i386: factor out x86_firmware_configure()
Date: Thu, 31 Mar 2022 10:35:48 +0200
Message-Id: <20220331083549.749566-3-kraxel@redhat.com>
In-Reply-To: <20220331083549.749566-1-kraxel@redhat.com>
References: <20220331083549.749566-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

move sev firmware setup to separate function so it can be used from
other code paths.  No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 include/hw/i386/x86.h |  3 +++
 hw/i386/pc_sysfw.c    | 36 ++++++++++++++++++++++--------------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 916cc325eeb1..4841a49f86c0 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -140,4 +140,7 @@ void gsi_handler(void *opaque, int n, int level);
 void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name);
 DeviceState *ioapic_init_secondary(GSIState *gsi_state);
 
+/* pc_sysfw.c */
+void x86_firmware_configure(void *ptr, int size);
+
 #endif
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index c8b17af95353..36b6121b77b9 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -148,7 +148,6 @@ static void pc_system_flash_map(PCMachineState *pcms,
     MemoryRegion *flash_mem;
     void *flash_ptr;
     int flash_size;
-    int ret;
 
     assert(PC_MACHINE_GET_CLASS(pcms)->pci_enabled);
 
@@ -196,19 +195,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
             if (sev_enabled()) {
                 flash_ptr = memory_region_get_ram_ptr(flash_mem);
                 flash_size = memory_region_size(flash_mem);
-                /*
-                 * OVMF places a GUIDed structures in the flash, so
-                 * search for them
-                 */
-                pc_system_parse_ovmf_flash(flash_ptr, flash_size);
-
-                ret = sev_es_save_reset_vector(flash_ptr, flash_size);
-                if (ret) {
-                    error_report("failed to locate and/or save reset vector");
-                    exit(1);
-                }
-
-                sev_encrypt_flash(flash_ptr, flash_size, &error_fatal);
+                x86_firmware_configure(flash_ptr, flash_size);
             }
         }
     }
@@ -260,3 +247,24 @@ void pc_system_firmware_init(PCMachineState *pcms,
 
     pc_system_flash_cleanup_unused(pcms);
 }
+
+void x86_firmware_configure(void *ptr, int size)
+{
+    int ret;
+
+    /*
+     * OVMF places a GUIDed structures in the flash, so
+     * search for them
+     */
+    pc_system_parse_ovmf_flash(ptr, size);
+
+    if (sev_enabled()) {
+        ret = sev_es_save_reset_vector(ptr, size);
+        if (ret) {
+            error_report("failed to locate and/or save reset vector");
+            exit(1);
+        }
+
+        sev_encrypt_flash(ptr, size, &error_fatal);
+    }
+}
-- 
2.35.1


