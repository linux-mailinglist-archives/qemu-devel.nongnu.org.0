Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89558585442
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:14:26 +0200 (CEST)
Received: from localhost ([::1]:54172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTZB-00008a-LL
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHTUe-0004zm-0g
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:09:44 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:38753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHTUc-0000XO-FY
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:09:43 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31f41584236so57482917b3.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 10:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=HB0HSpv+/UrsjXtkaPKaxVIzmy+/IFn+juh+1spvFj4=;
 b=NvlzIeORI4G38RnWFYZeShZyu9SnO830d27zvJ8nevyczh9SEjuYdFBaa6/zZIIj/y
 7gfJFiBIEIKcfA7gq7f9SOv2woh1PNfiC1eIyLgSnHgG8qo2VlXsKHKXscWkKnuku2je
 GIIg0HjTKTdc7FtPWliRROvwYnEMa4YhSmuiQJOC8uigky6Puddkp/o0oK3tqZxPF9Or
 iauC0zeGCHjnfJj48NZsZayvSUklPBbk61ygNNv4YKT11F5WHhScV9LuSMXJHWl/MCwe
 W5qWZ+h5K1GLKJjPbyV3Orjch4kaGUpfMkk20KgHagWcxo1w0JDB/ujZH4aRHbHJaP8E
 iV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=HB0HSpv+/UrsjXtkaPKaxVIzmy+/IFn+juh+1spvFj4=;
 b=fxfocRrJpbwe3dRHrKCOfUoyBI7C1QCZhE17EhTVNypt/tTH4DwAp//OGwYM8pqrTr
 8pGioNcrkHpUD2R3Al9HsWkLnB8LXxGhjKUA9vsmsmYWMDlKxLpcYAWSzSxsks7z6dIp
 oOMknUT7GEVZoo4lrzU6Z37ttz3tBZEZ0/9fmb7CshuJ8QO0AAu5jArUs+Fbf2zHzYMe
 zW123O2uEI415qVu6KNFrhJfTSPdYAYl6VpyfrnqzeeuBPrXhGtLM2PVTChQZZAE5xTm
 DmUTICEFZ5jTfERJvRLKdA7cN56/zbmpF+GuyUOPs+xps5JaQ9GP4o6+0NxbweNXJHBC
 eDOg==
X-Gm-Message-State: ACgBeo1hbG9abPY/GybxW2qcsTfOV5gXIuoCgMuow1zoqSINS92aqEeh
 A5Mu1AbJree9MrplN43lsMjX4lbYyvYcILxrukAjkQ==
X-Google-Smtp-Source: AA6agR6UdAOX6tk+Ra0ctX0xV4/nlBlhRvkAVJs5rAcK7+1k+S4zs7T377hzDMStukPhfKo43FTkWef1bpeGZjrMcFM=
X-Received: by 2002:a0d:cc0d:0:b0:31f:8a70:38e0 with SMTP id
 o13-20020a0dcc0d000000b0031f8a7038e0mr3911974ywd.347.1659114581394; Fri, 29
 Jul 2022 10:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220712141804.99494-1-jaykhandkar2002@gmail.com>
In-Reply-To: <20220712141804.99494-1-jaykhandkar2002@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 18:09:01 +0100
Message-ID: <CAFEAcA_sBoNCvUEaTOC26Om5vZKeZvLLJS1edkPM-pbswzQvzA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: Handle software disabling of APIC correctly
To: Jay Khandkar <jaykhandkar2002@gmail.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 12 Jul 2022 at 19:38, Jay Khandkar <jaykhandkar2002@gmail.com> wrote:
>
> When the local APIC is in a software disabled state, all local interrupt
> sources must be masked and all attempts to unmask them should be
> ignored. Currently, we don't do either. Fix this by handling it
> correctly in apic_mem_write().
>
> Signed-off-by: Jay Khandkar <jaykhandkar2002@gmail.com>
> ---
>  hw/intc/apic.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index 3df11c34d6..493c70af62 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -792,9 +792,16 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
>          s->dest_mode = val >> 28;
>          break;
>      case 0x0f:
> -        s->spurious_vec = val & 0x1ff;
> -        apic_update_irq(s);
> -        break;
> +        {
> +            s->spurious_vec = val & 0x1ff;
> +            if (!(val & APIC_SPURIO_ENABLED)) {
> +                for (int i = 0; i < APIC_LVT_NB; i++) {
> +                    s->lvt[i] |= APIC_LVT_MASKED;
> +                }
> +            }
> +            apic_update_irq(s);
> +            break;
> +        }

What are the braces for here ? There's no local variable declaration...

thanks
-- PMM

