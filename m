Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C19486359
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:00:47 +0100 (CET)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QVi-00084R-Rp
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:00:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDZ-0007nh-H4
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:01 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:59149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDR-0004k0-Sj
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:00 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MEUaQ-1nBWsf3hRS-00Fz6D; Thu, 06
 Jan 2022 11:41:52 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 20/27] linux-user/nios2: Map a real kuser page
Date: Thu,  6 Jan 2022 11:41:30 +0100
Message-Id: <20220106104137.732883-21-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V5mQcKaknO/dQ4BbmLpggz5nfGAs+HZS3fVhdM6wIjkh2Ad7UL0
 1L1fNRnQucUCeLWne5MuHKdr6GsX60NyWZZKIvVnQ/ACchBbsPnN+jYfNVPunCEJjZfHcYN
 J2GSHVFq8EBEadz3TQlUpSAMZn00+GTGL2QomnCWmlUCjgsAeCzpUgfShIviQ0VX0634egF
 /6oFDU6ISk7lpSM5BQCUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vhlb68p/hRI=:Ur7CfeKUJdJCW9RQU1SpOo
 YTfRgyBsVJTF00lFf3BGWXrJsslqTqCOBJGQl73qji9fNfnyMn2SQmO08JF+hvMs9FcHZDhM/
 ++kJhAMik7gpIdEvcdSiy7oKmnu8UdpmHrEqQX2nY9nZxS4gJTh0bvfkg9O3346mRXXL9oopt
 NU3gvUQ0jKnq63ncfj8p6lAjBrFW6m1S6KkzkxhvaHEGrSY5pNEpMvT+7h53GJ93ra0kuz5He
 Mihw9MHPi0zFCgz4OjKx3srq1u7acVEwLqcNENBVj/6R2oPoF5nL9drdbOAGhRPEBI72dbqyF
 QDzE3WPjcqbZ/Or07X/KYbNjqsBrMb4b15KXEq0y2R+mixeX5KZDDvx5y814EIG3JKpK6qoJc
 yGDh4WP4EJPTDD/kjpm8+fDElEUWul5z87Q6R+Rq8U+MtZy0ZMWUMhq6gq7Jw9n/h4oKHngkJ
 YO5QmKIAidl48HchrEsA+5qMgiSaw4jJC9N2k0QTxu7PTVFVbH6C56UEG1uGafrOVTDjrmLe3
 fclk4Sk8aykKoYGMarSQ65WVFwFyvb9EPjeg/WtAqrgmPUPnbaqcD+oas3NZqYZxEojFqOXXK
 jMJInVuuRAVp81fvMGZzDhbej+qKUoSH+bwRnMzmewqh4X6tZlqxX7fXnl2RNEBNvToy5hxKM
 mZF8zd0GmHugjeptuv1SPlBbTPXDu4VPGPaFD9COGiQUB1ew2pn0IeDKjju8pvSl5ZWk=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The first word of page1 is data, so the whole thing
can't be implemented with emulation of addresses.
Use init_guest_commpage for the allocation.

Hijack trap number 16 to implement cmpxchg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211221025012.1057923-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c        | 50 ++++++++++++++++++++++++++++++++++++-
 linux-user/nios2/cpu_loop.c | 50 ++++++++++++++++++++-----------------
 target/nios2/translate.c    |  9 -------
 3 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d34cd4fe43fb..329b2375ef15 100644
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
+#define HI_COMMPAGE 0
+#else
 #define HI_COMMPAGE 0
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
index 5c3d01d22dd7..de0fc63e2196 100644
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
index a75987751926..f9abc2fdd200 100644
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
2.33.1


