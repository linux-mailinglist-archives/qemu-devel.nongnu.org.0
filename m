Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A6107788
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 19:44:10 +0100 (CET)
Received: from localhost ([::1]:54216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYDua-0005RN-8n
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 13:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39035)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iYDez-0004pI-1e
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 13:28:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iYDeu-0007J6-DE
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 13:27:58 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38579)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iYDes-0007IS-BT
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 13:27:56 -0500
Received: by mail-oi1-x243.google.com with SMTP id a14so7350821oid.5
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 10:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mWoxjyn6dZPNVfLsjBieukVG7aOyeWtNzLFOcQIpCd8=;
 b=ZdWa16vB2kRY/SU2Y5cmPAeE2EjN5mFqr7Lzj3RxuzE1BMPw4FlGrTYwDzcKMU1MOe
 KatZTkN9Cesin6echzo16UwFUqD0pHtZ32tfsOy2Eze4QmlscLwfJcs9XOE3B+I7UuLH
 Lic6YeAix9UQYGrUtW13ISO2KtVqURLQSagvFWeZef+TDg2siVHEL9MrNcmkADdxspOR
 Rmsw2ush1o7Ju7b8aC0H3XdHT59p+Q1EmWX9PnrYqwaAEmypmGRvk0I5Gn2eyHD9XlW1
 LEbYBeGNas2iY6Ye3lq7x7katVBzMoaju2pbAWWImRebXZHnKTpt/3p7wHxo9vvTQQYY
 G/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mWoxjyn6dZPNVfLsjBieukVG7aOyeWtNzLFOcQIpCd8=;
 b=Ddpg5uMX4gfK0/B1MO4HQy1cnsx0trVZXhuweqOpZFsSM8eFfKJoOATC6fNWMGFdza
 baUkFDqJTETI/e5SoVcupcApfGGYO18UIbxQ7pAR/wWsqhGIWu/vskOo0h/CfLN0lKco
 SThZxQqJdIdFr6/EzRAFXwchGL5oDG795pZD5/5832PSO8gfNP6oPP69vGMv6pZ0bQur
 O6lS3OzbT5zGnnrzWTWiPMofEdmLqk3f/8NHsukZWsKi4Pkvc7i10RsvEtnSe/pWppfl
 udjjR4S0IWWdbto2K4Fl+avVbe80/v1F4dXK1nx/S+Cl2DWNcLXx4MEugFSiHRmvBgBf
 EO5g==
X-Gm-Message-State: APjAAAVxx36sriAZn9+zalr5FGzrVHknS2DWzErAyv1rCAivUfVJD/vM
 w+DCFXmuPm2Ra48NncjdCWUumo40pxphO+1iOwE=
X-Google-Smtp-Source: APXvYqzh9aJUZ25tXuCOGhh44bdzQCqnx1YpFf83rFh3tJsCQoF++BS/VPU/dQyD7N8a16o2/k7CTXeR/ssVyMad0KI=
X-Received: by 2002:aca:670b:: with SMTP id z11mr12775280oix.79.1574447271810; 
 Fri, 22 Nov 2019 10:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20191122174040.569252-1-ariadne@dereferenced.org>
In-Reply-To: <20191122174040.569252-1-ariadne@dereferenced.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 22 Nov 2019 19:27:41 +0100
Message-ID: <CAL1e-=jBhF476ZErrbZ_ANBnrKhNNgYtntGDB-5BDMXdT9J0aQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user: fix translation of statx structures
To: Ariadne Conill <ariadne@dereferenced.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 22, 2019 at 7:22 PM Ariadne Conill <ariadne@dereferenced.org> wrote:
>
> All timestamps were copied to atime instead of to their respective
> fields.
>
> Signed-off-by: Ariadne Conill <ariadne@dereferenced.org>
> ---

What a bug.

Laurent, perhaps a good candidate for 4.2?

Thanks for submitting this, Ariadne Conill!

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

>  linux-user/syscall.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ce399a55f0..171c0caef3 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6743,12 +6743,12 @@ static inline abi_long host_to_target_statx(struct target_statx *host_stx,
>      __put_user(host_stx->stx_attributes_mask, &target_stx->stx_attributes_mask);
>      __put_user(host_stx->stx_atime.tv_sec, &target_stx->stx_atime.tv_sec);
>      __put_user(host_stx->stx_atime.tv_nsec, &target_stx->stx_atime.tv_nsec);
> -    __put_user(host_stx->stx_btime.tv_sec, &target_stx->stx_atime.tv_sec);
> -    __put_user(host_stx->stx_btime.tv_nsec, &target_stx->stx_atime.tv_nsec);
> -    __put_user(host_stx->stx_ctime.tv_sec, &target_stx->stx_atime.tv_sec);
> -    __put_user(host_stx->stx_ctime.tv_nsec, &target_stx->stx_atime.tv_nsec);
> -    __put_user(host_stx->stx_mtime.tv_sec, &target_stx->stx_atime.tv_sec);
> -    __put_user(host_stx->stx_mtime.tv_nsec, &target_stx->stx_atime.tv_nsec);
> +    __put_user(host_stx->stx_btime.tv_sec, &target_stx->stx_btime.tv_sec);
> +    __put_user(host_stx->stx_btime.tv_nsec, &target_stx->stx_btime.tv_nsec);
> +    __put_user(host_stx->stx_ctime.tv_sec, &target_stx->stx_ctime.tv_sec);
> +    __put_user(host_stx->stx_ctime.tv_nsec, &target_stx->stx_ctime.tv_nsec);
> +    __put_user(host_stx->stx_mtime.tv_sec, &target_stx->stx_mtime.tv_sec);
> +    __put_user(host_stx->stx_mtime.tv_nsec, &target_stx->stx_mtime.tv_nsec);
>      __put_user(host_stx->stx_rdev_major, &target_stx->stx_rdev_major);
>      __put_user(host_stx->stx_rdev_minor, &target_stx->stx_rdev_minor);
>      __put_user(host_stx->stx_dev_major, &target_stx->stx_dev_major);
> --
> 2.24.0
>
>

