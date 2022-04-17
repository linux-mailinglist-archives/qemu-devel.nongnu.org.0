Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F847504934
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:12:02 +0200 (CEST)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAJU-00082a-A1
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fb-0000UG-6q
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:52 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fY-0001pU-JT
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:46 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso15555409pjb.5
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Sm3bJ8lkkLDndaTXu2LI7WsKQhrLWIrMlSZhSEKk0s=;
 b=eRHWF7Wh8H7SW5zhV2PWB+0Tcv/jH8IDVbSOvtLvZFcowUiJblDlc6mdhLLHGX1IkU
 Cxt29do+9KGTVxgeb1swWxD6hHnjglmEjYOxj1vFV7v2XtLha8RCLXJGIxZdPTOTQqYc
 F7sF+Zx5TWr8/pwFz75yP5QbXtOcmg6RR/a/rldtWVDenRamkSYHMcPLPiE16Yaovg0s
 O/duVtAsOULBXxUWdOFkECUY38aIMF4cBsDUZxFNQ4nA97TK1hzdVyxBwfaAicL7nXh4
 b4nGs/bCTJyXU6SQ3RqeYq+T+Mc4XkhrLH6Ll/EAQn5Q7ACgBDTC2ijEBI+Cn+vUu5HX
 0ebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Sm3bJ8lkkLDndaTXu2LI7WsKQhrLWIrMlSZhSEKk0s=;
 b=BJ5u36gJkjFyGZw0/eQNj0jslBE5KgaDKv+Qu+E6PKiTu8cDN0CpKV/16wEJrHcoiU
 f49a0DdyWOite1sHTPAmlcbB46xgWgO6cnSn0ItSTV9sC5udznI96it7tuDA9CD7+DY8
 azlT9VbUcbdyNLevGFTlpMCz27bQHdHxxPABvXOpAKknTILyyeKliDEtJKJLTE4hzuKb
 GZf0vH2EUts/Spk6C78CuRKouV16jUUuzOjDLfkg0hY4kvUO4fjEPPRw+u+WJZy2YV7p
 nlwB/EOgqFWjkEeSsSUqkVVg1pLb2oHZN09wFamfoi+5skucyM6ZFfIxcN2Rw7dKwLOz
 Rs/A==
X-Gm-Message-State: AOAM5336YTVEvuY9uq8ZntWNWrDyi4YnNlebjY8AZx5dK297hgPc/B42
 W8OCzk7jw3KGtZmVlSNhhtrExj4hov7rQw==
X-Google-Smtp-Source: ABdhPJw7YoeLp0uPIlNqbAbwf41SNIhhG0ftPtRqNx5yyvQZxmKnEQ/vihqQ5KgJuz6i3QLd+bd3SQ==
X-Received: by 2002:a17:903:1212:b0:156:3ddc:84bd with SMTP id
 l18-20020a170903121200b001563ddc84bdmr7716980plh.70.1650220242830; 
 Sun, 17 Apr 2022 11:30:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/39] sysemu/os-win32: Test for and use
 _lock_file/_unlock_file
Date: Sun, 17 Apr 2022 11:30:06 -0700
Message-Id: <20220417183019.755276-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bug referenced in os-win32.h was fixed in mingw-w64 v6.

According to repology, version 5 used by ubuntu 18, which is
not yet out of support, so provide a meson link test for it.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build               | 12 ++++++++++++
 include/sysemu/os-win32.h | 16 +++++++++-------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 861de93c4f..1b8b65f171 100644
--- a/meson.build
+++ b/meson.build
@@ -2054,6 +2054,18 @@ foreach k, v: config_host
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
index 770752222a..649f417d39 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -113,20 +113,22 @@ static inline char *realpath(const char *path, char *resolved_path)
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
2.25.1


