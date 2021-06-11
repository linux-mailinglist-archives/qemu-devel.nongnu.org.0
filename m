Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06753A4B78
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:56:58 +0200 (CEST)
Received: from localhost ([::1]:36062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr1G-0007A0-2H
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmp-0002vw-9i
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:03 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmm-0002jJ-Kr
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:03 -0400
Received: by mail-pj1-x1033.google.com with SMTP id g24so6520291pji.4
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xvQ1foWcYjEjn0WVi/whCjaQe18yQNKefXnuEUc9Cy0=;
 b=Pk//YZPGEMU5bXFcayMlPq9NGlVNIByok2GwmoKfXvN5D++WKa0xweCKkaXQU0EOxe
 sFxK37UR1ighgM+GsTdG1Wf7821D2ksqAVhKEju/23tjFQkDMcEGnh2yJxhdqjuYv0mk
 pIHhWuYW2yqXY6oDSQGGqrqFMkk687aBSx1zUB7Z1AavBBfJryLunZedvZJySlUTVELf
 xwVY01k1KAoSwGnljYTCsqLdL6stop10aY0jjJ98Oobg6cTaoIUW+HqN6n7QeqILVYTX
 RGjG4eQxtz5TMKwFR9bUfzf3d71xn1nA3lDTgdJ9dPfOVUqh7TW4XVcbmM2MGgE8Ovuh
 hffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xvQ1foWcYjEjn0WVi/whCjaQe18yQNKefXnuEUc9Cy0=;
 b=N6vw4pfmooQkl3/p7EOHdKYZ6e5vVZVKAi78vhj7b+1e2IHEzU/A/XPFZGlaKTikL4
 SSl41nw2qQ/PFbdDj77rLNKubzv5VEJNzYMERbB9ef9E0UC405wtaDD+fLePKMhpLAd1
 UcvTpadYwayPlwDJiootmIgjZFoLuT3aFt+7jAcA3GQOgYDm+UBFDmo2UDxhsvG4sBW2
 XwNuuzSFkNJD2TukPZaEo9V0TG8aMQT/2rdqVRg8L7Ku9hOEnZna0/Ej1AEe3E8goZWI
 bJUje3PHmbs+Ubrxa/Aq4CIYaqcRxydiRcwdpZws28a6wtxspRuXA592WFz2YD+HBDt6
 rf3Q==
X-Gm-Message-State: AOAM532GvP2YaXc/jHhKEKDnCTJmVCdTiUfq3cxmtxUlAppcaWaHHvGT
 JPBg7D0j9XUofedpBTckJ1/uLAxBZOh0Ww==
X-Google-Smtp-Source: ABdhPJzZsFJ0dQLyIBZW/ojv9zRxsjvF2aATwBoVfmW+rnvwvuwFu9taWV4+OiSuUIUG3wXs8SCVew==
X-Received: by 2002:a17:90a:4a0e:: with SMTP id
 e14mr11589836pjh.209.1623454919426; 
 Fri, 11 Jun 2021 16:41:59 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/34] tcg: Return the map protection from alloc_code_gen_buffer
