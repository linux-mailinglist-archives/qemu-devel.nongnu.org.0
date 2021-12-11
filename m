Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BBA4714DA
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 18:09:40 +0100 (CET)
Received: from localhost ([::1]:51090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw5sR-00034L-Al
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 12:09:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mw5qM-0000zq-9a
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 12:07:30 -0500
Received: from [2607:f8b0:4864:20::52c] (port=34410
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mw5qK-0005AE-CP
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 12:07:29 -0500
Received: by mail-pg1-x52c.google.com with SMTP id d11so2052378pgl.1
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 09:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8Rj9Sq92k3aubaV1iKYaRoPZZryzuZJAfpxn/X4D7sE=;
 b=wUdzK1K1x6KFovrx6RaP+CuglsXTUvTMn3rguAQp0TbJq2IC+ziKWRBiYuahROws0i
 0NF1xJnIsHmIHqdPfuDriUBd8T+DwOm4ZFCgPKxUPzgwivQ0ZHMjMFGxrBMXP5DZIaIi
 P1nbZspkERMVhGQzPFQFpRdGhGcKlQJOSs4LxclW5c669NeTxeyJqW5TBHLGFgdid+V2
 bn5NCom7C1ENfVQsWCFvL1gZRq6pDCdtWVq6URfoG7MCxB8SAXuStm6HZtGeRP2yaeHE
 y57V1GjttkjRSsYQXJ6K0gAGB6TP69bkO4EO9uKL9cl1b8PJiLp1LiIhJu7VOsaVtkqk
 jUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8Rj9Sq92k3aubaV1iKYaRoPZZryzuZJAfpxn/X4D7sE=;
 b=X4gXYNsZAep7Gw5JTGuWzsUY43QB1eftHBdp35obIxciRJDOljJq3aLHmYijo0OL6A
 Zy36I51VB/1rzZAeFOt/NctzeNPuMow/5GsN9Ve741MMfWovPYuHQdkAKD6vKvq5dbTn
 uvRrD12ujjIfH74R45tMqTwmb0fccgOzkKo9XYD/iyZ+SLB0g9hh4fuT5FyaJacWKN3h
 z8gtJuIl8Nbifl7IUzXdTqCH5ENiz4AN+OSqkIG4Kg1XYBmAHqYmQvQK2DifPJWRlLAO
 0gQQiYvmX59OCXlYZzpicirhIgb4GKiSfQMKFYhzMR3lp13elwcX58QS5h18mtxUuTxg
 Qvqw==
X-Gm-Message-State: AOAM5329qdvXNkq6sPj4wuEaUvAQHSGPV+SyC8bMisNovqrZd+DgGSfK
 gpScmrxo1wZD5uRr1GygUqZmAg==
X-Google-Smtp-Source: ABdhPJwATST3g7ld5iAbS45p/AvlzxY44EYdVE4mjuIOa489MAWA6CtvU9NKy2dGQ72soVRWt5TXag==
X-Received: by 2002:a05:6a00:248b:b0:49f:9d7f:84e2 with SMTP id
 c11-20020a056a00248b00b0049f9d7f84e2mr24414901pfv.40.1639242446774; 
 Sat, 11 Dec 2021 09:07:26 -0800 (PST)
Received: from [172.20.1.20] (45-19-222-18.lightspeed.sntcca.sbcglobal.net.
 [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id g18sm7654263pfj.142.2021.12.11.09.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 09:07:26 -0800 (PST)
Subject: Re: [PATCH 4/4] target/ppc: move xscvqpdp to decodetree
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 Victor Colombo <victor.colombo@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
 <20211210141347.38603-5-victor.colombo@eldorado.org.br>
 <8c0ebcd9-6fe8-005e-b9ac-e6f8b10c6839@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3173f0c9-d602-1d2c-e054-7082c51f91d4@linaro.org>
Date: Sat, 11 Dec 2021 09:07:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8c0ebcd9-6fe8-005e-b9ac-e6f8b10c6839@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, groug@kaod.org, david@gibson.dropbear.id.au,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 8:19 AM, Matheus K. Ferst wrote:
> On 10/12/2021 11:13, Victor Colombo wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>>   target/ppc/fpu_helper.c             | 10 +++-------
>>   target/ppc/helper.h                 |  2 +-
>>   target/ppc/insn32.decode            |  4 ++++
>>   target/ppc/translate/vsx-impl.c.inc | 24 +++++++++++++-----------
>>   target/ppc/translate/vsx-ops.c.inc  |  1 -
>>   5 files changed, 21 insertions(+), 20 deletions(-)
> 
> <snip>
> 
>> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
>> index ab5cb21f13..f8669cae42 100644
>> --- a/target/ppc/translate/vsx-impl.c.inc
>> +++ b/target/ppc/translate/vsx-impl.c.inc
>> @@ -904,22 +904,24 @@ VSX_CMP(xvcmpgesp, 0x0C, 0x0A, 0, PPC2_VSX)
>>   VSX_CMP(xvcmpgtsp, 0x0C, 0x09, 0, PPC2_VSX)
>>   VSX_CMP(xvcmpnesp, 0x0C, 0x0B, 0, PPC2_VSX)
>> -static void gen_xscvqpdp(DisasContext *ctx)
>> +static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
>>   {
>> -    TCGv_i32 opc;
>> +    TCGv_i32 ro;
>>       TCGv_ptr xt, xb;
>> -    if (unlikely(!ctx->vsx_enabled)) {
>> -        gen_exception(ctx, POWERPC_EXCP_VSXU);
>> -        return;
>> -    }
>> -    opc = tcg_const_i32(ctx->opcode);
>> -    xt = gen_vsr_ptr(rD(ctx->opcode) + 32);
>> -    xb = gen_vsr_ptr(rB(ctx->opcode) + 32);
>> -    gen_helper_xscvqpdp(cpu_env, opc, xt, xb);
>> -    tcg_temp_free_i32(opc);
>> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> 
> It's actually ISA300. We'll send a v2 fixing this.

Yep.  With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


