Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76E504948
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:22:25 +0200 (CEST)
Received: from localhost ([::1]:49932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngATY-0001Bk-OP
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fm-0000XI-Oq
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:31:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9ff-0001qV-Nu
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:58 -0400
Received: by mail-pg1-x536.google.com with SMTP id q12so15048224pgj.13
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+agEDs5L9Qv0XifAtbfc6Cvy+HapiVSEHi2btRZrRAM=;
 b=vOEdaQ0YACjwwptEqGawje9aG3URhyeTyLyi8DBgTk3vwnBsu6Ea+gqLBe5/muOYjp
 zRhHiv0bYufllIc6C5RsekO4r7m5T8U7FnLFDpaFGCZm1dH3ctB5Oh7QuI+br/gEZbHe
 dI74sALMyU7F/JPxD3d3r/eefp+zkoc6emnBJx34KURHBJAlTrHpmwbJRqJs0uR7TuVg
 Y43IxvN/FEoAUxheb1gGN++2+MI4sHkGzgiPjfxMyCE8VLGDn31YHQnj63Af9+OfXKL6
 6uUCrhReXWGPY9Ii2L0HNzMdKr1QE+I/EVOFddwWM+5b9HYCxbbAX9uKsri9IwxFd1eL
 ueHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+agEDs5L9Qv0XifAtbfc6Cvy+HapiVSEHi2btRZrRAM=;
 b=v5/Mwm/toq4eIK9Qt+o7tfqk+oGOcPo3HbLsQAOWZL0KyNEeaCKQyTRSVSTaxOVNnf
 athOyskI0ZDTDlj2K/B0bMtteFeZkrFK62galE4tANMig/P1wwd9WD2yWzc33Kl4U4vH
 /U82ywN+SyUtX26D8pNaBDAZfq4sdLh/OpzmlSVxxdQlxRA8mkptZoOElESCs5/L6LBj
 ciwlo5ESeVaPDcN/+9ENBhgLF9KCtx71lh+PsPR14klVqU0fdLCty/bwwq1iSEdcaTSv
 whkRihNxBN70pDqU9Xn5c6tZv/wOcLdyp4YiNkZUiKK1ScN4ys1NYYoF4N90P6bNuTSU
 /Aiw==
X-Gm-Message-State: AOAM530vASYmORcj7TaLJVxTpssJPOOK6kmm/hNQ322rDzkihI611K8F
 ccTUf6ONNEl1pLuhiqRCEh9iT1T38rNQAQ==
X-Google-Smtp-Source: ABdhPJwmgR7ON6aCaDE+JvzD9+W7crQ80IRwJupw7HWWgMMcgLcCsWiTF+Y7eYMiN9kbnDeVzLsOZg==
X-Received: by 2002:a63:5847:0:b0:399:3452:ffe4 with SMTP id
 i7-20020a635847000000b003993452ffe4mr7205616pgm.406.1650220246738; 
 Sun, 17 Apr 2022 11:30:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/39] util/log: Remove qemu_log_close
Date: Sun, 17 Apr 2022 11:30:11 -0700
Message-Id: <20220417183019.755276-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: alex.bennee@linaro.org
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


