Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E5D37000B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:56:35 +0200 (CEST)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXNS-0001SU-BM
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcWqR-0001nf-Lg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:22:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcWqP-0001Df-Sg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:22:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id x7so71378430wrw.10
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+qY2YoTIPQ4KS4VIm6VWGKbgeeSdE4+cK3bKi7KO+vc=;
 b=ce66AN0eO+EJCvDb24TATDfpRwsgNQMEwCOAKFI+rNgIl+/ZLsXw7mSkBEGNO2IIm7
 XIA5Ibndh3j9wK3NyIZ6EmAPq3K9h5gpyYH4trS1Xv2B0VGsWU2l49T44qONxvQx1rkc
 /JuIypmXz8idqk3HruEzCsGwVCiX9SMpTZIhXdqqDn857kBsmdmD9jvTkFBY/Y2tDDE6
 xDka81WBvEGcdmbYNzRv4fw1fWR9KesLMnFeLFcgWU/WTqMruKRBMHn7o/bAn08/f3Ob
 wRWcSl0mra1TKJ5hExYy/ndexwnBl9Q96OA+2b/ugwNixNrBnMFzZ1jOjNU4vCjhZslx
 vTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+qY2YoTIPQ4KS4VIm6VWGKbgeeSdE4+cK3bKi7KO+vc=;
 b=AiqaTvnDSTmZ7P9mtaf8Z9TEmZSeBJy/gno8jbvP4sCp45G43saFF1t5fwMoNeydT3
 zMtqEVcJxpwgIXlZycauxc/2BXc2LDQSg9oO3m974nkOd3X5HaiTdFC7pesx1w+0rFjv
 KA724XYBJZnsYDJxi9J6yuKxrUBHiKfcq+f9uK6l34/gKST1b/PDg0tXxOO/7LhciWh3
 cLMz/Fwrj3DHsAiMoY7RjJsP3SSukxiihTcGnYzqI4Bs6kd1RiLQQgaeUrqbOEsZlMjD
 zFDeLYICS+1qMaqt7Nto7VlKBnaAhxlV8/AShxd7ouPn5JdR4+21UrOjwb+vaLbFmhpP
 p0WA==
X-Gm-Message-State: AOAM531Fxc0kKo1G0AXEKCglVR/HQgEcm3PwuOJ8y5vuHlCscgaFtS95
 Th1mXhO/6iWwTKiHj810B5Yl6w==
X-Google-Smtp-Source: ABdhPJxNzUN2sIgvnVc5aKt77wvLscO2evWNDKeg6wxlEsl+mOB19QuOYC3jPJeLmcwTLEms8m/8/Q==
X-Received: by 2002:adf:8b02:: with SMTP id n2mr8171765wra.259.1619803344368; 
 Fri, 30 Apr 2021 10:22:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm3610038wma.45.2021.04.30.10.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 10:22:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA8BA1FF7E;
 Fri, 30 Apr 2021 18:22:22 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-12-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 11/12] tests/qtest: Do not restrict bios-tables-test
 to Aarch64 hosts anymore
Date: Fri, 30 Apr 2021 18:21:27 +0100
In-reply-to: <20210415163304.4120052-12-philmd@redhat.com>
Message-ID: <87pmybvga9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
> 32-bit Arm hosts") we can remove the comment / check added in
> commit ab6b6a77774 and directly run the bios-tables-test.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/qtest/meson.build | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 0c767389217..46de073d155 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -175,14 +175,13 @@
>     'boot-serial-test',
>     'hexloader-test']
>=20=20
> -# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make
> bios-tables-test unconditional

Yeah this one has been fixed for some time I reckon. Once I fixed my
cross compile detection scripts I was able to run them all with 32 bit
ARM binaries.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>  qtests_aarch64 =3D \
> -  (cpu !=3D 'arm' ? ['bios-tables-test'] : []) +                        =
                          \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-devic=
e-test'] : []) +        \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-devic=
e-swtpm-test'] : []) +  \
>    ['arm-cpu-features',
>     'numa-test',
>     'boot-serial-test',
> +   'bios-tables-test',
>     'xlnx-can-test',
>     'migration-test']


--=20
Alex Benn=C3=A9e

