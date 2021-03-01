Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857CC3276B0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 05:31:25 +0100 (CET)
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGaDL-0003Oa-TY
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 23:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaBw-0002cP-Jb
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:29:56 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaBu-0007vo-RP
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:29:56 -0500
Received: by mail-pl1-x630.google.com with SMTP id z11so1385805plg.10
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 20:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oZGgOL2NJmpqnjyC9g+IxSXO/NnjZwe1AidEpSi7A54=;
 b=FfVxxRZP8joSUjZH9QqpguI0B2bXuto97z0mAyNfQEKReoo9DDu3VJvGEtw2TeblL/
 G+M4RtUrS8DbPkUxL1IHKariDfT79P3N4WZJhOxz8m16E8D8ODXGCftsOpJfUb5lfyJJ
 GaYoZUKPmT1FVAU9qgvc9WyZbR4ggYsEMzyLJ/YC76LGN1P4oDckGoBnhc+u6W5PJlcs
 fscgqtp8axomTeGBxy2VmVQ9WCgpAgOky2+0WyQn1wJaiB8ppiE6AlL+G17VEDr5fvD8
 hSmjMEsMVv0qsNvIGMUgyw0PnLKl01sg6UlR8wzGxfaoozQSl1pCLC5CC3DuO3VlDpKC
 5X1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oZGgOL2NJmpqnjyC9g+IxSXO/NnjZwe1AidEpSi7A54=;
 b=fEQIUQ57RtdSPZF512tbdgKZzjCetdHFM+HuhwVrgycKMrL3C7BPSxQcMKEvYykldM
 RdB5eOBtaiq8j+TTidWvY1gfKRNaEFGIeHMn/tIzbNxsqOZFOqh9c1m09CiWVzBtcevB
 rpQpXzthBIUpv6Sqb9xbP3RYUQHXOspQvXY2U4RyO3eu2qQB0XLHe6Fug3xmK6zs6/pX
 kqURU/G60/BVnBqa4+RWd4JReSnn6tov4HnB+EYjpS9kubSxVS3StTjM64ss/TI4PCwD
 FM/jXyLJLtFHi57NqnRsYy7iz8eUAc0+a8B9WyuOlXHF5YwIrxOqRauZHmr6iKjmecHY
 0Gzw==
X-Gm-Message-State: AOAM533mI+6IpIDzHYya7hcf3p3gExA42Cm8dIH4JJ1M0c16GG53ZsKd
 iUOHxyYHm/grT08iiDZEBq/AXQ==
X-Google-Smtp-Source: ABdhPJx0Um/oKeYp6//r+8SfhR9FTNFNAcnUiuMzOKbF2tAjA4LK+s38nnu77YmDNlHncs5wpF0rRA==
X-Received: by 2002:a17:90b:34c:: with SMTP id
 fh12mr15070894pjb.61.1614572993226; 
 Sun, 28 Feb 2021 20:29:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o65sm14318459pfg.44.2021.02.28.20.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:29:52 -0800 (PST)
Subject: Re: [PATCH v2 14/24] hw/arm/mps2-tz: Size the uart-irq-orgate based
 on the number of UARTs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9f2bb5e-0929-60cb-0de0-e6c24040eb9d@linaro.org>
Date: Sun, 28 Feb 2021 20:29:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> We create an OR gate to wire together the overflow IRQs for all the
> UARTs on the board; this has to have twice the number of inputs as
> there are UARTs, since each UART feeds it a TX overflow and an RX
> overflow interrupt line.  Replace the hardcoded '10' with a
> calculation based on the size of the uart[] array in the
> MPS2TZMachineState.  (We rely on OR gate inputs that are never wired
> up or asserted being treated as always-zero.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


