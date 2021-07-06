Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29553BD776
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:11:48 +0200 (CEST)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0krb-0007Ym-QU
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0kqf-0006Nd-0V
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0kqb-0004Co-Fq
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625577044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMpkbsahDUoPNW6bU3wGQy5aTTdc5WS4J0g54W45ySQ=;
 b=dr6Yjj3BG0CXIqc0ZZhqMoqvFTF19e7p9JHYiwpt1KPDO5XB6glIQoga0xVfUKBXrvJKAE
 o/1sk9RIekDwTsATVOBnG/Asg3uzxa+Re7LkY41RTFQeZTd8LJaUWBdr+XNYzDoKKLgz3f
 v9+kWsWlQn+1LkZIPSqvVqZd8nHZLmM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-_9Hf57aFPrO2utfSWDhl2w-1; Tue, 06 Jul 2021 09:10:41 -0400
X-MC-Unique: _9Hf57aFPrO2utfSWDhl2w-1
Received: by mail-wm1-f72.google.com with SMTP id
 p4-20020a05600c3584b0290210725ac6bcso762209wmq.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 06:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TMpkbsahDUoPNW6bU3wGQy5aTTdc5WS4J0g54W45ySQ=;
 b=rhtQ/9Oxo6lkO+QEbw3z9OiwVwxssjrFL8+au7VfpFgnPRQyZAbqY6k0yxdbywGZpC
 owmSIIYQ7r5QDhz5S6SXNKWMRci74ZGXfb0BwA8/qhfN/BxYlcTHHqAYxahlLbeqT0rk
 Lzbae8llLFrj1+zcGfnfolRJFpd3ktmIEDZEtih0ovhrvC58wEpy0ruAFrUIxXjXGxE9
 fo0/uutw0EnYEEbpY+qa3esVbMtixgGzIFjhWMopA0t18b3uWkDqJwV5ATAlXlsxxWwb
 fVdrn+dsIG9xNPoWCufb2d0tr06dZqoZpbAkNTE05KaRpubj9A17ejs0wyupnQsu2Eys
 IJrQ==
X-Gm-Message-State: AOAM531W+uVQRe6w2hb8dRD6kuJd5pAK5KxlHE2ej8kr1b4MufwJEILv
 2fkqo5BfWtep3f7iMVCF8j5tTfGYlweRh49/qlXhpKmuE5Yyn69uI3l8GqqFqKCISf/DXQMCeK2
 oeXYGR87wOq1li7M=
X-Received: by 2002:a7b:c852:: with SMTP id c18mr20144777wml.128.1625577040231; 
 Tue, 06 Jul 2021 06:10:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI146CdrTHNoiGia8d9kiKiw/R+q4BaqjwJa0Cv3PsTDGomr5gF54kHm2M4RCfgfMfCrM5KQ==
X-Received: by 2002:a7b:c852:: with SMTP id c18mr20144749wml.128.1625577040045; 
 Tue, 06 Jul 2021 06:10:40 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
 by smtp.gmail.com with ESMTPSA id g15sm16459930wrs.50.2021.07.06.06.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 06:10:39 -0700 (PDT)
Subject: Re: [PATCH v1 1/5] meson: Introduce target-specific Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-2-alex.bennee@linaro.org>
 <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
 <8d018805-8e1f-4c1e-b1a4-45a34c8d2e63@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bd97210a-04d4-939f-b3b7-1e250d7d250a@redhat.com>
Date: Tue, 6 Jul 2021 15:10:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8d018805-8e1f-4c1e-b1a4-45a34c8d2e63@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>, pbonzini@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/07/2021 14.47, Philippe Mathieu-Daudé wrote:
> On 7/6/21 12:52 PM, Thomas Huth wrote:
>> On 21/06/2021 17.21, Alex Bennée wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Add a target-specific Kconfig. We need the definitions in Kconfig so
>>> the minikconf tool can verify they exit. However CONFIG_FOO is only
>>
>> s/exit/exist/ ?
>>
>>> enabled for target foo via the meson.build rules.
>>>
>>> Two architecture have a particularity, ARM and MIPS:
>>> their 64-bit version include the 32-bit subset.
>>
>> Why do you mention these here, but not x86, Sparc, PPC and RISC-V which
>> also have 32-bit and 64-bit variants?
> 
> Because we consider them as different targets, they don't include
> (kselect) the subset.

And why is that done this way? There is certainly a big difference between 
Sparc and Sparc64, but for x86 and PPC, the 64-bit variant is a superset of 
the 32-bit variant, so why is it done different here compared to ARM and MIPS?

  Thomas


>>
>> The patch itself looks fine to me, so once you've clarified the commit
>> message:
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>>
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> ---
>>> vajb:
>>>     - removed targets that no longer exist
>>>     - reword commit message to show why we need the Kconfigs
>>> ---
> 
>>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>>> new file mode 100644
>>> index 0000000000..3f3394a22b
>>> --- /dev/null
>>> +++ b/target/arm/Kconfig
>>> @@ -0,0 +1,6 @@
>>> +config ARM
>>> +    bool
>>> +
>>> +config AARCH64
>>> +    bool
>>> +    select ARM
> 
>>> diff --git a/target/mips/Kconfig b/target/mips/Kconfig
>>> new file mode 100644
>>> index 0000000000..6adf145354
>>> --- /dev/null
>>> +++ b/target/mips/Kconfig
>>> @@ -0,0 +1,6 @@
>>> +config MIPS
>>> +    bool
>>> +
>>> +config MIPS64
>>> +    bool
>>> +    select MIPS
> 


