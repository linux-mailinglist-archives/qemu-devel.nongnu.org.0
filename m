Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D884518FC2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:12:31 +0200 (CEST)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzos-0003tX-DW
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZt-0000hS-F5
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:57 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZp-0006NZ-Jw
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:57 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so3254490pjq.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1fJFL9WFFMMBNST5fjywcK07uYxhwGnnD8ji5QpthKs=;
 b=ehea1zdkqhLy37mZxw+2/QibyH93LzrgSG+NgPc0PKPBtu7lBgML8XJQir0RiQgo7/
 /qEfngYz9065oKlAyHEOWXaZL9x2v4gG2/p16GCAf3EEEceIfBCwxchn5A2dNuvdaHCW
 UsEgp5rJDPr0zezw+5LO6J9/rLvPScSu2PprhVIjIJIEQYdxU/CRsUP+dZHqE5T90X8P
 Frs9A20xAYQXs/1o2pTiMA3eG+f06hh8gUq3cxQw9VPD0inD+TK80I/muribjLWJlg6n
 Rg6VM+hf4LxwlfXcWEFEl4ljVt8j5wwVfu8ACJcho8OhdhVxfH2xD7MXdvWcnQww5pw/
 RKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1fJFL9WFFMMBNST5fjywcK07uYxhwGnnD8ji5QpthKs=;
 b=vUMtqT2nm6j6dEYxX/K601iJ7mHFu+cvduOO5ZVOnasBc+zb003XX2jYYWojhmXJDQ
 mvSg4kEB7jRG4cSvJOPrsg6gz53KrjYzDln00ktQcFUtVtrRMrlmSx0EdwFAnDF/VZRS
 Cu8NQODQWWttXDbqPM0AdWNX8oYL2+ha6oEOsXnk+B9rv5L6ONf1pXvWBvj9ErSf3ady
 Lg4ZtelsfEKe+3+mPLAmf7bgf6CH7YWhL9s4hwwMUPz9RdlA8IOMRo1To7zV7NI/rBgz
 8bpFFVqffRRL0Oh3AMRWx1pJ8rnaw+Oa9lTb1aDai92KDiFNdtABnwtARCyzOmL4Uvzs
 oK1g==
X-Gm-Message-State: AOAM532VcrJPX5emkXUs+MRlFu/ZHhhHsKXzL0x1zMhv5rPIuOWgim04
 mB5+w8N9vickcDg/KqB7QJTj6VwwCkVtGg==
X-Google-Smtp-Source: ABdhPJzcpGkbW39DHJjuw1egXIptmK+6/SRDToZhvkU2Jo7sT70kaNkojYx7ATqZmOZEsXoxlby6AQ==
X-Received: by 2002:a17:902:f2ca:b0:15d:180d:704 with SMTP id
 h10-20020a170902f2ca00b0015d180d0704mr17868219plc.102.1651607572145; 
 Tue, 03 May 2022 12:52:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 66/74] target/xtensa: Use semihosting/syscalls.h
Date: Tue,  3 May 2022 12:48:35 -0700
Message-Id: <20220503194843.1379101-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 target/xtensa/xtensa-semi.c | 303 +++++++++---------------------------
 3 files changed, 77 insertions(+), 230 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 411a128f60..b1311a0530 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -610,7 +610,6 @@ void xtensa_translate_init(void);
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
index 5375f106fc..42baae419b 100644
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
 
@@ -92,99 +94,49 @@ enum {
     TARGET_ELOOP        = 92,
 };
 
