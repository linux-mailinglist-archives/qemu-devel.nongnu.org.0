Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE9B4C77A0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:25:13 +0100 (CET)
Received: from localhost ([::1]:55472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkhs-0007Xn-Hn
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:25:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkV2-0008WD-Az
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:56 -0500
Received: from [2607:f8b0:4864:20::12b] (port=36631
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkV0-0006al-0P
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:56 -0500
Received: by mail-il1-x12b.google.com with SMTP id e11so10669356ils.3
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HIQRCpKDC1DawVWcpCJ93ZH5gff2VvNr1ZGmkk/0YIk=;
 b=HofPnkVU2Qcxz7BdwdWp8nsp73W6RYmkAZTYRtId8xo2ubXsQTmCn9kJeZkWiHcOYg
 3ne773U5tfOYMWsKkt3XfXg4Tn0i8cx2Eam3CgMNLuW85xIx72eOiiiPS2rvBrK5rvGa
 5V698p+CSU9aU3tl8aF0+dSqXVqChBOUSkZDYsf0+yt7m6OKptVH+gntOjwGG7bGaUym
 xpSaPQRkucciWEj0RM2ZdtbYTfnLI8By0vRFpH95WlSBSNuKpux+MsxznlhyAExOYfEl
 xC/k4ksWbO9e7vQuIYJXDPPdZyTlS9WIZQQhw2hNp4t01ktL5Xmw9rpScrqtPb0KOkit
 IOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HIQRCpKDC1DawVWcpCJ93ZH5gff2VvNr1ZGmkk/0YIk=;
 b=I3VGjUZ+/dADVBgUcWnpMvSFsOo6yHpzY7NPPk/S3RzzbFPxduiZdMZSneaEn3+Ut+
 3liqSp7TwxsOjUsyHUBlHURgFh2nR9PGp0xhSzlzdToAdR2aNi3ixa333Kq9HWbR8krK
 O+hzmSqtNyxE3hv/keUFOmxFvOjkBXTSKL8gJ1Ymmlk5+q2bFAjg++QfFjmbU4VwuWjc
 kTUDBS3bCT9ezpDOMCWWbko+CoVoBOgDv39zSatrURGN6+C8MNgt5LdygX74U3X804Z3
 RzTy1AUIOCdqkAB1cLjp4xuURCFlFKIKKqe1f9zMgT767veTxB6diTAUK6DXzcbSyidh
 Ri8g==
X-Gm-Message-State: AOAM5309sPr3OhWvsl+CsstyzmbWH78KYrPpkLNgn81+MhBzX9d5JhEQ
 DeD1/52xzf5bzONyAd5B2t7MPAdjPLPT6Q==
X-Google-Smtp-Source: ABdhPJzEnWHw+TTtKJOZyN7dYdLUo9A/Qm7m3G5ssIkCA7ci/uA7GrT2caoKicQ0Cz5Lo6HigM/uSw==
X-Received: by 2002:a92:d208:0:b0:2c1:1a3c:7b01 with SMTP id
 y8-20020a92d208000000b002c11a3c7b01mr19023015ily.71.1646071912504; 
 Mon, 28 Feb 2022 10:11:52 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:52 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/16] bsd-user/sycall.c: Now obsolete, remove
Date: Mon, 28 Feb 2022 11:12:09 -0700
Message-Id: <20220228181214.2602-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/syscall.c | 516 ---------------------------------------------
 1 file changed, 516 deletions(-)
 delete mode 100644 bsd-user/syscall.c

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
deleted file mode 100644
index d3322760f43..00000000000
--- a/bsd-user/syscall.c
+++ /dev/null
@@ -1,516 +0,0 @@
-/*
- *  BSD syscalls
- *
- *  Copyright (c) 2003 - 2008 Fabrice Bellard
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-#include "qemu/osdep.h"
-#include "qemu/cutils.h"
-#include "qemu/path.h"
-#include <sys/syscall.h>
-#include <sys/param.h>
-#include <sys/sysctl.h>
-#include <utime.h>
-
-#include "qemu.h"
-#include "qemu-common.h"
-#include "user/syscall-trace.h"
-
-//#define DEBUG
-
-static abi_ulong target_brk;
-static abi_ulong target_original_brk;
-
-abi_long get_errno(abi_long ret)
-{
-    if (ret == -1) {
-        /* XXX need to translate host -> target errnos here */
-        return -(errno);
-    }
-    return ret;
-}
-
-#define target_to_host_bitmask(x, tbl) (x)
-
-bool is_error(abi_long ret)
-{
-    return (abi_ulong)ret >= (abi_ulong)(-4096);
-}
-
-void target_set_brk(abi_ulong new_brk)
-{
-    target_original_brk = target_brk = HOST_PAGE_ALIGN(new_brk);
-}
-
-/* do_obreak() must return target errnos. */
-static abi_long do_obreak(abi_ulong new_brk)
-{
-    abi_ulong brk_page;
-    abi_long mapped_addr;
-    int new_alloc_size;
-
-    if (!new_brk)
-        return 0;
-    if (new_brk < target_original_brk)
-        return -TARGET_EINVAL;
-
-    brk_page = HOST_PAGE_ALIGN(target_brk);
-
-    /* If the new brk is less than this, set it and we're done... */
-    if (new_brk < brk_page) {
-        target_brk = new_brk;
-        return 0;
-    }
-
-    /* We need to allocate more memory after the brk... */
-    new_alloc_size = HOST_PAGE_ALIGN(new_brk - brk_page + 1);
-    mapped_addr = get_errno(target_mmap(brk_page, new_alloc_size,
-                                        PROT_READ|PROT_WRITE,
-                                        MAP_ANON|MAP_FIXED|MAP_PRIVATE, -1, 0));
-
-    if (!is_error(mapped_addr))
-        target_brk = new_brk;
-    else
-        return mapped_addr;
-
-    return 0;
-}
-
-#ifdef __FreeBSD__
-/*
- * XXX this uses the undocumented oidfmt interface to find the kind of
- * a requested sysctl, see /sys/kern/kern_sysctl.c:sysctl_sysctl_oidfmt()
- * (this is mostly copied from src/sbin/sysctl/sysctl.c)
- */
-static int
-oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
-{
-    int qoid[CTL_MAXNAME+2];
-    uint8_t buf[BUFSIZ];
-    int i;
-    size_t j;
-
-    qoid[0] = 0;
-    qoid[1] = 4;
-    memcpy(qoid + 2, oid, len * sizeof(int));
-
-    j = sizeof(buf);
-    i = sysctl(qoid, len + 2, buf, &j, 0, 0);
-    if (i)
-        return i;
-
-    if (kind)
-        *kind = *(uint32_t *)buf;
-
-    if (fmt)
-        strcpy(fmt, (char *)(buf + sizeof(uint32_t)));
-    return (0);
-}
-
-/*
- * try and convert sysctl return data for the target.
- * XXX doesn't handle CTLTYPE_OPAQUE and CTLTYPE_STRUCT.
- */
-static int sysctl_oldcvt(void *holdp, size_t holdlen, uint32_t kind)
-{
-    switch (kind & CTLTYPE) {
-    case CTLTYPE_INT:
-    case CTLTYPE_UINT:
-        *(uint32_t *)holdp = tswap32(*(uint32_t *)holdp);
-        break;
-#ifdef TARGET_ABI32
-    case CTLTYPE_LONG:
-    case CTLTYPE_ULONG:
-        *(uint32_t *)holdp = tswap32(*(long *)holdp);
-        break;
-#else
-    case CTLTYPE_LONG:
-        *(uint64_t *)holdp = tswap64(*(long *)holdp);
-        break;
-    case CTLTYPE_ULONG:
-        *(uint64_t *)holdp = tswap64(*(unsigned long *)holdp);
-        break;
-#endif
-#ifdef CTLTYPE_U64
-    case CTLTYPE_S64:
-    case CTLTYPE_U64:
-#else
-    case CTLTYPE_QUAD:
-#endif
-        *(uint64_t *)holdp = tswap64(*(uint64_t *)holdp);
-        break;
-    case CTLTYPE_STRING:
-        break;
-    default:
-        /* XXX unhandled */
-        return -1;
-    }
-    return 0;
-}
-
-/* XXX this needs to be emulated on non-FreeBSD hosts... */
-static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen, abi_ulong oldp,
-                          abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen)
-{
-    abi_long ret;
-    void *hnamep, *holdp, *hnewp = NULL;
-    size_t holdlen;
-    abi_ulong oldlen = 0;
-    int32_t *snamep = g_malloc(sizeof(int32_t) * namelen), *p, *q, i;
-    uint32_t kind = 0;
-
-    if (oldlenp)
-        get_user_ual(oldlen, oldlenp);
-    if (!(hnamep = lock_user(VERIFY_READ, namep, namelen, 1)))
-        return -TARGET_EFAULT;
-    if (newp && !(hnewp = lock_user(VERIFY_READ, newp, newlen, 1)))
-        return -TARGET_EFAULT;
-    if (!(holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0)))
-        return -TARGET_EFAULT;
-    holdlen = oldlen;
-    for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++)
-       *q++ = tswap32(*p);
-    oidfmt(snamep, namelen, NULL, &kind);
-    /* XXX swap hnewp */
-    ret = get_errno(sysctl(snamep, namelen, holdp, &holdlen, hnewp, newlen));
-    if (!ret)
-        sysctl_oldcvt(holdp, holdlen, kind);
-    put_user_ual(holdlen, oldlenp);
-    unlock_user(hnamep, namep, 0);
-    unlock_user(holdp, oldp, holdlen);
-    if (hnewp)
-        unlock_user(hnewp, newp, 0);
-    g_free(snamep);
-    return ret;
-}
-#endif
-
-/* FIXME
- * lock_iovec()/unlock_iovec() have a return code of 0 for success where
- * other lock functions have a return code of 0 for failure.
- */
-static abi_long lock_iovec(int type, struct iovec *vec, abi_ulong target_addr,
-                           int count, int copy)
-{
-    struct target_iovec *target_vec;
-    abi_ulong base;
-    int i;
-
-    target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
-    if (!target_vec)
-        return -TARGET_EFAULT;
-    for (i = 0;i < count; i++) {
-        base = tswapl(target_vec[i].iov_base);
-        vec[i].iov_len = tswapl(target_vec[i].iov_len);
-        if (vec[i].iov_len != 0) {
-            vec[i].iov_base = lock_user(type, base, vec[i].iov_len, copy);
-            /* Don't check lock_user return value. We must call writev even
-               if a element has invalid base address. */
-        } else {
-            /* zero length pointer is ignored */
-            vec[i].iov_base = NULL;
-        }
-    }
-    unlock_user (target_vec, target_addr, 0);
-    return 0;
-}
-
-static abi_long unlock_iovec(struct iovec *vec, abi_ulong target_addr,
-                             int count, int copy)
-{
-    struct target_iovec *target_vec;
-    abi_ulong base;
-    int i;
-
-    target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
-    if (!target_vec)
-        return -TARGET_EFAULT;
-    for (i = 0;i < count; i++) {
-        if (target_vec[i].iov_base) {
-            base = tswapl(target_vec[i].iov_base);
-            unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
-        }
-    }
-    unlock_user (target_vec, target_addr, 0);
-
-    return 0;
-}
-
-/* do_syscall() should always have a single exit point at the end so
-   that actions, such as logging of syscall results, can be performed.
-   All errnos that do_syscall() returns must be -TARGET_<errcode>. */
-abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
-                            abi_long arg2, abi_long arg3, abi_long arg4,
-                            abi_long arg5, abi_long arg6, abi_long arg7,
-                            abi_long arg8)
-{
-    CPUState *cpu = env_cpu(cpu_env);
-    abi_long ret;
-    void *p;
-
-#ifdef DEBUG
-    gemu_log("freebsd syscall %d\n", num);
-#endif
-    record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
-
-    if (do_strace)
-        print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
-
-    switch (num) {
-    case TARGET_FREEBSD_NR_exit:
-#ifdef CONFIG_GPROF
-        _mcleanup();
-#endif
-        gdb_exit(arg1);
-        qemu_plugin_user_exit();
-        /* XXX: should free thread stack and CPU env */
-        _exit(arg1);
-        ret = 0; /* avoid warning */
-        break;
-    case TARGET_FREEBSD_NR_read:
-        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0)))
-            goto efault;
-        ret = get_errno(read(arg1, p, arg3));
-        unlock_user(p, arg2, ret);
-        break;
-    case TARGET_FREEBSD_NR_write:
-        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1)))
-            goto efault;
-        ret = get_errno(write(arg1, p, arg3));
-        unlock_user(p, arg2, 0);
-        break;
-    case TARGET_FREEBSD_NR_writev:
-        {
-            int count = arg3;
-            struct iovec *vec;
-
-            vec = alloca(count * sizeof(struct iovec));
-            if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0)
-                goto efault;
-            ret = get_errno(writev(arg1, vec, count));
-            unlock_iovec(vec, arg2, count, 0);
-        }
-        break;
-    case TARGET_FREEBSD_NR_open:
-        if (!(p = lock_user_string(arg1)))
-            goto efault;
-        ret = get_errno(open(path(p),
-                             target_to_host_bitmask(arg2, fcntl_flags_tbl),
-                             arg3));
-        unlock_user(p, arg1, 0);
-        break;
-    case TARGET_FREEBSD_NR_mmap:
-        ret = get_errno(target_mmap(arg1, arg2, arg3,
-                                    target_to_host_bitmask(arg4, mmap_flags_tbl),
-                                    arg5,
-                                    arg6));
-        break;
-    case TARGET_FREEBSD_NR_mprotect:
-        ret = get_errno(target_mprotect(arg1, arg2, arg3));
-        break;
-    case TARGET_FREEBSD_NR_break:
-        ret = do_obreak(arg1);
-        break;
-#ifdef __FreeBSD__
-    case TARGET_FREEBSD_NR___sysctl:
-        ret = do_freebsd_sysctl(arg1, arg2, arg3, arg4, arg5, arg6);
-        break;
-#endif
-    case TARGET_FREEBSD_NR_sysarch:
-        ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
-        break;
-    case TARGET_FREEBSD_NR_syscall:
-    case TARGET_FREEBSD_NR___syscall:
-        ret = do_freebsd_syscall(cpu_env,arg1 & 0xffff,arg2,arg3,arg4,arg5,arg6,arg7,arg8,0);
-        break;
-    default:
-        ret = get_errno(syscall(num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8));
-        break;
-    }
- fail:
-#ifdef DEBUG
-    gemu_log(" = %ld\n", ret);
-#endif
-    if (do_strace)
-        print_freebsd_syscall_ret(num, ret);
-
-    record_syscall_return(cpu, num, ret);
-    return ret;
- efault:
-    ret = -TARGET_EFAULT;
-    goto fail;
-}
-
-abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
-                           abi_long arg2, abi_long arg3, abi_long arg4,
-                           abi_long arg5, abi_long arg6)
-{
-    CPUState *cpu = env_cpu(cpu_env);
-    abi_long ret;
-    void *p;
-
-#ifdef DEBUG
-    gemu_log("netbsd syscall %d\n", num);
-#endif
-
-    record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
-
-    if (do_strace)
-        print_netbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
-
-    switch (num) {
-    case TARGET_NETBSD_NR_exit:
-#ifdef CONFIG_GPROF
-        _mcleanup();
-#endif
-        gdb_exit(arg1);
-        qemu_plugin_user_exit();
-        /* XXX: should free thread stack and CPU env */
-        _exit(arg1);
-        ret = 0; /* avoid warning */
-        break;
-    case TARGET_NETBSD_NR_read:
-        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0)))
-            goto efault;
-        ret = get_errno(read(arg1, p, arg3));
-        unlock_user(p, arg2, ret);
-        break;
-    case TARGET_NETBSD_NR_write:
-        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1)))
-            goto efault;
-        ret = get_errno(write(arg1, p, arg3));
-        unlock_user(p, arg2, 0);
-        break;
-    case TARGET_NETBSD_NR_open:
-        if (!(p = lock_user_string(arg1)))
-            goto efault;
-        ret = get_errno(open(path(p),
-                             target_to_host_bitmask(arg2, fcntl_flags_tbl),
-                             arg3));
-        unlock_user(p, arg1, 0);
-        break;
-    case TARGET_NETBSD_NR_mmap:
-        ret = get_errno(target_mmap(arg1, arg2, arg3,
-                                    target_to_host_bitmask(arg4, mmap_flags_tbl),
-                                    arg5,
-                                    arg6));
-        break;
-    case TARGET_NETBSD_NR_mprotect:
-        ret = get_errno(target_mprotect(arg1, arg2, arg3));
-        break;
-    case TARGET_NETBSD_NR_syscall:
-    case TARGET_NETBSD_NR___syscall:
-        ret = do_netbsd_syscall(cpu_env,arg1 & 0xffff,arg2,arg3,arg4,arg5,arg6,0);
-        break;
-    default:
-        ret = syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
-        break;
-    }
- fail:
-#ifdef DEBUG
-    gemu_log(" = %ld\n", ret);
-#endif
-    if (do_strace)
-        print_netbsd_syscall_ret(num, ret);
-
-    record_syscall_return(cpu, num, ret);
-    return ret;
- efault:
-    ret = -TARGET_EFAULT;
-    goto fail;
-}
-
-abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
-                            abi_long arg2, abi_long arg3, abi_long arg4,
-                            abi_long arg5, abi_long arg6)
-{
-    CPUState *cpu = env_cpu(cpu_env);
-    abi_long ret;
-    void *p;
-
-#ifdef DEBUG
-    gemu_log("openbsd syscall %d\n", num);
-#endif
-
-    record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
-
-    if (do_strace)
-        print_openbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
-
-    switch (num) {
-    case TARGET_OPENBSD_NR_exit:
-#ifdef CONFIG_GPROF
-        _mcleanup();
-#endif
-        gdb_exit(arg1);
-        qemu_plugin_user_exit();
-        /* XXX: should free thread stack and CPU env */
-        _exit(arg1);
-        ret = 0; /* avoid warning */
-        break;
-    case TARGET_OPENBSD_NR_read:
-        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0)))
-            goto efault;
-        ret = get_errno(read(arg1, p, arg3));
-        unlock_user(p, arg2, ret);
-        break;
-    case TARGET_OPENBSD_NR_write:
-        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1)))
-            goto efault;
-        ret = get_errno(write(arg1, p, arg3));
-        unlock_user(p, arg2, 0);
-        break;
-    case TARGET_OPENBSD_NR_open:
-        if (!(p = lock_user_string(arg1)))
-            goto efault;
-        ret = get_errno(open(path(p),
-                             target_to_host_bitmask(arg2, fcntl_flags_tbl),
-                             arg3));
-        unlock_user(p, arg1, 0);
-        break;
-    case TARGET_OPENBSD_NR_mmap:
-        ret = get_errno(target_mmap(arg1, arg2, arg3,
-                                    target_to_host_bitmask(arg4, mmap_flags_tbl),
-                                    arg5,
-                                    arg6));
-        break;
-    case TARGET_OPENBSD_NR_mprotect:
-        ret = get_errno(target_mprotect(arg1, arg2, arg3));
-        break;
-    case TARGET_OPENBSD_NR_syscall:
-    case TARGET_OPENBSD_NR___syscall:
-        ret = do_openbsd_syscall(cpu_env,arg1 & 0xffff,arg2,arg3,arg4,arg5,arg6,0);
-        break;
-    default:
-        ret = syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
-        break;
-    }
- fail:
-#ifdef DEBUG
-    gemu_log(" = %ld\n", ret);
-#endif
-    if (do_strace)
-        print_openbsd_syscall_ret(num, ret);
-
-    record_syscall_return(cpu, num, ret);
-    return ret;
- efault:
-    ret = -TARGET_EFAULT;
-    goto fail;
-}
-
-void syscall_init(void)
-{
-}
-- 
2.33.1


