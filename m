Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6BD44AA91
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:27:20 +0100 (CET)
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNPT-000125-4I
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:27:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkNOA-0008TB-To
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:25:59 -0500
Received: from [2a00:1450:4864:20::42e] (port=41578
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkNO7-0000cA-Bl
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 04:25:57 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d3so31782387wrh.8
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 01:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=km8peSUDsrSJPOkAr7D3SJJh4u706UcjJZMybmc8qXI=;
 b=ssM9KpUZD6wTaVialVW5GfgoX49VpAfK75eKrmNdWRhnrpJRhYof6nyDQs/GT0m0f1
 OIBtA7clmp5U9ikytJXuzVIewsns6aX7fOkekMmNw+RRAXontySOOFk6+2AHdZN6l6f2
 RgEHoOwEdWU+xnUmSBYAewHTELa6oYlYCiAbbEZrDkfFTRUssqd1K0+A29NtjYox35IK
 N0EUhvFzJxSxth9w3qlvnxy0HzQ4jNZK9Wu/j3iN0XI0V1Vv+qHQJCvGKCNl/t9yue00
 QsDhStwo/59runcxyi9aC4nbG+5YqzTq3cLs4Wr+B20tx9dHhl+OABHkcccFR/JKTEDQ
 I01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=km8peSUDsrSJPOkAr7D3SJJh4u706UcjJZMybmc8qXI=;
 b=TnvJKWrmfgYLw7jdBR7U4lP2ZrolLJRnIRckbfYueknUsOhB9w2xuvfX66+uh+2oXZ
 2HahWvxsL2vb+1wRrWm9D7uch9jr3Q5cXRALKCVJjm64Wc28PSabwVNv+Rj6LTZFJw5t
 JQLXFC/69yegFgSjp9CJPdywf3FQQDValmyEw+n2C7gI9WcynI21QJRnjPQsWQE54h6V
 NEd58DAE8PXKwcEg4beddzNZ0mBkg6N113TWn+onEXW94NXZvKtjazS8cIR/otiaGbho
 TLNJtcv56FGD/GpSRQIg7buCbR8AKI57/AGx6OAXIs2qpAkiEx7OJK3VZl9+owZYnzky
 t64g==
X-Gm-Message-State: AOAM532+bCDZLkLOK8OZ3kx0c8W8A/eu04znYfs8XdNNkilFjCwakngY
 AB9HhuHwUMxayXmfXXSi6CDjSA==
X-Google-Smtp-Source: ABdhPJzklTa0tnRaNJl6HM01RLcaxKJ61nvW45p0kO+7/vPKhoBTl+ukdQ8F92H1ArsfxFa2IjEcrg==
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr7214817wrx.70.1636449953466; 
 Tue, 09 Nov 2021 01:25:53 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id q123sm1884415wma.30.2021.11.09.01.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 01:25:52 -0800 (PST)
Subject: Re: [PATCH 09/13] target/riscv: Adjust vector address with ol
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-10-zhiwei_liu@c-sky.com>
 <851481b9-e973-b3e1-1722-73db47edb772@linaro.org>
 <f84e607c-e16e-ec3f-a7b3-e779b344fcb6@c-sky.com>
 <52357320-6098-c3da-b9de-89b131b85ffb@linaro.org>
 <e045fba1-8361-dd33-8e9b-c22b8e389cf5@c-sky.com>
 <1bd3a3ff-8ca8-ed78-1bc7-c4668965f448@linaro.org>
 <08078788-dd46-7e7a-14eb-7eb95c2c9c89@c-sky.com>
 <47b0a429-52ac-4d5e-ce0b-cea67b44c550@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ace70393-0a40-93c1-f30b-e45b0ba856ca@linaro.org>
Date: Tue, 9 Nov 2021 10:25:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <47b0a429-52ac-4d5e-ce0b-cea67b44c550@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 10:05 AM, LIU Zhiwei wrote:
>> Do you mean we should add this code to riscv_tr_init_disas_context
>>
>>      if (ctx->pm_enabled) {
>>           switch (priv) {
>>           case PRV_M:
>>               env->mask = env->mpmmask;
>>               env->base = env->mpmbase;
>>               break;
>>           case PRV_S:
>>               env->mask = env->spmmask;
>>               env->base = env->spmbase;
>>               break;
>>           case PRV_U:
>>               env->mask = env->upmmask;
>>               env->base = env->upmbase;
>>               break;
>>           default:
>>               g_assert_not_reached();
>>           }
>>           ctx->pm_mask = pm_mask[priv];
>>           ctx->pm_base = pm_base[priv];
>>           ctx->need_mask = true; /* new flag for mask */
>>       } else if (get_xlen(ctx)  < TARGET_LONG_BITS) {
>>           env->mask = UINT32_MAX;
>>           env->base = 0;

Certainly we cannot modify env in riscv_tr_init_disas_context.

>>           ctx->pm_mask = tcg_constant_tl(UINT32_MAX);
>>           ctx->pm_base = tcg_constant_tl(0);
>>          ctx->need_mask = true;
>>       } else {
>> 	 env->mask = UINT64_MAX;
>>           env->base = 0;
>>       }
> 
> I think the code is wrong, perhaps we should modify the write_mpmmask
> env->mask = env->mpmmask = value;

Something like that, yes.  However, env->mask must be set based on env->priv, etc; you 
can't just assign the same as mpmmask.

Then you also need to update env->mask in a hook like you created in patch 11 to switch 
context (though I would call it from helper_mret and helper_sret directly, and not create 
a new call from tcg).  Then you need to call the hook as well on exception entry, reset, 
and vmstate_riscv_cpu.post_load.


r~

