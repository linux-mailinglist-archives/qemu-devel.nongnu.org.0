Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25A66E675D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 16:44:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pomXc-0004zf-Cf; Tue, 18 Apr 2023 10:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pomXW-0004ye-0X; Tue, 18 Apr 2023 10:42:38 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pomXR-0006qu-AN; Tue, 18 Apr 2023 10:42:35 -0400
Received: by mail-pl1-x633.google.com with SMTP id p17so16783792pla.3;
 Tue, 18 Apr 2023 07:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681828951; x=1684420951;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6gZlrvCOZuxtUgy42BvdprVfeY/UDtXoIaArs8m5OEA=;
 b=fh8TZm8pqpxbbkfTwZcikly6LaH1DfL+BwNtRnDOH2p+ZL78Z9m/N8iaaN1NuqkWF4
 EvCofnPS4xXjoHFBUMOcjdXeTCE/oT2nIxTRNkrj3unvd4sWa4RKA5lj9wzaP5kzs4si
 YBjRKvYK2gYJ3zpxU9DOD9FB/3dhdogZIAq52PEHcOXNDczKireGofzKnoqr3AtWhhS0
 CM5avC8QZtiGFTv1Fh92FEWk0HKHrTn+2zhgOaX8/CiwMYWDsCZq8aFAp2hNFYMWy0Gl
 yTrL0Ek5fLyvZfLjX2o5pameIGLt+CJh4j0l4HsObYX/Ezx5qXkY+XveTzFOqOaNg1Zw
 nnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681828951; x=1684420951;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6gZlrvCOZuxtUgy42BvdprVfeY/UDtXoIaArs8m5OEA=;
 b=T0WhhNAhXgvswh1W//f4w5JjZuueWQD3OsW3I78g4TBOJZq7Ydu7Qr5FFO7wbSTl6F
 RD0rSI9dvmccHndd3dJm7epgXUGBYiAOLYnvGV0ytnxvuJ1FMZ3DfvHPTvbZq9UJ0zh4
 SEeDS+ahceKFsWA9iwdC3A6dc3tE71yo541NsYV0KRavWt+rxZQ7Vh/NoJ3h7MB90tPm
 5/sicv00JphD+tssL2OQxW7tjuDw6Y/KSrwGTU398o7HjtMop5bzOPZVkUSPTnA+aZbB
 PYAdJxK15P7rUyBab8xgLSJBjluEznkeiX1PwsOksMnME6XN5coIaec+b+TUzkBeNQ4L
 f3oQ==
X-Gm-Message-State: AAQBX9fH0KyASnauln63AZwrEpRGD20v59+bpnK1P49JCsbXh9J7UKGS
 avE9SPmi39HJ+i1xPxNCjcM=
X-Google-Smtp-Source: AKy350aHL0PqzmoFEMq0/6wFGmLCOxVNCSjsFmrtwVVWU08vdioQ1lUu8KO/0/2AjpeHv8xymLW1Vg==
X-Received: by 2002:a05:6a20:430c:b0:f0:65fb:6cec with SMTP id
 h12-20020a056a20430c00b000f065fb6cecmr63518pzk.8.1681828950858; 
 Tue, 18 Apr 2023 07:42:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a63dc16000000b00502f4c62fd3sm8860807pgg.33.2023.04.18.07.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 07:42:30 -0700 (PDT)
Message-ID: <c24f50af-1dbb-6a1b-ca21-414039c10602@roeck-us.net>
Date: Tue, 18 Apr 2023 07:42:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/5] Support both Ethernet interfaces on i.MX6UL and i.MX7
In-Reply-To: <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=groeck7@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.597,
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

On 4/18/23 05:10, Peter Maydell wrote:
> On Wed, 15 Mar 2023 at 14:52, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
>> be connected to separate MDIO busses, or both may be connected on the same
>> MDIO bus using different PHY addresses. Commit 461c51ad4275 ("Add a phy-num
>> property to the i.MX FEC emulator") added support for specifying PHY
>> addresses, but it did not provide support for linking the second PHY on
>> a given MDIO bus to the other Ethernet interface.
>>
>> To be able to support two PHY instances on a single MDIO bus, two properties
>> are needed: First, there needs to be a flag indicating if the MDIO bus on
>> a given Ethernet interface is connected. If not, attempts to read from this
>> bus must always return 0xffff. Implement this property as phy-connected.
>> Second, if the MDIO bus on an interface is active, it needs a link to the
>> consumer interface to be able to provide PHY access for it. Implement this
>> property as phy-consumer.
> 
> So I was having a look at this to see if it was reasonably easy to
> split out the PHY into its own device object, and I'm a bit confused.
> I know basically 0 about MDIO, but wikipedia says that MDIO buses
> have one master (the ethernet MAC) and potentially multiple PHYs.
> However it looks like this patchset has configurations where
> multiple MACs talk to the same MDIO bus. Am I confused about the
> patchset, about the hardware, or about what MDIO supports?
> 

It is quite similar to I2C, a serial interface with one master/controller
and a number of devices (PHYs) connected to it. There is a nice graphic
example at https://prodigytechno.com/mdio-management-data-input-output/.
Not sure I understand what is confusing about it. Can you explain ?

Thanks,
Guenter


