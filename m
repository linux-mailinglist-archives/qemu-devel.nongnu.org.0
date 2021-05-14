Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D0380DAF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:58:52 +0200 (CEST)
Received: from localhost ([::1]:48816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaDD-0003oX-Jg
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZ9-0003Uj-LK
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:27 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:41983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZ7-0000Dp-Lf
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:27 -0400
Received: by mail-qk1-x735.google.com with SMTP id l129so29012586qke.8
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E3IjHlVaIyEjDB61BTdAxiMByx7XKemKwC7VYhz1qZc=;
 b=NhfUmkFsKKmglpAo3/A9l2Mxwb2HEKEAJAPSYcuiLQz5t3qx9siNWWdst1CLtFStr3
 fba6qXq4NnLKs+qvo4VnVfKxK/Y/CxprOdUWZUL282lmpOBLyvY2Wp1kaWQ2/hJdoJs+
 iQ9pEIc6zwMKP7silXunxVDq/+jbj8wd8CqBSaiMuzsdU+kcnOPpzVxV6bzXszVaQUG6
 XcVQsDQAQB4fiOLl2YY0FkLgjIIr1RGeDNmc4hcDuNHJic+1lCBBqlQxdvnZmaPOARKL
 OjN8Vzf2GzXXShWag5Y5EbatPFAimP6yFvrgrsgI8SLav4c8UCtqeBJCg2BFTmzhcX2L
 Y1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E3IjHlVaIyEjDB61BTdAxiMByx7XKemKwC7VYhz1qZc=;
 b=JUH7ndTcGRYHQaiV91jm6U2kH0mGifnZo+yqIOk8QnsopDkmxqdCjl9jN/K/u4uI0r
 jvAAVVyeXpS2kPyEZH1YZN0Zgz9zKT7A1MPCSJhbC+i6USxpa77/ZcAa5frVtYVFSjDi
 m+q7pp0n7gWbEuLjMj2Qjv4Xuy+po/kaK4dsJjjQWcPNStw/Nlc8T6+H4CieAMQk79Tt
 CY4CF7CoMa2QDf6BhsRhN/3vCZeEC+E6/qei6jUYZmMAU220pUZm9vSAJA9+uIsSORrx
 SkIY1um0YL5+GVtf7FFdrJXKsE/6bsCB6LIV4u1l9y3lfhoJUuVfvZekLOBiJ56E4qUK
 wEcg==
X-Gm-Message-State: AOAM53123IWyvxa5LOlnG5kNz1gJnTv4qr9hWq9KRQDgz3D9gvxUyxxJ
 qV9Uo8NlOdQUIUVsZG3u0eBcGMzlTUxSJ0AV8LE=
X-Google-Smtp-Source: ABdhPJxnurLrd+xy7B8iMnXRbmHnCIuz8aLZV96LoeR6fcHfCu7EqdK8J4B9QjFATTCvKpCh/FQJxQ==
X-Received: by 2002:a37:a546:: with SMTP id o67mr44972789qke.160.1621005444735; 
 Fri, 14 May 2021 08:17:24 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm5181972qke.13.2021.05.14.08.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:17:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 43/50] target/i386: Inline user
 cpu_svm_check_intercept_param
Date: Fri, 14 May 2021 10:13:35 -0500
Message-Id: <20210514151342.384376-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The user-version is a no-op.  This lets us completely
remove tcg/user/svm_stubs.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.h                |  8 ++++++++
 target/i386/tcg/user/svm_stubs.c | 28 ----------------------------
 target/i386/tcg/user/meson.build |  1 -
 3 files changed, 8 insertions(+), 29 deletions(-)
 delete mode 100644 target/i386/tcg/user/svm_stubs.c

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 324ef92beb..e6836393f7 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2146,8 +2146,16 @@ static inline void cpu_set_fpuc(CPUX86State *env, uint16_t fpuc)
 void helper_lock_init(void);
 
 /* svm_helper.c */
+#ifdef CONFIG_USER_ONLY
+static inline void
+cpu_svm_check_intercept_param(CPUX86State *env1, uint32_t type,
+                              uint64_t param, uintptr_t retaddr)
+{ /* no-op */ }
+#else
 void cpu_svm_check_intercept_param(CPUX86State *env1, uint32_t type,
                                    uint64_t param, uintptr_t retaddr);
+#endif
+
 /* apic.c */
 void cpu_report_tpr_access(CPUX86State *env, TPRAccess access);
 void apic_handle_tpr_access_report(DeviceState *d, target_ulong ip,
diff --git a/target/i386/tcg/user/svm_stubs.c b/target/i386/tcg/user/svm_stubs.c
deleted file mode 100644
index db818f89a8..0000000000
--- a/target/i386/tcg/user/svm_stubs.c
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- *  x86 SVM helpers (user-mode)
- *
- *  Copyright (c) 2003 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/helper-proto.h"
-#include "tcg/helper-tcg.h"
-
-void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
-                                   uint64_t param, uintptr_t retaddr)
-{
-}
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index 9eac0e69ca..3555b15bdd 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -1,6 +1,5 @@
 i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'excp_helper.c',
   'misc_stubs.c',
-  'svm_stubs.c',
   'seg_helper.c',
 ))
-- 
2.25.1


