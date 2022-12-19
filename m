Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C856516E1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 00:59:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Q1z-0001cD-6C; Mon, 19 Dec 2022 18:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q1v-0001bD-NN
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:58:47 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q1t-0004Em-Hv
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:58:46 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso10466082pjh.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t+k/NhiFIh+gR8/EesxpWW635Fq7o7eqjFkNqGQtSx0=;
 b=BaQp0eIOIytJFN6F4AL01tXQirX+vitI/HnJP7Nv5rCE5xvPjuVffvNtdqnYkF64zM
 Z6GQzB7SLn6pOfNRXUqDjGLDRxFeZI9T8EM+2bfbiJkqamfWobzIWcya91PTX7VP0dXv
 j9SPgjnUgnroqbUhLNhhlYPYKFLbVoq2XrWQLXEbwJqADEVReut3eftWXOj5OK00XbE0
 fqVwl32ZMQx084NobrEp6QEdtCJTDJEknE3R3Ktih6d7nMYEcdsyQsXS1C6BmJ0xHI3J
 95PEy2uvuvZKUFb8ekeGdpiyY71FDskDMbZ22s9ZcXaGV+w1IUPRw7XnLqknYA5Q7al0
 TK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t+k/NhiFIh+gR8/EesxpWW635Fq7o7eqjFkNqGQtSx0=;
 b=JosELDgoNpDA2fBMn6u87yyWb0yGmpEqXp3e5YfGM32XKu4wNY0FnOIJcw6rOzmNTK
 9+WswiMyNN/miaEVvX3KSaxS7/vJoos7CK8b0YT0rGuxKSMulu2brA8h4HFRlkxnfViH
 /jE5WafylS/owJV7IYkB2v4rUmUnsLRuTvnkdxAq1pEorhgeCy8fUJl3pMEoD8O2hf7f
 jMGKeikBLed7OZnJUUbzLqHDCfZ02nhsezjaHx7Wv2n07nI4THiZSVFjr0XpC1WJcQj4
 cEuN3oELeMCaexb2W3aV/4iAXpUr8pJCewv/f2aZ38hVCsglZLQHHwBparFrNG4vNf0B
 IMlA==
X-Gm-Message-State: ANoB5pnLWnJkAJ6aFPbNjbVcTOMwuogg1Le9sSncqE1D2JjAvwCsaoO2
 FFNnkt2qM9r14gE2q00RjRTWhQ==
X-Google-Smtp-Source: AA0mqf6lkSysN0jRi6+Na5ZOWJQ/W5nKQiyYH2gYfy3zBpeAbSa9RZuKfGG4QDImxciBZnq1ddJRyg==
X-Received: by 2002:a17:902:7890:b0:188:fc0c:cdb1 with SMTP id
 q16-20020a170902789000b00188fc0ccdb1mr42551696pll.16.1671494324351; 
 Mon, 19 Dec 2022 15:58:44 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b0018980f14940sm7748687plg.178.2022.12.19.15.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 15:58:43 -0800 (PST)
Message-ID: <37aa5893-765e-99bc-e4e7-ff0d4197d9c7@linaro.org>
Date: Mon, 19 Dec 2022 15:58:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/4] target/mips: Restrict 'qapi-commands-machine.h' to
 system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, qemu-arm@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>
References: <20221219211034.70491-1-philmd@linaro.org>
 <20221219211034.70491-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219211034.70491-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/19/22 13:10, Philippe Mathieu-Daudé wrote:
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
> 
> Extract the QMP functions from cpu.c (which is always compiled) to
> the new 'sysemu/monitor.c' unit (which is only compiled when system
> emulation is selected).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/mips/cpu.c              | 29 -------------------------
>   target/mips/sysemu/meson.build |  1 +
>   target/mips/sysemu/monitor.c   | 39 ++++++++++++++++++++++++++++++++++
>   3 files changed, 40 insertions(+), 29 deletions(-)
>   create mode 100644 target/mips/sysemu/monitor.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

