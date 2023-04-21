Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8036EB3F1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 23:53:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppyhM-0006Tl-TU; Fri, 21 Apr 2023 17:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyhK-0006Rn-Sk
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:53:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyhI-0006D2-K9
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:53:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3003b97fa12so1392565f8f.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 14:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114018; x=1684706018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RmbHQN5yrjMZfZaZ+mqZZy0mWnwUmWYK29MXvrZx2G0=;
 b=UyzbopYXcMrpVYO7KEYpo1v8OtTD9T3aUSe0CwzQ7Q/daCIxkzrWCv+mH3DFwa9R+x
 76hJiSL0ndOOy5N320nbfYtWCnK1VbtWdFo9y0JdrshpOW1wGVXSO6evckg83+TpP7nl
 HH5PA1OaYuQfSXWO4O9jx8jPD5urCpRoyDjodfK3d/OM4bSqjEo4uMVV0Ei8zg0v2Txc
 Hc6fe76JQsP78wd2FqPGLwEFbzADc7Wo02lSH7M/ay3bgYdExqPV0xwlojZwUnOKi5tO
 8J5bkyfQTSBir6xIeA9K/oZYnXNy9W0nusn4lyIP76eePO5cCM8lWVkpa7i0q2ZLDj69
 H1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114018; x=1684706018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RmbHQN5yrjMZfZaZ+mqZZy0mWnwUmWYK29MXvrZx2G0=;
 b=D298lE1njxXUsOExSbk+8KUVA8Ek+y+b8hWjpafEHIvFebX6ZWZ2ZOZvnek9f3XA6Y
 tqA5gzEzHrUfi9bv2KnBvUEVKrFJj1iyAfm+wEQjrGEhwQVCNdX18Lc2FSKvTHLY1Enz
 8pfUseV2DfUf9gNtFFYUDOiFjechKaQve8earkptkRuDE+Y9APTzpgk/skalakXIb0j6
 F9KfH1zbPb1AE9496dnja35/f7GKcEjFbgnBeuVb7WRG99pjVVCWm3VDD8VfaWFriY+a
 jVdbi3lIHQBAZZ7E0mdb1uuUe9FUL6Y03laNpsdC5jB/CIArkPTwvVKTt1ihzIwio1Uv
 0m/A==
X-Gm-Message-State: AAQBX9fMWSU6NpoYY0co2MRhZF1RBqHoUnfZNEBWek7Bg7FQlCYswIpi
 OXgNpWXpPCK/liBN71g6tcbYpQ==
X-Google-Smtp-Source: AKy350YIfuPnati+ycfpkmJEikSoriGaxCVxRW+paze10Vj5YmGicppzbl7ZHbeVCznZEC8uVksN7g==
X-Received: by 2002:adf:f5cc:0:b0:2ff:89d6:3561 with SMTP id
 k12-20020adff5cc000000b002ff89d63561mr4706939wrp.64.1682114018116; 
 Fri, 21 Apr 2023 14:53:38 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 x2-20020a5d60c2000000b002de9a0b0a20sm5198394wrt.113.2023.04.21.14.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 14:53:37 -0700 (PDT)
Message-ID: <43fe915c-9c0f-2ac2-57fc-3206d0920ce5@linaro.org>
Date: Fri, 21 Apr 2023 23:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 05/42] tcg: Split out tcg_out_ext16s
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/4/23 04:42, Richard Henderson wrote:
> We will need a backend interface for performing 16-bit sign-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  7 +++++++
>   tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
>   tcg/arm/tcg-target.c.inc         | 10 ++++------
>   tcg/i386/tcg-target.c.inc        | 16 ++++++++--------
>   tcg/loongarch64/tcg-target.c.inc | 13 +++++--------
>   tcg/mips/tcg-target.c.inc        | 11 ++++++++---
>   tcg/ppc/tcg-target.c.inc         | 12 +++++-------
>   tcg/riscv/tcg-target.c.inc       |  9 +++------
>   tcg/s390x/tcg-target.c.inc       | 12 ++++--------
>   tcg/sparc64/tcg-target.c.inc     |  7 +++++++
>   tcg/tci/tcg-target.c.inc         | 21 ++++++++++++++++++++-
>   11 files changed, 79 insertions(+), 52 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


