Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D2C6F0450
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:42:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prz4G-0001dG-RK; Thu, 27 Apr 2023 06:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prz4E-0001co-J5
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:41:38 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prz4D-0001i0-4O
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:41:38 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-959a3e2dc72so960664466b.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 03:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682592095; x=1685184095;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=grrzcLL0s4Me834Tm5kEyRsQ5PnTpZ5NRF2Ib7f0kG8=;
 b=nNwrpo4lEf5/CsMXoRiKVjTFs8jQS1eEM5KTFVWLirHymGb8H8oaOHOab2SvXz2Q4q
 E2gjRLZLl+9ngBZ7q41UFQ3X5pPOdBlRtdG++LlG/RLhHtFBXgA92Ukoi62SzffKeOXx
 Xt8zwbHn4GZrKGfkjJBSSO52GntU3yf4a/q5Bf7dSGXHh3PFWM+/L5A9HC3rpd2SNkM/
 cV3hvT+UcJfQPkfe7BQDyIk0G65k+rJjfLqovjm+Srw7Iv3KSQdGbjmUF5Ktmu46F7U9
 eYlDAA7pCwjkmF7i1EBbeify3j/VlDhjEOOrfOU8qaysabQ40/iXPwKcm4No0MwRvcuw
 yUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682592095; x=1685184095;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=grrzcLL0s4Me834Tm5kEyRsQ5PnTpZ5NRF2Ib7f0kG8=;
 b=MGkJplHQgTsoz0Iu2DbJr0V2Bd4zz+rdbuP1U3EV6YldZBMzzKOfjgQmOpWOMblLaT
 u2efyNnoQDHNAaWYd+G/FTXJY1yzto4EqusjeP2lG+bz0ZcHuBVuey/9MtqPIgrQ3Z9/
 SfyQrdIbSM0GzWXiQQET+NQEM73QImYKfgUY64h3tACeAsWGXDtf+qDnMew2xFUtiQyz
 hY8C2k4Wzf8XnALVoQ1x+EYK+n8nM5Uy2k0Oha3nLjPushaezgZ2gqBJLQHzW3Umnf1n
 KHeJRuwXA43+48KsMsgEwfdQ2ZghiQ07/hZGn/nLOWo3sLPA9Sh2X2p69PbY0FvMV6MP
 Q7Xg==
X-Gm-Message-State: AC+VfDzmZ/+k9QMZ2qwkkvL1pqlWkDQ0PsvG0DBRjFJAPIy8zH3XuEgL
 BK6bDf0ULUfHXUsIENz/ZFCN/fBGLu2Upyibw4RgAA==
X-Google-Smtp-Source: ACHHUZ7TgdEtXV6Fr8cf4sTyyERfTAJ8cqvjc2WspX1uHq9m2tNO+OIZbLIZuwdsVYRBCvdn71/8VA==
X-Received: by 2002:a17:907:d09:b0:94a:88aa:93b3 with SMTP id
 gn9-20020a1709070d0900b0094a88aa93b3mr1534937ejc.44.1682592095522; 
 Thu, 27 Apr 2023 03:41:35 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a1709060cb200b0094ed72b6552sm9496453ejh.98.2023.04.27.03.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 03:41:35 -0700 (PDT)
Message-ID: <cdb4f524-bcaa-59d5-1935-517acc174836@linaro.org>
Date: Thu, 27 Apr 2023 11:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 12/21] Hexagon (target/hexagon) Short-circuit packet
 predicate writes
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
 <20230426004234.1319401-3-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004234.1319401-3-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x632.google.com
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
> In certain cases, we can avoid the overhead of writing to hex_new_pred_value
> and write directly to hex_pred.  We consider predicate reads/writes when
> computing ctx->need_commit.  The get_result_pred() function uses this
> field to decide between hex_new_pred_value and hex_pred.  Then, we can
> early-exit from gen_pred_writes.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.h    |  1 +
>   target/hexagon/genptr.c    | 15 ++++++++++++---
>   target/hexagon/translate.c | 14 +++++++++++---
>   3 files changed, 24 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

