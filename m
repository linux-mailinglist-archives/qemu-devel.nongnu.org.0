Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A6842DDFC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:21:14 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2Xf-0006ii-Jy
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2JM-0000nR-FH
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:06:24 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:19796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2JI-0001JY-O8
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:06:24 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 0C228AC554
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:06:20 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HVXmC44wjz4fCP
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:06:19 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 52FBE3D39
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:06:19 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f171.google.com with SMTP id 77so5695573qkh.6
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:06:19 -0700 (PDT)
X-Gm-Message-State: AOAM530X71h5X0qVCkZ6aDNOwwNUedAbvp6/gBHYfiahD1agewr8hTd7
 bBjlt/JwughezE22NBkrU7qOIG0SSaw4BGUmHd0=
X-Google-Smtp-Source: ABdhPJzmbWKph/s84XSD8mv3J54edibior5vRFawp+ApddoZWFVkmrjMbw+wGwuMaX67k75rD6cDnbnP9F4r1y8W7bw=
X-Received: by 2002:a37:9f02:: with SMTP id i2mr5217130qke.305.1634223978941; 
 Thu, 14 Oct 2021 08:06:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-3-imp@bsdimp.com>
In-Reply-To: <20211008212344.95537-3-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 14 Oct 2021 10:06:08 -0500
X-Gmail-Original-Message-ID: <CACNAnaF6T6pAj3TG4bNOBzd-ukbWQf2qhqWjJGn0cEM400FzVQ@mail.gmail.com>
Message-ID: <CACNAnaF6T6pAj3TG4bNOBzd-ukbWQf2qhqWjJGn0cEM400FzVQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] bsd-user/mmap.c: check pread's return value to fix
 warnings with _FORTIFY_SOURCE
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
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 4:24 PM Warner Losh <imp@bsdimp.com> wrote:
>
> From: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
>
> Simmilar to the equivalent linux-user: commit fb7e378cf9c, which added
> checking to pread's return value. Update to current qemu standards with
> {} around the if statement.
>
> Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/mmap.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index fc3c1480f5..4f4fa3ab46 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -174,7 +174,9 @@ static int mmap_frag(abi_ulong real_start,
>              mprotect(host_start, qemu_host_page_size, prot1 | PROT_WRITE=
);
>
>          /* read the corresponding file data */
> -        pread(fd, g2h_untagged(start), end - start, offset);
> +        if (pread(fd, g2h_untagged(start), end - start, offset) =3D=3D -=
1) {
> +            return -1;
> +        }
>
>          /* put final protection */
>          if (prot_new !=3D (prot1 | PROT_WRITE))
> @@ -593,7 +595,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, =
int prot,
>                                    -1, 0);
>              if (retaddr =3D=3D -1)
>                  goto fail;
> -            pread(fd, g2h_untagged(start), len, offset);
> +            if (pread(fd, g2h_untagged(start), len, offset) =3D=3D -1) {
> +                goto fail;
> +            }
>              if (!(prot & PROT_WRITE)) {
>                  ret =3D target_mprotect(start, len, prot);
>                  if (ret !=3D 0) {
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

