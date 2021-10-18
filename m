Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41322430F6A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:57:20 +0200 (CEST)
Received: from localhost ([::1]:42328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcKi5-0008PG-0A
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJZ0-0001hK-2f
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:43:50 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:62763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJYs-0004VI-MW
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:43:49 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id C94DB9FC0D
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:43:40 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjQh4xnTz3Jf9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:43:40 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 8B262D71F
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:43:40 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f43.google.com with SMTP id z3so9505947qvl.9
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:43:40 -0700 (PDT)
X-Gm-Message-State: AOAM530eNny5fUlQBUUM1NLBOfmi6Gu7QX1ewhe0Q5q0ig87GtQHncaS
 HNFWAZePYxodJ8pyyPSfoi31j063wbyogooukJc=
X-Google-Smtp-Source: ABdhPJw5NpFXf6ybWL5kQzhRNS3nXbWJVks542HGxtw+E9bDn6ki1eI7p+FdzMzy1i77FHoAybn4mGibwVGM8Jtmrao=
X-Received: by 2002:a0c:b2c2:: with SMTP id d2mr23732567qvf.64.1634528620175; 
 Sun, 17 Oct 2021 20:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-8-imp@bsdimp.com>
In-Reply-To: <20211008212344.95537-8-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:43:29 -0500
X-Gmail-Original-Message-ID: <CACNAnaHpiKqSj3cQ95hCeuRLESQA7XYmBRc0=7=mx-iukmD+eg@mail.gmail.com>
Message-ID: <CACNAnaHpiKqSj3cQ95hCeuRLESQA7XYmBRc0=7=mx-iukmD+eg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
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
Cc: Kyle Evans <kevans@freebsd.org>, Guy Yur <guyyur@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 4:29 PM Warner Losh <imp@bsdimp.com> wrote:
>
> From: Guy Yur <guyyur@gmail.com>
>
> Switch checks for !(flags & MAP_ANONYMOUS) with checks for fd != -1.
> MAP_STACK and MAP_GUARD both require fd == -1 and don't require mapping
> the fd either. Add analysis from Guy Yur detailing the different cases
> for MAP_GUARD and MAP_STACK.
>
> Signed-off-by: Guy Yur <guyyur@gmail.com>
> [ partially merged before, finishing the job and documenting origin]
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/mmap.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index face98573f..4ecd949a10 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -127,7 +127,27 @@ error:
>      return ret;
>  }
>
> -/* map an incomplete host page */
> +/*
> + * map an incomplete host page
> + *
> + * mmap_frag can be called with a valid fd, if flags doesn't contain one of
> + * MAP_ANON, MAP_STACK, MAP_GUARD. If we need to map a page in those cases, we
> + * pass fd == -1. However, if flags contains MAP_GUARD then MAP_ANON cannot be
> + * added.
> + *
> + * * If fd is valid (not -1) we want to map the pages with MAP_ANON.
> + * * If flags contains MAP_GUARD we don't want to add MAP_ANON because it
> + *   will be rejected.  See kern_mmap's enforcing of constraints for MAP_GUARD
> + *   in sys/vm/vm_mmap.c.
> + * * If flags contains MAP_ANON it doesn't matter if we add it or not.
> + * * If flags contains MAP_STACK, mmap adds MAP_ANON when called so doesn't
> + *   matter if we add it or not either. See enforcing of constraints for
> + *   MAP_STACK in kern_mmap.
> + *
> + * Don't add MAP_ANON for the flags that use fd == -1 without specifying the
> + * flags directly, with the assumption that future flags that require fd == -1
> + * will also not require MAP_ANON.
> + */
>  static int mmap_frag(abi_ulong real_start,
>                       abi_ulong start, abi_ulong end,
>                       int prot, int flags, int fd, abi_ulong offset)
> @@ -147,9 +167,9 @@ static int mmap_frag(abi_ulong real_start,
>      }
>
>      if (prot1 == 0) {
> -        /* no page was there, so we allocate one */
> +        /* no page was there, so we allocate one. See also above. */
>          void *p = mmap(host_start, qemu_host_page_size, prot,
> -                       flags | MAP_ANON, -1, 0);
> +                       flags | ((fd != -1) ? MAP_ANON : 0), -1, 0);
>          if (p == MAP_FAILED)
>              return -1;
>          prot1 = prot;
> @@ -157,7 +177,7 @@ static int mmap_frag(abi_ulong real_start,
>      prot1 &= PAGE_BITS;
>
>      prot_new = prot | prot1;
> -    if (!(flags & MAP_ANON)) {
> +    if (fd != -1) {
>          /* msync() won't work here, so we return an error if write is
>             possible while it is a shared mapping */
>          if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
> @@ -565,7 +585,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
>           * worst case: we cannot map the file because the offset is not
>           * aligned, so we read it
>           */
> -        if (!(flags & MAP_ANON) &&
> +        if (fd != -1 &&
>              (offset & ~qemu_host_page_mask) != (start & ~qemu_host_page_mask)) {
>              /*
>               * msync() won't work here, so we return an error if write is
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

