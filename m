Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325BB4E8154
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:07:19 +0100 (CET)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY74Y-0005rt-8C
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:07:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R7-0007cK-2x
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:34 -0400
Received: from [2001:4860:4864:20::2d] (port=40501
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R5-0005Xk-Lk
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:32 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so10739419fac.7
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jIFec7vua8qaqcC2DD7t6o1d/RYkHEXO2+luYM5xdxE=;
 b=LJH1D9DbfWNaHSJUKadfyGXds7LKEXGGGNMLTunGmKjnEJvEuQo6OIU5QKOgyVxMEg
 95JWlPr2ItggpBb47HcR/A3PwDLfw1hpNlT5dHFAVHkI/mkeWf0CHMG3tgZ87u98/Lhh
 lo4c2afi1FoWpBMsR2md3duNM5YdiI6QX1k9oaZVqPLl5oeSHmGPLJ+fkYF8W0/M8jxp
 9zQ30u00cof6XWbAQcnKdFquoYlZvbwg/vnR4K3CxXIrDUpD7juWB6kCozyhgCOzSI+2
 jMkWBkL93zAIQwhZtKxKDm9l6gTBdmn158tSPSrrMRQVlY7LqzdSM5HCu3wH87w92Bd0
 rISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jIFec7vua8qaqcC2DD7t6o1d/RYkHEXO2+luYM5xdxE=;
 b=OBBRxXA0WRe+ZpSjKeasREsTuNOUv1mvyYGtWTqM/V5UTB/fNp92uqOnOljWbzs60X
 n14B7/z8le9Xqz2l6VDQg9MmU/heA/+L9PDtKVkq09O8h+hDwwmVfZ3kcmZYPdH/PFxs
 dWWaoVG4A1lmf3vu3bkcHFYROhMdk00TMwmPKuFzKVroogStWnZ0jhOdfAJU9gyX0nt+
 ScfaWb0rhnP3S/DGyu2qApB4wFbpXkzDVEskW7FPPwjxMfyXxAV46tJCWczvzG+lV1LS
 VkV+39KrK2u3663NjCsNRQY7HWDX8MH6Ujk9NWpcCoea9stvD0WCt3xQEJfrrdLiHYBS
 qCiQ==
X-Gm-Message-State: AOAM533RTX7NheJuqKzeaG/2FRVPy2EMJlJkqKNpmev//0PHJ2oqMXiz
 0MqLxuNGOgGEXVKP/oUJ0H8AqR6rXVDACqFA
X-Google-Smtp-Source: ABdhPJxX+b4BeftR71qN7ct+jU+IOHV71V19x6A874HUgMXtC7YNFinvqpBMCOAIYKIZisPgYdU6tA==
X-Received: by 2002:a05:6870:b623:b0:de:899:774 with SMTP id
 cm35-20020a056870b62300b000de08990774mr11583049oab.219.1648301190284; 
 Sat, 26 Mar 2022 06:26:30 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/39] sysemu/os-win32: Test for and use
 _lock_file/_unlock_file
Date: Sat, 26 Mar 2022 07:25:21 -0600
Message-Id: <20220326132534.543738-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index aef724ad3c..93a05b8e92 100644
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


