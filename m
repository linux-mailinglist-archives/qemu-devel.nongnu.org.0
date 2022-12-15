Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75064DE19
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 16:53:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5qWF-0001vb-Ei; Thu, 15 Dec 2022 10:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5qWD-0001vT-Tn
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 10:51:33 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5qWB-0001CG-Ub
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 10:51:33 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 82so4466732pgc.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 07:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hvnKpltIcpXmxi0wtUduj2AXHf7Itm5hJcXDce/vbBo=;
 b=O/erv1OqkGaL+fTXRtVOAl+/5AD6K0umAHm48NhlfJsZzzAGDvfaRe302tKwYtJf+N
 LsB/1c2l4+QXKyTFyG+6kV8LmKqr3QyQU5Y6zTBScxqNtUm+9vkZw5M7GE+zjsC+U7cu
 2ihNBB/DSKvQ2d2Bz7JFEt2Rd3oTFeD0OkI5fuMYSWrbsinZalvDiPqJ/XGpZu3jOqFh
 aHRdjUqkEtQc2SYZEZ0wOV37T1jAIj5zvw68RDOpfgqQwDjkLvBjvZpmVkJCFfvDVUDP
 rCam/Vbvd28YfVnPK6koBl7bpOtf1qCcHr3jajJJB1gjzRMJ/6iJA4ees4N2zc/XSzWz
 tvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hvnKpltIcpXmxi0wtUduj2AXHf7Itm5hJcXDce/vbBo=;
 b=7UlAsmJxOJp6uBKx/c0RxFaSVjGp0HRxMoHFMIxTiUBLviV1FiW1HqmzMozM/K6kKk
 ArDdeSeuIgrBOyAsYAnR8RGvyOqcYg4mv4mNmLFFNg8hAnOh926w1Bp7YXuTSIFpUPN8
 DL68sDYsf3k55BF8LH7aD9EIPs+26QYBOoNnxT/UyVyiT/wlWYLJqkW38hBP6GvKUhHW
 HmuAoeQStJCQLWoi21NDl3fcc/YrMBxDFOIumwaRvz7X2O7Yn2zx1e5EZz+opzk0HdTu
 XOVi27qXFvCU5YkeUx1V9MSPUpoKoDvFmefrD51TGWgV2kGofcz1qtKSkDqteiU01JjZ
 vm3w==
X-Gm-Message-State: ANoB5pk+3h6hMtdQPZtdlYmoJT0/nWCkYHkHcCDjpsyKqcCJ7h/vTj/1
 HgFujkhNJ4ohiA96/8cloQmyGA==
X-Google-Smtp-Source: AA0mqf4DtLKao3nRs06NKzK/kTesvlv7eWTZRbXChY0dK/mTamn6z3xHfZDNlIoEvQRMGe8zSGC5kw==
X-Received: by 2002:aa7:9486:0:b0:576:755a:4831 with SMTP id
 z6-20020aa79486000000b00576755a4831mr26278550pfk.9.1671119489317; 
 Thu, 15 Dec 2022 07:51:29 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a80f:54a1:edc3:6cb4?
 ([2602:47:d48c:8101:a80f:54a1:edc3:6cb4])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a625e07000000b0056ee49d6e95sm1887660pfb.86.2022.12.15.07.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 07:51:28 -0800 (PST)
Message-ID: <fac0ef00-d806-4041-0fe3-806d38acf544@linaro.org>
Date: Thu, 15 Dec 2022 07:51:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/8] tcg/loongarch64: Update tcg-insn-defs.c.inc
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 WANG Xuerui <git@xen0n.name>
Cc: qemu-devel@nongnu.org
References: <20221206044051.322543-1-richard.henderson@linaro.org>
 <20221206044051.322543-4-richard.henderson@linaro.org>
 <f6a305b3-692a-28fd-2587-a7e17b0fe363@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f6a305b3-692a-28fd-2587-a7e17b0fe363@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/14/22 23:50, Philippe Mathieu-Daudé wrote:
> On 6/12/22 05:40, Richard Henderson wrote:
>> Regenerate with ADDU16I included.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/loongarch64/tcg-insn-defs.c.inc | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/tcg/loongarch64/tcg-insn-defs.c.inc b/tcg/loongarch64/tcg-insn-defs.c.inc
>> index d162571856..c3c8669b4b 100644
>> --- a/tcg/loongarch64/tcg-insn-defs.c.inc
>> +++ b/tcg/loongarch64/tcg-insn-defs.c.inc
>> @@ -4,7 +4,7 @@
>>    *
>>    * This file is auto-generated by genqemutcgdefs from
>>    * https://github.com/loongson-community/loongarch-opcodes,
>> - * from commit 961f0c60f5b63e574d785995600c71ad5413fdc4.
> 
> Odd, addu16i.d is present since 3d057a6, so was already in 961f0c6.

It wasn't marked "qemu", so the generator didn't emit ...

>> @@ -74,6 +74,7 @@ typedef enum {
>>       OPC_ANDI = 0x03400000,
>>       OPC_ORI = 0x03800000,
>>       OPC_XORI = 0x03c00000,
>> +    OPC_ADDU16I_D = 0x10000000,
>>       OPC_LU12I_W = 0x14000000,
>>       OPC_CU32I_D = 0x16000000,
>>       OPC_PCADDU2I = 0x18000000,
>> @@ -710,6 +711,13 @@ tcg_out_opc_xori(TCGContext *s, TCGReg d, TCGReg j, uint32_t uk12)
>>       tcg_out32(s, encode_djuk12_insn(OPC_XORI, d, j, uk12));
>>   }
>> +/* Emits the `addu16i.d d, j, sk16` instruction.  */
>> +static void __attribute__((unused))
>> +tcg_out_opc_addu16i_d(TCGContext *s, TCGReg d, TCGReg j, int32_t sk16)
>> +{
>> +    tcg_out32(s, encode_djsk16_insn(OPC_ADDU16I_D, d, j, sk16));
>> +}

... all this.

r~


