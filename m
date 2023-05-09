Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3B56FC8DF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:25:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOGa-0007bC-3p; Tue, 09 May 2023 10:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOGZ-0007b4-1X
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:24:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOGX-0004qW-A2
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:24:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f423ac6e2dso18662765e9.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642271; x=1686234271;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xdxel2FBxlMBSVNQsXPvEwEg9fCOGRkFX4Q36IBEqcA=;
 b=Y8oM2a5uYFFjoakNilpuuJ8Zp4diQG2lGU9X4MrI16PN8jxyFY1u0Nlp8VeEoQw/aX
 cAMN/xvh5b1zgvd8IZExUbCJKj/WmcIz549IctmFKBWdvroy2V+N1d/cVBR68oroIclT
 6IN8hpohzgWRdc+TtIk4Onxlgr/NNYO1LhMDz5OVoU9/PFArwnJJ0huo373fyPP1dnTp
 iECQo9i+cT7OHuXzYplctAyOCQ2+LYyrB1SA9HJc78jMhbqNuW8o6RfPpdO7zJCo6JnH
 DHmuMqD31G/wV+fy38iyR10pVLjJovxE/6YNQ4dNasxAGRRFydBk0Sg9LMcnqIQo6F4r
 CP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642271; x=1686234271;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xdxel2FBxlMBSVNQsXPvEwEg9fCOGRkFX4Q36IBEqcA=;
 b=ARB1l2Rk3ZLc1KOEf2byA7r5+Wp/TSJ6Kp7AxF+4zPBJZA+skvZABuUZG8804qLcdc
 9911Q0Q3M2t50wum0aw7SIdg+8HJMBBC9JhbASYkB81JzYVpEUU/T+pfouNmoeNDyGoQ
 UlRQlwok0Gu99lOXsEZw9ZgpU0QxC1qMlu5fZgzNVqEGUn0mCEbDXFs4OoRfIv+8DhSS
 tbORlYPxwcaGFhI0GSaRQ0r9/4k46eY8e9l9YWuU+ibjy3Aiha5R1GcDmouDDM0z343A
 0qRb9JWADz3q0tgUJNE21gHRdBQ0KMLDoOBNWOXOOoWfu0b36Ro+nkg+jOAG/U8HAYiP
 IWyw==
X-Gm-Message-State: AC+VfDzmm5Lxi1Lr2zFUxpKzSge2zxrPCRz3SZtJPTZzQrPh2qsjjtEc
 wyes/jnbnpRrBwYf/Rxpl61MxA==
X-Google-Smtp-Source: ACHHUZ5MAQq5nXJJDbKUn4xVNg3cW2dK/zw0yn/sNlTMAf492KSUqU67pgRzsH6KYDa8dK2qFo66/w==
X-Received: by 2002:a1c:f704:0:b0:3f1:9526:22be with SMTP id
 v4-20020a1cf704000000b003f1952622bemr9316004wmh.23.1683642270938; 
 Tue, 09 May 2023 07:24:30 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a7bc34b000000b003f195d2f1a9sm19967283wmj.15.2023.05.09.07.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:24:30 -0700 (PDT)
Message-ID: <a2826790-6159-dc07-a8be-7ac375b7e6ca@linaro.org>
Date: Tue, 9 May 2023 15:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] accel/tcg: Fix atomic_mmu_lookup for reads
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230505204049.352469-1-richard.henderson@linaro.org>
 <CAFEAcA8+R1B3kDTU+5xiigAVA9QYVEeHxv+1F6MDEsvT+=0zig@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8+R1B3kDTU+5xiigAVA9QYVEeHxv+1F6MDEsvT+=0zig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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

On 5/9/23 14:14, Peter Maydell wrote:
> On Fri, 5 May 2023 at 21:40, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> A copy-paste bug had us looking at the victim cache for writes.
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>
>> To be inserted before patch 3 in
>>
>> https://lore.kernel.org/qemu-devel/45cba357-ba20-399a-27e6-5e99741179d0@linaro.org/T/#m5dc55cf04d564f4a8f97bc95e7f0e427c24a4f0b
>>
>> r~
> 
> Should we cc qemu-stable on this one?
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Could do, though it's been broken for a while.
I guess we do little enough testing on read-only pages.


r~

