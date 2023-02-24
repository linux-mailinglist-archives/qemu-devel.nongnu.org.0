Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C726A176A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:40:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSfr-0006Wy-RC; Fri, 24 Feb 2023 02:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfj-0006Wl-FS
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:39:15 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfh-0006pH-SV
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:39:15 -0500
Received: by mail-wm1-x32b.google.com with SMTP id az36so1204252wmb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ZaRLGS+UsXq7QOBPAlysCOmaXDe7m6nmzn2gCUNK2s=;
 b=mDK+unA+UobpE/At4UULbnHHpurnAPbgvCEyDpO2RIEqeYhB0dXwabJBrirswzTFj1
 nqSVcVghFkAnhth+zuIRlpoUCJFjK2luK4ripGCKRvIToQlKIpldPFwnDzR3sDDTLVfH
 XqzyeICvgys6W8eM3jzjMr1uh4UwgpPbCsVid1aWzOurVMJM2qNemnzwxNjYigb96POp
 cGjEp/3KSPsGe6PIiW3zI8Ezf79+PJ1n4xmbyt5LffZXRz5cpMoHWp6mSdTyYIRcmwjZ
 blS7YgAt1TyBdAYdq8Fm5DJempbVd0H+VFqF1TihWKsFf7s9l3yk+XISjBzoBNi+21ON
 JmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ZaRLGS+UsXq7QOBPAlysCOmaXDe7m6nmzn2gCUNK2s=;
 b=jFQwEA+LEIs+9M4mc9GxbYFuRpuPpyunGOr4awmTHlFy02wU0PeilcKjzaAUzHMPvw
 2K6gsL2RgkTntccVYUp8HLn3lNGk20FHVb/LznrOm2sfP75Ymcj6kxAOCrm9Kp2ucB0H
 IhtKWUEMCc+pADwtDO/38knztJOxVjXxu1YEWhR1i1yLKjTEnlM/4WcQIf8c1hfIyOMk
 c+GiRXAbuiIvtROQ4/omBx4417ahUjmEzyVubHrvvUFfUtAR6QMSMFgI711CKHTEuBTr
 VSL0Cn59yQfSnbfbE5+jKeGBAC+iU1qKkkKmV0ylPM9tmJH9z0E8wVpCGQRwoJ78xWQX
 fxrw==
X-Gm-Message-State: AO0yUKUyZor9MKkhdsaL/cRq83UGa/agaJYyZCB32TZ+TIOiB9XiqMxU
 RQXJsj/8iISFhlSElEWZVV9raXOf2Ic9/Azf
X-Google-Smtp-Source: AK7set9SMatH50aihtv/Iob9HykCeKSEOY5FAPIByCODkBg/9LK0g3qzD2iSkVdsB4SFOxZOaJdw/A==
X-Received: by 2002:a05:600c:3b8b:b0:3ea:ea6b:f9ad with SMTP id
 n11-20020a05600c3b8b00b003eaea6bf9admr2162638wms.31.1677224352066; 
 Thu, 23 Feb 2023 23:39:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a1c7c0f000000b003e20a6fd604sm1854794wmc.4.2023.02.23.23.39.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 23:39:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 4/5] dump: Introduce win_dump_available()
Date: Fri, 24 Feb 2023 08:38:49 +0100
Message-Id: <20230224073850.84913-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224073850.84913-1-philmd@linaro.org>
References: <20230224073850.84913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Remove a pair of TARGET_X86_64 #ifdef'ry by introducing
the win_dump_available() method. Doing so we can build
win_dump.c on any target, and simplify the meson rule.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c      | 16 +++++-----------
 dump/meson.build |  2 +-
 dump/win_dump.c  | 18 ++++++++++++++++++
 dump/win_dump.h  |  3 +++
 4 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index a84f78738a..0c96c6e735 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -28,10 +28,7 @@
 #include "hw/misc/vmcoreinfo.h"
 #include "migration/blocker.h"
 #include "hw/core/cpu.h"
-
-#ifdef TARGET_X86_64
 #include "win_dump.h"
-#endif
 
 #include <zlib.h>
 #ifdef CONFIG_LZO
@@ -2128,12 +2125,10 @@ void qmp_dump_guest_memory(bool paging, const char *file,
     }
 #endif
 
-#ifndef TARGET_X86_64
-    if (has_format && format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
-        error_setg(errp, "Windows dump is only available for x86-64");
+    if (has_format && format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP
+        && !win_dump_available(errp)) {
         return;
     }
-#endif
 
 #if !defined(WIN32)
     if (strstart(file, "fd:", &p)) {
@@ -2215,10 +2210,9 @@ DumpGuestMemoryCapability *qmp_query_dump_guest_memory_capability(Error **errp)
     QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_KDUMP_SNAPPY);
 #endif
 
-    /* Windows dump is available only if target is x86_64 */
-#ifdef TARGET_X86_64
-    QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_WIN_DMP);
-#endif
+    if (win_dump_available(NULL)) {
+        QAPI_LIST_APPEND(tail, DUMP_GUEST_MEMORY_FORMAT_WIN_DMP);
+    }
 
     return cap;
 }
diff --git a/dump/meson.build b/dump/meson.build
index 2eff29c3ea..f13b29a849 100644
--- a/dump/meson.build
+++ b/dump/meson.build
@@ -1,4 +1,4 @@
 softmmu_ss.add(files('dump-hmp-cmds.c'))
 
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files('dump.c'), snappy, lzo])
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'TARGET_X86_64'], if_true: files('win_dump.c'))
+specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('win_dump.c'))
diff --git a/dump/win_dump.c b/dump/win_dump.c
index ba7fa404fe..ff9c5bd339 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -18,6 +18,13 @@
 #include "win_dump.h"
 #include "cpu.h"
 
+#if defined(TARGET_X86_64)
+
+bool win_dump_available(Error **errp)
+{
+    return true;
+}
+
 static size_t win_dump_ptr_size(bool x64)
 {
     return x64 ? sizeof(uint64_t) : sizeof(uint32_t);
@@ -470,3 +477,14 @@ out_cr3:
 
     return;
 }
+
+#else /* !TARGET_X86_64 */
+
+bool win_dump_available(Error **errp)
+{
+    error_setg(errp, "Windows dump is only available for x86-64");
+
+    return false;
+}
+
+#endif
diff --git a/dump/win_dump.h b/dump/win_dump.h
index 56f63683c3..c9b49f87dc 100644
--- a/dump/win_dump.h
+++ b/dump/win_dump.h
@@ -13,6 +13,9 @@
 
 #include "sysemu/dump.h"
 
+/* Check Windows dump availability for the current target */
+bool win_dump_available(Error **errp);
+
 void create_win_dump(DumpState *s, Error **errp);
 
 #endif /* WIN_DUMP_H */
-- 
2.38.1


