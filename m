Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC839552A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:55:41 +0200 (CEST)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnato-0005Bh-1r
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapc-0005KK-AC
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:20 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapa-0003tf-DY
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:19 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t8so1332632pgb.9
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QiVXcm0ooVlb13HKGZjjy0yp8OcOQBWPELFyhh4ee78=;
 b=U6GtVCZFfjz2EupehhRqV6Z47mFdvElNaKSOLZgJ7Esj6COuUGrXYq+9I/a2y8BNKG
 H5JNkIv34wQOJFC0IWPjYph8/4PRq4MmRtNtRjtxL6g5fPw0gk/PxfiI9e2gp6BtB+5Y
 KjyRT0UfJyoBrN6rXOhKwXrnCUbhoc9Uo+tuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QiVXcm0ooVlb13HKGZjjy0yp8OcOQBWPELFyhh4ee78=;
 b=o88PKxC9a2tmWFb4QZrxOb3LQchHx93+cUbiiy6NL5ppk/xO8C3j5+PMnBBv2C4dSp
 EFnl9CIu6w3BZqUyFQivX/2KyuhvNjqYTe/qb55++RsasWmtLHSeEyd7Jg2TR1MgzBe1
 +tfm010vFWCZkzjRrIYtQofooPI7buRgFSfI8VxvFRX1W+iRi3NsRcVC/u2HZyLzN6mt
 TVaN68U/wVZmY7cV0t1AzpTT6jbdGcxMOoXLPCjOiJn8GLSEqYryW4RGcII1IQqRdtzR
 fcJJpz6BhCEPf0T/qqzBNbkJHlbgXM0BNUImJbk9DmEf4Lx/ZZG6czxnX7l4XLNUHu72
 A4HQ==
X-Gm-Message-State: AOAM530AkgnsTCLu0dByt7TpWKVd7qa+G8R4IAIbWuTFuV9cXGw3TEoL
 85BJ8+2h0vrXHxvI7O1Hd1Qmtx0ubZHGVA==
X-Google-Smtp-Source: ABdhPJxHcB1cpYxCpPTnJslReTzUNzvoGWmo9Fqhe96/hl7fdeJxHVHW+pH//DTxYP6KnWMwTPyRxQ==
X-Received: by 2002:a62:3001:0:b029:2e9:39d0:46cd with SMTP id
 w1-20020a6230010000b02902e939d046cdmr15197833pfw.47.1622440276933; 
 Sun, 30 May 2021 22:51:16 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:16 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 08/11] linux-user: Implement exec of /proc/$pid/exe of qemu
 process
Date: Mon, 31 May 2021 14:50:15 +0900
Message-Id: <20210531055019.10149-9-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=yamamoto@midokura.com; helo=mail-pg1-x52a.google.com
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

dockerd makes runc invoke dockerd using /proc/$pid/exe.
This commit makes it work when both of dockerd and runc are
emulated by qemu linux-user.
In that case, we (the qemu interpreting runc) need to invoke the
real executable (dockerd), where /proc/$pid/exe in question is
the qemu command interpreting dockerd.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/syscall.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 86b12cc8b4..6f9161dbe4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7988,10 +7988,69 @@ static int open_self_auxv(void *cpu_env, int fd)
 
 static const char *get_exe_path(int pid, char *buf, size_t bufsize)
 {
+    ssize_t ssz;
+    int fd;
+
     if (pid == getpid()) {
         return exec_path;
     }
 
+    /* dockerd makes runc invoke dockerd using "/proc/${dockerd_pid}/exe". */
+    snprintf(buf, bufsize, "/proc/%d/cmdline", pid);
+    fd = open(buf, O_RDONLY);
+    if (fd == -1) {
+        return NULL;
+    }
+    ssz = read(fd, buf, bufsize);
+    if (ssz != -1) {
+        const char *argv0;
+        const char *argv1;
+        const char *cp;
+        const char *ep;
+        const char *slash;
+
+        cp = buf;
+        ep = cp + ssz;
+
+        argv0 = cp;
+        while (*cp != 0) {
+            cp++;
+            if (cp >= ep) {
+                goto fail;
+            }
+        }
+
+        cp++;
+        if (cp >= ep) {
+            goto fail;
+        }
+
+        argv1 = cp;
+        while (*cp != 0) {
+            cp++;
+            if (cp >= ep) {
+                goto fail;
+            }
+        }
+
+        /*
+         * XXX a bit too loose detection of qemu.
+         * maybe we can compare /proc/$pid/exe with ours.
+         */
+        slash = strrchr(argv0, '/');
+        if (slash != NULL) {
+            argv0 = slash + 1; /* basename */
+        }
+        if (strncmp(argv0, "qemu-", sizeof("qemu-") - 1)) {
+            goto fail;
+        }
+
+        close(fd);
+        return argv1;
+    }
+fail:
+    close(fd);
+
     return NULL;
 }
 
-- 
2.21.1 (Apple Git-122.3)


