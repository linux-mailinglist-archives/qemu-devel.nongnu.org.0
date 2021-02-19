Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37398320166
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:37:35 +0100 (CET)
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEP0-0005kh-9Y
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDENH-0003xd-Pq
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:35:47 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDENF-000446-Th
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:35:47 -0500
Received: by mail-ed1-x532.google.com with SMTP id j9so12478011edp.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 14:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Ls+Thjdm59QTgtSGiw/3kk7NENgUEaJuo+zSis5sb4=;
 b=xYU9vLN/VKaCrO5HfNg28B3Z8Yk8AxeN5RGMLGDaTdRUROgA2lvEVMCjKCseJl8Dzp
 2Oif6CV60UX03fRYQcKj8JJnPgTdqCkTZleh42Av1jt8b6ARmej8Jo6YjxY3Vz0KJPf3
 hL8y809+2vt/858fgaFy8pAV1In/HYCvWWtxjPtrtvizWqQ/0WIIdm6FkXpOjmVkcGY9
 U7wTmv34Q8V43aU38ATlhiwxJ8CxSpx+lEmOaCHBuiCU4QNkQqL+GFQp31C9hagkhohZ
 0AngjHu3eMGIhckhsSQwcJ0Aq7DYwkP8QAYitlrJillMZgfUTX+um8I/PHhiYs8+QCcH
 PMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Ls+Thjdm59QTgtSGiw/3kk7NENgUEaJuo+zSis5sb4=;
 b=JV78TFtru0W9fLUVtYqKYurINSkAXHRKs3Dtz5z4LYIkq/3bJer/n9rY+viJzS4sc8
 FazctMiRy3MTtFEQ8opYrKl/5g9JSttvGtgukkjSh/BVlU2Wz0k/zkoIaOHrpThw9SHU
 C4rvvtCCRh4PU3arkKpK32uVe7xT8mGaaGpochxSxnAw8pdZC8ab5iLOAu0N7XawBN8J
 dhPIx5H3DqM20DJVAGoY+D910gXVIvGWiLgn8gQ+pQ2xrxRqgjuq6Ren/ZHgd42NykXL
 +n9J5YfrBRBHcLPzO7VxLrEKn56fL5f2+6A5/LJRk3pywJplCy5XNLRQUtUgvo3IcSGV
 4YyA==
X-Gm-Message-State: AOAM533lAG7z0QGqF9YsrUXGhrpE/EPFNxPgfYk4h46PQJMRkBOH/eKZ
 VhvdGF3pOzgul+GUMQyS6gBGXxtWheY3/SrAqn9WXq32PdA=
X-Google-Smtp-Source: ABdhPJzRUtF1YlzziV3tuEpIZQJ7TzAA99xDewMtbQiBBJKn81QxqkyffK4XPQkS6TMw7hr9nngiK0rSlHds6KSVhVk=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr11065311edd.100.1613774144502; 
 Fri, 19 Feb 2021 14:35:44 -0800 (PST)
MIME-Version: 1.0
References: <20210112012527.28927-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20210112012527.28927-1-jiaxun.yang@flygoat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 22:35:33 +0000
Message-ID: <CAFEAcA9npBhN4mGT5wmPfjAX_qXObduRNW8ohPjy4dq9wO-2Rg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/loongson_liointc: Fix per core ISR handling
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch has been reviewed and fixes a Coverity issue;
Philippe, are you planning to take it through your MIPS tree?

-- PMM

On Tue, 12 Jan 2021 at 01:28, Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Per core ISR is a set of 32-bit registers spaced by 8 bytes.
> This patch fixed calculation of it's size and also added check
> of alignment at reading & writing.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/intc/loongson_liointc.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/loongson_liointc.c b/hw/intc/loongson_liointc.c
> index f823d484e0..cc11b544cb 100644
> --- a/hw/intc/loongson_liointc.c
> +++ b/hw/intc/loongson_liointc.c
> @@ -41,7 +41,7 @@
>  #define R_IEN_CLR               0x2c
>  #define R_ISR_SIZE              0x8
>  #define R_START                 0x40
> -#define R_END                   0x64
> +#define R_END                   (R_START + R_ISR_SIZE * NUM_CORES)
>
>  struct loongson_liointc {
>      SysBusDevice parent_obj;
> @@ -125,7 +125,12 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
>      }
>
>      if (addr >= R_START && addr < R_END) {
> -        int core = (addr - R_START) / R_ISR_SIZE;
> +        hwaddr offset = addr - R_START;
> +        int core = offset / R_ISR_SIZE;
> +
> +        if (offset % R_ISR_SIZE) {
> +            goto out;
> +        }
>          r = p->per_core_isr[core];
>          goto out;
>      }
> @@ -169,7 +174,12 @@ liointc_write(void *opaque, hwaddr addr,
>      }
>
>      if (addr >= R_START && addr < R_END) {
> -        int core = (addr - R_START) / R_ISR_SIZE;
> +        hwaddr offset = addr - R_START;
> +        int core = offset / R_ISR_SIZE;
> +
> +        if (offset % R_ISR_SIZE) {
> +            goto out;
> +        }
>          p->per_core_isr[core] = value;
>          goto out;
>      }
> --
> 2.30.0
>
>

