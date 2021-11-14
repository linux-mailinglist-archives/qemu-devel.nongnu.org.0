Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A9144F769
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 11:21:15 +0100 (CET)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmCdO-00008g-1f
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 05:21:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmCcD-0007kY-8w
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 05:20:01 -0500
Received: from [2a00:1450:4864:20::436] (port=42660
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmCcB-000731-LF
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 05:20:00 -0500
Received: by mail-wr1-x436.google.com with SMTP id c4so24239820wrd.9
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 02:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vZyljje3vM3fE4FVWVkrlWGwysR2QZIrT70zT9HJsGQ=;
 b=mKCaoQzi7SycqG+yAUCATkVjNrL+MSTBYAoTgpLMCM+ALOA78yaai3WUlIcMdA08hY
 eufVJZ9Fnwya806VoJf6L86A+7R1EDK8GhyJq6XpWxXCdgUyn8om+E/XvHYjQfx3hd1k
 b+/BD/ZlktiOR0Lv2SuP2jfuEpIeMU875PAZepgSvlOwACmxaN6rLqqZLZTT+Ag3AXrP
 CTLwPkdFk4HujUQrAkXzNHWWnlZjRoxBAh2tV0OyYsrej1zPiBTiDW7ltU2EDoqawIVy
 ZQAXh5obkjcuX+fRAL10Gkg3VtKRcbu6BwDNUjLbvYuwntCw27tDBLt9Ss0V4LxtUWce
 1k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vZyljje3vM3fE4FVWVkrlWGwysR2QZIrT70zT9HJsGQ=;
 b=57YPHzInudpYU5B9IIEAUdWNj7kyCvG0pxC5PElR28nEjHjxu8HviCwZm3CavmbN85
 qUzDpdB47KB3kl18c1nX+URdY9BRWDaDT7l39dHatutcZ1YCF393jW32aQtYVyLtEND5
 n+9PywHi6uMiYxJlFs9siF9/HYKVXY2u7yE9oMu4eVoxn1WRcDVNa5J9F0P91Vy03+sO
 iz1H+UH+5DsnVLIOxxC552IictdYZY48HLaKWzZIQ0iYCus751BzYhMtOot6uvkCsG72
 LxPuwtIj7CQ23Hattdec6gCRxFxjWLcbmZoIE6Mz1zzbAyX8tvSwaUHJkNRODdcNhkf9
 yRTA==
X-Gm-Message-State: AOAM5330/U8n17MktNFyeW7jXQODo7eNz0kK4Db97foZUz1fnh5LjlH9
 Y16oWWGCWwxHqHgJhRHSlfQkfb5cngL4D9t87lk=
X-Google-Smtp-Source: ABdhPJy3Qf7tGwvIKCRzM++R77m22wm6S/FXNWramLWCVnpmoKLFg0ZfSJxzCuO5IjtYGUGZIRzEWg==
X-Received: by 2002:a5d:47a9:: with SMTP id 9mr36314055wrb.42.1636885197708;
 Sun, 14 Nov 2021 02:19:57 -0800 (PST)
Received: from [192.168.8.105] (60.red-95-126-179.staticip.rima-tde.net.
 [95.126.179.60])
 by smtp.gmail.com with ESMTPSA id v8sm10987927wrd.84.2021.11.14.02.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 02:19:57 -0800 (PST)
Subject: Re: [RFC PATCH v2 10/30] target/loongarch: Add other core
 instructions support
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-11-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec560b32-c0f2-a47a-21e6-b2b64c674939@linaro.org>
Date: Sun, 14 Nov 2021 11:19:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-11-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.402,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
> +        if (qemu_loglevel_mask(CPU_LOG_INT)) {
> +            qemu_log("%s: TLBRERA 0x%lx\n", __func__, env->CSR_TLBRERA);
> +        }

This is qemu_log_mask, two instances.  With that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +void helper_ldpte(CPULoongArchState *env, target_ulong base, target_ulong odd,
> +                  uint32_t mem_idx)

It it is a bit disappointing that the manual does not describe this function in detail, 
only a high-level description.


r~

