Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF8850FBC8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:14:50 +0200 (CEST)
Received: from localhost ([::1]:33464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njJ9d-0001FS-7h
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njIzW-0004gJ-Hj
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njIzU-0004YE-Ua
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650971060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8AIRST/QZMvSd7Xmn5iUy05ODB++l+Z4/5lqqOMYms=;
 b=YKDplpzRCaic4VOOH+rYD1gdRS8mj1S8+4e86kv80STKl0aZJ0o7Om0HGaj4EJwSzsBXqt
 C5eDtXwNSpLiCefZmdvVNRvshNI1nf1tXjmj2bKkQNFbOc3DPI1nrXcP9qAVi7z30q3iA2
 vnT/taplU8KVv2ZxPK974gu2kkO2lV0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-Ke88ILt3NXadEAOayroF2A-1; Tue, 26 Apr 2022 07:04:17 -0400
X-MC-Unique: Ke88ILt3NXadEAOayroF2A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C027729ABA13;
 Tue, 26 Apr 2022 11:04:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89203463ECD;
 Tue, 26 Apr 2022 11:04:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A8AAE1800920; Tue, 26 Apr 2022 13:03:59 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] i386: firmware parsing and sev setup for -bios loaded
 firmware
Date: Tue, 26 Apr 2022 13:03:57 +0200
Message-Id: <20220426110358.1570723-10-kraxel@redhat.com>
In-Reply-To: <20220426110358.1570723-1-kraxel@redhat.com>
References: <20220426110358.1570723-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't register firmware as rom, not needed (see comment).
Add x86_firmware_configure() call for proper sev initialization.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220425135051.551037-4-kraxel@redhat.com>
---
 hw/i386/x86.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ced31f67b9a8..79ebdface6e2 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1115,12 +1115,25 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
     }
     bios = g_malloc(sizeof(*bios));
     memory_region_init_ram(bios, NULL, "pc.bios", bios_size, &error_fatal);
-    if (!isapc_ram_fw) {
-        memory_region_set_readonly(bios, true);
-    }
-    ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
-    if (ret != 0) {
-        goto bios_error;
+    if (sev_enabled()) {
+        /*
+         * The concept of a "reset" simply doesn't exist for
+         * confidential computing guests, we have to destroy and
+         * re-launch them instead.  So there is no need to register
+         * the firmware as rom to properly re-initialize on reset.
+         * Just go for a straight file load instead.
+         */
+        void *ptr = memory_region_get_ram_ptr(bios);
+        load_image_size(filename, ptr, bios_size);
+        x86_firmware_configure(ptr, bios_size);
+    } else {
+        if (!isapc_ram_fw) {
+            memory_region_set_readonly(bios, true);
+        }
+        ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
+        if (ret != 0) {
+            goto bios_error;
+        }
     }
     g_free(filename);
 
-- 
2.35.1


