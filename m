Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E252852F6E2
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:39:04 +0200 (CEST)
Received: from localhost ([::1]:44330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsD96-0001du-23
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCes-0002tM-DY
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:50 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCeq-0004Yj-Hu
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:07:50 -0400
Received: by mail-pj1-x1032.google.com with SMTP id ev18so9300459pjb.4
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+fPmq/gIqgkSE063dcs/6u6fyml6PThxo/MDWH5lGI=;
 b=hOEPrGxtacFaN+AzjEVQCzXCZELJdHG6ZFr+u3ARnbTTyiVYjSoRZfJe8PouDs7m0F
 MkEBr1dpfwmjRBx5CbrQx5Ut+Ngl2U6jh3pqGviEkwue3UDeuBs7nT3sh/tf3bhi0+yz
 L6etia1cE6UAFXWxtTiDOmapqXbURMygpOcyICnatpbWK0at8dEk0IKxfKlbVPk6pvcS
 sspw/mDUwQKA3B5/PgTIVrHIkcFdVqFCLdrMYNfAQ9U9CHFKgF0a74zIRNp+1L6PUfIV
 Nblve+86ceYd2qFE3++Wy31e+92BdYIf5xr40QvTHW89FXvj7u4iD0XC81ZjzdGHn2H5
 cbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+fPmq/gIqgkSE063dcs/6u6fyml6PThxo/MDWH5lGI=;
 b=rxUrRuI2ESj49lzVnbJXYjiON5X/DRBBOUNy/VgUFdIWrOAd5sNRyQt4+To8ZEsHgO
 8vh6vTCL9x379MQwdXeXKp5DpKORUPy04sUfcRyrRpzkZnYUszrEztRJ/NMvoC7/10fe
 13YHBXti/5lZAQpYCyCZWK2SRmxIFWmd9sZWUNIiUI/nJyQ5h3p8cisYXoUtXVdryjtz
 Ahr7bWsXn4itV2bWNvoUEL+ArcI5qrUm6Epxr2cdgBtNCrilEINKJATf2Dai2lxADo8C
 hvlmSaEpC4zIHOcgzpY+3U11SoDvO5hnKKqEFaMmf3B60fSb6EfzDOCO2MzI/k3DlSc8
 UMAw==
X-Gm-Message-State: AOAM533zLWmmqz25YHlDugomrdQPnZMvdzS1j2jTa5q73ZWRzoSTbHq8
 irUI14dcc1yYPb4y71QZ9Z6ZgdsW4sOBIw==
X-Google-Smtp-Source: ABdhPJzLqwM6MmgxWtYXwEF6xzIwdER6dZ7oOBuwY3Fyn96tFx503x4RSZyTS6dvzxpnxCRgrmsYfw==
X-Received: by 2002:a17:902:6bc1:b0:15d:1e15:1a75 with SMTP id
 m1-20020a1709026bc100b0015d1e151a75mr12477013plt.114.1653091667016; 
 Fri, 20 May 2022 17:07:47 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0cc100b001d2bff34228sm2517703pjt.9.2022.05.20.17.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:07:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 40/49] semihosting: Cleanup chardev init
Date: Fri, 20 May 2022 17:03:51 -0700
Message-Id: <20220521000400.454525-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename qemu_semihosting_connect_chardevs to
qemu_semihosting_chardev_init; pass the result
directly to qemu_semihosting_console_init.

Store the chardev in SemihostingConsole instead
of SemihostingConfig, which lets us drop
semihosting_get_chardev.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/semihost.h | 13 ++-----------
 semihosting/config.c           | 17 +++++++----------
 semihosting/console.c          | 31 +++++++++++++++----------------
 softmmu/vl.c                   |  3 +--
 stubs/semihost.c               |  6 +-----
 5 files changed, 26 insertions(+), 44 deletions(-)

diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
index 0c55ade3ac..5b36a76f08 100644
--- a/include/semihosting/semihost.h
+++ b/include/semihosting/semihost.h
@@ -51,14 +51,6 @@ static inline const char *semihosting_get_cmdline(void)
 {
     return NULL;
 }
-
-static inline Chardev *semihosting_get_chardev(void)
-{
-    return NULL;
-}
-static inline void qemu_semihosting_console_init(void)
-{
-}
 #else /* !CONFIG_USER_ONLY */
 bool semihosting_enabled(void);
 SemihostingTarget semihosting_get_target(void);
@@ -66,12 +58,11 @@ const char *semihosting_get_arg(int i);
 int semihosting_get_argc(void);
 const char *semihosting_get_cmdline(void);
 void semihosting_arg_fallback(const char *file, const char *cmd);
