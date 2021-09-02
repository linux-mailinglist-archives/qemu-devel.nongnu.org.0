Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0215E3FF82D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:59:23 +0200 (CEST)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwc6-0000xT-2j
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR2-0006aM-TL
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:56 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:34367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR1-0002vC-29
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:56 -0400
Received: by mail-io1-xd2e.google.com with SMTP id y18so4751340ioc.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQjGwONrMkVPuT/SEnMRvOm9meb7X2CbpOc0HcMgp5w=;
 b=xiM+3icTZgvIVaxZuiMZOHQBr7tMuBlMVlsg7/uEiXpoddrolRfibm3IYg9eG5EMy1
 N9ln21WhfGrZjPYfeuVTx2EzS+lzI1B0NWTxdYCz7S088bZs2KipGE3ZsqfzWNVzYevX
 QLJ4DwnWtIgsUTGI/Xd34DY5P9LqMLO3XOXlzVH76DioqN5GnbD7hoMZJuQuzulQe7tj
 dU0u8l3tJKPcfkqkMPvBhOl3/Na2TylTxX7gvCmwi2lbzIyb1bhSLp9YPl26PPPdx/dt
 R5OAFZnT4jF1BsY/j78B2woJLNcTuR92sy7Zrbr0R3xQMZ9f9CX2P7pbSeWI/SKSCV/b
 Ay/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQjGwONrMkVPuT/SEnMRvOm9meb7X2CbpOc0HcMgp5w=;
 b=JOh6xlMIlUUbuhJY5KdqWd70tr7eeqpdjsquE/OWCyRq7e+K9J/4yhGmm9g6W2g86+
 CenQEJimU3T7GOw+OPaNuhrBC9cg38YzV+Ohsi1ZbqGsNmlkWajYNjPHcCXUwmDtHCdX
 E8Hv4kkonBxYLvP3KmWJxS/flJBme269dzRS8G4b0yvblWMETpxb6umeyqGxVpFAmvwn
 TDJ8a2K8XybSfs5erQW2+dzChXtnj3Z3s4vslunW9DmcjTinAFUbFsWY6w5F43I25gp9
 D2Q0QFBJm/r3GokYR60k8njq0SXSLvp1TIn9OY1BVMd7ueLE5y1JpkIou1wvJFzRvCIm
 W7wg==
X-Gm-Message-State: AOAM533QcUVCaWRVDSfdKT83JMbwJfPdQLbLg0QVHC2A+uS9rA3V9wpL
 A+uPOZuzll/F2qe0hiyIt9pbcFHTPuvRgQ==
X-Google-Smtp-Source: ABdhPJxwRF7CUTPo8pzKAHCqNpAXTN+HC5y4a2zu2Z18be2PPfVDSp4QPNA7UdysVQCWNlYqeYeW1Q==
X-Received: by 2002:a5d:91c2:: with SMTP id k2mr708141ior.117.1630626473783;
 Thu, 02 Sep 2021 16:47:53 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:53 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/43] bsd-user: implement path searching
Date: Thu,  2 Sep 2021 17:46:56 -0600
Message-Id: <20210902234729.76141-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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

From: Warner Losh <imp@bsdimp.com>

Use the PATH to find the executable given a bare argument. We need to do
this so we can implement mixing native and emulated binaries (e.g.,
execing a x86 native binary from an emulated arm binary to optimize
parts of the build). By finding the binary, we will know how to exec it.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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


