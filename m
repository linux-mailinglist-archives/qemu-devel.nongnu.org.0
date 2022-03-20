Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD24E1D2A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:34:15 +0100 (CET)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzRW-0006VB-CY
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:34:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz65-0000Ki-3q
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:05 -0400
Received: from [2607:f8b0:4864:20::631] (port=40458
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz63-0003VG-Gt
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:04 -0400
Received: by mail-pl1-x631.google.com with SMTP id h5so10883713plf.7
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fetZSTEnCJcUQDWQ/liPaUY34R68y2pAl1CfXvkPMCQ=;
 b=mmq+r8KGF/9AV6RJGtJlDlPDXpN2T7lt6xZOBChHZSXFDVTcBX0tD2mZcotEMj1R4+
 jCZdqCIWMuwRI1no6sqZQyINZnCfzs/FNsvxH6XD/E4Ci1Iusv5hK5mD6qTltT6aP9Ue
 z95QGIvQCyvzUYg6ntASdg1Lp3/2QYSwidpTkQ+6ybfptRxRuAJSyCvmgziloQbVtlfF
 g14B0hVzBXUElNsjThdO2eaz3NHK+iR39Mb9IAX9F/PLdF90hRTfePm46L6cjzdRGARu
 Ta+YuLBQJsIHsqZGU0PKkVkvEfUCdkncYknFJf8SJFnC+oUd2ZlbZXh/jgBXg0ASu6R1
 7Euw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fetZSTEnCJcUQDWQ/liPaUY34R68y2pAl1CfXvkPMCQ=;
 b=txJZ/59q+aCG7HoKkTR+zqge8pGg2SarJzak1E+ZJP8Wdkq/AAmpFJsXvTX5gT08Wl
 JtnUj92/rQ3mqEHdmQNQEIHnjMPlw6lTspfy9flw+TUvOz7aHIqUjq00+O/+q9yXF7Zj
 tMbftq2oe3EmjMdW7Gy5is7bbFQJ4gRmTeUOBdgEYThLEoGPIA92OZf2KF8Gq1sXwruL
 YFQwMK1b19WXYVGrcXutpvBY8lj6Zp85/F5fnddg1x8oqkjK2zLPOzyeA+aL0LfExO+Q
 ylV99pZNoWK+eB3paft8wldS4F1R8PJOXE/to46etkVGOvUoQz1f5zvXXUxbGvJk6ksl
 wC+g==
X-Gm-Message-State: AOAM531lDVxGbNJ3KsTmh91Zq7aydZFet+9/14AyH0IlcijAIHf8Pahh
 vN8heVpLMNkK8FBagItb0m2nU6TlYRB67w==
X-Google-Smtp-Source: ABdhPJyrdqXyHxEMjwL8fou4FI3yYGojgSRYyhPTiQbkcHze7IxWol33zMlFnCxrHmZubyHv+2Lo3Q==
X-Received: by 2002:a17:902:c408:b0:154:4bee:c418 with SMTP id
 k8-20020a170902c40800b001544beec418mr3229702plk.75.1647796322264; 
 Sun, 20 Mar 2022 10:12:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 28/36] util/log: Remove qemu_log_close
Date: Sun, 20 Mar 2022 10:11:27 -0700
Message-Id: <20220320171135.2704502-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
index ef247776cf..783faec309 100644
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
index 054f21b307..3eb324c1c9 100644
--- a/cpu.c
+++ b/cpu.c
@@ -406,7 +406,6 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
         fprintf(logfile, "\n");
         cpu_dump_state(cpu, logfile, CPU_DUMP_FPU | CPU_DUMP_CCOP);
         qemu_log_unlock(logfile);
-        qemu_log_close();
     }
     va_end(ap2);
     va_end(ap);
diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index 7016710a74..4e649e44c5 100644
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
index 46a0d38d41..691d6d7930 100644
--- a/util/log.c
+++ b/util/log.c
@@ -207,7 +207,7 @@ static void qemu_set_log_internal(const char *filename, bool changed_name,
             if (is_daemonized()) {
                 dup2(fileno(fd), STDERR_FILENO);
                 fclose(fd);
-                /* This will skip closing logfile in qemu_log_close() */
+                /* This will skip closing logfile in qemu_logfile_free. */
                 fd = stderr;
             }
         } else {
@@ -330,21 +330,6 @@ out:
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


