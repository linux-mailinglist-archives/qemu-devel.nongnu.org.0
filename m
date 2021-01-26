Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1F303ECA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:33:38 +0100 (CET)
Received: from localhost ([::1]:57708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4OTR-0007ui-EO
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4OOk-0005I2-Vb
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:28:50 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4OOi-0004zc-D7
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:28:46 -0500
Received: by mail-ed1-x533.google.com with SMTP id bx12so19708274edb.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 05:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mg22Hljaih/4jmjJvUHRzFHSMnb+KU8BkQkSosfAazA=;
 b=bvkC7DECP1RcHom/BpQkXNEg9S3/eZU9xuE8rX7l/AyvVMEFiryUUjo4VmThjMBL6u
 VfSM+f3a/HUEUEBHxWIQjtWdwRWu7ckT/LumIuVQ4DAoF5Eorp9ZAitABRFLqEqxJSvU
 FzWd7pAbjGdOQraWmoiEEZVIuj2zEcT36iJ4uezyPS0rVD1TerIAiQFaKVpVEhuj38hZ
 Jn66B1bIzhfuXWkULGgEvyEvISlO5wUwLGZV6y8PBV/DXeg2vxlbTCQNnQ9fxQR5Q1Fy
 jQt+ortElO0CxBf3lg6n0j5BXjGaxPLzE5d3SKpDpXuvlGVCYQRhmNDUjXDKgNcDUVgi
 LvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mg22Hljaih/4jmjJvUHRzFHSMnb+KU8BkQkSosfAazA=;
 b=kH7o77ZlYCJV0n2Ww4t2M++zFlpMs6x7AvyDgEJkXi10luOrtMyMppQHhiXh8zlRKz
 KARfmSbhQ0wdoepr2kruqB1FT2z4DGyM8VD4zpKwLC8Cpb8V2m1HzbmBTVPjMow6y764
 9gu1tuRWCqLD0ach/TBWMENWTCiHV4TUgkwEkWYEjTi1gTM5MMZIXrsXW8eVGzbvY2g3
 xZXpT0Yo4oGdl//ZgE1iv6B7QG785GFjdiEVS7R6lazYdf9v2EEOKGok1rUr+7uQVgyv
 x9fCZyC1tvZcQGdghLbqHIzyiGt8K6Bp0IMDFYGjhlDsKpLec5ih7VGfin54G62AuCLs
 Btrg==
X-Gm-Message-State: AOAM5330eMa4fkEtSOkVB9pZTyBly1OfE3fmdydIhe1WNxIq1ftMrUqr
 JQSlvG/akFCVpkYmxAW7ZmcDsD8Ul9dt2xlA6eBB5w==
X-Google-Smtp-Source: ABdhPJxipriDFCTewK9qVDvnMf5Dw++twuS3lhRvLIX2WNZ9hu/GEUM+9YHunDLYnwohivlhtHHco/DMOBYI6CzParo=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr4543114edv.36.1611667722801; 
 Tue, 26 Jan 2021 05:28:42 -0800 (PST)
MIME-Version: 1.0
References: <20210126132637.3175037-1-philmd@redhat.com>
In-Reply-To: <20210126132637.3175037-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jan 2021 13:28:31 +0000
Message-ID: <CAFEAcA8q=ZgMYvZfr75RP90T0SVvD1JUnT2sN08H5T8DLpanbg@mail.gmail.com>
Subject: Re: [PATCH] meson: Restrict Cocoa framework check to macOS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Brendan Shanks <brendan@bslabs.net>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 13:26, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Do not check for Cocoa framework if the OS is not macOS.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  meson.build | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 35a9eddf5cf..9a9ee5408b9 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -369,7 +369,10 @@
>    endif
>  endif
>
> -cocoa =3D dependency('appleframeworks', modules: 'Cocoa', required: get_=
option('cocoa'))
> +cocoa =3D not_found
> +if targetos =3D=3D 'darwin'
> +  cocoa =3D dependency('appleframeworks', modules: 'Cocoa', required: ge=
t_option('cocoa'))
> +endif
>  if cocoa.found() and get_option('sdl').enabled()
>    error('Cocoa and SDL cannot be enabled at the same time')
>  endif

What difference does this change make? Are there ever
situations where the 'detect cocoa' test incorrectly
finds cocoa on a non-macOS system and breaks something?

thanks
-- PMM

