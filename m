Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6E23AD77E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:47:33 +0200 (CEST)
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luRxE-0007vM-IN
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRta-0000A6-Bb
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:46 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:47051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtR-000834-8p
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:46 -0400
Received: by mail-pg1-x529.google.com with SMTP id n12so709214pgs.13
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=30EwpAZh1z9iPoV3TY4t8s4Mj5ydqdR77HqBIYGD76w=;
 b=Crp2RXyiG0vty9/gKv7xrj8Srv3eulFo6gYjIreOl7z9bF1dkf7CYUs/EX/XKoAPB4
 5WQfR8ZUWdhse/0pKapJrFaAduLrKRPoVSVhOWZ2Z17kX2swvRkwSSI4T9ACYLCktVqH
 PHIGwvLvfLNFE0x4ImtG8OqkMzEJ5qsLSfym94ZLwSw1aou2iuYXDHdKt6TgFbjb9r6N
 q5nDomF4K8ZFnom7nsWRL6gjxJuBskmCxzVUhieWigXQdROEKklrIpO9FxSCZQb4MX/P
 UiTKlqv6mQIlJidyl+K2oFAqvSf5QB6MbniD9hytyfNfZDgOUEnItU2ISrjE8Ey/ge2N
 JDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=30EwpAZh1z9iPoV3TY4t8s4Mj5ydqdR77HqBIYGD76w=;
 b=k6F3RwKwyDeGl3jZzXENAQwpSwl4HtyQrT9n1JA7JHQG1q2w2EIGkS8OmP534O+rQg
 l3alO9CIee0nFswuiUm4ngdrXgR6aW5rXCuRN6H68Fov/q59PZli8J1SuyaKE0yhCx59
 364/ot5BJaiKNSVybU5k+5Wwwng8lqWjTHVaQ+x+Z/0yRiknKWM9CFN6tX6eFurEq9yv
 3B5+RCo+1T3J7w/bvsZheLrQkrC6bIJHBYUMTfEn9jwacIhaCfGiEb8A6Pz4rLW5RNLS
 gSTGOoBf88dp6uxP6X8pzRAKD07hoTyOCeAaNEITGCppHOTJ8rY30D6HYGFO6HyRKtyd
 WD1A==
X-Gm-Message-State: AOAM531lU1wyCtx3jgB2kD+Xk3bCv+0gCnS3SFFxmPr2TAb3BP/fA00s
 lCPeVgBxAMYXUtE/dRGxU51F/SMiUyWuPQ==
X-Google-Smtp-Source: ABdhPJwGWs6F5Vr4gjpbRWuXcPDTQmj2QUxCpjhPgYYKuLStXY5R2f2pFvDrDd7kvV5aJ6r/C7eCqA==
X-Received: by 2002:a63:d053:: with SMTP id s19mr13150063pgi.326.1624074216063; 
 Fri, 18 Jun 2021 20:43:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/12] linux-user: Load vdso image if available
Date: Fri, 18 Jun 2021 20:43:26 -0700
Message-Id: <20210619034329.532318-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

The vdso image will be pre-processed into a C data array, with
a simple list of relocations to perform, and identifying the
location of signal trampolines.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 75 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 8 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 8a3a7ae3ac..a6ad454617 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1966,7 +1966,8 @@ static abi_ulong loader_build_fdpic_loadmap(struct image_info *info, abi_ulong s
 static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
                                    struct elfhdr *exec,
                                    struct image_info *info,
-                                   struct image_info *interp_info)
+                                   struct image_info *interp_info,
+                                   struct image_info *vdso_info)
 {
     abi_ulong sp;
     abi_ulong u_argc, u_argv, u_envp, u_auxv;
@@ -2038,8 +2039,12 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     }
 
     size = (DLINFO_ITEMS + 1) * 2;
-    if (k_platform)
+    if (k_platform) {
         size += 2;
+    }
+    if (vdso_info) {
+        size += 4;
+    }
 #ifdef DLINFO_ARCH_ITEMS
     size += DLINFO_ARCH_ITEMS * 2;
 #endif
