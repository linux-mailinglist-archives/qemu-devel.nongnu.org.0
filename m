Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73524389D02
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 07:19:35 +0200 (CEST)
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljb5q-0006cI-H6
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 01:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljb2L-0003Ns-UB; Thu, 20 May 2021 01:15:57 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljb2I-0002Vx-8q; Thu, 20 May 2021 01:15:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so4421806wmh.4; 
 Wed, 19 May 2021 22:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLM11x+CwA7dtccb1VwoEJf/uXmEpf+a+h0Tdo5AASA=;
 b=owbqZCRqWupKJwYUVgi5yJSS+TDgiXrJzgnOCT1KlQ5+3cMbDB5xWc1Mtn+HeWeWg8
 zT2xxHrjRn08Goh5ZWCJhC9FHsiiOBriF+pc1uMSkQ2JH/rcIWzhKWTUmFQVUyW/5nNc
 1hObPoHPygemN1uhyC+Wgz6CAau6ZaIXnmQDyZl88ebDwpzKS2/io/YMZXg4yXggVomr
 JntIww/3Rs81OWgkyr46GDWQMmF76b4xsQzI0yVM6oBVPFt+u8iwj6O66Kfafu9X6PZA
 Zc/EAhb1a3PVcLyLpg3yih7aUFuvxQgf4cb905VnIiV4qGKO9MxFPgpSqyhIQvUXEC+z
 iIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TLM11x+CwA7dtccb1VwoEJf/uXmEpf+a+h0Tdo5AASA=;
 b=Xa4OLrwRpDPBJdymnuWT/FfhkaTqgHe7xm0Fp40xrFD09akgJSsdA39wjhGbCl+sSf
 KKqEpQLQ3txj3GbMLfX3227BzbKg5XH9RfE0MOT8KV2GFCYlt9LIkO+FQNUuIfdxh2fg
 +7ohAjiZ2dR7WrfhMMAGX1LybEQ0WtSuUIk432Zgsh7S/gx1EhPdhBczS17/7MGtphJT
 7VjpvgjXNzeLfpvjo0N+bK3/PW4GSC9Cf+xmNj2lz1iVpVnP2VCL8nH5OdaXcRCaUn1E
 tYFyEL29c9th9hcfupjZJq4vDNkN6dCwA7o1Vr3uVROfKtEgpYMyPxbAwmLh7I06iKDW
 y1Qw==
X-Gm-Message-State: AOAM533vC8dYphA9j/Xv1b91Sh9LYwMYgaeiKdCwfSlt0V8GxrXagZKy
 qrbMaTIiToNe7lOyNUYT/5K3CcdbhehtpA==
X-Google-Smtp-Source: ABdhPJy3f01MKam21I/98mQDJb1njf1uZPZZ4J8u9p2CtqcrkPWbpxVMfyHf3UdGV9+F7n5Pkd7jww==
X-Received: by 2002:a1c:e484:: with SMTP id b126mr2097270wmh.35.1621487749623; 
 Wed, 19 May 2021 22:15:49 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v18sm1938897wro.18.2021.05.19.22.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 22:15:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] hw/arm/boot: Abort if set_kernel_args() fails
Date: Thu, 20 May 2021 07:15:40 +0200
Message-Id: <20210520051542.2378774-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520051542.2378774-1-f4bug@amsat.org>
References: <20210520051542.2378774-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a address_space_write() call fails while calling
set_kernel_args(), the guest kernel will boot using
crap data. Avoid that by aborting if this ever occurs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/boot.c | 53 ++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d7b059225e6..0c1346d5842 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -291,15 +291,20 @@ static inline bool have_dtb(const struct arm_boot_info *info)
 
 #define WRITE_WORD(p, value) do { \
     address_space_stl_notdirty(as, p, value, \
-                               MEMTXATTRS_UNSPECIFIED, NULL);  \
+                               MEMTXATTRS_UNSPECIFIED, &result); \
+    if (result != MEMTX_OK) { \
+        goto fail; \
+    } \
     p += 4;                       \
 } while (0)
 
