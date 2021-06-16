Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A83AA21D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:08:47 +0200 (CEST)
Received: from localhost ([::1]:39124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltZ1z-0007Of-1y
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYzQ-0003pi-9t
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:06:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYzO-0005dh-Mp
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 13:06:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id d184so1721480wmd.0
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 10:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Slzc1i8EDJ+iU9A/7CVnl8BOucZstZeXwXThk3Jil4o=;
 b=h/WHyY8lSGXCBF44DWJ08ciHBiNgFxH0tXba4qly+KIWTLAVPISr8TfPRlRaoRTDTA
 GjW34EQwsIBiTJ7bMnAZ2tOz5BuoI0WJ/gwDcUq3tEa1+60GAnS0b3SBqP62gZElSmQZ
 DrKDVumoz0UpkfUrC94uL2s9X+QcP8dC6G5fQDnw/vbfJ9X4D8Jjl9GM0XEUhUxX4mvu
 eVXLHcrNm2/ez+wBMwcM72KqQJPY/Tcrnho8maMJ1HMQRdwHFi1Nf/u68uO47Z7Bl48A
 ccfH7XrRBsGJ5JmMt1gxgV2Au6gf52dvScOi7e0DtYIu49mZK7C7tx1wj5Q+DIIbnpbZ
 v5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Slzc1i8EDJ+iU9A/7CVnl8BOucZstZeXwXThk3Jil4o=;
 b=o0BMj1wIFmc0vIttjWOcxe4BbBSeGoPptrYbaxi41jFAyuE6ZJDJwJGuBXiWwVQq/g
 IwZAmuLF9I/+D1oW1sVI2NdFfmLdPx8QajUyAgL7XXhBdP3nC8iL5OIUO7qkfMBTME+m
 KwMsh5wBWExgvgtAnPchGSk81iGQI6UA+tUDNUql2vilUZzosHNWPg03i/UBNDYozYMQ
 WwYL2+sI4/yhllpZsAnNWK024QQ57IYsZk2u60ZwlN2SkFU/0OvsW6XlaVOML6u2RF0j
 sNUtGlqhFZRyDxQG3+aJXcaMLhY6IXSjxSxHiT/sF109Tkop08yrckd5s/0K4Jn45yW5
 BEDA==
X-Gm-Message-State: AOAM530oJjx9eUBNQdjkHOue+fWVSKSItyqUwuecZXbtiUf9JdgSvvFu
 vJfcTT84eN3DMSW1AOmc1ItgU5gfP0XVJQ==
X-Google-Smtp-Source: ABdhPJxsNcA16AkhB7nOdaQt0pdkC6GjN6W2FyfFDY6C3hpT7Xk7Rgc0IbSUMRKoc1TgWF+2/u8jVA==
X-Received: by 2002:a05:600c:3586:: with SMTP id p6mr78833wmq.28.1623863165068; 
 Wed, 16 Jun 2021 10:06:05 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 2sm2641448wrz.87.2021.06.16.10.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 10:06:04 -0700 (PDT)
Subject: Re: [PATCH v2] alpha: Provide a PCI-ISA bridge device node for guest
 OS's that expect one
To: Richard Henderson <richard.henderson@linaro.org>,
 Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210616141538.25436-1-thorpej@me.com>
 <f78d7087-43bf-5fb5-7ab3-1d3d261c5fe1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dc8b643f-ec13-58fb-ed06-0b4a90a03339@amsat.org>
Date: Wed, 16 Jun 2021 19:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <f78d7087-43bf-5fb5-7ab3-1d3d261c5fe1@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 6:53 PM, Richard Henderson wrote:
> On 6/16/21 7:15 AM, Jason Thorpe wrote:
>> - Move initialization of the ISA bus from typhoon_init() to
>> clipper_init();
>>    this apsect of device topology is really associated with the
>> individual
>>    model, not the core logic chipset.  typhoon_init() now returns the IRQ
>>    to use for the output of the ISA PIC.
>>
>> - In clipper_init(), instantiate an i82378 instance, and connect its
>>    PIC output to the ISA IRQ input provided by typhoon_init().  Remove
>>    the explicit instantiations of i8254 and i82374, as these devices
>>    are subsumed by the i82378.
>>
>> Signed-off-by: Jason Thorpe <thorpej@me.com>
>> ---
>>   hw/alpha/Kconfig     |  1 +
>>   hw/alpha/alpha_sys.h |  2 +-
>>   hw/alpha/dp264.c     | 36 ++++++++++++++++++++++++++++++------
>>   hw/alpha/typhoon.c   | 19 ++++---------------
>>   4 files changed, 36 insertions(+), 22 deletions(-)
>>
>> diff --git a/hw/alpha/Kconfig b/hw/alpha/Kconfig
>> index 15c59ff264..e907a052c3 100644
>> --- a/hw/alpha/Kconfig
>> +++ b/hw/alpha/Kconfig
>> @@ -4,6 +4,7 @@ config DP264
>>       imply TEST_DEVICES
>>       imply E1000_PCI
>>       select I82374
>> +    select I82378
>>       select I8254
>>       select I8259
>>       select IDE_CMD646
> 
> Looks good.  I removed the direct dependencies on I82374, I8254, I8259,
> which are now handled by the Kconfig entry for I82378, and the includes
> for them.

Correct, thanks.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

