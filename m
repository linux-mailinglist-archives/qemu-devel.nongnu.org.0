Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F25C6F04AF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:04:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przQD-000250-55; Thu, 27 Apr 2023 07:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przPr-0001ty-9c
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:04:00 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przPp-0006bU-Mr
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:03:59 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-95369921f8eso1352726866b.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682593433; x=1685185433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V14gViqL7W8hYdUabsQJAXePdOjpxxWEZZPDNq3mm1g=;
 b=R9jeDZGRx1EI1H4kXUzc0T0tsrzTPMyhtikO/FAq5PUc9kW7CWkI/V3IsWgg3QOGeS
 ytNC11YAuL3UpMyIXUchQkGQMq28iE/RzIN3YUhHsv0k/CCzCpm5UjGzIFf15oVDneJK
 rhCrXigXx3KdQxy3RkuUMbOIiBVmzm3yptk+Xc5GTIB7FFvLZhQ69uET2EtV1UJS6aoY
 ERWnWt/28+sZKubdyFoWVjn1UmBvgCQshakdNvuMgsrasC6AehHwkNlrP9R4L2y6nU2G
 UUPZrElRIL/PNrg6w0PYH3b8I4H4JiL1ThrWENRqtp57tTVHlybswv03COYqtyV11zOa
 rqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682593433; x=1685185433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V14gViqL7W8hYdUabsQJAXePdOjpxxWEZZPDNq3mm1g=;
 b=agyJnm/CaaBGZ8JSvjGHxEkunYm22yPs9nXuhOhEUB7V2nVbHkFYMVfBE86q9975cS
 yPn8+EMuANr0pIrBkDFYHoNc8FgAz/5W9tbQnPB7lIk3PxQ6xwytSYRv26ELhhhjfaOA
 dbK0/McfHsfvNJqmtKfX7eZDQq2C/1jOeiG340wxnDs8ob58ix/ujojTA5Q/Tc+sWOPA
 +6TjC2XEtXPen9FdAsZaQlmVtX5MnAa7Gc53IwSBt5bwFekHthDljm8C/mb3lDXQ8j1/
 KpH90J5xk1FJPKfuJcW6RteXJpxjwtXCJSH7DyWkZLfymmRo/bJqEHGdEyuNWHXdEQiO
 CnGw==
X-Gm-Message-State: AC+VfDxhRW4by6H74vdG4t1Gfsli10//8R4xCahWV//4UbcY2XnSFQVY
 Je0WfnzctPUpX1gMQthNlC48Ig==
X-Google-Smtp-Source: ACHHUZ5+T+Jqr1GdZwF6UmH6uXJakPtIZSzoU7cPDqtq9RFoVxmSYgz7z7pi90xSDliqv4SvEXj74g==
X-Received: by 2002:a17:906:dac2:b0:94a:9ae2:1642 with SMTP id
 xi2-20020a170906dac200b0094a9ae21642mr1007578ejb.46.1682593433603; 
 Thu, 27 Apr 2023 04:03:53 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 lu14-20020a170906face00b0094f4e914f67sm9371946ejb.66.2023.04.27.04.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 04:03:53 -0700 (PDT)
Message-ID: <a779d222-07b4-76e6-2fda-aa3b68683506@linaro.org>
Date: Thu, 27 Apr 2023 12:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 18/21] Hexagon (target/hexagon) Move new_pred_value to
 DisasContext
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
 <20230426004234.1319401-9-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004234.1319401-9-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/26/23 01:42, Taylor Simpson wrote:
> The new_pred_value array in the CPUHexagonState is only used for
> bookkeeping within the translation of a packet.  With recent changes
> that eliminate the need to free TCGv variables, these make more sense
> to be transient and kept in DisasContext.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.h                        |  1 -
>   target/hexagon/gen_tcg.h                    | 12 ++++++------
>   target/hexagon/translate.h                  |  2 +-
>   target/hexagon/genptr.c                     | 10 +++++++---
>   target/hexagon/idef-parser/parser-helpers.c |  2 +-
>   target/hexagon/op_helper.c                  |  2 +-
>   target/hexagon/translate.c                  | 16 ++++++----------
>   target/hexagon/gen_tcg_funcs.py             |  2 +-
>   8 files changed, 23 insertions(+), 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

