Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E547F55C0C9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:47:38 +0200 (CEST)
Received: from localhost ([::1]:52340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69gv-0002bA-Nf
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69cr-000874-7i
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:43:25 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69cl-0007kR-Iw
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:43:24 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 n16-20020a17090ade9000b001ed15b37424so12360782pjv.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ugbJF6PVIezR2iJKyzNiaymmGRktI+k6YpseyxVcufU=;
 b=KQlU0YKsBN80caehJajX6WcelN0kvI/5Re45ba1846yGt/6gas34eX0bBkfpqLAdsm
 2NKLJc5allitKrGF37zxufdbbdO7I4neDWQAaUmQwhW2jUvQNPlylvzz7XW/ue+FEVBd
 2IRIQsvtSxsAFOyykxxFF11Lemk8yo5VutCGYL/GOXJvxxTALwH6LSL4wR/lsL6Hu1m+
 CcOwTNwZux0WAWU0ec6Onm+gtdu1VlB1UHI7cKDPznO3iJym5gknyPY6whmxypbWS8Jv
 IILiAV7Iu/OAodbsOIlOSNZvY7e0NlciTvPK5m8Qin3acuy+H5YOg6SVVpUsc4DjbBlc
 nAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ugbJF6PVIezR2iJKyzNiaymmGRktI+k6YpseyxVcufU=;
 b=NG/2uJQP2S4MCg5zvDYBNYTAYUWKrv+R5Tlaeo/tIfYquKZzTE1xDKHF452e3LrqMa
 t6psypsAl1a7+14zpVGem/nV4ZOy0S1Cj49tnTdgayDTT5Wlv7qW5R3Ya77A0nT3QyMD
 5LzCRpv/IPtx+okpj+ktudBeL2i7lBzHYJpf730ncYVNLqYTFIjB+6yO/iTHzUswS+gX
 vNJuRxApP7PEXg2WsHrgWl0qaSHAW0hSzc/ymMLeJkJ0+rCf4W4Cg39FJas/qXCUtBYO
 sG2HYBelJH6k8t7WPW0ShORFdwpuEwQpxupEWfldSmI6PwcoZQrFROT54HzPhoVTxboi
 qBlQ==
X-Gm-Message-State: AJIora+oRr+fCHhpWOL+vJSUiDHAq55YH2WfNi22/uwWfie/qPuNynX5
 IpWp7jb0tZLwgHwduvSpOK0lz4Ykc1IdeQ==
X-Google-Smtp-Source: AGRyM1vofRHOMglSDCnqhjlx4RmsIotE6EyBOyRXWsL1X3017qqo1BTIdMCexT1vtmooP4gmW5eztw==
X-Received: by 2002:a17:902:cf12:b0:169:f241:65ae with SMTP id
 i18-20020a170902cf1200b00169f24165aemr3275010plg.107.1656416597995; 
 Tue, 28 Jun 2022 04:43:17 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 bf3-20020a170902b90300b0015f2b3bc97asm9106026plb.13.2022.06.28.04.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:43:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: jcmvbkbc@gmail.com
Subject: [PATCH v5 2/2] target/xtensa: Use semihosting/syscalls.h
Date: Tue, 28 Jun 2022 17:13:07 +0530
Message-Id: <20220628114307.697943-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628114307.697943-1-richard.henderson@linaro.org>
References: <20220628114307.697943-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This separates guest file descriptors from host file descriptors,
and utilizes shared infrastructure for integration with gdbstub.
Remove the xtensa custom console handing and rely on the
generic -semihosting-config handling of chardevs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.h         |   1 -
 hw/xtensa/sim.c             |   3 -
 target/xtensa/xtensa-semi.c | 226 ++++++++----------------------------
 3 files changed, 50 insertions(+), 180 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index ea66895e7f..99ac3efd71 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -612,7 +612,6 @@ void xtensa_translate_init(void);
 void **xtensa_get_regfile_by_name(const char *name, int entries, int bits);
 void xtensa_breakpoint_handler(CPUState *cs);
 void xtensa_register_core(XtensaConfigList *node);
-void xtensa_sim_open_console(Chardev *chr);
 void check_interrupts(CPUXtensaState *s);
 void xtensa_irq_init(CPUXtensaState *env);
 qemu_irq *xtensa_get_extints(CPUXtensaState *env);
diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 946c71cb5b..5cca6a170e 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -87,9 +87,6 @@ XtensaCPU *xtensa_sim_common_init(MachineState *machine)
         xtensa_create_memory_regions(&sysram, "xtensa.sysram",
                                      get_system_memory());
     }
-    if (serial_hd(0)) {
-        xtensa_sim_open_console(serial_hd(0));
-    }
     return cpu;
 }
 
diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index 5375f106fc..79431f5a64 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -27,8 +27,10 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "chardev/char-fe.h"
+#include "exec/gdbstub.h"
 #include "semihosting/semihost.h"
