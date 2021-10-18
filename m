Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D0430EE7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:31:54 +0200 (CEST)
Received: from localhost ([::1]:49320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcKJP-0001Lm-45
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJaG-0002Hi-1G
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:45:08 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:63342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJaE-0005sw-Ey
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:45:07 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 076E19FABC
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:45:06 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjSK6KqFz3Jnf
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:45:05 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id BA069D89E
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:45:05 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f47.google.com with SMTP id e13so4149083qvf.5
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:45:05 -0700 (PDT)
X-Gm-Message-State: AOAM532WNTvivGinkX48smcGIwdlHloiigUIH/Gx4pGKfTDkixssO14D
 b//eVoCTWMOIxeYntOK/mjQUQ0ku0ApChP/AvP4=
X-Google-Smtp-Source: ABdhPJw3INuYm9CQdSAdoXVoZOaL6U63A+loP87GDW9NFsfkTBRCbW9uBYGNaO4/0XR8/wcQf/sGyzd2WDIWGD4+cdA=
X-Received: by 2002:a05:6214:13ce:: with SMTP id
 cg14mr23535188qvb.51.1634528705369; 
 Sun, 17 Oct 2021 20:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-7-imp@bsdimp.com>
In-Reply-To: <20211008212344.95537-7-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:44:54 -0500
X-Gmail-Original-Message-ID: <CACNAnaHqUnMadKhFczxC=cz5p3LeZigppDoDg5A0BbsReVWngw@mail.gmail.com>
Message-ID: <CACNAnaHqUnMadKhFczxC=cz5p3LeZigppDoDg5A0BbsReVWngw@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] bsd-user/mmap.c: Convert to qemu_log logging for
 mmap debugging
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 4:25 PM Warner Losh <imp@bsdimp.com> wrote:
>
> Convert DEBUG_MMAP to qemu_log CPU_LOG_PAGE.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/mmap.c | 53 +++++++++++++++++++++----------------------------
>  1 file changed, 23 insertions(+), 30 deletions(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index 301108ed25..face98573f 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -21,8 +21,6 @@
>  #include "qemu.h"
>  #include "qemu-common.h"
>
> -//#define DEBUG_MMAP
> -
>  static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
>  static __thread int mmap_lock_count;
>
> @@ -67,14 +65,11 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
>      abi_ulong end, host_start, host_end, addr;
>      int prot1, ret;
>
> -#ifdef DEBUG_MMAP
> -    printf("mprotect: start=0x" TARGET_ABI_FMT_lx
> -           "len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c\n", start, len,
> -           prot & PROT_READ ? 'r' : '-',
> -           prot & PROT_WRITE ? 'w' : '-',
> -           prot & PROT_EXEC ? 'x' : '-');
> -#endif
> -
> +    qemu_log_mask(CPU_LOG_PAGE, "mprotect: start=0x" TARGET_ABI_FMT_lx
> +                  " len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c\n", start, len,
> +                  prot & PROT_READ ? 'r' : '-',
> +                  prot & PROT_WRITE ? 'w' : '-',
> +                  prot & PROT_EXEC ? 'x' : '-');
>      if ((start & ~TARGET_PAGE_MASK) != 0)
>          return -EINVAL;
>      len = TARGET_PAGE_ALIGN(len);
> @@ -391,45 +386,43 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
>      abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
>
>      mmap_lock();
> -#ifdef DEBUG_MMAP
> -    {
> -        printf("mmap: start=0x" TARGET_ABI_FMT_lx
> -               " len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c flags=",
> -               start, len,
> -               prot & PROT_READ ? 'r' : '-',
> -               prot & PROT_WRITE ? 'w' : '-',
> -               prot & PROT_EXEC ? 'x' : '-');
> +    if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
> +        qemu_log("mmap: start=0x" TARGET_ABI_FMT_lx
> +                 " len=0x" TARGET_ABI_FMT_lx " prot=%c%c%c flags=",
> +                 start, len,
> +                 prot & PROT_READ ? 'r' : '-',
> +                 prot & PROT_WRITE ? 'w' : '-',
> +                 prot & PROT_EXEC ? 'x' : '-');
>          if (flags & MAP_ALIGNMENT_MASK) {
> -            printf("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK)
> -                    >> MAP_ALIGNMENT_SHIFT);
> +            qemu_log("MAP_ALIGNED(%u) ",
> +                     (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
>          }
>          if (flags & MAP_GUARD) {
> -            printf("MAP_GUARD ");
> +            qemu_log("MAP_GUARD ");
>          }
>          if (flags & MAP_FIXED) {
> -            printf("MAP_FIXED ");
> +            qemu_log("MAP_FIXED ");
>          }
>          if (flags & MAP_ANON) {
> -            printf("MAP_ANON ");
> +            qemu_log("MAP_ANON ");
>          }
>          if (flags & MAP_EXCL) {
> -            printf("MAP_EXCL ");
> +            qemu_log("MAP_EXCL ");
>          }
>          if (flags & MAP_PRIVATE) {
> -            printf("MAP_PRIVATE ");
> +            qemu_log("MAP_PRIVATE ");
>          }
>          if (flags & MAP_SHARED) {
> -            printf("MAP_SHARED ");
> +            qemu_log("MAP_SHARED ");
>          }
>          if (flags & MAP_NOCORE) {
> -            printf("MAP_NOCORE ");
> +            qemu_log("MAP_NOCORE ");
>          }
>          if (flags & MAP_STACK) {
> -            printf("MAP_STACK ");
> +            qemu_log("MAP_STACK ");
>          }
> -        printf("fd=%d offset=0x%llx\n", fd, offset);
> +        qemu_log("fd=%d offset=0x%lx\n", fd, offset);
>      }
> -#endif
>
>      if ((flags & MAP_ANON) && fd != -1) {
>          errno = EINVAL;
> --
> 2.32.0
>
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

