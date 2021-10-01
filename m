Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3E41F160
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:39:34 +0200 (CEST)
Received: from localhost ([::1]:48548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKdJ-0007Hv-4Q
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXx-0006UM-RQ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:02 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:35465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXs-0007ip-UD
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:00 -0400
Received: by mail-qt1-x82f.google.com with SMTP id c20so9317586qtb.2
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UkwyzfCxusU0W+ltEdkm6R5Th1JFOdsQsNyNBLHWyyc=;
 b=vr3ItEn25M6gtHY7D/iM6n7389A+DWuBtFMcujxVv37R+q8U9hUmB8uSmfTrHPX3Nn
 4w3lD+g6v21z08YBZiw4FeC+XOceJvZxdoj/g7A1zzUCUp2JAvTHEsuqtwdxvLmun0vA
 1TzY0YOR5wvLwclzkW4MyC6/8KHJ8KMftRSdbHlgGR4y6pPw0KCRd7ZxtH1prJqKf5D1
 Zb+hNin9A8PwpZj7Fz83r/ovjh3W6GTFRF97WRYPi9aqqBHX7MG4RNmZzOBxW7jT4e2W
 B+7piMPclWj6itkMrn82sO2QvacjJD5jtMpbOqjVQHyBHUPOFjn+aJcgLo6sjFMWrE2G
 93kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UkwyzfCxusU0W+ltEdkm6R5Th1JFOdsQsNyNBLHWyyc=;
 b=aluNbyyCg6jaDaa4yscVngDDcGINDP6fatsGA2gFLmZAi45adqNwljbLqxAFDFwOdl
 Ecmy6fhePvOqV2Pkd6Qv5FSMiZWjy/3pzLHBaQ+8NM7Aky98kjY0eXCOKwMnhWMOY3RY
 FDn7RhngkxxVtsO1aTATatexs0saXdHC3/9Im5eMusyu/Mn3SCr5LXsa6k1F3ZapGwMT
 Ydq9TM3uulfxwtbTqnK17BfcSE9ScMs40rc3t/PISpXjQf0AK8+gycMRna6YMMlvFp1B
 dCAI8wyEiv5D7FYAUJrIz45hmeLMylsNP/+VrhIIxNxD56SRNKn8x0ozuNUf118w4Xw2
 7xxg==
X-Gm-Message-State: AOAM532rz4TGaTkYqF1VVoWyzU4g9zvh6Wuw2nnVCmcOxnPNRIuoeUAx
 QNZRVmGEvcUG9XhqAFF4+OxYAVn81cUozA==
X-Google-Smtp-Source: ABdhPJxVYNFaR7/JbuQUAOz+g7p6pfsBMM8l9hrV8U+ESSMjr1zr1/Itrc0lP/2UL88eb1zElyH0Jg==
X-Received: by 2002:ac8:4c99:: with SMTP id j25mr13878237qtv.191.1633102435972; 
 Fri, 01 Oct 2021 08:33:55 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] linux-user/nios2: Map a real kuser page
Date: Fri,  1 Oct 2021 11:33:43 -0400
Message-Id: <20211001153347.1736014-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org, laurent@vivier.eu
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
index dc4ababedd..206f7d511e 100644
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
+        [0x04] = 0x3a, 0x6c, 0x3b, 0x00,  /* trap 31 */
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


