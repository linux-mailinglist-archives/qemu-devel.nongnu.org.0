Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CF562E25C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 17:58:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviCh-0007JW-FY; Thu, 17 Nov 2022 11:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oviCf-0007Ep-F0
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:57:29 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oviCd-00080W-BP
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 11:57:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id bs21so4849125wrb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 08:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBSQo/2wgXCdFBlpTr8kzwWNsIYuz0LA64eki3qI5so=;
 b=PMZln2IU08ppTt9fmgLG0C5Q4xnNiIIdJps3rQo6wY4X6z1Of3yc8Fi1vWFt6IFlQ0
 aY61MhtqfBhU2x8uJPtI6kRJc/dIoi6f6QeCZLkezyTm4nZBQc5TWm40kqoHjEVLs7da
 5Zukogt9FljWC05vl9XGqOCRN0cOJPSQkM4EjFYWCVC9rb3jwowsBodAA0zBZdb61JpW
 8H5JdkL/PxBoish+YZksWN9JvQRmX53MNVSATbWoI3Nf5Sei6r8IE9n+vAZG4E3hNr8F
 C/Hawyc/gFzD6nylqhO9t1SVi6kwiRWMfSfAtPn+pInn7cV5hC6GCR+laQbQ6IEdthVt
 52NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jBSQo/2wgXCdFBlpTr8kzwWNsIYuz0LA64eki3qI5so=;
 b=eXhTHyTjZMmRMjdW7e7uyI2hdRQE0uvZbZFiXtN7w1/Myo40t9NdUwis6ZM9lwYw4M
 S2Jq40ObKQ8nOGDqNG0pl0M1UAcf1UvHMaZF5LZgWqXYsrnFBDi3Vxrtpyc69v9xb9bA
 2bGJXQl6mbO8x4PAs8U5NjFWj81Km2HE42tPGuumHaqoEnukC0WObalGUntX4+EMQ27W
 s+xeMOhnGd66P4svGsIBlky94GZ1BUijFlWfv05ZtsgtynMsJgsoKypKYbEYSA+yUBBr
 sAkJOfNH3LFwS+7jnjXhps5cqpfu62Ek4WuPraF7wDwQrPMp7FZl0WRTwYXEMeIFVcaA
 /8HA==
X-Gm-Message-State: ANoB5pltT1LgrH81BULtxQHzoK53rNbEIEFMiYyZFeCPiDYqEfmJMQbf
 xgiy53D6W7SeUqK7NZDK8gZ+fw==
X-Google-Smtp-Source: AA0mqf5pYl9gxLwn3JTf16KUKymRb/SoSRAKlCyXy3tr7x+P6wirBcybYLCnQ0HXuOo113YMWyNwFg==
X-Received: by 2002:a05:6000:1d97:b0:241:b99a:949f with SMTP id
 bk23-20020a0560001d9700b00241b99a949fmr1547776wrb.599.1668704240908; 
 Thu, 17 Nov 2022 08:57:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a1ce901000000b003cfa80443a0sm1677446wmc.35.2022.11.17.08.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 08:57:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8DED81FFB7;
 Thu, 17 Nov 2022 16:57:19 +0000 (GMT)
References: <20221117111628.911686-1-peter.maydell@linaro.org>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-7.2] tests/avocado/boot_linux.py: Bump aarch64 virt
 test timeout to 720s
Date: Thu, 17 Nov 2022 16:57:14 +0000
In-reply-to: <20221117111628.911686-1-peter.maydell@linaro.org>
Message-ID: <871qq18qog.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> The two tests
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3
>
> take quite a long time to run, and the current timeout of 240s
> is not enough for the tests to complete on slow machines:
> we've seen these tests time out in the gitlab CI in the
> 'avocado-system-alpine' CI job, for instance. The timeout
> is also insufficient for running the test with a debug build
> of QEMU: on my machine the tests take over 10 minutes to run
> in that config.
>
> Push the timeout up to 720s so that the test definitely has
> enough time to complete.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/avocado/boot_linux.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index 571d33882ae..32adae6ff6a 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -64,7 +64,7 @@ class BootLinuxAarch64(LinuxTest):
>      :avocado: tags=3Dmachine:virt
>      :avocado: tags=3Dmachine:gic-version=3D2
>      """
> -    timeout =3D 240
> +    timeout =3D 720
>=20=20
>      def add_common_args(self):
>          self.vm.add_args('-bios',

Queued to for-7.2/misc-fixes, thanks.

--=20
Alex Benn=C3=A9e

