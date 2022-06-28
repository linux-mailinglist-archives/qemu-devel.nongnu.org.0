Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C955BF5F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:17:50 +0200 (CEST)
Received: from localhost ([::1]:33780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66Pt-0005jw-4p
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JX-00020i-Mc
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:07 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63JV-0000WI-SR
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:03 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so11458083pjj.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4xXXCwDW7BZ3fRj3JS6tTL98Qk1OFP4MXs/nw6KdL3U=;
 b=ynHheS0Y3IppPELmhzsxCYif+ufZJPn62i3aR8N2lQ3rbTBOk/ee1+inUvPPDaP5Cg
 miMfQReeaqC2Bz2np625pAhCkJodExCgw522zblq4wT8Dyv72By5lmu+6Grhd06V5e0H
 EZI//KB7ek01gzY7cYyxYygOa34lLTh3VkbvevKSh5UkZw6JGurgvWx6zxNOsbYIWShS
 y1Gb938CkFldRoxPAOuAMtNG7cu0AhV4FSnxJKfkL7NM8GwHSU1MMqsBkL5eAgp4Zd/q
 qh+KqSNTC2D5Hyyyi6Fvoh6D2aww6Jsp5aDYOKilkOdQy8/ecz8MN4DaoCggLhMyiVsC
 iacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4xXXCwDW7BZ3fRj3JS6tTL98Qk1OFP4MXs/nw6KdL3U=;
 b=Z8IYTms1P+mQ+DxlCS4Slb/Yx+6/GZcgd8MUu/8+UV7Xwms7jbtQcy9XqW0EgQqH2A
 P/++Fh+Hh0UP8WBUf7KJWdd5vSOjdvXjly9FxKLZg0K4byY6tjpw7S4LYvBw3YqohRY3
 2jXV6UO2GsnRVqvThSJ2EccKZH+ztct+5fs9M47ifCujG9QbjZd5Wg2wNYmNyinx/WhU
 z7LL6BhGXFuVUb+ISGWVCI8zy//4GtdTvydyK9i+bw53smaHNpr4xmAHuUCDCaxnA+1/
 OelUDFaUI3gdi+sbHXFmPMf+X6wgjJKpLotYuwFotbn7MWXq8MEbvI4LfXaqjQ4eGyq0
 Sr7w==
X-Gm-Message-State: AJIora9q3bqclyTJgEue8OsyeD3Osf6bxFET6J0H7z2iVsIfdEnsiIYp
 SsWco6wOGOtJL2XWVEUwi+ZqwcHN0IXxzA==
X-Google-Smtp-Source: AGRyM1skbOv52TAXLyhGSEB2mrGzeuN/xOEqc2k/JisvfWWYA9MmA47BD4+0IXskbSi8Isg+FsX70w==
X-Received: by 2002:a17:903:2410:b0:16a:81d2:f5e8 with SMTP id
 e16-20020a170903241000b0016a81d2f5e8mr1789101plo.81.1656392339527; 
 Mon, 27 Jun 2022 21:58:59 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:58:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 44/60] semihosting: Cleanup chardev init
Date: Tue, 28 Jun 2022 10:23:47 +0530
Message-Id: <20220628045403.508716-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Reviewed-by: Luc Michel <lmichel@kalray.eu>
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
index 3afacf54ab..e171d4d6bc 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -51,7 +51,6 @@ QemuOptsList qemu_semihosting_config_opts = {
 typedef struct SemihostingConfig {
     bool enabled;
     SemihostingTarget target;
-    Chardev *chardev;
     char **argv;
     int argc;
     const char *cmdline; /* concatenated argv */
@@ -122,11 +121,6 @@ void semihosting_arg_fallback(const char *file, const char *cmd)
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
@@ -172,16 +166,19 @@ int qemu_semihosting_config_options(const char *optarg)
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
index e5ac3f20ba..1d16a290c4 100644
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
index 3dca5936c7..b24772841d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1917,8 +1917,7 @@ static void qemu_create_late_backends(void)
         exit(1);
 
     /* now chardevs have been created we may have semihosting to connect */
-    qemu_semihosting_connect_chardevs();
-    qemu_semihosting_console_init();
+    qemu_semihosting_chardev_init();
 }
 
 static void qemu_resolve_machine_memdev(void)
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


