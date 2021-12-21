Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8647B8C1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 03:57:54 +0100 (CET)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzVLd-0004W1-66
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 21:57:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEK-0003eW-UB
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:21 -0500
Received: from [2607:f8b0:4864:20::1036] (port=51153
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEJ-0000Al-7p
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:20 -0500
Received: by mail-pj1-x1036.google.com with SMTP id gj24so11203375pjb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 18:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WD5SX/a7MEJASWKLyGWdbzVbY06pcJ/VW3E6SnKv2TU=;
 b=vi5BzYdIS91HMr0rGrWK7j/4h2hDjkzdzR04Ol58IblVxqG9axbMu8jJ6furDOpz0j
 /d3wvfo2NzG7hlndTII5CsR9cnTFVnY1EijEZsUgD8NW4DDZOzshBH4gQJloBqFuOJaL
 /mY0M4AcVfxlhBKVci1OoK2QEPvs7i9I7XzWiQ/nva7BL/fewlmgnQvVeTHsK5rCLHnl
 QVPzhLvY8+Ir70PxU+L13fqZ+aE71luc3RilYD7BNnF7auZ73ihBQ8jLYbxMiK7uua/8
 nv0TFxIuaF+9n7aVnw6Rv+pbb0ugfJWrpUPvz975FUN4XqpXycjQO5ERkLrdCT5flKsC
 MAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WD5SX/a7MEJASWKLyGWdbzVbY06pcJ/VW3E6SnKv2TU=;
 b=Y4xbuX+l0D1x0K1L6CU1WfiCfYGFl4sAvIK7IBr2rFjvB7zbSwjgTtNbRFrSHLMW2S
 Uwd/jXAGI70f2xon70mtCEBjkO5pTWWat6GerhqYQnlWWpXeUTnxgtJY0q6m9bpX6gv9
 ezGT+v0nY8gShPsfLLldlSU+kg5hUZESC0gghO/AOw70X32CklxEPBzij4Jggb2GGPny
 q1nZ5Nmhy4Vl3I01G8SEJCGDZnfbjwunSTv3jfk0/YfQGxbB7Fy+vBc0tigdQgg+s+O4
 tRCv8YBu+6Bib0g+IxLX1u52XFFY6IWryLFC82HmEvNMiawg+kQM7zkUZ2dwQ+k2Xh+L
 bBBg==
X-Gm-Message-State: AOAM530XNci8B1JYloEbiLgEcecyxa7mNcvQUKuUxjM84tkcap1UxtY4
 bkWz1N8XeYoWuO0NXSk42bwDhQwmYz5/Eg==
X-Google-Smtp-Source: ABdhPJyKBNNm3cR/WZ7LjoUp/vgOxfp0KbF88+dxlR+A3CQWFiDNPK9z93McxYFbychrUG6OLuR0/w==
X-Received: by 2002:a17:90b:1d09:: with SMTP id
 on9mr1280649pjb.191.1640055017936; 
 Mon, 20 Dec 2021 18:50:17 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id bg23sm694025pjb.24.2021.12.20.18.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 18:50:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] linux-user/nios2: Map a real kuser page
Date: Mon, 20 Dec 2021 18:50:09 -0800
Message-Id: <20211221025012.1057923-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221025012.1057923-1-richard.henderson@linaro.org>
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first word of page1 is data, so the whole thing
can't be implemented with emulation of addresses.
Use init_guest_commpage for the allocation.

Hijack trap number 16 to implement cmpxchg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c        | 50 ++++++++++++++++++++++++++++++++++++-
 linux-user/nios2/cpu_loop.c | 50 ++++++++++++++++++++-----------------
 target/nios2/translate.c    |  9 -------
 3 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d34cd4fe43..329b2375ef 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1099,6 +1099,47 @@ static void init_thread(struct target_pt_regs *regs, struct image_info *infop)
     regs->estatus = 0x3;
 }
 
