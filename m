Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF32F19D0
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:35:22 +0100 (CET)
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzE1-0005Pw-2i
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:35:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyzBS-0004Fu-Pt
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kyzBO-0005s4-DQ
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610379157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFhE1fuK2u+lt8651i050zlH4eIqB40KpbdOdnqE+Ks=;
 b=hiSWa/H5MnnN1q6NkdRh8KknCyia3k2ADek94CY2bkvZkbNv9t6bAG2OXe6An39UgXJXmc
 jefrr2n5o5guU1Khf9QgaWO6at2O2IDQNAQ4t/XZRCgA49ZrhMBhepF3tgCQug3H/8ppHQ
 fTzSznoVAbqaIxK+nUm3s8j2BxgBwFo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-fkT83FuQNX2yl0FlFUYggg-1; Mon, 11 Jan 2021 10:32:35 -0500
X-MC-Unique: fkT83FuQNX2yl0FlFUYggg-1
Received: by mail-ed1-f70.google.com with SMTP id u18so8401735edy.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 07:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oFhE1fuK2u+lt8651i050zlH4eIqB40KpbdOdnqE+Ks=;
 b=kEabMipt7urKnPu3t1Rv+3DqYpsqtuF+VqOmYn5FkeLLU4j4nnsoeApIypnx0896lR
 Ul/d4c+2y+ZQadWuaVQSuq8PI+eXXQWVP00Q+V8ZxvzJ3OzqSZQVhP8HKPmQ6POioLBi
 /QgpFcK22pR5pXTEulT+OJ0pHr4a0FfFx5ayntApoDYehOBocFpTovmx2R80WqlBaGL7
 O8rm1sXpTlKfW/QRpBfiCm02u9+BNx+5moqWbcOAKIk16VKwehFlgE3+XgNbGdcTOnVg
 FUUPS+6cz4/sMHUEXwJn4jIPOf+iR8g194Cm2o6U7ChhBY/w6ypYMUPMgvq02mCFD/LG
 wMnw==
X-Gm-Message-State: AOAM531F5gjKFD2Kx3VI2wBKymWv9gF0wYUVj0jJeB6yrYrJ4SbF/IAY
 0MQkOTkZDKcDnSWAsryAMlu6HpUXegX0glV02zRHGf5RhED1RaLwemVRI9p4qxXA4RKK1sRWL5+
 7wowacowWrvS2R40=
X-Received: by 2002:a17:907:271c:: with SMTP id
 w28mr42961ejk.140.1610379154507; 
 Mon, 11 Jan 2021 07:32:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzY2Fxok49+7rEcrn+mlf7bsO1dhX3X4Fr0GxY2lR97nSdK2NzTqVi65g64QjbNmDc8TIrDFA==
X-Received: by 2002:a17:907:271c:: with SMTP id
 w28mr42948ejk.140.1610379154281; 
 Mon, 11 Jan 2021 07:32:34 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id r21sm73326eds.91.2021.01.11.07.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 07:32:33 -0800 (PST)
Subject: Re: [PATCH v1 12/20] semihosting: Move ARM semihosting code to shared
 directories
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-13-alex.bennee@linaro.org>
 <15248375-2760-8e5c-4468-b952b247ed2d@redhat.com>
Message-ID: <5f7091fe-a7ff-d2c6-528a-728b97434d3a@redhat.com>
Date: Mon, 11 Jan 2021 16:32:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <15248375-2760-8e5c-4468-b952b247ed2d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Packard <keithp@keithp.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 4:30 PM, Philippe Mathieu-Daudé wrote:
> On 1/8/21 11:42 PM, Alex Bennée wrote:
>> From: Keith Packard <keithp@keithp.com>
>>
>> This commit renames two files which provide ARM semihosting support so
>> that they can be shared by other architectures:
>>
>>  1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
>>  2. linux-user/arm/semihost.c -> linux-user/semihost.c
>>
>> The build system was modified use a new config variable,
>> CONFIG_ARM_COMPATIBLE_SEMIHOSTING, which has been added to the ARM
>> softmmu and linux-user default configs. The contents of the source
>> files has not been changed in this patch.
>>
>> Signed-off-by: Keith Packard <keithp@keithp.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210107170717.2098982-2-keithp@keithp.com>
>> ---
>>  default-configs/devices/arm-softmmu.mak               | 1 +
>>  default-configs/targets/aarch64-linux-user.mak        | 1 +
>>  default-configs/targets/aarch64_be-linux-user.mak     | 1 +
>>  default-configs/targets/arm-linux-user.mak            | 1 +
>>  default-configs/targets/armeb-linux-user.mak          | 1 +
>>  target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
>>  linux-user/{arm => }/semihost.c                       | 0
>>  hw/semihosting/Kconfig                                | 3 +++
>>  hw/semihosting/meson.build                            | 3 +++
>>  linux-user/arm/meson.build                            | 3 ---
>>  linux-user/meson.build                                | 1 +
>>  target/arm/meson.build                                | 2 --
>>  12 files changed, 12 insertions(+), 5 deletions(-)
>>  rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
>>  rename linux-user/{arm => }/semihost.c (100%)

Can we name these file with some explicit "arm_compat_semihosting"?

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 


