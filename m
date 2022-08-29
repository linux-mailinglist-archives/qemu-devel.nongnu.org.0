Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D55A464B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:42:13 +0200 (CEST)
Received: from localhost ([::1]:34834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbHY-0005vD-Ba
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oSb8O-00062Z-SM
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 05:32:44 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oSb8H-0007ve-U6
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 05:32:44 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so7842263wme.1
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=u0u/70lusuF8tENImNDvvlm1TAhL90sI4zka1MlGF7k=;
 b=P8tEpBze/kI2+yUJTMU7lB8mbkQeHalqpxPIa1piXQkmTtsgwYlnap+dIf+rPv7rO+
 vXGEYOeU3Aw2dt92bSsRC/4vVg0uiXPE0EfxJMI2hkZLPcjuJc+bZDcS3utvMxl2x00f
 GhoZyWehWn3fxcDRGlw5/qCHKGWSEHSpa+dPXMyobl6rRLjdaWdtrLuDkt7BF9H6e7ZD
 TfXNw+fWm4xc0M4TDDx72q5TfFf6enRfDEWbMYAQotbYx4sEP80YCHBwR5yOp20PZ1b0
 ShaTlrULbTkXssVS4fwmXZREFbWV90ubwcU7Bqr3dlT9wznFnN7Qxao6mtyxgvNnH9DN
 A/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=u0u/70lusuF8tENImNDvvlm1TAhL90sI4zka1MlGF7k=;
 b=p7l6W1TTLAveNBAtveZsdedMh9NVXKiGw3kVczEgcu5EtzgI2AmUNcJva9UeJYjDQY
 b0lkvHE+7A4DeUELQMLN1LsMFG4FicspJ6VuvvlKEbMtXfVyJhYo2ZXXvRKLfq5F3t7x
 2KYmh5jOvdUPeo/YwlIhIbYnw9DwJTg28CUzaq4i5f8C6kj/kX14jTZ0D5WjIiClu5sv
 xvaZ9dShb9gSlnCVPxiemuYAQmz0UEV3NCRf/dj0dwKSpIyiN+mTw7cbYc55icwyO6pA
 NGU7MLu2ZzNMVetwH6YgTa6SkiLJMoXEltzbsj4jZ6xufjGSaCn+aLTSQUJz6QdIFC35
 USNQ==
X-Gm-Message-State: ACgBeo3OH1HgADC61DJS6i9hYijL/0o4KwcgzJAwRodSbMdvZ2yvOFCe
 GMrwN3Au3NAXS2Ww+orYB5QqpA==
X-Google-Smtp-Source: AA6agR5yYmsMDLdsk4a/alJjTJwTBZzvLhkUQxGqQ9tkQmKXr87z/t4VLbum/HCfCfJ1ElnrCpdthA==
X-Received: by 2002:a05:600c:310b:b0:3a6:8970:27fc with SMTP id
 g11-20020a05600c310b00b003a6897027fcmr6189294wmo.98.1661765555910; 
 Mon, 29 Aug 2022 02:32:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm6345153wrn.29.2022.08.29.02.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 02:32:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82E291FFB7;
 Mon, 29 Aug 2022 10:32:34 +0100 (BST)
References: <20220829080940.110831-1-thuth@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH for-7.2] tests/avocado/boot_linux_console: Fix the
 test_aarch64_xlnx_versal_virt test
Date: Mon, 29 Aug 2022 10:32:24 +0100
In-reply-to: <20220829080940.110831-1-thuth@redhat.com>
Message-ID: <878rn7xuml.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> The assets that this test tries to download have been removed from the
> server. Update to a newer version to get it working again.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/avocado/boot_linux_console.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_lin=
ux_console.py
> index 6b1533c17c..f26e036ab5 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -335,13 +335,13 @@ def test_aarch64_xlnx_versal_virt(self):
>          """
>          images_url =3D ('http://ports.ubuntu.com/ubuntu-ports/dists/'
>                        'bionic-updates/main/installer-arm64/'
> -                      '20101020ubuntu543.15/images/')
> +                      '20101020ubuntu543.19/images/')
>          kernel_url =3D images_url + 'netboot/ubuntu-installer/arm64/linu=
x'
> -        kernel_hash =3D '5bfc54cf7ed8157d93f6e5b0241e727b6dc22c50'
> +        kernel_hash =3D 'e167757620640eb26de0972f578741924abb3a82'
>          kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel=
_hash)
>=20=20
>          initrd_url =3D images_url + 'netboot/ubuntu-installer/arm64/init=
rd.gz'
> -        initrd_hash =3D 'd385d3e88d53e2004c5d43cbe668b458a094f772'
> +        initrd_hash =3D 'cab5cb3fcefca8408aa5aae57f24574bfce8bdb9'
>          initrd_path =3D self.fetch_asset(initrd_url, asset_hash=3Dinitrd=
_hash)
>=20=20
>          self.vm.set_console()

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

