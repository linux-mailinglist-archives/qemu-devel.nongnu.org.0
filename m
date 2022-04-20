Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3B508F93
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:37:31 +0200 (CEST)
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFCk-0000rM-LX
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj9-0006O7-0k
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:55 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEj7-0001Mx-AS
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:54 -0400
Received: by mail-pl1-x62e.google.com with SMTP id q3so2524699plg.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p9DdDXF/cfTV0TrHX0YMQwF1dlIRO0Y9R9S6R8WRAHE=;
 b=RUi+7HfCt4XKs3r+YAojdrzhMB85gY6MjEAXaJVsViHv271/ib+Lc483m7U44HFg7Z
 V8HA3QnUMz8dq7zF5F04brOcHnRLRfSSOq9ljz3Ee/PfHxGYIKZQyuT5DQ4CC5bwt0Qx
 EKOZUFMm1xLeLhsEO/j29EUq8pOz5k1Yn6dPOt+IQXDY9c1Eg5MgOMBxmZvW3BdYqg9K
 T6PZ60xUShwmSUo9UndJeIxxllhlJqTZRovECLhfI37YipKEFdc252g4kF3+C70ny9jq
 1DUhFIqnIjbHC5IvY5/EdtPKt05+e+fBUPBo2KBjuGU7MCdpqiTHyW8jgHU23/sBR7gi
 lX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9DdDXF/cfTV0TrHX0YMQwF1dlIRO0Y9R9S6R8WRAHE=;
 b=Gr0zpN0KOs6NmCbTlU2YmdQR86iBkYeI3nCB6XR0QOwknwduGJ225Mi8Vd38TiGCH7
 ApXsqkuHN7H29OiQZbEmsFPDfD8FUdC6FlFEs/y1tPdi8fLsj/G0xIv1IIU9sWysKf+K
 E3aoM+WLEe5wX3GG6WRC06h9zrlyqjV9FEendjFzqUlpOYavSvXltkFhAKllzaKAf8No
 nK+GHAZ0LcDt673yXGdOiRsQkwi+zWfaSa0IiPP+RX4MUMxZhPEXUbwoqyBLljGPGlmZ
 hhyB0pd3EQfKBGXd4t2/ryqNXcLA2tti5o2nrJ0HmCpoJrOg+8qAFYBs357MaWs77pee
 v7zg==
X-Gm-Message-State: AOAM532TabYQpZmvdcBni4rFtPDbgyQMBq0gWdaJo3xcjKHEVCHSaHrD
 1Zg9R/i6qo52UVCr+Mia7hE+1KbXUIqyIg==
X-Google-Smtp-Source: ABdhPJw8eeF6ipD4DV2Fa2FaBsSe8tBd6Q90BBD4dJ6uylcwk9Y3MhG7Bu9DMPf4nW9/0iUc3f8TKw==
X-Received: by 2002:a17:90b:4a48:b0:1d2:ba31:9853 with SMTP id
 lb8-20020a17090b4a4800b001d2ba319853mr5772017pjb.243.1650478012023; 
 Wed, 20 Apr 2022 11:06:52 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/39] util/log: Remove qemu_log_close
Date: Wed, 20 Apr 2022 11:06:10 -0700
Message-Id: <20220420180618.1183855-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only real use is in cpu_abort, where we have just
flushed the file via qemu_log_unlock, and are just about
to force-crash the application via abort.  We do not
really need to close the FILE before the abort.

The two uses in test-logging.c can be handled with
qemu_set_log_filename_flags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-32-richard.henderson@linaro.org>
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
index 7076ec123a..584ac78baf 100644
--- a/cpu.c
+++ b/cpu.c
@@ -407,7 +407,6 @@ void cpu_abort(CPUState *cpu, const char *fmt, ...)
             cpu_dump_state(cpu, logfile, CPU_DUMP_FPU | CPU_DUMP_CCOP);
             qemu_log_unlock(logfile);
         }
-        qemu_log_close();
     }
     va_end(ap2);
     va_end(ap);
diff --git a/tests/unit/test-logging.c b/tests/unit/test-logging.c
index 7327de7b5f..66dbc82a56 100644
--- a/tests/unit/test-logging.c
+++ b/tests/unit/test-logging.c
@@ -169,7 +169,7 @@ static void test_logfile_lock(gconstpointer data)
      * Initiate a close file and make sure our handle remains
      * valid since we still have the logfile lock.
      */
-    qemu_log_close();
+    qemu_set_log_filename_flags(NULL, 0, &error_abort);
     fprintf(logfile, "%s 2nd write to file\n", __func__);
     fflush(logfile);
     qemu_log_unlock(logfile);
@@ -207,7 +207,7 @@ int main(int argc, char **argv)
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
2.34.1


