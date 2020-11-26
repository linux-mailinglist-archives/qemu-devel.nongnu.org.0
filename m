Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800EF2C5379
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:01:05 +0100 (CET)
Received: from localhost ([::1]:58806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFxQ-00045T-H4
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:01:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFuq-0002m0-FF
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:58:25 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:43986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFum-0007VR-CD
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:58:22 -0500
Received: by mail-ed1-x543.google.com with SMTP id q16so1974001edv.10
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 03:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bYGLgJvG69plBr3zz2pPsGl3BdIiKOtz8cM4ws3I1kg=;
 b=Y+rNxJVfv0Sxl/Nh3qrH4X5WsC/YNFfoEExZDEjlrdXIEURiRS18w+vKdeJm16lnZ7
 bvKIKK5qLQo1YPAqXdUgekeSCW+mjaJqVGK8zBuDzBw0l1wwHHAUurGeOIwwCTDKfAkI
 PTU0nt7IiLNUyXwwtuvBGBWsKn2MWuNT8nF0VMH5K3+Jns+9au+eD3Tx/4m4P03/F+0h
 WCV/e1wIRQku2i4Y44DAAlncTQD1fR1d0q4aO7yYqMHnfGlayHHC/9PHsHBqOzdU0+j+
 QZ2cf3FX+/Z1sDU3SJ732FWWhd3yX5GTmhuryJ1pZUYtEfnuykesjAV59blTlXDw+kbx
 l50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bYGLgJvG69plBr3zz2pPsGl3BdIiKOtz8cM4ws3I1kg=;
 b=GKYOkqvmDZqq9Orfgmi282MDRHGyjpp3vKulK07Q1ceIgh/Us7a5TdPossdumERhG7
 U3iA/FtlDLEOhLyu9zcrvUEkb5tdZNwe+RyXMypctYwd0+TD3mYR8Z902xgU4BRR+Oy4
 6UBIhLTfZ3GWAdGuSVGO/prV0tSrtlRqNMEctQnAhAnevSKPgfs+7vS7ZMix3YPQwzQ3
 zZxBp+HCAMy5a2U049lMX7/7q2kC1Q5pVbvxMSRovyxojkgghRUH5lyR17cYImJpmogL
 BkBZ4Zjh2zh19FeHosf+X7uEsuFujWLml+S0fJEpHcTgD+N+dwl2AoeJfpX5BFJn2i+N
 8s0Q==
X-Gm-Message-State: AOAM530QXcu/04zX9PYtnEbJNaJWY36FCzURH7OMaGRTIktynGR5o3uI
 smLZraIucwkmG6nKzNKHIBUgHbDyMHcBD8PF57S5gw==
X-Google-Smtp-Source: ABdhPJzJoBSRz8eQIkOj5Ix46FIZPpFId1OvUKOpch9xjttNjchulIZfgIOZx8e1ZBK24CK3fQHUbWn9MIAzIDChVjc=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr2174161edb.52.1606391898308; 
 Thu, 26 Nov 2020 03:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-7-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-7-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 11:58:07 +0000
Message-ID: <CAFEAcA_vCVbMTPsOosFfTt0eoTvdm0KKz2gh0u1AEOrifqJTWQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] tests: remove GCC < 4 fallbacks
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version"), QEMU explicitely depends on GCC >=3D 4.8.
>
> (clang >=3D 3.8 advertizes itself as GCC >=3D 4.2 compatible)
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/tcg/arm/fcvt.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
> index 617626bc63..7ac47b564e 100644
> --- a/tests/tcg/arm/fcvt.c
> +++ b/tests/tcg/arm/fcvt.c
> @@ -73,11 +73,9 @@ static void print_int64(int i, int64_t num)
>
>  #ifndef SNANF
>  /* Signaling NaN macros, if supported.  */
> -# if __GNUC_PREREQ(3, 3)
> -#  define SNANF (__builtin_nansf (""))
> -#  define SNAN (__builtin_nans (""))
> -#  define SNANL (__builtin_nansl (""))
> -# endif
> +# define SNANF (__builtin_nansf (""))
> +# define SNAN (__builtin_nans (""))
> +# define SNANL (__builtin_nansl (""))
>  #endif

Please fix the commit message to talk about clang 3.4, not 3.8,
but otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

