Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C84E1D12
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:19:42 +0100 (CET)
Received: from localhost ([::1]:38210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzDR-0000If-MV
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:19:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5l-0008KQ-Sj
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:45 -0400
Received: from [2607:f8b0:4864:20::633] (port=46965
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5i-0003QZ-Tk
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:44 -0400
Received: by mail-pl1-x633.google.com with SMTP id w4so10855992ply.13
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4kTl/W0nqOk5wuB3SJo0d0RYWr70TQFHqQ4WUsLcxUk=;
 b=M3P3Yk0MiS+YZPPtSqOjllT5zVJ1uK+JS/97MRHfoad8QVLnOlZS+TiqNPBVsZU270
 kGjYNAJSbNVGFiHnefpkbrJTeud6AB14jZrOofJ2XvCQX+0D+g9kdL3xrwWMiSBV9YH1
 j6I2YqypQff3+qxR/KqvIKNaE4yrq6tezk0etgGmgCX3wL5n5H3HcZLbqXLGzcPAX3I0
 gZ+pi1Br5VOCpUxxgu8KscoxRZNzlbF23XtQOCDyd709dByOnR6jWqA3hnf46kkdMtXg
 ms1IBTk8UI0CV6cj835JIVPw4uIA/+Cczb2KIU1e7l6JMYd9gdbLqqkbR7jrtxpurmI1
 y0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4kTl/W0nqOk5wuB3SJo0d0RYWr70TQFHqQ4WUsLcxUk=;
 b=MkIJn2t/FqXhDQEJv32ThzGEWPo9TdvugAD3+UoX8RaeEwv07Zz5JNFVkDupszZiTa
 t9+3RXfX2Zh/sqH8augFFn0YpjUUrcLsNb/1UGPLfuDGRZ55aOgQtrgTtp4E2mkBDwb2
 RCq7OkrxgNaMpQ3Q/d+7MI4iCXyv0asNx2cyILJPIi617SGr8sInv6flelF+5gDQ+5Z8
 kDlp3cg7mAz20wX2249t1+Fnq8SdLlUKGER1kDQ7Mk1TrSpuLIJH9dSw+LEi2vzSuC5i
 JsAj1OdGQAp+/mde+Q4pW3w5Uh5nzwaQ0oKK22sn+xnCxrUQvU4PZ8CJjTDLeO6LuXVi
 cX4Q==
X-Gm-Message-State: AOAM530GI9fwbnCGERsNQ1Kb/pRyaCgBK1nV3sYeY9pmNh5c/M8jyNd6
 r7LnUNtuI4QLrzqFLibrnKwl/k7mqLUCXw==
X-Google-Smtp-Source: ABdhPJw9koSJs/Wm4tRiWZvDgompChBYfrI22p7A7yOFI24Ajffyq6vt1PN+ijEGoSyc34DPoxxF6Q==
X-Received: by 2002:a17:903:228f:b0:154:5350:be02 with SMTP id
 b15-20020a170903228f00b001545350be02mr2168616plh.53.1647796301670; 
 Sun, 20 Mar 2022 10:11:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 05/36] util/log: Move qemu_log_lock,
 qemu_log_unlock out of line
Date: Sun, 20 Mar 2022 10:11:04 -0700
Message-Id: <20220320171135.2704502-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h | 28 +++-------------------------
 util/log.c         | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 64f28785ae..10e284291c 100644
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
index 00773ab717..248db6211e 100644
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


