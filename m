Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D552364F663
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6LD3-0005Nn-9F; Fri, 16 Dec 2022 19:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LD1-0005Iq-0q
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:37:47 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LCy-0005AJ-Qy
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:37:46 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 e7-20020a17090a77c700b00216928a3917so7682087pjs.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8qaT6KScyYUFxPW2x1O09D1JhOCxCcrOAIL97yRT+AQ=;
 b=jtOH5Zzc1K8kqRA/rAvhCkbmNZIGIBKaAi/BU44pvtXWd50zzWIDBL5iwUK7D6jHRV
 Bm1M0ZnvdkBl3+vIuInnsTK8j6a1Xuz7RgOttBxJjhwsSHigf91dpYICqlk+oBMiZQTB
 5XdlVit2r7r8gtUZE4VewO7Ut7eg6yL2UWCqovBSpeoxfzfyKu11bj1EoOsvsGumJaHK
 RX8bBInFop8zFgzwzG0fmN2JkEqTXmis+8e9b2MzWIDTSwhMuR+CgihadlJsZsnqtbqM
 zQwFTq8cB8pTMNv3kZf22qvqDa4l4SHi/Rd/wJ1KdCxsGCwuXbs9GweQv836ZUBL3tQb
 za6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8qaT6KScyYUFxPW2x1O09D1JhOCxCcrOAIL97yRT+AQ=;
 b=dO3wWyBr+CbOSjxxoJMMs/hxlSiHFM7SvooykXhj6kWTXV5PR327Et5o9QkddS47ry
 +NkJqbtcPpoC/jSUv7mpzEab/CCmHUhehTt390jEouDLnomQ4rWVIfiAYNkqNu4JV280
 9RkIKWG3Ix1jUXYcdwi7sFlTIYcnuO1nX8mtUSNjTXmTICItCpSXO3KELq5pJYRuOZbK
 R6n6nlv2VkOOZue7YitlEThAUPAdL/ddZk989pRqBIU5kUq8n5buyZd1ks+7SgnY+dyj
 eGKZS6xA9HMHi1HZVX41k9BzugWmgEoMvF8tZe4CTh/ZY3dgQcXbxO2UsUJ9uoKGXTyH
 ewjQ==
X-Gm-Message-State: ANoB5plMAHfodKUVEERNqNJCrtqrM2M6AE9/9685m4KewV9K2tatNCm/
 nbk1z88P0lgprxBBPeKQOclXDQ==
X-Google-Smtp-Source: AA0mqf4J8784D3LYn8iqxN/MUmuWkC0wQdpGQJj5E5yX2dix+VPIiv0SZ+E7Pf6T4Gj8hr1GfRPNgQ==
X-Received: by 2002:a05:6a21:9982:b0:af:6cc0:5b3d with SMTP id
 ve2-20020a056a21998200b000af6cc05b3dmr18889036pzb.7.1671237463450; 
 Fri, 16 Dec 2022 16:37:43 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a170902ca9400b001708c4ebbaesm2176807pld.309.2022.12.16.16.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:37:42 -0800 (PST)
Message-ID: <ae13260e-2fb8-612d-3e6e-c37fb40ac1c5@linaro.org>
Date: Fri, 16 Dec 2022 16:37:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 06/10] target/ppc/helper: Include missing "cpu.h" header
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
 <20221216220539.7065-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> 'dh_ctype_*' are defined as 'ppc_avr_t/ppc_vsr_t/ppc_acc_t',
> themselves declared in "cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/ppc/helper.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 8dd22a35e4..a02db8d893 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -1,3 +1,5 @@
> +#include "cpu.h"

No, see patch 1.


r~

