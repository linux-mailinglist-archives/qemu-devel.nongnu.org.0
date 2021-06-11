Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2058A3A4B46
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:36:41 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqhc-0006yG-63
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqex-0004Hr-1B
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:55 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqeu-0006Q6-2v
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:33:53 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t17so3667574pga.5
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QwcLIow8ryYHhtEXT5F43ejpzVNyBb+0Qw4NSoljESU=;
 b=GiQxpIHmT416Vyivq/T1qh334fJp+gTS+XNUzD6HvetHXVKysVv0c00u91HQwgCg0H
 TksbrN3Efo6RfyLnV6hFRzBYfTJAec8fgJ6WHBltafRTAS+yyh+bDjZEqsJK6tYpcqXB
 3iGjG+95pAPZukqPhuFhiwKNsG0Y08Nz8dgpAO1UN7nHQwJSa069o6xQhcUOzUwnTD6V
 YwU4N+rX8inNLvWLP0/rQZlBOE6P3rJB+vlw06/HDYXxK3Hv2jeI0CJNN5hmr583aW4a
 6nbkFPwtLUQE67NHo+QECsG4B0Qz6hStLzVYRCIwBU57Anc4hV4xwEHuZ94ZfKCSJ1yY
 2Rfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QwcLIow8ryYHhtEXT5F43ejpzVNyBb+0Qw4NSoljESU=;
 b=Hpdk1yN4VmkXEw0fH71ngE2WxljeRCyfopxIdSeUcOY4DMsgI4nXU+ZElRPQspubnA
 Znf2EbJ7txLnKpcpM2lJQBSdC0gzF3q1NvdGqEvs51+oSL0HgpFxbCDC3qVwvLikqxsl
 jmWc995/OQEt13oBNhRQJaWvh1XqVUdSajLUVeVSSviQ0k1jvOtglmMxbBxuYP/Q3gOr
 6ll/PBHUkVRAaRaIR6W/bYIXIXTr9mOZuST6ESx0EilEZNa6kRuApdLJmdQqEqfD1dNx
 lmQwOcYdoWE8wQ7B94OhjYhN/4x3U1CslroL5Tkyn0vyKCTHctBRTwlvC83DZ5yGOqX2
 7jzA==
X-Gm-Message-State: AOAM530cKyK8RiM86lf+Pa+cPE4CxI4i30wETFIFt0sxTqfOp131/Pvg
 DH9EvtAY/ohS4N7X/lzuPLSVy8SWgaCoCg==
X-Google-Smtp-Source: ABdhPJz/E3wBtTNuMfQe+lstYlZQayrWoaed7JrEqvAFnIh6BjmL5tFYtONyBGtJSi/uLSdGS954Ig==
X-Received: by 2002:aa7:9f43:0:b029:2f1:c336:8ac8 with SMTP id
 h3-20020aa79f430000b02902f1c3368ac8mr10697618pfr.11.1623454430679; 
 Fri, 11 Jun 2021 16:33:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m134sm6349606pfd.148.2021.06.11.16.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:33:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] util: Pass file+line to qemu_rec_mutex_unlock_impl
Date: Fri, 11 Jun 2021 16:33:43 -0700
Message-Id: <20210611233347.653129-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611233347.653129-1-richard.henderson@linaro.org>
References: <20210611233347.653129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@liaro.org>

Create macros for file+line expansion in qemu_rec_mutex_unlock
like we have for qemu_mutex_unlock.

Signed-off-by: Richard Henderson <richard.henderson@liaro.org>
---
 include/qemu/thread.h    | 10 +++++++++-
 util/qemu-thread-posix.c |  4 ++--
 util/qemu-thread-win32.c |  2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index 2c0d85f3bc..460568d67d 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -32,7 +32,7 @@ void qemu_rec_mutex_init(QemuRecMutex *mutex);
 void qemu_rec_mutex_destroy(QemuRecMutex *mutex);
 void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line);
 int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line);
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex);
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line);
 
 typedef void (*QemuMutexLockFunc)(QemuMutex *m, const char *f, int l);
 typedef int (*QemuMutexTrylockFunc)(QemuMutex *m, const char *f, int l);
@@ -110,6 +110,9 @@ extern QemuCondTimedWaitFunc qemu_cond_timedwait_func;
 #define qemu_mutex_unlock(mutex) \
         qemu_mutex_unlock_impl(mutex, __FILE__, __LINE__)
 
+#define qemu_rec_mutex_unlock(mutex) \
+        qemu_rec_mutex_unlock_impl(mutex, __FILE__, __LINE__)
+
 static inline void (qemu_mutex_lock)(QemuMutex *mutex)
 {
     qemu_mutex_lock(mutex);
@@ -135,6 +138,11 @@ static inline int (qemu_rec_mutex_trylock)(QemuRecMutex *mutex)
     return qemu_rec_mutex_trylock(mutex);
 }
 
+static inline void (qemu_rec_mutex_unlock)(QemuRecMutex *mutex)
+{
+    qemu_rec_mutex_unlock(mutex);
+}
+
 void qemu_cond_init(QemuCond *cond);
 void qemu_cond_destroy(QemuCond *cond);
 
diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index 8e2b6653f5..d990826ed8 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -139,9 +139,9 @@ int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
     return qemu_mutex_trylock_impl(mutex, file, line);
 }
 
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
-    qemu_mutex_unlock(mutex);
+    qemu_mutex_unlock_impl(mutex, file, line);
 }
 
 void qemu_cond_init(QemuCond *cond)
diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
index cb5aa2018c..52eb19f351 100644
--- a/util/qemu-thread-win32.c
+++ b/util/qemu-thread-win32.c
@@ -105,7 +105,7 @@ int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
     return !TryEnterCriticalSection(&mutex->lock);
 }
 
-void qemu_rec_mutex_unlock(QemuRecMutex *mutex)
+void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
 {
     assert(mutex->initialized);
     LeaveCriticalSection(&mutex->lock);
-- 
2.25.1


