Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE6666668
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 23:48:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFjse-0004z0-5v; Wed, 11 Jan 2023 17:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pFjsV-0004yA-G2; Wed, 11 Jan 2023 17:47:34 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pFjsT-0003bo-GV; Wed, 11 Jan 2023 17:47:26 -0500
Received: by mail-ej1-x630.google.com with SMTP id gh17so40615958ejb.6;
 Wed, 11 Jan 2023 14:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eix9Qs1pc8UL6Tkfcg/KM+RVjD8G3z0dcoM2qLXbhWM=;
 b=RMmK29Stdgeph632we4oCYeLFMx8/5d5t/KTV8qO5m/2zgRAQT2v1txFaFQCbyufw4
 rsWF90QdaxVYWEgoIo0kB2ujP7tuMvvllb5QlOymuFHajv6w31A3/a+e/BNCy/YrycXE
 ACt3v3/cPk7pUWbCGJghcAxWSnssYEjoBzsjmNstGk9jf1P+2wJMYFdEi1F6eDaotqbb
 RpVicf/BLVgx5/BNTyvTBNpgNLK3SBWtxBG0Hy4vEv2Kjlem80hYdoFWJ8i0NpZssaiL
 WPNZYSyj4agkWeZ/t68u0fBdPHfwwaCo93OOmRsrqfAI7Vnb3OicDMPn2uYmpdDObwGb
 TMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eix9Qs1pc8UL6Tkfcg/KM+RVjD8G3z0dcoM2qLXbhWM=;
 b=U5QJtM/fG79GJ6zHSoyjLey+/q69t7c+jgOGlFJg6dnJVIH9CeW08/GH9nPVEcGD+G
 l5tYJtgmLnlPnP84XLG64QefaYbYVbQsaDq4hkPlLPIV/wkcN1b7ulp+A0u9Xl38wKMt
 ULdJMGR98IxAUOcegOM0US2ZwXc27KPXhZ7bDie9LRKcFnEc0KeD6g14WI5RD18dMibO
 rqdEikD49CcVoyoGr1f0FWb82sRmxOBQif1yilqNbaFrOmf2kAAf2JULSvyROHFLPDRl
 o+65zeDcDMBdYe9bsr0qxC6pwJRnXPgG33R/YMET65diGrMetRsl1QVN3JhCNA4Mn5PE
 Gq2Q==
X-Gm-Message-State: AFqh2kq/MQbElEeMmxuzilKpXhrTuD6rhqRE8tvoV+fO+BMPfN2A6O+V
 jrH4jSsk1yHXHA/SP+ywcMs=
X-Google-Smtp-Source: AMrXdXug5eaArAQTgFdnR3gQZwd6N82lYwOG/GY84e1QAJMPgqn/wfNAhSaIeeRSITSWxNHqNJTNIw==
X-Received: by 2002:a17:907:a508:b0:7c1:539b:d028 with SMTP id
 vr8-20020a170907a50800b007c1539bd028mr64058144ejc.48.1673477241399; 
 Wed, 11 Jan 2023 14:47:21 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-046-148.77.191.pool.telefonica.de.
 [77.191.46.148]) by smtp.gmail.com with ESMTPSA id
 y19-20020a1709060a9300b0084debc351b3sm3430197ejf.20.2023.01.11.14.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 14:47:20 -0800 (PST)
Date: Wed, 11 Jan 2023 22:47:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v6 25/33] hw/isa/piix4: Use TYPE_ISA_PIC device
In-Reply-To: <803306e6-685f-2187-4a35-416e6f5a5134@linaro.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-26-shentey@gmail.com>
 <803306e6-685f-2187-4a35-416e6f5a5134@linaro.org>
Message-ID: <5F2F9EA6-A0B9-42DB-91B7-0544B0F6B6A7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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



Am 11=2E Januar 2023 17:08:28 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 9/1/23 18:23, Bernhard Beschow wrote:
>> Aligns the code with PIIX3 such that PIIXState can be used in PIIX4,
>> too=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> Message-Id: <20221022150508=2E26830-33-shentey@gmail=2Ecom>
>> ---
>>   hw/isa/piix4=2Ec  | 28 ++++++++++------------------
>>   hw/mips/malta=2Ec | 11 +++++++++--
>>   hw/mips/Kconfig |  1 +
>>   3 files changed, 20 insertions(+), 20 deletions(-)
>
>> @@ -1459,7 +1461,12 @@ void mips_malta_init(MachineState *machine)
>>       pci_ide_create_devs(PCI_DEVICE(dev));
>>         /* Interrupt controller */
>> -    qdev_connect_gpio_out_named(DEVICE(piix4), "intr", 0, i8259_irq);
>> +    dev =3D DEVICE(object_resolve_path_component(OBJECT(piix4), "pic")=
);
>> +    i8259 =3D i8259_init(isa_bus, i8259_irq);
>> +    for (i =3D 0; i < ISA_NUM_IRQS; i++) {
>> +        qdev_connect_gpio_out(dev, i, i8259[i]);
>> +    }
>> +    g_free(i8259);
>>         /* generate SPD EEPROM data */
>>       dev =3D DEVICE(object_resolve_path_component(OBJECT(piix4), "pm")=
);
>> diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
>> index 4e7042f03d=2E=2Ed156de812c 100644
>> --- a/hw/mips/Kconfig
>> +++ b/hw/mips/Kconfig
>> @@ -1,5 +1,6 @@
>>   config MALTA
>>       bool
>> +    select I8259
>>       select ISA_SUPERIO
>>       select PIIX4
>
>The PIIX4 owns / exposes the I8259, so we don't need to select it here=2E
>The Malta board only initializes it=2E Why did you have to add this?

The Malta board instantiates a real I8259 while PIIX4 instantiates the TYP=
E_ISA_PIC proxy=2E Both are implemented pragmatically in the same source fi=
le, so both Malta and PIIX4 select it for different reasons=2E

In previous iterations using the TYPE_PROXY_PIC this might have been clear=
er: PIIX4 would select PROXY_PIC (and not I8259) while Malta would select I=
8259=2E

OK?

Best regards,
Bernhard

