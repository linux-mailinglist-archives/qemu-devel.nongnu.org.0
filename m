Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592C38E084
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:56:55 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2e5-00051v-OR
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cW-0002r9-Sp
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:16 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cV-0003dr-7B
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:16 -0400
Received: by mail-pf1-x435.google.com with SMTP id q67so2798942pfb.4
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 21:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m89buCPgpozLCxeMx0IXmxkOBtSNDh85t/lIV1xW87I=;
 b=C7Z9xryBcnYbATE6fvhIKU5L1SoRVtpiMwIMxdd78xO0c49bomE7JzVOL3qaCuOsYT
 CGEOFpVZW31KLJBhV4d9iBVoLuM0PLHVBwO+uMgRnArxZbTxxKi5kYWSRSO2oYjWzUFq
 GOkjvAW+ebX/MJfGsVTVJkffcKbiTOba4jH/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m89buCPgpozLCxeMx0IXmxkOBtSNDh85t/lIV1xW87I=;
 b=e9UNw0sDE2/rBUTaFCGCDOhEV03FSvR9e3cKawtF46FPJDdlzNtpv92rJ/EtqQ2A/X
 S6hWEoRwrWgCdyMhOoVMy7kneR+X1+nwdETVk0fvGtnw6XUh+wPICJ6AfD0XNSuq7Jgx
 yKELqiuXWWix2sK6x0x8toE49OrswzKhIEVfwFY5RK3FPNzultAdCSRqa9yqlK/fwZ1P
 DSR7hrIMthJtBo1yuLcraY2YPgE3o/xbsbVQNczxih20mAr3GGdwMd0KI+LA/86Hseke
 PVQDmE1cges9dJaTn7ffi0LiBbh8EtoOkrld/4x8GR1gejX3uYIcr2c0J3OK7SoacBJB
 EKqg==
X-Gm-Message-State: AOAM531HEqCxLNrtPaFpELYkZWlNA7rk+gbtcG4D/rld9Cg4vOzGT1yH
 dgwCZLGOmat4qyX2n97tC9dUAXV2XWAxTg==
X-Google-Smtp-Source: ABdhPJxVI07QWih+uncYTBFIt7HPbCWU3PUVKKui0PTHkX3qMr2rJbNHLDVzF9MPPfdO3xqHUG1yDA==
X-Received: by 2002:a63:fc20:: with SMTP id j32mr11718223pgi.8.1621832113586; 
 Sun, 23 May 2021 21:55:13 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id 24sm10040142pgz.77.2021.05.23.21.55.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 May 2021 21:55:13 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 4/5] linux-user: dup the execfd on start up
Date: Mon, 24 May 2021 13:54:10 +0900
Message-Id: <20210524045412.15152-5-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210524045412.15152-1-yamamoto@midokura.com>
References: <20210524045412.15152-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=yamamoto@midokura.com; helo=mail-pf1-x435.google.com
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

So that it can be used for other purposes (e.g. syscall.c)
after the elf loader closed it.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/main.c    | 8 ++++++++
 linux-user/qemu.h    | 2 ++
 linux-user/syscall.c | 5 ++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 1f9f4e3820..86ddba8b62 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -56,6 +56,7 @@
 
 char *exec_path;
 char exec_path_store[PATH_MAX];
+int exec_fd = -1;
 
 int singlestep;
 static const char *argv0;
@@ -833,6 +834,13 @@ int main(int argc, char **argv, char **envp)
     cpu->opaque = ts;
     task_settid(ts);
 
+    /*
+     * dup execfd to a global so that it can be used after loader_exec
+     * closes it.
+     */
+
+    exec_fd = dup(execfd);
+
     ret = loader_exec(execfd, exec_path, target_argv, target_environ, regs,
         info, &bprm);
     if (ret != 0) {
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 3b0b6b75fe..ee4e9a1779 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -160,6 +160,8 @@ typedef struct TaskState {
 } __attribute__((aligned(16))) TaskState;
 
 extern char *exec_path;
+extern int exec_fd;
+
 void init_task_state(TaskState *ts);
 void task_settid(TaskState *);
 void stop_all_tasks(void);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 14a63518e2..2947e79dc0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8117,12 +8117,11 @@ static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags,
     };
 
     if (is_proc_myself(pathname, "exe")) {
-        int execfd = qemu_getauxval(AT_EXECFD);
-        if (execfd) {
+        if (exec_fd != -1) {
             char filename[PATH_MAX];
             int ret;
 
-            snprintf(filename, sizeof(filename), "/proc/self/fd/%d", execfd);
+            snprintf(filename, sizeof(filename), "/proc/self/fd/%d", exec_fd);
             ret = safe_openat(dirfd, filename, flags, mode);
             if (ret != -1) {
                 return ret;
-- 
2.21.1 (Apple Git-122.3)


