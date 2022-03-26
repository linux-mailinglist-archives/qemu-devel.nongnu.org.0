Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417EA4E811F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:36:56 +0100 (CET)
Received: from localhost ([::1]:58216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6b9-0006tr-Ae
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:36:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QW-00073Y-JS
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:56 -0400
Received: from [2607:f8b0:4864:20::233] (port=45010
 helo=mail-oi1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QV-0005M7-12
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:56 -0400
Received: by mail-oi1-x233.google.com with SMTP id t21so6202162oie.11
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rr/RffNvDVGLD4+joN+/CEx/FD3wfnt5ywEdlwbeVrE=;
 b=vf02uyaw8WiWLaH7s58pCO3RRldHu6Wp+MIbSq7J03ATGXueAh55QwbS1t15fzE55x
 7Ac+UHENCYQmkL6hEK0KlYW30rwWl/xvyztGPoFV/DmNzKXgMk2+1Fm2B+wRPIQfyCAk
 U4CEBtQb7FwpfizCkccJJ8qCggsfc/6kMmKb/+KcuDCKm6Z8/tOlSuKC5DAoEwO7yzP0
 dG+955nrqsCtSdiEEM/fZxNU1Nv9twNvJxrEzBLxdrCN1IJ3sLcub+RUDRoJ30Gmu+of
 AiJVgg2pWtsUbncNWtlmd1Wv6le798eIU2EGVQacARMEOzC22ksWYnvRDz4rU1OAzM05
 dA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rr/RffNvDVGLD4+joN+/CEx/FD3wfnt5ywEdlwbeVrE=;
 b=0Tn3YQbFn7EMJvFOPJOosXJMsLv7NsiCXXFwx5K1Ru4rjrycugO5u4B8mkAaCKPSNX
 kMAzEWvO+dpZveDVYvFcYqWyqj+PST/Ux+KblmvSRWAGmr0d8gaxxAIZZSdX00i8SdgO
 v2xwbXRHMwYs+sgjto4sApPX6ur9xJu0/TGHGPXavr1RAt35cq2mcdKfgJl7brbYHItw
 dkKFLo16SkQRE3+czJxKZBhUT2H86AJqqxTytiLqmmvTBzKIo3HI8/U0awwaTzpH6Fc4
 bBMb+RArwmAkccqdxG5uEfzdmLwBh8VLkPO8KBFnoppO5Owp6sFsWRylorvtQzNlPA4m
 iahQ==
X-Gm-Message-State: AOAM531YTH37nzIn5S1N3ExchrEjoI7jTgghVaCDmBpJq5TDO3BQtnUf
 wxeS77B+jMe2mHG648orC8fXtgd8VnWf5g7h
X-Google-Smtp-Source: ABdhPJwHC7KeJgwPkYUzK0F5sIdvtUU2QMvpaCqBMMZsQiG1hQ5TdPKc6gxxicNHeRcbA7l1I1pFnA==
X-Received: by 2002:a05:6808:14cf:b0:2d9:dcc6:8792 with SMTP id
 f15-20020a05680814cf00b002d9dcc68792mr12852310oiw.219.1648301153915; 
 Sat, 26 Mar 2022 06:25:53 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/39] util/log: Move qemu_log_lock,
 qemu_log_unlock out of line
Date: Sat, 26 Mar 2022 07:24:59 -0600
Message-Id: <20220326132534.543738-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::233
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h | 28 +++-------------------------
 util/log.c         | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 0b892f5e90..6a6b1efce5 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -65,32 +65,10 @@ static inline bool qemu_log_separate(void)
 /* LOG_STRACE is used for user-mode strace logging. */
 #define LOG_STRACE         (1 << 19)
 
-/* Lock output for a series of related logs.  Since this is not needed
- * for a single qemu_log / qemu_log_mask / qemu_log_mask_and_addr, we
- * assume that qemu_loglevel_mask has already been tested, and that
- * qemu_loglevel is never set when qemu_logfile is unset.
- */
+/* Lock/unlock output. */
 
-static inline FILE *qemu_log_lock(void)
-{
-    QemuLogFile *logfile;
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
-        qemu_flockfile(logfile->fd);
-        return logfile->fd;
-    } else {
-        return NULL;
-    }
-}
-
-static inline void qemu_log_unlock(FILE *fd)
-{
-    if (fd) {
-        qemu_funlockfile(fd);
-    }
-    rcu_read_unlock();
-}
+FILE *qemu_log_lock(void);
+void qemu_log_unlock(FILE *fd);
 
 /* Logging functions: */
 
diff --git a/util/log.c b/util/log.c
index bab4d29ecb..1a3121610a 100644
--- a/util/log.c
+++ b/util/log.c
@@ -34,6 +34,29 @@ int qemu_loglevel;
 static int log_append = 0;
 static GArray *debug_regions;
 
+/* Lock/unlock output. */
+
+FILE *qemu_log_lock(void)
+{
+    QemuLogFile *logfile;
+    rcu_read_lock();
+    logfile = qatomic_rcu_read(&qemu_logfile);
+    if (logfile) {
+        qemu_flockfile(logfile->fd);
+        return logfile->fd;
+    } else {
+        return NULL;
+    }
+}
+
+void qemu_log_unlock(FILE *fd)
+{
+    if (fd) {
+        qemu_funlockfile(fd);
+    }
+    rcu_read_unlock();
+}
+
 /* Return the number of characters emitted.  */
 int qemu_log(const char *fmt, ...)
 {
-- 
2.25.1


