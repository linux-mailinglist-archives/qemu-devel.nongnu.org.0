Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1026A9625
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:27:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3Yv-0004c2-Kf; Fri, 03 Mar 2023 06:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY3Yo-0004ZI-E2
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:26:51 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY3Ym-0004N1-Ni
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:26:50 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso3723491wmb.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUqr5erx8+OwmkALJPrJFLC85+jmkVhI6/lFPgW+I6A=;
 b=RmYG37N9xIRIt1QHa+0MsNhEg33yCp2ro4xVIh6ZGFzTC3bUzq+tlA6AxtH5qy5PQj
 xgl7/3nZ2kqsjNpKOyycSxURhGMgQSnO7b7umluAlCymvvKjJhr4ceoERnfXJmlA4Dsl
 8HYvkI4jWo8Gsmslnpw2/eBj/DzSNPiWB5301X/cWubjQcqf5z0uZ98fWJmELCiVCT1E
 1jasVqhY0UCd9RjJnYYu5ejioe2JIMo5SBnxlsZnfY1Bi5+z5RaXrJxInIABVbIsgPtk
 4tidfcUKVZ9AEXNyWf/KmgK4MeXU3iE/5PnjbnIgzXB2tLXdE0Zp0SgTLrYXDsDGg1Sx
 8saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iUqr5erx8+OwmkALJPrJFLC85+jmkVhI6/lFPgW+I6A=;
 b=teGp0vxAQcOXQrGUuIPiD4iiBuSmM/KuN9Gon035nXNaprwX30SIgXs4cK125V5tek
 G5895j9n7kntI4reR+0bfDMOG14Wmtwn2feeCSPgRyO1VFOgoLX1MSu5gtPXC3iB2IWm
 zk5XJHyO3BoIS5cbJamTYqKGCHZ5jRrHolMhpPY2Yn4bhdFZ3LLFREAA9XByxyExdqb+
 cTciiQJ5hJn0al+uRwTT8e0YDNvh3qBzKCmmYkF/h9HgTG3UWl7PYXLcowcPGsogqNvJ
 1ippK+rXGS0widBoN1bcLGJo045hCe5nd+Mx45bLHPFgTZjau5O8fbbB0nDmgBl4hWDh
 MytA==
X-Gm-Message-State: AO0yUKUuW2+20p2rCZel0UcmqZfLY2vWfRFkr8GgU0GozGVosuMqLIrr
 lkI0KO1XQvsvpN4KWd6uXyWA/w==
X-Google-Smtp-Source: AK7set/aBLtNIKzJKAkXwukeK7eTI02eLDK9G2YoVa4V6kn49Jb5nIulQ7xedth3WTIozxlPbZ0O3Q==
X-Received: by 2002:a05:600c:548b:b0:3eb:39e7:3607 with SMTP id
 iv11-20020a05600c548b00b003eb39e73607mr1441037wmb.4.1677842806877; 
 Fri, 03 Mar 2023 03:26:46 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b003e203681b26sm2069997wmo.29.2023.03.03.03.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 03:26:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27D791FFB7;
 Fri,  3 Mar 2023 11:26:46 +0000 (GMT)
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>, Peter Maydell
 <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 1/3] tests/avocado: update AArch64 tests to Alpine 3.17.2
Date: Fri, 03 Mar 2023 11:24:59 +0000
In-reply-to: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
Message-ID: <87mt4u9itl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

Next time please ensure you have a cover letter for a multi-patch series
as the various bits of tooling get confused without one.

> To test Alpine boot on SBSA-Ref target we need Alpine Linux
> 'standard' image as 'virt' one lacks kernel modules.

Is this kernel modules we will need for SBSA "hw" choices?

> So to minimalize Avocado cache I move test to 'standard' image.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/avocado/machine_aarch64_virt.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machin=
e_aarch64_virt.py
> index 25dab8dc00..a90dc6ff4b 100644
> --- a/tests/avocado/machine_aarch64_virt.py
> +++ b/tests/avocado/machine_aarch64_virt.py
> @@ -38,11 +38,11 @@ def test_alpine_virt_tcg_gic_max(self):
>          :avocado: tags=3Daccel:tcg
>          """
>          iso_url =3D ('https://dl-cdn.alpinelinux.org/'
> -                   'alpine/v3.16/releases/aarch64/'
> -                   'alpine-virt-3.16.3-aarch64.iso')
> +                   'alpine/v3.17/releases/aarch64/'
> +                   'alpine-standard-3.17.2-aarch64.iso')
>=20=20
>          # Alpine use sha256 so I recalculated this myself
> -        iso_sha1 =3D '0683bc089486d55c91bf6607d5ecb93925769bc0'
> +        iso_sha1 =3D '76284fcd7b41fe899b0c2375ceb8470803eea839'
>          iso_path =3D self.fetch_asset(iso_url, asset_hash=3Diso_sha1)
>=20=20
>          self.vm.set_console()
> @@ -65,7 +65,7 @@ def test_alpine_virt_tcg_gic_max(self):
>          self.vm.add_args('-object', 'rng-random,id=3Drng0,filename=3D/de=
v/urandom')
>=20=20
>          self.vm.launch()
> -        self.wait_for_console_pattern('Welcome to Alpine Linux 3.16')
> +        self.wait_for_console_pattern('Welcome to Alpine Linux 3.17')
>=20=20
>=20=20
>      def common_aarch64_virt(self, machine):


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

