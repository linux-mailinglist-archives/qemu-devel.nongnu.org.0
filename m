Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245436CB086
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:20:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguEi-00046S-Ne; Mon, 27 Mar 2023 17:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEg-00045v-Fe
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:38 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pguEe-0005xd-HA
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:18:38 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so10433834pjb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679951915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1VLo2WxkBtbuWkw96A50eULRoFliCIvVpHxdRWcTHM=;
 b=OjIqF5SaAC+hrGl83V/7f9kYjAyUBx1aX9XkS9HcVLDClZQqHsQmtQoOcv8b1/a1id
 28xGbaKas51S4eqsjv3cDh5rZA31PT0X8K1mxTabCDaXZfbfFaRYA1TmoHbYSQsy6Lx1
 st+mn9jvufw/G9Tx2PHUS/a+6133PIL/WvmiJd+SFh7u1P3N/R/HUiUhiKueEZH6mWGu
 804i8iypkhBWzh9LtKHvvOxWod+qRqc3sMmdJLcaIKEn5ZGd3+9qLD5RmHGK2WlIC3mS
 5zHE0KRFJ1/iEiZH99W+WDVn+DRmzgb8y1gqwjLFG9hnWrAHv/Mj3WNaNpphS12egQ5x
 b/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1VLo2WxkBtbuWkw96A50eULRoFliCIvVpHxdRWcTHM=;
 b=lUB+12eQr6pHtQiMavVUTYx6woii8aCzQoGtwNgqY38eOMHhdn+zA0Fsif10vYTZ63
 +Qe8oBpbje0YmloFYNUgxHgSI1+7sxjsT3KM6efYT1QfUTnDmB7g82ANxcxZiutqfn1G
 BhmUIDioATrO57M1PHQ+QiiiSOLLfnvfCHgn3SGhg0MBZpNrB+N1OV6uj1gGA4wK5HL/
 KXcnqJC1FGZJ0iyMsDcetuNr/PSfTmI2VplJK/QF6nKKuXQ1n4aJNmigCWKUXu7Sfkhg
 QCp/9vPykXzIoa4RTJsgV6Rmj+KggyzE2mNf34btWCEstwWdXeQe2NO1LRLiG9UWEZoH
 5AXg==
X-Gm-Message-State: AAQBX9fCHC4rCfK33YTiFEhfq56+GNPgsFW1rgf15P0tKNXrCKQph5NO
 25McnHMVRZGV5BH3dl1TbQb6t17PWVP5DXtznA8=
X-Google-Smtp-Source: AKy350Z3SQ5iu9QeQY9i9Q8fsR03HX7SuAM5dkSJXbZdl/Vinl8FhaoKazVKfDjNHpHvHnorjTsd7A==
X-Received: by 2002:a17:90a:be0c:b0:23f:5a76:506 with SMTP id
 a12-20020a17090abe0c00b0023f5a760506mr12936821pjs.46.1679951915335; 
 Mon, 27 Mar 2023 14:18:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a17090a6f0200b0023440af7aafsm7902708pjk.9.2023.03.27.14.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 14:18:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH for-8.0 v2 10/12] linux-user: Pass last not end to
 probe_guest_base
Date: Mon, 27 Mar 2023 14:18:22 -0700
Message-Id: <20230327211824.1785547-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327211824.1785547-1-richard.henderson@linaro.org>
References: <20230327211824.1785547-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c  | 24 ++++++++++++------------
 linux-user/flatload.c |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

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


