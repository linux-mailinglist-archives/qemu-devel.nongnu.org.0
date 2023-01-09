Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D590661C25
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 02:56:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEhOG-00072N-1G; Sun, 08 Jan 2023 20:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhOE-000729-8C
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:55:54 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEhOC-0007e2-I5
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 20:55:53 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so11289832pjq.1
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 17:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=psfbrZsoxIbulYD67eHrpa9HbBjEZa9GhFh8vxKqOPA=;
 b=IUrBbROi7Nr6ACChzbnH+xBhenOpJZPHg0cLQeQJ1kij2qovrQv9gccjmYHNp1baEV
 4eR1qX/p8RfgSBtdZUTOesbP0u8uhBaagZ9qHohqDdJKxy0CgmuOYKeTY0Maj/fhfy6l
 y2imzJpujYkdVI7UlC1VEqaUFXTb9ySqX3QeOschlz5/+m6/mMY0eBAbXK1ciAL3Wvgo
 7xRy05v0xtLbuOlGD/HRo0dnB5SoPtD3YwbynyrZUHLBbwxJENLPAKztRNQcnd8+Mq1w
 kQexJJYMOFB6p2SahaZ7oui3ZGLYJb3WPKx5VDQY+FoOImQRJC27uxZsUpr/MITf1h+3
 FKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=psfbrZsoxIbulYD67eHrpa9HbBjEZa9GhFh8vxKqOPA=;
 b=GRrzhEVcoaFMK7llfD202huUNTfxcMFpXAxz83gVxY+eplQSop08lvuO0aP0QTMUMV
 DzrSCXcEJLOpOsv07NGclrPDpSs+cIl13/KDFQZZl0Udq+tkXN8X8RbLQbWu/n/8jXau
 24qlFU7MF6XdZmVl9CsX0hfWL11ThOHynVYNZYLn0DQACAqNS9fm/rQ2uH4DFoZSEcWp
 Glwfjj0siSwOm/sJWiMhadNo89QkeBf3n2LBrJOWHV/nGs4xhbuaGpt0XD/SWz320eGO
 tr0+Ux7k12vl1X2iaElk2qrChFfttypTZHp4PzW5EBbvZ1M1rN8AjSbOUOsekGASh84r
 sB6w==
X-Gm-Message-State: AFqh2kp5fKlmNo9lm2tUs3a8dlixaZCqR4PH9O/QlZh9M7uQfA31fwQw
 uAqDeDhsoA3YkJMY2Iuy1FiPTA==
X-Google-Smtp-Source: AMrXdXsdW0ATMjZnWU3W3f6m1TKvFs9rvwZODjdT+LZg4fOf/+p0y0gyAJgXpUgRtU+YdCBmLRVBXw==
X-Received: by 2002:a05:6a20:4f87:b0:b5:b459:dd74 with SMTP id
 gh7-20020a056a204f8700b000b5b459dd74mr4459266pzb.41.1673229350946; 
 Sun, 08 Jan 2023 17:55:50 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a6540cb000000b0046ff3634a78sm4095193pgp.71.2023.01.08.17.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 17:55:50 -0800 (PST)
Message-ID: <94c9df50-7eb2-4370-a968-47139c2bd393@linaro.org>
Date: Sun, 8 Jan 2023 17:55:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/4] target/m68k: fix FPSR quotient byte for frem
 instruction
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20230104134554.138012-1-mark.cave-ayland@ilande.co.uk>
 <20230104134554.138012-5-mark.cave-ayland@ilande.co.uk>
 <51da8243-885d-a98e-deb6-746383da1d7d@linaro.org>
 <312b1b75-e74e-c107-ec98-c05476e9125a@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <312b1b75-e74e-c107-ec98-c05476e9125a@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 1/7/23 15:00, Mark Cave-Ayland wrote:
>>>   void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
>>>   {
>>> +    float_status fp_status;
>>> +    FPReg fp_quot;
>>>       uint32_t quotient;
>>>       int sign;
>>> +    /* Calculate quotient directly using round to nearest mode */
>>> +    set_float_rounding_mode(float_round_nearest_even, &fp_status);
>>> +    set_floatx80_rounding_precision(
>>> +        get_floatx80_rounding_precision(&env->fp_status), &fp_status);
>>> +    fp_quot.d = floatx80_div(val1->d, val0->d, &fp_status);
>>> +
>>>       res->d = floatx80_rem(val1->d, val0->d, &env->fp_status);
>>> -    if (floatx80_is_any_nan(res->d)) {
>>> +    if (floatx80_is_any_nan(fp_quot.d)) {
>>
>> I think you should leave this line unchanged, and move the div afterward.
>> I also think you should completely initialize the local fp_status = { }.
>>
>> With that,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I can leave the floatx80_is_any_nan() line above unchanged and also initialise the local 
> fp_status, however the floatx80_div() has to happen before floatx80_rem() function is 
> called. This is because the fmod and frem instructions write the result back to one of the 
> input registers, which then causes the subsequent floatx80_div() to return an incorrect 
> result.
> 
> Would just these 2 changes be enough to keep your R-B tag for a v3?

Mm.  I suppose so.  Otherwise, compute into a local variable:

     floatx80 fp_rem = floatx80_rem(val1->d, val0->d, &env->fp_status);
     if (!floatx80_is_any_nan(fp_rem)) {
         float_status scratch = env->fp_status;
         floatx80 fp_quot;
         uint32_t int_quot;
         int sign;

         set_float_rounding_mode(float_round_nearest_even, &scratch);
         fp_quot = floatx80_div(val1->d, val0->d, &scratch);

         sign = ...
         int_quot = ...
         ...
     }
     res->d = fp_rem;

?


r~

