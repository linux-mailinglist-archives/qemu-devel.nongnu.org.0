Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE53AD77F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:47:34 +0200 (CEST)
Received: from localhost ([::1]:34120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luRxF-0007zo-8U
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtf-0000Lt-B0
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:51 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtQ-00082z-Uk
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:51 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so9303329pjn.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGX+M1DEqpXLqG7oFtvr0mh7D0289/3sneXY8fkD+4E=;
 b=XtqvGzx59fKnmiS+05znM1izSdDTphG8emkM6gFVmZOrzw2XwNry1NILLklLfIi2Bx
 5XUTvYKRW6YT3kgcg4YqHDV2Tv+trZcJG6zBy1ZbqxDJFP4STGTOBOWzXJTB4Keawh6u
 Uc71w8qX8DpRqLlV9RZ8Zf2cFvcqdfPe8arAQeP9Ci3Bhdkok2mIIg3oyLOPynsO/QQr
 JFhCqCtRwfrYvA2fBsAXh+98JGKV7tnd83seKQYzJg0W0mklEh06ip0XJArK44ec+m3b
 kuAeRFm6SXRshvVeXGJ6BaS95ruA38LIzu/Cf2yczsUcKgGTc/mhO6VyKFaQnJAiBzqV
 CQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGX+M1DEqpXLqG7oFtvr0mh7D0289/3sneXY8fkD+4E=;
 b=WcDJIJcGBFOssoaZTPBn4gqydZX42Ry1jy1Egrt03/Bl0F/7MKXFyfQvUFDYh2PhIP
 xH+pZHsPdsnICwAZTBlgmdC9m1vXHH/h+C5pL0kgPl6WIKy7bYDAdnK0leBOoz0+rwZQ
 3LEYCLRqC1ntI5MAlSBFgWiRDRCF4zaotROFjRGFBPuEyaglVIGg7eqqh43BsTaaaYt3
 brNLBQslhj6DiHPsFFHHfbwH0QT8k+mGxOZha+Idh3WauG2/qyMGCmn7/dEiKfEFnYT9
 qCnMC68TtAYcWuMGs1WUGRJP49YPZS1Roh2PgxItvyx4yd3wXvpwhXYdG9i+FtJyueAP
 Cxeg==
X-Gm-Message-State: AOAM533dpAVd3JOtv4mpoQJg842ACqAh0aTrsQ2tZKoUUH6EiZu/gax8
 N4fLz3reGoeJuJwcxE60RnkCB8snDkN2PA==
X-Google-Smtp-Source: ABdhPJxw2D/aBlME9pSVwEq/o78yjHtiZ/StzFl5keQpI9rgeXMN/pWY8LZMyk2h4j2FDwQqVdxHDQ==
X-Received: by 2002:a17:90a:6b42:: with SMTP id
 x2mr14204400pjl.16.1624074215409; 
 Fri, 18 Jun 2021 20:43:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] linux-user: Introduce imgsrc_mmap
Date: Fri, 18 Jun 2021 20:43:25 -0700
Message-Id: <20210619034329.532318-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
index 3c31a5e3b0..8a3a7ae3ac 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2832,9 +2832,9 @@ static void load_elf_image(const char *image_name, const ImageSource *src,
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


