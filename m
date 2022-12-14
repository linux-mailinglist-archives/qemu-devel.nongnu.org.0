Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F0164C45E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 08:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MAl-0007SA-Uk; Wed, 14 Dec 2022 02:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5MAh-0007Rn-M1
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:27:19 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5MAg-0006Zg-4R
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:27:19 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 ay8-20020a05600c1e0800b003d0808d2826so2179420wmb.1
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 23:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VzoK6arwqv2kcSLGOD0mXDzLTpqlSGTUsoJG70k049g=;
 b=wGfVFj1x+xGLZg+vk0hp7m/ErANDg46dZZTR6gBATgkY59+tkXWNTXhpexoXduODz2
 dzRIjQz8Q/Hu0R12RzJke9fHozinBxle4+/OxbxazgnxtKKHA15v5Pp2EfcGc5kXXvVt
 ckntOjATb27LDhNdu7d5IN+Vo7xUHeYVN1qQo8Lviq06twXZe6AykuZgIRQUOP8hq3mB
 9hTb2lxeKheoUPbEoOJqYkn4LmGgaHubS67yAgb5118ngQ5HSdDZ9k09/SK7V+mhnqj9
 Yr3y7sHntOGrOecBqctqYJ52uUZOr287WLm3DHTOgD2cnxjNijHi6/PHjRtYZfxZedVC
 uqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VzoK6arwqv2kcSLGOD0mXDzLTpqlSGTUsoJG70k049g=;
 b=bjCrxX+mc419gxAy2K+CJT9HL250F9cUerYKuew/+2vhi4K6v69WB0DcU4T7hNWQk9
 +q3RfR5lMorF3hZdt3GybqWKDtZqecaFz5kNtJ6qIQd7qpijCBOgh+nl8tRFdb9ZvQry
 N2C5PJxFLLyTprTyjn9FE2dULtjVXhZd5bpqXedL5o9vaY5lsldnCvA7sqYR2QT1zgEW
 xzJal2bqYv4xja/sdq99SHHkEn+bqazHa7MoBLk1KGTVn2CoUZWVBiAR/WB8js1o2D4j
 u/KsEMP7RNkoZWRohkj8k4cHO3AGZQtKZxhydvKeNkdCwkOnxgi19/r16PQ6fjzXerFe
 P3dw==
X-Gm-Message-State: ANoB5pkrK28tDyH+vrO9PFZQoJ938Fp5EDFt/0H6xzld30f3mp4+ouV2
 xmZVGjYJPUwOzpdppmlfQkMBXyflxIp1HsZ5
X-Google-Smtp-Source: AA0mqf5QOdamz+2lsRKT8P3HfBlgZX+/UYt/C8TRNijuB5AWAuUtaqPtek3U2RrinqknCzcTAMS0hQ==
X-Received: by 2002:a05:600c:4f89:b0:3cf:d0be:1231 with SMTP id
 n9-20020a05600c4f8900b003cfd0be1231mr21967874wmq.13.1671002835370; 
 Tue, 13 Dec 2022 23:27:15 -0800 (PST)
Received: from [192.168.128.175] (200.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.200]) by smtp.gmail.com with ESMTPSA id
 d22-20020a05600c34d600b003cfa80443a0sm1372117wmq.35.2022.12.13.23.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 23:27:14 -0800 (PST)
Message-ID: <b973baf8-7b13-6cbe-5b9e-00cf2f94d8fe@linaro.org>
Date: Wed, 14 Dec 2022 08:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0] coroutine: Add missing <qemu/atomic.h> include
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20221125175532.48858-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125175532.48858-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Cc'ing Markus

On 25/11/22 18:55, Philippe Mathieu-Daudé wrote:
> qemu_co_mutex_assert_locked() calls qatomic_read(), which
> is declared in <qemu/atomic.h>. This fixes when refactoring:
> 
>    In file included from include/qemu/osdep.h:113,
>                     from ../../util/error-report.c:13:
>    include/qemu/coroutine.h: In function 'qemu_co_mutex_assert_locked':
>    include/qemu/coroutine.h:182:12: error: implicit declaration of function 'qatomic_read' [-Werror=implicit-function-declaration]
>      182 |     assert(qatomic_read(&mutex->locked) &&
>          |            ^~~~~~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/coroutine.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
> index 89650a2d7f..1750c30d8e 100644
> --- a/include/qemu/coroutine.h
> +++ b/include/qemu/coroutine.h
> @@ -17,6 +17,7 @@
>   
>   #include "qemu/queue.h"
>   #include "qemu/timer.h"
> +#include "qemu/atomic.h"
>   
>   /**
>    * Coroutines are a mechanism for stack switching and can be used for


