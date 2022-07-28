Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D55844BE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 19:18:01 +0200 (CEST)
Received: from localhost ([::1]:44768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH796-0003JE-4x
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 13:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH75J-0000p9-Qi
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 13:14:05 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH75I-0003Un-6Z
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 13:14:05 -0400
Received: by mail-pg1-x532.google.com with SMTP id 6so1996520pgb.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PxIj9x3Qj7wGGq+L6hnxjPePcB3g34I/8eBsjBNut6s=;
 b=cccJCNlPM1Rm9taTXadWt95MWMNMdDdUvioowcAuxYW4cQ0Iehm29e2A8+XMLlnYYD
 On1WFTgHk1mznGgYr0WaAZpG9MZiSbVimID9rSgtY66D9Q7k4ukY3QGq8WnZHT15ytcS
 ECD/PD/5EogZyFXTpECa+T5WP54VP7tunlkACUq39KvarnyUjKhtk8xPLdm5ntykJ+Fa
 F57xkv2ksiwZElFZV/5HbSFRJO4JUJNxy1g812QD+Mk909ojEN2Wg/JQhniD9Yd39e5j
 8qvMEDxYDQ+ZJ+xMmI2JqjLlfiYa0GCdr11o/Z44xoMr6AtycZ7wMKqGG3BoCUr0LeBF
 BI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PxIj9x3Qj7wGGq+L6hnxjPePcB3g34I/8eBsjBNut6s=;
 b=cqbKBExU3S370dWyHn+f7vr0TOGeJILv/n3R0LvM9Fl6pR6jRW8QDhrIcmtLTyNExV
 IeMaC5kVj8GipNpWnHkUJ2KEfDz+MS3BNeRh/3odTkwWsruXgNsCALplymtd069v8xlh
 GzJcOPF6+wi2B+/dGsYMeATrTXEWHJGYv0/YspqRSQTnOX9vvev0Ja3CUaDeotU0IYz6
 +CxwtLAnnVnrOGNezs3ETjI8wuY13QpWt6nu2kvW7j1V7Tp1FxnHHeMnDUQtEcRhcypY
 r8xO1LV0MorChHPyyaTmLVriR7wRY0jsdXvRNYjiR39evUx4uXufJYcC6iAqPWPyHwq8
 oMEA==
X-Gm-Message-State: AJIora+fjSFDFOMu6DfmQBZdAALchwatGQ4hXiC0ERg/C0oAQF/f7DM9
 cnj/XVE88PnepkA8+l2UmYeUAA==
X-Google-Smtp-Source: AGRyM1tptmVG7XzGTEwtqZE4asB66mueVO3NZIfub46ohgbD4k1GwUeyvN9JFX4SN8WEDt147TUqyQ==
X-Received: by 2002:a05:6a02:30d:b0:412:9de2:eb48 with SMTP id
 bn13-20020a056a02030d00b004129de2eb48mr23409098pgb.47.1659028442527; 
 Thu, 28 Jul 2022 10:14:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:d1a3:8e57:d847:7607?
 ([2602:ae:1549:801:d1a3:8e57:d847:7607])
 by smtp.gmail.com with ESMTPSA id
 u62-20020a626041000000b0052b94e757ecsm961880pfb.213.2022.07.28.10.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 10:14:02 -0700 (PDT)
Message-ID: <927ec016-4964-47e1-02c4-bd2e9edaec7b@linaro.org>
Date: Thu, 28 Jul 2022 10:13:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1?] kvm: don't use perror() without useful errno
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220728142446.438177-1-cohuck@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220728142446.438177-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

On 7/28/22 07:24, Cornelia Huck wrote:
> perror() is designed to append the decoded errno value to a
> string. This, however, only makes sense if we called something that
> actually sets errno prior to that.
> 
> For the callers that check for split irqchip support that is not the
> case, and we end up with confusing error messages that end in
> "success". Use error_report() instead.
> 
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

