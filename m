Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27A38E566
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 13:25:16 +0200 (CEST)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll8hu-0006G5-Sy
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 07:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ll8gM-0005YT-34
 for qemu-devel@nongnu.org; Mon, 24 May 2021 07:23:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ll8gK-0004lK-1W
 for qemu-devel@nongnu.org; Mon, 24 May 2021 07:23:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id t206so14732636wmf.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 04:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N8cOTqyCKuHxxXbbqblShpEqwML2XUs9Ugh7l6qxcUA=;
 b=V1Yo2kiAD7iuoFPVUfNv7eXDzsXcSK2N2tohXehhlH321CV0IAdlV731oeKO/7tuVt
 pGpVev7MTRRXoKvtwbRrz5KuW9Eelacq8XwxTeUZXS3hrPRu750QlR2c7c169Wo0ex3k
 LGGMVKvhqWNVT2Te1oAAKmsD9LYXEJun3QqYZrO1chJZLoKwEuVIXZBOSREBAYBiQKLy
 jyc34MZl5/lkBBBRu1odHqPmRwJ5Rfr9wqpcouoxjSxWHGiDM6hKfh7LvegjHzQLzVCD
 VKmqHRN9DAIiaOCB6g4bkBkKOCK0FYxt6fuDuJyQ0o6KJoGMWpBYBT9iD3DnQSrTaiDv
 PtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N8cOTqyCKuHxxXbbqblShpEqwML2XUs9Ugh7l6qxcUA=;
 b=KizmcoGZ2ntXAskPCq6NYuS0CF24xx39EHqSd+GtZ31s/nWiU6D8c6WAqsWMlzX/0H
 jb0OZayzQQvRWtsgGyxmoaBHkk724YrWPLmhL3Nalq3Ps2AgUZNnmZxGKiduRU/KOGsy
 Ko9jKyy9q4Ks+CLO9yfTlqABUknKFiqjXv1NNJ1ub3YPWHmoCID1+PjJGqKLkQEnm+N0
 VDBRyZook/BwjXhha6T3vJC0jpvltgRqGhZ1Ldbml1fz2jwMIe/mAsgEm33eK5ljLdKX
 pvsfcmXjC+Wi2cqPEuqvkMNVyDe2dh/RcMw6nCC3RlX3gCOv3x2VzSgFFl9Eoh7kfNsp
 jrYw==
X-Gm-Message-State: AOAM533wUKXfXra2eeJWE1gLXe4/FZBIUriNUX05gKPL6yhMGb7Nel/u
 oBcsWBYQkHyVMPKDKIEwl01lCw==
X-Google-Smtp-Source: ABdhPJw8qHLme01Bx7hJOm67b7GRQ4xOAp32MaKyEQ1/gDLQVra5ZV4YeeBz2nEQl9W83RIz80TnYw==
X-Received: by 2002:a7b:c778:: with SMTP id x24mr19304208wmk.23.1621855413981; 
 Mon, 24 May 2021 04:23:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d14sm5370598wra.5.2021.05.24.04.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 04:23:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CFD31FF7E;
 Mon, 24 May 2021 12:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] linux-user: glib-ify is_proc_myself
Date: Mon, 24 May 2021 12:23:23 +0100
Message-Id: <20210524112323.2310-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, yamamoto@midokura.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not sure if this is neater than the original code but it does
remove a bunch of the !strcmp's in favour of glib's more natural bool
results. While we are at it make the function a bool return and fixup
the fake_open function prototypes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/syscall.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e739921e86..18e953de9d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7987,33 +7987,27 @@ static int open_self_auxv(void *cpu_env, int fd)
     return 0;
 }
 
-static int is_proc_myself(const char *filename, const char *entry)
+static bool is_proc_myself(const char *filename, const char *entry)
 {
-    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
+    if (g_str_has_prefix(filename, "/proc/")) {
         filename += strlen("/proc/");
-        if (!strncmp(filename, "self/", strlen("self/"))) {
+        if (g_str_has_prefix(filename, "self/")) {
             filename += strlen("self/");
-        } else if (*filename >= '1' && *filename <= '9') {
-            char myself[80];
-            snprintf(myself, sizeof(myself), "%d/", getpid());
-            if (!strncmp(filename, myself, strlen(myself))) {
-                filename += strlen(myself);
-            } else {
-                return 0;
+        } else if (g_ascii_isdigit(*filename)) {
+            g_autofree char * myself = g_strdup_printf("%d/", getpid());
+            if (!g_str_has_prefix(filename, myself)) {
+                return false;
             }
-        } else {
-            return 0;
-        }
-        if (!strcmp(filename, entry)) {
-            return 1;
+            filename += strlen(myself);
         }
+        return g_str_has_prefix(filename, entry);
     }
-    return 0;
+    return false;
 }
 
 #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN) || \
     defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
-static int is_proc(const char *filename, const char *entry)
+static bool is_proc(const char *filename, const char *entry)
 {
     return strcmp(filename, entry) == 0;
 }
@@ -8097,7 +8091,7 @@ static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags,
     struct fake_open {
         const char *filename;
         int (*fill)(void *cpu_env, int fd);
-        int (*cmp)(const char *s1, const char *s2);
+        bool (*cmp)(const char *s1, const char *s2);
     };
     const struct fake_open *fake_open;
     static const struct fake_open fakes[] = {
-- 
2.20.1


