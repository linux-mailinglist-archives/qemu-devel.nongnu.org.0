Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F82508F26
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:12:01 +0200 (CEST)
Received: from localhost ([::1]:38208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEo2-0006ti-R0
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEie-0005FX-55
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:24 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:42602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEic-0001AS-8z
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:23 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z6-20020a17090a398600b001cb9fca3210so2778041pjb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1EvO7DptCQKG7ltKeFYJuF4bJOAsl84mmallsluEFGk=;
 b=yb9pJcrstO5elkIWJGdlXhApKnmVQx+0T+YG6+QJpDdk5WzUkaTEcNRfwwTx3lJ+rQ
 +YWAQtm6ryNYnDjjLY6p/kF9aC/a6MT+hAOWFuDFqP0ckntuQky8dbIqLdoh3VG/G0Lz
 6rp2nGOj9cCSSgPX2opwTqRkMfyYrjDtHN2bvDUj8wJyg6nSrO9OvtSrRJdF2YYqFugO
 ZOvFWbaKrW6j/0eUqF/4zmuohatGA7uKjJRUB1BJ4NHZDrQ0ju7e7vNyL7JjzBwy9WCj
 VQI4POrcK5yBPbe39ObYgY9l4WW2jdQbUVrt2QwqZfQWJpMOaWCc88s+B2TRZUWTffSk
 lmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1EvO7DptCQKG7ltKeFYJuF4bJOAsl84mmallsluEFGk=;
 b=ptM6oSysRr+L0Dl2lFVh3V17a3j73YCM5KtcCsVoVeSsWiWqaXbx9oiQW6SCPNeUgi
 kRqOCqzxBt4+rV0PgtzOj69SyNWMMg1VlSJrMX5KZKUrXiTV5pFm50mS2PkKRu9PIsgr
 w69uSpX+dBLLF/qQYNn0v4ELu6wWYYdJd+HLR6WNKo7sYNFs8SgBHT2ur12ERqaVWEuH
 Feep1IjXxPwhNgHREMSOhBRchc8sdMTdXskrtQti2zeYzYvD386jiidLT1GeV6HAsRtC
 x0r19xuZSJHam1VYDuECHOQoSDSP5GNoe3VdXyA0jmudZFhk23uyxHDV9oaJ/KXlDnzy
 kkXg==
X-Gm-Message-State: AOAM533P2ncLUMd2JEFy90upYkCXTbY9K0ag1UZ/SGCDWtrO9akNLPfK
 7501+R9ZYtG63As7H3OWrw3RdZlpEBzEMg==
X-Google-Smtp-Source: ABdhPJylWf4aMEAW4GHK4Z4caFzaVxQ7rHgun7deNyVEVJzoUdYn/hjR2hRdRSyr0iD3AZBuHDMNng==
X-Received: by 2002:a17:90b:1bd0:b0:1d2:a488:7af0 with SMTP id
 oa16-20020a17090b1bd000b001d2a4887af0mr5808449pjb.125.1650477981004; 
 Wed, 20 Apr 2022 11:06:21 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/39] util/log: Drop manual log buffering
Date: Wed, 20 Apr 2022 11:05:40 -0700
Message-Id: <20220420180618.1183855-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

This buffering was introduced during the Paleozoic: 9fa3e853531.

There has never been an explanation as to why we may not allow
glibc to allocate the file buffer itself.  We certainly have
many other uses of mmap and malloc during user-only startup,
so presumably whatever the issue was, it has been fixed during
the preceeding 18 years.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-2-richard.henderson@linaro.org>
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
2.34.1


