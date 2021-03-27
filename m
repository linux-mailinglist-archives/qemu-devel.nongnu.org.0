Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A98634B8FE
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 19:46:41 +0100 (CET)
Received: from localhost ([::1]:54774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQDxI-00036X-Mw
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 14:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQDvi-0002Ji-Df
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 14:45:02 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQDvg-0001vj-Te
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 14:45:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b9so8751612wrt.8
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9NcY/exHJRNzaIYbomxU2hEw5JTqjVN4/MAdLYkRU3c=;
 b=aX0/l4NtEyXt+jdgLRSNxYMTmgmZJqqjmGfSDv50ilY2ukn8pHZ3Uz6I5DiEzMEq7o
 Vyn7WXLSNTuFQviTH3yB9E0fO/UIJyQB6tGBZabvUujliqI05kvHOnchg4HZi7rgJetY
 cdtbQiz7Mrl+C2FhvIKcdPBoV0eXX6oXJHe1q119p6XT6a99Aze2FMO6J2rgEYTJSuwa
 X5d+rPGSJqpdox+lEJUio8sOySazoWNE3+H5pquQvetED7kPK2/I7S5L8GukEbasDGre
 n3rChV1Tmp95W97fhAfzUJh2hsiEHJURb10VUkJsTXsRxzVbZqe3v/xpIX4xIRIpFM1w
 UH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9NcY/exHJRNzaIYbomxU2hEw5JTqjVN4/MAdLYkRU3c=;
 b=M33ueo2dYXcx3R2fus+MgYaaRL8/1WEwWQCdoqmGNg4dnFsnPBP8dErqyl3lTMrEkN
 O6LU3tCtUmsTT7OshVcSRIGx/86Wo94gPZsmjtF3K4PGgmLJDFrWrSVsFbHa1ljOuY+z
 GEjz7iPPPPsPb/LFm9lGB0gGf7s+sohT/I5OCWzagK/JpWBjO2BuunqPWV+CIF4WPGsx
 ugVXXm4fzMU506ii2hu/mpNL53ot6aA8mXopwzOWAxeX6Jd8d94vfAO8WSyZlCQRkdbO
 u5DP6/mfpN+bPUMqsS7uTGrnp4W71VYcLNUmwJG8lO8dN8P78Bu4ftHVxHbQO6XiSNGO
 vUIQ==
X-Gm-Message-State: AOAM532vPUzSERksc0vIfvZ1XlOJ9hFKZaUUiLsN76uBgsocn3MomgYX
 W+TaSVvRz8Hcax9jEjoLYbUetwJGO+R/UQ==
X-Google-Smtp-Source: ABdhPJyWzoFiodGalkS2BxsH65FoIoA32svh9v0r4t+kVmhe/hyCVR3195PCiNyNrrb8WpJXVDSilQ==
X-Received: by 2002:adf:9544:: with SMTP id 62mr20108000wrs.128.1616870698515; 
 Sat, 27 Mar 2021 11:44:58 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m14sm16422543wmi.27.2021.03.27.11.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Mar 2021 11:44:57 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] memory: Add 'priority' property setter
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210327143452.1514392-1-f4bug@amsat.org>
 <CAFEAcA8Ue2BcWy0RuOO7jbK-+gBjFMwXvugvAwUhLb1E9VfN8w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f9249085-81c7-7d64-6738-2d9318302c98@amsat.org>
Date: Sat, 27 Mar 2021 19:44:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Ue2BcWy0RuOO7jbK-+gBjFMwXvugvAwUhLb1E9VfN8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/27/21 5:58 PM, Peter Maydell wrote:
> On Sat, 27 Mar 2021 at 14:34, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> The first patch is an old fix, it would be nice to get it
>> merged eventually, but not a problem during years, so can
>> also wait 6.1.
>>
>> The second patch add the memory_region_set_priority() helper
>> useful to memory controller devices.
>>
>> The rest add the 'size'/'priority' object setters.
> 
> Do you have a series which makes use of these new APIs?

Yes, new board / SoC, many patches, I'm trying to split to
have review because I don't expect many developers to review
a series adding 20+ devices... So far:

 87 files changed, 8805 insertions(+), 97 deletions(-)

Part of them already posted:

- hw/misc: Add support for interleaved memory accesses
https://www.mail-archive.com/qemu-devel@nongnu.org/msg730721.html

- memory_region_add_subregion_aliased() helper
https://www.mail-archive.com/qemu-devel@nongnu.org/msg795414.html

I can send an omnibus series if you prefer.

Thanks,

Phil.

