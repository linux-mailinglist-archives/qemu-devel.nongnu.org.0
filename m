Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A8409119
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:57:26 +0200 (CEST)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmSc-0001GA-0l
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmIj-0002pc-3E
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:47:13 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmIh-0007GY-AM
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:47:12 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 lb1-20020a17090b4a4100b001993f863df2so10122pjb.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=92LFO5POSQf2F2QEooW1sdxVY42iNA6P4KggGecRAsg=;
 b=ExaFXlcsiVGgF+/gQ0m4sJx+sfcnffQRR47y1M1NefDnwryvRTstRSP15nsR7dn9nr
 KzQGfVCh486NVcxhFMazLFOfQ5ivmk7O3bn48g7+KWjyPNSwYWiGs9qxlK8ILMmdvogt
 oOURh5IgKAhZetYwy0GShkv5Ga9ElMk6nQSrO7tDSD/V+/Yck0kKViavntoaKlj1NTVE
 gtdmgywfKbp25Xs7rN8AlIQDcF/XQ+pYxl1pR+O4JRMwTjYvnoQ1N3j/utHMImM28SZp
 YR0/gQqB7STQIle9/W9BvvzBRBLi7jg52JMl1GIDEFk9Q4AvCSMYfuqPqkBfqpfeWzM9
 RuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=92LFO5POSQf2F2QEooW1sdxVY42iNA6P4KggGecRAsg=;
 b=SVngKcbTs8fsm307PGGZRvkw/S2I488NQZsJrwegFFegW1jfbv7bZqslo73fF+Vycp
 m6GMyKE5Av/Q5pH3R512P0W1rsQZ4N8D77uwmCTMN5DC2hM5d2fSUTv5i+sUvi+kRmTz
 TdtqcTqyU2gh3phWT3DfmX7Vj8pGbdwy8ZFhsfxolRKbUHtI8je7At2ZCiaLOTQx6hXH
 me7asuproVtrJto475Q+EH+9P/DXU6qByoNlr6wtXNrE4FKn18En5C9WqlPsDwpF4myk
 wEPto3OWspR1luClORPf9VtIzXUTj0R6tgFE8Ihk3NaAFPbQivveN+ezjt+reR3EDYih
 jE4A==
X-Gm-Message-State: AOAM532z4aVnt29FXKI6A4oyqdXR3RvlgmKvfimbAD9LrKXuFAJmohp8
 0Yesm4qU0gbmlEc2v1RVrjsLug==
X-Google-Smtp-Source: ABdhPJw/cViCIjS+ajbmJJm6vuXmeG7L0lX7mRKuP/MkMk0KcZuQPIHcuVe32SyGyeotNyiYmMYKlg==
X-Received: by 2002:a17:902:bb0f:b0:13a:5359:d566 with SMTP id
 im15-20020a170902bb0f00b0013a5359d566mr10501146plb.60.1631540830027; 
 Mon, 13 Sep 2021 06:47:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w142sm4422537pfc.47.2021.09.13.06.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 06:47:09 -0700 (PDT)
Subject: Re: [PATCH v2 08/12] target/arm: Optimize MVE VMVN
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <49fc67db-5913-c41c-df3c-7e94859bf00f@linaro.org>
Date: Mon, 13 Sep 2021 06:47:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 2:54 AM, Peter Maydell wrote:
> Optimize the MVE VMVN insn by using TCG vector ops when possible.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

