Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2544E8157
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:09:22 +0100 (CET)
Received: from localhost ([::1]:40374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY76X-00028Y-Ss
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:09:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Ra-0007sG-8R
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:27:02 -0400
Received: from [2001:4860:4864:20::2d] (port=34147
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6RS-0005YV-Qp
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:57 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-de3f2a19c8so10758622fac.1
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RmSObI8TwqseZSqimQUfXxvb0G/cAqhY8HopOTgyxA=;
 b=hvfVxFF4zHagRIOIgbERJ3AIQx+eQbD+PtEcV7fE4yl07CxMwP+hkEVTWYja5erWSo
 Dsf+rTKOiX6ffufAgjoKe7EIOdRfKaBzPH+rnixbQ45+jJohNwYbcaM312nCMl/fIame
 pGd+HYyAOdUE5ywtE9+33XTsphjy3uvdRZNIgodhYQguBPR2XtAA+LzRTTLvxdA/sJf2
 XVBQ15lYRtUq1itfnSKvU3QI0+V/OeBgu4T7Y8EI0zaJxEeTMgFzN9ry+FGhwM9tllFN
 t5Mqq4FLzwym9FzrDm3GQMptZt8Hfr1VPiuDu3HMZvM3iMw0GKHeQ2G5zEFWPPYwyM79
 RrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6RmSObI8TwqseZSqimQUfXxvb0G/cAqhY8HopOTgyxA=;
 b=lfFQG9eygUROtSGWeLeThnaPpwAjfDqRRAUHaGlTwVa0/gOpJvazoNu4bvz2vT6bHr
 rfROKDPXC5tWk5jssp3RZRfHhFGHUN4CRnfGRlSKxuXNAPUF6GRKFqus3PigeOKWsodu
 mINao/+WHrBJHUJQdcNsa3vKAjE+sNhN5VOz8H6TNoEBdIQcb0fZiUzzFGYBw6GNJkkv
 GASA7HK5VZlBWVPyyw/GwYGuRBIPiorjwf3rVHtBANZnbyt2Vz7Z3of6kMjWsLC6ML75
 CLESx8dFvfk1kH//lAQEptE4ZicttWSNmkc3lU4OpVIm4pDy5Mv0idEXSwrIJisSFVm+
 z3HQ==
X-Gm-Message-State: AOAM532BnmZmjCm9dwQtwHCrRApU2lr9CvKq4PXmyL5SuhR47l4jCXVk
 kL/bJwH3cie9x1PfChHuqnDECcMCGGhhRFwy
X-Google-Smtp-Source: ABdhPJzYjT1hGjKCj94C40ozgOtDZrmLa3WWf334oMsYjDh8hpuJpLGGHWwECn6X8hbMQ/Iho6WfOg==
X-Received: by 2002:a05:6870:4790:b0:dd:cd0f:e00b with SMTP id
 c16-20020a056870479000b000ddcd0fe00bmr11254147oaq.120.1648301197306; 
 Sat, 26 Mar 2022 06:26:37 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/39] util/log: Remove qemu_log_close
Date: Sat, 26 Mar 2022 07:25:26 -0600
Message-Id: <20220326132534.543738-40-richard.henderson@linaro.org>
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

The only real use is in cpu_abort, where we have just
flushed the file via qemu_log_unlock, and are just about
to force-crash the application via abort.  We do not
really need to close the FILE before the abort.

The two uses in test-logging.c can be handled with
qemu_set_log_filename_flags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h        |  3 ---
 cpu.c                     |  1 -
 tests/unit/test-logging.c |  4 ++--
 util/log.c                | 17 +----------------
 4 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index b6c73376b5..a325bca661 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -92,7 +92,4 @@ int qemu_str_to_log_mask(const char *str);
  */
 void qemu_print_log_usage(FILE *f);
 
-/* Close the log file */
-void qemu_log_close(void);
-
 #endif
diff --git a/cpu.c b/cpu.c
index bfa4db9cd8..7df12537d5 100644
--- a/cpu.c
+++ b/cpu.c
@@ -408,7 +408,6 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
             cpu_dump_state(cpu, logfile, CPU_DUMP_FPU | CPU_DUMP_CCOP);
             qemu_log_unlock(logfile);
         }
-        qemu_log_close();
     }
     va_end(ap2);
     va_end(ap);
diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index 9b87af75af..74ec89f1a8 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -170,7 +170,7 @@ static void test_logfile_lock(gconstpointer data)
      * Initiate a close file and make sure our handle remains
      * valid since we still have the logfile lock.
      */
-    qemu_log_close();
+    qemu_set_log_filename_flags(NULL, 0, &error_abort);
     fprintf(logfile, "%s 2nd write to file\n", __func__);
     fflush(logfile);
     qemu_log_unlock(logfile);
@@ -208,7 +208,7 @@ int main(int argc, char **argv)
                          tmp_path, test_logfile_lock);
 
     rc = g_test_run();
-    qemu_log_close();
+    qemu_set_log_filename_flags(NULL, 0, &error_abort);
     drain_call_rcu();
 
     rmdir_full(tmp_path);
diff --git a/util/log.c b/util/log.c
index 2152d5591e..491a8f97f9 100644
--- a/util/log.c
+++ b/util/log.c
@@ -198,7 +198,7 @@ static bool qemu_set_log_internal(const char *filename, bool changed_name,
             if (is_daemonized()) {
                 dup2(fileno(fd), STDERR_FILENO);
                 fclose(fd);
-                /* This will skip closing logfile in qemu_log_close() */
+                /* This will skip closing logfile in qemu_logfile_free. */
                 fd = stderr;
             }
         } else {
@@ -322,21 +322,6 @@ out:
     g_strfreev(ranges);
 }
 
-/* Close the log file */
-void qemu_log_close(void)
-{
-    QemuLogFile *logfile;
-
-    qemu_mutex_lock(&qemu_logfile_mutex);
-    logfile = qemu_logfile;
-
-    if (logfile) {
-        qatomic_rcu_set(&qemu_logfile, NULL);
-        call_rcu(logfile, qemu_logfile_free, rcu);
-    }
-    qemu_mutex_unlock(&qemu_logfile_mutex);
-}
-
 const QEMULogItem qemu_log_items[] = {
     { CPU_LOG_TB_OUT_ASM, "out_asm",
       "show generated host assembly code for each compiled TB" },
-- 
2.25.1


