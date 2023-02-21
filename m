Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2B69EB63
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:45:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUcJD-0000Ry-35; Tue, 21 Feb 2023 18:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcJB-0000Qs-0H
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:44:29 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcJ9-0005sJ-F2
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:44:28 -0500
Received: by mail-pg1-x529.google.com with SMTP id p5so3217681pgh.11
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2VJ8d9vngkappQHum9+ttxus7zf1l3BdN1cKfY+Lbso=;
 b=Lb2IzZLOoXS4beFCYxx07/YTsc6EUR6aDeZFrRD58+G/KNdz/bF0+sMj0tFX+S6sny
 kC9RGkL4QnH9QltmDegxsmwPG5xVP9KkqC0dxeWRwy59RqUQJV07rQa4GyKLOb9eQUkb
 7uwzxLeOfIgwHyhWGA+6+E7fV8Ezcf9/BpOX+CebgoWz6diESKVzTuV9WnFbKCMrgql1
 UtnylVLZ86+RbSgr+MImtzS80lAy/rl0BvR825XKTxoZy/ThRvyLGfSbZX+L5dZ+lgpE
 Bx8AT2REj/PH+6xgi/NRn+kx8nzhqWdriOIg4LyUMDwOnnju8OSB7Eb6FBZWhmm8hqBg
 0yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2VJ8d9vngkappQHum9+ttxus7zf1l3BdN1cKfY+Lbso=;
 b=7FOaNXsaQ/EePIAdjdmz40YZXqAar1WZr9Hk30V3vaQbMHLuduDApcNDS7Ns8cjuDB
 NCmowv5us9TC7/Oj0cp1edxRoIitEUbLJZ8S8E0MQW9miQac+vmjTN9qIQs399dgLg7X
 oYm1SjxGVjq1L6X2V7xVePFmy8ppkwzLmxCVVGWAzDescNoJy6Nhde0FdPaEhgZeOYbV
 +ILZbrVMQm2S2nt0bvA0k0yYJOdFdO+DT7nXmbV138AgGfJq5N5LZSTOVaHtdYc9m+C7
 muRm5j26vWwkj/uvBKD0fNc/8KFVNY+hptGYFPn3sNzAHor901PiiePZX5pda8msXgl8
 xR4g==
X-Gm-Message-State: AO0yUKVTQzWm9uPSpp5jYs0xT+SJ2zWJZkFyrPp+b+3fsuPU+CfjZljj
 hs1pPqCzgEQ56RiIvNpSHCBOhFAMSggeX7zLkj4=
X-Google-Smtp-Source: AK7set8ig8nqmL5j5udPm3EBxzyf7+ntq7CdNDNQvJsF6/SuOiEVMyAtBdKsBmantne+EzYO4rMJBA==
X-Received: by 2002:aa7:9e47:0:b0:5b9:49a5:5de7 with SMTP id
 z7-20020aa79e47000000b005b949a55de7mr6192367pfq.31.1677023065875; 
 Tue, 21 Feb 2023 15:44:25 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 17-20020aa79111000000b005a852875590sm1609454pfh.113.2023.02.21.15.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 15:44:25 -0800 (PST)
Message-ID: <b43bb34b-f96e-70de-381b-330835cba161@linaro.org>
Date: Tue, 21 Feb 2023 13:44:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/4] util/cacheflush: fix cache on windows-arm64
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org, philmd@linaro.org
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
 <20230221153006.20300-2-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230221153006.20300-2-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 05:30, Pierrick Bouvier wrote:
> ctr_el0 access is privileged on this platform and fails as an illegal
> instruction.
> 
> Windows does not offer a way to flush data cache from userspace, and
> only FlushInstructionCache is available in Windows API.
> 
> The generic implementation of flush_idcache_range uses,
> __builtin___clear_cache, which already use the FlushInstructionCache
> function. So we rely on that.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   util/cacheflush.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)

Queueing this to tcg-next.


r~

