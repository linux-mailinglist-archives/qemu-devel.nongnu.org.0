Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203916E67E9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 17:19:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pon6V-0007mH-SK; Tue, 18 Apr 2023 11:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pon6T-0007iw-C9; Tue, 18 Apr 2023 11:18:45 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1pon6Q-0005OY-Qw; Tue, 18 Apr 2023 11:18:45 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-244a5ccf13eso1825583a91.2; 
 Tue, 18 Apr 2023 08:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681831120; x=1684423120;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RG47nneokY2awkxBg61etIe9N4zykVOuVzDXJHnMNqo=;
 b=JS4c5RD448iXplEsqUrGidEwISBx7onLeIHO/i/g9M7qdU+Ves141RSl2FPsViaOWa
 mpdTLcegUYJ8PT3cab2bvTddgvo/xn1c1JBfX6XxIOnQzHJbPzatTlcZXGB7Qn5E/D+u
 mpgAie0T6pzU3h5KTJ2OdgINxtmFDgve7h3L+sXj6TLmolW2sOcv2tQOQHRpJX6nshO3
 CDJlQVMRaNlPp/+U7tZrfJFSCPP2LvmYob3UamYHsiG9/bAsZ220rNQjT3JK/j6ncYN/
 CaHLGEKzzM/p3tBFM9EwCQgYH3RpyYJuONjOlDJjaOwGbBPoGfzeSGAQpqH3U4nf0jJM
 kKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681831120; x=1684423120;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RG47nneokY2awkxBg61etIe9N4zykVOuVzDXJHnMNqo=;
 b=Sst0PGr3K9fQiEB8LsM3NEj4AzIifSdkU+pGKdTkqMlCEkOil5YtGIv1qgHLpv9zvV
 Tmp1cWZnkko9y1hu24bAgbrUbiAU3yByoxoBqCBAJbePkuGj4A+cPgcK7sUG1fiGhiMY
 xXoWXJjd4Th+8kL6f5DqdMfiTSZTS7plcXTd/wD7SHU0toB1ZTPDxbpYMNQR6JqpTNyH
 uzPchCNWZU5cbfoVnTk9bURMFYdsW3M3jTG/Bsug25cbhqN6a8Q4GS9UDzLE7qxW7299
 RhXr6KYIYCmjHFvUJNyHgLYLXdM2vmmeP2sXTE4jly58wltq8VqCt7iOwDPM/wgASSS4
 iTHA==
X-Gm-Message-State: AAQBX9ccN1DKqBwyG43Jueph3wg3t1Frx6W+votj8Q/cd1IvXJXlsWCp
 mDHxwsPb/L/uiDGFqEqg/S8=
X-Google-Smtp-Source: AKy350a+w62efKojNtSnahet/mMMM19tgpwGPnULRZBUrPENEG4Msmegqa2ff/o239SKUGXkHb9J9g==
X-Received: by 2002:a17:902:c410:b0:1a1:f0ad:8657 with SMTP id
 k16-20020a170902c41000b001a1f0ad8657mr3355630plk.37.1681831119867; 
 Tue, 18 Apr 2023 08:18:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902820e00b001a240f053aasm9665224pln.180.2023.04.18.08.18.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 08:18:39 -0700 (PDT)
Message-ID: <79e67479-6785-c064-6aae-edd1ba2327cd@roeck-us.net>
Date: Tue, 18 Apr 2023 08:18:37 -0700
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
 <c24f50af-1dbb-6a1b-ca21-414039c10602@roeck-us.net>
 <CAFEAcA9VQHa=Eenyon-kaiabayM5YY7FHEJsEWOzjzj3rXaSaA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/5] Support both Ethernet interfaces on i.MX6UL and i.MX7
In-Reply-To: <CAFEAcA9VQHa=Eenyon-kaiabayM5YY7FHEJsEWOzjzj3rXaSaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=groeck7@gmail.com; helo=mail-pj1-x1035.google.com
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

On 4/18/23 07:46, Peter Maydell wrote:
> On Tue, 18 Apr 2023 at 15:42, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 4/18/23 05:10, Peter Maydell wrote:
>>> On Wed, 15 Mar 2023 at 14:52, Guenter Roeck <linux@roeck-us.net> wrote:
>>> So I was having a look at this to see if it was reasonably easy to
>>> split out the PHY into its own device object, and I'm a bit confused.
>>> I know basically 0 about MDIO, but wikipedia says that MDIO buses
>>> have one master (the ethernet MAC) and potentially multiple PHYs.
>>> However it looks like this patchset has configurations where
>>> multiple MACs talk to the same MDIO bus. Am I confused about the
>>> patchset, about the hardware, or about what MDIO supports?
>>>
>>
>> It is quite similar to I2C, a serial interface with one master/controller
>> and a number of devices (PHYs) connected to it. There is a nice graphic
>> example at https://prodigytechno.com/mdio-management-data-input-output/.
>> Not sure I understand what is confusing about it. Can you explain ?
> 
> I guess I don't understand what the topology is for these specific
> SoCs, then. If there's only one master that might be connected
> to multiple PHYs, why does one ethernet device in QEMU need to
> know about the other one? Are the PHYs connected to just that
> first ethernet device, or to both? This bit in your cover letter
> makes it sound like "both ethernet interfaces connect to the same
> MDIO bus which has both PHYs on it":
> 

Yes, that is exactly how it is, similar to the configuration in the picture
at prodigytechno.com. I don't recall what I wrote in the cover letter, but
"Both Ethernet PHYs connect to the same MDIO bus which is connected to one
of the Ethernet MACs" would be the most accurate description I can think of.

>>> The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
>>> be connected to separate MDIO busses, or both may be connected on the same
>>> MDIO bus using different PHY addresses.
> 

Each MAC (Ethernet interface, instance of TYPE_IMX_FEC in qemu) has its own
MDIO bus. Currently QEMU assumes that each PHY is connected to the MDIO bus
on its associated MAC interface. That is not the case on the emulated boards,
where all PHYs are connected to a single MDIO bus.

Userspace, when talking to the Ethernet controllers, knows that the PHY
of the second Ethernet controller is connected to the MDIO bus on the first
Ethernet controller. QEMU has to be told about that and otherwise misses that
MDIO commands sent to the second PHY (on the first Ethernet controller)
influence the second MAC interface.

 From this exchange I can only assume that my implementation is unacceptable.
All I can say is that it works.

Thanks,
Guenter


