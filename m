Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13FE33EC3A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 10:11:20 +0100 (CET)
Received: from localhost ([::1]:59910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMSD1-0003Z4-U6
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 05:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMSBm-0002yN-Fu
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:10:02 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMSBj-0005a7-He
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:10:02 -0400
Received: by mail-ed1-x536.google.com with SMTP id o19so1315519edc.3
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AT6AGryVfAQzGuwwXs7eUT4zEJi6ZCaLdN/NLPmoO/A=;
 b=Edva5iUYxE1DMqi7lxg2NXsOX4dR/RfTVe9tCydH8DAILK3nUVIBstC+iuzHrTEd6g
 InQqC9eOpjZkZCDFLFUQV9zIjllD8YvqS3DxNvBDe3KGJu3Un6HdUBCtK/pQPv6SbQDw
 0k5O14Qhbz2BBI3amJj7TFk709rBOPXwb+WSdiBxqBS8yUALJuDsR2JGk9PLgtZzOIfD
 Bx3/OfA/verRBwJYgMdKqbCyaYrJwtubMMvb1cCkNVRL/zTGZu8kBzLZLbcujv28tlUU
 sgFeSLuRLsVWHVe2nGV9X9oVrun4YAJw46AM5GQhOeu+zZrd9P/w7jiOEGKiitBdM2bF
 3nTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AT6AGryVfAQzGuwwXs7eUT4zEJi6ZCaLdN/NLPmoO/A=;
 b=Ns0sd/7lQBYPEmMWk9nFmoVry5Xa8tLdqaP3k+zuINrnqOYwQkLdkAz/NRVV2fHJvh
 Cz13cpdX4KLQsrTPz+nk92Qv626SnHcicwUya3oGlH33dppgaGYifl2YB4WaiooA7Y/B
 FIku6sU6LJM8/EBqRHXJC5u0KhaHQqoQqFcO7oWHKOhK2zxuqayrFPkRczQiA7OTHP59
 d4RPQrThDXNTiBFJwVTOvE2B9FgLpUFt2IrDBLOv4sEOrCb2kuDYx8sM8PMWf5qkKsfp
 eZ9Hne4NSJvK4Zg2mnXeV1gBgI6aNAC3MvrMBI1tDKKfeu1K5fO96ubVMhAbrOqRWhlm
 Ilfg==
X-Gm-Message-State: AOAM531Otn1Z+n9T7nEHhCra8jLuUK8DcA4tfK+9CTpXo0D2MvZ5hrI8
 u96fbAq6gYCeJPnEM6ZOnzhbKWKq0xI3X0rQSrl5tA==
X-Google-Smtp-Source: ABdhPJwCughdA8t4qUcnUSYTfCVdkuCS9lFpOVwv4pSm/8cK8pKdIkFJZ+NWO0w1uEMu2HzTO/bzv5BRziHQQLFlo+Y=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr40301647edv.44.1615972197126; 
 Wed, 17 Mar 2021 02:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210317044441.112313-1-gshan@redhat.com>
In-Reply-To: <20210317044441.112313-1-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 09:09:34 +0000
Message-ID: <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
>
> There is a added clock to trace buad rate change since v5.2.0 by
> commit aac63e0e6ea3 ("hw/char/pl011: add a clock input"). The added
> clock causes migration failure. For example, migration from v5.2.0
> to v5.1.0 can fail with the following error messages:
>
>    qemu-system-aarch64: error while loading state for instance 0x0 \
>                         of device 'pl011'
>    qemu-system-aarch64: load of migration failed: No such file or \
>                         directory
>
> This fixes the issue by reporting the baud rate change at post load
> time so that the clock won't be migrated by sub-section to avoid the
> migration failure.
>
> Cc: qemu-stable@nongnu.org
> Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/char/pl011.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index c5621a195f..401bd28536 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -322,20 +322,20 @@ static const MemoryRegionOps pl011_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> -static const VMStateDescription vmstate_pl011_clock = {
> -    .name = "pl011/clock",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_CLOCK(clk, PL011State),
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> +static int pl011_post_load(void *opaque, int version_id)
> +{
> +    PL011State *s = PL011(opaque);
> +
> +    pl011_trace_baudrate_change(s);
> +
> +    return 0;
> +}
>
>  static const VMStateDescription vmstate_pl011 = {
>      .name = "pl011",
>      .version_id = 2,
>      .minimum_version_id = 2,
> +    .post_load = pl011_post_load,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(readbuff, PL011State),
>          VMSTATE_UINT32(flags, PL011State),
> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
>          VMSTATE_INT32(read_trigger, PL011State),
>          VMSTATE_END_OF_LIST()
>      },
> -    .subsections = (const VMStateDescription * []) {
> -        &vmstate_pl011_clock,
> -        NULL
> -    }
>  };

Doesn't dropping the subsection break migration compat ?

thanks
-- PMM

