Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D84395525
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:53:24 +0200 (CEST)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnarb-0007iA-Jd
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapU-0004tJ-RZ
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:12 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:46070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapT-0003o4-6y
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:12 -0400
Received: by mail-pf1-x42a.google.com with SMTP id d16so8166434pfn.12
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6OHb5vr+xooTxpqfVh+yYzyV8snT/0WRGHVgk3YW6HY=;
 b=R+eTsrt0eRtz8Gdf4CHAOrxrZd9tAp0NcYqQ1ZyaySCrLRgbu7EGgrWFaIXNpYsHsb
 6dmWJe7u9D4tYxHmpMyv5hhyPVzPuoKd1G9YgdLIkFmu4DMILdxIDNgF8eHIpR+tnqGj
 dWeViTWetRlRShswBgvxRREKfNXjLfeNG+nrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6OHb5vr+xooTxpqfVh+yYzyV8snT/0WRGHVgk3YW6HY=;
 b=JcMdk8FdjH5Qj/LQdLbqPDBJZZo14RIQC+yJzwlcGiUaCdbH/UFYRKOyedV5ZGHLAo
 EuwKLJ5SngrrMBnS8zIMW4ofEM7jUQQ08AKOQmEp7JVN9D+e7u2tJJMGKMPzffRV0iCy
 qVNUzcxZrRcJjDQy6Pvbc5HKJWBCLFZSbjxJKPyD7YGDd9qeD1gcfVC7ubj2TsFFfhZ5
 nG5C7eFJ+K36BHK9PM4iejHAmRn9xgv6jYEkZFQvfe7NB+jSTsGvLwRyNlvLyy+E2Uny
 hLogPTMhPqG++0e5VC9zWMow4o/Aw88fcIph5h9J+QRAZER6WxuUi+upwdNBPDeH1TlF
 Njkg==
X-Gm-Message-State: AOAM533891SorIeESkDScwepcF6HYx1vmpLXppXdL9wuHQDZJVArjtPc
 hmhCuJjMrRYa2NOLXYLMPJt0NffqVFdW7A==
X-Google-Smtp-Source: ABdhPJxPE+wmCj5VB+nRBANPbfsgM1NM6R7fg5IPJ1chofrPHojnjF1aHyUyhrHxEsLTs7pBDdIM2A==
X-Received: by 2002:aa7:820f:0:b029:2e9:3aea:2e05 with SMTP id
 k15-20020aa7820f0000b02902e93aea2e05mr15315498pfi.13.1622440269800; 
 Sun, 30 May 2021 22:51:09 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:09 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 03/11] linux-user: dup the execfd on start up
Date: Mon, 31 May 2021 14:50:10 +0900
Message-Id: <20210531055019.10149-4-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=yamamoto@midokura.com; helo=mail-pf1-x42a.google.com
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
 linux-user/main.c    | 10 +++++++++-
 linux-user/qemu.h    |  2 ++
 linux-user/syscall.c |  5 ++---
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4dfc47ad3b..a9d02f9583 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -55,6 +55,7 @@
 #endif
 
 char *exec_path;
+int exec_fd = -1;
 
 int singlestep;
 static const char *argv0;
@@ -693,7 +694,14 @@ int main(int argc, char **argv, char **envp)
      * Manage binfmt-misc open-binary flag
      */
     execfd = qemu_getauxval(AT_EXECFD);
-    if (execfd == 0) {
+    if (execfd > 0) {
+        /*
+         * dup execfd to a global so that it can be used after loader_exec
+         * closes it.
+         */
+
+        exec_fd = dup(execfd);
+    } else {
         execfd = open(exec_path, O_RDONLY);
         if (execfd < 0) {
             printf("Error while loading %s: %s\n", exec_path, strerror(errno));
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


