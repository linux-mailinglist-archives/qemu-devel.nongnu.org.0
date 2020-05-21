Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038591DCB10
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 12:30:41 +0200 (CEST)
Received: from localhost ([::1]:50896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbiTI-00081U-2u
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 06:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbiSU-0007ZA-8G
 for qemu-devel@nongnu.org; Thu, 21 May 2020 06:29:50 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jbiST-0003Y8-91
 for qemu-devel@nongnu.org; Thu, 21 May 2020 06:29:49 -0400
Received: by mail-ot1-x342.google.com with SMTP id c3so5075842otr.12
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lbc3oGCIDmO2jipSEDw8CsxoRSv6ED+VDoPM8fWpJRs=;
 b=YOVel/6fHtXOK4rigc08CHqD4DsLNP1vZASwTVNRBP8lGShkbmZtGtKxSR7qxgTOkH
 Y2ErfdTyUpsadmuLi7TDgNhdjg3luC3A+/P+5ZPJ5b3ggYYblp1vLlymjPt7EW7v2RP6
 cPrpntxAN2weihOxghsFBsqDAkfSZLncbipP1XVqLtbeCd8DIVOUU+UIWniv3i39YA5w
 KOrwLSUYmar8LPt/1OjJnnt9I0nRBSUVjREgPLXcGl8fh6H+xxYAQCg0U1/C1flPFP11
 0dEK3/YNCm1IVT9A+N8HcM2wmxaip4EKgjQ3pRQ2yig0VTmnK04cuUnzucRwRL8MAOJB
 TkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lbc3oGCIDmO2jipSEDw8CsxoRSv6ED+VDoPM8fWpJRs=;
 b=k88zzzRIlYfKRuFlharcvy7kIPSEBvnHB8ThYW7t9mhieNcXbHyXwtvKHCszmpONvk
 V/u1esnzqIF53B9/b2p0wVwFB7Ld3GO/r07eY7EDgG1cYrYxQX/Ygttc3VX/Z2oCUTBj
 AN+A0rHbqOD2HBBDk23o84PZh64qVX85yCT6xfoGJlqILMF2A4/FOXq/EkNKiFmZfkYY
 5WzapsMH3Zc3UUDaWW+STwwsOakI39SaKKyf01QZYUuFJXI33DYfmKzG4VQqA84nZXRW
 I2KrafhoPTuIKJlOg9Ler8IJVSpk1ujTrKxx/SSJ39yUfzDA3gAqYcsrrCkGu7pmJVdR
 IzsQ==
X-Gm-Message-State: AOAM530vYT/S5JL8sxVcGfb9Je9yspRbTeFlLg0fBNGlHSWrphf990Ha
 N0WPw3iUVkQrxVTE9WvQvSESLqWohQjDPtFZbO0u6w==
X-Google-Smtp-Source: ABdhPJxY4Mo8DjhtvJqUOe8lxQZd4xtmAf9XcrUi0ghyCMlaEClKP19jNyufv4KjloAxe1C5CKLbgKB8rWHMTRew+gk=
X-Received: by 2002:a9d:3623:: with SMTP id w32mr6417206otb.91.1590056987902; 
 Thu, 21 May 2020 03:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200521102130.17619-1-alex.bennee@linaro.org>
In-Reply-To: <20200521102130.17619-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 11:29:37 +0100
Message-ID: <CAFEAcA-0f8tsTSu2nc9Z2tnEA4YBMbzWru1yUbW_xxM1=zV0JQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user: limit check to HOST_LONG_BITS == 32
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 May 2020 at 11:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Newer clangs rightly spot that you can never exceed the full address
> space of 64 bit hosts with:
>
>   linux-user/elfload.c:2076:41: error: result of comparison 'unsigned
>   long' > 18446744073709551615 is always false
>   [-Werror,-Wtautological-type-limit-compare]
>   4685         if ((guest_hiaddr - guest_base) > ~(uintptr_t)0) {
>   4686             ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
>   4687 1 error generated.
>
> So lets limit the check to 32 bit hosts only.
>
> Fixes: ee94743034bf
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  linux-user/elfload.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 01a9323a637..797fbf2337a 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2072,6 +2072,7 @@ static void pgb_have_guest_base(const char *image_n=
ame, abi_ulong guest_loaddr,
>                           image_name, (uint64_t)guest_hiaddr, reserved_va=
);
>              exit(EXIT_FAILURE);
>          }
> +#if HOST_LONG_BITS =3D=3D 32
>      } else {
>          if ((guest_hiaddr - guest_base) > ~(uintptr_t)0) {
>              error_report("%s: requires more virtual address space "
> @@ -2079,6 +2080,7 @@ static void pgb_have_guest_base(const char *image_n=
ame, abi_ulong guest_loaddr,
>                           image_name, (uint64_t)guest_hiaddr - guest_base=
);
>              exit(EXIT_FAILURE);
>          }
> +#endif

Could we write this so that we have the #if...#endif
conditional nested inside the if { ... } else { ... },
rather than having the two conditional constructs
oddly intermeshed?

thanks
-- PMM

