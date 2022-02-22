Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4804C00E2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 19:04:36 +0100 (CET)
Received: from localhost ([::1]:52614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZWd-0003hX-GR
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 13:04:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMZGk-0003Rd-7X
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:48:10 -0500
Received: from [2607:f8b0:4864:20::b32] (port=45634
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMZGi-0005cq-A2
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:48:09 -0500
Received: by mail-yb1-xb32.google.com with SMTP id g6so21443924ybe.12
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=STCLOX/KLqDL3iOQ1XVR3tYzvbyCMm7FsnFus6/rKTY=;
 b=vwbc0nlKbcbl/dY2QgdPowjx7EmaAY8DHggwv4ompDYmeH83jpN5mkETyFxXfzP+PI
 O326GOaYPJXkLSDc7mA1ap7istGQtXHlqOGibwar15AHjJFm82b+fMavAFbyIPKoBT5v
 0CsgAepqLZk74Bg/uxnu6PJzeICgKT2cpaiOuzuOQ8vwzWzyLm1eh1t5FxAtScgHmlAn
 p85RwDuISGYcg+be1Z7rrEHigR0+01DWocwAfgTVY5kDM8RqMqOo13U2/p1TpHQuVbXT
 +mCeDsOAcOMcAGBoQmJpqCFUfmTYiwR8rC+wutVDLnLmhzqB4w6Gd9qKN5nofwTMtet3
 mhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=STCLOX/KLqDL3iOQ1XVR3tYzvbyCMm7FsnFus6/rKTY=;
 b=xHxWnmTfIAREIX07TpdKlMe2We7ylaaSXNmY6kbJWorSpvJ+Pq2aB4n1mpelHBdecM
 CmAgYL19fYtxgO0Dmj7PrO9MJemIc+Tc5eAXePdo/Z1lKTylMq16VW38gzJ47R8oV/bM
 PyftF6MY/GRb4WGs4dt1mekYHhawVKJTn3uVxruwu0Nsh/7cn5RjnTv1/OZEvwdtNVW5
 HbWivMAnKz4jiOicHhVvYz3Sr/gGYUVMhiqApgFZDerAgupgV6Cw941adXKxTY7s5EqQ
 R8OFpNBiL0YQ0sJk35F1s4rs2Nrjv9QbWc3Vz0oi2srfpKrv8C5F2epy8Yq6nKNq403w
 PARQ==
X-Gm-Message-State: AOAM531cYk9MkW5szBP1fc5X/HG0cN8u87GuzLrjH/ujkcGAHpn2eW8c
 y1Pr+Z7zlId/BC4E8mWaxgS0hmbpAzTLj8mH+5girza8MlI=
X-Google-Smtp-Source: ABdhPJxZjuGVBiCZGrwYt1rzgPGx8X3vc+Zn6LQjabhykMFyWTn9Z+QoFwCv80EFjL82g7dyWHpaKC8O7uxbcvyzNsk=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr24338044ybk.193.1645552087247; Tue, 22
 Feb 2022 09:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20220222173819.76568-1-shentey@gmail.com>
 <20220222173819.76568-3-shentey@gmail.com>
In-Reply-To: <20220222173819.76568-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 17:47:56 +0000
Message-ID: <CAFEAcA-MDH48sv6O5taVn=A8BMZHQWPJhkaTQ_YtTnLq3mgGdA@mail.gmail.com>
Subject: Re: [PATCH 02/22] hw/rtc/m48t59-isa: QOM'ify IRQ number
To: Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 "open list:PReP" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Feb 2022 at 17:41, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Exposing the IRQ number as a QOM property not only allows it to be
> configurable but also to be printed by standard QOM mechanisms. This allows
> isabus_dev_print() to be retired eventually.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/rtc/m48t59-isa.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
> index dc21fb10a5..d1c1d789a5 100644
> --- a/hw/rtc/m48t59-isa.c
> +++ b/hw/rtc/m48t59-isa.c
> @@ -42,6 +42,7 @@ struct M48txxISAState {
>      ISADevice parent_obj;
>      M48t59State state;
>      uint32_t io_base;
> +    uint32_t isairq;
>      MemoryRegion io;
>  };
>
> @@ -79,6 +80,7 @@ static void m48txx_isa_toggle_lock(Nvram *obj, int lock)
>  static Property m48t59_isa_properties[] = {
>      DEFINE_PROP_INT32("base-year", M48txxISAState, state.base_year, 0),
>      DEFINE_PROP_UINT32("iobase", M48txxISAState, io_base, 0x74),
> +    DEFINE_PROP_UINT32("irq", M48txxISAState, isairq, 8),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> @@ -99,7 +101,7 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
>
>      s->model = u->info.model;
>      s->size = u->info.size;
> -    isa_init_irq(isadev, &s->IRQ, 8);
> +    isa_init_irq(isadev, &s->IRQ, d->isairq);
>      m48t59_realize_common(s, errp);
>      memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t59", 4);
>      if (d->io_base != 0) {
> --
> 2.35.1

If the user creates the device specifying irq=16 then isa_init_irq()
will assert. Since these devices are creatable by users on the
commandline, I think the realize method should check that the
property value is in range (d->isairq < ISA_NUM_IRQS), and report
a suitable error back if not.

thanks
-- PMM

