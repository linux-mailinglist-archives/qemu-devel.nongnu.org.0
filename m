Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F54D43BA0F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:59:45 +0200 (CEST)
Received: from localhost ([::1]:35862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRfk-00051Y-BT
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfRX0-00019W-Rl
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:50:43 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfRWy-0006rX-EK
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:50:42 -0400
Received: by mail-pf1-x434.google.com with SMTP id 127so364636pfu.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=efz5T+FXlWklHNDV0czgoeSpHNuOu6A3231RgXnPDyo=;
 b=ov6yvp6+SKo5qpKX9Da4YVDZsjIJkFGkfjWoU8zpMwPQuxfjuyqt0rghoNQ7Bg3aFK
 rSpfAeSR7En7IvV+lb8ZEthv8XMOYC+Z2LObUH4smCEe3gfre8FEuOfckQnZtgXO8RDC
 /11fhURBiMz8O1p3qJ1ipwIx24ZaP1s2MJ9M7eGIXk7QQpQMSeQ/jyZFRmYg6AmIzX60
 KWOWZ+8+W7cKLK5Rrz1pJCWL1bh72N+UQUKW8icClksXLhpL0L0TVBPTkfeodamOBIDr
 lwRWCqj/WlcT7uCpznkkGGqtS3N4Uk1Lg9g92tjGPQInPCN8QL2GpKtFimbQVehcBXUf
 k3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=efz5T+FXlWklHNDV0czgoeSpHNuOu6A3231RgXnPDyo=;
 b=vqN+46JmjJva6NZiNkhznaDo2mTSD56/ytyrdt7LaU6iIAFlkYl/HKmqZqqqTsqEpD
 A/601ZWl1MdSdyzNO9ZB4yPLkeEk5BueuZ0BghV1XXjF76izmlmwfM05tcsbtuDjLZlQ
 1GUU1t8Pv/TqfV/0O8nAVzQoOnDSTZsJ6lEUkUMGEvRvrH159KOK2T1sJfhFVmbtOE0g
 9I3g1/2Zb7VeZWiCFIkmoMQgO4OY8KI088kTsZyKIxM+/JnN6YCncjJT55jwP4Fv6XOH
 J3ZmfT1gYb1tYd2UjNbEP8FKRwMFYaiSeejfF+458pxSBRYbdCCjoIEt0iO5huMHl2Pi
 kxcg==
X-Gm-Message-State: AOAM533k4t3G5PRn3rPDdMQIcrs8WsqP2IbbzoBaa2+6Oir3P8zPx884
 40zccjEQTnIaxI+V+OgN5JUKSw==
X-Google-Smtp-Source: ABdhPJzuXJ960PJzDk72N+WPfC0irfLD/LcDlOQlOo4cmZi+imgg4sg60z+JDr/fPpvaYsMi0TtasA==
X-Received: by 2002:aa7:808b:0:b0:47b:f51d:e238 with SMTP id
 v11-20020aa7808b000000b0047bf51de238mr13333371pff.43.1635274238876; 
 Tue, 26 Oct 2021 11:50:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id nv5sm1788634pjb.10.2021.10.26.11.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 11:50:38 -0700 (PDT)
Subject: Re: [PATCH v3 38/48] tcg/optimize: Split out fold_masks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-39-richard.henderson@linaro.org>
 <871r472203.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d090beac-69fb-ceb7-bb7c-16fd86cf00b3@linaro.org>
Date: Tue, 26 Oct 2021 11:50:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <871r472203.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: luis.pires@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 8:32 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Move all of the known-zero optimizations into the per-opcode
>> functions.  Use fold_masks when there is a possibility of the
>> result being determined, and simply set ctx->z_mask otherwise.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/optimize.c | 545 ++++++++++++++++++++++++++-----------------------
>>   1 file changed, 294 insertions(+), 251 deletions(-)
>>
>> diff --git a/tcg/optimize.c b/tcg/optimize.c
>> index 6c1cc3e635..f0086ee789 100644
>> --- a/tcg/optimize.c
>> +++ b/tcg/optimize.c
>> @@ -50,7 +50,8 @@ typedef struct OptContext {
>>       TCGTempSet temps_used;
>>   
>>       /* In flight values from optimization. */
>> -    uint64_t z_mask;
>> +    uint64_t a_mask;  /* mask bit is 0 iff value identical to first input */
>> +    uint64_t z_mask;  /* mask bit is 0 iff value bit is 0 */
> 
> nit: too much iff?

Eh.  It's one iff per description.
I tried to find another way to write it, but struggled.
Plus iff lets it fit on one line.  ;-)

>> +    const TCGOpDef *def = &tcg_op_defs[op->opc];
>> +    MemOpIdx oi = op->args[def->nb_oargs + def->nb_iargs];
>> +    MemOp mop = get_memop(oi);
>> +    int width = 8 << (mop & MO_SIZE);
> 
> Given we have a helper memop_size() it might be worth adding another
> memop_size_bits()?

Sure.
>> +static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
>> +{
>> +    /* We can't do any folding with a load, but we can record bits. */
>> +    switch (op->opc) {
>> +    CASE_OP_32_64(ld8u):
>> +        ctx->z_mask = 0xff;
>> +        break;
>> +    CASE_OP_32_64(ld16u):
>> +        ctx->z_mask = 0xffff;
>> +        break;
>> +    case INDEX_op_ld32u_i64:
>> +        ctx->z_mask = 0xffffffffu;
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>> +    return false;
> 
> Given we use MAKE_64BIT_MASK elsewhere we should do here as well.

Sure.


r~

