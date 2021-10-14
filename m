Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7DE42DE05
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:23:44 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2a5-0007lt-V8
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2Jc-00017X-Ma
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:06:40 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:23296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2JZ-0001WJ-2Z
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:06:39 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 3CCBBAC768
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:06:36 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HVXmX0k6Qz4fS2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:06:36 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id EE5743E2D
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:06:35 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f173.google.com with SMTP id w2so6081521qtn.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:06:35 -0700 (PDT)
X-Gm-Message-State: AOAM533icnqWYC8rMCqwKwvNYV9X/iko6vfg80WHoQr8An4f93EesSqQ
 NwpHsPQlXB7AL050LFhf1b32grapG2uqNo10/+I=
X-Google-Smtp-Source: ABdhPJyNl7hvGSc7mmu6FP3HBnKwBOFeoLJBcBPSsub7l8y29hggEzcExBJimByRi9lpsGfBA4dvLGUo/sh6qimBXNg=
X-Received: by 2002:ac8:514f:: with SMTP id h15mr7046462qtn.340.1634223995512; 
 Thu, 14 Oct 2021 08:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-6-imp@bsdimp.com>
In-Reply-To: <20211008212344.95537-6-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 14 Oct 2021 10:06:24 -0500
X-Gmail-Original-Message-ID: <CACNAnaEz17VAvBy1ZA5ZFKr7QqAFhwLof7aPG3S71vmi-GgWYw@mail.gmail.com>
Message-ID: <CACNAnaEz17VAvBy1ZA5ZFKr7QqAFhwLof7aPG3S71vmi-GgWYw@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] bsd-user/mmap.c: mmap prefer MAP_ANON for BSD
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Oct 8, 2021 at 4:24 PM Warner Losh <imp@bsdimp.com> wrote:
>
> MAP_ANON and MAP_ANONYMOUS are identical. Prefer MAP_ANON for BSD since
> the file is now a confusing mix of the two.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/mmap.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index f0be3b12cf..301108ed25 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -285,7 +285,7 @@ static abi_ulong mmap_find_vma_aligned(abi_ulong star=
t, abi_ulong size,
>      addr =3D start;
>      wrapped =3D repeat =3D 0;
>      prev =3D 0;
> -    flags =3D MAP_ANONYMOUS | MAP_PRIVATE;
> +    flags =3D MAP_ANON | MAP_PRIVATE;
>      if (alignment !=3D 0) {
>          flags |=3D MAP_ALIGNED(alignment);
>      }
> @@ -409,7 +409,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, =
int prot,
>          if (flags & MAP_FIXED) {
>              printf("MAP_FIXED ");
>          }
> -        if (flags & MAP_ANONYMOUS) {
> +        if (flags & MAP_ANON) {
>              printf("MAP_ANON ");
>          }
>          if (flags & MAP_EXCL) {
> @@ -431,7 +431,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, =
int prot,
>      }
>  #endif
>
> -    if ((flags & MAP_ANONYMOUS) && fd !=3D -1) {
> +    if ((flags & MAP_ANON) && fd !=3D -1) {
>          errno =3D EINVAL;
>          goto fail;
>      }
> @@ -533,7 +533,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, =
int prot,
>           * qemu_real_host_page_size
>           */
>          p =3D mmap(g2h_untagged(start), host_len, prot,
> -                 flags | MAP_FIXED | ((fd !=3D -1) ? MAP_ANONYMOUS : 0),=
 -1, 0);
> +                 flags | MAP_FIXED | ((fd !=3D -1) ? MAP_ANON : 0), -1, =
0);
>          if (p =3D=3D MAP_FAILED)
>              goto fail;
>          /* update start so that it points to the file position at 'offse=
t' */
> @@ -696,8 +696,7 @@ static void mmap_reserve(abi_ulong start, abi_ulong s=
ize)
>      }
>      if (real_start !=3D real_end) {
>          mmap(g2h_untagged(real_start), real_end - real_start, PROT_NONE,
> -                 MAP_FIXED | MAP_ANONYMOUS | MAP_PRIVATE,
> -                 -1, 0);
> +                 MAP_FIXED | MAP_ANON | MAP_PRIVATE, -1, 0);
>      }
>  }
>
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

