Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73C442DE29
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 17:32:13 +0200 (CEST)
Received: from localhost ([::1]:35044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2iJ-0002kt-I2
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 11:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2Qg-0005zZ-IX
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:13:58 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:51728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mb2Qe-0003xJ-RE
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:13:58 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 1CCEEAE20B
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:13:56 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HVXwz5NY7z4hQK
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:13:55 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 9A54E400C
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:13:55 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f172.google.com with SMTP id y11so5995945qtn.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:13:55 -0700 (PDT)
X-Gm-Message-State: AOAM533kT6q1FO/AZUekQ03Amjd7zdcnmB+VS6Gf79pTesOM1YX8sZnK
 e3Dp+0J1vyGC2CuLDkU3vMgEI4JjnskE7+IUnAs=
X-Google-Smtp-Source: ABdhPJySUW4rbgjYUSfCbisdqr/fMhfQ0SgadJNT3dHMwXMRWNwpweAOnoR1zwHFeKn/iVlMaooDktAOMGFWhDSp+zo=
X-Received: by 2002:a05:622a:11d6:: with SMTP id
 n22mr7127498qtk.337.1634224435344; 
 Thu, 14 Oct 2021 08:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211008212344.95537-1-imp@bsdimp.com>
 <20211008212344.95537-10-imp@bsdimp.com>
In-Reply-To: <20211008212344.95537-10-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 14 Oct 2021 10:13:44 -0500
X-Gmail-Original-Message-ID: <CACNAnaHRcn9dkZ1bT=Nc43PEJ_V1t2SEcdd3RBjZGEZ7_OSRtg@mail.gmail.com>
Message-ID: <CACNAnaHRcn9dkZ1bT=Nc43PEJ_V1t2SEcdd3RBjZGEZ7_OSRtg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] bsd-user/mmap.c: assert that target_mprotect
 cannot fail
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

On Fri, Oct 8, 2021 at 4:31 PM Warner Losh <imp@bsdimp.com> wrote:
>
> Similar to the equivalent linux-user change 86abac06c14. All error
> conditions that target_mprotect checks are also checked by target_mmap.
> EACCESS cannot happen because we are just removing PROT_WRITE.  ENOMEM
> should not happen because we are modifying a whole VMA (and we have
> bigger problems anyway if it happens).
>
> Fixes a Coverity false positive, where Coverity complains about
> target_mprotect's return value being passed to tb_invalidate_phys_range.
>
> Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/mmap.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
> index 066d9c10ff..4586ad27d0 100644
> --- a/bsd-user/mmap.c
> +++ b/bsd-user/mmap.c
> @@ -604,10 +604,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,=
 int prot,
>              }
>              if (!(prot & PROT_WRITE)) {
>                  ret =3D target_mprotect(start, len, prot);
> -                if (ret !=3D 0) {
> -                    start =3D ret;
> -                    goto the_end;
> -                }
> +                assert(ret =3D=3D 0);
>              }
>              goto the_end;
>          }
> --
> 2.32.0
>
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

