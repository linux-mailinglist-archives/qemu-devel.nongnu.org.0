Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA28213AC0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 15:20:16 +0200 (CEST)
Received: from localhost ([::1]:54110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrLbz-0007u6-Hx
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 09:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrLXN-0000ws-OM
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 09:15:30 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrLXK-00081K-4j
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 09:15:29 -0400
Received: by mail-ot1-x341.google.com with SMTP id g37so2914905otb.9
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+oq+jdstCX5HFxMxLTaR5mr4I2zXa6c3eHgBmoGVyzs=;
 b=ATP21OfKyI4/2FMe2VvgwZyZeH8z76j+dQbwxUHJkQCOEr5DtdIIf6sl1UcL+EMLk/
 fzBeUfeVsuNn0tUzwEd+nVsv002Oc2pQ3Ke9YLecLgyireLv6UYyutC041LI50v+tBAA
 7EOEHXLzZrN8M4H635PxYC9kOjzQSqH1bblAZV8+Aeg+Lppcvt+dJVwHxnGlhmqtvnIx
 n9Gpvk3IEUz83iOniAWjgEECOkCST/gYVt5oku4K6ncW55gGKtmO6A2yK23uO7OHqD4v
 0a4ychTU0Y5ppmxAbhHN97tuyInvKxSQWHNRcEe7zlFY4oqXozhnx8SWg20i1kc63fxG
 USew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+oq+jdstCX5HFxMxLTaR5mr4I2zXa6c3eHgBmoGVyzs=;
 b=jmzKTbB9DNnQXOuusWbupcCuA6uRj4VGBpw7fDm1vbDF8q8v2LhsiWjCqsiZ3+L0SY
 kB2d7qZdsEz/d2hJsGfK4OtzvRqdGoOUgDzEQ86JAD1YP6UnrJ41L8QCwvNvRKsLDDOy
 +LHDpAtxZUr+MQpDLh96lTXQyuAReNcO65QbyDo50yP/Js2zNsdJDwyI4hy4/wlXXp6O
 JkD3DClPv9ePtLNLnHthQxZ+r4zMv3nC2zvGEI/LVCxEHBROhdxrrD3AA0vwjZagdIbK
 qJ/B24xDjrPu1+nwd7YRAWxGJ3Uv52E3QENkmN9qhNuUAtbIfqRmLDCEFuzwpmCbKmS9
 /drw==
X-Gm-Message-State: AOAM533a1HxmAUwEm2cV/s/A8+P7QHHROS/iKEX46yLepwUdK09TBcxJ
 4GSoPk9gJP4J4mlsZWufK9Tu4PT4lnl15mWu+qN1Uw==
X-Google-Smtp-Source: ABdhPJw+KlNnjFqyUdPyAysO/Kkj7P7fcEksINrN4QVsppjBsbuetByRxWbs7zYcCsIK5pyScB7oUTt2s1n5tl6huhY=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr24435935otk.221.1593782125076; 
 Fri, 03 Jul 2020 06:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133912.9428-1-f4bug@amsat.org>
 <20200630133912.9428-9-f4bug@amsat.org>
In-Reply-To: <20200630133912.9428-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 14:15:14 +0100
Message-ID: <CAFEAcA9K5ikriXrrNGSz2MN54uwEcLx7TM7CGjFuLEei7gKdcg@mail.gmail.com>
Subject: Re: [PATCH v7 08/17] hw/sd/sdcard: Call sd_addr_to_wpnum where it is
 used, consider zero size
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Jun 2020 at 14:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Avoid setting 'sect' variable just once (its name is confuse
> anyway). Directly set 'sd->wpgrps_size'. Special case when
> size is zero.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 078b0e81ee..e5adcc8055 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -556,8 +556,6 @@ static void sd_reset(DeviceState *dev)
>      }
>      size =3D sect << 9;
>
> -    sect =3D sd_addr_to_wpnum(size) + 1;
> -
>      sd->size =3D size;
>      sd->state =3D sd_idle_state;
>      sd->rca =3D 0x0000;
> @@ -570,7 +568,11 @@ static void sd_reset(DeviceState *dev)
>
>      g_free(sd->wp_groups);
>      sd->wp_switch =3D sd->blk ? blk_is_read_only(sd->blk) : false;
> -    sd->wpgrps_size =3D sect;
> +    if (sd->size) {
> +        sd->wpgrps_size =3D sd_addr_to_wpnum(sd, sd->size) + 1;
> +    } else {
> +        sd->wpgrps_size =3D 1;
> +    }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

