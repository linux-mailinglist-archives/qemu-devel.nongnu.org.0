Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531294A64ED
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:24:04 +0100 (CET)
Received: from localhost ([::1]:36884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEyl0-0000ji-JM
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:24:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw8B-0005C6-5m
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:35:47 -0500
Received: from [2610:1c1:1:606c::19:2] (port=17952 helo=mx2.freebsd.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEw87-0000Sd-1D
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:35:46 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 2665D7F119
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:35:27 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9XG43CJz4dKY
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:35:26 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643733326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b3JlaNA1IawoVu/e7mDobtn4qXHujTVfAYbGb3fzIoU=;
 b=RXxorXKj3iykDd1PfWocI3NIPHaMYv+CGqiF/m6WOtg8PFJiwR1jxdmoJF/0nSEwxBC+5E
 VEyppKtT4hgPEAXBRCZBlmd2ylYNibaL1+8iq++Ey2ZU/O6IjcM37BDedUR7XxKDlknged
 2q4djwHYFs0R1FjMv2MJUjIwW7at4hi8Bl0JPBa8O2hd5m6F+08A+ozaWzAJkUYvo+Iq9Y
 J2P2TFSHEjUUo8aj1VCgYAQOco7jfI0Fys3oqS7rV/tzK++xu28seQRz4SRWNhHJlr0niU
 +h3BFU4hnjdtsa/bO0H9u8Z0ocDyFI+a8T/wy6UQrK+vIkaJ8lqq4Uw3eZ+K5Q==
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 670D22F112
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:35:26 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f50.google.com with SMTP id i19so16471574qvx.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:35:26 -0800 (PST)
X-Gm-Message-State: AOAM531ovCve778G03m1XrIB+88cMRsfNCDZ2dP0Ix7dwo4UvLKEkhLJ
 nbevqjXotEO4g8XQGTzmpTvgOnz0KeyFYLnRImk=
X-Google-Smtp-Source: ABdhPJy9ldB6Im6OJ1IMzzxqifMlPj5T4yC2oxpD/zuAvQIbtMroVPAWYBY8C6MfK0XcPdKPbtBAlyR+xzJ8mm/lO4Y=
X-Received: by 2002:a05:6214:226c:: with SMTP id
 gs12mr23483979qvb.33.1643733325866; 
 Tue, 01 Feb 2022 08:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-12-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-12-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:35:14 -0600
X-Gmail-Original-Message-ID: <CACNAnaGBE6764h8U5HDZddh6FJB6o9D9V-uDNmEqooTP54gPLw@mail.gmail.com>
Message-ID: <CACNAnaGBE6764h8U5HDZddh6FJB6o9D9V-uDNmEqooTP54gPLw@mail.gmail.com>
Subject: Re: [PATCH 11/22] bsd-user/sycall.c: Now obsolete, remove
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643733326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b3JlaNA1IawoVu/e7mDobtn4qXHujTVfAYbGb3fzIoU=;
 b=HX3A8GJXPj3XxXisu/vVTsVvv4YeS04K+waOhqUEHUnm0/JaFyseadY6zBl+EJpL9WIkSm
 o+sy84QRnHQ1mXWm/Cslu4baiJmaoW6D8jT/sL7jzQxfdwNHI7Fzx3zcT31YttLt+yR9L5
 /vHjZ3oi+pcSr5y+9HtK083ZZBmvu6E3gTFLa89uzkoEMN1OkMskBl6Ef8J2413GG0cN1+
 d8BZNn1LEP9PPpJxJG+348skU5we572LV3lcqHGAffLTCXJ+1sophNK4VdDwrw0Va7Yvmc
 i2xdVru1VeowlO4FR972Obnxg5qvUa30QVy+5c8tCpA1Lu3kkNNAeVh44SW9mg==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643733326; a=rsa-sha256; cv=none;
 b=kgdMYvzuU2bUabBmRrC5tjjyllXL++xO4UkFr7EbjG50q/rpY9jxyVO3U0tQBXziNtKFaf
 DsnKBV+Zk0i5NcbXCdZw5a3sAjI7lceNAXsYUOJx1rwVJtSw+RsSF9wfIqIWmMVhpVG88j
 /eYTpIQGRvvzpdHWmhtO2XZCQOyEwnhz8UTAfoAXZyhkdEPozN2DSI/AmMVrS4AMc6ehf+
 8PMV6IvZpgw+rbR+Gi+BE5o105c1I1BHWoEMALWb6Kbv2DTD7NmTqHPTQNojOyiGMb+exE
 5Uxkq0J/Xq9GaIxUG9/jj1nJlAtFhtvGobZos5IMulJTnVH0V9Xs6KwW3uhhRA==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2610:1c1:1:606c::19:2
 (failed)
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, def@freebsd.org,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 5:15 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/syscall.c | 516 ---------------------------------------------
>  1 file changed, 516 deletions(-)
>  delete mode 100644 bsd-user/syscall.c
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> deleted file mode 100644
> index d3322760f43..00000000000
> --- a/bsd-user/syscall.c
> +++ /dev/null
> @@ -1,516 +0,0 @@
> -/*
> - *  BSD syscalls
> - *
> - *  Copyright (c) 2003 - 2008 Fabrice Bellard
> - *
> - *  This program is free software; you can redistribute it and/or modify
> - *  it under the terms of the GNU General Public License as published by
> - *  the Free Software Foundation; either version 2 of the License, or
> - *  (at your option) any later version.
> - *
> - *  This program is distributed in the hope that it will be useful,
> - *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> - *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - *  GNU General Public License for more details.
> - *
> - *  You should have received a copy of the GNU General Public License
> - *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> - */
> -#include "qemu/osdep.h"
> -#include "qemu/cutils.h"
> -#include "qemu/path.h"
> -#include <sys/syscall.h>
> -#include <sys/param.h>
> -#include <sys/sysctl.h>
> -#include <utime.h>
> -
> -#include "qemu.h"
> -#include "qemu-common.h"
> -#include "user/syscall-trace.h"
> -
> -//#define DEBUG
> -
> -static abi_ulong target_brk;
> -static abi_ulong target_original_brk;
> -
> -abi_long get_errno(abi_long ret)
> -{
> -    if (ret == -1) {
> -        /* XXX need to translate host -> target errnos here */
> -        return -(errno);
> -    }
> -    return ret;
> -}
> -
> -#define target_to_host_bitmask(x, tbl) (x)
> -
> -bool is_error(abi_long ret)
> -{
> -    return (abi_ulong)ret >= (abi_ulong)(-4096);
> -}
> -
> -void target_set_brk(abi_ulong new_brk)
> -{
> -    target_original_brk = target_brk = HOST_PAGE_ALIGN(new_brk);
> -}
> -
> -/* do_obreak() must return target errnos. */
> -static abi_long do_obreak(abi_ulong new_brk)
> -{
> -    abi_ulong brk_page;
> -    abi_long mapped_addr;
> -    int new_alloc_size;
> -
> -    if (!new_brk)
> -        return 0;
> -    if (new_brk < target_original_brk)
> -        return -TARGET_EINVAL;
> -
> -    brk_page = HOST_PAGE_ALIGN(target_brk);
> -
> -    /* If the new brk is less than this, set it and we're done... */
> -    if (new_brk < brk_page) {
> -        target_brk = new_brk;
> -        return 0;
> -    }
> -
> -    /* We need to allocate more memory after the brk... */
> -    new_alloc_size = HOST_PAGE_ALIGN(new_brk - brk_page + 1);
> -    mapped_addr = get_errno(target_mmap(brk_page, new_alloc_size,
> -                                        PROT_READ|PROT_WRITE,
> -                                        MAP_ANON|MAP_FIXED|MAP_PRIVATE, -1, 0));
> -
> -    if (!is_error(mapped_addr))
> -        target_brk = new_brk;
> -    else
> -        return mapped_addr;
> -
> -    return 0;
> -}
> -
> -#ifdef __FreeBSD__
> -/*
> - * XXX this uses the undocumented oidfmt interface to find the kind of
> - * a requested sysctl, see /sys/kern/kern_sysctl.c:sysctl_sysctl_oidfmt()
> - * (this is mostly copied from src/sbin/sysctl/sysctl.c)
> - */
> -static int
> -oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
> -{
> -    int qoid[CTL_MAXNAME+2];
> -    uint8_t buf[BUFSIZ];
> -    int i;
> -    size_t j;
> -
> -    qoid[0] = 0;
> -    qoid[1] = 4;
> -    memcpy(qoid + 2, oid, len * sizeof(int));
> -
> -    j = sizeof(buf);
> -    i = sysctl(qoid, len + 2, buf, &j, 0, 0);
> -    if (i)
> -        return i;
> -
> -    if (kind)
> -        *kind = *(uint32_t *)buf;
> -
> -    if (fmt)
> -        strcpy(fmt, (char *)(buf + sizeof(uint32_t)));
> -    return (0);
> -}
> -
> -/*
> - * try and convert sysctl return data for the target.
> - * XXX doesn't handle CTLTYPE_OPAQUE and CTLTYPE_STRUCT.
> - */
> -static int sysctl_oldcvt(void *holdp, size_t holdlen, uint32_t kind)
> -{
> -    switch (kind & CTLTYPE) {
> -    case CTLTYPE_INT:
> -    case CTLTYPE_UINT:
> -        *(uint32_t *)holdp = tswap32(*(uint32_t *)holdp);
> -        break;
> -#ifdef TARGET_ABI32
> -    case CTLTYPE_LONG:
> -    case CTLTYPE_ULONG:
> -        *(uint32_t *)holdp = tswap32(*(long *)holdp);
> -        break;
> -#else
> -    case CTLTYPE_LONG:
> -        *(uint64_t *)holdp = tswap64(*(long *)holdp);
> -        break;
> -    case CTLTYPE_ULONG:
> -        *(uint64_t *)holdp = tswap64(*(unsigned long *)holdp);
> -        break;
> -#endif
> -#ifdef CTLTYPE_U64
> -    case CTLTYPE_S64:
> -    case CTLTYPE_U64:
> -#else
> -    case CTLTYPE_QUAD:
> -#endif
> -        *(uint64_t *)holdp = tswap64(*(uint64_t *)holdp);
> -        break;
> -    case CTLTYPE_STRING:
> -        break;
> -    default:
> -        /* XXX unhandled */
> -        return -1;
> -    }
> -    return 0;
> -}
> -
> -/* XXX this needs to be emulated on non-FreeBSD hosts... */
> -static abi_long do_freebsd_sysctl(abi_ulong namep, int32_t namelen, abi_ulong oldp,
> -                          abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen)
> -{
> -    abi_long ret;
> -    void *hnamep, *holdp, *hnewp = NULL;
> -    size_t holdlen;
> -    abi_ulong oldlen = 0;
> -    int32_t *snamep = g_malloc(sizeof(int32_t) * namelen), *p, *q, i;
> -    uint32_t kind = 0;
> -
> -    if (oldlenp)
> -        get_user_ual(oldlen, oldlenp);
> -    if (!(hnamep = lock_user(VERIFY_READ, namep, namelen, 1)))
> -        return -TARGET_EFAULT;
> -    if (newp && !(hnewp = lock_user(VERIFY_READ, newp, newlen, 1)))
> -        return -TARGET_EFAULT;
> -    if (!(holdp = lock_user(VERIFY_WRITE, oldp, oldlen, 0)))
> -        return -TARGET_EFAULT;
> -    holdlen = oldlen;
> -    for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++)
> -       *q++ = tswap32(*p);
> -    oidfmt(snamep, namelen, NULL, &kind);
> -    /* XXX swap hnewp */
> -    ret = get_errno(sysctl(snamep, namelen, holdp, &holdlen, hnewp, newlen));
> -    if (!ret)
> -        sysctl_oldcvt(holdp, holdlen, kind);
> -    put_user_ual(holdlen, oldlenp);
> -    unlock_user(hnamep, namep, 0);
> -    unlock_user(holdp, oldp, holdlen);
> -    if (hnewp)
> -        unlock_user(hnewp, newp, 0);
> -    g_free(snamep);
> -    return ret;
> -}
> -#endif
> -
> -/* FIXME
> - * lock_iovec()/unlock_iovec() have a return code of 0 for success where
> - * other lock functions have a return code of 0 for failure.
> - */
> -static abi_long lock_iovec(int type, struct iovec *vec, abi_ulong target_addr,
> -                           int count, int copy)
> -{
> -    struct target_iovec *target_vec;
> -    abi_ulong base;
> -    int i;
> -
> -    target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
> -    if (!target_vec)
> -        return -TARGET_EFAULT;
> -    for (i = 0;i < count; i++) {
> -        base = tswapl(target_vec[i].iov_base);
> -        vec[i].iov_len = tswapl(target_vec[i].iov_len);
> -        if (vec[i].iov_len != 0) {
> -            vec[i].iov_base = lock_user(type, base, vec[i].iov_len, copy);
> -            /* Don't check lock_user return value. We must call writev even
> -               if a element has invalid base address. */
> -        } else {
> -            /* zero length pointer is ignored */
> -            vec[i].iov_base = NULL;
> -        }
> -    }
> -    unlock_user (target_vec, target_addr, 0);
> -    return 0;
> -}
> -
> -static abi_long unlock_iovec(struct iovec *vec, abi_ulong target_addr,
> -                             int count, int copy)
> -{
> -    struct target_iovec *target_vec;
> -    abi_ulong base;
> -    int i;
> -
> -    target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
> -    if (!target_vec)
> -        return -TARGET_EFAULT;
> -    for (i = 0;i < count; i++) {
> -        if (target_vec[i].iov_base) {
> -            base = tswapl(target_vec[i].iov_base);
> -            unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
> -        }
> -    }
> -    unlock_user (target_vec, target_addr, 0);
> -
> -    return 0;
> -}
> -
> -/* do_syscall() should always have a single exit point at the end so
> -   that actions, such as logging of syscall results, can be performed.
> -   All errnos that do_syscall() returns must be -TARGET_<errcode>. */
> -abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
> -                            abi_long arg2, abi_long arg3, abi_long arg4,
> -                            abi_long arg5, abi_long arg6, abi_long arg7,
> -                            abi_long arg8)
> -{
> -    CPUState *cpu = env_cpu(cpu_env);
> -    abi_long ret;
> -    void *p;
> -
> -#ifdef DEBUG
> -    gemu_log("freebsd syscall %d\n", num);
> -#endif
> -    record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
> -
> -    if (do_strace)
> -        print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
> -
> -    switch (num) {
> -    case TARGET_FREEBSD_NR_exit:
> -#ifdef CONFIG_GPROF
> -        _mcleanup();
> -#endif
> -        gdb_exit(arg1);
> -        qemu_plugin_user_exit();
> -        /* XXX: should free thread stack and CPU env */
> -        _exit(arg1);
> -        ret = 0; /* avoid warning */
> -        break;
> -    case TARGET_FREEBSD_NR_read:
> -        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0)))
> -            goto efault;
> -        ret = get_errno(read(arg1, p, arg3));
> -        unlock_user(p, arg2, ret);
> -        break;
> -    case TARGET_FREEBSD_NR_write:
> -        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1)))
> -            goto efault;
> -        ret = get_errno(write(arg1, p, arg3));
> -        unlock_user(p, arg2, 0);
> -        break;
> -    case TARGET_FREEBSD_NR_writev:
> -        {
> -            int count = arg3;
> -            struct iovec *vec;
> -
> -            vec = alloca(count * sizeof(struct iovec));
> -            if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0)
> -                goto efault;
> -            ret = get_errno(writev(arg1, vec, count));
> -            unlock_iovec(vec, arg2, count, 0);
> -        }
> -        break;
> -    case TARGET_FREEBSD_NR_open:
> -        if (!(p = lock_user_string(arg1)))
> -            goto efault;
> -        ret = get_errno(open(path(p),
> -                             target_to_host_bitmask(arg2, fcntl_flags_tbl),
> -                             arg3));
> -        unlock_user(p, arg1, 0);
> -        break;
> -    case TARGET_FREEBSD_NR_mmap:
> -        ret = get_errno(target_mmap(arg1, arg2, arg3,
> -                                    target_to_host_bitmask(arg4, mmap_flags_tbl),
> -                                    arg5,
> -                                    arg6));
> -        break;
> -    case TARGET_FREEBSD_NR_mprotect:
> -        ret = get_errno(target_mprotect(arg1, arg2, arg3));
> -        break;
> -    case TARGET_FREEBSD_NR_break:
> -        ret = do_obreak(arg1);
> -        break;
> -#ifdef __FreeBSD__
> -    case TARGET_FREEBSD_NR___sysctl:
> -        ret = do_freebsd_sysctl(arg1, arg2, arg3, arg4, arg5, arg6);
> -        break;
> -#endif
> -    case TARGET_FREEBSD_NR_sysarch:
> -        ret = do_freebsd_sysarch(cpu_env, arg1, arg2);
> -        break;
> -    case TARGET_FREEBSD_NR_syscall:
> -    case TARGET_FREEBSD_NR___syscall:
> -        ret = do_freebsd_syscall(cpu_env,arg1 & 0xffff,arg2,arg3,arg4,arg5,arg6,arg7,arg8,0);
> -        break;
> -    default:
> -        ret = get_errno(syscall(num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8));
> -        break;
> -    }
> - fail:
> -#ifdef DEBUG
> -    gemu_log(" = %ld\n", ret);
> -#endif
> -    if (do_strace)
> -        print_freebsd_syscall_ret(num, ret);
> -
> -    record_syscall_return(cpu, num, ret);
> -    return ret;
> - efault:
> -    ret = -TARGET_EFAULT;
> -    goto fail;
> -}
> -
> -abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
> -                           abi_long arg2, abi_long arg3, abi_long arg4,
> -                           abi_long arg5, abi_long arg6)
> -{
> -    CPUState *cpu = env_cpu(cpu_env);
> -    abi_long ret;
> -    void *p;
> -
> -#ifdef DEBUG
> -    gemu_log("netbsd syscall %d\n", num);
> -#endif
> -
> -    record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
> -
> -    if (do_strace)
> -        print_netbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
> -
> -    switch (num) {
> -    case TARGET_NETBSD_NR_exit:
> -#ifdef CONFIG_GPROF
> -        _mcleanup();
> -#endif
> -        gdb_exit(arg1);
> -        qemu_plugin_user_exit();
> -        /* XXX: should free thread stack and CPU env */
> -        _exit(arg1);
> -        ret = 0; /* avoid warning */
> -        break;
> -    case TARGET_NETBSD_NR_read:
> -        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0)))
> -            goto efault;
> -        ret = get_errno(read(arg1, p, arg3));
> -        unlock_user(p, arg2, ret);
> -        break;
> -    case TARGET_NETBSD_NR_write:
> -        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1)))
> -            goto efault;
> -        ret = get_errno(write(arg1, p, arg3));
> -        unlock_user(p, arg2, 0);
> -        break;
> -    case TARGET_NETBSD_NR_open:
> -        if (!(p = lock_user_string(arg1)))
> -            goto efault;
> -        ret = get_errno(open(path(p),
> -                             target_to_host_bitmask(arg2, fcntl_flags_tbl),
> -                             arg3));
> -        unlock_user(p, arg1, 0);
> -        break;
> -    case TARGET_NETBSD_NR_mmap:
> -        ret = get_errno(target_mmap(arg1, arg2, arg3,
> -                                    target_to_host_bitmask(arg4, mmap_flags_tbl),
> -                                    arg5,
> -                                    arg6));
> -        break;
> -    case TARGET_NETBSD_NR_mprotect:
> -        ret = get_errno(target_mprotect(arg1, arg2, arg3));
> -        break;
> -    case TARGET_NETBSD_NR_syscall:
> -    case TARGET_NETBSD_NR___syscall:
> -        ret = do_netbsd_syscall(cpu_env,arg1 & 0xffff,arg2,arg3,arg4,arg5,arg6,0);
> -        break;
> -    default:
> -        ret = syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
> -        break;
> -    }
> - fail:
> -#ifdef DEBUG
> -    gemu_log(" = %ld\n", ret);
> -#endif
> -    if (do_strace)
> -        print_netbsd_syscall_ret(num, ret);
> -
> -    record_syscall_return(cpu, num, ret);
> -    return ret;
> - efault:
> -    ret = -TARGET_EFAULT;
> -    goto fail;
> -}
> -
> -abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
> -                            abi_long arg2, abi_long arg3, abi_long arg4,
> -                            abi_long arg5, abi_long arg6)
> -{
> -    CPUState *cpu = env_cpu(cpu_env);
> -    abi_long ret;
> -    void *p;
> -
> -#ifdef DEBUG
> -    gemu_log("openbsd syscall %d\n", num);
> -#endif
> -
> -    record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
> -
> -    if (do_strace)
> -        print_openbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
> -
> -    switch (num) {
> -    case TARGET_OPENBSD_NR_exit:
> -#ifdef CONFIG_GPROF
> -        _mcleanup();
> -#endif
> -        gdb_exit(arg1);
> -        qemu_plugin_user_exit();
> -        /* XXX: should free thread stack and CPU env */
> -        _exit(arg1);
> -        ret = 0; /* avoid warning */
> -        break;
> -    case TARGET_OPENBSD_NR_read:
> -        if (!(p = lock_user(VERIFY_WRITE, arg2, arg3, 0)))
> -            goto efault;
> -        ret = get_errno(read(arg1, p, arg3));
> -        unlock_user(p, arg2, ret);
> -        break;
> -    case TARGET_OPENBSD_NR_write:
> -        if (!(p = lock_user(VERIFY_READ, arg2, arg3, 1)))
> -            goto efault;
> -        ret = get_errno(write(arg1, p, arg3));
> -        unlock_user(p, arg2, 0);
> -        break;
> -    case TARGET_OPENBSD_NR_open:
> -        if (!(p = lock_user_string(arg1)))
> -            goto efault;
> -        ret = get_errno(open(path(p),
> -                             target_to_host_bitmask(arg2, fcntl_flags_tbl),
> -                             arg3));
> -        unlock_user(p, arg1, 0);
> -        break;
> -    case TARGET_OPENBSD_NR_mmap:
> -        ret = get_errno(target_mmap(arg1, arg2, arg3,
> -                                    target_to_host_bitmask(arg4, mmap_flags_tbl),
> -                                    arg5,
> -                                    arg6));
> -        break;
> -    case TARGET_OPENBSD_NR_mprotect:
> -        ret = get_errno(target_mprotect(arg1, arg2, arg3));
> -        break;
> -    case TARGET_OPENBSD_NR_syscall:
> -    case TARGET_OPENBSD_NR___syscall:
> -        ret = do_openbsd_syscall(cpu_env,arg1 & 0xffff,arg2,arg3,arg4,arg5,arg6,0);
> -        break;
> -    default:
> -        ret = syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
> -        break;
> -    }
> - fail:
> -#ifdef DEBUG
> -    gemu_log(" = %ld\n", ret);
> -#endif
> -    if (do_strace)
> -        print_openbsd_syscall_ret(num, ret);
> -
> -    record_syscall_return(cpu, num, ret);
> -    return ret;
> - efault:
> -    ret = -TARGET_EFAULT;
> -    goto fail;
> -}
> -
> -void syscall_init(void)
> -{
> -}
> --
> 2.33.1
>

