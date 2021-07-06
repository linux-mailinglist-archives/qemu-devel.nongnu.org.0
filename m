Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4F3BDFF6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:58:45 +0200 (CEST)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0uxg-0003IP-Ki
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uou-0000lW-Pc
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:40 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:37715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uoq-0006b5-IG
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:40 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t9so411063pgn.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+OXX5KjIYz/ZS9gLgWEfQeUt72TgJXhxPXE04khIgeU=;
 b=YEhACm19xCJeHS8mYi60ZnutuviMKuddF9tGq7NpARJetL0j+iIbFDKxcxRL49NfnW
 YGEVe0ObyBlvpeAKRjNGQ19wm02CFo8sfFJ0BDCi2KvXZZ0u8qp5g81xA18V8F3WKvOO
 I7Z+j6y3rxdiBihUu4q84Oye3wYm4UEgwRpRdnnwfmqIt+8q+Tfub+xRAIQDnTSV8HW1
 1fF45x0Km+bEeFG3nULFe8nR15PgWqiX81IXGVliq4Wf82fZ93KK/bpIaKqgyG+ogb3X
 I5vD0EI6J90BvY7ZxB76WjNWvTAtr10kgQDn8HsD7qmsetMGXGalHckAYybQZMc7gckc
 KU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+OXX5KjIYz/ZS9gLgWEfQeUt72TgJXhxPXE04khIgeU=;
 b=XmXISCASqOCxLR4A8C2X2hNnoNM0hL1YoBSkKJyEyITIJZYtzewGPYP4XtPCL0/NDc
 kCPClFpNUTVzKBnzyIEHEbc+8eB+m3wqZVh1mriLWQp7Ffu4G1cdLNuPulbu8MnLk6F9
 Wi9kCi4sGeZw8bSx4i1huRoNqNCfO0OKFBfMZu5tIstpNDp75/IfxB2oiffbZEWABcBE
 M+oPJF9plyMtwTWtKO59pBKj+RHeBSgF3ekqw7IGAJVehF/9GOFmeaoDV0kiMpSTz+WE
 xSifhs5a1SY04TMEQl4y1AjFqmSEatYEaRgYUgGwz1BO4ENARhbSl9LXGINOfS3klYGX
 rRkw==
X-Gm-Message-State: AOAM532nlHHf5YITF6Z7UrAYmTaZUOeBRj8t5DX5mnoKcQ6Uoeqj/OAc
 2tIX3h2TjLFMKa+fS+BJoIoS+Rp5BugPZw==
X-Google-Smtp-Source: ABdhPJzhWffucUyoTjagCKePqVAro61sDZx9NDEONje+4p5H8om/X+bOyQdxyz6E4TWqdoeLrorfrg==
X-Received: by 2002:a63:1c20:: with SMTP id c32mr23124348pgc.41.1625615375305; 
 Tue, 06 Jul 2021 16:49:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/36] linux-user: Introduce imgsrc_read, imgsrc_read_alloc
Date: Tue,  6 Jul 2021 16:48:59 -0700
Message-Id: <20210706234932.356913-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduced and initialized, but not yet really used.
These will tidy the current tests vs BPRM_BUF_SIZE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h      | 50 ++++++++++++++++++++++++++++++++++--------
 linux-user/linuxload.c | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 9e5e2aa499..f4cdfb16b3 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -168,6 +168,37 @@ extern unsigned long mmap_min_addr;
 
 /* ??? See if we can avoid exposing so much of the loader internals.  */
 
+typedef struct {
+    const void *cache;
+    unsigned int cache_size;
+    int fd;
+} ImageSource;
+
+/**
+ * imgsrc_read: Read from ImageSource
+ * @dst: destination for read
+ * @offset: offset within file for read
+ * @len: size of the read
+ * @img: ImageSource to read from
+ * @errp: Error details.
+ *
+ * Read into @dst, using the cache when possible.
+ */
+bool imgsrc_read(void *dst, off_t offset, size_t len,
+                 const ImageSource *img, Error **errp);
+
+/**
+ * imgsrc_read_alloc: Read from ImageSource
+ * @offset: offset within file for read
+ * @size: size of the read
+ * @img: ImageSource to read from
+ * @errp: Error details.
+ *
+ * Read into newly allocated memory, using the cache when possible.
+ */
+void *imgsrc_read_alloc(off_t offset, size_t len,
+                        const ImageSource *img, Error **errp);
+
 /* Read a good amount of data initially, to hopefully get all the
    program headers loaded.  */
 #define BPRM_BUF_SIZE  1024
@@ -177,15 +208,16 @@ extern unsigned long mmap_min_addr;
  * used when loading binaries.
  */
 struct linux_binprm {
-        char buf[BPRM_BUF_SIZE] __attribute__((aligned));
-        abi_ulong p;
-        int fd;
-        int e_uid, e_gid;
-        int argc, envc;
-        char **argv;
-        char **envp;
-        char * filename;        /* Name of binary */
-        int (*core_dump)(int, const CPUArchState *); /* coredump routine */
+    char buf[BPRM_BUF_SIZE] __attribute__((aligned));
+    ImageSource src;
+    abi_ulong p;
+    int fd;
+    int e_uid, e_gid;
+    int argc, envc;
+    char **argv;
+    char **envp;
+    char *filename;  /* Name of binary */
+    int (*core_dump)(int, const CPUArchState *); /* coredump routine */
 };
 
 typedef struct IOCTLEntry IOCTLEntry;
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index 9d4eb5e94b..3b0bafc490 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -2,6 +2,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "qapi/error.h"
 
 #define NGROUPS 32
 
@@ -74,6 +75,10 @@ static int prepare_binprm(struct linux_binprm *bprm)
         /* Make sure the rest of the loader won't read garbage.  */
         memset(bprm->buf + retval, 0, BPRM_BUF_SIZE - retval);
     }
+
+    bprm->src.cache = bprm->buf;
+    bprm->src.cache_size = retval;
+
     return retval;
 }
 
@@ -129,6 +134,7 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
     int retval;
 
     bprm->fd = fdexec;
+    bprm->src.fd = fdexec;
     bprm->filename = (char *)filename;
     bprm->argc = count(argv);
     bprm->argv = argv;
@@ -163,3 +169,43 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
 
     return retval;
 }
+
+bool imgsrc_read(void *dst, off_t offset, size_t len,
+                 const ImageSource *img, Error **errp)
+{
+    ssize_t ret;
+
+    if (offset + len <= img->cache_size) {
+        memcpy(dst, img->cache + offset, len);
+        return true;
+    }
+
+    if (img->fd < 0) {
+        error_setg(errp, "read past end of buffer");
+        return false;
+    }
+
+    ret = pread(img->fd, dst, len, offset);
+    if (ret == len) {
+        return true;
+    }
+    if (ret < 0) {
+        error_setg_errno(errp, errno, "Error reading file header");
+    } else {
+        error_setg(errp, "Incomplete read of file header");
+    }
+    return false;
+}
+
+void *imgsrc_read_alloc(off_t offset, size_t len,
+                        const ImageSource *img, Error **errp)
+{
+    void *alloc = g_malloc(len);
+    bool ok = imgsrc_read(alloc, offset, len, img, errp);
+
+    if (!ok) {
+        g_free(alloc);
+        alloc = NULL;
+    }
+    return alloc;
+}
-- 
2.25.1


