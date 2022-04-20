Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78026508F16
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:09:15 +0200 (CEST)
Received: from localhost ([::1]:57614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhElO-0000Sw-Ib
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEij-0005Kh-2g
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:30 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEih-0001BN-0a
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id h1so2658804pfv.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTPANaSXVUPEAI7mIQ7snDqLyeiuuNYxhMnMuIg6itw=;
 b=QV1YunUi0aBko59BN3IP28wGpWxZ17+liBOmoU8aNEiuHzARonyVTOim78JofFARPv
 NXQwtYWDVQIGFEUSwHn/FVaXgx4oY0n4EVWJyNRVgmQ8fVPhbhjDyzWnANfHFpWGeEN+
 p+VtSRcXbfXsxuO6iN6g5ItvWJ9f1m6sexoam49F7ciIFduBSqt67TenqKQeOOfJ9suW
 k8Q7M4AhBPIP8qzz3bHfBV8UzK3DgBdlwH7kZTtbygjmc9W6XZ6NrHfO2hgnI+ktrQkv
 H4pAaJRYkYAWxfEXfz0NnUQb/NutGwJGATgkCCrj6vb5K2uIqqhhu68rU617AgfZ/9pf
 ZfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTPANaSXVUPEAI7mIQ7snDqLyeiuuNYxhMnMuIg6itw=;
 b=Wmhd0pzYUEEifNpwycPtpJ3PKjARIrw/h0IG6z+mI5My77cBlgFtm8jwrY7HIEjHdM
 Xg0zscUWc/bI2x8l49OWZFwiAssCOBLTTYXWsxTSGe+EO5gzwm5+zzjUcgaXFWU0Ccko
 /uPwLerl6O8T24iDWHleHdGu6U0HbxA0nILFezMpdGUtkYcv+GHCJtUuWeKbdoMYMJ4R
 50nFv4n/T6GSZqTpJhPEc6IvTFWw1SeihRibGFeybs5mvRLpze6gk8lyPeULBvDv/RJN
 NnX07DZp/UKY3b/qCyG7b0MpCrL2OWWe3ESB++GGZ3pcESOcy0SRcO29Tpks0tpDwlGQ
 hN5A==
X-Gm-Message-State: AOAM53364cXxvtu9cGoxOC8+B2l7smEUkTl99tQEDAq6P5tk+YLyITQH
 ao9zHXElwyhCxihrtQzPMeA4YolqGE9rTg==
X-Google-Smtp-Source: ABdhPJx3YHE8zoNeqFJCfgGYI+1gJc5X2+V8w1XCA2jX2tVtyqreKnfvQma1GMI3iGZ2nCgrc3H24w==
X-Received: by 2002:a63:e90a:0:b0:3aa:2c41:87b4 with SMTP id
 i10-20020a63e90a000000b003aa2c4187b4mr9851081pgh.118.1650477985625; 
 Wed, 20 Apr 2022 11:06:25 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/39] util/log: Move qemu_log_lock, qemu_log_unlock out of line
Date: Wed, 20 Apr 2022 11:05:45 -0700
Message-Id: <20220420180618.1183855-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-7-richard.henderson@linaro.org>
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
2.34.1


