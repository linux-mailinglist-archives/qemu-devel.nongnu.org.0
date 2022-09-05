Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE0C5AD1F4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:58:34 +0200 (CEST)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAkH-0006r3-Oi
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVA3f-0001dv-SH
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:14:27 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVA3e-0006ei-5n
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:14:27 -0400
Received: by mail-wr1-x429.google.com with SMTP id f15so6137971wrw.3
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=txJUxiHEEPq3DSIaQJ68ZtHH8oHa5ANK7U1PI9oIK/M=;
 b=a7SjyS4t7SBC0KTefjBp3AvaQpc/43HucrHCQ3M5Zm8Epdsxr1sIh/Q5BAzSBrWjeh
 JLrF7BWFy3rgfTGqyC62z8OgsaBD+EecGMA6ApmgXa8yeZeWSSjcIVmVv2tfSgG0xkjQ
 JNltF21rfQ/mxJzg9gWN5cHczpfTql3cAjf1Lw8B1Oef9I/Mku8FwAbOwW0FCs0Sxffc
 2fk8/rrbbQMw4yE3y/rRA2YehhTtYtGprA60wqGDqY/LJrrk+R/sfdIwXzooDImvkQdW
 OaBVoE/vQYz0mb577UEADJPxc1UgJe4w/j27YSAO2ffd65tBfE9tXp/DF0NbTqYQF10a
 9VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=txJUxiHEEPq3DSIaQJ68ZtHH8oHa5ANK7U1PI9oIK/M=;
 b=gogn4Grt3W1q75MrYO/exqbjE4PAGhSYz5Yo0x+qMupEIUsVbxgxTmP1sEvPkGTRFW
 E4YFFKaO9JTMTH4RdUrHlOXF1n0CBvby3lelP+tPqj1L4CRFqqMwAi5Fgkto2EYuEwLj
 2LeIN0XxAdmiSZnWOpKfP7qnNqy01VgxebvQMqsrSQqwkjrTJnjek3C+WDJ+ZxW4v2Wu
 IrQea9o+neefH9N473DHqavTzXjfg0UDdhRpPAjJkB1JPKShVCPzhc8NiHT5NLpaymrA
 7UB0x4R9Z0lSYluHuKN3XHhqP2Dm2PcbGLg5or4pMExepVTz9FvupkAIKO84ZE0BS4ue
 KBsg==
X-Gm-Message-State: ACgBeo0XSek82MLuPZ9bryW3okA86ZJwOV2MhEpp4pNOEMoZfgTawaLZ
 tnl5He+jegZiKwSo5/2kIyGIVg==
X-Google-Smtp-Source: AA6agR7IEfelZPqpBpcry3/PaDzgYU4v0g8+WGDuc0VeQMW2N0uiiDh8aJevzHwlCstmBK+aHZ/KDg==
X-Received: by 2002:adf:edc9:0:b0:228:60de:1d4b with SMTP id
 v9-20020adfedc9000000b0022860de1d4bmr5444948wro.306.1662376464615; 
 Mon, 05 Sep 2022 04:14:24 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003a60bc8ae8fsm10146070wmb.21.2022.09.05.04.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:14:21 -0700 (PDT)
Message-ID: <9681f28c-5941-3139-8cb3-7855c0e40819@linaro.org>
Date: Mon, 5 Sep 2022 12:14:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 09/20] disas/nanomips: Move typedefs etc to nanomips.cpp
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-10-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-10-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> The following is moved from the nanomips.h to nanomips.cpp file:
> - #include line
> - typedefs
> - enums
> - definition of the Pool struct.
> Header file nanomips.h will be deleted to be consistent with the rest of
> the disas/ code.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   disas/nanomips.cpp | 53 +++++++++++++++++++++++++++++++++++++++++++++-
>   disas/nanomips.h   | 53 ----------------------------------------------
>   2 files changed, 52 insertions(+), 54 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

