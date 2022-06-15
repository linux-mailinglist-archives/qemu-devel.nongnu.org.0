Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF3454CD25
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:35:16 +0200 (CEST)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1V35-0004IB-RK
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1Uou-0004Gq-HM
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:20:37 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1Uos-0002Z0-LW
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:20:35 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so2447390pjm.2
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 08:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1TbFjqHeCd31K0OhPUi4BDxNSTxhzN5U4uVRKRco19A=;
 b=GkGe2FJXTOdPHOk9CcFMUBgRnqg5J73fYrcNuzIkdEl6SO+47G4QAqL6mcePL+P4W+
 qRCBhr+5GepX6qUNGGfOu/lT9MmveD8SWzzG2YJLmcaXdSIqB+hlMTIfoUiFAAq74puC
 E1tTEy3BT46lfLODIy0JoMME9uzyaPvc0uNx2Vgrie1uMfEYzpVgPSybML7GRf9Zklmn
 Cb6VsgNfoAIVAXO0SHWqAujTEg2LoIgriIxatxsEAvgF6K6LMUjj9p7DtygmT4BMrr3C
 T0hV+iOqdBfqeUCG4K5j3Ba2FLcpHWp4EM1lW6+aPe85XmZ49NCThogpU+rlleaBuL0b
 nC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1TbFjqHeCd31K0OhPUi4BDxNSTxhzN5U4uVRKRco19A=;
 b=00L/C5zU+4+86dUP1RLpkrJAPQYArMPllsesEUZd9UBEO0qGCxhzD69zdz+A10dWcw
 nJVOrjd2Bq0Wc6C2WOljZf/oIH5hJxUFxk9lTe8JJORPM3eW3WZCUw5ssO1XXbh8mmyk
 6HhXKmXWCty/6p2BjO5kkjSludCvaeIv83gR7efq6j/3CLm5kRSKN+s0c8o9hh9OSDfm
 l5I+jE0AqOttfiMcyGNXmUI3WvUv4ROuOumYWXUzkg7M1kSHIRw/6MXcU4WI7uH8pNHu
 h0Zi0VSyf0tAVDQCleaE8M2AE2DI7LaXYLg8IgJMrJhqZM/riLjlISFSriGtW8+hMhW3
 BuNw==
X-Gm-Message-State: AJIora+MW2TPb0Jlv0aoCf9VMsp8rTJ8W9sJWAgUqGzqPfCseMvDwWjY
 vTWkfdHEfJ/su9SA8XNIE1rrxg==
X-Google-Smtp-Source: AGRyM1tcJt3q7wON9UPgK6uEAloUH3gePPxnyXkGyljushch2pJNHAM52qsaELxnrPUJmWR3yCXTGA==
X-Received: by 2002:a17:902:eac5:b0:167:54f6:a110 with SMTP id
 p5-20020a170902eac500b0016754f6a110mr9743645pld.127.1655306433286; 
 Wed, 15 Jun 2022 08:20:33 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a62f84f000000b0051ba97b788bsm4392185pfm.27.2022.06.15.08.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 08:20:32 -0700 (PDT)
Message-ID: <80d5fa6e-ce69-f414-9261-f3271a189f87@linaro.org>
Date: Wed, 15 Jun 2022 08:20:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] MAINTAINERS: Add softmmu/runstate.c to "Main loop"
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-trivial@nongnu.org
References: <20220615122338.340426-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220615122338.340426-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/15/22 05:23, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4cf6174f9f..4c921c07db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2745,6 +2745,7 @@ F: softmmu/cpu-throttle.c
>   F: softmmu/cpu-timers.c
>   F: softmmu/icount.c
>   F: softmmu/runstate-action.c
> +F: softmmu/runstate.c
>   F: qapi/run-state.json
>   
>   Read, Copy, Update (RCU)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