+#include "semihosting/syscalls.h"
+#include "semihosting/softmmu-uaccess.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 
@@ -143,48 +145,21 @@ static uint32_t errno_h2g(int host_errno)
     return TARGET_EINVAL;
 }
 
-typedef struct XtensaSimConsole {
-    CharBackend be;
-    struct {
-        char buffer[16];
-        size_t offset;
-    } input;
-} XtensaSimConsole;
-
-static XtensaSimConsole *sim_console;
-
-static IOCanReadHandler sim_console_can_read;
-static int sim_console_can_read(void *opaque)
+static void xtensa_cb(CPUState *cs, uint64_t ret, int err)
 {
-    XtensaSimConsole *p = opaque;
+    CPUXtensaState *env = cs->env_ptr;
 
-    return sizeof(p->input.buffer) - p->input.offset;
+    env->regs[3] = errno_h2g(err);
+    env->regs[2] = ret;
 }
 
-static IOReadHandler sim_console_read;
-static void sim_console_read(void *opaque, const uint8_t *buf, int size)
+static void xtensa_select_cb(CPUState *cs, uint64_t ret, int err)
 {
-    XtensaSimConsole *p = opaque;
-    size_t copy = sizeof(p->input.buffer) - p->input.offset;
-
-    if (size < copy) {
-        copy = size;
+    if (ret & G_IO_NVAL) {
+        xtensa_cb(cs, -1, EBADF);
+    } else {
+        xtensa_cb(cs, ret != 0, 0);
     }
-    memcpy(p->input.buffer + p->input.offset, buf, copy);
-    p->input.offset += copy;
-}
-
-void xtensa_sim_open_console(Chardev *chr)
-{
-    static XtensaSimConsole console;
-
-    qemu_chr_fe_init(&console.be, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&console.be,
-                             sim_console_can_read,
-                             sim_console_read,
-                             NULL, NULL, &console,
-                             NULL, true);
-    sim_console = &console;
 }
 
 void xtensa_semihosting(CPUXtensaState *env)
@@ -194,165 +169,64 @@ void xtensa_semihosting(CPUXtensaState *env)
 
     switch (regs[2]) {
     case TARGET_SYS_exit:
+        gdb_exit(regs[3]);
         exit(regs[3]);
         break;
 
     case TARGET_SYS_read:
+        semihost_sys_read(cs, xtensa_cb, regs[3], regs[4], regs[5]);
+        break;
     case TARGET_SYS_write:
-        {
-            bool is_write = regs[2] == TARGET_SYS_write;
-            uint32_t fd = regs[3];
-            uint32_t vaddr = regs[4];
-            uint32_t len = regs[5];
-            uint32_t len_done = 0;
-
-            while (len > 0) {
-                hwaddr paddr = cpu_get_phys_page_debug(cs, vaddr);
-                uint32_t page_left =
-                    TARGET_PAGE_SIZE - (vaddr & (TARGET_PAGE_SIZE - 1));
-                uint32_t io_sz = page_left < len ? page_left : len;
-                hwaddr sz = io_sz;
-                void *buf = cpu_physical_memory_map(paddr, &sz, !is_write);
-                uint32_t io_done;
-                bool error = false;
-
-                if (buf) {
-                    vaddr += io_sz;
-                    len -= io_sz;
-                    if (fd < 3 && sim_console) {
-                        if (is_write && (fd == 1 || fd == 2)) {
-                            io_done = qemu_chr_fe_write_all(&sim_console->be,
-                                                            buf, io_sz);
-                            regs[3] = errno_h2g(errno);
-                        } else if (!is_write && fd == 0) {
-                            if (sim_console->input.offset) {
-                                io_done = sim_console->input.offset;
-                                if (io_sz < io_done) {
-                                    io_done = io_sz;
-                                }
-                                memcpy(buf, sim_console->input.buffer, io_done);
-                                memmove(sim_console->input.buffer,
-                                        sim_console->input.buffer + io_done,
-                                        sim_console->input.offset - io_done);
-                                sim_console->input.offset -= io_done;
-                                qemu_chr_fe_accept_input(&sim_console->be);
-                            } else {
-                                io_done = -1;
-                                regs[3] = TARGET_EAGAIN;
-                            }
-                        } else {
-                            qemu_log_mask(LOG_GUEST_ERROR,
-                                          "%s fd %d is not supported with chardev console\n",
-                                          is_write ?
-                                          "writing to" : "reading from", fd);
-                            io_done = -1;
-                            regs[3] = TARGET_EBADF;
-                        }
-                    } else {
-                        io_done = is_write ?
-                            write(fd, buf, io_sz) :
-                            read(fd, buf, io_sz);
-                        regs[3] = errno_h2g(errno);
-                    }
-                    if (io_done == -1) {
-                        error = true;
-                        io_done = 0;
-                    }
-                    cpu_physical_memory_unmap(buf, sz, !is_write, io_done);
-                } else {
-                    error = true;
-                    regs[3] = TARGET_EINVAL;
-                    break;
-                }
-                if (error) {
-                    if (!len_done) {
-                        len_done = -1;
-                    }
-                    break;
-                }
-                len_done += io_done;
-                if (io_done < io_sz) {
-                    break;
-                }
-            }
-            regs[2] = len_done;
-        }
+        semihost_sys_write(cs, xtensa_cb, regs[3], regs[4], regs[5]);
         break;
-
     case TARGET_SYS_open:
-        {
-            char name[1024];
-            int rc;
-            int i;
-
-            for (i = 0; i < ARRAY_SIZE(name); ++i) {
-                rc = cpu_memory_rw_debug(cs, regs[3] + i,
-                                         (uint8_t *)name + i, 1, 0);
-                if (rc != 0 || name[i] == 0) {
-                    break;
-                }
-            }
-
-            if (rc == 0 && i < ARRAY_SIZE(name)) {
-                regs[2] = open(name, regs[4], regs[5]);
-                regs[3] = errno_h2g(errno);
-            } else {
-                regs[2] = -1;
-                regs[3] = TARGET_EINVAL;
-            }
-        }
+        semihost_sys_open(cs, xtensa_cb, regs[3], 0, regs[4], regs[5]);
         break;
-
     case TARGET_SYS_close:
-        if (regs[3] < 3) {
-            regs[2] = regs[3] = 0;
-        } else {
-            regs[2] = close(regs[3]);
-            regs[3] = errno_h2g(errno);
-        }
+        semihost_sys_close(cs, xtensa_cb, regs[3]);
         break;
-
     case TARGET_SYS_lseek:
-        regs[2] = lseek(regs[3], (off_t)(int32_t)regs[4], regs[5]);
-        regs[3] = errno_h2g(errno);
+        semihost_sys_lseek(cs, xtensa_cb, regs[3], regs[4], regs[5]);
         break;
 
     case TARGET_SYS_select_one:
         {
-            uint32_t fd = regs[3];
-            uint32_t rq = regs[4];
-            uint32_t target_tv = regs[5];
-            uint32_t target_tvv[2];
+            int timeout, events;
 
-            struct timeval tv = {0};
+            if (regs[5]) {
+                uint32_t tv_sec, tv_usec;
+                uint64_t msec;
 
-            if (target_tv) {
-                cpu_memory_rw_debug(cs, target_tv,
-                        (uint8_t *)target_tvv, sizeof(target_tvv), 0);
-                tv.tv_sec = (int32_t)tswap32(target_tvv[0]);
-                tv.tv_usec = (int32_t)tswap32(target_tvv[1]);
-            }
-            if (fd < 3 && sim_console) {
-                if ((fd == 1 || fd == 2) && rq == SELECT_ONE_WRITE) {
-                    regs[2] = 1;
-                } else if (fd == 0 && rq == SELECT_ONE_READ) {
-                    regs[2] = sim_console->input.offset > 0;
-                } else {
-                    regs[2] = 0;
+                if (get_user_u32(tv_sec, regs[5]) ||
+                    get_user_u32(tv_usec, regs[5])) {
+                    xtensa_cb(cs, -1, EFAULT);
+                    return;
                 }
-                regs[3] = 0;
-            } else {
-                fd_set fdset;
 
-                FD_ZERO(&fdset);
-                FD_SET(fd, &fdset);
-                regs[2] = select(fd + 1,
-                                 rq == SELECT_ONE_READ   ? &fdset : NULL,
-                                 rq == SELECT_ONE_WRITE  ? &fdset : NULL,
-                                 rq == SELECT_ONE_EXCEPT ? &fdset : NULL,
-                                 target_tv ? &tv : NULL);
-                regs[3] = errno_h2g(errno);
+                /* Poll timeout is in milliseconds; overflow to infinity. */
+                msec = tv_sec * 1000ull + DIV_ROUND_UP(tv_usec, 1000ull);
+                timeout = msec <= INT32_MAX ? msec : -1;
+            } else {
+                timeout = -1;
             }
+
+            switch (regs[4]) {
+            case SELECT_ONE_READ:
+                events = G_IO_IN;
+                break;
+            case SELECT_ONE_WRITE:
+                events = G_IO_OUT;
+                break;
+            case SELECT_ONE_EXCEPT:
+                events = G_IO_PRI;
+                break;
+            default:
+                xtensa_cb(cs, -1, EINVAL);
+                return;
+            }
+
+            semihost_sys_poll_one(cs, xtensa_select_cb,
+                                  regs[3], events, timeout);
         }
         break;
 
-- 
2.34.1


