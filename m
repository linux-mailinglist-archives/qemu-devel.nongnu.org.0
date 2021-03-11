Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C1337BBB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:07:33 +0100 (CET)
Received: from localhost ([::1]:60276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPie-0004FH-C1
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKPaZ-0006ss-FU
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:59:12 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKPaX-0005U6-Tk
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:59:11 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so13430648wmj.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=953FIs7VCz04sZoGgQTuAAG3DiLAe03U9kM64BRsY8A=;
 b=JZ98Fe2B7pbFKFul+7qO++joXXTgErdEBoeEhItBP1fLmNOze+f1E3FcQux1rDuJoQ
 et4SeuTOmv5HrDPYj6h+AuZ4eBK4dgFqAR5h6mBuGlT1FXrA2Bq60KqI+E0txs8jTR5J
 yiqamWfUJCZ/3ipPLGxSio6dqwTlstW0MlG3cxFDrvziSfP7RDmex+AAQZp3Yr4xCLfv
 xTwVrAA409+Hz2/uBrc7XI9KRdV5y7gFIK3y4PzamVZvDc9tVPtsc4QKOgbDhJeC37gU
 ZRIJucqcGuzcCbc9+wlXm9LtTtANv5WdMNcJgr0h3K59Vv7lrlZmhwGZtIYDA37eOhMT
 MyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=953FIs7VCz04sZoGgQTuAAG3DiLAe03U9kM64BRsY8A=;
 b=r93FJ0uxCU2Pm6lWpjA3CqnAQq8rEsAV0J1Xnv/cMMkCBOBsQpuxl+aUza2IL/Otg+
 /AJ8rAYff/PT35ygZrT0/AoA2BecdS9h02nCETmbySgQH12h3KVy4G02wXEbsM8EmKHT
 ItqescfurWfr+h2xmnETokFPrgg3A0pxvqeVFYoQMISsL2r6z8tMLich2OrtiKWYMBaK
 NRIpBbE8EacZ03OkLB/SXcJbWLXnWl6H8jd/tGO9ROPWLayNFOBQ92bGuticduYQSDO5
 QW/sMqwOU3WWwPVBcOPYfKGspTkarTQNX/UbwDFCedSQuKzLVk/wOuqpkk7KEEjct8JK
 EFjA==
X-Gm-Message-State: AOAM532zLk8EwexvZKrtbq9RqKmJSbvuYGDzMow0CRPyGnlH/EDuZjLk
 9jzGrHHWQ3atm3JBw2of1eA=
X-Google-Smtp-Source: ABdhPJwRLNvpN6bSRqfMhS4G73uflkn/rMY9xencC5P7+uBbrkq9Mv5PA49/AWAV/G+iITmtiD9yhQ==
X-Received: by 2002:a1c:f708:: with SMTP id v8mr9151717wmh.25.1615485547978;
 Thu, 11 Mar 2021 09:59:07 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j13sm4853679wrt.29.2021.03.11.09.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 09:59:07 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
To: Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
 <20210310191255.1229848-1-f4bug@amsat.org> <20210310194924.GF6530@xz-x1>
 <5e53b99f-548c-8da9-f6fd-9c764642350b@amsat.org>
 <20210310202919.GH6530@xz-x1>
 <a97eb0b5-d3fd-ca44-4490-c5e5bc796699@amsat.org>
 <a64ff8f0-5db1-c338-b99b-7a74a150a770@amsat.org>
 <20210311172710.GH194839@xz-x1>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b066718e-841a-9095-0bc5-fcd19cc08864@amsat.org>
Date: Thu, 11 Mar 2021 18:59:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311172710.GH194839@xz-x1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 6:27 PM, Peter Xu wrote:
> On Thu, Mar 11, 2021 at 05:21:49PM +0100, Philippe Mathieu-Daudé wrote:
>> +Aspeed team
>>
>> On 3/11/21 1:18 PM, Philippe Mathieu-Daudé wrote:
>>> On 3/10/21 9:29 PM, Peter Xu wrote:
>>
>>>> Yeah no worry - it's just that I feel one memory_region_init_alias() call is
>>>> probably missing in your huge series somewhere, so that you'll take that alias
>>>> MR as subregion rather than the real MR (which is the root of one AS).
>>>
>>> OK, with your earlier comments start + Mark other comment I start
>>> to understand better.
>>>
>>> So far:
>>>
>>> (1a) AddressSpace is a physical view, its base address must be zero
>>>
>>> (1b) AddressSpace aperture is fixed (depends on hardware design,
>>> not changeable at runtime
>>>
>>> Therefore due to (1a):
>>> (2) AddressSpace root MemoryRegion is a container and must not be
>>> mmio-mapped anywhere (in particular not on SysBus).
>>>
>>> (3) If hardware has a MMIO view of an AddressSpace, it has to be
>>> via a MemoryRegion alias. That way the alias handles paddr offset
>>> adjustment to the zero-based AddressSpace root container MR.
>>> Aliasing allows resizing the alias size without modifying the AS
>>> aperture size (1b).
>>>
>>> I'll start adding assertions for (1a) and (2) in the code base and
>>> see if (3) adjustments are required.
>>
>> So using:
>>
>> -- >8 --
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 874a8fccdee..8ce2d7f83b9 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -713,6 +713,12 @@ static MemoryRegion
>> *memory_region_get_flatview_root(MemoryRegion *mr)
>>                  continue;
>>              }
>>          }
>> +        if (mr && mr->addr) {
>> +            error_report("Detected flatview root memory region '%s' with"
>> +                         " non-zero base address (0x%"HWADDR_PRIx"):
>> aborting",
>> +                         memory_region_name(mr), mr->addr);
>> +            abort();
>> +        }
>>
>>          return mr;
>>      }
>> ---
> 
> Maybe it works, but it looks a bit odd to test here.  What I meant was
> something like attached.
> 

> Maybe it's still legal to make the root mr a subregion of another, so maybe I'm
> completely wrong... then the patch attached won't make any sense either.

Maybe it does, and we need to rework some boards code.
With your patch applied:

$ ./qemu-system-ppc -M 40p
qemu-system-ppc: softmmu/memory.c:2445:
memory_region_add_subregion_common: Assertion `!subregion->is_root_mr'
failed.
Aborted (core dumped)

$ ./qemu-system-arm -M ast2600-evb
qemu-system-arm: softmmu/memory.c:2445:
memory_region_add_subregion_common: Assertion `!subregion->is_root_mr'
failed.
Aborted (core dumped)

>  It's
> just that in my mind each MR should have a "parent" - for normal MR it's the
> container MR, then for root MR it's easier to see the AS as its "parent".
> 
> Maybe Paolo could clarify this..
> 
> Thanks,
> 

