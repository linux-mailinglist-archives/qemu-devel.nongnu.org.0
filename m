Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E26932E8
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 18:48:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQtxi-0007as-Tn; Sat, 11 Feb 2023 12:46:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtxh-0007aB-Hv
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:46:57 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtxf-0004E7-U9
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:46:57 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso10876336pju.0
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 09:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sne69jFymJb5jeiZg7KnMOuQ7wS9KCl7A98JR1ECTAM=;
 b=xFAPPjSBI21zIgIA25EEtUsPW7y+nT3d6nDPH9rHZzkYGlnYIMpObOkz9lvLPpebwd
 Te8jf2RZjsq2DbeS1mjbGVJm5q+hnu0RyGjspK7/tBS6IfTtge1pdacQD1w24ZrgrdMJ
 kdySQaWQ9yHOYmt/zqhN1ERHZhEssNOWzzIbfaBSAES88dPI+NCNXV8f5bZi48k3WHBw
 NNLoqF3VR6Ltem87FdzTkFx3MOVSLYZIfTBN5PZWLMxTep+bWdl1WbAxoPWwCwDW7HP6
 ykYwSBmMhDf+RWjd+YdGpn1U3cN5AKCgYUNz84ALBAJiiiE2OXPyJRQsxUnPVpyuIyEc
 TnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sne69jFymJb5jeiZg7KnMOuQ7wS9KCl7A98JR1ECTAM=;
 b=KbOW8rh+oeYx5ZINdBkekuHqMb1MPj4a/OxOEOHSrW4lqOzciUsXjdIfaCu2KhMlSJ
 SGB/+n8svkDam5kR9HRL9B7ZTGp6k74YsK76PCRe0uQJZBZ7y6GLbL31pMtW1yDighyL
 2pQwSoYM3/tabfDiXcx5pDnUK+GqtVhs7gwFoUVokxxB6WqyVcHPCMTXCOjYw0zwyPoo
 S+E7OR/9mfZUn1uwGEdnbippKE4pncDeSJxrRNLuFnW1XoDpCUZMWIx/q1L59CW0AVXc
 60DjYTPjQyHk1CSDh1FE8yXH4ZzM3unupjn0ke3pc1wiChFabKie6b57j2xGxYsNhLBM
 QMRQ==
X-Gm-Message-State: AO0yUKVQpXkQsUsjbY54wPgdWt3na2NfvRqYf+WSZh+Nu3e/kjR6Evse
 IcDW+7Uu1pOY/lF0JbxwhJrHnw==
X-Google-Smtp-Source: AK7set+eTC+xq/cE3qTl20LUfPk9ieILPqeII0WFpNpH9JeuuLHdcYdi4wtAI/Q9VUaD80dxOBawEQ==
X-Received: by 2002:a05:6a20:3c9e:b0:bf:58d1:ce98 with SMTP id
 b30-20020a056a203c9e00b000bf58d1ce98mr10561296pzj.23.1676137614233; 
 Sat, 11 Feb 2023 09:46:54 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 p26-20020a63951a000000b004ae6e97ed10sm4676305pgd.17.2023.02.11.09.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 09:46:53 -0800 (PST)
Message-ID: <073579e9-131a-620e-2667-ef2eee5e63c9@linaro.org>
Date: Sat, 11 Feb 2023 07:46:48 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 11/11] hw/isa: Factor isa_bus_get_irq() out of
 isa_get_irq()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-ppc@nongnu.org
References: <20230210163744.32182-1-philmd@linaro.org>
 <20230210163744.32182-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163744.32182-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
> isa_get_irq() was added in commit 3a38d437ca
> ("Add isa_reserve_irq()" Fri Aug 14 11:36:15 2009) as:
> 
>      a temporary interface to be used to allocate ISA IRQs for
>      devices which have not yet been converted to qdev, and for
>      special cases which are not suited for qdev conversions,
>      such as the 'ferr'.
> 
> We still use it 14 years later, using the global 'isabus'
> singleton. In order to get rid of such*temporary*  interface,
> extract isa_bus_get_irq() which can take any ISABus* object.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/isa/isa-bus.c     | 14 ++++++++++----
>   include/hw/isa/isa.h |  8 ++++++++
>   2 files changed, 18 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

