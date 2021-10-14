Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBA042DDEC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:17:18 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2Ts-0005A2-JB
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2Ic-0000LJ-4H
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:05:39 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:63242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2IZ-0000Or-BN
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:05:37 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 91F0FABC23
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:05:25 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HVXl93Jg3z4dQH
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:05:25 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 46C982C53
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:05:25 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f48.google.com with SMTP id cv2so3904854qvb.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:05:25 -0700 (PDT)
X-Gm-Message-State: AOAM531k1MWtj+Pq7BqFz/2pc6JyH/c/ID62bHPtjRghq7aeYv0zdzMp
 V5LvqehatfoQ1QdL/IsDbxSwFxbNC3d1odPNfF8=
X-Google-Smtp-Source: ABdhPJwpYMOK3lraSM5x0LvQaf1yM74hFErWg7I8X+LotzaM/FSMX523sHvvCcWlUiK5sHf54fO44+5zm1QdXxzhP/I=
X-Received: by 2002:a0c:b2c2:: with SMTP id d2mr5839342qvf.64.1634223924583;
 Thu, 14 Oct 2021 08:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-2-imp@bsdimp.com>
In-Reply-To: <20211008212344.95537-2-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 14 Oct 2021 10:05:13 -0500
X-Gmail-Original-Message-ID: <CACNAnaHBZczhNtHh28qMSm15X1Ra0fpLtWqZLSLafUSEi+=D9g@mail.gmail.com>
Message-ID: <CACNAnaHBZczhNtHh28qMSm15X1Ra0fpLtWqZLSLafUSEi+=D9g@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] bsd-user/mmap.c: Always zero MAP_ANONYMOUS memory
 in mmap_frag()
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 4:24 PM Warner Losh <imp@bsdimp.com> wrote:
>
> From: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
>
> Similar to the equivalent linux-user commit e6deac9cf99
>
> When mapping MAP_ANONYMOUS memory fragments, still need notice about to
> set it zero, or it will cause issues.
>
> Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/mmap.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index b40ab9045f..fc3c1480f5 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -180,10 +180,12 @@ static int mmap_frag(abi_ulong real_start,
>          if (prot_new !=3D (prot1 | PROT_WRITE))
>              mprotect(host_start, qemu_host_page_size, prot_new);
>      } else {
> -        /* just update the protection */
>          if (prot_new !=3D prot1) {
>              mprotect(host_start, qemu_host_page_size, prot_new);
>          }
> +        if (prot_new & PROT_WRITE) {
> +            memset(g2h_untagged(start), 0, end - start);
> +        }
>      }
>      return 0;
>  }
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

