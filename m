Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2F36A216
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:25:46 +0200 (CEST)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL6H-0003G5-MH
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKia-0005fG-AE
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:16 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:46660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiA-0004Hv-1l
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:16 -0400
Received: by mail-il1-x136.google.com with SMTP id l19so2612503ilk.13
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HRrjj+riKuNxsoGNobDL2vgkm9NEj0EAf2amQImSd+Y=;
 b=M719DcbjYkmAwYSyrR37TUiK2+dX3I+o8l7DR6njGXK+FZzgVKFoetCUu1kCSTNHL4
 VzbV5tPlkVz8lWxUefWlVUxtX4JgwlVvD9M6WcdvBWMgyU7P3v+TalGwAC46rS/ykQTM
 s1sV1jV4YG/KkA9qxZWz0VkrY+LU9Pv67Q9Nyad/0OigwUdMHP4WvfGCVCtzTK3VN+zK
 8hDE2fLDslTS7X637usv/i7zo0b1vALZVuVhOvBCB7DvHQXiDgQQAPSFxcZIVan1qUVr
 q71m4VXRL/P+AgemOsFr2Qq6g07kdbVp+nEYtSIUSZcA5bhrC7uyAG7YSIMqVlc1eIUh
 QR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HRrjj+riKuNxsoGNobDL2vgkm9NEj0EAf2amQImSd+Y=;
 b=QwowxsR2NE03qA9yaDg/e35/WjOMoSPDYdvI5yFs6vFSr2nKyhahldrEeJHqth0spu
 Gc4AN2+cll3R34kmnsJF1eMxpAcpdaLdpFDkvv9XeEzkGbc3KMIBattLTWutaNdtGMNy
 8snu+CAZ71gcdV+vJTDYuUB7kXMv7e56eHgH9Mur3OKy6f+jvpG70ccnQZyqjKmHDud7
 Y6md0DhWEZFd9B5XZ2o/KOs9Zsu3EC/+EG2idlyandJLBozxJVkxmPM8I5+ulaJlSfa9
 wkKXcJnYjV782dnor5tFO6bl2fwI8EDYcfQik4/pj0a9TMR5cMj50Pnr8q1OhcVP/WNX
 XxQw==
X-Gm-Message-State: AOAM5314iwJaLS4WKrSctGYaQqWD3nqZJnPY98F/S6W152h3MqV4VWHn
 S0YoBj/C3fS0uhM/azgMfZk5kknZ+ebhoFsr
X-Google-Smtp-Source: ABdhPJzQdMgOg8mJglknqNO2X62A2gPUlPxxyaYzb5f0bpxLe1OTVJGk+k/lYSjF3ShxGBB0KUDtig==
X-Received: by 2002:a92:cd85:: with SMTP id r5mr7155713ilb.169.1619280048463; 
 Sat, 24 Apr 2021 09:00:48 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:47 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 26/48] bsd-user: move sparc cpu_loop into target_arch_cpu.h
 as target_cpu_loop
Date: Sat, 24 Apr 2021 09:59:54 -0600
Message-Id: <20210424160016.15200-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Move the sparc cpu_loop out of main.c and into target_arch_cpu.h and
rename it from cpu_loop to target_cpu_loop. Remove the #ifdef around
the catch-all cpu_loop.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c                  | 270 -------------------------------
 bsd-user/sparc/target_arch_cpu.h | 267 +++++++++++++++++++++++++++++-
 2 files changed, 266 insertions(+), 271 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 43c578c760..af4eae2e8b 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -88,280 +88,10 @@ void fork_end(int child)
     }
 }
 
-#ifdef TARGET_I386 /* stopgap ifdef */
 void cpu_loop(CPUArchState *env)
 {
     target_cpu_loop(env);
 }
