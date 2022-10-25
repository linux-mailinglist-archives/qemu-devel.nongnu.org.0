Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BAB60CDB5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:39:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onK7t-00027J-64; Tue, 25 Oct 2022 09:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1onK7p-00022D-6Q
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:37:49 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1onK7n-0004Bk-9l
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:37:48 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so4855526fac.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=brl/hi0cQa7ipPTyzxa6im27ATdcGfXWodgfAeRH4ZM=;
 b=F1uvKCtIDSo2aqhMfIz8Rn9OW+fwdyJoxRE1SULaZ+Rld1a/nqsFT0cpGQykFpyK86
 7ye2xg0XonK1YgQcUZXaEtiqNGBjNeFSUyhPFiF2bBGJY+zHhSDU0reugUSYywpCRJ37
 Y+xxm8NFMYGSLAK1YdydP3gcmqq3InvbK+Ev47k+GEZzd5eGqkXjt/HB9+FPFs5ZqVBc
 Lk9Ja298TKVIoAFYmg0LAEXSUSleAPS9KztJZWhm4b2qCatN+KkrapDfWdhDfvfRgSj7
 gq/V3CDCCAZeXPD4c80E6N11Z/kAwwxtsxZd0nuoEIrMAJm5ABhzZRHUZJOlahOx8BCJ
 gDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=brl/hi0cQa7ipPTyzxa6im27ATdcGfXWodgfAeRH4ZM=;
 b=4+yZuba8giENX1W0D60ruz4I62Az9WRFU+6ho9n02kM4FM+fFRDQ+Yvbx7ivyLkW31
 8UXtBQMJHOqubh20Ed3x2NY6z/T+k6nJXsgyaFWvkgxblbafjZDjFjRC73m1/Pae9hUK
 r0a8PRw5jtFY47QvoidCG09qHx3yxPQa/WMfLFL6Fg47q49t15MBNCHC+FUiL5RxjFiN
 eUdGJJZmidZBHpkypptQpv4jHYuS3IehbOMEsnAhY+4ssF6HBRsPL93IVl7Hc6IeX/HE
 r4921QIg+hk6be+mIIMGZsRhLjFneAXZSlPYUig0KtnN7kVTCyZ5ITTRGZ/ppeskIIwu
 A3tg==
X-Gm-Message-State: ACrzQf2TujHDJ/fWBtUnKijgZ0fqfU2l7i25trlVugDWMonKmwktfDJf
 gdicXubURdczkEjQ4xv6l6M=
X-Google-Smtp-Source: AMsMyM61CTC9Wrd20F+/IvUibTEgP9ylbtXVtJINr7pl81stkrr8NW5kEp7nfjWjnoB8IFYgkjj+XQ==
X-Received: by 2002:a05:6870:d190:b0:13a:b71a:c1d2 with SMTP id
 a16-20020a056870d19000b0013ab71ac1d2mr22043990oac.22.1666705065696; 
 Tue, 25 Oct 2022 06:37:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a544e0f000000b0035468f2d410sm905162oiy.55.2022.10.25.06.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 06:37:44 -0700 (PDT)
Message-ID: <6c770eba-c3e4-bf11-151c-18aae4d82ddf@roeck-us.net>
Date: Tue, 25 Oct 2022 06:37:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Erik Smit <erik.lucas.smit@gmail.com>, Joel Stanley <joel@jms.id.au>
References: <f9a80497-bdfa-f3e3-1e32-75687d5f7256@roeck-us.net>
 <527a218f-96b8-8123-730d-ade3fe7f0d39@kaod.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: soc_name for supermicrox11-bmc machine: ast2400-a1 or ast2500-a1 ?
In-Reply-To: <527a218f-96b8-8123-730d-ade3fe7f0d39@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=groeck7@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/24/22 23:25, Cédric Le Goater wrote:
> Hello Guenter
> 
> On 10/24/22 22:56, Guenter Roeck wrote:
>> Hi,
>>
>> I always wondered why I am having trouble running Linux on supermicrox11-bmc.
>> Building the kernel with aspeed_g4_defconfig results in its clock running
>> at ~20x the real clock speed, and kernels built with aspeed_g5_defconfig
>> do not boot at all.
>>
>> I ended up spending some time on it last weekend and noticed that the SOC
>> is configured to ast2400-a1. However, the Supermicro documentation as well
>> as the devicetree file in the Linux kernel suggest that the SOC on the X11
>> board is an ast2500.
> 
> It is true that the Linux DT file includes an AST2500 SoC.
> 
> However, the QEMU BMC machine was added to support such boards :
> 
>     https://www.supermicro.com/en/products/motherboard/X11SSL-F
> 
> where it says ASPEED AST2400 BMC for IPMI and graphics. The firmware
> detects the SoC as an AST2300, which means it doesn't have support for
> the ast2400 ...
> 

Interesting. I was looking at

https://www.supermicro.com/en/solutions/management-software/bmc-resources

where X11 boards are associated with AST2500, and X10 boards with AST2400,
However, I do see that the motherboard list shows that it is indeed a mixed
bag.

> 
>> Indeed, it turns out that all my problems are gone if I change the SOC
>> to ast2500-a1 and use aspeed_g5_defconfig to build the Linux kernel.
>>
>> Was there a reason to select ast2400-a1 for this machine, or is that
>> a bug ?
> 
> 
> May be there were multiple generations of the X11 mother boards.
> 

Looks like it.

> It wouldn't be difficult adding a new supermicrox11-<something>-bmc
> machine with an AST2500 SoC for your needs.
> 

Makes sense.

Thanks,
Guenter


