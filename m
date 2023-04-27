Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAD46F0233
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:59:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwWC-0006ho-TW; Thu, 27 Apr 2023 03:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prwWB-0006hc-2v; Thu, 27 Apr 2023 03:58:19 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prwW9-0004ae-IF; Thu, 27 Apr 2023 03:58:18 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-504eccc8fc8so11849432a12.2; 
 Thu, 27 Apr 2023 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682582295; x=1685174295;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IRkEdCmaxDw5yNC9NRn/hthe2sOQUIbkORHOS+VGT0=;
 b=VnKKXzWDTf9usaj5P49EJMtoI2d5EVlTGjmD73SfQ9ps1z02FMhXKav27E/+LZYgVX
 x5ahHduU3LtZ16QbMMe8hm4GVelbz6fRkrs985FGIYB7k9uhe6JY6pRG0g8P45mjYHns
 3inQCjAbTL8wHnN4qn6TupgtHe5g6eHSqsRBEqpBtDxKM7FyFUGKYH+L2yzBw3QzOjjf
 7Lq1rI2kNGyxyeHbjwxV9WOVqVY0qQtFcO599TExwA3oTW+U6IeOKWF518QmBoadEZ/A
 XleNRSJXqp3rpXZc1l7HO2HhKwdfGYv75OxSMLZDZu/T7qYXF0tJWU7JVLNBNzqkjNiC
 PWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682582295; x=1685174295;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3IRkEdCmaxDw5yNC9NRn/hthe2sOQUIbkORHOS+VGT0=;
 b=Sm9QT4jkp3UbacYP99fn4GF1RPlu1+Qp3KwbaNaYHrqOQF7tDrkSyCEx4Y8RIPX9Jh
 3KoCGMKAT5HOIyz1ExhBCQVRTJodHrdaWZIl+7q5+4u51XR2nWhr2HB7rWuLoBLSLjba
 w1w7i0Ux5gDbocmBw1fSQg+ZfNfG9DLIJLr0Q+eFuBn4CQTfuxX+eCcUtRdxwF2kUtcr
 ZZfjRssshFbRYBh61zNw8VLwnv/wZWu28uZRP+ygEgrnWWuquRfJSaPi/YCjilDCVxeQ
 Br/6kZeWc1otQRUluOboVFgJl4VhvHzzW6T8iLQdLK0BSOp2Es1XlErGphtEp2YS5CfP
 710Q==
X-Gm-Message-State: AC+VfDxe2pVsclLalVZX/iVQaejf+XFZfwRL8iwSfLNhndRvKSwo6Zl7
 1QC2uR6DIe6KSyxF1ZAjIi0=
X-Google-Smtp-Source: ACHHUZ6Yd01St0yHoJ62KtH1Up25yrTB/2cn0t5yrlnlErWe4xyjJrXI2z129yrZPAAQEdruL6f7Mw==
X-Received: by 2002:a05:6402:795:b0:506:983f:1f61 with SMTP id
 d21-20020a056402079500b00506983f1f61mr853535edy.3.1682582295427; 
 Thu, 27 Apr 2023 00:58:15 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 bf18-20020a0564021a5200b00506b88e4f17sm7547876edb.68.2023.04.27.00.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 00:58:15 -0700 (PDT)
Date: Thu, 27 Apr 2023 07:58:08 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_03/18=5D_hw/i386/pc=5Fpiix=3A_Wire?=
 =?US-ASCII?Q?_PIIX3_IDE_ouput_IRQs_to_ISA_bus_IRQs_14/15?=
In-Reply-To: <a233b5c7-56a6-ac94-c7c1-9fa5da9acb9c@ilande.co.uk>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-4-philmd@linaro.org>
 <a233b5c7-56a6-ac94-c7c1-9fa5da9acb9c@ilande.co.uk>
Message-ID: <3A39AAE9-73FC-4C56-9BD6-0DA2D78548E0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 26=2E April 2023 12:50:08 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 02/03/2023 22:40, Philippe Mathieu-Daud=C3=A9 wrote:
>
>> Since pc_init1() has access to the ISABus*, retrieve the
>> ISA IRQs with isa_bus_get_irq()=2E
>>=20
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>> ---
>>   hw/i386/pc_piix=2Ec | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/i386/pc_piix=2Ec b/hw/i386/pc_piix=2Ec
>> index 126b6c11df=2E=2E1e90b9ff0d 100644
>> --- a/hw/i386/pc_piix=2Ec
>> +++ b/hw/i386/pc_piix=2Ec
>> @@ -277,7 +277,13 @@ static void pc_init1(MachineState *machine,
>>       if (pcmc->pci_enabled) {
>>           PCIDevice *dev;
>>   -        dev =3D pci_create_simple(pci_bus, piix3_devfn + 1, TYPE_PII=
X3_IDE);
>> +        dev =3D pci_new_multifunction(piix3_devfn + 1, false, TYPE_PII=
X3_IDE);
>> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 0,
>> +                                    isa_bus_get_irq(isa_bus, 14));
>> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", 1,
>> +                                    isa_bus_get_irq(isa_bus, 15));
>> +        pci_realize_and_unref(dev, pci_bus, &error_fatal);
>> +
>>           pci_ide_create_devs(dev);
>>           idebus[0] =3D qdev_get_child_bus(&dev->qdev, "ide=2E0");
>>           idebus[1] =3D qdev_get_child_bus(&dev->qdev, "ide=2E1");
>
>Another reason this probably isn't a good idea: you're having to call qde=
v_connect_gpio_*() before realizing the device :(

Just curious: Resources like memory regions are assigned before realizatio=
n, see e=2Eg=2E i440fx or q35=2E Interrupts are also resources=2E What make=
s them special?

I'm asking since this issue seems to be the main blocker for the piix cons=
olidation to be merged=2E

Best regards,
Bernhard

>
>
>ATB,
>
>Mark=2E

