Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864D4D1B49
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:02:45 +0100 (CET)
Received: from localhost ([::1]:55496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbMK-0004oT-CY
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:02:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRbGH-0005Di-4x
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:56:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRbGD-0000K4-Ro
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646751383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yFXvrr/idn5aHoQdUsJJiTWj0pGkCH5gHd7woMQCvcE=;
 b=YuaQYktMYBqmyDOy9PoRsy9ttPuNljFmebm9m7z92OIohbXoRd3jvaf3QiIXx0wJrBV5+A
 U4tPpC6+jBTaYScMqglHs5A2YIHhCRNeY6IurLd+7alLbhqAW0DlP+lgWQugclU404yoIE
 6bM5jFep1ZciMtvkENPYyyYEeQoDHY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-Aqkj0F--P1eYT06pWjXb3Q-1; Tue, 08 Mar 2022 09:56:21 -0500
X-MC-Unique: Aqkj0F--P1eYT06pWjXb3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9BD8801DDC;
 Tue,  8 Mar 2022 14:56:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F9FB1064150;
 Tue,  8 Mar 2022 14:56:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1073A1800999; Tue,  8 Mar 2022 15:55:22 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] edk2: switch to release builds
Date: Tue,  8 Mar 2022 15:55:13 +0100
Message-Id: <20220308145521.3106395-4-kraxel@redhat.com>
In-Reply-To: <20220308145521.3106395-1-kraxel@redhat.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/Makefile.edk2 | 17 +++++++++--------
 roms/edk2-build.sh |  2 +-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
index fdae0b511f59..3d75a842a4df 100644
--- a/roms/Makefile.edk2
+++ b/roms/Makefile.edk2
@@ -13,6 +13,7 @@
 
 SHELL = /bin/bash
 
+target = RELEASE
 toolchain = $(shell source ./edk2-funcs.sh && qemu_edk2_get_toolchain $(1))
 
 licenses := \
@@ -73,7 +74,7 @@ submodules:
 		-D NETWORK_TLS_ENABLE \
 		-D TPM2_ENABLE \
 		-D TPM2_CONFIG_ENABLE
-	cp edk2/Build/ArmVirtQemu-AARCH64/DEBUG_$(call toolchain,aarch64)/FV/QEMU_EFI.fd \
+	cp edk2/Build/ArmVirtQemu-AARCH64/$(target)_$(call toolchain,aarch64)/FV/QEMU_EFI.fd \
 		$@
 	truncate --size=64M $@
 
@@ -87,7 +88,7 @@ submodules:
 		-D NETWORK_TLS_ENABLE \
 		-D TPM2_ENABLE \
 		-D TPM2_CONFIG_ENABLE
-	cp edk2/Build/ArmVirtQemu-ARM/DEBUG_$(call toolchain,arm)/FV/QEMU_EFI.fd \
+	cp edk2/Build/ArmVirtQemu-ARM/$(target)_$(call toolchain,arm)/FV/QEMU_EFI.fd \
 		$@
 	truncate --size=64M $@
 
@@ -101,7 +102,7 @@ submodules:
 		-D NETWORK_TLS_ENABLE \
 		-D TPM_ENABLE \
 		-D TPM_CONFIG_ENABLE
-	cp edk2/Build/OvmfIa32/DEBUG_$(call toolchain,i386)/FV/OVMF_CODE.fd $@
+	cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_CODE.fd $@
 
 ../pc-bios/edk2-i386-secure-code.fd: submodules
 	+./edk2-build.sh \
@@ -115,7 +116,7 @@ submodules:
 		-D TPM_CONFIG_ENABLE \
 		-D SECURE_BOOT_ENABLE \
 		-D SMM_REQUIRE
-	cp edk2/Build/OvmfIa32/DEBUG_$(call toolchain,i386)/FV/OVMF_CODE.fd $@
+	cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_CODE.fd $@
 
 ../pc-bios/edk2-x86_64-code.fd: submodules
 	+./edk2-build.sh \
@@ -127,7 +128,7 @@ submodules:
 		-D NETWORK_TLS_ENABLE \
 		-D TPM_ENABLE \
 		-D TPM_CONFIG_ENABLE
-	cp edk2/Build/OvmfX64/DEBUG_$(call toolchain,x86_64)/FV/OVMF_CODE.fd $@
+	cp edk2/Build/OvmfX64/$(target)_$(call toolchain,x86_64)/FV/OVMF_CODE.fd $@
 
 ../pc-bios/edk2-x86_64-secure-code.fd: submodules
 	+./edk2-build.sh \
@@ -142,15 +143,15 @@ submodules:
 		-D TPM_CONFIG_ENABLE \
 		-D SECURE_BOOT_ENABLE \
 		-D SMM_REQUIRE
-	cp edk2/Build/Ovmf3264/DEBUG_$(call toolchain,x86_64)/FV/OVMF_CODE.fd $@
+	cp edk2/Build/Ovmf3264/$(target)_$(call toolchain,x86_64)/FV/OVMF_CODE.fd $@
 
 ../pc-bios/edk2-arm-vars.fd: ../pc-bios/edk2-arm-code.fd
-	cp edk2/Build/ArmVirtQemu-ARM/DEBUG_$(call toolchain,arm)/FV/QEMU_VARS.fd \
+	cp edk2/Build/ArmVirtQemu-ARM/$(target)_$(call toolchain,arm)/FV/QEMU_VARS.fd \
 		$@
 	truncate --size=64M $@
 
 ../pc-bios/edk2-i386-vars.fd: ../pc-bios/edk2-i386-code.fd
-	cp edk2/Build/OvmfIa32/DEBUG_$(call toolchain,i386)/FV/OVMF_VARS.fd $@
+	cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_VARS.fd $@
 
 # The license file accumulates several individual licenses from under edk2,
 # prefixing each individual license with a header (generated by "tail") that
diff --git a/roms/edk2-build.sh b/roms/edk2-build.sh
index d5391c763728..ea79dc27a269 100755
--- a/roms/edk2-build.sh
+++ b/roms/edk2-build.sh
@@ -50,6 +50,6 @@ qemu_edk2_set_cross_env "$emulation_target"
 build \
   --cmd-len=65536 \
   -n "$edk2_thread_count" \
-  --buildtarget=DEBUG \
+  --buildtarget=RELEASE \
   --tagname="$edk2_toolchain" \
   "${args[@]}"
-- 
2.35.1


