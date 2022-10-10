Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AEC5FA11A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:25:55 +0200 (CEST)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohufC-0006Ka-7D
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohub3-00007b-HE
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:21:38 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohuay-0005WH-Vl
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:21:37 -0400
Received: by mail-pg1-x532.google.com with SMTP id e129so10513901pgc.9
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 08:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6bXOH07GaXnWnmlL4GNt5ToU6yHuD9S9KD3ZEub/Kxw=;
 b=yEXsUJQ0sq53PkNdqT4yw/WVyGQ4wOUKsMV572SsT4co7COx0ZWt/7W5CHv98wMdKe
 wm8ugbverMsC9cGneWF/Wn5d7y/kTPJoNIxFXYVFJu1WNnnfMr52JxRANaME9kpYj8Ib
 PNEYZ7nuXbKz1PrpCB5fSYqWbaeBeaSQ7SBkdpm7SjNE5VxPqB/xk8MFdIEIrB7NiZxc
 nM3weci+++MK8zW+8oPU1WRdn9+ya+cIZaplQe7uA+LzgtEM2XiLxzJ9xXNassnYExup
 NBeBeDuhqwLx2HMoSjx2EqqEFZ4Xwk7GRhAzJmhh8sVZN3X5Ei0yO4e20VWY9JckdzVa
 BfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6bXOH07GaXnWnmlL4GNt5ToU6yHuD9S9KD3ZEub/Kxw=;
 b=rGO8W+UEicIBY7wJP3bLmyC+ZrK9VvRwZ193EqTxClRvZ0FQPDlS+kBujLA8Q3wwxX
 2itiRsYRh1wT9eXAxWmidn0b4gTBuh8Oulke6UTsfrKn5kJlI9k7AP1FzuwBRY7x8Wrm
 6FRvUJq8DBfADhVimVyv5ZWr55B1nNK3rghN3N6CMS3NT2WvgM9+ivpYNrOBmetWiqBN
 kUcVzpBgcdv6OOgYO2wraz2qkxUjWNZ8r9zrNpLbhc5S0XDxU7wM0eYeyO5jfq21R7Q+
 iLnRA6wGD0QxgqxvJWE8b+yfadsQYEQNzZzluRNqGUV8DVwZ8c37GeW+5rnjujpqrYtP
 Z2MA==
X-Gm-Message-State: ACrzQf2VKnnbB1nof9osCgHpUm3031/6Ee67H53V39nyhqjZES4VOsQ8
 ZhsLRYBkNSRGYgZFTpqRQpY1MA==
X-Google-Smtp-Source: AMsMyM4QFZiKCSMVAq6LmoC0dnFBh9taLuyCgqgqPrGBzWDX0VjvhIwfH6nKMdEVquy4agkjramhyg==
X-Received: by 2002:a05:6a00:1349:b0:563:654d:ce3f with SMTP id
 k9-20020a056a00134900b00563654dce3fmr5639871pfu.32.1665415291395; 
 Mon, 10 Oct 2022 08:21:31 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a17090300cc00b0017dd8c8009esm6786620plc.4.2022.10.10.08.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 08:21:30 -0700 (PDT)
Message-ID: <9f13a4c6-c705-2c48-b596-2ed632ec8ed3@linaro.org>
Date: Mon, 10 Oct 2022 08:21:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RISU PATCH 4/5] loongarch: Add risufile with loongarch
 instructions
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220917074317.1410274-1-gaosong@loongson.cn>
 <20220917074317.1410274-5-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220917074317.1410274-5-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/17/22 00:43, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   loongarch64.risu | 573 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 573 insertions(+)
>   create mode 100644 loongarch64.risu

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

