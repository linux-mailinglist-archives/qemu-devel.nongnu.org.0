Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026276EF97E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 19:35:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prj2p-0007t6-6R; Wed, 26 Apr 2023 13:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prj2m-0007sg-8t
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:35:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prj2g-00020X-Kg
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 13:35:03 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f196e8e2c6so55944055e9.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 10:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682530497; x=1685122497;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qjFm4fkTbWPbOWsdgJzujfWEd3CNh8VkUM4ZsKcjNoc=;
 b=BwaQGEJyVQ7tSn7A1qvzqTUqm4iI7CbVEygAIjZUVqIIrO4eGappmC68OxwfJ6mPb4
 WyzX4uuZog7t/csogyhOJIQDo5lrqUGf22nbvFEYvEIIT//ZNHeNnb5Ao24VstlI3e2I
 sEWa+lrHVLFPGcx109W+XfrAEx0p/1V5vXNcaPXyrazy3oArSyr1V6VP+hdv46qwPpJU
 p0T8CzbMmtBYpT/89dn5Xfqr88O4iMQuYvaeSlW5aPKDut9fG402dbYvmbL3biLhM6Y0
 rIGO+yrr6PBOODbWg8WytuYj7CpVtjBli0U28qp0Izy79iPNiaDlMSPbg5GPIdnx1u+a
 AuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682530497; x=1685122497;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qjFm4fkTbWPbOWsdgJzujfWEd3CNh8VkUM4ZsKcjNoc=;
 b=D0O8fquQl7RDZ7gFR5l3/0FPw/Ng0+XT3sHvKwJYteWS95aPgM4bsHUr1IOp3EY55A
 HE9QvJEcOqomJv52MKsO6IwSxc5pBZNHOPhJBK8d72cApgi2uJdlRM7MBJDYIApX/F16
 CY76AMUBLmKXiQl0AH8my50ddsTZ9CrQQ/pwVbAvtbPOyGC4Rf+5QtyyD8E9xPXbzWGI
 Cff24cN+AoAZjH7TtdqM7XdiRWNiLh3RfHmuh4QNcpZ1urBzhd0yx43opXuvthzpE0em
 HoHMid2YGAPhOxiGMcBdPgz7qvcawGRSskmQJLka1zHI9rtVtX47FfcwOpvOC3w68g42
 MF8w==
X-Gm-Message-State: AAQBX9cwN+j8pXzx5JuRG8bLQ0kWnCWYCY79CQVF4HBCh2Jdj8yQ4Zi0
 xbbn94Q9fOdgV0MlGMLxeayTsQ==
X-Google-Smtp-Source: AKy350a1RoYpW3Sdfi1HTAF2PFnbINyp2Vp/wGPd8J8NIIBRg5NZag7Vg8yOfFaP9oGA/a4918QmYQ==
X-Received: by 2002:a7b:c003:0:b0:3f1:885f:2e52 with SMTP id
 c3-20020a7bc003000000b003f1885f2e52mr13094604wmb.16.1682530496863; 
 Wed, 26 Apr 2023 10:34:56 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a7bcd0f000000b003f182cc55c4sm18665533wmj.12.2023.04.26.10.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 10:34:56 -0700 (PDT)
Message-ID: <961db72c-9295-2c40-9abe-65bc421d3de1@linaro.org>
Date: Wed, 26 Apr 2023 18:34:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 03/21] Hexagon (target/hexagon) Add overrides for loop
 setup instructions
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004121.1318914-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004121.1318914-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/26/23 01:41, Taylor Simpson wrote:
> These instructions have implicit writes to registers, so we don't
> want them to be helpers when idef-parser is off.
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h | 21 +++++++++++++++++++
>   target/hexagon/genptr.c  | 44 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 65 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

