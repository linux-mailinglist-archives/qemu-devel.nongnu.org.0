Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09BA3AD797
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:54:34 +0200 (CEST)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luS41-0001s0-Vm
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtd-0000Ft-UO
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:49 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtP-000828-1M
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:49 -0400
Received: by mail-pg1-x531.google.com with SMTP id e33so9455258pgm.3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8e5E/z+pH2CRQ8YHwtnQOyFDongtbxSl8xpH1CVFvZE=;
 b=rxgkwup73HhdSZG1sioe3h2l9TZqUGcR0WDnA315Q0+IFMjuPiO2vBXdF1Cc+2MLMb
 sO/aM8SMbPSeLnF5x4GE1ob6RtZY24/nzsJ1LdP9KetmfTPLi0LXBLMaKDFDbYZEuv1e
 yEK/B25kamA+etydZ5h0M6+12uC1y5/nF5tMT90TzSmnaGtxQ6a3/wTU3kaJwAT8RUuR
 6vJbBuV0GtqWQ5K4ZFKIpxIOTPOxznT5FgBwcUtTXKkEOm0GWAe4s45x7svU1KuVgTZ6
 qlSGntoAv7rRTI7yVpY0+oa3li9bXvT4NPcoPgd7zXG2HyivJgW7O/9/q0foxMhWN6YR
 3u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8e5E/z+pH2CRQ8YHwtnQOyFDongtbxSl8xpH1CVFvZE=;
 b=CdSaGsRmrVIogqZ1Ex25mS7nW4LZpkTHk+Ywg91NXbiB8LzEzzQh64OoLNJ1beI6Y+
 znFTL8K8FeF03TAInhwOJ6bbOQWmtcW+sFvHS5Pp0uR2dVbfGm2yuvT4sMcpuxH08fKX
 xwA7DksjDqm1y3KLSIFxzYl46jBgO8y1v9C34HdvEMyTI2qqVEgFi3+/oF/N0glRZh2A
 R5H0puokWap7TYlWc/henTgHKzr7R1ga6LzkuOwTSD2zGjFfd4OVml71M9sRAArA/oHN
 APEfGYFt057Fj7bZOiYM5Q2FghpQr4H4NyS6SAcsRj/NshK/mC1r9dxHmnx3/xm+sM/u
 UTtQ==
X-Gm-Message-State: AOAM533HnNkJbf0selZvohJh2DAi3wnDTc3/JfiVpb+4/O8ivnPrrWYb
 i9aNa5zp/aj6k1f18rCg9c1I/VrjHBjTiw==
X-Google-Smtp-Source: ABdhPJwzxVIAeOn25xr0IYK39KM4H3Gs5659vBxnHEn6pFoqCUgUCu+8UY9HEvvgL9jDlIYoEDWdWA==
X-Received: by 2002:aa7:8c59:0:b029:301:81b0:16ee with SMTP id
 e25-20020aa78c590000b029030181b016eemr616338pfd.24.1624074213787; 
 Fri, 18 Jun 2021 20:43:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] linux-user: Use ImageSource in load_elf_image
Date: Fri, 18 Jun 2021 20:43:22 -0700
Message-Id: <20210619034329.532318-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 1f9a69703a..425420f0cc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2525,10 +2525,9 @@ static bool parse_elf_property(const uint32_t *data, int *off, int datasz,
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
@@ -2556,14 +2555,8 @@ static bool parse_elf_properties(int image_fd,
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
@@ -2609,30 +2602,34 @@ static bool parse_elf_properties(int image_fd,
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
@@ -2643,15 +2640,11 @@ static void load_elf_image(const char *image_name, int image_fd,
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
 
@@ -2687,17 +2680,10 @@ static void load_elf_image(const char *image_name, int image_fd,
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
@@ -2705,7 +2691,7 @@ static void load_elf_image(const char *image_name, int image_fd,
             }
             *pinterp_name = g_steal_pointer(&interp_name);
         } else if (eppnt->p_type == PT_GNU_PROPERTY) {
-            if (!parse_elf_properties(image_fd, info, eppnt, bprm_buf, &err)) {
+            if (!parse_elf_properties(src, info, eppnt, &err)) {
                 goto exit_errmsg;
             }
         }
@@ -2847,7 +2833,7 @@ static void load_elf_image(const char *image_name, int image_fd,
                 vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
                 error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
                                     MAP_PRIVATE | MAP_FIXED,
-                                    image_fd, eppnt->p_offset - vaddr_po);
+                                    src->fd, eppnt->p_offset - vaddr_po);
 
                 if (error == -1) {
                     goto exit_mmap;
@@ -2893,20 +2879,11 @@ static void load_elf_image(const char *image_name, int image_fd,
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
@@ -2919,21 +2896,14 @@ static void load_elf_image(const char *image_name, int image_fd,
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
@@ -2946,6 +2916,7 @@ static void load_elf_interp(const char *filename, struct image_info *info,
                             char bprm_buf[BPRM_BUF_SIZE])
 {
     struct elfhdr ehdr;
+    ImageSource src;
     int fd, retval;
     Error *err = NULL;
 
@@ -2963,11 +2934,11 @@ static void load_elf_interp(const char *filename, struct image_info *info,
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
@@ -3177,8 +3148,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
 
     info->start_mmap = (abi_ulong)ELF_START_MMAP;
 
-    load_elf_image(bprm->filename, bprm->fd, info,
-                   &ehdr, &elf_interpreter, bprm->buf);
+    load_elf_image(bprm->filename, &bprm->src, info, &ehdr, &elf_interpreter);
 
     /* Do this so that we can load the interpreter, if need be.  We will
        change some of these later */
-- 
2.25.1


