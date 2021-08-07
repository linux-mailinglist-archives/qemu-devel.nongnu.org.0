Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7536D3E3734
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:50:12 +0200 (CEST)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUCp-0000wh-Ga
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5x-0006be-DP
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:05 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5v-0004oA-U1
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:05 -0400
Received: by mail-io1-xd42.google.com with SMTP id y1so19935003iod.10
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/m+LrsTqQXACGZ2lhzaNittRoT4FuKArZPmmbyQaTCo=;
 b=d3/wHM+rSJyrWFYXEth2fvEu1tE2SHhDyZv+GqG8iMOQSvXW4DyLe0AR2vwg1pxEse
 FMC84+I5DKoy7mmiDw6Lh36WaoDY1jXMZeW1tSWXRZgB1pJhYGm35TmFcTpcckh7sCDQ
 9ju2TXwSLrNLlHR03+NDafkNs1Uvb1skSaaQLONnpmckXSHjqxFuKoHNsZ+OgF/AWvwO
 VOOH1JEf8TusgI1TQnYuiCbRkjoHGLuYRXIkSMzZaP155zhzrb+BcwpdVcWTPd/vJbIc
 RH+k/GJRpy9p+icjzqza0fZEJrOqEUfAn2lDnXDWDhRinKcqTkJinSC2eKKaMV2HdwB5
 5jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/m+LrsTqQXACGZ2lhzaNittRoT4FuKArZPmmbyQaTCo=;
 b=ENC8GL9iF63RBBawE2GyXSWTEepBwsIxpowGErYH8/SGRcak38xMJ9RvlyDs3ILput
 5vhuJOdTBQGvZm5rtwXO6jc9u7RaA7Kse04eq8ULkBUD0tTEES9BlObAWbLBknL7FCwF
 7lH95TKIY+MjhGH7gHtqyqtmnHQ+rQB+OGtvw4nZJjsgGFc9IbNaiOI5zf9vBiwX8m5m
 H77uz4DFQ7SzgSZqziJs44UEQv2OtXGGHbt/jqVgrv3ZzvnYYVCv1Mw5q/J6KpqdixNu
 DPSdrDcjaAHey8Dgv+ZJpfQBR1YgZvDt8lx1et/ZtNdEKhIgRuTvliAizM1IBQXJnSYO
 O6NA==
X-Gm-Message-State: AOAM531gXjMyn1LAJfTO+lNJe30NvVYTqKDSA/TXQTpCZ3mOKwHwhj5e
 G9DNSpdFbjoLoiTWhwgHmz4lFWPPICL0jZcl
X-Google-Smtp-Source: ABdhPJwOTRpJToYwZvjyX3WrkCAnELNDMpg33YH1yX5aXWf1wIzP1ErTsbJ4tY3MthvXx9BNYPWnfQ==
X-Received: by 2002:a05:6e02:190d:: with SMTP id
 w13mr100884ilu.53.1628372582772; 
 Sat, 07 Aug 2021 14:43:02 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:02 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 12/49] bsd-user: implement path searching
Date: Sat,  7 Aug 2021 15:42:05 -0600
Message-Id: <20210807214242.82385-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d42;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd42.google.com
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
Cc: kevans@freebsd.org, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the PATH to find the executable given a bare argument.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 73 +++++++++++++++++++++++++++++++++++++++++++++-
 bsd-user/qemu.h    |  3 +-
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 379015c744..f8030d72bc 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -139,17 +139,88 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
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
+static bool find_in_path(char *path, const char *filename, char *retpath,
+                         size_t rpsize)
+{
+    const char *d;
+
+    while ((d = strsep(&path, ":")) != NULL) {
+        if (*d == '\0') {
+            d = ".";
+        }
+        if (snprintf(retpath, rpsize, "%s/%s", d, filename) >= (int)rpsize) {
+            continue;
+        }
+        if (is_there((const char *)retpath)) {
+            return true;
+        }
+    }
+    return false;
+}
+
 int loader_exec(const char *filename, char **argv, char **envp,
                 struct target_pt_regs *regs, struct image_info *infop,
                 struct bsd_binprm *bprm)
 {
+    char *p, *path = NULL, fullpath[PATH_MAX];
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
+        retval = open(path, O_RDONLY);
+        bprm->fullpath = g_strdup(path);
+    } else {
+        p = getenv("PATH");
+        if (p == NULL) {
+            return -1;
+        }
+
+        path = g_strdup(p);
+        if (path == NULL) {
+            fprintf(stderr, "Out of memory\n");
+            return -1;
+        }
+
+        if (!find_in_path(path, filename, fullpath, sizeof(fullpath))) {
+            return -1;
+        }
+        retval = open(fullpath, O_RDONLY);
+        bprm->fullpath = g_strdup(fullpath);
+
+        g_free(path);
+    }
+
+    /* bprm->fullpath must be populated. */
+    if (bprm->fullpath == NULL) {
+        fprintf(stderr, "Out of memory\n");
+        return -1;
+    }
     if (retval < 0) {
         return retval;
     }
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


