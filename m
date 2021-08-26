Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F373F8FE2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:26:13 +0200 (CEST)
Received: from localhost ([::1]:48218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMt2-0007xA-24
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfq-0005mc-NN
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:34 -0400
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfp-0006nq-7H
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:34 -0400
Received: by mail-il1-x143.google.com with SMTP id x5so4746081ill.3
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQjGwONrMkVPuT/SEnMRvOm9meb7X2CbpOc0HcMgp5w=;
 b=ZD6T66/Dgap4eQVNKPwvDsBLq91YpYpGsAnuWd5//i2WkT6xdqnE8zgw8WhJ+H3fCD
 4fH9n5vF+L+R8csLp+TC68HwM51qZpuWfSF4GXToDSus2Iuv1hx0zbuR9cqprMGqa5oh
 WHyIFfGuOG8uayuPzqGgE0AjyYkRHlgPPRNaSZXSoSj2qQTOFc7cw3VJPj2iuYVsQqt6
 or361ipIhKgVf7Exmt5kXvpw5HxAvdEO2XzXphHJp/NBegfqL7TXszxL/76fTOI17Csu
 DvI1MxqpHw7poUkDL3Estu6G6VOBEV7uq9v9EKjDn2GvgxisASNhOOjWDsF2tktlNArH
 C/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQjGwONrMkVPuT/SEnMRvOm9meb7X2CbpOc0HcMgp5w=;
 b=kjQcvcv2k3li/yjqi5UBmfsbnDOcG6SQsCb6n0+1ik6Ds1VQDAFJEWvVjug5evCbuD
 qv5fSJFmXgzLZQclwMEFnaP6qDI+Vx4wGK/Rmb2wPnuImXGBJ9+dgL04oMvhJWmTuSJH
 x1lfMMVBFY3fwf4/8vig/fRPn3O2vvj5CVMplTOfaWpvXNpsnpl3rXJ5bpoHPfmd0Pes
 Emc+FAwy4ZaYunrbiXlN5D2muXvfMV8s+9g9nfVHdxmVaVoc3WcBIF9x6pSEO0rf52NY
 8Nr8ReJpPbn35eftgGQx15mkPYsbYjS+yYS+YugmtZpKshZazVhn5HmhNey6b77aCX8w
 U1Bw==
X-Gm-Message-State: AOAM531WOB+mWr1x4giv3e/s8dBGoi4tqsNPoY9FyG/tUZGbkXO/AX8G
 XXrW+GgzlD4KgiBEhgQPM38Ge3Uf/JYB/iTI
X-Google-Smtp-Source: ABdhPJz60zLg+D9dkaZjt+ITW1iA498BydEufNt0AjKs2Yl5xeatkzNOlLwD+zX7LNCaAHtmaUHVTA==
X-Received: by 2002:a05:6e02:1d06:: with SMTP id
 i6mr4147888ila.113.1630012351905; 
 Thu, 26 Aug 2021 14:12:31 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:31 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/43] bsd-user: implement path searching
Date: Thu, 26 Aug 2021 15:11:28 -0600
Message-Id: <20210826211201.98877-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::143;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x143.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
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


