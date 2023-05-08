Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A786FB5FB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 19:34:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw4kO-0001ez-OC; Mon, 08 May 2023 13:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw4kM-0001dt-Fr
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:34:02 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw4kA-0005cl-Bg
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:34:02 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-55a5e0f5b1aso45227077b3.0
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683567229; x=1686159229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TyGWmb4jftapJkM1KAGRfZBkads5mtllx4kmPYXMNoI=;
 b=UO3bMgnJvVg6A4TLeO6qJq8kPf609tu+bVPr2KMJmpP6ER+su66MFY4/Gv6mVRl3a5
 A5qLtfVBvxUrRB5scc/kjD2FOf5My6ga/OBVKSKc5na5Ie/0u+xagtApSrc/rbn757H9
 g+h73v0Q9IZ9GWtNrPVDJNhxdMcIM593tvbUerdckyvKOIHGpj66pj83JAz+tYra11Ln
 GpkE9L14FiNzpaWFFwgjQeP37Spyhb/2NDs3Loh9g4L4m8pfoOi+kYVVLh73fe15TrwS
 JZxepZLLf0iKWJRyDGItK6IWH4nrf15mHqoKaRb+K41cmW6H4bcijpGMJ77dvaqjvN5f
 Zj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683567229; x=1686159229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TyGWmb4jftapJkM1KAGRfZBkads5mtllx4kmPYXMNoI=;
 b=QG822k3vpEMeiy1evzMnjI57rR56VotWrmgGkURNqc+Hj2xDOvugD4BP7BxFeIg2bl
 aq3qE8BEVj+QFOlKFUvPrczqEEJfU1byTxmIzH5vUfdYXOYfLdnyIeZFGrB0EjtdW71v
 3l+jkpiRP+Izd3thGsf6jtxypiPR2MsWekMqbKk5uCwUBAQhAHdfrNyaC6e3JVQwUef1
 W+eIJVjN5O2cdRl5bOFdLY3jftx6Y/FoKLuWVQ+sWnTSG9BQU0jbLGq+G47X4NDD0fwB
 jdbcaxoC8Y2cVzfqSuP3KIJYIrxnDd/EgTAm2YVTbwcKDDUoCDG8ryRNQX7e074Uw6wE
 UZZg==
X-Gm-Message-State: AC+VfDz/5qS38gS0NAwnhAkY3mqyc27UsPIUh+VBVccvRS/efEHuSSZH
 /JKkmejPm7idouvPJOU4vn67wQ==
X-Google-Smtp-Source: ACHHUZ6mrbNuREfEY3b+A3WSl6dwXw7K+4Ju+zzjthBZb6GQVsLdCdbKLYusMDclgfkYgzLK+Em1Kw==
X-Received: by 2002:a0d:c341:0:b0:556:bfac:ad12 with SMTP id
 f62-20020a0dc341000000b00556bfacad12mr4881101ywd.16.1683567229368; 
 Mon, 08 May 2023 10:33:49 -0700 (PDT)
Received: from [192.168.110.227] ([172.58.139.115])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a25a2d0000000b00b9e6f1f9c76sm2407808ybn.29.2023.05.08.10.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 10:33:48 -0700 (PDT)
Message-ID: <1e19b569-fbc1-89f2-3616-bc319d3c63e7@linaro.org>
Date: Mon, 8 May 2023 18:33:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 49/57] tcg/riscv: Use atom_and_align_for_opc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-50-richard.henderson@linaro.org>
 <CAFEAcA9PQ2YpJLZsJZoZ516r3XCsii2zeRi+OPgGc_OOwNu1qA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9PQ2YpJLZsJZoZ516r3XCsii2zeRi+OPgGc_OOwNu1qA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/5/23 14:19, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/riscv/tcg-target.c.inc | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
>> index 37870c89fc..4dd33c73e8 100644
>> --- a/tcg/riscv/tcg-target.c.inc
>> +++ b/tcg/riscv/tcg-target.c.inc
>> @@ -910,8 +910,12 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
>>   {
>>       TCGLabelQemuLdst *ldst = NULL;
>>       MemOp opc = get_memop(oi);
>> -    unsigned a_bits = get_alignment_bits(opc);
>> -    unsigned a_mask = (1u << a_bits) - 1;
>> +    MemOp a_bits, atom_a, atom_u;
>> +    unsigned a_mask;
>> +
>> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
>> +                                    MO_ATOM_IFALIGN, false);
>> +    a_mask = (1u << a_bits) - 1;
>>
>>   #ifdef CONFIG_SOFTMMU
>>       unsigned s_bits = opc & MO_SIZE;
> 
> Same remark as for ppc.

Because the alignment was not required outside of prepare_host_addr.
RISC-V does not have 128-bit memory operations of any kind.


r~


