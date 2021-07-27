Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9E53D71D0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 11:20:32 +0200 (CEST)
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8JGJ-0006Sg-6Y
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 05:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JEr-0005Fq-66
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:19:02 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8JEk-0003DT-4H
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 05:18:57 -0400
Received: by mail-ed1-x52a.google.com with SMTP id da26so14458585edb.1
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=peTq3EUlBydrgfKap+VyP4eLWmc3Zuk125IpO8u02Z8=;
 b=heGxfIdobrCHXGSDzgigIjFbVNJ0wdSEFxKOe6enu80xQd3CNmFxCVBvAhHApK4+Bx
 G9YFtwADL6YpKsp1kbg0ocVbsDSBipY4kK1u/BN6HO7vvn8pdFZq5BmTjfaZh0+D94JP
 YwC+POSbP4cppsRUd2bSSMvBCCMwEQHEIE0pEMKuPXylfRKNacS/gkYuVcVsdX/F1C4P
 MnOjibvAeDdmqegzT6YzcGibrFD4E2WUPc5mLf3d9e4RufzwgfRnQZMOiYltiAtHVw9n
 9VTk04PmPFzJwa9A08areSkNGVQLKtl56vWu2AqvW5LDHQcU2+J70RQoekzaMvxFiePc
 o31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=peTq3EUlBydrgfKap+VyP4eLWmc3Zuk125IpO8u02Z8=;
 b=AtsJ0KybCzYm6kCZU5awW/j8Y20/fAtX7v5CHrccXPmWmikfjSyLuX+aZyWF9/VS3I
 tf9F5ZSyoiLgf/Ffakmpjt1AeWcxPvaZ+x6WXQw2MV3QhBeLEMF60l7pulGlzqeYWzA8
 rgZQ/jWru8rQ3W93AQX+B3p1+iKdjZ+Rb12AJ/A89TYHqyHaarPKfMYIp8YOqJcdPvfw
 NgpzvzSenXxi7h/7WHTFoMMvzCakbSIOU0Pv2aNCoBF5v7s1hoZPYeUKt4cyWhTMxyz5
 p++068XvAgWAQwmRLzi4OvASh+HhuHOlySNBeRhKPcDxpxO9fM54dbJw4aXBs2uKddLM
 DOcg==
X-Gm-Message-State: AOAM532dUfEcHdNeoq7pSkshNzNK7xLHoWBK8ZWwUG+rC8pItnkhJ0pX
 tue2+Sy1MbnF30x4e43xc08+d4TCCsPf0JLUiYirzA==
X-Google-Smtp-Source: ABdhPJwIZNHsNQBa94J+PQl+LXldhbFuRd+28cjHKAagZaTJnqCWv7jJl6mvdx04y4wEahDBxWcMoMZv7Eh23/grB2M=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr26163809edt.100.1627377532630; 
 Tue, 27 Jul 2021 02:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210726150953.1218690-1-f4bug@amsat.org>
In-Reply-To: <20210726150953.1218690-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 10:18:10 +0100
Message-ID: <CAFEAcA9M5u-NF9v1MmGctbCh_LMRyhtvLc9yKzuP2SFsgPbViQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/nseries: Display hexadecimal value with '0x' prefix
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 at 16:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/nseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 906c915df78..af3164c5519 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -692,7 +692,7 @@ static uint32_t mipid_txrx(void *opaque, uint32_t cmd=
, int len)
>      default:
>      bad_cmd:
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: unknown command %02x\n", __func__, s->cmd);
> +                      "%s: unknown command 0x%02x\n", __func__, s->cmd);
>          break;
>      }



Applied to target-arm.next, thanks.

-- PMM