@@ -2116,6 +2121,10 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     if (u_platform) {
         NEW_AUX_ENT(AT_PLATFORM, u_platform);
     }
+    if (vdso_info) {
+        NEW_AUX_ENT(AT_SYSINFO, vdso_info->entry);
+        NEW_AUX_ENT(AT_SYSINFO_EHDR, vdso_info->load_addr);
+    }
     NEW_AUX_ENT (AT_NULL, 0);
 #undef NEW_AUX_ENT
 
@@ -2942,6 +2951,53 @@ static void load_elf_interp(const char *filename, struct image_info *info,
     load_elf_image(filename, &src, info, &ehdr, NULL);
 }
 
+#ifndef HAVE_VDSO
+#define HAVE_VDSO 0
+static uint8_t vdso_image[] = { };
+static uint32_t vdso_relocs[] = { };
+#define vdso_sigreturn 0
+#define vdso_rt_sigreturn 0
+#endif
+
+static void load_elf_vdso(struct image_info *info)
+{
+    ImageSource src;
+    struct elfhdr ehdr;
+    abi_ulong load_bias, load_addr;
+
+    src.fd = -1;
+    src.cache = vdso_image;
+    src.cache_size = sizeof(vdso_image);
+
+    load_elf_image("<internal-vdso>", &src, info, &ehdr, NULL);
+    load_addr = info->load_addr;
+    load_bias = info->load_bias;
+
+    /*
+     * We need to relocate the VDSO image.  The one built into the kernel
+     * is built for a fixed address.  The one built for QEMU is not, since
+     * that requires close control of the guest address space.
+     * We pre-processed the image to locate all of the addresses that need
+     * to be updated.
+     */
+    for (size_t i = 0, n = ARRAY_SIZE(vdso_relocs); i < n; i++) {
+        abi_ulong *addr = g2h_untagged(load_addr + vdso_relocs[i]);
+        *addr = tswapal(tswapal(*addr) + load_bias);
+    }
+
+    /* Install signal trampolines, if present. */
+    if (vdso_sigreturn) {
+        default_sigreturn = load_addr + vdso_sigreturn;
+    }
+    if (vdso_rt_sigreturn) {
+        default_rt_sigreturn = load_addr + vdso_rt_sigreturn;
+    }
+
+    /* Mark the VDSO writable segment read-only. */
+    target_mprotect(info->start_data, info->end_data - info->start_data,
+                    PROT_READ);
+}
+
 static int symfind(const void *s0, const void *s1)
 {
     target_ulong addr = *(target_ulong *)s0;
@@ -3146,7 +3202,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
      * and let elf_load_image do any swapping that may be required.
      */
     struct elfhdr ehdr;
-    struct image_info interp_info;
+    struct image_info interp_info, vdso_info;
     char *elf_interpreter = NULL;
     char *scratch;
 
@@ -3216,10 +3272,12 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
     }
 
     /*
-     * TODO: load a vdso, which would also contain the signal trampolines.
-     * Otherwise, allocate a private page to hold them.
+     * Load a vdso if available, which will amongst other things contain the
+     * signal trampolines.  Otherwise, allocate a separate page for them.
      */
-    if (TARGET_ARCH_HAS_SIGTRAMP_PAGE) {
+    if (HAVE_VDSO) {
+        load_elf_vdso(&vdso_info);
+    } else if (TARGET_ARCH_HAS_SIGTRAMP_PAGE) {
         abi_ulong tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
                                            PROT_READ | PROT_WRITE,
                                            MAP_PRIVATE | MAP_ANON, -1, 0);
@@ -3227,8 +3285,9 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
         target_mprotect(tramp_page, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
     }
 
-    bprm->p = create_elf_tables(bprm->p, bprm->argc, bprm->envc, &ehdr,
-                                info, (elf_interpreter ? &interp_info : NULL));
+    bprm->p = create_elf_tables(bprm->p, bprm->argc, bprm->envc, &ehdr, info,
+                                elf_interpreter ? &interp_info : NULL,
+                                HAVE_VDSO ? &vdso_info : NULL);
     info->start_stack = bprm->p;
 
     /* If we have an interpreter, set that as the program's entry point.
-- 
2.25.1


