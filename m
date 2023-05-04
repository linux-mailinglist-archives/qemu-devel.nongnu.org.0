Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336206F6743
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:26:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUHo-0001R9-Nh; Thu, 04 May 2023 04:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puUHm-0001Nf-9i
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:25:58 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puUHk-0003TB-Lt
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:25:58 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-95369921f8eso26415566b.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 01:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683188755; x=1685780755;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=86HCvf1DUVVY0yetuM9WoC/W+edCNYjDegF8jran258=;
 b=MK2Bj78Lmlmk+C1JTNZ1n3kvyasNpU3In9KZKFkyPRR3LIM/SFW/XvawP/v547+jZp
 EYnqlxM2FURyYYz+s7T7+EdoG6RSrUCBZZ76DI71WnUMg4CLE95zkLMjGMSlauVZ+8bG
 q7j4i4lIlyCkYBDvAXqfLWK+GJ6efp2pZjaC8Sj/ITq7PHD/U5C/l/Y8a780dlnu+rYd
 trgjKEOjA6Z8hz9P2g6ipIW82O4jMnEGnBldZvkowBpdHfRd/1uarfwIg5auOBx/3UyW
 mRRv0AyAfwb3LQ5MzOzaAKKM+kLvH6DXMYz+H+abhW5DNsvtrnMb/J1dZnlzt3znBXl9
 htMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683188755; x=1685780755;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=86HCvf1DUVVY0yetuM9WoC/W+edCNYjDegF8jran258=;
 b=f8EHT59F+84iVR0wnQnbg2dkruSBOrIsq4mAt7tcX0f1GPpDGZbFUj3lm5zwrRckbj
 20YolFn5tw16MDjL3B7s/qGykzgXbjFDtVYW80yP0+Q6DFcS0FyJQDnl/S8KLNALIeQP
 we48gyu5MSeaPU/v3A090Ddr3yg03fejpSHQtVPfAcg+jP1h6KCfkWmuMD22EOjFetet
 1RmxD77+QhGy5fD58Ogk0NLI3Y3SJP0kAehbqrCbl8BV3A93O12lbK92l1tMtwcNkSKe
 c6yxYrsViR9Gf4Wyc9QQRhnjHgcEwmvurDVn1NLGMKbpn2RAaCJWO4ZD/p8Yr8TtAAy3
 sGRA==
X-Gm-Message-State: AC+VfDx0r2kJ7YHbFVq+0mgUvcO/wUnUo0UrAia91+ZHmqR2SxwIOul2
 KYp0f/HdghBcSM8hncyUEhyu8yoySyMWgKl0GMFNPA==
X-Google-Smtp-Source: ACHHUZ4iRI8Cce5HEHzGsufokDUczyIEvKfDMtCAKrHMsPbk7/6ZDMKshn3Z4y9xCLFvLXVdUrC1FQ==
X-Received: by 2002:a17:907:d23:b0:94e:fdfd:9baa with SMTP id
 gn35-20020a1709070d2300b0094efdfd9baamr7268865ejc.19.1683188755007; 
 Thu, 04 May 2023 01:25:55 -0700 (PDT)
Received: from [192.168.0.57] ([82.152.154.96])
 by smtp.gmail.com with ESMTPSA id
 hx4-20020a170906846400b009659ad1072fsm975106ejc.113.2023.05.04.01.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 01:25:54 -0700 (PDT)
Message-ID: <80c6ed35-1d19-eb6a-0e3b-6fbf23d8540c@linaro.org>
Date: Thu, 4 May 2023 09:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v4 00/44] Add LoongArch LSX instructions
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230425070248.2550028-1-gaosong@loongson.cn>
 <8a821169-6dc3-ab82-bd32-990b0f9a8c98@linaro.org>
 <b6243a8d-8ef6-7609-b71c-fd3cddb69d67@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b6243a8d-8ef6-7609-b71c-fd3cddb69d67@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

On 5/4/23 02:26, Song Gao wrote:
>>> V4:
>>>    - R-b and rebase;
>>>    - Migrate the upper half lsx regs;
>>>    - Remove tcg_gen_mulus2_*;
>>>    - Vsetallnez use !do_match2;
>>>    - Use tcg_gen_concat_i64_i128/tcg_gen_extr_i128_i64 to replace
>>>      TCGV128_LOW(val)/TCGV128_High(val);
>>
>> One minor nit, everything reviewed!  Congratulations.
>>
> Thank you for your guidance and review.
> 
> Since all patches are reviewed, how about drop 'RFC' on v5?

Sure.

> I am  really not sure When the Vol2 will be open.

That is unfortunate.

I think the timing of the merge of this code is now up to you as maintainer of the 
Loongson target.  As an employee of the company you have more insight into the status of 
the extension, whether it is already present in shipping silicon, or completed final 
draft, or still beta, etc.

Even if the extension is finalized, I see no reason why you should not be able to merge, 
so long as the extension is off by default, to be enabled by a cpu property from the 
command-line.  We regularly do this for unratified RISCV extensions.


r~

