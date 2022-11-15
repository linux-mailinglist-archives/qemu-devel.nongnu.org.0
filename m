Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2975262AE95
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 23:48:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov4ip-0007ts-Lx; Tue, 15 Nov 2022 17:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ov4in-0007te-OA
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 17:48:01 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ov4im-0003ta-0m
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 17:48:01 -0500
Received: by mail-wr1-x435.google.com with SMTP id j15so26902360wrq.3
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 14:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cmfskMtjbq+MwucxGF3VYEiwp0UyZlB+jDfUp7bRokk=;
 b=FNEshtbXYyAtfFGEqzYhg5BA8KNW/VKSZ8siDWcgZqFQG+KKf23w1bVfYvOV89U3s0
 npKXwQGBoGZTIpOQ1nOSmhtpS+SexFBB2JeY0tqWXb1N4O4AT5qi6qRKeWHMPaKZi6Cd
 EcuoBwigMSKcNYhloyoloFSVJqdol9XtqeweLYTGa2QgRjD7KCqW9bEVnt6FSzuPuap7
 6756IZ8ZZmnHkZ4W+Wmwjc1mZSSXfF9mN8Xt0883dJPNcVn3NCgrSLYDgNtTpxHuE1tM
 iEufgJ7YMfP9qrOZxZKQjT688R3yidi0d9levrMOrmoOZvn4hyU46ljLHPJnHvDFZI9h
 bimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cmfskMtjbq+MwucxGF3VYEiwp0UyZlB+jDfUp7bRokk=;
 b=2wkWDBDSMt+dKvEYYvEQjLFxrzMFLiw18rcaUWKYl32vKITUMzflWc0NMm0vy5wwzj
 kCLYK6faBMeR2kobPboxueU1X4M53eIhIJVOIrhtfDbX49M30jVbUoGtraGkEnJ2BdED
 UjtSHPX4TH5uqhW79wABRDSVQixbsuUp21fXJ45meFZIXmtI3j43SM/8j363fIzPDsqw
 LHRZnxGnbZdmReXmo6G5KKD4wcEs3orPhqzzqxgk7EV81t5JzpkirVqx+uAYnZxXhhJa
 Bwg/ZKXckTRebYJTyo5hstxhtwWOq4UcVDleYbGP3iHHMG03DgQcNVOfaBa4l2/yLyw/
 t86A==
X-Gm-Message-State: ANoB5pnnyc9EpEWE2ihN0kix6tzuVCOMeeCkBY9iphdlzwHOSf7tB4Ou
 MRWcrdNmKoasJp3N2pSJuRKDDA==
X-Google-Smtp-Source: AA0mqf6UHFJkjFV4HqeEj5sqgkWoQpUiiF0q7ytWFTa71eMzsCBr3kfAxCUrlAEUWNNnfI6CwEOIRw==
X-Received: by 2002:a5d:4f8a:0:b0:230:55fc:5de1 with SMTP id
 d10-20020a5d4f8a000000b0023055fc5de1mr11816988wru.500.1668552478539; 
 Tue, 15 Nov 2022 14:47:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g34-20020a05600c4ca200b003cfd4e6400csm130540wmp.19.2022.11.15.14.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 14:47:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 77F141FFB7;
 Tue, 15 Nov 2022 22:47:57 +0000 (GMT)
References: <20221115212759.3095751-1-jsnow@redhat.com>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani
 Sinha <ani@anisinha.ca>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
Date: Tue, 15 Nov 2022 22:47:33 +0000
In-reply-to: <20221115212759.3095751-1-jsnow@redhat.com>
Message-ID: <874juzal7m.fsf@linaro.org>
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


John Snow <jsnow@redhat.com> writes:

> Instead of using a hardcoded timeout, just rely on Avocado's built-in
> test case timeout. This helps avoid timeout issues on machines where 60
> seconds is not sufficient.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/avocado/acpi-bits.py | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
> index 8745a58a766..ac13e22dc93 100644
> --- a/tests/avocado/acpi-bits.py
> +++ b/tests/avocado/acpi-bits.py
> @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
>          self._vm.launch()
>          # biosbits has been configured to run all the specified test sui=
tes
>          # in batch mode and then automatically initiate a vm shutdown.
> -        # sleep for maximum of one minute
> -        max_sleep_time =3D time.monotonic() + 60
> -        while self._vm.is_running() and time.monotonic() < max_sleep_tim=
e:
> -            time.sleep(1)
> -
> -        self.assertFalse(time.monotonic() > max_sleep_time,
> -                         'The VM seems to have failed to shutdown in tim=
e')
> -

We might want some wait for consoles as well depending on what is output
during the run.


> +        # Rely on avocado's unit test timeout.
> +        self._vm.wait(timeout=3DNone)
>          self.parse_log()


--=20
Alex Benn=C3=A9e

