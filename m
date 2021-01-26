Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB7A3036ED
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 07:58:53 +0100 (CET)
Received: from localhost ([::1]:50236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4IJP-0006Uw-SL
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 01:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4IGr-0004xp-7W; Tue, 26 Jan 2021 01:56:13 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4IGp-0003N2-IW; Tue, 26 Jan 2021 01:56:12 -0500
Received: by mail-ej1-x62a.google.com with SMTP id r12so21455565ejb.9;
 Mon, 25 Jan 2021 22:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=32aGueFSV2uVi9yEC9Wg3aow+A/sRmFRH4xj/YR6gpA=;
 b=GVN7V7DrjgwXM4VzwvVuI+INA8c/TpTy8XP3jd+5je+AwKZgaW/wEqRY0GqprihO+k
 0asLviPRdMjGGe+TdgblyCx9rDbsbOnbRDJNq8s10XDRu59tG+CE+OR4/0HUUtY+KL2U
 RVVPpuBpdht+ISkeapnzfOgbcR1lKXZH6dWAWvh0D8DhXS4n5TlxPzUDw44KD53DBsmg
 xKD0tdVSagY+YzqGSJAYH2UAOFl6xJrV2/Rj3pgDXxbdFJUs1ZtE08+MZwhlHIX+RnnJ
 elKWTEQ9VrjH84NqCjVH1RkJoxKOyT0qinqXdRJ7CuhhW9HAk+wrp/2kE58jTK8x7uby
 u+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=32aGueFSV2uVi9yEC9Wg3aow+A/sRmFRH4xj/YR6gpA=;
 b=QfgL+ZfbBh0lZf61VUrWMdNa1zB1v+xwqCBpqYnO5mjt4qx3o9+WYN8M2ri0ZCbYAV
 QeRHxgJ92mFZX32H3V4f9CcOQ96YQt2VrKBm8HHnogzMBrU6O2JBzUx1tPzmOAlewUcJ
 SwzN/JVKRU5v+I3I5Fw6MbMRIeYb6EZ+W9RKy9Seuv2SABmyMpj8opqevVxnPoTWbSjN
 LALKenJFq0Z4VHA1hziYWaESYK1KPtvXI3JeThLzmrJc5AzHDbY/9doEyMIVzTsfQdRU
 C9AhjOF/v7OyjprQhlX8Q8lMeRUN8kzKS62PfCOSvV6+3qoh+2Ev9UgZmu/KIii6DAG2
 GnZg==
X-Gm-Message-State: AOAM531rtqUidPkJ995pJocEeSEcNFHYfEa8HGKur6v+UENGhjUDqCGD
 GewyZ/0DBJM7HWYc27/IhAk=
X-Google-Smtp-Source: ABdhPJzU0/TLsKEkB+nlv/JMFOmqA3kRrgoCEZvWTViPOMBbAwJUWK2GStxJzBkLSJb0VQmNSh5xVA==
X-Received: by 2002:a17:906:f0c3:: with SMTP id
 dk3mr2529601ejb.540.1611644168883; 
 Mon, 25 Jan 2021 22:56:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y59sm12447442ede.59.2021.01.25.22.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 22:56:08 -0800 (PST)
Subject: Re: [PATCH] hw/misc: Fix arith overflow in NPCM7XX PWM module
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
References: <20210125234836.607233-1-wuhaotsh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <52a16c14-820b-762c-d74f-e29fac912beb@amsat.org>
Date: Tue, 26 Jan 2021 07:56:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125234836.607233-1-wuhaotsh@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 hskinnemoen@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Hao Wu,

On 1/26/21 12:48 AM, wuhaotsh--- via wrote:
> There's a potential arith overflow in npcm7xx_pwm_calculate_duty.

> This patch fixes it.

  ^ not very useful information ;)

What about the simplest approach Peter suggested, a 32-bit duty?

> Thanks Peter for finding this out.

Technically Coverity found this out.
Using QEMU git tags, this is:

Fixes: CID 1442342
Suggested-by: Peter Maydell <peter.maydell@linaro.org>

> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/misc/npcm7xx_pwm.c          | 4 ++--
>  tests/qtest/npcm7xx_pwm-test.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/misc/npcm7xx_pwm.c b/hw/misc/npcm7xx_pwm.c
> index e99e3cc7ef..90b4f630a0 100644
> --- a/hw/misc/npcm7xx_pwm.c
> +++ b/hw/misc/npcm7xx_pwm.c
> @@ -102,9 +102,9 @@ static uint32_t npcm7xx_pwm_calculate_duty(NPCM7xxPWM *p)
>          if (p->cnr == 0) {
>              duty = 0;
>          } else if (p->cmr >= p->cnr) {
> -            duty = NPCM7XX_PWM_MAX_DUTY;
> +            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY;
>          } else {
> -            duty = NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
> +            duty = (uint64_t)NPCM7XX_PWM_MAX_DUTY * (p->cmr + 1) / (p->cnr + 1);
>          }
>      } else {
>          duty = 0;
> diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
> index 63557d2c06..f55571b31d 100644
> --- a/tests/qtest/npcm7xx_pwm-test.c
> +++ b/tests/qtest/npcm7xx_pwm-test.c
> @@ -280,7 +280,7 @@ static uint64_t pwm_compute_duty(uint32_t cnr, uint32_t cmr, bool inverted)
>      } else if (cmr >= cnr) {
>          duty = MAX_DUTY;
>      } else {
> -        duty = MAX_DUTY * (cmr + 1) / (cnr + 1);
> +        duty = (uint64_t)MAX_DUTY * (cmr + 1) / (cnr + 1);
>      }
>  
>      if (inverted) {
> 