-#endif
-
-#ifdef TARGET_SPARC
-#define SPARC64_STACK_BIAS 2047
-
-/* #define DEBUG_WIN */
-/*
- * WARNING: dealing with register windows _is_ complicated. More info
- * can be found at http://www.sics.se/~psm/sparcstack.html
- */
-static inline int get_reg_index(CPUSPARCState *env, int cwp, int index)
-{
-    index = (index + cwp * 16) % (16 * env->nwindows);
-    /*
-     * wrap handling : if cwp is on the last window, then we use the
-     * registers 'after' the end
-     */
-    if (index < 8 && env->cwp == env->nwindows - 1) {
-        index += 16 * env->nwindows;
-    }
-    return index;
-}
-
-/* save the register window 'cwp1' */
-static inline void save_window_offset(CPUSPARCState *env, int cwp1)
-{
-    unsigned int i;
-    abi_ulong sp_ptr;
-
-    sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
-#ifdef TARGET_SPARC64
-    if (sp_ptr & 3) {
-        sp_ptr += SPARC64_STACK_BIAS;
-    }
-#endif
-#if defined(DEBUG_WIN)
-    printf("win_overflow: sp_ptr=0x" TARGET_ABI_FMT_lx " save_cwp=%d\n",
-           sp_ptr, cwp1);
-#endif
-    for (i = 0; i < 16; i++) {
-        /* FIXME - what to do if put_user() fails? */
-        put_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
-        sp_ptr += sizeof(abi_ulong);
-    }
-}
-
-static void save_window(CPUSPARCState *env)
-{
-#ifndef TARGET_SPARC64
-    unsigned int new_wim;
-    new_wim = ((env->wim >> 1) | (env->wim << (env->nwindows - 1))) &
-        ((1LL << env->nwindows) - 1);
-    save_window_offset(env, cpu_cwp_dec(env, env->cwp - 2));
-    env->wim = new_wim;
-#else
-    /*
-     * cansave is zero if the spill trap handler is triggered by `save` and
-     * nonzero if triggered by a `flushw`
-     */
-    save_window_offset(env, cpu_cwp_dec(env, env->cwp - env->cansave - 2));
-    env->cansave++;
-    env->canrestore--;
-#endif
-}
-
-static void restore_window(CPUSPARCState *env)
-{
-#ifndef TARGET_SPARC64
-    unsigned int new_wim;
-#endif
-    unsigned int i, cwp1;
-    abi_ulong sp_ptr;
-
-#ifndef TARGET_SPARC64
-    new_wim = ((env->wim << 1) | (env->wim >> (env->nwindows - 1))) &
-        ((1LL << env->nwindows) - 1);
-#endif
-
-    /* restore the invalid window */
-    cwp1 = cpu_cwp_inc(env, env->cwp + 1);
-    sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
-#ifdef TARGET_SPARC64
-    if (sp_ptr & 3) {
-        sp_ptr += SPARC64_STACK_BIAS;
-    }
-#endif
-#if defined(DEBUG_WIN)
-    printf("win_underflow: sp_ptr=0x" TARGET_ABI_FMT_lx " load_cwp=%d\n",
-           sp_ptr, cwp1);
-#endif
-    for (i = 0; i < 16; i++) {
-        /* FIXME - what to do if get_user() fails? */
-        get_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
-        sp_ptr += sizeof(abi_ulong);
-    }
-#ifdef TARGET_SPARC64
-    env->canrestore++;
-    if (env->cleanwin < env->nwindows - 1) {
-        env->cleanwin++;
-    }
-    env->cansave--;
-#else
-    env->wim = new_wim;
-#endif
-}
-
-static void flush_windows(CPUSPARCState *env)
-{
-    int offset, cwp1;
-
-    offset = 1;
-    for (;;) {
-        /* if restore would invoke restore_window(), then we can stop */
-        cwp1 = cpu_cwp_inc(env, env->cwp + offset);
-#ifndef TARGET_SPARC64
-        if (env->wim & (1 << cwp1)) {
-            break;
-        }
-#else
-        if (env->canrestore == 0) {
-            break;
-        }
-        env->cansave++;
-        env->canrestore--;
-#endif
-        save_window_offset(env, cwp1);
-        offset++;
-    }
-    cwp1 = cpu_cwp_inc(env, env->cwp + 1);
-#ifndef TARGET_SPARC64
-    /* set wim so that restore will reload the registers */
-    env->wim = 1 << cwp1;
-#endif
-#if defined(DEBUG_WIN)
-    printf("flush_windows: nb=%d\n", offset - 1);
-#endif
-}
-
-void cpu_loop(CPUSPARCState *env)
-{
-    CPUState *cs = env_cpu(env);
-    int trapnr, ret, syscall_nr;
-    /* target_siginfo_t info; */
-
-    while (1) {
-        cpu_exec_start(cs);
-        trapnr = cpu_exec(cs);
-        cpu_exec_end(cs);
-        process_queued_cpu_work(cs);
-
-        switch (trapnr) {
-#ifndef TARGET_SPARC64
-        case 0x80:
-#else
-        /* FreeBSD uses 0x141 for syscalls too */
-        case 0x141:
-            if (bsd_type != target_freebsd) {
-                goto badtrap;
-            }
-            /* fallthrough */
-        case 0x100:
-#endif
-            syscall_nr = env->gregs[1];
-            if (bsd_type == target_freebsd)
-                ret = do_freebsd_syscall(env, syscall_nr,
-                                         env->regwptr[0], env->regwptr[1],
-                                         env->regwptr[2], env->regwptr[3],
-                                         env->regwptr[4], env->regwptr[5],
-                                         0, 0);
-            else if (bsd_type == target_netbsd)
-                ret = do_netbsd_syscall(env, syscall_nr,
-                                        env->regwptr[0], env->regwptr[1],
-                                        env->regwptr[2], env->regwptr[3],
-                                        env->regwptr[4], env->regwptr[5]);
-            else { /* if (bsd_type == target_openbsd) */
-#if defined(TARGET_SPARC64)
-                syscall_nr &= ~(TARGET_OPENBSD_SYSCALL_G7RFLAG |
-                                TARGET_OPENBSD_SYSCALL_G2RFLAG);
-#endif
-                ret = do_openbsd_syscall(env, syscall_nr,
-                                         env->regwptr[0], env->regwptr[1],
-                                         env->regwptr[2], env->regwptr[3],
-                                         env->regwptr[4], env->regwptr[5]);
-            }
-            if ((unsigned int)ret >= (unsigned int)(-515)) {
-                ret = -ret;
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-                env->xcc |= PSR_CARRY;
-#else
-                env->psr |= PSR_CARRY;
-#endif
-            } else {
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-                env->xcc &= ~PSR_CARRY;
-#else
-                env->psr &= ~PSR_CARRY;
-#endif
-            }
-            env->regwptr[0] = ret;
-            /* next instruction */
-#if defined(TARGET_SPARC64)
-            if (bsd_type == target_openbsd &&
-                env->gregs[1] & TARGET_OPENBSD_SYSCALL_G2RFLAG) {
-                env->pc = env->gregs[2];
-                env->npc = env->pc + 4;
-            } else if (bsd_type == target_openbsd &&
-                       env->gregs[1] & TARGET_OPENBSD_SYSCALL_G7RFLAG) {
-                env->pc = env->gregs[7];
-                env->npc = env->pc + 4;
-            } else {
-                env->pc = env->npc;
-                env->npc = env->npc + 4;
-            }
-#else
-            env->pc = env->npc;
-            env->npc = env->npc + 4;
-#endif
-            break;
-        case 0x83: /* flush windows */
-#ifdef TARGET_ABI32
-        case 0x103:
-#endif
-            flush_windows(env);
-            /* next instruction */
-            env->pc = env->npc;
-            env->npc = env->npc + 4;
-            break;
-#ifndef TARGET_SPARC64
-        case TT_WIN_OVF: /* window overflow */
-            save_window(env);
-            break;
-        case TT_WIN_UNF: /* window underflow */
-            restore_window(env);
-            break;
-        case TT_TFAULT:
-        case TT_DFAULT:
-            break;
-#else
-        case TT_SPILL: /* window overflow */
-            save_window(env);
-            break;
-        case TT_FILL: /* window underflow */
-            restore_window(env);
-            break;
-        case TT_TFAULT:
-        case TT_DFAULT:
-            break;
-#endif
-        case EXCP_INTERRUPT:
-            /* just indicate that signals should be handled asap */
-            break;
-        case EXCP_DEBUG:
-            {
-                gdb_handlesig(cs, TARGET_SIGTRAP);
-            }
-            break;
-        default:
-#ifdef TARGET_SPARC64
-        badtrap:
-#endif
-            printf("Unhandled trap: 0x%x\n", trapnr);
-            cpu_dump_state(cs, stderr, 0);
-            exit(1);
-        }
-        process_pending_signals(env);
-    }
-}
-
-#endif
 
 static void usage(void)
 {
diff --git a/bsd-user/sparc/target_arch_cpu.h b/bsd-user/sparc/target_arch_cpu.h
index dcf7694cba..5e3ecbed5c 100644
--- a/bsd-user/sparc/target_arch_cpu.h
+++ b/bsd-user/sparc/target_arch_cpu.h
@@ -19,4 +19,269 @@
 #ifndef _TARGET_ARCH_CPU_H_
 #define _TARGET_ARCH_CPU_H_
 
-#endif /* ! _TARGET_ARCH_CPU_H_ */
+#define SPARC64_STACK_BIAS 2047
+
+/* #define DEBUG_WIN */
+/*
+ * WARNING: dealing with register windows _is_ complicated. More info
+ * can be found at http://www.sics.se/~psm/sparcstack.html
+ */
+static inline int get_reg_index(CPUSPARCState *env, int cwp, int index)
+{
+    index = (index + cwp * 16) % (16 * env->nwindows);
+    /*
+     * wrap handling : if cwp is on the last window, then we use the
+     * registers 'after' the end
+     */
+    if (index < 8 && env->cwp == env->nwindows - 1) {
+        index += 16 * env->nwindows;
+    }
+    return index;
+}
+
+/* save the register window 'cwp1' */
+static inline void save_window_offset(CPUSPARCState *env, int cwp1)
+{
+    unsigned int i;
+    abi_ulong sp_ptr;
+
+    sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
+#ifdef TARGET_SPARC64
+    if (sp_ptr & 3) {
+        sp_ptr += SPARC64_STACK_BIAS;
+    }
+#endif
+#if defined(DEBUG_WIN)
+    printf("win_overflow: sp_ptr=0x" TARGET_ABI_FMT_lx " save_cwp=%d\n",
+           sp_ptr, cwp1);
+#endif
+    for (i = 0; i < 16; i++) {
+        /* FIXME - what to do if put_user() fails? */
+        put_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
+        sp_ptr += sizeof(abi_ulong);
+    }
+}
+
+static void save_window(CPUSPARCState *env)
+{
+#ifndef TARGET_SPARC64
+    unsigned int new_wim;
+    new_wim = ((env->wim >> 1) | (env->wim << (env->nwindows - 1))) &
+        ((1LL << env->nwindows) - 1);
+    save_window_offset(env, cpu_cwp_dec(env, env->cwp - 2));
+    env->wim = new_wim;
+#else
+    /*
+     * cansave is zero if the spill trap handler is triggered by `save` and
+     * nonzero if triggered by a `flushw`
+     */
+    save_window_offset(env, cpu_cwp_dec(env, env->cwp - env->cansave - 2));
+    env->cansave++;
+    env->canrestore--;
+#endif
+}
+
+static void restore_window(CPUSPARCState *env)
+{
+#ifndef TARGET_SPARC64
+    unsigned int new_wim;
+#endif
+    unsigned int i, cwp1;
+    abi_ulong sp_ptr;
+
+#ifndef TARGET_SPARC64
+    new_wim = ((env->wim << 1) | (env->wim >> (env->nwindows - 1))) &
+        ((1LL << env->nwindows) - 1);
+#endif
+
+    /* restore the invalid window */
+    cwp1 = cpu_cwp_inc(env, env->cwp + 1);
+    sp_ptr = env->regbase[get_reg_index(env, cwp1, 6)];
+#ifdef TARGET_SPARC64
+    if (sp_ptr & 3) {
+        sp_ptr += SPARC64_STACK_BIAS;
+    }
+#endif
+#if defined(DEBUG_WIN)
+    printf("win_underflow: sp_ptr=0x" TARGET_ABI_FMT_lx " load_cwp=%d\n",
+           sp_ptr, cwp1);
+#endif
+    for (i = 0; i < 16; i++) {
+        /* FIXME - what to do if get_user() fails? */
+        get_user_ual(env->regbase[get_reg_index(env, cwp1, 8 + i)], sp_ptr);
+        sp_ptr += sizeof(abi_ulong);
+    }
+#ifdef TARGET_SPARC64
+    env->canrestore++;
+    if (env->cleanwin < env->nwindows - 1) {
+        env->cleanwin++;
+    }
+    env->cansave--;
+#else
+    env->wim = new_wim;
+#endif
+}
+
+static void flush_windows(CPUSPARCState *env)
+{
+    int offset, cwp1;
+
+    offset = 1;
+    for (;;) {
+        /* if restore would invoke restore_window(), then we can stop */
+        cwp1 = cpu_cwp_inc(env, env->cwp + offset);
+#ifndef TARGET_SPARC64
+        if (env->wim & (1 << cwp1)) {
+            break;
+        }
+#else
+        if (env->canrestore == 0) {
+            break;
+        }
+        env->cansave++;
+        env->canrestore--;
+#endif
+        save_window_offset(env, cwp1);
+        offset++;
+    }
+    cwp1 = cpu_cwp_inc(env, env->cwp + 1);
+#ifndef TARGET_SPARC64
+    /* set wim so that restore will reload the registers */
+    env->wim = 1 << cwp1;
+#endif
+#if defined(DEBUG_WIN)
+    printf("flush_windows: nb=%d\n", offset - 1);
+#endif
+}
+
+static void target_cpu_loop(CPUSPARCState *env)
+{
+    CPUState *cs = env_cpu(env);
+    int trapnr, ret, syscall_nr;
+    /* target_siginfo_t info; */
+
+    while (1) {
+        cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+        cpu_exec_end(cs);
+        process_queued_cpu_work(cs);
+
+        switch (trapnr) {
+#ifndef TARGET_SPARC64
+        case 0x80:
+#else
+        /* FreeBSD uses 0x141 for syscalls too */
+        case 0x141:
+            if (bsd_type != target_freebsd) {
+                goto badtrap;
+            }
+            /* fallthrough */
+        case 0x100:
+#endif
+            syscall_nr = env->gregs[1];
+            if (bsd_type == target_freebsd)
+                ret = do_freebsd_syscall(env, syscall_nr,
+                                         env->regwptr[0], env->regwptr[1],
+                                         env->regwptr[2], env->regwptr[3],
+                                         env->regwptr[4], env->regwptr[5],
+                                         0, 0);
+            else if (bsd_type == target_netbsd)
+                ret = do_netbsd_syscall(env, syscall_nr,
+                                        env->regwptr[0], env->regwptr[1],
+                                        env->regwptr[2], env->regwptr[3],
+                                        env->regwptr[4], env->regwptr[5]);
+            else { /* if (bsd_type == target_openbsd) */
+#if defined(TARGET_SPARC64)
+                syscall_nr &= ~(TARGET_OPENBSD_SYSCALL_G7RFLAG |
+                                TARGET_OPENBSD_SYSCALL_G2RFLAG);
+#endif
+                ret = do_openbsd_syscall(env, syscall_nr,
+                                         env->regwptr[0], env->regwptr[1],
+                                         env->regwptr[2], env->regwptr[3],
+                                         env->regwptr[4], env->regwptr[5]);
+            }
+            if ((unsigned int)ret >= (unsigned int)(-515)) {
+                ret = -ret;
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+                env->xcc |= PSR_CARRY;
+#else
+                env->psr |= PSR_CARRY;
+#endif
+            } else {
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+                env->xcc &= ~PSR_CARRY;
+#else
+                env->psr &= ~PSR_CARRY;
+#endif
+            }
+            env->regwptr[0] = ret;
+            /* next instruction */
+#if defined(TARGET_SPARC64)
+            if (bsd_type == target_openbsd &&
+                env->gregs[1] & TARGET_OPENBSD_SYSCALL_G2RFLAG) {
+                env->pc = env->gregs[2];
+                env->npc = env->pc + 4;
+            } else if (bsd_type == target_openbsd &&
+                       env->gregs[1] & TARGET_OPENBSD_SYSCALL_G7RFLAG) {
+                env->pc = env->gregs[7];
+                env->npc = env->pc + 4;
+            } else {
+                env->pc = env->npc;
+                env->npc = env->npc + 4;
+            }
+#else
+            env->pc = env->npc;
+            env->npc = env->npc + 4;
+#endif
+            break;
+        case 0x83: /* flush windows */
+#ifdef TARGET_ABI32
+        case 0x103:
+#endif
+            flush_windows(env);
+            /* next instruction */
+            env->pc = env->npc;
+            env->npc = env->npc + 4;
+            break;
+#ifndef TARGET_SPARC64
+        case TT_WIN_OVF: /* window overflow */
+            save_window(env);
+            break;
+        case TT_WIN_UNF: /* window underflow */
+            restore_window(env);
+            break;
+        case TT_TFAULT:
+        case TT_DFAULT:
+            break;
+#else
+        case TT_SPILL: /* window overflow */
+            save_window(env);
+            break;
+        case TT_FILL: /* window underflow */
+            restore_window(env);
+            break;
+        case TT_TFAULT:
+        case TT_DFAULT:
+            break;
+#endif
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+        case EXCP_DEBUG:
+            {
+                gdb_handlesig(cs, TARGET_SIGTRAP);
+            }
+            break;
+        default:
+#ifdef TARGET_SPARC64
+        badtrap:
+#endif
+            printf("Unhandled trap: 0x%x\n", trapnr);
+            cpu_dump_state(cs, stderr, 0);
+            exit(1);
+        }
+        process_pending_signals(env);
+    }
+}
+
+#endif /* _TARGET_ARCH_CPU_H_ */
-- 
2.22.1


