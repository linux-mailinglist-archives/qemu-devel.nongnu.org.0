Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9F942DE4C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:38:29 +0200 (CEST)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2oM-0006GI-6g
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2QI-0005ta-Im
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:13:37 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:51291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2QD-0003XN-RV
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:13:34 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id B7C63AE1AD
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:13:27 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HVXwR4RVCz4hYB
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:13:27 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 6E95B32F4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:13:27 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f177.google.com with SMTP id r15so5721213qkp.8
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:13:27 -0700 (PDT)
X-Gm-Message-State: AOAM532B6jObBveIRPCm/LQe5Y3u3d7jNs4GkvEphsTlQBdDKVSZtftx
 7c+79KcZR2SvDEVUM4LIxSSDH4DZZWvZmGx5FLM=
X-Google-Smtp-Source: ABdhPJyfD64IO71s8tuVYqOZi8t2D7LNn6epy/pK6qTa5LGOMWUL8w0DjPZdtyB11sXTsTFbkrMM0Y2UIJop+4GWAuI=
X-Received: by 2002:a37:8e07:: with SMTP id q7mr5322682qkd.287.1634224407069; 
 Thu, 14 Oct 2021 08:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-5-imp@bsdimp.com>
In-Reply-To: <20211008212344.95537-5-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 14 Oct 2021 10:13:15 -0500
X-Gmail-Original-Message-ID: <CACNAnaEABTr9P6vqnsE37EGrMNTf+W=QKvsESo2G7VtLj484Aw@mail.gmail.com>
Message-ID: <CACNAnaEABTr9P6vqnsE37EGrMNTf+W=QKvsESo2G7VtLj484Aw@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] bsd-user/mmap.c: mmap return ENOMEM on overflow
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

On Fri, Oct 8, 2021 at 4:27 PM Warner Losh <imp@bsdimp.com> wrote:
>
> mmap should return ENOMEM on len overflow rather than EINVAL. Return
> EINVAL when len =3D=3D 0 and ENOMEM when the rounded to a page length is =
0.
> Found by make check-tcg.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/mmap.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index 6f33aec58b..f0be3b12cf 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -455,11 +455,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len=
, int prot,
>          goto fail;
>      }
>
> -    len =3D TARGET_PAGE_ALIGN(len);
>      if (len =3D=3D 0) {
>          errno =3D EINVAL;
>          goto fail;
>      }
> +
> +    /* Check for overflows */
> +    len =3D TARGET_PAGE_ALIGN(len);
> +    if (len =3D=3D 0) {
> +        errno =3D ENOMEM;
> +        goto fail;
> +    }
> +
>      real_start =3D start & qemu_host_page_mask;
>      host_offset =3D offset & qemu_host_page_mask;
>
> --
> 2.32.0
>
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

