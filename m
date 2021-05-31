Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5108E395529
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:55:38 +0200 (CEST)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnatl-0004yI-B3
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapZ-00059Z-Fe
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapX-0003rZ-Ii
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so7972147pjp.4
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dlWjyYn6jZhO5w9ByfPHmWQImE5zU40oNP6aZuC/oSw=;
 b=Gv4g6Jh5CSxDG0PgPzkb8TV0/+UHm9el30zb+Ym5l2h4pHIVFGDUmCkUYUOzadtsvv
 57r7bgSYx/N/W8XiTWpcUapC8Ii6X6rKKyU+Qc5U7o9fb/ignAyfgnGuDj1XdHqHRC6Z
 7akG834PYSJ1YuNI3yPWSX6KaUswoLYHGOlzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlWjyYn6jZhO5w9ByfPHmWQImE5zU40oNP6aZuC/oSw=;
 b=cZDaZ0qmpXCn89ce8MSCZX78Uev9OMKo1szrhauiQIbwXUuQ/oBd5WjhQ2QQSWHOjI
 yZJc3Wnfjgemvi3k6PAM/3LCY7U708uug5Qi4cRO1E3UUMZvmDPIIQxvp9phC9JLXUva
 FhffQk0AAKqWDq3NZ8Ipql1DMuZNCfrRpm1DJ6RYu9MRv6evFGcGgxUeb9wDnh6dXNGd
 tTxBgbzJZhh+9QJQmFG0wiQ65eRRzozm0vCAY9HeWa6pGVF1g4WWhNDEqrfOnyB7kd6U
 qdYtRoUiHlFTAft+/SFZaweaAiwP2NRXhLDVDZhUAO0BH0qH6ICUE5aTq3mh7FHr3Mvn
 TEIg==
X-Gm-Message-State: AOAM532dqM1TK3lFvL7HGALXUsiK+CpK8xIkUTTEGGTemCbUIRjssC7m
 RFtQoyja1gkH7Ti9l0jv3M7BFFeuzCjgeA==
X-Google-Smtp-Source: ABdhPJyTors0eOKSYyI8SaR7GIuQM1Kw0Im0e0mrDUHlCUiVrqnt0rzOP+gNXUyQGw8dHL2rWp8nNw==
X-Received: by 2002:a17:902:e9cb:b029:101:cebc:b8d with SMTP id
 11-20020a170902e9cbb0290101cebc0b8dmr10973690plk.5.1622440274098; 
 Sun, 30 May 2021 22:51:14 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:13 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 06/11] linux-user: add get_exe_path
Date: Mon, 31 May 2021 14:50:13 +0900
Message-Id: <20210531055019.10149-7-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=yamamoto@midokura.com; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refactor to prepare the special cases for /proc/$pid/exe where
pid is not the calling process.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/syscall.c | 48 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 51144c6d29..999760448d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7986,6 +7986,45 @@ static int open_self_auxv(void *cpu_env, int fd)
     return 0;
 }
 
+static const char *get_exe_path(int pid, char *buf, size_t bufsize)
+{
+    if (pid == getpid()) {
+        return exec_path;
+    }
+
+    return NULL;
+}
+
+static int is_proc_file(const char *filename, int *pidp, const char *entry)
+{
+    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
+        int pid;
+
+        filename += strlen("/proc/");
+        if (!strncmp(filename, "self/", strlen("self/"))) {
+            pid = getpid();
+            filename += strlen("self/");
+        } else if (*filename >= '1' && *filename <= '9') {
+            pid = 0;
+            while (*filename >= '0' && *filename <= '9') {
+                pid = pid * 10 + *filename - '0';
+                filename++;
+            }
+            if (*filename != '/') {
+                return 0;
+            }
+            filename++;
+        } else {
+            return 0;
+        }
+        if (!strcmp(filename, entry)) {
+            *pidp = pid;
+            return 1;
+        }
+    }
+    return 0;
+}
+
 static int is_proc_myself(const char *filename, const char *entry)
 {
     if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
@@ -8492,6 +8531,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             abi_ulong addr;
             char **q;
             int total_size = 0;
+            int pid;
+            char path_store[PATH_MAX];
 
             argc = 0;
             guest_argp = arg2;
@@ -8552,8 +8593,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
              * program's problem.
              */
             path = p;
-            if (is_proc_myself(path, "exe")) {
-                path = exec_path;
+            if (is_proc_file(path, &pid, "exe")) {
+                path = get_exe_path(pid, path_store, sizeof(path_store));
+                if (path == NULL) {
+                    path = p;
+                }
             }
             ret = get_errno(safe_execve(path, argp, envp));
             unlock_user(p, arg1, 0);
-- 
2.21.1 (Apple Git-122.3)


