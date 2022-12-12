Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F4E64A476
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4l8i-0003Vk-He; Mon, 12 Dec 2022 10:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4l8g-0003Tf-0H
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:54:46 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1p4l8e-0003ND-D0
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:54:45 -0500
Received: by mail-ej1-x62f.google.com with SMTP id fc4so29103559ejc.12
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 07:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ee7Dg48Rnic1e32WkndjIloqG6cO9is8+DJxBleBC+Y=;
 b=eGMQfpEIJJcoAwvMXBlLk+6B/t6nUW9vW70MLXiDB7P1Bx+CAmpKnYCp5DXgIYyrvf
 /F5uGfdT3tUzaXONCV5MCNBF7GoGFTPXJm0MQlz/pvoRfDl87vS7zafJjtr11oT1yl63
 AbhbCswIwyCq4cSwOn0IoTsQ7lLepqkgi8qH0tScQMvutSM3T5MdIlNdSmeRDu58ceQk
 ZljBq891slTB9bDSPWgxhCy75wfQLandfrv4uZlYofAe66vQxaq1KTFboGRmvVfPmWe9
 6w8wFAPjTwlQ0T1bWDDwbR27U7txq2nu+g3PUmKoqWz/62YLYTPeJIkabwLE+IHfwwN9
 8tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ee7Dg48Rnic1e32WkndjIloqG6cO9is8+DJxBleBC+Y=;
 b=NyUWvpEQGeJG2FrZlv9qvld6/dBn7C8/xp9kJBInsYKYaUyWh4eNLsobtyAdac7+oD
 2CzhTc7HVGwV6WGcS/0evJl0mDo+osbyazY/MigWgIEpUiHNu7n9J3QGAdAGEj5/gBxC
 mZQ3NzzYu+SK9ZH09JXd5R8ZS9/XmkEQRbM5UTUm3ETHNzhvyIhnqL/x7h1snO7WoN0N
 uo/leXzE4qqRgOW8kQCwvTKcn/0VwqYUDsvA4I/PHDIKA/UNkbaMIA23hj3Cw3WUhQNs
 N6tsZant2cYOj08ekBhHZ5i4wMSYqpLHqKdo1E3nUhOJgCWaX+pnuh9OIpdEjaEMgVWu
 Nkrg==
X-Gm-Message-State: ANoB5pmH2ydgkBWwsmOQz1EkRUnShd24uHJhRAytb8Y21jJR+CalADF8
 /4vkP9zxWQwrEp7cywYOtlY=
X-Google-Smtp-Source: AA0mqf4Mql1GLad8AY8KfQFJ7nJTx3qFWgVGD0IbMFtohC7JHBERz9Yhk7tf/OHEUo8/3qDRymhhJA==
X-Received: by 2002:a17:906:6a84:b0:78d:f454:37a6 with SMTP id
 p4-20020a1709066a8400b0078df45437a6mr11980266ejr.73.1670860482332; 
 Mon, 12 Dec 2022 07:54:42 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200614f7759302d4dae.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:614f:7759:302d:4dae])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a170906255a00b0073c10031dc9sm3402147ejb.80.2022.12.12.07.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 07:54:42 -0800 (PST)
Date: Mon, 12 Dec 2022 15:54:31 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 4/5] hw/isa/Kconfig: Add missing dependency to VT82C686
In-Reply-To: <8e05d6fa-1792-bb7d-cbf3-ce3a96e64e45@linaro.org>
References: <20221207231205.1106381-1-shentey@gmail.com>
 <20221207231205.1106381-5-shentey@gmail.com>
 <8e05d6fa-1792-bb7d-cbf3-ce3a96e64e45@linaro.org>
Message-ID: <8228BDE0-C974-4BA1-9753-9D7005F273D1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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



Am 12=2E Dezember 2022 10:37:12 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>On 8/12/22 00:12, Bernhard Beschow wrote:
>> Both ACPI_PIIX4 (directly) and ACPI_ICH9 (indirectly) require ACPI to b=
e
>> selected=2E Require it for VT82C686's ACPI controller too for consisten=
cy=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/isa/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>=20
>> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
>> index 0a6a04947c=2E=2Ebc2e3ecf02 100644
>> --- a/hw/isa/Kconfig
>> +++ b/hw/isa/Kconfig
>> @@ -63,6 +63,7 @@ config VT82C686
>>       select IDE_VIA
>>       select MC146818RTC
>>       select PARALLEL
>> +    depends on ACPI
>
>The VT82C686 *provides* the ACPI interface, so here we want to "select"
>ACPI (if we need a VT82C686, then ACPI will be available)=2E

I agree=2E I'd then also adapt PIIX4 and LPC=2E

Best regards,
Bernhard

