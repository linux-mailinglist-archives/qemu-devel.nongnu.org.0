Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9646516DD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 00:57:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Q0J-0000Lx-RP; Mon, 19 Dec 2022 18:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q09-0000LK-Ix
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:57:01 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q04-00044t-5m
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 18:56:54 -0500
Received: by mail-pl1-x630.google.com with SMTP id 4so10617867plj.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 15:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4viFLRbtBOUhKm4RBGqvEVU6VZXRxOMTmT2hBFZiu08=;
 b=pfKoRKNJ1LTj9AuOJk3WazayUTn45/VkNIGh/o0W3WnvfxsFOXeT+ZToRnkdRAwAfs
 PcSTqXqOgi7zWhC8R9DpdIz8hDsdz82Uf8hG7cCO3s3Hxn8OtO442YGBBvDtH+CbM8Qz
 1f46dJfvsRasmzR2U/1BAZd2nnkUlE+zWNJux7k4cpa2EZYrHr3iJSoQoWffckhU+eWK
 n6Amdb5s1yR8Y4ll15ZTs8219qnu+Uj6PHJUTtlpabhNLndO3mUX69T4g2/T9aKyxxuV
 9WKqCfjLN0kbTgqamyTnJuoFYaUtR60bVyc/RvcWZSJCTSQJ/YaLaTZ+qPd4OcOW64Xv
 UqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4viFLRbtBOUhKm4RBGqvEVU6VZXRxOMTmT2hBFZiu08=;
 b=DAjRpD04JZpAmkkZvu/wi30bE7uuxxNRwVjFVL0U41fT4In35A7f3K1Mi4gczxM/bl
 6E1orOGFYimsgLMFqStIDbw606xC2EoJfJtj8FfKSeZcqnN4K+BdupuyFS7MhZiHE1j3
 yeSiTqW8uF3csNf4k0vOcpB6gD5Ox8Jc38OQRG5qXEDkUg3nB1s0+kMQayQKO5gMvQ5j
 YKSmvQu+L3supzzdd5Y9iKRxv2sU1irVK7+AKqaf2EzcPl4WhjAjzsaXr/mOqTfgZnQP
 ZVT9UGotg2IhLnKukqqGLdeHj+hdrjHatgPfurNUxKwSUeXfHvXpRYW5x3wn6X80k9K6
 vRrw==
X-Gm-Message-State: ANoB5pl/fllOTKAvdczUQTpXQXQ1+pt4GlmfQLPXBTcxzFxUUvn3Mt45
 Y+v2t5Ui0k6uErzaysTCxwY4ag==
X-Google-Smtp-Source: AA0mqf7wA5+NCeACtgO76448aazcHbXIRDbBNqLrkvIu6vAM3PsxrRWXPoy2qHEzdVRaBRhGE0ryLQ==
X-Received: by 2002:a17:903:3252:b0:189:e924:e279 with SMTP id
 ji18-20020a170903325200b00189e924e279mr44405905plb.49.1671494210410; 
 Mon, 19 Dec 2022 15:56:50 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a1709027e8600b00172973d3cd9sm7725432pla.55.2022.12.19.15.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 15:56:49 -0800 (PST)
Message-ID: <b5f4f3c2-d8ab-f679-1a56-8808a1af0f8e@linaro.org>
Date: Mon, 19 Dec 2022 15:56:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/4] target/arm: Restrict 'qapi-commands-machine.h' to
 system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221219211034.70491-1-philmd@linaro.org>
 <20221219211034.70491-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219211034.70491-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
> Move the QMP functions from helper.c (which is always compiled) to
> monitor.c (which is only compiled when system-emulation is selected).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.c   | 29 -----------------------------
>   target/arm/m_helper.c |  1 -
>   target/arm/monitor.c  | 28 ++++++++++++++++++++++++++++
>   3 files changed, 28 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

