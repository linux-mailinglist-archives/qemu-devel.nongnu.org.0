Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C5C53F2DC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 02:02:56 +0200 (CEST)
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMgR-0005Xb-8A
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 20:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyLxj-0003n5-83; Mon, 06 Jun 2022 19:16:43 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyLxg-0004HG-Ir; Mon, 06 Jun 2022 19:16:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id m26so10318571wrb.4;
 Mon, 06 Jun 2022 16:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EEXQgJNMNd8PoHGdHAcmZLGIoeML5qu1BpQ+gfg1nlA=;
 b=irzlRX8Toroak8BVl1STzOji4DrW6843y3IWsgfomte9a9iJ/LLY5CJCnXvBfjh80F
 xOwvKNvw2luY+0tdARTM4TXd4aNNhNoBkWkoYU1eD1CvdkK5oFMC0jyI8YS9/3Fo2WSn
 dyM05NyODXqszNFQ15H5WwVTqH0o5s44yB6S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EEXQgJNMNd8PoHGdHAcmZLGIoeML5qu1BpQ+gfg1nlA=;
 b=i7BA2cM21YAnxGt2aizeGq7EyACovjFmFhYL59le2NeEjI7ZgnRRVpU2WeotDlPj4Y
 W9RwsNsNcfFoFN/Vd6JP+tlOwius36+p/CoitGEoGaXNseHRI7R360c8ego3sDAZPzT8
 7fSzL4R6FCqSPIHiZjqDLkve2foKomhQAlCGQ35cMgtjVSAATw67b/dK5zm4aaizHJvv
 I6Xrt5uT761RyJ13XFWUXaHw7vmRAV/MArNKor8DmYFKYtzVTl17nm9RsmjUjqjAGoXR
 J3ZOztzR7n443kCKaDtqgiWcHnPBgpoHd5Dg2Zx/N5KAeXQIQAMGR87nwed0bCGQcSUf
 QqEg==
X-Gm-Message-State: AOAM531l2g8SbQIsbwdYHww9uhPQfMz8zJuF79PsU6d9I1u4cgtrQXxC
 QW5VwWavvdXzrSbLZavYBN5dBP39BAcwW1nm0lk=
X-Google-Smtp-Source: ABdhPJy0LIdw8BwqD1FBaX2zBHu7ilUKcU53zjJXXr46+ImrIzIEF23z8R+AjnQf7PJFMoxNAFuz+5t/76d6sKyKpMc=
X-Received: by 2002:a5d:6510:0:b0:216:f04d:3c50 with SMTP id
 x16-20020a5d6510000000b00216f04d3c50mr12141843wru.628.1654557397448; Mon, 06
 Jun 2022 16:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220606150732.2282041-1-clg@kaod.org>
 <20220606150732.2282041-12-clg@kaod.org>
In-Reply-To: <20220606150732.2282041-12-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jun 2022 23:16:25 +0000
Message-ID: <CACPK8Xerxw2s20971XBVVGbSruwAgbJAi=84DGhnKnnXQJzMXg@mail.gmail.com>
Subject: Re: [PATCH 11/21] test/avocado/machine_aspeed.py: Add an I2C RTC test
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Klaus Jensen <k.jensen@samsung.com>, 
 Peter Delevoryas <pdel@fb.com>, Corey Minyard <cminyard@mvista.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Mon, 6 Jun 2022 at 15:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Add a RTC device on bus 15 and check that the ouput of the hwclock

spelling: output

> command matches the current year.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  tests/avocado/machine_aspeed.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspe=
ed.py
> index a3b4b9e5093c..28b8a4c8124b 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -136,10 +136,18 @@ def test_arm_ast2600_evb_builroot(self):
>
>          self.vm.add_args('-device',
>                           'tmp423,bus=3Daspeed.i2c.bus.15,address=3D0x4c'=
);
> +        self.vm.add_args('-device',
> +                         'ds1338,bus=3Daspeed.i2c.bus.15,address=3D0x32'=
);

Is there any value running this on the 2400 and 2500 machine types
too? They all use the same model so perhaps not?

>          self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
>          exec_command_and_wait_for_pattern(self,
>                                            'i2cget -y 15 0x4c 0xff', '0x2=
3');
>          exec_command_and_wait_for_pattern(self,
>                                            'i2cget -y 15 0x4c 0xfe', '0x5=
5');
>
> +        exec_command_and_wait_for_pattern(self,
> +             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-15/device/new_de=
vice',
> +             'i2c i2c-15: new_device: Instantiated device ds1307 at 0x32=
');
> +        year =3D time.strftime("%Y")
> +        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', =
year);
> +
>          self.do_test_arm_aspeed_buidroot_poweroff()
> --
> 2.35.3
>

