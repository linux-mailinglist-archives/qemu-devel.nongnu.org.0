Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA553685F1E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 06:45:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN5tg-00022m-Oq; Wed, 01 Feb 2023 00:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN5tc-000225-Ns; Wed, 01 Feb 2023 00:43:00 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN5tS-00069H-V1; Wed, 01 Feb 2023 00:43:00 -0500
Received: by mail-ej1-x636.google.com with SMTP id dr8so26530701ejc.12;
 Tue, 31 Jan 2023 21:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pn19rRG/7d/WUOSzKiY9fffNXirK+WkYw4Vs2l/Coe0=;
 b=KZCKJFk9xndQkZMM6sXo5rCUKlGNTAZbYRsafZTbwVltunqwZGBGzC3Vz1Ztq5+DdF
 SUW8E02AYBGY6Y/txN9E4ECwB1EWu2Cy+Mc8pxoZiuLiMh4T6X2Qz/YeOLSU+EcDhiZT
 wGQsHL2+RuCKK5knQboiod2ZA+4XutjsNM1To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pn19rRG/7d/WUOSzKiY9fffNXirK+WkYw4Vs2l/Coe0=;
 b=s8Hvh0tjZMLO0tXatx0kYjjGB7FcksBHkUZCJn7/mXGqisnOtAN/qTsBKL9nz+BB+a
 yzvg2SfFpVivI0i9RpcTGaLyUY1yzFhaAiRhIK+mDAHIVzsET0GpsigXQ1CH2DydNREk
 Hy7qUwzcokUdjZqE6hct86pjWDG8mtsjgLFJeCpt8rdO/cxO1ijFBDdZ5Z9rRSf8cO24
 1vwOdF4zdQhFIICbQyd4ZC8IwIM+L71Uje4tgFVFWryy1BmzyKM+dXzO+Gya6iyZaJuW
 X2yTbg+xREJ5r/yNCMPjqbtczOSUBfh39ndtFQk/7q7acxDohV0FBZltRRswNA3KBe2y
 8eCQ==
X-Gm-Message-State: AO0yUKUzGRQZWZO4Zx3SVypfMt1Y8atfAlIGWj7Y/B1GTm1e99beJofy
 8K/3f3VF+a6DWVWf6Y+4grqFDJNMQ9ODf4GvxfI=
X-Google-Smtp-Source: AK7set/EbbxeE7qSsCyoaw5B0xGvR4JptCUouKR6fZp70E/Cwi71kaa710fMTBG/QbwQ7OkCCMW+qYNiXI9zmlq5V2E=
X-Received: by 2002:a17:907:2391:b0:87f:5802:fd72 with SMTP id
 vf17-20020a170907239100b0087f5802fd72mr294894ejb.237.1675230162885; Tue, 31
 Jan 2023 21:42:42 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-8-clg@kaod.org>
In-Reply-To: <20230119123449.531826-8-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:42:30 +0000
Message-ID: <CACPK8XfP55=6DXYKzaKWYp5O4PMNKpHiJ92VVDxXfki=WrVEvg@mail.gmail.com>
Subject: Re: [PATCH 07/25] tests/avocado/machine_aspeed.py: Mask systemd
 services to speed up SDK boot
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 19 Jan 2023 at 12:39, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

NIce!

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  tests/avocado/machine_aspeed.py | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspe=
ed.py
> index 773b1ff3a9..1cab946727 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -183,7 +183,14 @@ def test_arm_ast2600_evb_buildroot(self):
>
>  class AST2x00MachineSDK(QemuSystemTest):
>
> -    EXTRA_BOOTARGS =3D ' quiet'
> +    EXTRA_BOOTARGS =3D (
> +        'quiet '
> +        'systemd.mask=3Dorg.openbmc.HostIpmi.service '
> +        'systemd.mask=3Dxyz.openbmc_project.Chassis.Control.Power@0.serv=
ice '
> +        'systemd.mask=3Dmodprobe@fuse.service '
> +        'systemd.mask=3Drngd.service '
> +        'systemd.mask=3Dobmc-console@ttyS2.service '
> +    )
>
>      # FIXME: Although these tests boot a whole distro they are still
>      # slower than comparable machine models. There may be some
> @@ -208,7 +215,7 @@ def do_test_arm_aspeed_sdk_start(self, image):
>          interrupt_interactive_console_until_pattern(
>              self, 'Hit any key to stop autoboot:', 'ast#')
>          exec_command_and_wait_for_pattern(
> -            self, 'setenv bootargs ${bootargs}' + self.EXTRA_BOOTARGS, '=
ast#')
> +            self, 'setenv bootargs ${bootargs} ' + self.EXTRA_BOOTARGS, =
'ast#')
>          exec_command_and_wait_for_pattern(
>              self, 'boot', '## Loading kernel from FIT Image')
>          self.wait_for_console_pattern('Starting kernel ...')
> --
> 2.39.0
>
>

