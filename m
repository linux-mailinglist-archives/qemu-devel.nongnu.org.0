Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2E65D7C8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 17:02:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD6Cj-0007zs-CX; Wed, 04 Jan 2023 11:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pD6Ch-0007zf-GQ; Wed, 04 Jan 2023 11:01:23 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pD6Cf-0000La-OD; Wed, 04 Jan 2023 11:01:23 -0500
Received: by mail-ed1-x52b.google.com with SMTP id u18so47760541eda.9;
 Wed, 04 Jan 2023 08:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZPZ8VqMVKD8clA+VlW9XKtNwn2JnJwBcSxfXYrXuQeA=;
 b=JvBYfDwNS4thvC1amxeTWz/RSRs5iZ5NpvSeyXb6l7D0nYDubFiSemtyAHWOgA5ShY
 gTLxn0WeOb+f4K+rLQWtv3ohVvNxPP49z+UPBdfTYd2mTCHJai51ac2oqdcMPmNqBaZD
 cpC1hYeyV+UpIo3fEd/2Ilwi2FneuifR/YDQwg74b3/H2nXDddcMSW0g1nJ79fpO2DLr
 zMLjDfz60RXnLM63/5VjuOfS/XwS4EW+G/9iOGM7pcJDD66IBLwZNBJ0IPglWHBlPDBq
 lkHulE2JbXH2Es7Ci7s7LYBn1ySjDFEl2Nwsju0XonErpWdQSz0QA1JSxBgrkuezF7QP
 efBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZPZ8VqMVKD8clA+VlW9XKtNwn2JnJwBcSxfXYrXuQeA=;
 b=xtz8ucHywIAf2dxgZ8ofjaUHPZAx+Ag4RPJh/QlViA830R66cE+M4DfDiHB4g3mVxA
 XlZhke+1MOPJE4OtxJ2ebmOe9yXvNQKbOLalSpjvlLyqNa3IAgEtsXvae8DcEByJgA3I
 MzVh70G61530qEI1kbecnOu92tdpiJwS1jEGS0/EU4Y3/2MohCRUYSdWYuKPhEC5Uxwe
 YeAeWKRshx7F86kQ7nclQz/dbuzaT+2hA3z3+O2EZfrbt+TvUs2kqB231cuz37gItJ1g
 jFWeJpjMW+fSE8pwiyfjHIyEXSSODyRerwmh7iP/bhQ3taLDh5vcy+QBuqRBFu3fKnq/
 HykQ==
X-Gm-Message-State: AFqh2kopML0L09h25h31qB8bGhcUfVBKTAtRDUJlIqEI+Cx9EM5VpJz9
 1MJg+FXDRTqJwdx8oHGaVco=
X-Google-Smtp-Source: AMrXdXvZNkZNxeDdPYF16ZUFwAdRVcYw88bwPbdqKleiwGjjQIYXXMGIqoArnpYWKKMfTh4a0hIvWw==
X-Received: by 2002:aa7:da4c:0:b0:46f:9a53:fdce with SMTP id
 w12-20020aa7da4c000000b0046f9a53fdcemr41795856eds.41.1672848079862; 
 Wed, 04 Jan 2023 08:01:19 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2008108eedf25879029.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:8108:eedf:2587:9029])
 by smtp.gmail.com with ESMTPSA id
 by13-20020a0564021b0d00b0046bd3b366f9sm15048042edb.32.2023.01.04.08.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 08:01:19 -0800 (PST)
Date: Wed, 04 Jan 2023 16:01:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v4 12/30] hw/core: Introduce proxy-pic
In-Reply-To: <3986f4f2-d6bd-9abe-42ef-18311de53bf6@linaro.org>
References: <20221221170003.2929-1-shentey@gmail.com>
 <20221221170003.2929-13-shentey@gmail.com>
 <3986f4f2-d6bd-9abe-42ef-18311de53bf6@linaro.org>
