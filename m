Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523FA35A3ED
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:47:21 +0200 (CEST)
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuHw-0007qH-EF
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUuDF-0004mm-Ck
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:42:29 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUuDD-0004YS-JY
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:42:28 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so6727327pjb.0
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o8xwl52n9jX1KXm6zj2CTuQRL2lSZ8jMJykYgxPN5zo=;
 b=CdLLnvqGFpgts511FNOuDSDYyF0WEo6a0s0dTiU1ImXMDBRK3N0NVVXw/BkvDh93MX
 3p/aoFK4Bxxm+Ox3VrxZ71m6TRwiNbk5zftqxmCEgZaw5nYsPbAnnhjcImoLZBDsW/ii
 MAo184w80TBH6ecsDLRrYBNRkhRITX+HooiKufX6n6sh8GEt4PiYyGaiU4I3Gf4jwVzV
 WI2QZC8kToD66GMRAACOAqnYfZpfxizGvFtRr3f7ke2t7MOp2j/K7qtelZg6tTFQDVr+
 C2/dknpA7b/i8fWfRT0OzNzjDpDvqgk/859xufTyajljOG9ewHo7ZEN9vdyuCLTqX/Sq
 byJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o8xwl52n9jX1KXm6zj2CTuQRL2lSZ8jMJykYgxPN5zo=;
 b=nXGxrEHG3Ib59x7AOQjNmBDVI3wqSt8w6QEyCjXqo/fPCbcafD/KyHNmSQ0xwOkl8v
 mzWA7j8Dhz2xUhSBuZnkIMJ9b75QuEI351D1d52aouB03/kujX+9FDn4qktoUFDQLwNb
 91+PkdU35TkLZvaJs1SJvTBhlY8BPccGurB1n2hQBYNsoIKTHaBrOuWvHnhoH+d8ppDg
 7pz47DrghVqTDjtFm0va7pBI7iTQ8ErR5Jjen9vuOYQ12NkWLFaOCzcB90gWpOwjyzAR
 K6bPIO3VUiqUAYbOCJ4PMeAEyLojbCqUXdy/DIUuzgq29IZ7+9B31asd1phxglFkSYes
 WqLQ==
X-Gm-Message-State: AOAM532kOtzRVyifheR2Txxetkc08pmtNvMwRLpOuohPvTVD9tcR2XAj
 mQYbLayha7e8j+NetVVUq7nkJA==
X-Google-Smtp-Source: ABdhPJzTuGBh1I+3FIQMtkl2jlZewsbOiJ15m/qIe2KOZRbONZfR1sKxaPMYphhUqmtlmkX7liqcug==
X-Received: by 2002:a17:902:d2c7:b029:e6:dd9e:d652 with SMTP id
 n7-20020a170902d2c7b02900e6dd9ed652mr14122683plc.1.1617986546044; 
 Fri, 09 Apr 2021 09:42:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g3sm2703787pfi.31.2021.04.09.09.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:42:25 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 v2 5/6] target/mips/cp0_timer: Use new
 clock_ns_to_ticks()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210409093623.2402750-1-f4bug@amsat.org>
 <20210409093623.2402750-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc8cc294-17fc-de56-f534-82a9dab61e78@linaro.org>
Date: Fri, 9 Apr 2021 09:42:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210409093623.2402750-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>, Hao Wu <wuhaotsh@google.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 2:36 AM, Philippe Mathieu-Daudé wrote:
> -static uint32_t ns_to_count(CPUMIPSState *env, uint64_t ns)
> +static uint32_t tick_to_count(MIPSCPU *cpu, uint64_t ticks)
>   {
> -    return ns / env->cp0_count_ns;
> +    return ticks / cpu->cp0_count_rate;
>   }

I'm not clear on the difference between ticks and counts, and this change looks 
suspicious in terms of units.  Hasn't cp0_count_rate been used to initialize 
the clock in the first place?  And if so, why didn't clock_ns_to_ticks do the 
entire job?


r~

