Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE71C4E1D29
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:33:39 +0100 (CET)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzQw-00067K-Oh
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:33:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz61-00005p-5U
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:01 -0400
Received: from [2607:f8b0:4864:20::629] (port=38687
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5y-0003UG-VD
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:00 -0400
Received: by mail-pl1-x629.google.com with SMTP id n18so10885446plg.5
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hu9aRYzYIgbIdzSTEVhW4soYbAG6jLfuaaPgAkD8sGQ=;
 b=Qh8huIxAEYt/Z5x1IVM0vM3opFwm3z+Tgu5TIUEWkya8omECsefqapLtx7I/4ytWK7
 YOJnoofFhl9GTJqGxChRneDsU/CzxiBWaYYikeeurItuT8UVJHh8Yo33Jl/6yaJGYykC
 cRwxxOsOYfc/Rji252uBe6/LlTUli+HPrPSMlqqMnLrTPS7mSlBwsfyhvglNNCpLHpMl
 WsPGiKysbeKAjL2InlufLz25KM++AUG1r5D5akLelTIisvVJvE5JwGPNhQPUneOnCgYy
 i1ZKgkSuBdC9xZawhzNm1U4lX1ddclFvm0vg2nBQXzmRlsxY/5r+bmt6l4+H/f4A1CJf
 UEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hu9aRYzYIgbIdzSTEVhW4soYbAG6jLfuaaPgAkD8sGQ=;
 b=Qm+Rof4+u7rBTwCAi6n6CumiLEA/6eYHXP2vEwzasNoKoOSUbg5HwXW6K/QPNywCxB
 e2AMleDLRKYFT3rSv01AgGsm4H1MZsFQypWEaecUuRH/GwmRpxI/H+D6AXnpu8oxYSVU
 kaoAl3/cpB85ZNnOtME/IqIEpXwJk6exBzcFRFras7B7pI7V0symMlVWPv67SSTmAPsl
 WhEOdjAHUMoQU+4EZ4HXVJN6+lN0NT9RrCdcmRu/QIOhs8tPJxjsn/V9riWbHIBbw8LM
 JrXa5AZAnWCoKwbtY8651b/Gqd23H5UOvnAx7zQHDQXMedY10ouKxVcV00a9A1FTIzSW
 I5MA==
X-Gm-Message-State: AOAM530idZg8+4cYROCrAm4zalQk++pE5/XaRh9iG/6GGEKcS/bzO6Ar
 nBvhVvqnOFWls8kT/rgaCrkfyojHwVTOUw==
X-Google-Smtp-Source: ABdhPJwuxFEZCZ2KKqKC8ioQu0Jd31O/WOGGp05Yj7AyiK6SUD5fYF6yt+8UoUyeyF0Xwv/4Y5waIQ==
X-Received: by 2002:a17:90b:4b83:b0:1c7:2497:3800 with SMTP id
 lr3-20020a17090b4b8300b001c724973800mr31537pjb.225.1647796317666; 
 Sun, 20 Mar 2022 10:11:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 23/36] sysemu/os-win32: Test for and use
 _lock_file/_unlock_file
Date: Sun, 20 Mar 2022 10:11:22 -0700
Message-Id: <20220320171135.2704502-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build               | 12 ++++++++++++
 include/sysemu/os-win32.h | 16 +++++++++-------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/meson.build b/meson.build
index 282e7c4650..f22a09dac5 100644
--- a/meson.build
+++ b/meson.build
@@ -2018,6 +2018,18 @@ foreach k, v: config_host
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