-static uint32_t errno_h2g(int host_errno)
+static void xtensa_cb(CPUState *cs, uint64_t ret, int err)
 {
-    switch (host_errno) {
-    case 0:         return 0;
-    case EPERM:     return TARGET_EPERM;
-    case ENOENT:    return TARGET_ENOENT;
-    case ESRCH:     return TARGET_ESRCH;
-    case EINTR:     return TARGET_EINTR;
-    case EIO:       return TARGET_EIO;
-    case ENXIO:     return TARGET_ENXIO;
-    case E2BIG:     return TARGET_E2BIG;
-    case ENOEXEC:   return TARGET_ENOEXEC;
-    case EBADF:     return TARGET_EBADF;
-    case ECHILD:    return TARGET_ECHILD;
-    case EAGAIN:    return TARGET_EAGAIN;
-    case ENOMEM:    return TARGET_ENOMEM;
-    case EACCES:    return TARGET_EACCES;
-    case EFAULT:    return TARGET_EFAULT;
-#ifdef ENOTBLK
-    case ENOTBLK:   return TARGET_ENOTBLK;
-#endif
-    case EBUSY:     return TARGET_EBUSY;
-    case EEXIST:    return TARGET_EEXIST;
-    case EXDEV:     return TARGET_EXDEV;
-    case ENODEV:    return TARGET_ENODEV;
-    case ENOTDIR:   return TARGET_ENOTDIR;
-    case EISDIR:    return TARGET_EISDIR;
-    case EINVAL:    return TARGET_EINVAL;
-    case ENFILE:    return TARGET_ENFILE;
-    case EMFILE:    return TARGET_EMFILE;
-    case ENOTTY:    return TARGET_ENOTTY;
-#ifdef ETXTBSY
-    case ETXTBSY:   return TARGET_ETXTBSY;
-#endif
-    case EFBIG:     return TARGET_EFBIG;
-    case ENOSPC:    return TARGET_ENOSPC;
-    case ESPIPE:    return TARGET_ESPIPE;
-    case EROFS:     return TARGET_EROFS;
-    case EMLINK:    return TARGET_EMLINK;
-    case EPIPE:     return TARGET_EPIPE;
-    case EDOM:      return TARGET_EDOM;
-    case ERANGE:    return TARGET_ERANGE;
-    case ENOSYS:    return TARGET_ENOSYS;
-#ifdef ELOOP
-    case ELOOP:     return TARGET_ELOOP;
-#endif
-    };
+    CPUXtensaState *env = cs->env_ptr;
 
-    return TARGET_EINVAL;
-}
+#define E(N) case E##N: err = TARGET_E##N; break
 
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
-{
-    XtensaSimConsole *p = opaque;
-
-    return sizeof(p->input.buffer) - p->input.offset;
-}
-
-static IOReadHandler sim_console_read;
-static void sim_console_read(void *opaque, const uint8_t *buf, int size)
-{
-    XtensaSimConsole *p = opaque;
-    size_t copy = sizeof(p->input.buffer) - p->input.offset;
-
-    if (size < copy) {
-        copy = size;
+    switch (err) {
+    E(PERM);
+    E(NOENT);
+    E(INTR);
+    E(BADF);
+    E(ACCES);
+    E(FAULT);
+    E(BUSY);
+    E(EXIST);
+    E(NODEV);
+    E(NOTDIR);
+    E(ISDIR);
+    E(INVAL);
+    E(NFILE);
+    E(MFILE);
+    E(FBIG);
+    E(NOSPC);
+    E(SPIPE);
+    E(ROFS);
+    case GDB_ENAMETOOLONG:
+        err = TARGET_EINVAL;
+        break;
     }
-    memcpy(p->input.buffer + p->input.offset, buf, copy);
-    p->input.offset += copy;
+
+    env->regs[3] = err;
+    env->regs[2] = ret;
+
+#undef E
 }
 
-void xtensa_sim_open_console(Chardev *chr)
+static void xtensa_select_cb(CPUState *cs, uint64_t ret, int err)
 {
-    static XtensaSimConsole console;
-
-    qemu_chr_fe_init(&console.be, chr, &error_abort);
-    qemu_chr_fe_set_handlers(&console.be,
-                             sim_console_can_read,
-                             sim_console_read,
-                             NULL, NULL, &console,
-                             NULL, true);
-    sim_console = &console;
+    if (ret & G_IO_NVAL) {
+        xtensa_cb(cs, -1, GDB_EBADF);
+    } else {
+        xtensa_cb(cs, ret != 0, 0);
+    }
 }
 
 void xtensa_semihosting(CPUXtensaState *env)
@@ -194,165 +146,64 @@ void xtensa_semihosting(CPUXtensaState *env)
 
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
+                    xtensa_cb(cs, -1, GDB_EFAULT);
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
+                xtensa_cb(cs, -1, GDB_EINVAL);
+                return;
+            }
+
+            semihost_sys_poll_one(cs, xtensa_select_cb,
+                                  regs[3], events, timeout);
         }
         break;
 
-- 
2.34.1


