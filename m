Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49A6FB5FD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 19:35:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw4l4-0002Ky-KS; Mon, 08 May 2023 13:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw4kv-0002HT-7X
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:34:38 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw4ks-0005iM-JD
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:34:36 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-b9e6ec482b3so6392948276.3
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 10:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683567273; x=1686159273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2sAeg1EU6WtlPSw4uX/jkzQKtpZTY5VZi71T06y6p2g=;
 b=u28I6JZBbXL93RaAc5Yvlw/LcNZh7IcPxA+xFuU0rDC9ECDxGtrYUqial++fHYJXm2
 7ZE27+cfqdUVy96bc5RhmtY1FXGkoLhfA9fdqQz4iy+hIlHflEXaOnSVSgmFrKl8aWmB
 XAqcplzyvGq7iuSIbaL1VtzxBHv0KafcU7uAly7pFTFI2/E84dzmIkezyjuInUOTaTo/
 jd01tTX5B19r/ma+tn2WwFMzCg+cP2DN9ACBNTI0KtUSqO/9F4SImubO/YoF9YoX9P2o
 QZ4j46eWsL8xuEHgRkOhV/iH1dsRgdR2BHfKW0EVLfPCN3g/UKTrtbTtSjzyMkh1cLAO
 rZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683567273; x=1686159273;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2sAeg1EU6WtlPSw4uX/jkzQKtpZTY5VZi71T06y6p2g=;
 b=ahyhEG/ypTVCpuPefJRjRPcOPVVk/3asQ+h1roHHvVvkINVzLWyb6DKS3O+l7gfoY0
 19V6/KTKAv/AJFFrs/LQOBMT8N0ZM+00OG5+iG3JVhL6UEMqxyyk2bNcCK3DbKzGaxFY
 n++Hol3hVzTMDNq/53Ed5AaeuZJIRysYVYFkZzs/B+W6RFAZgBuf4l3vM6D2xVR7TmgU
 /Crn9IPcnZpzJhqWX/6bv9wxseFX5EATLVQuQtZhMq4WAKBm2hdZnD5loHuefgcDAqpa
 EDmmtoMKqQpEca+25pboCi4Fb+4PYzvZMwSBsEG98cqCoEsThkVy9UZaLdsWTtqnrPOY
 i87A==
X-Gm-Message-State: AC+VfDzh31dG14iu1L0e2Ht9xQdqUA9D9AOtLEO+vXibUGASP5E7CfzK
 SUB9O7tClQbTtzJL0JfcWCqh4g==
X-Google-Smtp-Source: ACHHUZ7PQx6sKOQnhBd2wz5chE0ffY+/4JRecuQPt/53he0P3GjLuedgONUGoU2J4drK9qnlRHGHNw==
X-Received: by 2002:a25:41c8:0:b0:b9d:bba9:b1ec with SMTP id
 o191-20020a2541c8000000b00b9dbba9b1ecmr10087038yba.62.1683567273323; 
 Mon, 08 May 2023 10:34:33 -0700 (PDT)
Received: from [192.168.110.227] ([172.58.139.115])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a252d09000000b00b8f51af1364sm2468470ybt.53.2023.05.08.10.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 10:34:32 -0700 (PDT)
Message-ID: <1798f4f8-9cf2-aa16-3f2e-9b0ef333ce36@linaro.org>
Date: Mon, 8 May 2023 18:34:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 51/57] tcg/sparc64: Use atom_and_align_for_opc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-52-richard.henderson@linaro.org>
 <CAFEAcA-HNQinkZvwCrqg9OQZcQvoL+LeBgfFhHqvWorjye0Xfg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-HNQinkZvwCrqg9OQZcQvoL+LeBgfFhHqvWorjye0Xfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/5/23 14:20, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/sparc64/tcg-target.c.inc | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
>> index bb23038529..4f9ec02b1f 100644
>> --- a/tcg/sparc64/tcg-target.c.inc
>> +++ b/tcg/sparc64/tcg-target.c.inc
>> @@ -1028,11 +1028,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>>   {
>>       TCGLabelQemuLdst *ldst = NULL;
>>       MemOp opc = get_memop(oi);
>> -    unsigned a_bits = get_alignment_bits(opc);
>> -    unsigned s_bits = opc & MO_SIZE;
>> +    MemOp s_bits = opc & MO_SIZE;
>> +    MemOp a_bits, atom_a, atom_u;
>>       unsigned a_mask;
>>
>>       /* We don't support unaligned accesses. */
>> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
>> +                                    MO_ATOM_IFALIGN, false);
>>       a_bits = MAX(a_bits, s_bits);
>>       a_mask = (1u << a_bits) - 1;
>>
>> --
> 
> No changes to HostAddress struct again?

Again, no use of alignment outside of prepare_host_addr.
No 128-bit operations, and all host operations aligned.


r~


