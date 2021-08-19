Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243823F1F06
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:25:30 +0200 (CEST)
Received: from localhost ([::1]:49066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGlnF-0000wL-8D
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGllj-00007M-JO
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:23:55 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGlli-0006lr-29
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:23:55 -0400
Received: by mail-pg1-x52f.google.com with SMTP id x4so6531036pgh.1
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j//RjTQbkeBSOINmYmfcPDhUgodB/xOJE6fnMGEK2sg=;
 b=HkQrxjrytVihoP5Rzt5TVrtHUA6nC0yuY9LRsAkNiYixdhMs0mz6kKFt9Ayt4vkc1U
 yhpoq/wLe7S0ftGD9yuGPm2sjuUyX3z0bV5Lb/97a3SxUH7ncepjba46rcXiL+8NjKNi
 sGe1IzjqID/ALcnS3PDp80h3LODMf85w20iUARFNrhxgsJF3hTBa69PIrsOsqVp7o2xh
 x3bHsRyn3D9FVQ8tQ/LAVqW7PJreLRzL/JiNXx9gtDIB0iB9C6ah7aDB5/fHxSUFtN2P
 ppWyQoCxwgaVMkbbdzqn792QlaOKq80Z6CHF+nUs8qDYnV424rALLzfTzOnEVzmQBT+y
 EXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j//RjTQbkeBSOINmYmfcPDhUgodB/xOJE6fnMGEK2sg=;
 b=ge2Onie6YXOjX5+TH1krTTK63oC5Cxg9Ql20vHesNWcmok6pId6lUhmZAwKihSWaEE
 jFz+gHcDv8Nu7NzkYwlelgJu7qAsOxzKEf6eftBgsMOabTZr1PV99veAYOFTptbMpMpe
 zm6jgoUqxeAlgSCnxdhj5OdRCXSCU3HEjK2Im7LvRW3W1HAu6kTLph5/NHzU0Hj/wP1N
 Z45+28x/asw2DtD8ZYJZbASNS43ayqUohG7wW7WWVfjT/tBiXnXTEBjovpGJW40t3J6W
 rsZS38v9D+fZ6P16uKt70sUlm4EOh3dZ+Yu7nuVX4kzBc0PCvrzn9amtXIffRhF+gVd0
 gX8A==
X-Gm-Message-State: AOAM532Zq8z1Cp8NV6HygAL61b7JFusz/SCRjQBxXigDRxRXhTlhDm7J
 K/7tT9JdlpFRq9fYRffq6Ggauw==
X-Google-Smtp-Source: ABdhPJy1WZWxyNLqCIW/SNNg04WXxtHIh+BMFVVjlRbaRQhJ0F6TTUo12KsVsgnGiTRsj2UiITIqGw==
X-Received: by 2002:a65:5ac8:: with SMTP id d8mr14778732pgt.34.1629393832288; 
 Thu, 19 Aug 2021 10:23:52 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id c16sm4083387pfb.196.2021.08.19.10.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 10:23:51 -0700 (PDT)
Subject: Re: [PATCH v3 02/21] target/riscv: Clean up division helpers
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210819090502.428068-1-richard.henderson@linaro.org>
 <20210819090502.428068-3-richard.henderson@linaro.org>
 <CAEUhbmV7mHc_MWPvhNG0Lh_vtjU-zOAABXGPkOm0YJUT5epSKQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <00ab6885-12b6-9c1a-cb7b-b6df770eabd4@linaro.org>
Date: Thu, 19 Aug 2021 07:23:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmV7mHc_MWPvhNG0Lh_vtjU-zOAABXGPkOm0YJUT5epSKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 1:00 AM, Bin Meng wrote:
>>   static void gen_rem(TCGv ret, TCGv source1, TCGv source2)
>>   {
>> -    TCGv cond1, cond2, zeroreg, resultopt1;
>> +    TCGv temp1, temp2, zero, one, mone, min;
>>
>> -    cond1 = tcg_temp_new();
>> -    cond2 = tcg_temp_new();
>> -    zeroreg = tcg_constant_tl(0);
>> -    resultopt1 = tcg_temp_new();
>> +    temp1 = tcg_temp_new();
>> +    temp2 = tcg_temp_new();
>> +    zero = tcg_constant_tl(0);
>> +    one = tcg_constant_tl(1);
>> +    mone = tcg_constant_tl(-1);
>> +    min = tcg_constant_tl(1ull << (TARGET_LONG_BITS - 1));
>>
>> -    tcg_gen_movi_tl(resultopt1, 1L);
>> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond2, source2, (target_ulong)-1);
>> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source1,
>> -                        (target_ulong)1 << (TARGET_LONG_BITS - 1));
>> -    tcg_gen_and_tl(cond2, cond1, cond2); /* cond1 = overflow */
>> -    tcg_gen_setcondi_tl(TCG_COND_EQ, cond1, source2, 0); /* cond2 = div 0 */
>> -    /* if overflow or div by zero, set source2 to 1, else don't change */
>> -    tcg_gen_or_tl(cond2, cond1, cond2);
>> -    tcg_gen_movcond_tl(TCG_COND_EQ, source2, cond2, zeroreg, source2,
>> -            resultopt1);
>> -    tcg_gen_rem_tl(resultopt1, source1, source2);
>> -    /* if div by zero, just return the original dividend */
>> -    tcg_gen_movcond_tl(TCG_COND_EQ, ret, cond1, zeroreg, resultopt1,
>> -            source1);
>> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp1, source1, min);
>> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, mone);
>> +    tcg_gen_and_tl(temp1, temp1, temp2); /* temp1 = overflow */
>> +    tcg_gen_setcond_tl(TCG_COND_EQ, temp2, source2, zero); /* temp2 = div0 */
>> +    tcg_gen_or_tl(temp2, temp2, temp1);  /* temp2 = overflow | div0 */
>>
>> -    tcg_temp_free(cond1);
>> -    tcg_temp_free(cond2);
>> -    tcg_temp_free(resultopt1);
>> +    /*
>> +     * if overflow or div by zero, set temp2 to 1, else source2
>> +     * this automatically takes care of returning the original
>> +     * dividend for div by zero.
>> +     */
>> +    tcg_gen_movcond_tl(TCG_COND_NE, temp2, temp2, zero, one, source2);
> 
> What about the overflow case? The return value should be 0.

Hmm.  I see that in the table, yes, but I don't see that the original code got that 
correct either.  I'll send a follow-up patch.

r~