-static void set_kernel_args(const struct arm_boot_info *info, AddressSpace *as)
+/* Returns: 0 on success, -1 on error */
+static int set_kernel_args(const struct arm_boot_info *info, AddressSpace *as)
 {
     int initrd_size = info->initrd_size;
     hwaddr base = info->loader_start;
     hwaddr p;
+    MemTxResult result;
 
     p = base + KERNEL_ARGS_ADDR;
     /* ATAG_CORE */
@@ -326,8 +331,11 @@ static void set_kernel_args(const struct arm_boot_info *info, AddressSpace *as)
         int cmdline_size;
 
         cmdline_size = strlen(info->kernel_cmdline);
-        address_space_write(as, p + 8, MEMTXATTRS_UNSPECIFIED,
-                            info->kernel_cmdline, cmdline_size + 1);
+        result = address_space_write(as, p + 8, MEMTXATTRS_UNSPECIFIED,
+                                     info->kernel_cmdline, cmdline_size + 1);
+        if (result != MEMTX_OK) {
+            goto fail;
+        }
         cmdline_size = (cmdline_size >> 2) + 1;
         WRITE_WORD(p, cmdline_size + 2);
         WRITE_WORD(p, 0x54410009);
@@ -341,22 +349,31 @@ static void set_kernel_args(const struct arm_boot_info *info, AddressSpace *as)
         atag_board_len = (info->atag_board(info, atag_board_buf) + 3) & ~3;
         WRITE_WORD(p, (atag_board_len + 8) >> 2);
         WRITE_WORD(p, 0x414f4d50);
-        address_space_write(as, p, MEMTXATTRS_UNSPECIFIED,
-                            atag_board_buf, atag_board_len);
+        result = address_space_write(as, p, MEMTXATTRS_UNSPECIFIED,
+                                     atag_board_buf, atag_board_len);
+        if (result != MEMTX_OK) {
+            goto fail;
+        }
         p += atag_board_len;
     }
     /* ATAG_END */
     WRITE_WORD(p, 0);
     WRITE_WORD(p, 0);
+
+    return 0;
+fail:
+    return -1;
 }
 
-static void set_kernel_args_old(const struct arm_boot_info *info,
-                                AddressSpace *as)
+/* Returns: 0 on success, -1 on error */
+static int set_kernel_args_old(const struct arm_boot_info *info,
+                               AddressSpace *as)
 {
     hwaddr p;
     const char *s;
     int initrd_size = info->initrd_size;
     hwaddr base = info->loader_start;
+    MemTxResult result;
 
     /* see linux/include/asm-arm/setup.h */
     p = base + KERNEL_ARGS_ADDR;
@@ -419,10 +436,18 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
     }
     s = info->kernel_cmdline;
     if (s) {
-        address_space_write(as, p, MEMTXATTRS_UNSPECIFIED, s, strlen(s) + 1);
+        result = address_space_write(as, p, MEMTXATTRS_UNSPECIFIED,
+                                     s, strlen(s) + 1);
+        if (result != MEMTX_OK) {
+            goto fail;
+        }
     } else {
         WRITE_WORD(p, 0);
     }
+
+    return 0;
+fail:
+    return -1;
 }
 
 static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
@@ -786,10 +811,16 @@ static void do_cpu_reset(void *opaque)
                 cpu_set_pc(cs, info->loader_start);
 
                 if (!have_dtb(info)) {
+                    int err;
+
                     if (old_param) {
-                        set_kernel_args_old(info, as);
+                        err = set_kernel_args_old(info, as);
                     } else {
-                        set_kernel_args(info, as);
+                        err = set_kernel_args(info, as);
+                    }
+                    if (err) {
+                        error_report("could not set kernel arguments");
+                        exit(1);
                     }
                 }
             } else {
-- 
2.26.3


