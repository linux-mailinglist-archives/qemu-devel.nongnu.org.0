Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83D6FC91E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:35:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOQo-0000i1-Qm; Tue, 09 May 2023 10:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOQY-0000bu-Cb
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:34:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOQW-0007G6-KY
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:34:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-306f9df5269so3920289f8f.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642890; x=1686234890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ReCPLA1EOBdJoeJw4nq9AIxw9vdM7f4bdm8v5Cas8T8=;
 b=Z2PDryeiX086oPYPKZ2YnNHvl8Fdzk9pW0kQ3p8eJVEXowlyvnRq/CGoSVsICn0zGu
 XPF3CjKzs1bLWP26Th/1yLkIpxQ3Sb29Ri+kLke5PVYfq7OfVQgynbeOCKN77MUsHPY5
 JVxM+1EDkf6dpgkmCwZIWja4vczxjDPxC7nIdrUZkY9++utUkB8IWuU9isxg/HrXHBLG
 XSSalCwRtslpKicc52BgvscBo78KL8xAeqH7BG+4ZfteXSluplR7smJ207Q5ZtYTTk5s
 PoM2qvIaberA7ZpxZ7Hy06SQIWRX2AIPv8kWI2RRYIikpUdb8lukcuILIFBL4S8mjBoo
 dz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642890; x=1686234890;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ReCPLA1EOBdJoeJw4nq9AIxw9vdM7f4bdm8v5Cas8T8=;
 b=Axqlqsc4E4pWp2G9UcP4rmo+8t/bxp/eiBKVDVaQ0FVdbKJR9X7LKn2UN08oYNzdcX
 mTdWW3L/CjtNSNhhaVGFrQ9A0mF4Vh0e0tmZVZSGH3YeZCBLiwZgNWUTDWFppTrLA6tQ
 eOAK6v+V6ZyeCOYgiKzIVR2DhhDLeUA2ly/jY+CzGDHUJR4nKTj81i72zDXldX8Vq+qq
 OLwpJwNY+eTGc0deeXmfzq9sflHQ/G0KVU8s7UZoHrzylmm37miM7jGpqUSMNZGeOsvb
 U3qD07Zs7dhhppXxj8nGCOi5x90ZajcFGZAswvKnOwWjdnPAQGbJOAHv92PqZjxq+L4f
 XqkA==
X-Gm-Message-State: AC+VfDyrVslouzbGxwtBtMEDQS5PGVT11tRVEVhEJanW2h/Rb6vA0lnm
 FxTgBWYFIKEn1oYKcMau1mKSuw==
X-Google-Smtp-Source: ACHHUZ6vMfJWAZ3ih3mo9/+liNFDUmjFJVADm93XA8StE7gMfiPC52wYtm0yrqdUGxrizmi/ShanWw==
X-Received: by 2002:a5d:534e:0:b0:306:791:24a9 with SMTP id
 t14-20020a5d534e000000b00306079124a9mr9343952wrv.0.1683642890512; 
 Tue, 09 May 2023 07:34:50 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y12-20020adffa4c000000b00306281cfa59sm14575279wrr.47.2023.05.09.07.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:34:50 -0700 (PDT)
Message-ID: <3fb8f451-b6fa-ac19-18f0-436c5bd0c732@linaro.org>
Date: Tue, 9 May 2023 15:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 30/57] tcg/sparc64: Allocate %g2 as a third temporary
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-31-richard.henderson@linaro.org>
 <CAFEAcA9dOpZUeCnkHxmSAPTs20ZuUW++kFEtp2icmmST=yGPvA@mail.gmail.com>
 <58a0667e-7387-4231-85d4-548a39c8064f@linaro.org>
 <CAFEAcA8h-+U8MW1b1QfyoX=vjZdMLi4EcjgsARNb4AKpn35sgw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8h-+U8MW1b1QfyoX=vjZdMLi4EcjgsARNb4AKpn35sgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/9/23 10:24, Peter Maydell wrote:
> On Mon, 8 May 2023 at 16:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/5/23 13:19, Peter Maydell wrote:
>>> On Wed, 3 May 2023 at 08:17, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>    tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
>>>>    1 file changed, 7 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
>>>> index e997db2645..64464ab363 100644
>>>> --- a/tcg/sparc64/tcg-target.c.inc
>>>> +++ b/tcg/sparc64/tcg-target.c.inc
>>>> @@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
>>>>    #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
>>>>    #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
>>>>
>>>> -/* Define some temporary registers.  T2 is used for constant generation.  */
>>>> +/* Define some temporary registers.  T3 is used for constant generation.  */
>>>>    #define TCG_REG_T1  TCG_REG_G1
>>>> -#define TCG_REG_T2  TCG_REG_O7
>>>> +#define TCG_REG_T2  TCG_REG_G2
>>>> +#define TCG_REG_T3  TCG_REG_O7
>>>>
>>>>    #ifndef CONFIG_SOFTMMU
>>>>    # define TCG_GUEST_BASE_REG TCG_REG_I5
>>>> @@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
>>>>        TCG_REG_I4,
>>>>        TCG_REG_I5,
>>>>
>>>> -    TCG_REG_G2,
>>>>        TCG_REG_G3,
>>>>        TCG_REG_G4,
>>>>        TCG_REG_G5,
>>>> @@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>>>>    static void tcg_out_movi(TCGContext *s, TCGType type,
>>>>                             TCGReg ret, tcg_target_long arg)
>>>>    {
>>>> -    tcg_debug_assert(ret != TCG_REG_T2);
>>>> -    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
>>>> +    tcg_debug_assert(ret != TCG_REG_T3);
>>>> +    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
>>>>    }
>>>
>>> Why do we need to change this usage of TCG_REG_T2 but not
>>> any of the others ?
>>
>> To match the comment above.
> 
> To expand, what I mean is "when I'm reviewing this patch, what
> do I need to know in order to know whether any particular
> instance of TCG_REG_T2 should be changed to _T3 or not?".
> All the sites where we *don't* change T2 to T3 are now
> using a different register, so there is presumably some
> logic for how we tell whether that's safe or not. The
> "no behaviour change" option would be to change all of them.

Oh.  Well, we could change none of them, including the comment, and also be correct. 
There is no conflict anywhere.

Only with patch 34 ("Use standard slow path for softmmu") do we first see all three temps 
in use at the same time.  Moreover, when I wrote this patch I thought there would in fact 
be a conflict with the use of tcg_out_movi within the slow path patch.  Then I found I 
needed to split out tcg_out_movi_s32 (patch 33) so that I could avoid the assert altogether.

Clearer?  Or not?


r~

