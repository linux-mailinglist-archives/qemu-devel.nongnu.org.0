Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B73BDFEE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:56:21 +0200 (CEST)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0uvM-0006MA-JD
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uow-0000qJ-Cb
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:42 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uos-0006bV-LF
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:42 -0400
Received: by mail-pf1-x436.google.com with SMTP id 17so547112pfz.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VISwacrGgGbOWnBpiQJcNPBiBKqXw/P+V8RdFMkfOQg=;
 b=Rt26TpjgEzcf6YNhaAjOb3NqFq7WoADgLBCxA6qj97rRaw1pakmpDtUcFofdqb6u30
 Wp9XBeYbwfKnxcQ55NPZ+DNSxOC4P+SOjY+WLVHMeAconTf7+XqQv2jQkjii3Ur9oSEg
 Y7D5e+RbrcpOpUuGqh8bxaSsukJfdjFSoceslNkz0bU3MW476oqAM0qa5LuSNz2UA+0w
 Dfd/nVOi/CpIT/EZ/5GZALezH+ERBt/tGfXrs/iGRYt4y52dTn13XGZ1X+nvDzyA0GAc
 X30EPjv62ZJpgi8QSCx8K6gNSq+4rfzYTUz9/IE0Byhpe6Oy0tgzabd3VdyCh+mPNupE
 fUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VISwacrGgGbOWnBpiQJcNPBiBKqXw/P+V8RdFMkfOQg=;
 b=SPZwqgcByK3YEhv22UMy3AXV2p3CbyjOLQ2dQ8diOif4/A1MYUWHG2gzaWUhY63qr5
 6U853cbuFxTkKvYA4VtX2OnQRxZ/qWHvF7Lq0/7Jj2NYgt8cXQZYmi8yxXTdx8DArgFq
 HmQVo21qFQ/+pYZXXSOjsF0cVPG+PHQu0mATN9iLkbLX7W+7M3MaguaUKTVwhSVXrQiv
 bLCBUtwqcKpgajQgEIilKYLNnO+WiJvegIB0jXikI+ZA1zJaQ7hTCh5ZiAFmLqyS11ez
 Ry4ZifmLso43OKRj1Xvnm03gOFnXQdQoj52VrGuUwc6OzmMM09SqOneF3q6bUrI9FNd+
 XHSg==
X-Gm-Message-State: AOAM533KLnxHDRTi96DlyzwBGFkeArWQr5U8agE6Myg0fe8FZrySfvjB
 MBKNkKGMUIb2uvNI3RAgZnyojhNSTaSPBA==
X-Google-Smtp-Source: ABdhPJwzlLZvnExk3CruLlGCod8061QGhBahUiTE2AxL3bj/dyKyDDhy+a7+Jl/FkiI+xLaU6zHI8g==
X-Received: by 2002:a62:7e42:0:b029:325:6b42:609f with SMTP id
 z63-20020a627e420000b02903256b42609fmr1104719pfc.37.1625615377383; 
 Tue, 06 Jul 2021 16:49:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/36] linux-user: Use ImageSource in load_elf_image
Date: Tue,  6 Jul 2021 16:49:02 -0700
Message-Id: <20210706234932.356913-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

Change parse_elf_properties as well, as the bprm_buf argument
ties the two functions closely.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 124 ++++++++++++++++---------------------------
 1 file changed, 47 insertions(+), 77 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d1278c2d29..9113bf82f1 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2530,10 +2530,9 @@ static bool parse_elf_property(const uint32_t *data, int *off, int datasz,
 }
 
 /* Process NT_GNU_PROPERTY_TYPE_0. */
