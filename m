Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5B6EFB16
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:26:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkme-0001Zd-9i; Wed, 26 Apr 2023 15:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prkma-0001ZB-7F; Wed, 26 Apr 2023 15:26:29 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1prkmV-0005pL-Vw; Wed, 26 Apr 2023 15:26:27 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5069097bac7so13332813a12.0; 
 Wed, 26 Apr 2023 12:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682537182; x=1685129182;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2tFnhIL1In1G7GndfvtQ3M73F0+eXvoizq3Y580wxSI=;
 b=Nni2RCqR2P+pPtpXCI1YxJN9z+0k1I1VXpDiLdb5VxLvUQWVPspp/mSK0EEQDw7TSI
 SNLLQgUS+FQvhc+jK7X+DAKgotmxXJGEODjVdklDud/tpYNczFQFZuZcfGLZguRX+i/z
 spmSkI9rUyz0hIDhIhf1tQQx3blEZTOLqOdhVWAHM1nwUqDGB1FxmmiUAkNjrYLYut47
 EmQKVuVuDORBNIInTmtsfcYYiBkywB03Nl3YBP7RkToV3uYeCtw1eLEtNcG74W+vdEQS
 ecmoE+G5iYQoLD6z8KsFK/de2ixW4AoLS2OFtk4EjNMrjJQslscvueLtjgkALB29/HNt
 Zk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682537182; x=1685129182;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2tFnhIL1In1G7GndfvtQ3M73F0+eXvoizq3Y580wxSI=;
 b=NqHwJCDG4Vk55xzMQsJPoSjMP4BIujvkHCI3/R3J9DebQ07GrJWLPKTlI0uk9INJYf
 Gvj+NsZuYUELFGvgUSzmLWSB8UNFdB4v2edLqsU/uJWvmWjkwvoCWWhrnByGovhtdQax
 CvLfszHqjffG4Zt179U6rGVnf8HJ3hfGUm0CfcBtgWbtNEd0W8cl40vZSVjadOfmFcIo
 kKSo5WQen5cSWICrT+o7PSrikTcT+Pa7gyU3N+GIj2EQy3bIXW3ocgsZg40QMNjHJr4L
 Iw+f0gOTJzGEnai5hnDgV40jR8h6xPmNZv0dehqjJR0i3HBCH1mEBarYSvUs6jsvMIbl
 ZsAA==
X-Gm-Message-State: AAQBX9d9/OEQXt5/fZKFq71E8IM2BNc0eCZ22XZpLqr6IZPdPsuxi/UY
 9uil0OAOqXqVUhOVhOY0B/Q=
X-Google-Smtp-Source: AKy350ZV6+vkNh3dRCfX5HAW14I7UwxZ+J94QS7QgzwLdxQ5SBoeOlxZ6eLYY85PZ4BbtQHb6u4m8w==
X-Received: by 2002:a17:906:fc11:b0:94e:c142:dfb1 with SMTP id
 ov17-20020a170906fc1100b0094ec142dfb1mr18340700ejb.61.1682537181856; 
 Wed, 26 Apr 2023 12:26:21 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-234-209.77.13.pool.telefonica.de.
 [77.13.234.209]) by smtp.gmail.com with ESMTPSA id
 gn2-20020a1709070d0200b009545230e682sm8390107ejc.91.2023.04.26.12.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 12:26:21 -0700 (PDT)
Date: Wed, 26 Apr 2023 19:26:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 01/13] hw/ide/pci: Expose legacy interrupts as GPIOs
In-Reply-To: <1a4c06ca-9300-dbdf-34b1-b499f936249e@ilande.co.uk>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-2-shentey@gmail.com>
 <1a4c06ca-9300-dbdf-34b1-b499f936249e@ilande.co.uk>
Message-ID: <BBDDF399-1622-4EB3-9283-73BB9C6747AA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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



Am 26=2E April 2023 10:41:30 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 22/04/2023 16:07, Bernhard Beschow wrote:
>
>> Exposing the legacy IDE interrupts as GPIOs allows them to be connected=
 in the
>> parent device through qdev_connect_gpio_out(), i=2Ee=2E without accessi=
ng private
>> data of TYPE_PCI_IDE=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/ide/pci=2Ec | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>=20
>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>> index fc9224bbc9=2E=2E942e216b9b 100644
>> --- a/hw/ide/pci=2Ec
>> +++ b/hw/ide/pci=2Ec
>> @@ -522,10 +522,18 @@ void bmdma_init(IDEBus *bus, BMDMAState *bm, PCII=
DEState *d)
>>       bm->pci_dev =3D d;
>>   }
>>   +static void pci_ide_init(Object *obj)
>> +{
>> +    PCIIDEState *d =3D PCI_IDE(obj);
>> +
>> +    qdev_init_gpio_out(DEVICE(d), d->isa_irq, ARRAY_SIZE(d->isa_irq));
>
>Just one minor nit: can we make this qdev_init_gpio_out_named() and call =
it "isa-irq" to match? This is for 2 reasons: firstly these are PCI devices=
 and so an unnamed IRQ/gpio could be considered to belong to PCI, and secon=
dly it gives the gpio the same name as the struct field=2E

Yes, makes sense=2E

>
>From my previous email I think this should supercede Phil's patch at http=
s://patchew=2Eorg/QEMU/20230302224058=2E43315-1-philmd@linaro=2Eorg/2023030=
2224058=2E43315-2-philmd@linaro=2Eorg/=2E
>
>> +}
>> +
>>   static const TypeInfo pci_ide_type_info =3D {
>>       =2Ename =3D TYPE_PCI_IDE,
>>       =2Eparent =3D TYPE_PCI_DEVICE,
>>       =2Einstance_size =3D sizeof(PCIIDEState),
>> +    =2Einstance_init =3D pci_ide_init,
>>       =2Eabstract =3D true,
>>       =2Einterfaces =3D (InterfaceInfo[]) {
>>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>
>Otherwise:
>
>Reviewed-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>
>
>ATB,
>
>Mark=2E

