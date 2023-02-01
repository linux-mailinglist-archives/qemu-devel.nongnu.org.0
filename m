Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59656686970
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 16:01:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNEbp-0005DQ-Fd; Wed, 01 Feb 2023 10:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pNEbm-0005D5-Qi; Wed, 01 Feb 2023 10:01:10 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pNEbk-0001Qs-SC; Wed, 01 Feb 2023 10:01:10 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1636eae256cso19549831fac.0; 
 Wed, 01 Feb 2023 07:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=EGuGlW0lubzIJCyde0M2gDM8h/dOOfu0BJXxzK8Ii48=;
 b=Emrt0CB0Dxs8H3+Kvr+vr1POlN9NFEa1IUaU0ke2lKJIWZgsvEftbwJFiWyaMQV6FA
 KzsHNPYlxIwYL+vAsdS5dGYEASJWvqOMtl+8UyMEiLkgFZ0UTB+YearcrfgiFfgDRXCM
 AQu4syfppE7s4m0oAVy7ocR2aE/LILCJ3fxJL9lZPuJUU2J1aiVs0EYLoj/Xw/472t+9
 /OwnY1K5C8Fk/pmyAhWkgE9Mv4BeoP19b56R0tYaT6CYeYAlv6RJDvrO4FFahAGB6DJn
 f3XX9WG+ptiiWN0h/W9FdlCVKasYpAv49LFO4xbxBZzssHqnpkZ6AF6Qbltzv1WxA5Kz
 h6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGuGlW0lubzIJCyde0M2gDM8h/dOOfu0BJXxzK8Ii48=;
 b=SMgcQr5GNO3FbXigkubJJ4BabYoGMiU38PFVcCzYAYO3dKaZ7Q2vXpxzTB6fBDUzTc
 Z/Y1wHhym0arNPW7bF95oIeSCiGAI3ucsFs36xpWKSd3XYySsUBYfmZ+Buj+DoFMNb6r
 ry3sggCb5J5+5TPz9qQfS6FC78S1nMov/jKQW8mi2p0/4Wu6Fbb0lLpZmSpdq+o6dF/v
 +DdI3Phm4oqPfKTXEsWfrVRez6Kvf2gS9Omi20o+A4f2PCxLGClmcCX9sbCjkxomez/t
 CarYMdd0CT+ww/uCptDV0bwLiBT8+KCcINv9KFFEU+lxNvE9DsmtTy2qjyhKW8swNmNH
 ccLw==
X-Gm-Message-State: AO0yUKXksR/l/1Smn9RXlq08xiLmnIE2LaLjs9cE/2DQsNNA6uAorI2d
 Sy56yD7j3tBHlj4ZXBIzY0w=
X-Google-Smtp-Source: AK7set9QSwILX0LsAJGBO0rlg9syY6whezvDIliuxO3qZrsqjbNsDRXoCSDQAX2z1oWE7F1+Ck1Vxg==
X-Received: by 2002:a05:6870:b490:b0:160:3234:62d9 with SMTP id
 y16-20020a056870b49000b00160323462d9mr1055627oap.22.1675263666256; 
 Wed, 01 Feb 2023 07:01:06 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056870304200b0015b64f8ff2bsm7799867oau.52.2023.02.01.07.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 07:01:05 -0800 (PST)
Message-ID: <a71c47c4-f5e7-4936-0a8f-ac4c3e221d46@roeck-us.net>
Date: Wed, 1 Feb 2023 07:01:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/25] aspeed: Add Supermicro X11 SPI machine type
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-3-clg@kaod.org>
 <CACPK8XeSN90WZjpAiBqcQyOgJh+q=HTgFsw98Ywm7voGHY7ypw@mail.gmail.com>
 <f1f96a11-5b4d-1f9e-a832-8e07bb2cee56@kaod.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <f1f96a11-5b4d-1f9e-a832-8e07bb2cee56@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=groeck7@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/31/23 23:49, Cédric Le Goater wrote:
> On 2/1/23 06:39, Joel Stanley wrote:
>> On Thu, 19 Jan 2023 at 12:36, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> From: Guenter Roeck <linux@roeck-us.net>
>>>
>>> supermicrox11-bmc is configured with ast2400-a1 SoC. This does not match
>>> the Supermicro documentation for X11 BMCs, and it does not match the
>>> devicetree file in the Linux kernel.
>>
>> I found this sentence confusing; AFAICT X11 doesn't name a specific
>> motherboard. It appears to be a marketing term for a bunch of
>> different things.
>>
>>> As it turns out, some Supermicro X11 motherboards use AST2400 SoCs,
>>> while others use AST2500.
>>>
>>> Introduce new machine type supermicrox11-spi-bmc with AST2500 SoC
>>
>> How about supermicro-x11spi-bmc? It would match the product name:
>>
>> https://www.supermicro.com/en/products/motherboard/X11SPi-TF
>>
>> as well as the device tree filename.
> 
> Indeed,
> 
>          model = "X11SPI BMC";
>          compatible = "supermicro,x11spi-bmc", "aspeed,ast2500";
> 
> I was the one who suggested the name. Let's change if Guenter agrees.
> 

Sure, any name is fine with me.

Guenter


