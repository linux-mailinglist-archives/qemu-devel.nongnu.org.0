Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFBB4030AF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:04:40 +0200 (CEST)
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjCp-0000Fy-1h
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2N-0005kq-Cc
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:52 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:36616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2K-0000mZ-OB
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:51 -0400
Received: by mail-il1-x141.google.com with SMTP id x5so175461ill.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=USbY3TMkmsnljwVWGizCiItJwGHI+n9Fqx3miK9oRCk=;
 b=UqhkH97EtjLrNJk6xDVKW2qHuF5t1KjbwHmkwW8Nm++lmfF6QfNSbsJ9xH2JNxiO2s
 /czMHZAv27Y7GGCkvFu5vB/Hh3nOWnnpyNFJdQSNnKKLCzbSUKOWBIEYeoHw2g+MwnNm
 3vjy9Aj5prG7av0KAjex3Fy0vxIiOx7PMYZlC7nDywAnOe+DZ6PyrzmosfY8wm5tBdRV
 imnhge8474MA3ciPLaZSgegzRrFzImARukLtX3ox7aSpZrqOayiwEwQhYF46ehsndOeG
 onSfMLKgeEORUdt5ldo4chHZHUXo6GEts1sS5/0Pmtc4uQTgO8BFiwHfbtVCLcvwmKmv
 Vekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=USbY3TMkmsnljwVWGizCiItJwGHI+n9Fqx3miK9oRCk=;
 b=G50ZwS9GabDn55mxC1TuGKWeil9X+5Vi8ZaLiMFzsC9p0ZxzD0VslWmwrON8qIPH35
 yC/kAJhXVE8TwCY44LGx6sIk6eUND/HYAZ0Vz2VIRY5z5eXQMsnjrUmRRErXooCA6oyV
 wRsZiH1IPNFuZH40l6qg961uyX5/cudM0ppBABsKHBjmvlm19MHmy3BC8nWdDd5dmNNC
 HIx5EsCK/EV9xlKdGB3SjzMt91kC/IiLuhaGkETcqRVsnX6JoFG6XynyDksPCnE21Ro+
 yLpG3y8bQPWHPrr4bScuSSdn4CIVqBNcSoW5Zp0yjW3K5/ChR6rjVSHyRtSkQaw7tNKz
 tTzA==
X-Gm-Message-State: AOAM533CesWZpcMl9bCf0F29zp5d65LSuEVd6iw+T8xPD6Q9iyp4Zj+T
 8i296VVE7pbYvMmgALxzdXIH3VHLQNsegxRKtRA=
X-Google-Smtp-Source: ABdhPJwCHxPjqbPTWlYI+f320lQLn653+OpjNZAFRse2UOzKs+ES4ERUfMnm8xQeWC0PG5FSnrM0qw==
X-Received: by 2002:a05:6e02:1e05:: with SMTP id
 g5mr316030ila.48.1631051627360; 
 Tue, 07 Sep 2021 14:53:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:46 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 10/42] bsd-user: implement path searching
Date: Tue,  7 Sep 2021 15:53:00 -0600
Message-Id: <20210907215332.30737-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::141;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x141.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Use the PATH to find the executable given a bare argument. We need to do
this so we can implement mixing native and emulated binaries (e.g.,
execing a x86 native binary from an emulated arm binary to optimize
parts of the build). By finding the binary, we will know how to exec it.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsdload.c | 36 +++++++++++++++++++++++++++++++++++-
 bsd-user/qemu.h    |  3 ++-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 379015c744..32f7fd5dec 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -139,21 +139,55 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
     return sp;
 }
 
+static bool is_there(const char *candidate)
+{
+    struct stat fin;
+
+    /* XXX work around access(2) false positives for superuser */
+    if (access(candidate, X_OK) == 0 && stat(candidate, &fin) == 0 &&
+            S_ISREG(fin.st_mode) && (getuid() != 0 ||
+                (fin.st_mode & (S_IXUSR | S_IXGRP | S_IXOTH)) != 0)) {
+        return true;
+    }
+
+    return false;
+}
+
 int loader_exec(const char *filename, char **argv, char **envp,
                 struct target_pt_regs *regs, struct image_info *infop,
                 struct bsd_binprm *bprm)
 {
+    char *path, fullpath[PATH_MAX];
     int retval, i;
 
     bprm->p = TARGET_PAGE_SIZE * MAX_ARG_PAGES;
     for (i = 0; i < MAX_ARG_PAGES; i++) {       /* clear page-table */
         bprm->page[i] = NULL;
     }
-    retval = open(filename, O_RDONLY);
+
+    if (strchr(filename, '/') != NULL) {
+        path = realpath(filename, fullpath);
+        if (path == NULL) {
+            /* Failed to resolve. */
+            return -1;
+        }
+        if (!is_there(path)) {
+            return -1;
+        }
+    } else {
+        path = g_find_program_in_path(filename);
+        if (path == NULL) {
+            return -1;
+        }
+    }
+
+    retval = open(path, O_RDONLY);
     if (retval < 0) {
+        g_free(path);
         return retval;
     }
 
+    bprm->fullpath = path;
     bprm->fd = retval;
     bprm->filename = (char *)filename;
     bprm->argc = count(argv);
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 5237e35f9c..6b601ce4b5 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -124,7 +124,8 @@ struct bsd_binprm {
         int argc, envc;
         char **argv;
         char **envp;
-        char *filename;         /* Name of binary */
+        char *filename;         /* (Given) Name of binary */
+        char *fullpath;         /* Full path of binary */
 };
 
 void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
-- 
2.32.0


