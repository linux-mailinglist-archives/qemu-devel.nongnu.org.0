Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2896CCDC3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:59:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGm-0006ur-66; Tue, 28 Mar 2023 18:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGh-0006tl-Rw
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:19 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGg-00072w-0H
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:19 -0400
Received: by mail-pl1-x632.google.com with SMTP id ix20so13181127plb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DetiRRyvf4ED57xT0bgZ3nZDKqz/yTSD4tOJO8ye8V0=;
 b=PomLFcPiMY4DFisKRqdgTbIgez2ay5Xa6uXCkHw0O9H1rr1NFcTU/fAzVpIEkNC8xJ
 HjgCxKnfhJkHIgJiIAXUVqXx4b5no1GihqjawhLKwZfphV0CVB6tQvbMNVThdoc9sKWT
 vbZf0Y+NUu64HmByuUqspLz+mu6thlChd5zCnvPX7KjBhg+0YBr6vrWUU0mjnBvUMeWG
 dxk0zTH5fyQfUsCCUerfY/RchpTjLgqj18TALdYS/1NXvUsRXh2Rvp5eJh0/UZDRMALK
 ny/TYQSQ8ESAXhr1P27NOSfk3Yac3Ys8d0xwEIIrI6fuaFl5Ds5I9xg/g2fxf+0RBM1f
 q4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DetiRRyvf4ED57xT0bgZ3nZDKqz/yTSD4tOJO8ye8V0=;
 b=4i+t32O/qUoxddT2temCphz5Tb4nxTcfqHc1IygHJk1DFC6SoUY9HdYW/kMBw4lMXx
 MSA3zjXtO4YhGnmEeE3IM7E0gj8QR/6AhLfeRayWsTf9j9t7e168pURLPafe65iZmTaW
 RG/bhTwYxHjwb7m71QpcnSPXSKlC+r/IcjDjsPBNKrHYu2oyidvcV7WAWfiSKVtEkUJW
 YVX4Dy/RZ15xuIw412BYQ9O0qirNT9C6814sNl3faER+t5acDDLyOSZ0rJlDw9oaAOOM
 s9FI8h3kgixTJ52h2YdRgR9gERq/7Y2lt/A2SNvNiXvfdHTEQV+JX9NoDl3cv2JiMx/7
 QCXg==
X-Gm-Message-State: AAQBX9fGcfOVlFELRqlqt9OrjUnM2uhfvt+bAqX2Zk+27huLfiyz+mAx
 OIHo4yu73lrvEdOmaLlW7b455spNitokaXTYuMQ=
X-Google-Smtp-Source: AKy350ZrrnZTLcmDFurQVDFViYcu2raz+IPqGGW1myX6DhEoDjQINKcVPIGmu+t/sww1paljXPgi5g==
X-Received: by 2002:a17:903:110e:b0:19e:9807:de48 with SMTP id
 n14-20020a170903110e00b0019e9807de48mr21984394plh.23.1680044297223; 
 Tue, 28 Mar 2023 15:58:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/15] linux-user: Pass last not end to probe_guest_base
Date: Tue, 28 Mar 2023 15:58:01 -0700
Message-Id: <20230328225806.2278728-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Pass the address of the last byte of the image, rather than
the first address past the last byte.  This avoids overflow
when the last page of the address space is involved.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/user-internals.h | 12 ++++++------
 linux-user/elfload.c        | 24 ++++++++++++------------
 linux-user/flatload.c       |  2 +-
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 9333db4f51..c63ef45fc7 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -76,19 +76,19 @@ void fork_end(int child);
 /**
  * probe_guest_base:
  * @image_name: the executable being loaded
- * @loaddr: the lowest fixed address in the executable
- * @hiaddr: the highest fixed address in the executable
+ * @loaddr: the lowest fixed address within the executable
+ * @hiaddr: the highest fixed address within the executable
  *
  * Creates the initial guest address space in the host memory space.
  *
- * If @loaddr == 0, then no address in the executable is fixed,
- * i.e. it is fully relocatable.  In that case @hiaddr is the size
- * of the executable.
+ * If @loaddr == 0, then no address in the executable is fixed, i.e.
+ * it is fully relocatable.  In that case @hiaddr is the size of the
+ * executable minus one.
  *
  * This function will not return if a valid value for guest_base
  * cannot be chosen.  On return, the executable loader can expect
  *
- *    target_mmap(loaddr, hiaddr - loaddr, ...)
+ *    target_mmap(loaddr, hiaddr - loaddr + 1, ...)
  *
  * to succeed.
  */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index fa4cc41567..dfae967908 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2504,7 +2504,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
         if (guest_hiaddr > reserved_va) {
             error_report("%s: requires more than reserved virtual "
                          "address space (0x%" PRIx64 " > 0x%lx)",
-                         image_name, (uint64_t)guest_hiaddr, reserved_va);
+                         image_name, (uint64_t)guest_hiaddr + 1, reserved_va);
             exit(EXIT_FAILURE);
         }
     } else {
@@ -2512,7 +2512,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
         if ((guest_hiaddr - guest_base) > ~(uintptr_t)0) {
             error_report("%s: requires more virtual address space "
                          "than the host can provide (0x%" PRIx64 ")",
-                         image_name, (uint64_t)guest_hiaddr - guest_base);
+                         image_name, (uint64_t)guest_hiaddr + 1 - guest_base);
             exit(EXIT_FAILURE);
         }
 #endif
