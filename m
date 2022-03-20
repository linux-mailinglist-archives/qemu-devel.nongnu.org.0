Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9264E1D0A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:16:25 +0100 (CET)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzAG-0002u8-Ss
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:16:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5h-0008Jb-NB
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:41 -0400
Received: from [2607:f8b0:4864:20::1034] (port=56074
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5f-0003Pm-Fm
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:41 -0400
Received: by mail-pj1-x1034.google.com with SMTP id e3so11256262pjm.5
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0QkXC8NBloa4lQ1dJr9n5F8IaX751sw3OjPlQ3q4G5M=;
 b=IUNtxrArwdd6X13tTr7XaTLoskrITi858kDgSZzVI20oFinaGMzllLB2rOu8mpn/zY
 bRY/7/NOH75+hAFWcDESbPg5Yw3yNH4+s7vF6scnuqPQvD6o35QOLVxZm2e7rFb0Jyu3
 mLtHN05YkIeIMnPXhUW2epT9gpkJqOF0kkmBXDwriBfYkGunPU8kvbafstue+/mBwJN/
 eE985p9ir0ha8241XV1TC7EMaFCQwIbAJW6eWNRiCS7XrGZC768ViEkbER/8IS7xDWfw
 TxVcjWDnicy5JzgmTJEnRmgkXnL3D+tMwtB2uJIrlPkPgjorQ5cr4nsey11X1zbeq0bu
 NVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0QkXC8NBloa4lQ1dJr9n5F8IaX751sw3OjPlQ3q4G5M=;
 b=JjsFbG+WWVNGyqm7HHkTdEJ0HJF2pQ3IG66qPYZ0WKribnnlBbSsdmIx8Xp1s03Nr4
 jL1QRxSSaeEOT/zPYvKVLKNMGvQC6KtBfjHOgBXSoQoevyJhLDi3cyUHayheIwdSNrfF
 53fR/QMDyf8eO4/PoGGskPGjQriAVTWY8RYzBksea/U4l/ePzVhnhGgvyWnhTJi09uGK
 CE0qqsGG3vuuZDgealu0kY4+j9FIIqfbjvsmS9rOL9CzwKAwgvPX2V/+dpNQNUjCa8zp
 Tv+xyeluPk381OMtI2CGM4jwcLQ3mS08d7gdmuQhNsRgVdh1eWGqAQIrz5iChUZzI7On
 1cSA==
X-Gm-Message-State: AOAM53097cAzovaia8ORc00UBWOrEYdPAStAD94kCnPvfcLUPlUZxhYt
 NbYezKL738BZ72Q5ZCG4e3VKwFUb+SM6lw==
X-Google-Smtp-Source: ABdhPJz8PAdwcBUv9olNP7WDXxR/BGncXC8WIsc6l9IBxPqv5mTX8bWpJa8/l01QXdg1PnX4WLagzg==
X-Received: by 2002:a17:90b:1642:b0:1c6:c6d0:fbfa with SMTP id
 il2-20020a17090b164200b001c6c6d0fbfamr11556396pjb.218.1647796297552; 
 Sun, 20 Mar 2022 10:11:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 01/36] util/log: Drop manual log buffering
Date: Sun, 20 Mar 2022 10:11:00 -0700
Message-Id: <20220320171135.2704502-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

This buffering was introduced during the Paleozoic: 9fa3e853531.

There has never been an explanation as to why we may not allow
glibc to allocate the file buffer itself.  We certainly have
many other uses of mmap and malloc during user-only startup,
so presumably whatever the issue was, it has been fixed during
the preceeding 18 years.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h |  1 -
 bsd-user/main.c    |  1 -
 linux-user/main.c  |  1 -
 util/log.c         | 21 ++++-----------------
 4 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 9b80660207..08b0cd0bb3 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -148,7 +148,6 @@ typedef struct QEMULogItem {
 extern const QEMULogItem qemu_log_items[];
 
 void qemu_set_log(int log_flags);
-void qemu_log_needs_buffers(void);
 void qemu_set_log_filename(const char *filename, Error **errp);
 void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
 bool qemu_log_in_addr_range(uint64_t addr);
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 88d347d05e..08f43af235 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -405,7 +405,6 @@ int main(int argc, char **argv)
     }
 
     /* init debug */
-    qemu_log_needs_buffers();
     qemu_set_log_filename(log_file, &error_fatal);
     if (log_mask) {
         int mask;
diff --git a/linux-user/main.c b/linux-user/main.c
index fbc9bcfd5f..2b06350688 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -679,7 +679,6 @@ int main(int argc, char **argv, char **envp)
 
     log_mask = last_log_mask | (enable_strace ? LOG_STRACE : 0);
     if (log_mask) {
-        qemu_log_needs_buffers();
         qemu_set_log(log_mask);
     }
 
diff --git a/util/log.c b/util/log.c
index 2ee1500bee..ffa66a267e 100644
--- a/util/log.c
+++ b/util/log.c
@@ -72,8 +72,6 @@ static void qemu_logfile_free(QemuLogFile *logfile)
     g_free(logfile);
 }
 
-static bool log_uses_own_buffers;
-
 /* enable or disable low levels log */
 void qemu_set_log(int log_flags)
 {
@@ -121,29 +119,18 @@ void qemu_set_log(int log_flags)
             assert(!is_daemonized());
             logfile->fd = stderr;
         }
-        /* must avoid mmap() usage of glibc by setting a buffer "by hand" */
-        if (log_uses_own_buffers) {
-            static char logfile_buf[4096];
 
-            setvbuf(logfile->fd, logfile_buf, _IOLBF, sizeof(logfile_buf));
-        } else {
 #if defined(_WIN32)
-            /* Win32 doesn't support line-buffering, so use unbuffered output. */
-            setvbuf(logfile->fd, NULL, _IONBF, 0);
+        /* Win32 doesn't support line-buffering, so use unbuffered output. */
+        setvbuf(logfile->fd, NULL, _IONBF, 0);
 #else
-            setvbuf(logfile->fd, NULL, _IOLBF, 0);
+        setvbuf(logfile->fd, NULL, _IOLBF, 0);
 #endif
-            log_append = 1;
-        }
+        log_append = 1;
         qatomic_rcu_set(&qemu_logfile, logfile);
     }
 }
 
-void qemu_log_needs_buffers(void)
-{
-    log_uses_own_buffers = true;
-}
-
 /*
  * Allow the user to include %d in their logfile which will be
  * substituted with the current PID. This is useful for debugging many
-- 
2.25.1


