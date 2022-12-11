Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C2649500
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:58:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OiI-0007lb-6P; Sun, 11 Dec 2022 10:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OiD-0007l1-06
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:57:57 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OiB-0000tP-Jg
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:57:56 -0500
Received: by mail-oi1-x22f.google.com with SMTP id s187so9088572oie.10
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XXVc3IaUp5+3RBfBpUWLSXdtRIgMWgfhTP1hRYaaZXQ=;
 b=zra2zQXheRn20gtboEBmvha6AGI/J64GgWauy8b60D2CxlBKklePQAGB9NL5MjlCbl
 xGGDLQuVYpL3BkLnY2a4uJWj8mIhzBdBCrAlXnVsWiZck1PDXaRDG7WrfeBm3YMaIDwD
 1t/tI+q6c1SKhSYxnq+dhJWW25SymlNGxPPbY/Ru9fmo3WnM2/iW12cPXhTaHmieMiI2
 HL2Chozutd2KSJ1hatFlUrFAxhRUR5BIW8f2s9ybkPaSIVED4xpOLOlkl9meO4VbQMks
 KKRXFlM9yHd4p+F4zQN6hZtje7Zfb89IFU1wd6M3HRsnfVcMrII9BdAEWWNAMafnZaR6
 YWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XXVc3IaUp5+3RBfBpUWLSXdtRIgMWgfhTP1hRYaaZXQ=;
 b=jDCQGjP0zkO0THWb3/y8ywzg2WSLydFhSn/6NN6ewQjdhEte+09xEaIt48PS1cEdox
 JGpsMPTo5GZvUgYlEiFB9Ub38pYtqJiSXCyar4hStUT9M/8IrdFHbdJsJSKM7zPIe6tH
 wlGE73Qk7In82VA4auMfKDfsSdoFNcCsFnYWUqjS/bwbwxfZrRWnD5FyllcqdtC2jmE1
 summ9jwOhEMh5eLWvxXTieluz0GyuCV2Iu3AU3DWXsPZQoaS6iOe0+ZiO0/eifrBTxh2
 I/2wiqU1gevgNStJBoGpE42TfRysnmzBZLJl8FKksbSuMpnkVUnaK0uI+xLoKREIRPSf
 WHYw==
X-Gm-Message-State: ANoB5plNoL0WoVK0u6YR6VLy0aA66oeWkW5BPrD3EqYKxD0y5sxwf7E3
 EvGXhO/D5tpubslb3t2uBmnddg==
X-Google-Smtp-Source: AA0mqf59DPyEy8z3QfzzcQLbRaIEDp/J9sAvehXgGNcHYhGjx8mJaDTGohs/zwaX9dtUuuM+5BtLmw==
X-Received: by 2002:aca:f15:0:b0:35a:4a2d:6750 with SMTP id
 21-20020aca0f15000000b0035a4a2d6750mr4877161oip.26.1670774274113; 
 Sun, 11 Dec 2022 07:57:54 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:7b4f:f28b:eca6:b583?
 ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 e84-20020aca3757000000b0035b7002af8csm2670534oia.56.2022.12.11.07.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 07:57:53 -0800 (PST)
Message-ID: <ddba4660-88e0-9887-2287-61ee14398530@linaro.org>
Date: Sun, 11 Dec 2022 09:57:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 2/7] hw/mips/bootloader: Pass 32-bit immediate
 value to LUI opcode generator
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221210155502.74609-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/10/22 09:54, Philippe Mathieu-Daudé wrote:
> -static void bl_gen_lui(void **p, bl_reg rt, uint16_t imm)
> +static void bl_gen_lui(void **p, bl_reg rt, uint32_t imm32)
>   {
>       /* R6: It's a alias of AUI with RS = 0 */
> -    bl_gen_i_type(p, 0x0f, 0, rt, imm);
> +    assert(imm32 <= UINT16_MAX);
> +    bl_gen_i_type(p, 0x0f, 0, rt, extract32(imm32, 16, 16));

This assert is obviously incorrect.  You wanted to test

    (imm32 & 0xffff) == 0


r~

