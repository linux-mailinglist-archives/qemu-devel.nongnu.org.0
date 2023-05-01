Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468066F35DF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 20:36:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYNi-0007eg-FM; Mon, 01 May 2023 14:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYNb-0007eH-2Z
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:36:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYNX-0008PD-9B
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:36:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso17066025e9.1
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 11:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682966159; x=1685558159;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6dHi392XAjD4r7KjcxzpWDkMAEHi2pTzPDpCTrc1kIg=;
 b=UjaUaPJOg28o1QArLHwI9V+ni5aj5qQuwgKuUwEea65KOlOeXsc00hYteC302s/mkY
 93zYIh31v2ecDeJGgNpJKcj7ev3s16HvEfXh8XNEbLamtXxRA74x2PeKfsfLWb2lp/3z
 cCEzJfuhm89GpyYTMrYJ4l/1+bqm6bov/Ug2jY7Kf0oBqxbkPMwp+/tGjxY2JC2Bbgiv
 De3pSow2+DNyGDKgQrgOV9tKbB9ktFvUfbB9ACCxk6NqI3HSnaAihZGh7/VXxomA1JpR
 YomhwNtRDrW6S6ZUdWYsleiejH1j1YbNfdFLQLK4ieXjYZH1CivqlNRSKCKotkF0Lah5
 LYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966159; x=1685558159;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6dHi392XAjD4r7KjcxzpWDkMAEHi2pTzPDpCTrc1kIg=;
 b=eWuZxcjnkPO5tExpz2kWBCVrSYT3jfNPb+vwU0TqZubMPo6pCh6qkbOX7ObK981PLX
 A7k4sz6t/IYPzHXQkylbrRcMoTrXT5Cg2vlTgWK2JMkTiOnNfFmgX156STM8afnAncQl
 Cv1hGSU+B1M9yL5KtGkUvAhdrvmGKid4kBQGfqAdJcjRCzmR3V/3unUlxgQDqqDWf9id
 drwPk/oSbexzeSnb/1B2dut+40SEXf+To0tdKPUq5OwMrFGwmK7zJI2HBE+FsRJ4HEjb
 KElcsgJF94103+6GbEk8B4FFK80av/9WUy5l4cHK9JEqK/17X3eNBs+ZazGZyuMFdPe9
 /5Dg==
X-Gm-Message-State: AC+VfDxZlOjpwa8eq+ZtShwxwjyu+Xf/euOb8y9DZWDFWkIDr1i4ZjxS
 zpOZkm0hckK1fGXKYfDwfi09rINeqlyRpQtmCk/dUw==
X-Google-Smtp-Source: ACHHUZ7qC7Yc3NqOUriLS0uOYgn1labzuJlJv7qHbehb0K180Yo1CJ0+790jTWWJz2e3L989i7YQuQ==
X-Received: by 2002:a05:600c:b49:b0:3f1:82d8:8fde with SMTP id
 k9-20020a05600c0b4900b003f182d88fdemr11040407wmr.24.1682966159302; 
 Mon, 01 May 2023 11:35:59 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003ee5fa61f45sm36986193wmq.3.2023.05.01.11.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 11:35:58 -0700 (PDT)
Message-ID: <e1a8f0ba-f71e-87d3-e439-a19d943891af@linaro.org>
Date: Mon, 1 May 2023 19:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v4 30/44] target/loongarch: Implement vpcnt
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230425070248.2550028-1-gaosong@loongson.cn>
 <20230425070248.2550028-31-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230425070248.2550028-31-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/25/23 08:02, Song Gao wrote:
> This patch includes:
> - VPCNT.{B/H/W/D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  5 +++++
>   target/loongarch/helper.h                   |  5 +++++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  5 +++++
>   target/loongarch/insns.decode               |  5 +++++
>   target/loongarch/lsx_helper.c               | 18 ++++++++++++++++++
>   5 files changed, 38 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

