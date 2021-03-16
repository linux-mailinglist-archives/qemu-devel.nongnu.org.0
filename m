Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D33B33D764
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:29:09 +0100 (CET)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBd6-0002oB-Mx
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMBbP-0001gv-48
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:27:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMBbM-0006Am-SS
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:27:22 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1679505wmy.5
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gt8Fk1tBNj56WaEDDeckbONVWOwEUkT0YYqzn8i93gE=;
 b=n4qodon44nNcqxSA+ydsZlli8RRPrXkrg2ZT/BfO9E+pIeYGVFxWZuJSHsaTeJ/O7b
 2e48BzlhvwyXKG3G83lEQdRh4EcKl5JPNEzx/No2kNWt2/aiKCtH08IMLErsPk3Hdt6m
 8Gb2sJTN1HBeYkG7SH/1Ky49/nJm4R+mAQoN4WOGuAb0iDjtT/mBGQ9nclVCaYBUvo7o
 aHU/klKJrFE5eRXMbSavbohpi5EV0nfNp8eciQzVHae/Mm09cVRGftLNXHfFu5Op5P4G
 CRBTc1ikIOkmmTwcJuPAvx0cAAgO29U8dAj4cy9wqxglNxtX7qCbJg0lDsiS/T19HkUU
 pqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gt8Fk1tBNj56WaEDDeckbONVWOwEUkT0YYqzn8i93gE=;
 b=hF21x6zXFoktCdbfY/YKxSY084DuPr5trJ3a5eTY8GPRkdC+JOfMVOlu2idQlaOqKS
 m89rh7omwSPqI05iM7T0XCo7z0qwiVSDKjMeS2t8dJKoqWFLMCYTC+EerByXgGqk24vj
 6N8C2WhuIgMbTq35HL+9WhyBgwzV+ydtG7BKxTkK7LKvEfu3wqOtYcvb/LNX41Y6IvpN
 YsZ5tVupRFNvanJWME5WT8U77lJdqkUQh+h0u2fIGKStrukEWSNqOJ5R50aOcgQWivdf
 Y9PQD3opVzwK1YCGvPueHNPXFqRGmRK1YNB2TlFx63GaOxhvtUD67KrwUZj9WPc/U0CA
 KCAQ==
X-Gm-Message-State: AOAM532p8d1PhAXsx7znCZaeun1qeMjALC8vMPYrzk/S0a2yEuAC0wOM
 0uzxqJUtAAo/gyVO7NsgnRg=
X-Google-Smtp-Source: ABdhPJx4vzd7ihVlhIQeKEsHqts0dPfZRvzWv58Mxxc8DN9WlCdqHH1hZc3hJTBZPlpepYdeUp/Iqw==
X-Received: by 2002:a1c:9849:: with SMTP id a70mr228119wme.48.1615908436513;
 Tue, 16 Mar 2021 08:27:16 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x6sm3297713wmj.32.2021.03.16.08.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:27:15 -0700 (PDT)
Subject: Re: [PATCH] target/mips/mxu: Rewrite D16MIN / D16MAX opcodes
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210315223745.2953548-1-f4bug@amsat.org>
 <CAFEAcA-+m-eADtYini-2Mscom-RiuvzG4cXndMcuSKR80O8dow@mail.gmail.com>
 <63e49cce-203a-6674-9b37-4b331f6ef477@amsat.org>
Message-ID: <74093fae-d128-b20c-84b2-e08153c60dff@amsat.org>
Date: Tue, 16 Mar 2021 16:27:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <63e49cce-203a-6674-9b37-4b331f6ef477@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Craig Janeczek <jancraig@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 3/16/21 1:03 PM, Philippe Mathieu-Daudé wrote:
> On 3/16/21 11:51 AM, Peter Maydell wrote:
>> On Mon, 15 Mar 2021 at 22:39, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> Coverity reported (CID 1450831) an array overrun in
>>> gen_mxu_D16MAX_D16MIN():
>>>
>>>   1103     } else if (unlikely((XRb == 0) || (XRa == 0))) {
>>>   ....
>>>   1112         if (opc == OPC_MXU_D16MAX) {
>>>   1113             tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
>>>   1114         } else {
>>>   1115             tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
>>>   1116         }
>>>
>>>>>> Overrunning array "mxu_gpr" of 15 8-byte elements at element
>>>     index 4294967295 (byte offset 34359738367) using index "XRa - 1U"
>>>     (which evaluates to 4294967295).
>>>
>>> Because we check if 'XRa == 0' then access 'XRa - 1' in array.
>>>
>>> I figured it could be easier to rewrite this function to something
>>> simpler rather than trying to understand it.
>>
>> This seems to drop half of the optimised cases the old
>> code had. Wouldn't it be simpler just to fix the bugs
>> in the conditions?

Besides your other simpler patch fixing Coverity, I've been
thinking at your comment during lunch. IMHO it would be
easier (or maintainance to keep TCG frontends simple
enough, and move the optimizations to common TCG, so all
backends could benefit of them.

MIPS frontend might not be the best example because of the
hard-wired $zero register, which is harder to defer to
common TCG for optimization.

>> That is:
>>
>>>      if (unlikely(pad != 0)) {
>>>          /* opcode padding incorrect -> do nothing */
>>> -    } else if (unlikely(XRc == 0)) {
>>> -        /* destination is zero register -> do nothing */
>>
>> This should be "XRa == 0"
>>
>>> -    } else if (unlikely((XRb == 0) && (XRa == 0))) {
>>> -        /* both operands zero registers -> just set destination to zero */
>>
>> This should be "XRb == 0 && XRc == 0"
>>
>>> -        tcg_gen_movi_i32(mxu_gpr[XRc - 1], 0);
>>
>> This should set mxu_gpr[XRa - 1]
>>
>>> -    } else if (unlikely((XRb == 0) || (XRa == 0))) {
>>
>> This should be "XRb == 0 || XRc == 0"
>>
>> And everything else in the function looks OK to me.
> 
> If you have the changes clear, do you mind sending a patch?
> 
> Thanks,
> 
> Phil.
> 

