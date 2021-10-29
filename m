Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C5C44001D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:14:42 +0200 (CEST)
Received: from localhost ([::1]:56358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUWf-0002eI-7j
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUPE-0002xf-Ht
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:07:01 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUPA-00041U-48
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:06:58 -0400
Received: by mail-pl1-x62f.google.com with SMTP id l13so2100592pls.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7ns362gp5sK83spmRPbeiyp8Oz8WXfk9dJsN9mwgWH8=;
 b=CI7iOi7c/GUDVt5f3UefO0Ivh7Tb49a0X35CeuX5ZoOloiGsFSZnF7PMQ531gTaOEC
 0wQvMmtU6+ly6Jk8is5SSorlwhhcE4xlGVuyRqtayh47chaPq/G6Cn0K1hmLBrno5I2Y
 FVIXoFfAxsexeU7B+knjz0HmEEhnmOmsw7E18GXJm3U6dbV2RQQQqFoPgRV0L//so0Ws
 SPxsl4PPC5+mhQxQ3gkM7X81r6KV94pIdKFQpT3Z8CkyyhwPg016CqH4UxLP/OPtZ0MG
 nPYZyQZBZbqVsRkKZ5TrPBAuTYBbKW/oxW8UbusKGt8OWYshlARSPzm7agHNKpIIxkNB
 3m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ns362gp5sK83spmRPbeiyp8Oz8WXfk9dJsN9mwgWH8=;
 b=DyHJsH/TX428ZYHfsJNK61QkM08ekEDVCcK3cZqUjCB/k33U3jFKjtCU0ljLwrpZGB
 gFLc6EilQXWsTfVk7a/h0f7TaijWM7m4YbqQEW+TJW2g9vUuRo93lYLliYnLJoqBZ33m
 OPSBUdDTD4uwwA6T3x1498Z/nmEIgZpuVd08OX4Lrkq7FEMNCRzkN9IL39hA/AiOZAK5
 GCeIXU+0Ijy6gux+0AohqC6ajTKjYMdATh3HdjJEiL2eBxh0us8+qMZFXTo7g25/+n/5
 sO+3FjV1TwyQwh0RxOZHCdinF5LbwlSUuvIUkfQKwZ7kbhjy+ZifnDt79q+8VD+er53R
 9JwA==
X-Gm-Message-State: AOAM5310PhEhvTkIcEpWNVhALP53bfmEy/0J0IzFx+Qo9l1Cor9ZsSQ8
 vIRzFGz3efc6jZfZmyZ14+3Iqg==
X-Google-Smtp-Source: ABdhPJz2Fa6StlsW66F/fXHXQaE+4LbNrSQrGLzrQyTYwoRDYH8guiNWIar0E3nXHC0rI0fINWxFMg==
X-Received: by 2002:a17:902:e789:b0:140:801:1262 with SMTP id
 cp9-20020a170902e78900b0014008011262mr10606102plb.42.1635523614167; 
 Fri, 29 Oct 2021 09:06:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id ml14sm2663781pjb.43.2021.10.29.09.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:06:53 -0700 (PDT)
Subject: Re: [PATCH 13/24] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
To: Warner Losh <imp@bsdimp.com>
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-14-imp@bsdimp.com>
 <a7bd5ecc-8949-c7ae-6af7-9494eace94e0@linaro.org>
 <CANCZdfqmiH0V+TLzNY0tL4_DHUXkYLJwOn-UtNvHdjrZcWarBA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <509097c0-54ce-0a67-229c-83467ddc2a6a@linaro.org>
Date: Fri, 29 Oct 2021 09:06:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfqmiH0V+TLzNY0tL4_DHUXkYLJwOn-UtNvHdjrZcWarBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Klye Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 12:45 PM, Warner Losh wrote:
>     (2) Changes to CPSR cannot be made manually; you need cpsr_write.
> 
> 
> So would
> 
> +        cpsr_write(env, cpsr_read(env) | CPSR_T, CPSR_T, CPSRWriteByInstr);
> 
> cover what's needed here?

You can use

     cpsr_write(env, CPSR_T, CPSR_T, CPSRWriteByInstr);

because the mask takes care of not changing other bits.


r~