Message-ID: <112DBAA3-978C-42C5-B1A5-F614D7A2141B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 4=2E Januar 2023 14:37:29 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>On 21/12/22 17:59, Bernhard Beschow wrote:
>> Having a proxy PIC allows for ISA PICs to be created and wired up in
>> southbridges=2E This is especially useful for PIIX3 for two reasons:
>> First, the southbridge doesn't need to care about the virtualization
>> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
>> attached) and out-IRQs (which will trigger the IRQs of the respective
>> virtzalization technology) are separated=2E Second, since the in-IRQs a=
re
>> populated with fully initialized qemu_irq's, they can already be wired
>> up inside PIIX3=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> Message-Id: <20221022150508=2E26830-15-shentey@gmail=2Ecom>
>> ---
>>   MAINTAINERS                 |  2 ++
>>   hw/core/Kconfig             |  3 ++
>>   hw/core/meson=2Ebuild         |  1 +
>>   hw/core/proxy-pic=2Ec         | 70 ++++++++++++++++++++++++++++++++++=
+++
>>   include/hw/core/proxy-pic=2Eh | 54 ++++++++++++++++++++++++++++
>>   5 files changed, 130 insertions(+)
>>   create mode 100644 hw/core/proxy-pic=2Ec
>>   create mode 100644 include/hw/core/proxy-pic=2Eh
>
>Please enable scripts/git=2Eorderfile=2E

Will do=2E

>> diff --git a/include/hw/core/proxy-pic=2Eh b/include/hw/core/proxy-pic=
=2Eh
>> new file mode 100644
>> index 0000000000=2E=2E0eb40c478a
>> --- /dev/null
>> +++ b/include/hw/core/proxy-pic=2Eh
>> @@ -0,0 +1,54 @@
>> +/*
>> + * Proxy interrupt controller device=2E
>> + *
>> + * Copyright (c) 2022 Bernhard Beschow <shentey@gmail=2Ecom>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaini=
ng a copy
>> + * of this software and associated documentation files (the "Software"=
), to deal
>> + * in the Software without restriction, including without limitation t=
he rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/o=
r sell
>> + * copies of the Software, and to permit persons to whom the Software =
is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be incl=
uded in
>> + * all copies or substantial portions of the Software=2E
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT=2E IN NO EVENT=
 SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALI=
NGS IN
>> + * THE SOFTWARE=2E
>
>This is the MIT license right? Do you mind adding a SPDX tag along?

I based my implementation on TYPE_SPLIT_IRQ as you suggested before and th=
us preserved the license=2E

> * SPDX-License-Identifier: MIT

Or just replace the wall of text with this line? This should suffice, no?

>> + */
>> +
>> +#ifndef HW_PROXY_PIC_H
>> +#define HW_PROXY_PIC_H
>> +
>> +#include "hw/qdev-core=2Eh"
>> +#include "qom/object=2Eh"
>> +#include "hw/irq=2Eh"
>> +
>> +#define TYPE_PROXY_PIC "proxy-pic"
>> +OBJECT_DECLARE_SIMPLE_TYPE(ProxyPICState, PROXY_PIC)
>> +
>> +#define MAX_PROXY_PIC_LINES 16
>> +
>> +/**
>> + * This is a simple device which has 16 pairs of GPIO input and output=
 lines=2E
>> + * Any change on an input line is forwarded to the respective output=
=2E
>> + *
>> + * QEMU interface:
>> + *  + 16 unnamed GPIO inputs: the input lines
>> + *  + 16 unnamed GPIO outputs: the output lines
>> + */
>
>Why restrict to 16 and not use a class property and allocate
>on the heap? See TYPE_SPLIT_IRQ for example=2E

TYPE_SPLIT_IRQ doesn't allocate on the heap and instead has a hardcoded li=
mit of MAX_SPLIT_LINES which equals 16 ;)

I was unsure on when to free the memory and how to dispose the elements so=
 I went with this solution for simplicity=2E I'll look for inspitation in o=
ther device models and respin=2E

Thanks,
Bernhard

>
>> +struct ProxyPICState {
>> +    /*< private >*/
>> +    struct DeviceState parent_obj;
>> +    /*< public >*/
>> +
>> +    qemu_irq in_irqs[MAX_PROXY_PIC_LINES];
>> +    qemu_irq out_irqs[MAX_PROXY_PIC_LINES];
>> +};
>> +
>> +#endif /* HW_PROXY_PIC_H */
>

