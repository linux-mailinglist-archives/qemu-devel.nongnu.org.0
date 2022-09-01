Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06585A93DC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:03:31 +0200 (CEST)
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTh2o-0000L8-KG
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTgNo-0001m6-Ot
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 05:21:08 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTgNk-0000Gy-Hk
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 05:21:08 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso1050293wmq.1
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc; bh=1UcNAB1WqB2Ld3CK6rGIt1kQrMKuJxRQXI/2UN4jR5c=;
 b=srEIfifL97y9/WVo+xKT8vcHgUUxUT8ebBa+aJOgb9BFgoPHR9cNxOyHjPbTK5ywtM
 /OA3yi8Wf8mPd8g9xphxihycyi8SmwumrNtCxYaaz5NY2ZoVqUtYHjcij0k/XqikkTah
 3qwV5KQa3LoZRatUIBHMD8Tb8GqUHdg2I2Krz3FFLgjpxf8SbqJrud94N8Gq/0o8bLdZ
 yWhlRZ5dqXB2zqAd3KbehGmebee81f7f+e9tvwdc/Q0dYeHzwXtAAzGaa5H4Z7WHMZs3
 aU5wZEPxmtM5lPNqYMbViOK+t247RNdXg1FOFTkdTxNu1lbZmXDXmYT9Oh1w3BVH/QEx
 6deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=1UcNAB1WqB2Ld3CK6rGIt1kQrMKuJxRQXI/2UN4jR5c=;
 b=oCgyG90anVFa8WfC5fnFWmaDQZEtA6L6OwMZvoucesLy+uc+gXezLAhf0CodDe2MKb
 EgwzQraZyGIdODhq3m3OApVcBZBkf2h/Ts/iwrWRroKIRZGRA/azh2YQNKSV+CS1Gy2K
 RP1vH7m9rX4svjfjvjkX334JO1ade9Yn59MpOcx3WQ3D+TsUViE1XkCdQysB4EZKiqMy
 WPkGLDaQlyoipmUusBCKOXXNDWwcUarP3IBHr2Kah5ENNeRy8mG97PcD1+ENsbkkDq/O
 kJVecE15j+Q/fF546mlFfcLbCvynpVPlggHUO6XztUMzbh8VEbudAd/prbx+vXz7Kg0b
 kI7w==
X-Gm-Message-State: ACgBeo24ofAB0RuuPZVsWUYr0DOv4NyweIYRazNMBgQyU8UsSSSelmw6
 ErYlXHutYXeFGad5GTCJN32Low==
X-Google-Smtp-Source: AA6agR6yuaIvzk1UGjc5XidAXcAHlo7C7Mn67DRP1MbuEEK3yyxnVIBOrhJDc0yMuNTeMXz/BRJZbA==
X-Received: by 2002:a7b:c8c1:0:b0:3a5:bb57:e7a9 with SMTP id
 f1-20020a7bc8c1000000b003a5bb57e7a9mr4529253wml.18.1662024062642; 
 Thu, 01 Sep 2022 02:21:02 -0700 (PDT)
Received: from [192.168.45.227] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b003a84375d0d1sm5226804wmq.44.2022.09.01.02.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 02:21:02 -0700 (PDT)
Message-ID: <1aa69b8a-2bc1-5a88-5a09-113419066216@linaro.org>
Date: Thu, 1 Sep 2022 10:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/51] semihosting/arm-compat-semi: Avoid using hardcoded
 /tmp
To: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-5-bmeng.cn@gmail.com>
 <CAJ+F1CKj1uoa7pW1m7iRGUUcsqpDYnN2vmkfAn5xi6ogysMrQA@mail.gmail.com>
 <CAEUhbmVX4TtkWSm=9n_6+TP59GPszASAR6j1FVpt9dg6LxapSw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAEUhbmVX4TtkWSm=9n_6+TP59GPszASAR6j1FVpt9dg6LxapSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/1/22 08:11, Bin Meng wrote:
>>> -        len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
>>> +        len = asprintf(&s, "%s/qemu-%x%02x", g_get_tmp_dir(),
>>> +                       getpid(), (int)arg1 & 0xff);
>>
>>
>> This is most likely wrong. I am not familiar with semihosting, but I believe we are implementing tmpnam(), it should return a POSIX filename.
> 
> Replacing /tmp with g_get_tmp_dir() is not wrong, correct?

The replacement is correct.


r~

