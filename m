Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1D21D404
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 12:53:22 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juw5J-0006yv-BR
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 06:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1juw4Q-0006Dl-7y; Mon, 13 Jul 2020 06:52:26 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:42181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1juw4O-0003OU-O4; Mon, 13 Jul 2020 06:52:25 -0400
Received: by mail-ed1-x541.google.com with SMTP id z17so13055894edr.9;
 Mon, 13 Jul 2020 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3G67jKsHCRJ5bPfrH6rxb59LYJUZoYfjRmT+Pruts64=;
 b=muIDe/BpzChXdlAcLkczfrEGmAp11GxfMoRzpt8sADaQeaoh4bvYBNQRdB/7uTxsVF
 hD2cGmL/ZzRdk5oLN1ZasfoI3BKcxCV1j5aqucLk/h9rJL1rjlTi3rU7sPRYQ1fz7IC2
 eM94/AKAPGcycJqXI8O0jfUwyeH7VMj3Ld/tdybFJ9ed7ZQuCNCfAkQnZswvV5cOPIoH
 XUyCRSvuZHT9GJ4FNZF3cd9HH8NrY1kaM0O0aYTH4Fx5kSdAIzqjimcfEVI2o5UCUvvl
 yLra7cp5k7qpElgaWawK3aFLhiHAoBL7HbVCaSEwhWOlFCWfA29+ShBebg43H/GVPpts
 NVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3G67jKsHCRJ5bPfrH6rxb59LYJUZoYfjRmT+Pruts64=;
 b=O/0sz39MMZ1Hf834FtQiGUhWiP6lbwr+jYJkyqWNtF5LDzOMNch797Quk7K7x4VRIn
 cDRVgetQdtuC8WtU5qWe/a4kNe8bfpxPFlusmzDs90CExqZ/sOZBEUUCYrxNyC6FTBb7
 CvVMHtiUnNlgtRiQrUfe2lsGEQpLAsJpCKEoGeIEkNnCbWY7sFz360jHDs7u0OpUMNOI
 SOxt1EuKfABr+mqJGJbxi22yXVeILL99eqcefAa9jHA+m2+sTG0qn+A8/nZudrOH9cdc
 lMLAvbQVKvJ5My67RZax2Hb/gOYlAJRHgakmXM3zPxWPAN56AyaoUxtOOpfsDeWBeMBI
 r4Vw==
X-Gm-Message-State: AOAM533IHA6e40jX0dwLuoWmQtj4HyBzlJwGQJWKOY7s6sDpQIcgL39G
 JM9pRhjDyZttnlWbzjZMMHQBmC4+JP8=
X-Google-Smtp-Source: ABdhPJzFCPb7ObKlMLaDdKTwhruCRFH5KiGspUQWiKWXLg1/oXuL+F7+omnPSwkBxQtMw3El62zSvw==
X-Received: by 2002:a50:bece:: with SMTP id e14mr11267556edk.190.1594637542021; 
 Mon, 13 Jul 2020 03:52:22 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id qc16sm9465728ejb.33.2020.07.13.03.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 03:52:21 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/arm/palm.c: Encapsulate misc GPIO handling in a
 device
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200628214230.2592-1-peter.maydell@linaro.org>
 <20200628214230.2592-3-peter.maydell@linaro.org>
 <4c049b0c-f305-729a-748d-0a7742b496ed@amsat.org>
 <CAFEAcA_JCSs6BCCw-MYOO8RcyXQ_iNZ63KjuwqEPM7yuvWsdTA@mail.gmail.com>
 <c9fe0637-9870-b155-3b50-0da3f03d279f@amsat.org>
 <CAFEAcA_wrzBj_YNSehG8fDy-0et9gaE98eMuw6agsmkDJ0MoEA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ac8308ac-d4c5-735b-d4ef-9d2cf2bfce97@amsat.org>
Date: Mon, 13 Jul 2020 12:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_wrzBj_YNSehG8fDy-0et9gaE98eMuw6agsmkDJ0MoEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/20 12:31 PM, Peter Maydell wrote:
> On Mon, 13 Jul 2020 at 11:21, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 7/13/20 12:05 PM, Peter Maydell wrote:
>>> On Mon, 13 Jul 2020 at 09:57, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>> Why not make it a generic container in the MachineState and create
>>>> the container in hw/core/machine.c::machine_initfn()?
>>>
>>> I don't think we create containers like that for any other
>>> machine, do we?
>>
>> No but maybe we could. Most boards have some GPIO/LED/reset switch
>> button. Do all machines have a NUMA memory device? Do all machines
>> have a dtb? Do all machines use NVDIMM devices? I think we have
>> more machines using GPIOs than machine using NVDIMM. Anyway I don't
>> mind, I was just trying to figure where this container belong on QOM.
> 
> I think that if machines were qdev objects with the usual
> reset/gpio/etc capabilities, I might have just implemented
> this as part of the machine object; but they aren't, and
> it didn't really seem like the right approach to create an
> ad-hoc "container that sort of corresponds to the whole
> machine". Also, since these machines are largely orphan
> I tend to favour smaller-scale interventions that push them
> in a better direction rather than more sweeping changes.

Fair enough. There is something that bugs me in the MachineClass,
but this is not this series fault. I guess by adding such containers
in machines, we'll eventually figure out what is the best QOM design
for it.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


