Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE946932CA
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 18:15:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQtRX-000540-Ob; Sat, 11 Feb 2023 12:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtRV-00053j-Mi
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:13:41 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtRU-0004bk-7M
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:13:41 -0500
Received: by mail-pl1-x62b.google.com with SMTP id ja21so2097468plb.13
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 09:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/TzYs/FvQFKTqsam1Ch8CgMtqe4tIwiSG6mdEUrVMC4=;
 b=L+BbkDjD0IZO7n6M09hjXmRqWO4vZpC82YSzn2r1kccOLgTR0gzLGWp8LRXISCOq4Q
 11OiJWRwgZHJ/lpF26FabsDXH8026KuyDyJdG05qoofvybIHWL1m4E5p9EtaaUHGYlmG
 SwLvZNUg1R1xk9XzCDp9K+G2BujQishMPlTantfUdiHF5KVTbU6u3LghZDIhH1vlWeXP
 2y/KRM7dCd7lUE1euAKI9Gxd93uz7RfBBDhtK/PWypnABsJICyeFC/eSNUfgSrFC2VmX
 YrTqEO+e6n5bRZ/gFi+yytKI4/UJ8iYUveueApURbKb+kZpW6D3PBCr/c2PBaDpxxkDv
 Uhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/TzYs/FvQFKTqsam1Ch8CgMtqe4tIwiSG6mdEUrVMC4=;
 b=e0Le85DvYvAfHHbDGnT3ukhR8t3OxoCOCtlzle9mjq2OfqXLd+egThH8093M0IVn2q
 SG+rIPvewkJtVEtVoVbFQWRclygbj2CkYpfTZMuA4c5WKUrU0am1K9/dQOErAuGXSCQd
 wmtH27f8eo0N3gLBzrISfoi0VApCSGxkX0G8Bw0rBHxsQyKa9qACsM2vEtPuRT8C5kXW
 nNRkiuF0MCYQbyPLyTBnDn98zO4mxyfgTS7cZ8KUHy4gQnMm5TqUmSnNFlK/RMtI96kf
 yl4BmS6PsWAJbUGn88ygGOPGsSTvOpY8DT4uMRHEYtIcNa3s7tdw591w+zQaskovL7/e
 kJZQ==
X-Gm-Message-State: AO0yUKXCTx7KmkOphYL5KekYKHIp2ywrfnn/gFvV8Lu0ZeFoBkhiCzOk
 3PBPh4YHqmPJ4nxMhiZoy1LXmg==
X-Google-Smtp-Source: AK7set+pYkbTTxfH+x/iVMOROdXh6C6Cx04K7B2+SdbGNo2UkFFb3TG63KGZD0jNmM/ZskO5tCsDIA==
X-Received: by 2002:a17:902:db0f:b0:198:fc0a:192b with SMTP id
 m15-20020a170902db0f00b00198fc0a192bmr22895837plx.64.1676135618744; 
 Sat, 11 Feb 2023 09:13:38 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 m1-20020a170902bb8100b00198e7d97171sm5224927pls.128.2023.02.11.09.13.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 09:13:38 -0800 (PST)
Message-ID: <3b6da4aa-4274-0fe4-5c69-6cceb167ee67@linaro.org>
Date: Sat, 11 Feb 2023 07:13:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/11] hw/isa/i82378: Remove intermediate IRQ forwarder
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230210163744.32182-1-philmd@linaro.org>
 <20230210163744.32182-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163744.32182-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 06:37, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> When the i82378 model was added in commit a04ff940974 ("prep:
> Add i82378 PCI-to-ISA bridge emulation") the i8259 model was
> not yet QOM'ified. This happened later in commit 747c70af78f
> ("i8259: Convert to qdev").
> 
> Directly dispatch ISA IRQs to 'cpu_intr' output IRQ
> by removing the intermediate i82378_request_out0_irq()
> handler. Rename ISA IRQs array as 'isa_irqs_in' to
> emphasize these are input IRQs.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/isa/i82378.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

