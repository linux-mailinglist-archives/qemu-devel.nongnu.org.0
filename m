Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A833D742
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:24:29 +0100 (CET)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBYa-0008CY-3C
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMBVg-0005zb-MR
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:21:28 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:46408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMBVe-0002yS-Sw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:21:28 -0400
Received: by mail-ot1-x335.google.com with SMTP id r24so8740098otq.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GOUSavQGkkdtgLVLoMLkANVx3vrV9LENTV78ejHytkA=;
 b=XECXE+ObBDCi8N5+xevGktYaIpaRVPuj52QcoGWN8rjDyWD93kTRe39ZDxu/nQ8LQ8
 P9zvaGIzH6AC+RJYKu91gQrIxH3OwsejkW6w5M8CAUQV1rCD6rvI8xqYNfAF9oIPpFDH
 YuD+qlGYPhqNXKWF+BCco1+kwT+YQebPEWzdVnO4SonmSzkBtxTAgGgO3gWeK2iS86oY
 RRCg2XYV3hIN3C8Mc5n38Jn55nWCKyp00HzsucA9VnAoxnhGRXwfC6WiLoo0E5ZGBzPE
 POIEsvqBX/Z36740JbL1AXRXTtkqVJMxIWoc4m6gWWbDZuWIj5hRvOLvYU8xIXjXIKSG
 Bpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GOUSavQGkkdtgLVLoMLkANVx3vrV9LENTV78ejHytkA=;
 b=JLWNKksWpIWAuJ+J/+37NJr1yf4cUr0k+Ua++QMwwVSHoAU8bSwUcK6eRwrGixIqeA
 R/NCugxZ0ubxfm6h0hSfC4UenxRNnWD6I7UKq2iIwW7JQpAdlGlDhg6hTdvUwc+zUmAM
 ED4ohTmSN9A+07aIcwUg4+MmoubrzGm36EJ5FoL9XEn1MOLDh5SY3ZOUSAVRRzhO7x7d
 G/GXzyaeC7gLc8djQeJ/hIBfl8V4tdRnis/KXpS8dD5duUeiC0e52nLU/NL/AKfdcBGz
 c+fpFoXMNhD6emddgbkuEUCu1uqn+rQNYkQ/eUxI6GrvPwaocGD6XRMxn4ERMoCA22DH
 xD/A==
X-Gm-Message-State: AOAM530ZtNT+jVTgp8IP5QHQC380JwrrcX47TZWxMf1dfCzFczSp2kG/
 h5XoW+2YYxy3VEbWvknLW5LnZg==
X-Google-Smtp-Source: ABdhPJzWp8YBBWmmPsgojCM5EuL7rt//Qr2GWM7TBTy2sfhyIVrZc5/xKc64yoGpZUByXCbVgWCjcA==
X-Received: by 2002:a9d:3422:: with SMTP id v31mr4026702otb.260.1615908085490; 
 Tue, 16 Mar 2021 08:21:25 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l190sm7016036oig.39.2021.03.16.08.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:21:25 -0700 (PDT)
Subject: Re: [PATCH] target/mips/mxu: Rewrite D16MIN / D16MAX opcodes
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210315223745.2953548-1-f4bug@amsat.org>
 <CAFEAcA-+m-eADtYini-2Mscom-RiuvzG4cXndMcuSKR80O8dow@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed62ba42-741f-fd49-44eb-1c65e291e64a@linaro.org>
Date: Tue, 16 Mar 2021 09:21:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-+m-eADtYini-2Mscom-RiuvzG4cXndMcuSKR80O8dow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Craig Janeczek <jancraig@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 4:51 AM, Peter Maydell wrote:
> On Mon, 15 Mar 2021 at 22:39, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Coverity reported (CID 1450831) an array overrun in
>> gen_mxu_D16MAX_D16MIN():
>>
>>    1103     } else if (unlikely((XRb == 0) || (XRa == 0))) {
>>    ....
>>    1112         if (opc == OPC_MXU_D16MAX) {
>>    1113             tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
>>    1114         } else {
>>    1115             tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
>>    1116         }
>>
>>>>> Overrunning array "mxu_gpr" of 15 8-byte elements at element
>>      index 4294967295 (byte offset 34359738367) using index "XRa - 1U"
>>      (which evaluates to 4294967295).
>>
>> Because we check if 'XRa == 0' then access 'XRa - 1' in array.
>>
>> I figured it could be easier to rewrite this function to something
>> simpler rather than trying to understand it.
> 
> This seems to drop half of the optimised cases the old
> code had.

Which is a good thing, I think.  They're all never-happen cases that nothing 
but an isa testsuite will ever issue.


r~

