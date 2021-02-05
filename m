Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539931091F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:33:16 +0100 (CET)
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yQN-0006Sz-AG
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7yOr-0005ZN-Q7; Fri, 05 Feb 2021 05:31:41 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7yOq-0006ut-9s; Fri, 05 Feb 2021 05:31:41 -0500
Received: by mail-wr1-x436.google.com with SMTP id q7so7026616wre.13;
 Fri, 05 Feb 2021 02:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ivCx+kOzZi78d/KtulIB/kEbVYmWp21vHM7qn+ZplyM=;
 b=ZlCnxQ7eNgZWkcfXuE6HR3ccxCIwKHyrlt0gl1FtUk6Hus7SI21Pcm/JDpQWjF3mnB
 H0HZ/+FO7KN1OJBCxXTq1xLO3P05EFfRpAtYU6uw71e+Ys7aQBQva1pD2NAZYkZGH4Qr
 KrXfS3cGQYd5snP3J8lSkE3pGvisku0T9s3g3tLc0aMfFli+IZmirl+ZHINP37CtIwqQ
 1AsBOpTEICNcYDFlHPQvzYl+Pu1TMEtRoC7hkcsROXnF68F6k95F0KjourRA/yjQe8gj
 Rhtbn6U0LG9BBhlfn87cUSNpzm0nk6nzQifJN26d2aaPwoyNX+cKd36hYFageeWFZ2Bl
 V/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ivCx+kOzZi78d/KtulIB/kEbVYmWp21vHM7qn+ZplyM=;
 b=ApyHCw/5RWD1MCqpJr3/GJCJhoRBSI8Zk93LqfqPU5JwA7xY44cKmIEwWOlZhg827Q
 siErlr5Y8bf6/SWhF7ZSABkPs1scetjHts0wxN1JCE2z5k7bGnaOd3gX7zQi6trIZGcr
 A3j5HWRka/M+pkMrtdXec+u6GKKyu51GulKAoFzLY+2bubc3d7Dt2L4s5Rqd4WPki9Ev
 j6JWpxwJwwZk2/x+Rlry+tFGqi+Z8nLWt/1daXw6MdLatFRjIw7S2Pc8DfgjDvqzFCpH
 JeQABV2cDmtoOZUkfMwvQud+mRUPYoMwa4zfbTN220DkbwECLqUhpgExhArBUNljifzR
 xwLA==
X-Gm-Message-State: AOAM532M+ZoHN3Ayq1Sto4qXqb7sZC2tBqtKGYlNix36knNwgpIN9TtV
 3oyaaJe3+arcotntV4gTdIIhbj02IZw=
X-Google-Smtp-Source: ABdhPJxE2ubE+Cwai3QUcgumwdgGz7pADgbo6w/vJiCdqTxBVvklD5BgAvxEcDXAMIBeLygOR36Lcg==
X-Received: by 2002:adf:f4c1:: with SMTP id h1mr4306419wrp.102.1612521097700; 
 Fri, 05 Feb 2021 02:31:37 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f3sm9196798wme.26.2021.02.05.02.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 02:31:36 -0800 (PST)
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
To: Peter Maydell <peter.maydell@linaro.org>
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
 <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
Date: Fri, 5 Feb 2021 11:31:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.182,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, schspa <schspa@gmail.com>,
 Kevin Zhao <kevin.zhao@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 11:03 AM, Peter Maydell wrote:
> On Fri, 5 Feb 2021 at 07:53, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Indeed, you found a design issue IMO:
>>
>> Versal creates the "mr-ps-switch" to be explicitly different from
>> the main sysbus memory. TYPE_VIRTIO_MMIO is a SYSBUS device, thus
>> can not be created without being plugged on sysbus.
>> We want TYPE_VIRTIO_MMIO to be TYPE_USER_CREATABLE so we can create
>> it on the command line (like your usage). TYPE_SYSBUS allows such
>> automatic plug it on the main bus, but also maps to main memory.
> 
> That was never the design intent for the virtio mmio transport.
> The idea was that the board creates a bunch of transports
> (unconditionally). The user then uses command line options
> to create virtio backends (blk, net, etc) which get plugged
> into the virtio-bus buses that each transport has.
> 
> virtio-mmio is not user-creatable for the same reason that
> all devices with MMIO memory regions and IRQ lines are not
> user-creatable -- there's no good command line syntax for
> the user to wire them up, and we don't want the user to have
> to know "on this board address 0x50003000 is a good place to
> put a device, and irq 43 is free".

IOW
1/ virtio-mmio must be sysbus-device,
2/ we can not sysbus-map out of main memory so private container
is incorrect, and Versal can not use "mr-ps-switch"?

> 
> thanks
> -- PMM
> 

