Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9B53ECA43
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 18:38:32 +0200 (CEST)
Received: from localhost ([::1]:49670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFJ9b-00046I-PA
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 12:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFJ8X-0003DT-KB; Sun, 15 Aug 2021 12:37:25 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFJ8W-0001JG-5W; Sun, 15 Aug 2021 12:37:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id k29so20288226wrd.7;
 Sun, 15 Aug 2021 09:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p8bWxxBNduldGiqSyLFAPWnkMWfLD7tkLBa0Zk7fBEI=;
 b=sjkmOJ3djjkza6YQlfl9T6+aIAIuESHFgsirlIUfh3PsawQQ/rdr4KkQ3xWjK9UTMP
 m/JhHzy6serp2NgT+Km/ZOFSvJABHr1xSmuRgm6PGvDyYJGoga0EBzotvyRNEDqNjxVs
 chkv0SCrHuXF391VgVruXvbr0A8c7qUEUmfF/d5JDYNRcaQp/adJvEJ6ZJgfjOJC7JES
 Ih8Z8UJAjQtDGozLhfa07lfnTha7tb4IvuDVyMxx3YRDMDV+MVzYeJpR9iVD/bZlPgRq
 8hbnlC1ob2VW71DUBa/yM6IVrK2JvCW8WDx/PGzDOBVeakxMYiLV/962it9B+Dpimr0w
 FW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p8bWxxBNduldGiqSyLFAPWnkMWfLD7tkLBa0Zk7fBEI=;
 b=eDnf5Xu/JCOIghNO/+4WrDUYlXRpEzZ9JJGa5Ht09XHH3x6gpdHfN+5WB3J5+4B/76
 myFKjcIMr+GzbjgvhtKfBifl/fVTJJciG2osJWaMrY7tHzPWimDqqRzc1ZrKXZw8Z2iF
 NvGgVzDMsSFXUhWumRtt6Sg99FtFbuuEPm2V5VuXQha0a9UIvHBwjqgJcnHbqenU8k/M
 KHyg9DZumx5psBPVOWl0NYWntXIuxrng6MJR99TPPev2+ulWpP4YDwoLh9OdT4rt4EIZ
 kp+8IjNHuKOyMxTtSsQsmkORdEDrypi0xsl0VSQXGhjjvTqI/d9R0+hLfjHuB3lrve8D
 GoTw==
X-Gm-Message-State: AOAM532MX6ScTvC0vrVoaI7hHYw0ThYPDvanwDTjKTA5OdgT/jUXcdtF
 rHtkFZ4zU6alOdHu+zMGWGY=
X-Google-Smtp-Source: ABdhPJzMwPrQlkOQbu7VQMT13IMm9AtQ27f3VaXFQB9uvhScja3EQJnOHgFtuBWyOUa9bAZLPoQrqQ==
X-Received: by 2002:adf:f4cf:: with SMTP id h15mr13948510wrp.67.1629045442367; 
 Sun, 15 Aug 2021 09:37:22 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o17sm7317462wmp.13.2021.08.15.09.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 09:37:21 -0700 (PDT)
Subject: Re: [PATCH for-6.2 10/25] hw/arm: Don't allocate separate
 MemoryRegions in stm32 SoC realize
To: Peter Maydell <peter.maydell@linaro.org>,
 Alexandre IOOSS <erdnaxe@crans.org>, Igor Mammedov <imammedo@redhat.com>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-11-peter.maydell@linaro.org>
 <275a1045-f797-4348-2ee8-c19586ea8225@crans.org>
 <CAFEAcA9PWpMpPxsETpSM75ZjDrDsUaNFUgQC6cPJC10JM9aq6g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a0acb4c-558a-6f89-e0b7-8d65c2d1c404@amsat.org>
Date: Sun, 15 Aug 2021 18:37:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9PWpMpPxsETpSM75ZjDrDsUaNFUgQC6cPJC10JM9aq6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 2:27 PM, Peter Maydell wrote:
> On Thu, 12 Aug 2021 at 13:13, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>>
>> On 8/12/21 11:33 AM, Peter Maydell wrote:
>>> In the realize methods of the stm32f100 and stm32f205 SoC objects, we
>>> call g_new() to create new MemoryRegion objjects for the sram, flash,
>>> and flash_alias.  This is unnecessary (and leaves open the
>>> possibility of leaking the allocations if we exit from realize with
>>> an error).  Make these MemoryRegions member fields of the device
>>> state struct instead, as stm32f405 already does.
>>
>> There is a typo in "objjects".
>>
>> This is something I had issue understanding as I was seeing both
>> patterns in the codebase, thank you for making this clear.
> 
> Basically if there's a struct that the MemoryRegion can live
> in  then that's the best place for it. For some board-level code
> where we haven't needed to subclass MachineState there is no
> convenient struct, so we just g_new(). In a few places like this
> one the board-code pattern has been copied into an SoC object.

FYI since more than 2 years now Igor recommends using DEFINE_TYPES()
for newer QOM style, which makes adding board-specific fields to
MachineState quite easy (see hw/avr/arduino.c or hw/arm/raspi.c).

