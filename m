Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806AF5AE527
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:19:47 +0200 (CEST)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVgI-0005Cy-Hr
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUth-0005HJ-Qn
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:29:34 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUtf-0005IU-14
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:29:33 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bp20so14022380wrb.9
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 02:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=K/8EvKQblto942ll8ilVP0JWHV7pPWp1H8Q1zJDTThc=;
 b=wvKYgmlh1cnjvVxpM9nD9lEdHCJH3wdBOoHMLOpJolHjejL6oFlPX6G1Tav9nkD1Sb
 InfCy4QWeEHXv3VDeJcP7cv982BklhnJQ4IqIIJV0DzTRJaGwqo0N1Y7+I5ha/ApzUgm
 6WzQyyXOyhyldYWnDHFUjd2B53PMKeXk9pNqmUIYLTZ8ruOsu6K4wSGjROUVL2ZRI1x8
 wL+Z6l6L/xcaxxqPfYBpNMFbXTPtdHgUP7FJM8WhlyIgGfQ9WQwSklDICq6zH7R4uPKd
 DZCOYoMhAnZD9XeIcb6X481aDdT8H+qUf1V98w91qbmbgN9WWryWjNfSZPCaBCuPmc6A
 Qm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=K/8EvKQblto942ll8ilVP0JWHV7pPWp1H8Q1zJDTThc=;
 b=gAVFOe0c/GK48MrCmyS6BPlKDF19qtZ5Rzba84MYAmyNkT5P8pAhYPjtNP6lhQgjNn
 0gLGGhsBSebBEwiURgEGbGeVb0g2BGmxE79fKR0JbkmyDd6bCEBNb87/2GzFr1c30LOx
 uY8hv9xKItZK7e1P7M+toGDD4JFgfOuWXkfbsAdSytsfJrecjxA/i7Ka/i9Ju1vu7L7p
 oHIWl7dAs6f+qtI1936LXHbX7ql0J2k1B1Zu60Qe/ctB1/+HfR8bBquNcLIsz11fLFRL
 ASy1waxgtxWxmqcf0uVFRPWnXf5YfQGF5944LjIqcEhjTAhcw1EiehoV0wqBAhERKwYa
 q+xw==
X-Gm-Message-State: ACgBeo2gUH48lqTpz31p2iCcYNeGfx6sNyVl9piyY/JATpT71VgriswM
 x8XehC2uNJY2ID5CgnMxb3VET1QiVLI/l1pp
X-Google-Smtp-Source: AA6agR4ywFdc2yvt5aioDTwJVbmTOL0QQ4elZjiE1ZsQe8KUi9gMvbhqDlQoDULShfqdFwYnrncx0A==
X-Received: by 2002:a05:6000:1849:b0:228:c848:2593 with SMTP id
 c9-20020a056000184900b00228c8482593mr3320309wri.557.1662456568199; 
 Tue, 06 Sep 2022 02:29:28 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1?
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1c2643000000b003a5ee64cc98sm20156577wmm.33.2022.09.06.02.29.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 02:29:27 -0700 (PDT)
Message-ID: <a5b2bf27-3194-a93e-ebe1-713d93249083@linaro.org>
Date: Tue, 6 Sep 2022 10:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 0/7] tcg: pc-relative translation blocks
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220906091126.298041-1-richard.henderson@linaro.org>
 <d0b82889-952f-f3f2-788a-fc21bd1e5c14@linaro.org>
In-Reply-To: <d0b82889-952f-f3f2-788a-fc21bd1e5c14@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/22 10:28, Richard Henderson wrote:
> On 9/6/22 10:11, Richard Henderson wrote:
>> The goal here is to reduce the amount of code generation when the
>> guest kernel enables address space randomization.  This requires
>> extensive changes to each target, so opt-in with TARGET_TB_PCREL.
>>
>> This is split out of v3, which also contained target/arm changes,
>> as I now have patches for x86 and s390x as well.
>>
>>
>> r~
>>
>>
>> Based-on: 20220905202259.189852-1-richard.henderson@linaro.org
>> ("[PATCH v3 0/6] tcg: Introduce CPUTLBEntryFull")
>>
>> v2: 
>> https://lore.kernel.org/qemu-devel/20220816203400.161187-1-richard.henderson@linaro.org/
>> v3: 
>> https://lore.kernel.org/qemu-devel/20220822232338.1727934-1-richard.henderson@linaro.org/
>>
>> branch: https://gitlab.com/rth7680/qemu/-/tree/tcg-pcrel
> 
> Arg.  Accidentally dropped a patch from v3:

... and managed to hit ctrl-enter while pasting ...

https://lore.kernel.org/qemu-devel/20220822232338.1727934-2-richard.henderson@linaro.org/


r~