Date: Fri, 11 Jun 2021 16:41:33 -0700
Message-Id: <20210611234144.653682-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the interface from a boolean error indication to a
negative error vs a non-negative protection.  For the moment
this is only interface change, not making use of the new data.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 63 +++++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index ed7efba4b4..e6c80b35b1 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -526,14 +526,14 @@ static inline void split_cross_256mb(void **obuf, size_t *osize,
 static uint8_t static_code_gen_buffer[DEFAULT_CODE_GEN_BUFFER_SIZE]
     __attribute__((aligned(CODE_GEN_ALIGN)));
 
-static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
+static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
 {
     void *buf, *end;
     size_t size;
 
     if (splitwx > 0) {
         error_setg(errp, "jit split-wx not supported");
-        return false;
+        return -1;
     }
 
     /* page-align the beginning and end of the buffer */
@@ -563,16 +563,17 @@ static bool alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
 
     region.start_aligned = buf;
     region.total_size = size;
-    return true;
+
+    return PROT_READ | PROT_WRITE;
 }
 #elif defined(_WIN32)
-static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
+static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 {
     void *buf;
 
     if (splitwx > 0) {
         error_setg(errp, "jit split-wx not supported");
-        return false;
+        return -1;
     }
 
     buf = VirtualAlloc(NULL, size, MEM_RESERVE | MEM_COMMIT,
@@ -585,11 +586,12 @@ static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 
     region.start_aligned = buf;
     region.total_size = size;
-    return true;
+
+    return PAGE_READ | PAGE_WRITE | PAGE_EXEC;
 }
 #else
-static bool alloc_code_gen_buffer_anon(size_t size, int prot,
-                                       int flags, Error **errp)
+static int alloc_code_gen_buffer_anon(size_t size, int prot,
+                                      int flags, Error **errp)
 {
     void *buf;
 
@@ -597,7 +599,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
     if (buf == MAP_FAILED) {
         error_setg_errno(errp, errno,
                          "allocate %zu bytes for jit buffer", size);
-        return false;
+        return -1;
     }
 
 #ifdef __mips__
@@ -638,7 +640,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
 
     region.start_aligned = buf;
     region.total_size = size;
-    return true;
+    return prot;
 }
 
 #ifndef CONFIG_TCG_INTERPRETER
@@ -652,9 +654,9 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
 
 #ifdef __mips__
     /* Find space for the RX mapping, vs the 256MiB regions. */
-    if (!alloc_code_gen_buffer_anon(size, PROT_NONE,
-                                    MAP_PRIVATE | MAP_ANONYMOUS |
-                                    MAP_NORESERVE, errp)) {
+    if (alloc_code_gen_buffer_anon(size, PROT_NONE,
+                                   MAP_PRIVATE | MAP_ANONYMOUS |
+                                   MAP_NORESERVE, errp) < 0) {
         return false;
     }
     /* The size of the mapping may have been adjusted. */
@@ -688,7 +690,7 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     /* Request large pages for the buffer and the splitwx.  */
     qemu_madvise(buf_rw, size, QEMU_MADV_HUGEPAGE);
     qemu_madvise(buf_rx, size, QEMU_MADV_HUGEPAGE);
-    return true;
+    return PROT_READ | PROT_WRITE;
 
  fail_rx:
     error_setg_errno(errp, errno, "failed to map shared memory for execute");
@@ -702,7 +704,7 @@ static bool alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
     if (fd >= 0) {
         close(fd);
     }
-    return false;
+    return -1;
 }
 #endif /* CONFIG_POSIX */
 
@@ -721,7 +723,7 @@ extern kern_return_t mach_vm_remap(vm_map_t target_task,
                                    vm_prot_t *max_protection,
                                    vm_inherit_t inheritance);
 
-static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
+static int alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
 {
     kern_return_t ret;
     mach_vm_address_t buf_rw, buf_rx;
@@ -730,7 +732,7 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
     /* Map the read-write portion via normal anon memory. */
     if (!alloc_code_gen_buffer_anon(size, PROT_READ | PROT_WRITE,
                                     MAP_PRIVATE | MAP_ANONYMOUS, errp)) {
-        return false;
+        return -1;
     }
 
     buf_rw = region.start_aligned;
@@ -750,23 +752,23 @@ static bool alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
         /* TODO: Convert "ret" to a human readable error message. */
         error_setg(errp, "vm_remap for jit splitwx failed");
         munmap((void *)buf_rw, size);
-        return false;
+        return -1;
     }
 
     if (mprotect((void *)buf_rx, size, PROT_READ | PROT_EXEC) != 0) {
         error_setg_errno(errp, errno, "mprotect for jit splitwx");
         munmap((void *)buf_rx, size);
         munmap((void *)buf_rw, size);
-        return false;
+        return -1;
     }
 
     tcg_splitwx_diff = buf_rx - buf_rw;
-    return true;
+    return PROT_READ | PROT_WRITE;
 }
 #endif /* CONFIG_DARWIN */
 #endif /* CONFIG_TCG_INTERPRETER */
 
-static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
+static int alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
 {
 #ifndef CONFIG_TCG_INTERPRETER
 # ifdef CONFIG_DARWIN
@@ -777,24 +779,25 @@ static bool alloc_code_gen_buffer_splitwx(size_t size, Error **errp)
 # endif
 #endif
     error_setg(errp, "jit split-wx not supported");
-    return false;
+    return -1;
 }
 
-static bool alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
+static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 {
     ERRP_GUARD();
     int prot, flags;
 
     if (splitwx) {
-        if (alloc_code_gen_buffer_splitwx(size, errp)) {
-            return true;
+        prot = alloc_code_gen_buffer_splitwx(size, errp);
+        if (prot >= 0) {
+            return prot;
         }
         /*
          * If splitwx force-on (1), fail;
          * if splitwx default-on (-1), fall through to splitwx off.
          */
         if (splitwx > 0) {
-            return false;
+            return -1;
         }
         error_free_or_abort(errp);
     }
@@ -848,11 +851,11 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     size_t page_size;
     size_t region_size;
     size_t i;
-    bool ok;
+    int have_prot;
 
-    ok = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
-                               splitwx, &error_fatal);
-    assert(ok);
+    have_prot = alloc_code_gen_buffer(size_code_gen_buffer(tb_size),
+                                      splitwx, &error_fatal);
+    assert(have_prot >= 0);
 
     /*
      * Make region_size a multiple of page_size, using aligned as the start.
-- 
2.25.1


