Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DDE3BDFE5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:54:09 +0200 (CEST)
Received: from localhost ([::1]:48270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0utE-0000Xp-PO
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uow-0000rj-R8
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:42 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uov-0006cK-1U
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:42 -0400
Received: by mail-pl1-x629.google.com with SMTP id u19so62086plc.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyCrJ1NajI+6XPdRKaz4cUDALrALvSj8LgDRn36KsCA=;
 b=e75WIOqizxDggPB8V7ozizTlxn9hyjg0LF+clVFcY+Cax7cC6TK/DlECCqNv5iRF+q
 dxzi70UPNGr/RilaixTzHExfnn9oEa7T7/ucK8wFE3qn+yl5+J4xFF00oJo36h62AVkM
 OWABSjzQzv85YNvklICjbW9MAzq8QFB2nij8kPGeZw4l4CS5H5ztgCJ/yL5PRLkrccO9
 cK8nC5kuh5/xRuaycyTk8GiMOBaEwSO3idbkuS15Zg0mGPIygXXGZdqGR5oOxI2vPBIt
 JH7AwXcLZXyOhXXUcb/HBybqCsAwu9KnpUS4lDrCnXezekFcXgm+uiAF8YICYxGZdGFE
 pX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyCrJ1NajI+6XPdRKaz4cUDALrALvSj8LgDRn36KsCA=;
 b=ZQivgJWrrBDeI5tgY3WPEjmB6L0sazZCJupcD4h74lFbYd5zxGMUenY/VjkXblsKyC
 fj3xOijWUMPfXxHTrXRLgddvBFmMv3FHoFOAgB8IKR+LXveKI1hMCjigKiVUPP+g9A5b
 3LOvcYq99we2plD0B2UboF42bJ5raMFr6Job93G40H3RfKPnuNLrxZMOK/B73E99BW0J
 Qy1nnPOL8UZkYrZRWe43a8Vyl8CDeZAE8GWyr/cOcG4tEmG9NKEOufI99A9F97ZX0RVO
 o1xDdNYV0J7CX6Xm8tK3HChuhsTzAlJuvsnUblz+IFpU5w9Rtgq7jenCdmbuCBiWYtHh
 TbfQ==
X-Gm-Message-State: AOAM533frfxE9cOujZyO81AFM/jp1HEyLoyFXFTpTgdZVgNhnj6YtS7g
 urd+0MbE1pQFMS3PsO+urxl2RnrdMYcarw==
X-Google-Smtp-Source: ABdhPJyAaW4EWClHSFQ/VMJIoNHQgUBm+hMSuOljWHNGUC8yKUe72Yn4jCBz4G+hlX64BG7HSK9ecw==
X-Received: by 2002:a17:90b:e05:: with SMTP id
 ge5mr2865876pjb.93.1625615379797; 
 Tue, 06 Jul 2021 16:49:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/36] linux-user: Introduce imgsrc_mmap
Date: Tue,  6 Jul 2021 16:49:05 -0700
Message-Id: <20210706234932.356913-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h      | 11 +++++++++++
 linux-user/elfload.c   |  4 ++--
 linux-user/linuxload.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index dafaae6293..255182e133 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -199,6 +199,17 @@ bool imgsrc_read(void *dst, off_t offset, size_t len,
 void *imgsrc_read_alloc(off_t offset, size_t len,
                         const ImageSource *img, Error **errp);
 
+/**
+ * imgsrc_mmap: Map from ImageSource
+ *
+ * If @src has a file descriptor, pass on to target_mmap.  Otherwise,
+ * this is "mapping" from a host buffer, which resolves to memcpy.
+ * Therefore, flags must be MAP_PRIVATE | MAP_FIXED; the argument is
+ * retained for clarity.
+ */
+abi_long imgsrc_mmap(abi_ulong start, abi_ulong len, int prot,
+                     int flags, const ImageSource *src, abi_ulong offset);
+
 /* Read a good amount of data initially, to hopefully get all the
    program headers loaded.  */
 #define BPRM_BUF_SIZE  1024
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 490b374d13..ec4b5f9d54 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2837,9 +2837,9 @@ static void load_elf_image(const char *image_name, const ImageSource *src,
              */
             if (eppnt->p_filesz != 0) {
                 vaddr_len = TARGET_ELF_PAGELENGTH(eppnt->p_filesz + vaddr_po);
-                error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
+                error = imgsrc_mmap(vaddr_ps, vaddr_len, elf_prot,
                                     MAP_PRIVATE | MAP_FIXED,
-                                    src->fd, eppnt->p_offset - vaddr_po);
+                                    src, eppnt->p_offset - vaddr_po);
 
                 if (error == -1) {
                     goto exit_mmap;
diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
index d0d3f2ed0e..a437a22b49 100644
--- a/linux-user/linuxload.c
+++ b/linux-user/linuxload.c
@@ -208,3 +208,47 @@ void *imgsrc_read_alloc(off_t offset, size_t len,
     }
     return alloc;
 }
+
+abi_long imgsrc_mmap(abi_ulong start, abi_ulong len, int prot,
+                     int flags, const ImageSource *src, abi_ulong offset)
+{
+    abi_long ret;
+    int prot_write;
+    void *haddr;
+
+    assert(flags == (MAP_PRIVATE | MAP_FIXED));
+
+    if (src->fd >= 0) {
+        return target_mmap(start, len, prot, flags, src->fd, offset);
+    }
+
+    /*
+     * This case is for the vdso; we don't expect bad images.
+     * The mmap may extend beyond the end of the image, especially
+     * to the end of the page.  Zero fill.
+     */
+    assert(offset < src->cache_size);
+
+    prot_write = prot | PROT_WRITE;
+    ret = target_mmap(start, len, prot_write, flags | MAP_ANON, -1, 0);
+    if (ret == -1) {
+        return ret;
+    }
+
+    haddr = lock_user(VERIFY_WRITE, start, len, 0);
+    assert(haddr != NULL);
+    if (offset + len < src->cache_size) {
+        memcpy(haddr, src->cache + offset, len);
+    } else {
+        size_t rest = src->cache_size - offset;
+        memcpy(haddr, src->cache + offset, rest);
+        memset(haddr + rest, 0, len - rest);
+    }
+    unlock_user(haddr, start, len);
+
+    if (prot != prot_write) {
+        target_mprotect(start, len, prot);
+    }
+
+    return ret;
+}
-- 
2.25.1


