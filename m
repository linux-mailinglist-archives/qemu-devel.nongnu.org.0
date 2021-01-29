Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D83A308817
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:11:58 +0100 (CET)
Received: from localhost ([::1]:40094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Rgz-0003Bj-MR
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:11:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWC-0004jD-HP
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:48 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVx-00070E-Je
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:48 -0500
Received: by mail-wr1-x429.google.com with SMTP id 7so8418873wrz.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5j5YtwYEiYqHm2x1vtSGXh1Wa3+6ylbZXN+3XxjeIHQ=;
 b=wMbftcIMZfYx+MvX84r64dVIN0UIEpg1pDR9E1yjyLAXgc8RqofgfHU0yrcZWTOohr
 lHI4gDbSIf7QjseY0CYC6l8v5HBlocP+rURSwFTd9vmKuyEjoxpPqNrnuMSW64azaNdo
 0QxG3HC0CHpNXgGY957C/2pUGCtw86nokRqMAzkxqAv+jNVzRP3/PJWOMKgIKQTVF16C
 Rj9EIbcrXEWcPGfQa9ZgCOBhPrybMG0VES3Ghbp+5p//6/WoGucPid521lCgfKDRG8rT
 BxOiaqe6xe3kIv9gOO6bvN0iLKbJbfjZtCgqr9eEPRNBAa4t+8MzwOZGe9JnUCc/q+hH
 nIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5j5YtwYEiYqHm2x1vtSGXh1Wa3+6ylbZXN+3XxjeIHQ=;
 b=VTstXkSaCBp8jqe6CVTJ4kGF9HyOPSDQSR+9VtzA8gDaOgcWqi4Ugf0QTuxRh8FbUU
 +DfVFq2mUPHGUmkClQOlJLyX5MdcqSDjpw5ahG1mmyxmoc8HLVPTvYgJGC2rPeRZdl1Z
 wJpi/kwCouB7pHDDoxs/1ds6JFULD67wCibu1ZjJX9jebssjm3X1ps7DM8Q1oIxEXvMr
 VnsJAkiaPgj1EF6S9/GKcUxK+pk62YQzB0kXxmaLos+eXfgwgBRVkLglPi3G8qM9KAEp
 hjKzPvxfaI5nziECAfsaQ0DTRkOQqouDssUSkF4plZ8OxrIJZ5aPVkH9Y/GUz126HAXv
 P/Mg==
X-Gm-Message-State: AOAM533j059QWMXq7+DrO5ImMXLzA+hjsJ0muOVuBzKcm6hRjyJK9MTs
 e/vw/IpNfWibzeM6eUxu1aRVweCMPvcyZA==
X-Google-Smtp-Source: ABdhPJy9jk6dVYS+YYnGvvfE6nJrt0+D0QALBISyxYozeRpGx/o76NB1L1N/KUNuf29mWG5kH5QiuQ==
X-Received: by 2002:adf:f749:: with SMTP id z9mr3750893wrp.327.1611918030333; 
 Fri, 29 Jan 2021 03:00:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/46] hvf: Add hypervisor entitlement to output binaries
Date: Fri, 29 Jan 2021 10:59:43 +0000
Message-Id: <20210129110012.8660-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
respective entitlement. Add an entitlement template and automatically self
sign and apply the entitlement in the build.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 meson.build                  | 29 +++++++++++++++++++++++++----
 accel/hvf/entitlements.plist |  8 ++++++++
 scripts/entitlement.sh       | 13 +++++++++++++
 3 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 accel/hvf/entitlements.plist
 create mode 100755 scripts/entitlement.sh

diff --git a/meson.build b/meson.build
index 9ecb09dfe21..f00b7754fd4 100644
--- a/meson.build
+++ b/meson.build
@@ -2167,9 +2167,14 @@ foreach target : target_dirs
     }]
   endif
   foreach exe: execs
-    emulators += {exe['name']:
-         executable(exe['name'], exe['sources'],
-               install: true,
+    exe_name = exe['name']
+    exe_sign = 'CONFIG_HVF' in config_target
+    if exe_sign
+      exe_name += '-unsigned'
+    endif
+
+    emulator = executable(exe_name, exe['sources'],
+               install: not exe_sign,
                c_args: c_args,
                dependencies: arch_deps + deps + exe['dependencies'],
                objects: lib.extract_all_objects(recursive: true),
@@ -2177,7 +2182,23 @@ foreach target : target_dirs
                link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
                link_args: link_args,
                gui_app: exe['gui'])
-    }
+
+    if exe_sign
+      emulators += {exe['name'] : custom_target(exe['name'],
+                   install: true,
+                   install_dir: get_option('bindir'),
+                   depends: emulator,
+                   output: exe['name'],
+                   command: [
+                     meson.current_source_dir() / 'scripts/entitlement.sh',
+                     meson.current_build_dir() / exe_name,
+                     meson.current_build_dir() / exe['name'],
+                     meson.current_source_dir() / 'accel/hvf/entitlements.plist'
+                   ])
+      }
+    else
+      emulators += {exe['name']: emulator}
+    endif
 
     if 'CONFIG_TRACE_SYSTEMTAP' in config_host
       foreach stp: [
diff --git a/accel/hvf/entitlements.plist b/accel/hvf/entitlements.plist
new file mode 100644
index 00000000000..154f3308ef2
--- /dev/null
+++ b/accel/hvf/entitlements.plist
@@ -0,0 +1,8 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
+<plist version="1.0">
+<dict>
+    <key>com.apple.security.hypervisor</key>
+    <true/>
+</dict>
+</plist>
diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
new file mode 100755
index 00000000000..c540fa6435f
--- /dev/null
+++ b/scripts/entitlement.sh
@@ -0,0 +1,13 @@
+#!/bin/sh -e
+#
+# Helper script for the build process to apply entitlements
+
+SRC="$1"
+DST="$2"
+ENTITLEMENT="$3"
+
+trap 'rm "$DST.tmp"' exit
+cp -af "$SRC" "$DST.tmp"
+codesign --entitlements "$ENTITLEMENT" --force -s - "$DST.tmp"
+mv "$DST.tmp" "$DST"
+trap '' exit
-- 
2.20.1


