Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50F835E406
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:33:33 +0200 (CEST)
Received: from localhost ([::1]:46312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLym-0007n7-Pk
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWLut-00068Q-Cp; Tue, 13 Apr 2021 12:29:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWLur-0000AP-K1; Tue, 13 Apr 2021 12:29:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 g66-20020a1c39450000b0290125d187ba22so8752733wma.2; 
 Tue, 13 Apr 2021 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sAyZDV8ez0Fyur5MK2rJoUhbTVyXT9k2cb019Jq9DjI=;
 b=ezrL2qGWE5rmuSdoJIvwN6cqSAtqkcJuKT50ENwTkYC5e3nHP18fAVU2Pfby+iCYFf
 6xKemIXjPFsRc2P3T9KFIat4LtIEnb1ZB/uKQ5Y9EfhBWe5kfE2w3Lasu8sx5jF7VTkf
 BA0DrYjr3c5szYy792/fXNRPC8fMe8bhog6No1knxBGjE2CjdboEvILCP6lISKEONNsi
 B5ByzI4KIH7Mp8+1HKqkpIbVg/1Mk6rswFw7IruC783lqifUsmCgcZw2ZI261owv3eEp
 AAw3z4C++Vxj2Uu63IKonf1CnATUQcyfjfIKuJ3rsxvEb7p6AdVy8vq8lswojyGmavgM
 qM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sAyZDV8ez0Fyur5MK2rJoUhbTVyXT9k2cb019Jq9DjI=;
 b=jYUYL1f7FzWxnUFyJlTUQsocg2G9w/mbGFDlyx0ki35MbLOvlyxV5aQF4fZGs6YvQF
 11iC3SDhKZ6/Wxf+z08fhDwkBvGVV4d8PqldLU6LCvOf3ezWkVoWJWM6/lQVtBE59ASf
 SS8zTNR0/VSaMSOpjXDFFvXg3vX3dqqHyzl/Jb9MS/mq5sdqgfb3ZesVk36ZryetAxkx
 LluWI9kxpEhGtyJP82KeYCwdITbOpdk9nBs6sL09yufR5yXdeuj9KLfgQGZPszjUR3BL
 Y8VHhcCiywc6KAgKM3KL/RzoIRI8Lyd4Y8W1D24ahmaLS+YgLgIYMTX572vod7ztFz3q
 PoPA==
X-Gm-Message-State: AOAM530GAJ3wMlbzqyNJdaq4+qShE/oQv8JAa0ZuhL0ZCiStXySsrcB+
 84TtaE/szJmFzW6pj0+3yP0=
X-Google-Smtp-Source: ABdhPJxj/8gAeuw1wBZw7cZWMVL+eX0Jy0hsGZNmpTaPagd0upE6sg038PPZmVgQJXzN0aKXNez0uA==
X-Received: by 2002:a1c:750d:: with SMTP id o13mr822778wmc.76.1618331367711;
 Tue, 13 Apr 2021 09:29:27 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z15sm14354959wrv.39.2021.04.13.09.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 09:29:26 -0700 (PDT)
Subject: Re: [PATCH 0/3] mps3-an524: support memory remapping
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210412134317.12501-1-peter.maydell@linaro.org>
 <5ae470a2-d10a-13a3-4dc6-62490a940e13@amsat.org>
 <CAFEAcA8wTdQpYhsDzcXZQG=yqxoQumoZj4TgPjEZjM6GgHmTvQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fab25109-f8c9-f8e2-4d56-ba76c5c79341@amsat.org>
Date: Tue, 13 Apr 2021 18:29:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8wTdQpYhsDzcXZQG=yqxoQumoZj4TgPjEZjM6GgHmTvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 4/12/21 4:48 PM, Peter Maydell wrote:
> On Mon, 12 Apr 2021 at 15:37, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> On 4/12/21 3:43 PM, Peter Maydell wrote:
>>> The AN524 FPGA image supports two memory maps, which differ
>>> in where the QSPI and BRAM are. In the default map, the BRAM
>>> is at 0x0000_0000, and the QSPI at 0x2800_0000. In the second
>>> map, they are the other way around.
>>>
>>> In hardware, the initial mapping can be selected by the user
>>> by writing either "REMAP: BRAM" (the default) or "REMAP: QSPI"
>>> in the board configuration file. The guest can also dynamically
>>> change the mapping via the SCC CFG_REG0 register.
>>>
>>> This patchset adds support for the feature to QEMU's model;
>>> the user-sets-the-initial-mapping part is a new machine property
>>> which can be set with "-M remap=QSPI".
>>>
>>> This is needed for some guest images -- for instance the
>>> Arm TF-M binaries -- which assume they have the QSPI layout.
>>
>> I tend to see machine property set on the command line similar
>> to hardware wire jumpers, externally set (by an operator having
>> access to the hardware, not guest code).
>>
>> Here the remap behavior you described is triggered by the guest.
>> Usually this is done by a bootloader code before running the
>> guest code.
>> Couldn't we have the same result using a booloader (like -bios
>> cmd line option) rather than modifying internal peripheral state?
> 

(

> In the real hardware, the handling of the board configuration
> file is done by the "Motherboard Configuration Controller", which
> is an entirely separate microcontroller on the dev board but outside
> the FPGA, and which is responsible for things like loading image
> files off the SD card and writing them to memory, setting a bunch
> of initial configuration including the remap setting but also
> things like setting the oscillators to the values that this
> particular FPGA image needs. It's also what makes the board
> appear to a connected computer as a USB mass storage device so
> you can update the SD card files via USB cable rather than doing
> lots of plugging and unplugging, and it is what loads the FPGA
> image off SD card and into the FPGA in the first place.

) [*]

> QEMU is never going to implement the MCC as a real emulated
> guest CPU; instead our models hard-code some of the things it
> does. I think that a machine property (a thing set externally
> to the guest CPU and valid before any guest CPU code executes)
> is a reasonable way to implement the remap setting, which from
> the point of view of the CPU inside the FPGA is a thing set
> externally and valid before any guest CPU code executes.

OK now I understand the picture, the MCC is external. In that case
the machine property is a clean way to address that.

Could you add the first paragraph of your answer ([*]) in patch 3
description (before the current comment) to make it clearer?

Thanks for the clarification,

Phil.

