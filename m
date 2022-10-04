Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D925F4A9F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:03:43 +0200 (CEST)
Received: from localhost ([::1]:44206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofp4o-0007ub-CT
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofozD-0004W5-2N
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 16:57:55 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofozB-0004kx-FL
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 16:57:54 -0400
Received: by mail-pf1-x42c.google.com with SMTP id v186so14154498pfv.11
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 13:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=ZSGix+CXe915kUcR4ZkEPmpsvfA2G7w9nVAv7owBwyk=;
 b=kjeXmX/4NiedPADGsM/xjmsod3jNXHxDv/gJw6lMrVh59i0dltXvw7lNFso6PeH0ma
 Fo6z+esdLPo2cb+zCtl94J2OqfWe/HfJdl613higIzKDWPRE7yB/OO5p9vfWTNJzjbGM
 6fVAkne1cKbvTV9PwqFpdnmlCFxqqg/xr9122+Q8ABdx7h/+6N8kglyXNLZ0HASK5p0L
 LTHyJiWvbxhwvwJsyCNoswpQGhz1NNk6NFEG1GbDS08q6khMbSg0P5K47ofnZ3hVL0dp
 RHSE/YSb1WUBtpsH2sAXDwYBZLpkwUX+fnqkxdZehR3unccW/WIEQyxcMCpiFobH4vyk
 RdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZSGix+CXe915kUcR4ZkEPmpsvfA2G7w9nVAv7owBwyk=;
 b=RsR5r81b1zfy9i3ErWwUDJvLjovvevywZVuZ2sRfbWZz2npj5mnItkrcipbgGsFKCq
 +jZMmEqyuLqMJE6PmS4xeb8E31McZQb+RDCvobgy7Wtdjoj5B+GLx0ll4pIS0u9112BZ
 4YKQeuPXgOn3VMmGyZwgWkn+CwUJ0O/uMQ48JHmJ93TfCbzBLQtaahgoflyMwimCIS5Y
 EGlYRtVEPqm1O1ldf3GgC5ThX3HyrL0CAN+wjfRBQa8cz3Jn4N1Yar0uQATe7gr5S7LS
 iiEZdUeiWv1YEerxNm2Z2e249FIDa6SsfRsFNlBNwcTvbzzYyT7me3Hqs5sjCuVGuj5f
 bmiQ==
X-Gm-Message-State: ACrzQf3ZhtpBwwo9tIHZ706cVGtoI4jycU3tw+e55q9ql1LUbHMEvG/D
 JpRhJbeN/KG1kqPUuIbQAf1Bbw==
X-Google-Smtp-Source: AMsMyM4cBpsz4B/Zx3/EODtgpWvUih22um4Zmv2Kn3eRxBna/3WdhrpkMhPthLCTwMnOV1FdpMkHmA==
X-Received: by 2002:a05:6a00:238c:b0:544:c42d:8a67 with SMTP id
 f12-20020a056a00238c00b00544c42d8a67mr29169724pfc.21.1664917071564; 
 Tue, 04 Oct 2022 13:57:51 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:526e:3326:a84e:e5e3?
 ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 w25-20020aa79559000000b00561c1101217sm2034708pfq.11.2022.10.04.13.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 13:57:50 -0700 (PDT)
Message-ID: <c91da352-f27a-d81d-59e9-43fabd604e8f@linaro.org>
Date: Tue, 4 Oct 2022 13:57:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 6/9] target/arm: Change gen_jmp* to work on
 displacements
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-7-richard.henderson@linaro.org>
 <CAFEAcA-hH=kqGfPQ3d6wJfo-ti_UvdMAs6pZx6A79QO5Mi-Q=w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-hH=kqGfPQ3d6wJfo-ti_UvdMAs6pZx6A79QO5Mi-Q=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/22 08:58, Peter Maydell wrote:
> On Fri, 30 Sept 2022 at 23:10, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/translate.c | 37 +++++++++++++++++++++----------------
>>   1 file changed, 21 insertions(+), 16 deletions(-)
> 
>> @@ -8368,7 +8372,8 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
>>       }
>>       tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
>>       store_cpu_field_constant(!s->thumb, thumb);
>> -    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
>> +    /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
>> +    gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);
> 
> Could we just calculate the offset of the jump target instead?
> read_pc() returns s->pc_curr + a constant, so the s->pc_curr cancels
> out anyway:
> 
>    (read_pc(s) & ~3) - s->pc_curr + a->imm
> ==
>      (pc_curr + (s->thumb ? 4 : 8) & ~3) - pc_curr + imm
> ==  pc_curr - pc_curr_low_bits - pc_curr + 4-or-8 + imm
> ==  imm + 4-or-8 - low_bits_of_pc
> 
> That's then more obviously not dependent on the absolute value
> of the PC.

Yes, this works:

-    gen_jmp(s, (read_pc(s) & ~3) + a->imm);

+    /* This jump is computed from an aligned PC: subtract off the low bits. */

+    gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));



r~

