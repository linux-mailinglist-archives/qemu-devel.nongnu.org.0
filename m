Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3069C2F0967
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 20:51:28 +0100 (CET)
Received: from localhost ([::1]:36718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kygkE-0003QX-On
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 14:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kygj4-00030R-M2
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 14:50:10 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kygj2-0007Ww-QS
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 14:50:10 -0500
Received: by mail-ed1-x532.google.com with SMTP id u19so16711666edx.2
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 11:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ALS+DJRbxmf8BDgI+5i7dVPzbv2zUtzQYjPNwramy5E=;
 b=qWgBIuhH9K48rRrp7z4jbuL1HA4fbEGedPm3I1oLuCEYIXQYLcWXrn7a0Wl648PqsK
 OsQAp//SnCOaq0+DFPapien31qMkj7HXJfDjhi5y+lKc4qf+mVmLU/eyn5b2BfY3TkDl
 7hW3SUGGmmDrK+24yr6l63+7VvV2xNGA7cWVq74/l7/drvpYlLUjGzHuZNi+nSdGYPWY
 3UE0N1ltQ17IAI9Z2OxQIg6G/siU16pvqltd5hC/zulGh9YF/wm9qNi03JawVYp9u3w9
 3gwQooi3uxIKhfOfuLKE7AUOaDeTToT7EmkNj/AvqRfFXZLkhh/FlHTAWyegR4QINZpl
 JkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ALS+DJRbxmf8BDgI+5i7dVPzbv2zUtzQYjPNwramy5E=;
 b=TqAl+uyWhcwcTYJdRYZbFkbL+mX+8INVcKvSCUG7QiP7M81gLAiUSRWIlw4I6nUXjQ
 iKePUiQ3OGkRC/h+Y1D2rCbFAbVYuFGE9bM9pQbS4DKPVKPMN6RzzO57M6L4Ge75so1t
 8KCVl+suRgu00kWkQvDiHhWoyVNCzRx0cyq4EaX0670+ak3ldsigS5S58KhCeOHWJm70
 wtrEXJhdSkDk5TIIM4rq7m1lSEH0CTfBnhDhjnghTttItxZbvbVu9Ok2XgdnIQ4EGWfz
 F62Vw7wCIixDVADGZ13Jk7FmibtH/LLTXj1Qmnu8sG+ryO2Y63kSlxZyOnPh4f4glDIL
 va9Q==
X-Gm-Message-State: AOAM533qdtDENgpjJskOuUmHfJ16UxbJmy6lviPo2ThzG4PraTk5wQUQ
 sz/NJJ9hGcpm0GZlOvKsZgARNv3JV/zqcmsIFTYj+w==
X-Google-Smtp-Source: ABdhPJxG++bEESfXA+j2bj7FqEuNwSKRKXWdcAeiXHeuVxxrFB22WvNScr9ddabmFzNcavZbSEfAngkMyVmL1haOnPU=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr11954538edr.204.1610308206796; 
 Sun, 10 Jan 2021 11:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <20210103205021.2837760-24-f4bug@amsat.org>
In-Reply-To: <20210103205021.2837760-24-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Jan 2021 19:49:55 +0000
Message-ID: <CAFEAcA_YqAiiLRY08-gACmKOCf2mat3AaBGnyRK0Jc+aK-iuOw@mail.gmail.com>
Subject: Re: [PULL 23/35] hw/intc: Rework Loongson LIOINTC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 3 Jan 2021 at 21:11, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> From: Huacai Chen <chenhuacai@kernel.org>
>
> As suggested by Philippe Mathieu-Daud=C3=A9, rework Loongson's liointc:
> 1, Move macro definitions to loongson_liointc.h;
> 2, Remove magic values and use macros instead;
> 3, Replace dead D() code by trace events.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20201221110538.3186646-2-chenhuacai@kernel.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/intc/loongson_liointc.h | 22 ++++++++++++++++++
>  hw/intc/loongson_liointc.c         | 36 +++++++++++++-----------------
>  2 files changed, 38 insertions(+), 20 deletions(-)
>  create mode 100644 include/hw/intc/loongson_liointc.h

Hi; Coverity complains about a possible array overrun
in this commit:


> @@ -40,13 +39,10 @@
>  #define R_IEN                   0x24
>  #define R_IEN_SET               0x28
>  #define R_IEN_CLR               0x2c
> -#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
> +#define R_ISR_SIZE              0x8
> +#define R_START                 0x40
>  #define R_END                   0x64
>
> -#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
> -DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
> -                         TYPE_LOONGSON_LIOINTC)
> -
>  struct loongson_liointc {
>      SysBusDevice parent_obj;
>
> @@ -123,14 +119,13 @@ liointc_read(void *opaque, hwaddr addr, unsigned in=
t size)
>          goto out;
>      }
>
> -    /* Rest is 4 byte */
> +    /* Rest are 4 bytes */
>      if (size !=3D 4 || (addr % 4)) {
>          goto out;
>      }
>
> -    if (addr >=3D R_PERCORE_ISR(0) &&
> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> +    if (addr >=3D R_START && addr < R_END) {
> +        int core =3D (addr - R_START) / R_ISR_SIZE;

R_END is 0x64 and R_START is 0x40, so if addr is 0x60
then addr - R_START is 0x32 and so core here is 4.
However p->per_core_isr[] only has 4 entries, so this will
be off the end of the array.

This is CID 1438965.

>          r =3D p->per_core_isr[core];
>          goto out;
>      }

> -    if (addr >=3D R_PERCORE_ISR(0) &&
> -        addr < R_PERCORE_ISR(NUM_CORES)) {
> -        int core =3D (addr - R_PERCORE_ISR(0)) / 8;
> +    if (addr >=3D R_START && addr < R_END) {
> +        int core =3D (addr - R_START) / R_ISR_SIZE;
>          p->per_core_isr[core] =3D value;
>          goto out;
>      }

Same thing here, CID 1438967.

thanks
-- PMM

