Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FE7508F50
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:23:09 +0200 (CEST)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEyq-000851-D5
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj4-000675-7O
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:50 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj2-0001Li-JY
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:49 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h1so2659593pfv.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U9WvSSPQfsR19RuOaY3NyKfhfBva7JRzInAY9nQW5DY=;
 b=hAFXpV1t8Uno/zs89Clh7l9W6Ia24SYh7+sjTyrIXlA1IrCok6ZXF7QzD9OMMgwLSs
 xADe0miOaI7Y/FaOoDnHx/3e0k4n9nBlXj7pkyDKB3GD71elasMHwjVQhaqF7x3XtHYm
 Y7oRI+7C55n28Muc/A4cSwS1XVRHF4Vr/jtr13tHypZEk2c/y8CkB6Tvm4xlzRti5VnS
 XKRoAYllehsorSqwYWTPva1eu4+M4HMmonIW9js7H4Zvx+KPV4HxxFvyKFurYluN+ITc
 e+mUyB8xgnbBku4ZneUh26XPScwN0L0KnLWxroT/lueOiMeuoipS+hDxolM5h+XY8Hk+
 X6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U9WvSSPQfsR19RuOaY3NyKfhfBva7JRzInAY9nQW5DY=;
 b=ycNYXesIkamYJ6qQhUBbC4pdjdWAvNC/+F1w3rlMfb6sna3sT31j6HVMEYfDcE/ieK
 0dW1wxCk07ptD6g5UOL5TwUMftCWDtBudmAptn6yD0/DajWKoetB5+kCjzifyJ4AZvxG
 5o9PBVvVu2EXNugCGMgf7hOV7YR03yVa6jU0wqKooI7cCS+CpncfYs+/nUPmwJNN5x8S
 23jNFnaSJLtEg5hO5j7BGNC7C4BQuxq8c0RnD/Hhopy2r54lYyJbEykPyAiygl7SKEc5
 okrnqKZj+L4fkTPU1YmgkbX9FKsgneb4YWt40ZNWzKQwQhgfLBhjJIvFxzSAVgRakpYT
 sCdA==
X-Gm-Message-State: AOAM532dF71XDyyRKN6wdEftoZw/AOdCrDrXpqeLgBIvJ44NZeMl+58X
 JTbliuzK/WOQJRsVCrmhkQ4pVKzK/nM4Ng==
X-Google-Smtp-Source: ABdhPJzhqXvj0Ltne6fPUT4cLy1O6uThTEYN89LB2rtbqeL5AolUBrVaacbBpd3FOTSDcIEs3oIN7A==
X-Received: by 2002:a63:5917:0:b0:39c:c450:3143 with SMTP id
 n23-20020a635917000000b0039cc4503143mr20409939pgb.531.1650478007104; 
 Wed, 20 Apr 2022 11:06:47 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/39] sysemu/os-win32: Test for and use _lock_file/_unlock_file
Date: Wed, 20 Apr 2022 11:06:05 -0700
Message-Id: <20220420180618.1183855-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bug referenced in os-win32.h was fixed in mingw-w64 v6.

According to repology, version 5 used by ubuntu 18, which is
not yet out of support, so provide a meson link test for it.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-27-richard.henderson@linaro.org>
---
 meson.build               | 12 ++++++++++++
 include/sysemu/os-win32.h | 16 +++++++++-------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 6ba60950c8..d083c6b7bf 100644
--- a/meson.build
+++ b/meson.build
@@ -2030,6 +2030,18 @@ foreach k, v: config_host
   endif
 endforeach
 
+# Older versions of MinGW do not import _lock_file and _unlock_file properly.
+# This was fixed for v6.0.0 with commit b48e3ac8969d.
+if targetos == 'windows'
+  config_host_data.set('HAVE__LOCK_FILE', cc.links('''
+    #include <stdio.h>
+    int main(void) {
+      _lock_file(NULL);
+      _unlock_file(NULL);
+      return 0;
+    }''', name: '_lock_file and _unlock_file'))
+endif
+
 ########################
 # Target configuration #
 ########################
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 3c74a78e33..edc3b38a57 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -109,20 +109,22 @@ static inline char *realpath(const char *path, char *resolved_path)
     return resolved_path;
 }
 
-/* ??? Mingw appears to export _lock_file and _unlock_file as the functions
- * with which to lock a stdio handle.  But something is wrong in the markup,
- * either in the header or the library, such that we get undefined references
- * to "_imp___lock_file" etc when linking.  Since we seem to have no other
- * alternative, and the usage within the logging functions isn't critical,
- * ignore FILE locking.
+/*
+ * Older versions of MinGW do not import _lock_file and _unlock_file properly.
+ * This was fixed for v6.0.0 with commit b48e3ac8969d.
  */
-
 static inline void qemu_flockfile(FILE *f)
 {
+#ifdef HAVE__LOCK_FILE
+    _lock_file(f);
+#endif
 }
 
 static inline void qemu_funlockfile(FILE *f)
 {
+#ifdef HAVE__LOCK_FILE
+    _unlock_file(f);
+#endif
 }
 
 /* We wrap all the sockets functions so that we can
-- 
2.34.1


