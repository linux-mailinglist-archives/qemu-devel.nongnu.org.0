Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9766677A94
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:10:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJvet-0004cQ-92; Mon, 23 Jan 2023 07:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJveq-0004aE-Om
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:10:40 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJveo-0003Kj-33
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:10:40 -0500
Received: by mail-wm1-x330.google.com with SMTP id l8so8826890wms.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 04:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2BWq5n3drYbZxc9eXEogamswrsQbLJ3xXLmasblSQcs=;
 b=zz0qZx3QvXzUwjAmiKTfz3a+y4DvRI648pm3c8dU9S7OqSCQIl7rY+M8SHN7Gfqhcq
 m6CBq1gBcztEd9/l/9qpm3RhuZDktTUQHqqYs7GPYbK5z40hCNLivejwmzCvxwkCTBTz
 6RTAROl2BS1HefmAgDV0M24HPT7CL4bXP6IsD8kGkwg0NTq3vB6FOp4m6PzIfFPvD626
 atX+mGEx2+DelrsFZUkmoZrkhUVAweCFozIeG/q8T5ItTj9MMYW+e7Jl7hCPZS6lMf52
 tRvLsMzkVnUYe5FIszWbC5TnzLHBgIt3B50o4X7EoUQh9LWlkVw68ogYqScwN3BwbUj9
 zd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2BWq5n3drYbZxc9eXEogamswrsQbLJ3xXLmasblSQcs=;
 b=SmDgHN88bNFBnc+Rq6J6IJbhIWh3AezBJxkQaTmyMkWUg4jnpnv3Cc9lURgLIzhsO/
 epuhIksKpEObrXZgnIWWgLqkOE/5ggg5ExHiJIgLukEgDlmqNEECkVmIlqVBXFpmjfa3
 iXZoiPyAOcCoKfKEFMFn2du7N4voAAX2FePD02uiz9vkHKV39SeD0E+iVWj7gurmwhw8
 had1upeUwRzZcUUEG/DmUdAxCB8Nwx5mm6K6vTZieKIrpbeYUKnEqzuOkzlxXuZYoZPg
 JDTBBjcdz/eExFNEWUJ6y49fMfk4KiJMgwWlyeDJMUa9fOR8fEAwUi8fSjnu5Fyt7AS8
 3+tg==
X-Gm-Message-State: AFqh2kpvX+PNLUa+l1ioNnAbCifn2e5eEKBdZJNv0FKzyuc0mTcNMbEH
 SgziJ/LTxuveUeEtPUIrVwFkCBN4kIsYGmSJ
X-Google-Smtp-Source: AMrXdXu2LGGeiApSi1Oj3mQg+BDFvCYDY2JSIklypyaRhnaJhsZG56ceEY2ONr02OuVxGkbNb7Zfsw==
X-Received: by 2002:a7b:ce15:0:b0:3da:2932:b61a with SMTP id
 m21-20020a7bce15000000b003da2932b61amr23643245wmc.18.1674475836427; 
 Mon, 23 Jan 2023 04:10:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 he7-20020a05600c540700b003d9fb04f658sm10349501wmb.4.2023.01.23.04.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 04:10:36 -0800 (PST)
Message-ID: <5128572f-1bfe-6fad-3afd-efd3fd0e1908@linaro.org>
Date: Mon, 23 Jan 2023 13:10:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 09/12] include/hw/ppc: Split pnv_chip.h off pnv.h
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230120070122.3982588-1-armbru@redhat.com>
 <20230120070122.3982588-10-armbru@redhat.com>
 <d8106f3d-ee31-ca51-40ba-4329238851de@linaro.org>
 <87y1ptbm32.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87y1ptbm32.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 23/1/23 11:07, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Hi Markus,
>>
>> On 20/1/23 08:01, Markus Armbruster wrote:
>>> PnvChipClass, PnvChip, Pnv8Chip, Pnv9Chip, and Pnv10Chip are defined
>>> in pnv.h.  Many users of the header don't actually need them.  One
>>> instance is this inclusion loop: hw/ppc/pnv_homer.h includes
>>> hw/ppc/pnv.h for typedef PnvChip, and vice versa for struct PnvHomer.
>>> Similar structs live in their own headers: PnvHomerClass and PnvHomer
>>> in pnv_homer.h, PnvLpcClass and PnvLpcController in pci_lpc.h,
>>> PnvPsiClass, PnvPsi, Pnv8Psi, Pnv9Psi, Pnv10Psi in pnv_psi.h, ...
>>> Move PnvChipClass, PnvChip, Pnv8Chip, Pnv9Chip, and Pnv10Chip to new
>>> pnv_chip.h, and adjust include directives.  This breaks the inclusion
>>> loop mentioned above.
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> Message-Id: <20221222104628.659681-2-armbru@redhat.com>
>>> ---
>>>    include/hw/ppc/pnv.h       | 143 +-----------------------------------
>>>    include/hw/ppc/pnv_chip.h  | 147 +++++++++++++++++++++++++++++++++++++
>>>    hw/intc/pnv_xive.c         |   1 +
>>>    hw/intc/pnv_xive2.c        |   1 +
>>>    hw/pci-host/pnv_phb3.c     |   1 +
>>>    hw/pci-host/pnv_phb4_pec.c |   1 +
>>>    hw/ppc/pnv.c               |   3 +
>>>    hw/ppc/pnv_core.c          |   1 +
>>>    hw/ppc/pnv_homer.c         |   1 +
>>>    hw/ppc/pnv_lpc.c           |   1 +
>>>    hw/ppc/pnv_xscom.c         |   1 +
>>>    11 files changed, 160 insertions(+), 141 deletions(-)
>>>    create mode 100644 include/hw/ppc/pnv_chip.h
>>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>>> index 9ef7e2d0dc..ca49e4281d 100644
>>> --- a/include/hw/ppc/pnv.h
>>> +++ b/include/hw/ppc/pnv.h
>>> @@ -20,158 +20,19 @@
>>>    #ifndef PPC_PNV_H
>>>    #define PPC_PNV_H
>>>    +#include "cpu.h"
>>
>> Why is "cpu.h" required here? For pnv_chip_find_cpu()?
> 
> Yes:
> 
>      ../include/hw/ppc/pnv.h:58:1: error: unknown type name ‘PowerPCCPU’
>         58 | PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
>            | ^~~~~~~~~~
> 
>> Isn't "target/ppc/cpu-qom.h" enough?
> 
> Seems to suffice.  Would you like to post a followup?

Good.

First I need to finish the ARM part and deal with this comment:
https://lore.kernel.org/qemu-devel/325310d0-aad6-fc39-748a-80762d644dd8@linaro.org/
Then this change will be included in the PPC equivalent series.

Thanks,

Phil.