-static bool parse_elf_properties(int image_fd,
+static bool parse_elf_properties(const ImageSource *src,
                                  struct image_info *info,
                                  const struct elf_phdr *phdr,
-                                 char bprm_buf[BPRM_BUF_SIZE],
                                  Error **errp)
 {
     union {
@@ -2561,14 +2560,8 @@ static bool parse_elf_properties(int image_fd,
         return false;
     }
 
-    if (phdr->p_offset + n <= BPRM_BUF_SIZE) {
-        memcpy(&note, bprm_buf + phdr->p_offset, n);
-    } else {
-        ssize_t len = pread(image_fd, &note, n, phdr->p_offset);
-        if (len != n) {
-            error_setg_errno(errp, errno, "Error reading file header");
-            return false;
-        }
+    if (!imgsrc_read(&note, phdr->p_offset, n, src, errp)) {
+        return false;
     }
 
     /*
@@ -2614,30 +2607,34 @@ static bool parse_elf_properties(int image_fd,
     }
 }
 
-/* Load an ELF image into the address space.
+/**
+ * load_elf_image: Load an ELF image into the address space.
+ * @image_name: the filename of the image, to use in error messages.
+ * @src: the ImageSource from which to read.
+ * @info: info collected from the loaded image.
+ * @ehdr: the ELF header, not yet bswapped.
+ * @pinterp_name: record any PT_INTERP string found.
+ *
+ * On return: @info values will be filled in, as necessary or available.
+ */
 
-   IMAGE_NAME is the filename of the image, to use in error messages.
-   IMAGE_FD is the open file descriptor for the image.
-
-   BPRM_BUF is a copy of the beginning of the file; this of course
-   contains the elf file header at offset 0.  It is assumed that this
-   buffer is sufficiently aligned to present no problems to the host
-   in accessing data at aligned offsets within the buffer.
-
-   On return: INFO values will be filled in, as necessary or available.  */
-
-static void load_elf_image(const char *image_name, int image_fd,
+static void load_elf_image(const char *image_name, const ImageSource *src,
                            struct image_info *info, struct elfhdr *ehdr,
-                           char **pinterp_name,
-                           char bprm_buf[BPRM_BUF_SIZE])
+                           char **pinterp_name)
 {
-    struct elf_phdr *phdr;
+    g_autofree struct elf_phdr *phdr = NULL;
     abi_ulong load_addr, load_bias, loaddr, hiaddr, error;
-    int i, retval, prot_exec;
+    int i, prot_exec;
     Error *err = NULL;
 
-    /* First of all, some simple consistency checks */
-    memcpy(ehdr, bprm_buf, sizeof(*ehdr));
+    /*
+     * First of all, some simple consistency checks.
+     * Note that we rely on the bswapped ehdr staying in bprm_buf,
+     * for later use by load_elf_binary and create_elf_tables.
+     */
+    if (!imgsrc_read(ehdr, 0, sizeof(*ehdr), src, &err)) {
+        goto exit_errmsg;
+    }
     if (!elf_check_ident(ehdr)) {
         error_setg(&err, "Invalid ELF image for this architecture");
         goto exit_errmsg;
@@ -2648,15 +2645,11 @@ static void load_elf_image(const char *image_name, int image_fd,
         goto exit_errmsg;
     }
 
-    i = ehdr->e_phnum * sizeof(struct elf_phdr);
-    if (ehdr->e_phoff + i <= BPRM_BUF_SIZE) {
-        phdr = (struct elf_phdr *)(bprm_buf + ehdr->e_phoff);
-    } else {
-        phdr = (struct elf_phdr *) alloca(i);
-        retval = pread(image_fd, phdr, i, ehdr->e_phoff);
-        if (retval != i) {
-            goto exit_read;
-        }
+    phdr = imgsrc_read_alloc(ehdr->e_phoff,
+                             ehdr->e_phnum * sizeof(struct elf_phdr),
+                             src, &err);
+    if (phdr == NULL) {
+        goto exit_errmsg;
     }
     bswap_phdr(phdr, ehdr->e_phnum);
 
@@ -2692,17 +2685,10 @@ static void load_elf_image(const char *image_name, int image_fd,
                 goto exit_errmsg;
             }
 
-            interp_name = g_malloc(eppnt->p_filesz);
-
-            if (eppnt->p_offset + eppnt->p_filesz <= BPRM_BUF_SIZE) {
-                memcpy(interp_name, bprm_buf + eppnt->p_offset,
-                       eppnt->p_filesz);
-            } else {
-                retval = pread(image_fd, interp_name, eppnt->p_filesz,
-                               eppnt->p_offset);
-                if (retval != eppnt->p_filesz) {
-                    goto exit_read;
-                }
+            interp_name = imgsrc_read_alloc(eppnt->p_offset, eppnt->p_filesz,
+                                            src, &err);
+            if (interp_name == NULL) {
+                goto exit_errmsg;
             }
             if (interp_name[eppnt->p_filesz - 1] != 0) {
                 error_setg(&err, "Invalid PT_INTERP entry");
@@ -2710,7 +2696,7 @@ static void load_elf_image(const char *image_name, int image_fd,
             }
             *pinterp_name = g_steal_pointer(&interp_name);
         } else if (eppnt->p_type == PT_GNU_PROPERTY) {
-            if (!parse_elf_properties(image_fd, info, eppnt, bprm_buf, &err)) {
+            if (!parse_elf_properties(src, info, eppnt, &err)) {
                 goto exit_errmsg;
             }
         }
@@ -2852,7 +2838,7 @@ static void load_elf_image(const char *image_name, int image_fd,
                 vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
                 error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
                                     MAP_PRIVATE | MAP_FIXED,
-                                    image_fd, eppnt->p_offset - vaddr_po);
+                                    src->fd, eppnt->p_offset - vaddr_po);
 
                 if (error == -1) {
                     goto exit_mmap;
@@ -2898,20 +2884,11 @@ static void load_elf_image(const char *image_name, int image_fd,
 #ifdef TARGET_MIPS
         } else if (eppnt->p_type == PT_MIPS_ABIFLAGS) {
             Mips_elf_abiflags_v0 abiflags;
-            if (eppnt->p_filesz < sizeof(Mips_elf_abiflags_v0)) {
-                error_setg(&err, "Invalid PT_MIPS_ABIFLAGS entry");
+
+            if (!imgsrc_read(&abiflags, eppnt->p_offset, sizeof(abiflags),
+                             src, &err)) {
                 goto exit_errmsg;
             }
-            if (eppnt->p_offset + eppnt->p_filesz <= BPRM_BUF_SIZE) {
-                memcpy(&abiflags, bprm_buf + eppnt->p_offset,
-                       sizeof(Mips_elf_abiflags_v0));
-            } else {
-                retval = pread(image_fd, &abiflags, sizeof(Mips_elf_abiflags_v0),
-                               eppnt->p_offset);
-                if (retval != sizeof(Mips_elf_abiflags_v0)) {
-                    goto exit_read;
-                }
-            }
             bswap_mips_abiflags(&abiflags);
             info->fp_abi = abiflags.fp_abi;
 #endif
@@ -2924,21 +2901,14 @@ static void load_elf_image(const char *image_name, int image_fd,
     }
 
     if (qemu_log_enabled()) {
-        load_symbols(ehdr, image_fd, load_bias);
+        load_symbols(ehdr, src->fd, load_bias);
     }
 
     mmap_unlock();
 
-    close(image_fd);
+    close(src->fd);
     return;
 
- exit_read:
-    if (retval >= 0) {
-        error_setg(&err, "Incomplete read of file header");
-    } else {
-        error_setg_errno(&err, errno, "Error reading file header");
-    }
-    goto exit_errmsg;
  exit_mmap:
     error_setg_errno(&err, errno, "Error mapping file");
     goto exit_errmsg;
@@ -2951,6 +2921,7 @@ static void load_elf_interp(const char *filename, struct image_info *info,
                             char bprm_buf[BPRM_BUF_SIZE])
 {
     struct elfhdr ehdr;
+    ImageSource src;
     int fd, retval;
     Error *err = NULL;
 
@@ -2968,11 +2939,11 @@ static void load_elf_interp(const char *filename, struct image_info *info,
         exit(-1);
     }
 
-    if (retval < BPRM_BUF_SIZE) {
-        memset(bprm_buf + retval, 0, BPRM_BUF_SIZE - retval);
-    }
+    src.fd = fd;
+    src.cache = bprm_buf;
+    src.cache_size = retval;
 
-    load_elf_image(filename, fd, info, &ehdr, NULL, bprm_buf);
+    load_elf_image(filename, &src, info, &ehdr, NULL);
 }
 
 static int symfind(const void *s0, const void *s1)
@@ -3182,8 +3153,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
 
     info->start_mmap = (abi_ulong)ELF_START_MMAP;
 
-    load_elf_image(bprm->filename, bprm->fd, info,
-                   &ehdr, &elf_interpreter, bprm->buf);
+    load_elf_image(bprm->filename, &bprm->src, info, &ehdr, &elf_interpreter);
 
     /* Do this so that we can load the interpreter, if need be.  We will
        change some of these later */
-- 
2.25.1


