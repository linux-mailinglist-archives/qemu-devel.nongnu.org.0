Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136AC37091C
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 23:50:25 +0200 (CEST)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcxVH-0007jq-Tm
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 17:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcxUL-0007B5-Fg; Sat, 01 May 2021 17:49:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lcxUJ-0004tl-E6; Sat, 01 May 2021 17:49:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id l13so44659wru.11;
 Sat, 01 May 2021 14:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jea/l/VEXedTxoCrfocFgcnm3WQ+V38GUtbHb+MoKOA=;
 b=IxvxxTNB+5viLsSnzBZADLBNTXC4ApmQiUGoMO42mNuowBIBE3ULeZNiROmz0ihAZh
 LoAINx55SOfZ3hucH+xUHZHC5WZ47N18Rk+7YblbwHDLMm9aRHSntvXDUznCMqvsAsiF
 6u/L2/irDhmXI6uiAXbqqL9H8wJIQorCIzsrB4H5JqyjLpKVuqi9ULRXttCrP3R0+rLc
 ILTS3C3JO1risf5Ihd70ww6Ysf/sNZG2LH6GuCT+1yoHa2eo97NXY0tK4LghhA/8OHQg
 hNrYm5/z5tN4rdbisZAe2MMNDurcnWKjHir+KXddLk+aaOzXpuNzUo7Gt1lpbhPyoSD+
 XBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jea/l/VEXedTxoCrfocFgcnm3WQ+V38GUtbHb+MoKOA=;
 b=W9u4vb5Iri3vsR5deXBtj1915hdUprgralr2uSrS6Bh4i7nTRqar5Q9pgfIF3aDk61
 ptKPSF+MaRx7ArqDtxOh/kUFzpZ9Gi6uzscR09FxfSypF1prwOg2KUsrYw6FkNQVwGTe
 H9/wj/xt6Mt5ZoQK3EHc7PAjfECCsSG51M9pLW5hOMerJODSGYqWOKTNMhvu2pIckmnR
 9jEqE2DR1WR6zTJDim9zdRuMzN3AUxF9Iq3hf2EhL4JtUeq7s1+1oraJIfhaOHTL/HiL
 ljuTEuXwtVhdNiVXecKxyXFuJGQyQpho0XNRyKawpTdf/FGgHVx/hZ+vU98wYStHfnzB
 Ypfw==
X-Gm-Message-State: AOAM5339If0/BnbtvfycqeLf9beLcejtWDvcIfUhc9sfhdexbX4zwIQF
 saF9vxpnT/LZek3Vhg9quEk=
X-Google-Smtp-Source: ABdhPJw0PSEUpyKInKFd8M72wwsVySHkGhP4MsuFOTYC2fc3oAN7c/QUW8qgxMtkBuxNbeuohGzNoA==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr15800250wrj.75.1619905761192; 
 Sat, 01 May 2021 14:49:21 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id y8sm8668676wru.27.2021.05.01.14.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 14:49:20 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/timer/etraxfs_timer: Qdev'ify reset()
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210423233652.3042941-1-f4bug@amsat.org>
 <20210423233652.3042941-2-f4bug@amsat.org>
 <cb232237-3fa9-c170-2bde-941a6193b90b@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <25aab6f3-4cc2-5cc7-003f-2c4b9ea56907@amsat.org>
Date: Sat, 1 May 2021 23:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cb232237-3fa9-c170-2bde-941a6193b90b@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: qemu-trivial@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/21 6:46 PM, Laurent Vivier wrote:
> Le 24/04/2021 à 01:36, Philippe Mathieu-Daudé a écrit :
>> TYPE_ETRAX_FS_TIMER is a sysbus device, so its DeviceClass::reset()
>> handler is called automatically when its qbus parent is reset.
>> Convert the generic reset to a qdev one, and remove the
>> qemu_register_reset() call.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/timer/etraxfs_timer.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
>> index 5379006086f..3cfab3e3284 100644
>> --- a/hw/timer/etraxfs_timer.c
>> +++ b/hw/timer/etraxfs_timer.c
>> @@ -309,9 +309,9 @@ static const MemoryRegionOps timer_ops = {
>>      }
>>  };
>>  
>> -static void etraxfs_timer_reset(void *opaque)
>> +static void etraxfs_timer_reset(DeviceState *dev)
>>  {
>> -    ETRAXTimerState *t = opaque;
>> +    ETRAXTimerState *t = ETRAX_TIMER(dev);
>>  
>>      ptimer_transaction_begin(t->ptimer_t0);
>>      ptimer_stop(t->ptimer_t0);
>> @@ -343,7 +343,6 @@ static void etraxfs_timer_realize(DeviceState *dev, Error **errp)
>>      memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
>>                            "etraxfs-timer", 0x5c);
>>      sysbus_init_mmio(sbd, &t->mmio);
>> -    qemu_register_reset(etraxfs_timer_reset, t);
>>  }
>>  
>>  static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
>> @@ -351,6 +350,7 @@ static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>  
>>      dc->realize = etraxfs_timer_realize;
>> +    dc->reset = etraxfs_timer_reset;
>>  }
>>  
>>  static const TypeInfo etraxfs_timer_info = {
>>
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> But according to the comment in DeviceClass, we should use the resettable interface now:
> 
> docs/devel/reset.rst

Eh... As a first step, I think we gain in removing the
qemu_register_reset() call.

It seems overkill to use the 3-state reset interface,
but if it is deprecated, then OK.

Thanks for reviewing,

Phil.

