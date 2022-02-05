Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ABF4AAC24
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 20:02:01 +0100 (CET)
Received: from localhost ([::1]:36918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGQJr-0006Xz-H5
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 14:01:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGQC3-0003r1-0F
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 13:53:56 -0500
Received: from [2a00:1450:4864:20::431] (port=39465
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGQBz-00084v-NT
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 13:53:53 -0500
Received: by mail-wr1-x431.google.com with SMTP id v19so2526359wrv.6
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 10:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WsMT7yc0e3FIxzf42eAGRkG1JRT+7YCgiVQpwvXHuQo=;
 b=fDKhlLyY0s+EndCe9XETaYXmWqxyQiCHLl4vGUZJKUHETTflSo2b6OmaW94uVf7V0j
 /5TLdKM10vOe5EgoFIrcMeyvceHpASjuXTMpeFnflFBf8NXOD+T3ZTLT/jFEvbtPFdaK
 5Pb+jCCQxzFJpk0S8+Wwdw0FxuSNGQpctUiJfpbgxikAU4m+JohYdYLjY2iRcRRnMBqi
 TgtEnQrx6OskZNyDFcTyu3YM72l3ZC1T/uoA/dgtJLApi1MReGY7FMy3G7SkRoF0s3C8
 PqHhL8pNnNqP4ffh6a8v+u3UAQKZj9L8gaV2aiVP5wSGByVdR0WpyhkK/4+T2neXMgXV
 K4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WsMT7yc0e3FIxzf42eAGRkG1JRT+7YCgiVQpwvXHuQo=;
 b=p2UxUb7En3jqg1ExxOb0bpPsLoKa5QtSRnajiFrzSHpriDV8Qyo0b8geEr4v0bVDja
 GNJFcVC11XrTWvO8Hvl/hKjdRoiLAYJMWahTkDx9IzdRBU6XLiWSIV6q2NwK694hYCEU
 ekMmfwo6x8+Yl2IK8LMqh6dei0AHXA2pJbbdjXx3/wWpKwuxYb/xvNMmdftxHJJvB7I5
 BXET9rGtIuIsxFVYDBzlAsKKUVKiXnr9L/cVIZecVr9JC/bOViZ0krC2t92I+cJqQvKp
 B2VJysADt4UBN+26oJMF0LDttyTug9TZtFXYptbQGp8+DKJfIvjAj6D924FxKHVXjgrG
 o4ZQ==
X-Gm-Message-State: AOAM531J12DmvROgTMCb33yDXkWL7TYNls5393czSmJ4m6DjGxV2JVsY
 0sp9oqtQZyuneZVT6DYXQmoXh21V4jBYXoZKAiPMhQ==
X-Google-Smtp-Source: ABdhPJyUZRBqJl77JMUXHokIITdSY8zCCmdYiQejCvhZijd2K09YsjR9es1K801vLxnizuCvsVV82/afJQC1PXnlnQM=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr4076549wrz.2.1644087229749; 
 Sat, 05 Feb 2022 10:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20220205175913.31738-1-shentey@gmail.com>
 <20220205175913.31738-2-shentey@gmail.com>
In-Reply-To: <20220205175913.31738-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Feb 2022 18:53:38 +0000
Message-ID: <CAFEAcA_y69=iXMH75dHeNkxMa038Z7Xk63GW9fdcAFHJSWS=sA@mail.gmail.com>
Subject: Re: [PATCH 1/2] isa/piix4: Resolve RTCState attribute
To: Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 5 Feb 2022 at 18:05, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Assuming that mc146818_rtc_init() is "syntactic sugar" for code that could
> be converted into configuration in the future, this patch is a step towards
> this future by freeing piix4 to care about the inner details of mc146818.
>
> Furthermore, by reusing mc146818_rtc_init(), piix4's code becomes more
> homogenious to other code using the mc146818. So piix4 can be refactored in
> the same way as code already using mc146818_rtc_init().
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/isa/piix4.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 0fe7b69bc4..08b4262467 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -46,7 +46,6 @@ struct PIIX4State {
>      qemu_irq cpu_intr;
>      qemu_irq *isa;
>
> -    RTCState rtc;
>      /* Reset Control Register */
>      MemoryRegion rcr_mem;
>      uint8_t rcr;
> @@ -193,22 +192,11 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>      i8257_dma_init(isa_bus, 0);
>
>      /* RTC */
> -    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
> -    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
> -        return;
> -    }
> -    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, RTC_ISA_IRQ);
> +    mc146818_rtc_init(isa_bus, 2000, NULL);
>
>      piix4_dev = dev;
>  }
>
> -static void piix4_init(Object *obj)
> -{
> -    PIIX4State *s = PIIX4_PCI_DEVICE(obj);
> -
> -    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_MC146818_RTC);
> -}
> -
>  static void piix4_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -233,7 +221,6 @@ static const TypeInfo piix4_info = {
>      .name          = TYPE_PIIX4_PCI_DEVICE,
>      .parent        = TYPE_PCI_DEVICE,
>      .instance_size = sizeof(PIIX4State),
> -    .instance_init = piix4_init,
>      .class_init    = piix4_class_init,
>      .interfaces = (InterfaceInfo[]) {
>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },

This looks like it's going backwards from the way we'd usually
write code for devices that contain other devices these days.
The "we have an init function that does stuff" is the older
style. The newer style has the inner-device as an embedded
struct in the container-device struct, which is initialized,
configured and realized using standard functions like object_initialize
and qdev_realize. (I do wonder whether that ought to be
object_initialize_child() here, incidentally, but haven't checked the
details to be certain.)

The existing uses of mc146818_rtc_init() are mostly in older
code, and also in board-initialization code, which traditionally
didn't have a convenient struct to embed the device-struct into.
hw/isa/vt82c686.c is the only use in another device model
(which could in theory be refactored to the embed-the-device-struct
style, though the benefit of making the change isn't large, which
is one reason we still have the mix of both in the tree).

thanks
-- PMM

