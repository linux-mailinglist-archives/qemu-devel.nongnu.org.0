Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E1F50E274
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:55:28 +0200 (CEST)
Received: from localhost ([::1]:58858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizBY-0004bu-48
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1niz7s-0008MJ-7n
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1niz7q-0007wd-MR
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650894698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/js2hftkW0mBPeilZgfgdW7zMW7qg97j1C/Jrk74TY=;
 b=VqjL2H58/SNIigBMdR6GmvJIYF559RY4wFWpOUNQKqaMM4ERRFTTt2HWwWGkWBt6lvW3CT
 Ms9rkIYMx5k6tklD7gk0q0Ho34mROFH5D2qpB6lTbbUeVhk6FTq1O5YsB/9+tkF06rR0uC
 sB6oZp9H9HAeIpx4F4aFe6vg7ydVHRg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-tvCHwimXPimJp8Xm5j66Lg-1; Mon, 25 Apr 2022 09:51:33 -0400
X-MC-Unique: tvCHwimXPimJp8Xm5j66Lg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F09429AA3B7;
 Mon, 25 Apr 2022 13:51:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20A14111E411;
 Mon, 25 Apr 2022 13:51:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4D1F41800624; Mon, 25 Apr 2022 15:50:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] i386: firmware parsing and sev setup for -bios loaded
 firmware
Date: Mon, 25 Apr 2022 15:50:51 +0200
Message-Id: <20220425135051.551037-4-kraxel@redhat.com>
In-Reply-To: <20220425135051.551037-1-kraxel@redhat.com>
References: <20220425135051.551037-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
 "Michael S. Tsirkin" <mst@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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


