Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB53F678075
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 16:50:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJz4o-0007MJ-6j; Mon, 23 Jan 2023 10:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJz4m-0007M9-8T
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 10:49:40 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pJz4k-0005mH-KY
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 10:49:39 -0500
Received: by mail-ej1-x634.google.com with SMTP id qx13so31549734ejb.13
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 07:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VueTAy1shfh8OufQZJIlKrJGOqWkThTsR9lYab//mKE=;
 b=gk2ZUDj2Ze8KLBxOiDjmwy+FuyUuBhwYb5pNkivjy3Yfb4ES4sdKX3Vf3WrnAtazxb
 mqiazukNwbZ3Qac+gf3bX3K8JweKh0HVQYLHIuav4WSXXS21iQYp01sSGrBjP2awiZAH
 cBtc/EgUKqOKAEMvZcfr/tFUDbnG2oDc7B2nh2lTpRsSPFCGsOe1dAkNYwsk7fUzz8wB
 z/cuSmp1tdNJaewvupBXfLYBG86+ose4wh1hNGmN1d6tqJbguPS4rwcpQ5q+pXvmDzF0
 53Sp8wIGHtkmpsXv2KwqaNoqingVWCjMjsvU4U967Mi6jTaPo18oC/5T/OWb9/cm1XY/
 DxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VueTAy1shfh8OufQZJIlKrJGOqWkThTsR9lYab//mKE=;
 b=2aq2MAQOFSJQCVvA81hupu17Z17pq7WgpeS8QCJT1Os0z0x6n/Ao2hQo6Y3d0EzTN3
 P8+yKnA8J5OUQHBBK2jw5RMj2bZs0HL98WXu4b3DvDXmpXOpDCd1emnxXBxUW+tc+DTt
 etPKwOqBowFDDUAXhn8+7Us3lg/hdd2xfL18Hy/L9fed/rXP4VzLffnrls1vkiuZmFOJ
 jXEzDg8SYvIJm8JF5EGBKokvd6WPRdoiUjIdINgwSvBBBG3V/RVWI2vWG9rFTso9S5T4
 zeaSIeCAmONHBeTqfBGHaEHZoRgLLBubCO7MtzkI9DiuzqtP4yY0Hij8K8KJeB6Csra7
 AnOQ==
X-Gm-Message-State: AFqh2koMYXqGBcBd81eUnu4kifX+V8IUsrUWItHSr/nO2a9ApLff/x78
 498tcTRv8fpaLlG8+5CZO2c=
X-Google-Smtp-Source: AMrXdXuZNAUgo3XMPQdsYXlPSSwGv5sCl/9GxL34Ye2R6TzKqLI1mKYFAkshGNIMmx9e5S1nt74jkA==
X-Received: by 2002:a17:907:a708:b0:86d:e1ce:5c9c with SMTP id
 vw8-20020a170907a70800b0086de1ce5c9cmr27833790ejc.76.1674488977008; 
 Mon, 23 Jan 2023 07:49:37 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20021b9da3234f1ff5e.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:21b9:da32:34f1:ff5e])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a170906a24c00b00868ef175e6asm14971021ejb.74.2023.01.23.07.49.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 07:49:36 -0800 (PST)
Date: Mon, 23 Jan 2023 15:49:29 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/7=5D_hw/acpi/=7Bich9=2Cpiix4=7D=3A_Res?=
 =?US-ASCII?Q?olve_redundant_io=5Fbase_address_attributes?=
In-Reply-To: <c38c9c94-b629-0cdd-acd9-ac800ff9da8d@linaro.org>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-4-shentey@gmail.com>
 <c38c9c94-b629-0cdd-acd9-ac800ff9da8d@linaro.org>
Message-ID: <8BFD0F5A-088F-4A17-8998-E9C618558FF6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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



Am 23=2E Januar 2023 07:57:08 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>Hi Bernhard,
>
>On 22/1/23 18:07, Bernhard Beschow wrote:
>> A MemoryRegion has an addr attribute which gets set to the same values
>> as the redundant io_addr attributes=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/hw/acpi/ich9=2Eh  |  1 -
>>   include/hw/acpi/piix4=2Eh |  2 --
>>   hw/acpi/ich9=2Ec          | 17 ++++++++---------
>>   hw/acpi/piix4=2Ec         | 11 ++++++-----
>>   4 files changed, 14 insertions(+), 17 deletions(-)
>
>> diff --git a/hw/acpi/piix4=2Ec b/hw/acpi/piix4=2Ec
>> index 370b34eacf=2E=2E2e9bc63fca 100644
>> --- a/hw/acpi/piix4=2Ec
>> +++ b/hw/acpi/piix4=2Ec
>> @@ -91,13 +91,14 @@ static void apm_ctrl_changed(uint32_t val, void *ar=
g)
>>   static void pm_io_space_update(PIIX4PMState *s)
>>   {
>>       PCIDevice *d =3D PCI_DEVICE(s);
>> +    uint32_t io_base;
>>   -    s->io_base =3D le32_to_cpu(*(uint32_t *)(d->config + 0x40));
>> -    s->io_base &=3D 0xffc0;
>> +    io_base =3D le32_to_cpu(*(uint32_t *)(d->config + 0x40));
>> +    io_base &=3D 0xffc0;
>>         memory_region_transaction_begin();
>>       memory_region_set_enabled(&s->io, d->config[0x80] & 1);
>> -    memory_region_set_address(&s->io, s->io_base);
>> +    memory_region_set_address(&s->io, io_base);
>
>OK for this part=2E
>
>>       memory_region_transaction_commit();
>>   }
>>   @@ -433,8 +434,8 @@ static void piix4_pm_add_properties(PIIX4PMState =
*s)
>>                                     &s->ar=2Egpe=2Elen, OBJ_PROP_FLAG_R=
EAD);
>>       object_property_add_uint16_ptr(OBJECT(s), ACPI_PM_PROP_SCI_INT,
>>                                     &sci_int, OBJ_PROP_FLAG_READ);
>> -    object_property_add_uint32_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
>> -                                  &s->io_base, OBJ_PROP_FLAG_READ);
>> +    object_property_add_uint64_ptr(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
>> +                                   &s->io=2Eaddr, OBJ_PROP_FLAG_READ);
>
>+Eduardo/Mark
>
>We shouldn't do that IMO, because we access an internal field from
>another QOM object=2E
>
>We can however alias the MR property:
>
>  object_property_add_alias(OBJECT(s), ACPI_PM_PROP_PM_IO_BASE,
>                            OBJECT(&s->io), "addr");

Indeed! And the "addr" property is already read-only -- which seems like a=
 good fit=2E

>
>>   }