+#define LO_COMMPAGE  TARGET_PAGE_SIZE
+
+static bool init_guest_commpage(void)
+{
+    static const uint8_t kuser_page[4 + 2 * 64] = {
+        /* __kuser_helper_version */
+        [0x00] = 0x02, 0x00, 0x00, 0x00,
+
+        /* __kuser_cmpxchg */
+        [0x04] = 0x3a, 0x6c, 0x3b, 0x00,  /* trap 16 */
+                 0x3a, 0x28, 0x00, 0xf8,  /* ret */
+
+        /* __kuser_sigtramp */
+        [0x44] = 0xc4, 0x22, 0x80, 0x00,  /* movi r2, __NR_rt_sigreturn */
+                 0x3a, 0x68, 0x3b, 0x00,  /* trap 0 */
+    };
+
+    void *want = g2h_untagged(LO_COMMPAGE & -qemu_host_page_size);
+    void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
+                      MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
+
+    if (addr == MAP_FAILED) {
+        perror("Allocating guest commpage");
+        exit(EXIT_FAILURE);
+    }
+    if (addr != want) {
+        return false;
+    }
+
+    memcpy(addr, kuser_page, sizeof(kuser_page));
+
+    if (mprotect(addr, qemu_host_page_size, PROT_READ)) {
+        perror("Protecting guest commpage");
+        exit(EXIT_FAILURE);
+    }
+
+    page_set_flags(LO_COMMPAGE, LO_COMMPAGE + TARGET_PAGE_SIZE,
+                   PAGE_READ | PAGE_EXEC | PAGE_VALID);
+    return true;
+}
+
 #define ELF_EXEC_PAGESIZE        4096
 
 #define USE_ELF_CORE_DUMP
@@ -2160,8 +2201,13 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     return sp;
 }
 
-#ifndef HI_COMMPAGE
+#if defined(HI_COMMPAGE)
+#define LO_COMMPAGE 0
+#elif defined(LO_COMMPAGE)
 #define HI_COMMPAGE 0
+#else
+#define HI_COMMPAGE 0
+#define LO_COMMPAGE 0
 #define init_guest_commpage() true
 #endif
 
@@ -2374,6 +2420,8 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         } else {
             offset = -(HI_COMMPAGE & -align);
         }
+    } else if (LO_COMMPAGE) {
+        loaddr = MIN(loaddr, LO_COMMPAGE & -align);
     }
 
     addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 5c3d01d22d..de0fc63e21 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -76,6 +76,32 @@ void cpu_loop(CPUNios2State *env)
                 force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP,
                                 env->regs[R_PC]);
                 break;
+
+            case 16: /* QEMU specific, for __kuser_cmpxchg */
+                {
+                    abi_ptr g = env->regs[4];
+                    uint32_t *h, n, o;
+
+                    if (g & 0x3) {
+                        force_sig_fault(TARGET_SIGBUS, TARGET_BUS_ADRALN, g);
+                        break;
+                    }
+                    ret = page_get_flags(g);
+                    if (!(ret & PAGE_VALID)) {
+                        force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, g);
+                        break;
+                    }
+                    if (!(ret & PAGE_READ) || !(ret & PAGE_WRITE)) {
+                        force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_ACCERR, g);
+                        break;
+                    }
+                    h = g2h(cs, g);
+                    o = env->regs[5];
+                    n = env->regs[6];
+                    env->regs[2] = qatomic_cmpxchg(h, o, n) - o;
+                    env->regs[R_PC] += 4;
+                }
+                break;
             }
             break;
 
@@ -86,29 +112,7 @@ void cpu_loop(CPUNios2State *env)
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case 0xaa:
-            switch (env->regs[R_PC]) {
-            /*case 0x1000:*/  /* TODO:__kuser_helper_version */
-            case 0x1004:      /* __kuser_cmpxchg */
-                start_exclusive();
-                if (env->regs[4] & 0x3) {
-                    goto kuser_fail;
-                }
-                ret = get_user_u32(env->regs[2], env->regs[4]);
-                if (ret) {
-                    end_exclusive();
-                    goto kuser_fail;
-                }
-                env->regs[2] -= env->regs[5];
-                if (env->regs[2] == 0) {
-                    put_user_u32(env->regs[6], env->regs[4]);
-                }
-                end_exclusive();
-                env->regs[R_PC] = env->regs[R_RA];
-                break;
-            /*case 0x1040:*/  /* TODO:__kuser_sigtramp */
-            default:
-                ;
-kuser_fail:
+            {
                 info.si_signo = TARGET_SIGSEGV;
                 info.si_errno = 0;
                 /* TODO: check env->error_code */
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index a759877519..f9abc2fdd2 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -795,15 +795,6 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     dc->base.pc_next = pc + 4;
 
     /* Decode an instruction */
-
-#if defined(CONFIG_USER_ONLY)
-    /* FIXME: Is this needed ? */
-    if (pc >= 0x1000 && pc < 0x2000) {
-        t_gen_helper_raise_exception(dc, 0xaa);
-        return;
-    }
-#endif
-
     code = cpu_ldl_code(env, pc);
     op = get_opcode(code);
 
-- 
2.25.1


