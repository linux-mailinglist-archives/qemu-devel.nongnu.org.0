Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B59672469
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 18:05:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIBro-0001SY-FU; Wed, 18 Jan 2023 12:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIBrU-0001Pl-Vt
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 12:04:33 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIBrT-0004uN-D4
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 12:04:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso2047679wmq.5
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 09:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GhIDJla6/nA+BKdGW5qzvhtWK2xWORu3BQcD1wwO0es=;
 b=d+09P83IkLs9WjOxmj91WCRYPvd2D6SiN3Ubk5ptU2wWit26TxWwILBUm+U+jD2o82
 DbHUz9MGUOtUE5hHHiO6BlWjzaPTRqpi1pClmF9pk5xaGuU5kpyciQPPpBjhaKgPKDks
 3H5dbX6shxF0K0P9MVA+1EYpYWKtd5+OCYriMXJFlhjPZoTLNJtV9OPmg8kUWih73LJk
 1RZTnHFoK77u6Ge8Lwhvdtaij7I3+1jo4hw+lmANurHWUa0NVmW8by+r0KAGmFWI8b3x
 LWkCr0YQQyMVYq9LBm9NSDPXhYryhXu3JFHzECVGzgFRXKW3khMuEMsiiEH/wTwlp0bR
 EGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GhIDJla6/nA+BKdGW5qzvhtWK2xWORu3BQcD1wwO0es=;
 b=XVXI1SxLOEHvsYiXBAsLV0FcgLhphYXRgWt2oRZIcpWqbzXyHqX7itUM7KOhXsrvpN
 Ha4fEqDQ4OGfOidA6XlOnDA9ud9Mqz9pUQIGL1aXRLH3U6SFEdAj2BjBL6jGfdnmPV4K
 TMHcOC0UyW8nmmmFFn7g6K2a1hjG8mXmM+LdW/okmwB/owHr03xiYKGUOxRJxmUe4XL2
 eAIf/VJyPVNd92a5PozQ7Dv0jtj99GOAWc8k7EM2T1vOQHlJ3W99jPq7d+0zpJYfGJn9
 OyyfMo4NLtzup+aCOk6D7Frj1KDP1V8yDpB0gpqQNqd0TNrrUe7V75T6V6/zuqW6f+LT
 DniA==
X-Gm-Message-State: AFqh2kpu1IPq9l4iL1xyYZVEgx2kfHLihbk+Eu4OJL4GAYrEwrjU59yS
 ZoCXKtL3NzPGnEsmOjljzSf5Iw==
X-Google-Smtp-Source: AMrXdXtdGVU8envdYG2TAXpMYp+bfMGnNfXVZvhx8/UfRWX7bOMNcpAgCTXPTrJ+LPy/vD7nRsYhYg==
X-Received: by 2002:a05:600c:714:b0:3d9:ed30:79d with SMTP id
 i20-20020a05600c071400b003d9ed30079dmr7455171wmn.18.1674061469522; 
 Wed, 18 Jan 2023 09:04:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c074a00b003db0ee277b2sm2324070wmn.5.2023.01.18.09.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 09:04:29 -0800 (PST)
Message-ID: <5f6c99eb-fca8-2270-fa4d-758e548b05b1@linaro.org>
Date: Wed, 18 Jan 2023 18:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/4] bulk: Coding style fixes
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Gan Qixin <ganqixin@huawei.com>
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230111083909.42624-1-philmd@linaro.org>
 <20230111083909.42624-3-philmd@linaro.org>
 <fd06e139-c6e8-e978-c0ed-3e9aca258f19@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fd06e139-c6e8-e978-c0ed-3e9aca258f19@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 18/1/23 17:09, Thomas Huth wrote:
> On 11/01/2023 09.39, Philippe Mathieu-Daudé wrote:
>> Fix the following checkpatch.pl violation on lines using the
>> TARGET_FMT_plx definition to avoid:
>>
>>    WARNING: line over 80 characters
> 
> It's just a warning...
> 
>> @@ -420,8 +421,9 @@ static int get_segment_6xx_tlb(CPUPPCState *env, 
>> mmu_ctx_t *ctx,
>>                   hwaddr curaddr;
>>                   uint32_t a0, a1, a2, a3;
>> -                qemu_log("Page table: " TARGET_FMT_plx " len " 
>> TARGET_FMT_plx
>> -                         "\n", ppc_hash32_hpt_base(cpu),
>> +                qemu_log("Page table: " TARGET_FMT_plx
>> +                         " len " TARGET_FMT_plx "\n",
>> +                         ppc_hash32_hpt_base(cpu),
>>                            ppc_hash32_hpt_mask(cpu) + 0x80);
>>                   for (curaddr = ppc_hash32_hpt_base(cpu);
>>                        curaddr < (ppc_hash32_hpt_base(cpu)
> 
> ... and in cases like this, I'd really prefer the original line.
> 
> I think it would be better to just fix it if checkpatch.pl really throws 
> an ERROR instead of a WARNING.

See this thread and its references ¯\_(ツ)_/¯
https://lore.kernel.org/qemu-devel/CAFEAcA-yMZjJW=AJm=XLbrub1D-8iX0OKE78V_TzQmfC2RdXyw@mail.gmail.com/


