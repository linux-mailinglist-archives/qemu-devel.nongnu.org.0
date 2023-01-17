Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608B766E1F9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:21:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHnlk-0006mL-QG; Tue, 17 Jan 2023 10:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHnli-0006lm-Gl
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:20:58 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHnlg-0003R0-JI
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:20:57 -0500
Received: by mail-pf1-x435.google.com with SMTP id i1so8685039pfk.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 07:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=badnb5btSkc08gD2NjJ/S/AfZNygbSTl3aGz4IrLDGs=;
 b=PiS0yf7akIlF3oRcD2QlNHGXVgITVmkCwnKX/tWLkbX8Vb1w07KNm98zp3B5ezsw9+
 wWM7qdtWWRVQU+NgvSPXCm7so0rUJZGhVJsTT3CaWuV5x8TrCdf23ThUJsezwgacbKXA
 bTv8gfqFFDwLc6G6UISCPOw65b89MAQ1PhknjF27HZIj9/AXGAzfCK05aCjV+0MVEL8i
 9np5Opekl6sCNL9udb648TIh25w3QbqD6F55Q6yurCJrWn1CoztY5pJAe2z+ZdTOCV8H
 R9P5WYYaecyIT8JZaC2wPWXgPbEbb+3jCSdHpgvvQ5YVS0DDR3KFbVhQ4dW3vDlFbLJT
 kRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=badnb5btSkc08gD2NjJ/S/AfZNygbSTl3aGz4IrLDGs=;
 b=KOgkJpCrUFA/4y49J2DMLg8XMDnxmPzFUCBNpJUZP9vvVWJF6JFoj3CZ9lRFrFgT8L
 zvXI6dOl5dCWKTME27vsUC1fIYWbEF6keWA52DmL4xc7XBMLrol233yPmsPQBE9+XwFn
 ioUE3pquLAia1ChiP7YYU7NdxtxbSe6S8pf1o9LvdkBLzD6L25+Plo3Gv5KuEfL6KI2w
 TSTwuo1XNru2GnOVDwedgJWgPI+A+81y1QzDH0SdTmfArXpIVwnMWgBkscjWClGXLE6k
 icUyLBfezmP87BIs9zLMciHLuqrEjLpuWL1LpTqWUAs8/OSsqbinUeeSi+5fys2ENBea
 pZww==
X-Gm-Message-State: AFqh2kpXHZXkNKbpKf8I996snPj3TRgq2TAB7HTibMT2Ev85ZojU3/HU
 T7HCiSzxDPgc3fSeWxxbzMaRZQ==
X-Google-Smtp-Source: AMrXdXuCova2BuaTiWmm1UI03zD0V0QK/A+cf0M1g2Z4hvL4uSuBrKuXsvcW6NIoLll0aTY4pJ7+oA==
X-Received: by 2002:aa7:8f89:0:b0:58b:bce2:7eb7 with SMTP id
 t9-20020aa78f89000000b0058bbce27eb7mr15760652pfs.10.1673968854709; 
 Tue, 17 Jan 2023 07:20:54 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 132-20020a62198a000000b00575caf8478dsm20232033pfz.41.2023.01.17.07.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 07:20:54 -0800 (PST)
Message-ID: <d81b10b3-e5b7-9026-ee42-d3564180f0ca@linaro.org>
Date: Tue, 17 Jan 2023 05:20:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] target/arm: Look up ARMCPRegInfo at runtime
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <4db4ccba-1985-f1b2-6c5a-615b865ba749@linaro.org>
 <CAFEAcA-4dUF8MySqFxFdrHFF+Jjw+wZo9mp6uNuHqumssKX_Aw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-4dUF8MySqFxFdrHFF+Jjw+wZo9mp6uNuHqumssKX_Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 1/17/23 00:28, Peter Maydell wrote:
> On Mon, 16 Jan 2023 at 20:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Ping.
> 
> What did you think of my suggestion in the other thread of hashing
> the info we need to determine the cpreg set (ID regs, feature flags,
> etc) and using that to look up whether we've already created a
> cpreg hashtable for this config? If we did that, we could refcount
> the cpreg hashtable and only free it when all CPUs are done with
> it, which would mean we don't need this indirection.

I thought it a decent idea, but not small.

While we currently have a struct for some isar regs, we'd want a larger struct containing 
every bit of info that wants hashing.  I think it would take 40-50 patches to get all of 
the properties etc moved out of ARMCPU and CPUARMState.

Anyway, I didn't want to leave the user-only thread leak blocked in the meantime.


r~


