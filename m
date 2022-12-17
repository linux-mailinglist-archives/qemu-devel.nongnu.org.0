Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC3364F665
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:38:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6LCX-00054S-Uh; Fri, 16 Dec 2022 19:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LCW-00054B-LN
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:37:16 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LCU-00055T-W9
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:37:16 -0500
Received: by mail-pf1-x435.google.com with SMTP id d82so2821726pfd.11
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c/EO7Y8IHjprJ5UK+EbUnh+huTsWLG5h8Kl/G+9GYm0=;
 b=tjmPg8JJg2UvBDRLr3eB7v9aSJ1ixhmsCylrfAZpF05HGeIpYPvzi0h/gG/fKoziPI
 9kU65YqLYU4gkOLAAiYkRCvp9GselywmE1GgobVtVvOuZvuLQWzYhRUuYijp36jW1mjh
 RR2GEgvXn83Mpy7AnDBJhOswlQyJIbjYXFb9APIgmMroFb8b+iHH1WIuxz4jamW5802a
 1t7p1+OBgpiKbup1Idft/NeVsSFMqz87o8ZG2PYZp7VOPlYsARYe/nyEV/8/0dpNnUn4
 cGE4y6or1Wq2jFoL+XlLP/6uzOfq/aewJLWnMPYlPwHfFa8Xuub0IbSE8HA3OshPJJ1R
 RsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c/EO7Y8IHjprJ5UK+EbUnh+huTsWLG5h8Kl/G+9GYm0=;
 b=x/a6etQcVUGMY/8N+UQLwFbTlYP67Kj+jx+l5nVDUc3zDXTYu36BpDf8TtizUgJCrE
 YepgBlfQ+w64qmBpksO6DA0IXwFEaeEjeMWqZ0f5poIwHxebx3yR1FbqGN7dXJqALZfT
 KtgvG1no1B2G6mr/ZWN5PQPYM1FDzZpL8uO+RrcxutqwXQddacwEHBCKtlGOPHmz3c1q
 IbkkXnI3rIFP6BFyEi7QyRe4KUqelxS3PFGCCDjGZ+iyt5xizcYArYkIUM1AZUiJQ+91
 nLAcE9SEOZ53lhge5bX+/tMdt5xKUA6VeOOqzSY1Oh5kXE9/AT1GTiWJUlitQJs0sGH4
 /BBQ==
X-Gm-Message-State: ANoB5pmLiund5Ko8G7Ga1iDw6ZJQ+aVL2nzclTZ9ceXZOtBn19430RRE
 at7i1cfDjV0NHG6oinh9LCIr7Q==
X-Google-Smtp-Source: AA0mqf6n0unR4/iuC61M5wEsQxVXFyqdk99C5rYxWTybfDRi4GChMykNAD9eU0buW4nqpCiEM2ZiVw==
X-Received: by 2002:a62:3342:0:b0:575:ff07:cb1e with SMTP id
 z63-20020a623342000000b00575ff07cb1emr31753752pfz.31.1671237428081; 
 Fri, 16 Dec 2022 16:37:08 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 d62-20020a621d41000000b005625d5ae760sm2128994pfd.11.2022.12.16.16.37.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:37:07 -0800 (PST)
Message-ID: <b98c5217-9d36-0c16-92f6-2fc6ace2016c@linaro.org>
Date: Fri, 16 Dec 2022 16:37:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/10] target/loongarch/cpu: Restrict "memory.h" header to
 sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> Missed in 0093b9a5ee ("target/loongarch: Adjust functions
> and structure to support user-mode") while cleaning commit
> f84a2aacf5 ("target/loongarch: Add LoongArch IOCSR instruction").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/loongarch/cpu.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index c8612f5466..2f17ac6b47 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -12,7 +12,9 @@
>   #include "fpu/softfloat-types.h"
>   #include "hw/registerfields.h"
>   #include "qemu/timer.h"
> +#ifndef CONFIG_USER_ONLY
>   #include "exec/memory.h"
> +#endif
>   #include "cpu-csr.h"
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