@@ -2525,18 +2525,18 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
     if (reserved_va) {
         guest_loaddr = (guest_base >= mmap_min_addr ? 0
                         : mmap_min_addr - guest_base);
-        guest_hiaddr = reserved_va;
+        guest_hiaddr = reserved_va - 1;
     }
 
     /* Reserve the address space for the binary, or reserved_va. */
     test = g2h_untagged(guest_loaddr);
-    addr = mmap(test, guest_hiaddr - guest_loaddr, PROT_NONE, flags, -1, 0);
+    addr = mmap(test, guest_hiaddr - guest_loaddr + 1, PROT_NONE, flags, -1, 0);
     if (test != addr) {
         pgb_fail_in_use(image_name);
     }
     qemu_log_mask(CPU_LOG_PAGE,
-                  "%s: base @ %p for " TARGET_ABI_FMT_ld " bytes\n",
-                  __func__, addr, guest_hiaddr - guest_loaddr);
+                  "%s: base @ %p for %" PRIu64 " bytes\n",
+                  __func__, addr, (uint64_t)guest_hiaddr - guest_loaddr + 1);
 }
 
 /**
@@ -2680,7 +2680,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
     if (hiaddr != orig_hiaddr) {
         error_report("%s: requires virtual address space that the "
                      "host cannot provide (0x%" PRIx64 ")",
-                     image_name, (uint64_t)orig_hiaddr);
+                     image_name, (uint64_t)orig_hiaddr + 1);
         exit(EXIT_FAILURE);
     }
 
@@ -2694,7 +2694,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
          * arithmetic wraps around.
          */
         if (sizeof(uintptr_t) == 8 || loaddr >= 0x80000000u) {
-            hiaddr = (uintptr_t) 4 << 30;
+            hiaddr = UINT32_MAX;
         } else {
             offset = -(HI_COMMPAGE & -align);
         }
@@ -2702,7 +2702,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         loaddr = MIN(loaddr, LO_COMMPAGE & -align);
     }
 
-    addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
+    addr = pgb_find_hole(loaddr, hiaddr - loaddr + 1, align, offset);
     if (addr == -1) {
         /*
          * If HI_COMMPAGE, there *might* be a non-consecutive allocation
@@ -2755,7 +2755,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
     if (guest_hiaddr > reserved_va) {
         error_report("%s: requires more than reserved virtual "
                      "address space (0x%" PRIx64 " > 0x%lx)",
-                     image_name, (uint64_t)guest_hiaddr, reserved_va);
+                     image_name, (uint64_t)guest_hiaddr + 1, reserved_va);
         exit(EXIT_FAILURE);
     }
 
@@ -3021,7 +3021,7 @@ static void load_elf_image(const char *image_name, int image_fd,
             if (a < loaddr) {
                 loaddr = a;
             }
-            a = eppnt->p_vaddr + eppnt->p_memsz;
+            a = eppnt->p_vaddr + eppnt->p_memsz - 1;
             if (a > hiaddr) {
                 hiaddr = a;
             }
@@ -3112,7 +3112,7 @@ static void load_elf_image(const char *image_name, int image_fd,
      * In both cases, we will overwrite pages in this range with mappings
      * from the executable.
      */
-    load_addr = target_mmap(loaddr, hiaddr - loaddr, PROT_NONE,
+    load_addr = target_mmap(loaddr, (size_t)hiaddr - loaddr + 1, PROT_NONE,
                             MAP_PRIVATE | MAP_ANON | MAP_NORESERVE |
                             (ehdr->e_type == ET_EXEC ? MAP_FIXED : 0),
                             -1, 0);
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index e99570ca18..5efec2630e 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -448,7 +448,7 @@ static int load_flat_file(struct linux_binprm * bprm,
      * Allocate the address space.
      */
     probe_guest_base(bprm->filename, 0,
-                     text_len + data_len + extra + indx_len);
+                     text_len + data_len + extra + indx_len - 1);
 
     /*
      * there are a couple of cases here,  the separate code/data
-- 
2.34.1


