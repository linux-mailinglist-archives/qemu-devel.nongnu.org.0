Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD0E5BC468
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 10:37:57 +0200 (CEST)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaCHs-0004rm-7Y
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 04:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaBwk-0004RA-BW
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:16:07 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:45700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oaBwh-0000L8-9Z
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:16:05 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 j17-20020a9d7f11000000b0065a20212349so113709otq.12
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=L5XljwHObe1AZ/+EcSQRlhq+tN5dsgnrq5mYpJ5F5Uc=;
 b=IQodD9Q5mzz83uGRQFL2a24CPjzVcbbw8rJ3bWeS4aE0wwgBWBy8xdltgQqCsElN4M
 myORSmchHVt7UdV8GGI7AwV/K9CzOQyEO+3HT5Yq1/ZFF1nTHpzK2fopJOzJM8T3baBz
 RX3V8713IMz7XYUuW/WKWs73dKkIZZMFsbXCcJsyGyZ+m3mfBRdQtSMVj6nXqA3QmDIj
 HDV4rv9TMQSWYbrzhCbdOPINIjQtD4KQlbdFGLC/yrEeYdZDfOcHBOGzaI5tCIvoGA/1
 ykJbZZUND9pDGC6wqNUYudmyIj0jHMuUlJyPfpQaOme0VbEOhMydKcgJgCGVETFnmymv
 h37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=L5XljwHObe1AZ/+EcSQRlhq+tN5dsgnrq5mYpJ5F5Uc=;
 b=jdfahgEYpsK9+NV/K06957pqiDHOIvJgY3Nkdm5TWKnQxrlrmHV+aCr0+BzeQag89e
 Ud+5WjDpJ4XcWx3uLB0Oz5lMMlOVYXAZzDqmw7lvwEOvspoJ18s+IoU+/sRSg1DdhCDO
 XvX/Mzw08Be4v5S1gNT21aTWAxO/3cJ8cPa5iTM6gvDi2wgFhKxf74x3RuFs2pUrhcPg
 orb3kgfiqdgrzx/XJx/KvNgHiDJMqAe+j2xTqDsJN8IHQBoivIqlGk8wfPWi5/GYkDbp
 HfNrJk0Xt+qmWqwIRji7Z3pnq7KC2mGghF0OZlmyWgFkllrVtG5EB3x/AeZI9IGUZU5z
 dQXA==
X-Gm-Message-State: ACrzQf1C2CZ3soJrMCy2AwZ5VPbG7RZEERSJd/Qr2xJRsZl+xuK9/W24
 0X22uuUmzPBzKB2Q8PTFjnTeKQ==
X-Google-Smtp-Source: AMsMyM6+9NkwENmKbgjoIzT9CgE/2F4Lxh7RLxp3XzbCA9rFpkpyjBMP9bZ61oSqZwZhSTzJ2Lxdfg==
X-Received: by 2002:a9d:7349:0:b0:655:dde2:e905 with SMTP id
 l9-20020a9d7349000000b00655dde2e905mr7593159otk.332.1663575358437; 
 Mon, 19 Sep 2022 01:15:58 -0700 (PDT)
Received: from [192.168.199.227] ([172.58.107.41])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a056830271100b00638ac7ddb77sm13887111otu.10.2022.09.19.01.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 01:15:57 -0700 (PDT)
Message-ID: <056d6f5d-c978-afec-dbc0-e0a12ec0e8c4@linaro.org>
Date: Mon, 19 Sep 2022 10:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] target/m68k: rename M68K_FEATURE_M68000 to
 M68K_FEATURE_M68K
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 lucienmp.qemu@gmail.com, qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-2-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220917112515.83905-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.657,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/17/22 13:25, Mark Cave-Ayland wrote:
> The M68K_FEATURE_M68000 feature is misleading in that its name suggests the feature
> is defined just for Motorola 68000 CPUs, whilst in fact it is defined for all
> Motorola 680X0 CPUs.
> 
> In order to avoid confusion with the other M68K_FEATURE_M680X0 constants which
> define the features available for specific Motorola CPU models, rename
> M68K_FEATURE_M68000 to M68K_FEATURE_M68K and add comments to clarify its usage.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/cpu.c       |   2 +-
>   target/m68k/cpu.h       |   5 +-
>   target/m68k/helper.c    |   2 +-
>   target/m68k/op_helper.c |   2 +-
>   target/m68k/translate.c | 138 ++++++++++++++++++++--------------------
>   5 files changed, 75 insertions(+), 74 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