-Chardev *semihosting_get_chardev(void);
 /* for vl.c hooks */
 void qemu_semihosting_enable(void);
 int qemu_semihosting_config_options(const char *opt);
-void qemu_semihosting_connect_chardevs(void);
-void qemu_semihosting_console_init(void);
+void qemu_semihosting_chardev_init(void);
+void qemu_semihosting_console_init(Chardev *);
 #endif /* CONFIG_USER_ONLY */
 
 #endif /* SEMIHOST_H */
diff --git a/semihosting/config.c b/semihosting/config.c
index 50d82108e6..4bca769fad 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -50,7 +50,6 @@ QemuOptsList qemu_semihosting_config_opts = {
 typedef struct SemihostingConfig {
     bool enabled;
     SemihostingTarget target;
-    Chardev *chardev;
     char **argv;
     int argc;
     const char *cmdline; /* concatenated argv */
@@ -121,11 +120,6 @@ void semihosting_arg_fallback(const char *file, const char *cmd)
     }
 }
 
-Chardev *semihosting_get_chardev(void)
-{
-    return semihosting.chardev;
-}
-
 void qemu_semihosting_enable(void)
 {
     semihosting.enabled = true;
@@ -171,16 +165,19 @@ int qemu_semihosting_config_options(const char *optarg)
     return 0;
 }
 
-void qemu_semihosting_connect_chardevs(void)
+/* We had to defer this until chardevs were created */
+void qemu_semihosting_chardev_init(void)
 {
-    /* We had to defer this until chardevs were created */
+    Chardev *chr = NULL;
+
     if (semihost_chardev) {
-        Chardev *chr = qemu_chr_find(semihost_chardev);
+        chr = qemu_chr_find(semihost_chardev);
         if (chr == NULL) {
             error_report("semihosting chardev '%s' not found",
                          semihost_chardev);
             exit(1);
         }
-        semihosting.chardev = chr;
     }
+
+    qemu_semihosting_console_init(chr);
 }
diff --git a/semihosting/console.c b/semihosting/console.c
index df618a28a4..4088192842 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -27,11 +27,21 @@
 #include "qapi/error.h"
 #include "qemu/fifo8.h"
 
+/* Access to this structure is protected by the BQL */
+typedef struct SemihostingConsole {
+    CharBackend         backend;
+    Chardev             *chr;
+    GSList              *sleeping_cpus;
+    bool                got;
+    Fifo8               fifo;
+} SemihostingConsole;
+
+static SemihostingConsole console;
+
 int qemu_semihosting_log_out(const char *s, int len)
 {
-    Chardev *chardev = semihosting_get_chardev();
-    if (chardev) {
-        return qemu_chr_write_all(chardev, (uint8_t *) s, len);
+    if (console.chr) {
+        return qemu_chr_write_all(console.chr, (uint8_t *) s, len);
     } else {
         return write(STDERR_FILENO, s, len);
     }
@@ -106,16 +116,6 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
 
 #define FIFO_SIZE   1024
 
-/* Access to this structure is protected by the BQL */
-typedef struct SemihostingConsole {
-    CharBackend         backend;
-    GSList              *sleeping_cpus;
-    bool                got;
-    Fifo8               fifo;
-} SemihostingConsole;
-
-static SemihostingConsole console;
-
 static int console_can_read(void *opaque)
 {
     SemihostingConsole *c = opaque;
@@ -169,10 +169,9 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
     return ret;
 }
 
-void qemu_semihosting_console_init(void)
+void qemu_semihosting_console_init(Chardev *chr)
 {
-    Chardev *chr = semihosting_get_chardev();
-
+    console.chr = chr;
     if  (chr) {
         fifo8_create(&console.fifo, FIFO_SIZE);
         qemu_chr_fe_init(&console.backend, chr, &error_abort);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 84a31eba76..3395c877aa 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2041,8 +2041,7 @@ static void qemu_create_late_backends(void)
         exit(1);
 
     /* now chardevs have been created we may have semihosting to connect */
-    qemu_semihosting_connect_chardevs();
-    qemu_semihosting_console_init();
+    qemu_semihosting_chardev_init();
 }
 
 static void cxl_set_opts(void)
diff --git a/stubs/semihost.c b/stubs/semihost.c
index 4bf2cf71b9..f486651afb 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -65,10 +65,6 @@ void semihosting_arg_fallback(const char *file, const char *cmd)
 {
 }
 
-void qemu_semihosting_connect_chardevs(void)
-{
-}
-
-void qemu_semihosting_console_init(void)
+void qemu_semihosting_chardev_init(void)
 {
 }
-- 
2.34.1


