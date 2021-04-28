Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C9936DADB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:09:04 +0200 (CEST)
Received: from localhost ([::1]:39848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbloF-0002gE-AQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lblnA-0001bW-Vh
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:07:57 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lblmz-0000BT-0m
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:07:56 -0400
Received: by mail-ed1-x533.google.com with SMTP id e7so74560321edu.10
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G/GbyKPkzgDTapgT1IsYa8jdWyNgQMx80EFgYzhgjPA=;
 b=YjzcrlpfUfueB69qdqSLD1pb6m6MVejw28untXHSWpvgvjfenxRvx2Oat0Hz+robsG
 FWNktzyj9L6OcoJfcgQkVPuzW3OwhYqw+2hBfXSqx7wzyt5628F9cu65MuDjalk+F+cd
 BGuquPi8ojEIneY/axCPFYQ7Q+ibO9lVOBL4JfTYASMmF89+I5WUWJxK+TLjC6HjDjYQ
 uMycU0zmbmZpqJpvo8dXPzJxTR2M0VCx3lZqKt9ftkcD+tDO+ggi08YfmlTKo3inzBp8
 lcZnIUEiaRp6rTeutVrEREeK8XUw+9mccADtepTqMwWMbr0WQANPOeSnK2XH/kyPEc20
 tQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G/GbyKPkzgDTapgT1IsYa8jdWyNgQMx80EFgYzhgjPA=;
 b=aYD1c22oojwPs1smbxrn4v+4iWVIkBY2zykP2S8YhCqT7f/ZGgt1gn2lqwgEE9lPma
 CqPadm+RToojfy0LR/AUZTCsuftz34nmhqyqfDmxRToX1R33uf7EmhiZJniWdGs+IES5
 kEF4XoSBXznd6d8vtPs9mh1t3cQOq4fAcJbe1sFuXIpXbdmKN3U69kCHzJkO9Yfmszpf
 IdljJv+Fvxj9N85/iuxZlFtZ3VsKPa+nHGWg7+e+pN3gwPYJAeBqwEjnae3qzUNYc6Cc
 cD8AcANwAg37zMjPgeOvQRGiYkA1DB7iEiz2YpFYsKsIdsePEfbyBHtH01Yco7kyYbYS
 eDeA==
X-Gm-Message-State: AOAM532IIX4ZmA9svpQOnRMad72Z6Br/4PlOe3eqTQOEDglwYyhJxqF3
 FzUbdB62CNZmWy1DnQ/mYmLIGDcUbZ7z1azwf+tncw==
X-Google-Smtp-Source: ABdhPJyUs/0y1dpMA+DCHjx1L1gNV1TAD1XVv+cA3+w4c42YgAtp/4Vt+LZfr27b4swlF/CQ9td85zfAnRR4dM+MRQI=
X-Received: by 2002:a05:6402:12d3:: with SMTP id
 k19mr687202edx.52.1619622463416; 
 Wed, 28 Apr 2021 08:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-2-philmd@redhat.com>
In-Reply-To: <20210428144813.417170-2-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Apr 2021 16:06:42 +0100
Message-ID: <CAFEAcA9chk8aEqe0jrYQouF0=UpznTrR+J8puVgNvf1VipPm2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] meson: Check for seccomp/cap-ng libraries if
 virtiofsd is enabled
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021 at 15:55, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:

(cc'ing Paolo for a meson.build question below...)

> When not explicitly select a sysemu target and building virtiofsd,
> the seccomp/cap-ng libraries are not resolved, leading to this error:
>
>   $ configure --target-list=3Di386-linux-user --disable-tools --enable-vi=
rtiofsd
>   tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd requires =
libcap-ng-devel and seccomp-devel
>
> Fix by checking the seccomp/cap-ng libraries if virtiofsd is built.
>
> Reported-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e8..b466b418fed 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -393,14 +393,14 @@
>  endif
>
>  seccomp =3D not_found
> -if not get_option('seccomp').auto() or have_system or have_tools
> +if not get_option('seccomp').auto() or have_system or have_tools or not =
get_option('virtiofsd').auto()
>    seccomp =3D dependency('libseccomp', version: '>=3D2.3.0',
>                         required: get_option('seccomp'),
>                         method: 'pkg-config', kwargs: static_kwargs)
>  endif
>
>  libcap_ng =3D not_found
> -if not get_option('cap_ng').auto() or have_system or have_tools
> +if not get_option('cap_ng').auto() or have_system or have_tools or not g=
et_option('virtiofsd').auto()
>    libcap_ng =3D cc.find_library('cap-ng', has_headers: ['cap-ng.h'],
>                                required: get_option('cap_ng'),
>                                kwargs: static_kwargs)

Now we have "virtiofsd requires cap-ng and seccomp" recorded in three
places in different meson.build files:
 * here, if this patch goes in
 * in tools/meson.build, in its logic for setting have_virtiofsd
   (I generously do not count the "decide which error message to print"
   logic in that file as a separate item in this list...)
 * in tools/virtiofsd/meson.build, where the executable('virtiofsd', ...)
   lists them in its dependencies: setting

Is there some way to avoid this duplication?

thanks
-- PMM

