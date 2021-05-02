Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF44370BBE
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 16:01:34 +0200 (CEST)
Received: from localhost ([::1]:52242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldCf5-0006fG-Hf
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 10:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ldCcf-0005tO-2m; Sun, 02 May 2021 09:59:01 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:45737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ldCcd-0002Xh-5V; Sun, 02 May 2021 09:59:00 -0400
Received: by mail-oi1-x22d.google.com with SMTP id n184so3023418oia.12;
 Sun, 02 May 2021 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:references:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w5rWnXeQy+b5J2JmSphmUkxMB5GoFeVHGNc8MmdpzcA=;
 b=Lbo6gBduQDNr3fbxKJxgPDAb0Lji9vFlM3YiWycJB/hE+Fl6C4quWUKHIvgM7RTwhU
 wSsf1FKKJZA1F4Oacn/YED39MN287jVDcuTqNuiSc01gr5Il/FHys2CptUpbYRH2e8rr
 usBp+VmW6qGUaKjuHjq8OXmos4azAoHeLW2EEPmj6C3d4N/cNC0OK9CiTo6drmkuw9Hz
 5b/7/TNYpzLuma0RIQUS2I8qsc7s+J4guR+//zAy64jKJTPe94PewK6eQGhBRbZ/Jg/N
 nZ/gowiMfNe92L5XXj2gEk2eFQ0H5rNcuh911RgmDHhFeIeENQVAtlKyiUgMHWYLyPxX
 3Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:references:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w5rWnXeQy+b5J2JmSphmUkxMB5GoFeVHGNc8MmdpzcA=;
 b=NEzP8F089Lq6HHzcXnDxNM4oR6z0Da9lewJFVxV3JEmbsNwgrC9s8JqlH0quPQHweW
 MqBMYKgUSyPS58HRrF9XbYgsbXYr5sTl4A2vfzh4kXAWN/jXxFmKQL+JaV4UBFIxPeF8
 id4Wh2zL8CxmMjET0vYQMYAsh9+A1C86QlrAJVFLAukYbJGY0QmLhFUfs5SgeXQ2ATs0
 2cVHWjqAlAASeeunL3pPjIL19vBiMapHi7798LjEzjWOxWTd/ub2BFEu4KKuRrBR3OAG
 tQPWFKiwXOEQgPr0jMUdW1lqo14bIb8bOEcAd5z9dz0+IwTSacH3eEXkshNIyHd5UJUQ
 3V2g==
X-Gm-Message-State: AOAM531zbiI8W4IQmttjZkx3UFNn9GuKBVWSEdQTLAEcJpvd+cH7Jjkz
 /viGjaaHhIDQwrzM3++ClS4r4UNhHt4=
X-Google-Smtp-Source: ABdhPJyvuuDwyKoc2EbcfhUPiBP7hkdJWOLOfM36cdq29Q+lstO3+N+Rrg/oYRzxrggNUpG+8aX1zQ==
X-Received: by 2002:aca:fd06:: with SMTP id b6mr17616525oii.89.1619963937135; 
 Sun, 02 May 2021 06:58:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 i17sm1074550oie.36.2021.05.02.06.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 06:58:56 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
 <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
 <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
 <6f92b247-cc78-1e26-5809-2ae4809be5c6@amsat.org>
 <b94a7a17-75bb-5b8d-adf4-ab2ff33c0553@roeck-us.net>
 <CAEUhbmVxBiYo_=Xx4w=4d2Y+DYHuHzKFahbUG-7qFS4THFqAkg@mail.gmail.com>
 <72bc74d2-053f-b0ab-b90d-391f777dfce3@roeck-us.net>
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
Message-ID: <29175c15-4edb-849a-a1be-fae0406909be@roeck-us.net>
Date: Sun, 2 May 2021 06:58:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <72bc74d2-053f-b0ab-b90d-391f777dfce3@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/21 6:37 PM, Guenter Roeck wrote:
> On 5/1/21 5:24 PM, Bin Meng wrote:
>> On Sun, May 2, 2021 at 7:21 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 5/1/21 2:40 PM, Philippe Mathieu-Daudé wrote:
>>>> On 5/1/21 10:12 PM, Guenter Roeck wrote:
>>>>> On 4/30/21 9:28 PM, Bin Meng wrote:
>>>>>> On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
>>>>>>>> From: Bin Meng <bin.meng@windriver.com>
>>>>>>>>
>>>>>>>> At present, when booting U-Boot on QEMU sabrelite, we see:
>>>>>>>>
>>>>>>>>   Net:   Board Net Initialization Failed
>>>>>>>>   No ethernet found.
>>>>>>>>
>>>>>>>> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
>>>>>>>> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
>>>>>>>> board, the Ethernet PHY is at address 6. Adjust this by updating the
>>>>>>>> "fec-phy-num" property of the fsl_imx6 SoC object.
>>>>>>>>
>>>>>>>> With this change, U-Boot sees the PHY but complains MAC address:
>>>>>>>>
>>>>>>>>   Net:   using phy at 6
>>>>>>>>   FEC [PRIME]
>>>>>>>>   Error: FEC address not set.
>>>>>>>>
>>>>>>>> This is due to U-Boot tries to read the MAC address from the fuse,
>>>>>>>> which QEMU does not have any valid content filled in. However this
>>>>>>>> does not prevent the Ethernet from working in QEMU. We just need to
>>>>>>>> set up the MAC address later in the U-Boot command shell, by:
>>>>>>>>
>>>>>>>>   => setenv ethaddr 00:11:22:33:44:55
>>>>>>>>
>>>>>>>
>>>>>>> With this patch in place, the standard Ethernet interface no longer works when
>>>>>>> booting sabrelite Linux images directly (without u-boot) using the following
>>>>>>> qemu command.
>>>>>>>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
>>>>>>>         ...
>>>>>>>
>>>>>>> The Ethernet interface still instantiates, but packet transfer to the host
>>>>>>> no longer works. Reverting this patch fixes the problem for me.
>>>>>>>
>>>>>>> Is there a qemu command line parameter that is now necessary to instantiate
>>>>>>> the Ethernet interface when booting Linux ?
>>>>>>
>>>>>> Enabling "guest_errors" shows that Linux kernel fec driver is trying
>>>>>> to read PHY at address 0, which is not what we want.
>>>>>>
>>>>>> [imx.fec.phy]imx_phy_read: Bad phy num 0
>>>>>>
>>>>>> The device tree blob of the sabrelite does not contain a node for the
>>>>>> ethernet phy specifying phy address, so I suspect Linux kernel driver
>>>>>> is using default phy address 0 instead.
>>>>>>
>>>>>> Could you please test on a real hardware to see what happens?
>>>>>>
>>>>>
>>>>> The problem is that qemu returns 0 when the OS tries to read from a
>>>>> non-existing PHY. Linux expects it to return 0xffff, and believes that
>>>>> a PHY is there if 0 is returned.
>>>>
>>>> Correct.
>>>>
>>>
>>> I'll send a patch. Next question is why the Ethernet interfaces on mcimx6ul-evk
>>> and mcimx7d-sabre don't work. I either get no connectivity at all (similar to
>>> the above) or something like
>>>
>>> fec 2188000.ethernet eth1: Unable to connect to phy
>>> ifconfig: SIOCSIFFLAGS: No such device
>>>
>>> Any idea ?
>>
>> I don't see these 2 are supported targets of QEMU:
>> https://wiki.qemu.org/Documentation/Platforms/ARM
>>
> 
> Reality says otherwise.
> 
> $ qemu-system-arm --version
> QEMU emulator version 6.0.0 (v6.0.0-25-geac5bb0cc1-dirty)
> Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
> $ qemu-system-arm -M ? | grep mcim
> mcimx6ul-evk         Freescale i.MX6UL Evaluation Kit (Cortex A7)
> mcimx7d-sabre        Freescale i.MX7 DUAL SABRE (Cortex A7)
> 

Anyway, the underlying problem is that the phy chips are not connected
to the MDIO bus associated with each Ethernet controller. In other words,
unlike the current imx fec emulation suggests, there is no 1:1 connection
between Ethernet and phy. This is even mentioned in commit 461c51ad42
("Add a phy-num property to the i.MX FEC emulator"):

"As an example with the i.MX6UL the NXP SOC has 2 Ethernet devices but
 only one MDIO bus on which the 2 related PHY are connected but at unique
 addresses."

Unfortunately that commit doesn't actually solve the problem where 2 Ethernet
devices are connected to a single MDIO bus; it just adds support for setting
the phy address.

I have no idea how to solve that in a clean way in qemu.

Guenter

