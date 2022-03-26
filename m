Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC74E8112
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:30:43 +0100 (CET)
Received: from localhost ([::1]:37712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6V8-0001Vb-6c
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:30:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QI-0006gt-Tp
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:43 -0400
Received: from [2607:f8b0:4864:20::332] (port=41881
 helo=mail-ot1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QH-0005K8-EB
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:42 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 x8-20020a9d6288000000b005b22c373759so7458391otk.8
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hSJXBg/184u8r3uaJrOb0GqfAeU9RlxZON49hn1UzLA=;
 b=d9+mBv8ATMAyxST15UWaLaiKLPuFHQk9/J+ariGOfKEnfXIy+Y6CKtvZLai1G4/mo6
 rSkMZ1uzgO08IctjYUsr62z6ijXbyOQnyg/IYfnQPls9Ug3CsDO4lCA4dw0fOqLY12uQ
 +BeeH1GsjD4ejQucsGq+emaTHazdh9J11s3xNLbqyp+dTxjA8Mf/bVb6tt7QuHu94/p7
 IXh2Ku37uc/u/Jod1unNLikrvdnO9s+BqyHyz12sJf6cUL91ug0AulrcS1RmvrH2zN+9
 mvgYY1Ynmm2aEUXd4zjkfybl8aU7Q6Llf9FxhWO3erC/cbJ1yTGmtrr4/nrBs4919NqX
 wGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSJXBg/184u8r3uaJrOb0GqfAeU9RlxZON49hn1UzLA=;
 b=26C4CjSnpIl7ZYjQwkxdb521Dz+xivyYGFLmrlfClgXqLX1LOCJAa2mGUQX7FKibLq
 +JIgbvDgKh6NFBkb84sCyvYJCV4izRGTL5m3NJVp95S9HHfWaB18HHD/7w/eYuWJriFw
 RYf+k1cyaQ/1UFnpCpMmoO/gni8lv9fYyhC/eEfhBG3a+fSAnoRi4epg0NAs8QKQQQBY
 WQRlLWiAaUF3EWmkBrw/ISXWHtq7sKCiJjDoWCuA6Qtna5ItzOjqPaurPgDMElL1dgVB
 XWEMTgWvhkmj7MjWUuVNQkti16z+4K00Npy+ipiIhoD/GpHrVLEijnSPqi1OzDNM9VMu
 bhpg==
X-Gm-Message-State: AOAM533WZuVOflhbmddPzUZvul286W7/1XM2XjBbG+KwdLnnr5RqkQdw
 LIcyDsuRFoZ6L2cmQm0+e7YDB7teuJpEeuxV
X-Google-Smtp-Source: ABdhPJx1+hr5JZppsjkYZbQVsIfVB6heeF0Q/AMeT6V8L0yJDTD2+UDtfmTTW0HLxvFpRb6cAreTnw==
X-Received: by 2002:a05:6830:2419:b0:5ad:1086:4397 with SMTP id
 j25-20020a056830241900b005ad10864397mr6310864ots.337.1648301140336; 
 Sat, 26 Mar 2022 06:25:40 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/39] util/log: Drop manual log buffering
Date: Sat, 26 Mar 2022 07:24:49 -0600
Message-Id: <20220326132534.543738-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::332
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h |  1 -
 bsd-user/main.c    |  1 -
 linux-user/main.c  |  1 -
 util/log.c         | 21 ++++-----------------
 4 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 5739c7e6d8..ed59ebd4a2 100644
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


