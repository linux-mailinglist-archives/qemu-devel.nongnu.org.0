Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999D664EE81
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:06:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DDb-0000JN-48; Fri, 16 Dec 2022 11:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6DCz-0000Gn-Ud; Fri, 16 Dec 2022 11:05:14 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6DCx-0004F4-NL; Fri, 16 Dec 2022 11:05:13 -0500
Received: by mail-ej1-x635.google.com with SMTP id gh17so7228679ejb.6;
 Fri, 16 Dec 2022 08:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cGTR19520e9lj9/GpNytbDDCk06coXfVIA7Esk39O44=;
 b=fV920C/wnisLkJHvcbFvXSX0DZn8W56UpeJ7qaJvU6yAo3+gr66ypWsk0e8ac7spGV
 Xn9ulV+tLP7N8k978eISvFvvd9sD38bJ8x/2yFT+JmHfS4/dHqFQKyxHeEWmWS5t8Xeo
 S4dFDGxR5mnoiXMCQsi3ZUcu3YNSl7A11UMK7YUpsO4LUDG6W1mWF8DRX43qHua3+D4/
 e+ypyOsvYHffce18A+6rT2LqG46JoV2B37Gh4eVzcdDzhc9uVK5fXmmRwQqsFuygW4B4
 Oku6mrlze2nPUp4O+G3M2yYKJF4257oTA2ShBPg6B3Zo24fyxi2mAquFQY0BD4CI/VGM
 AoOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cGTR19520e9lj9/GpNytbDDCk06coXfVIA7Esk39O44=;
 b=UX/M0Og5mwUudw5D7UxWMsea6lfEY5gzp1mLvSqDn7sDX4eL6FC00Ux1Da8D9DE9F9
 TJjMObT2ZBXbBjC13CKXxApoBbnEbT7BeZYWgOwVhTeywkAmWDfQeBvJfFXNVBlKjLWT
 1nOoONpv/8gfsJh45j2L/pMuPOicxxiQs/kJoYMVzSuPUtD3KMivczTq36qKk+rFkm3F
 vP/wlXw49+GcnlFpPWyHVN/5vGW7RnkN5tuni5DhT8jDlwMu9QHlVirPxLZAm3aoN4gT
 smx3VE6w6wG2g/wepIRbtHJj9Nx98ZqvTL4/l37dEgn8+lHGdCuRFhfLIS6xpKfZvEKg
 RvPQ==
X-Gm-Message-State: ANoB5pnR67YCwORTuoXdimnD/Tm1nz58O110MBe6rcUT3MhFXVSZf21a
 KYI97dip2PcmxZFRT6rBLRg=
X-Google-Smtp-Source: AA0mqf5BxqebrZJprMod2U4e7fzLNXx+2kVw0W6vc6+f19d/klNwUS96LR3r5O0cFZZUKH6zBvuJ5Q==
X-Received: by 2002:a17:906:2249:b0:7c0:e23d:12c4 with SMTP id
 9-20020a170906224900b007c0e23d12c4mr28240264ejr.63.1671206706052; 
 Fri, 16 Dec 2022 08:05:06 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-138-012.78.55.pool.telefonica.de.
 [78.55.138.12]) by smtp.gmail.com with ESMTPSA id
 kk20-20020a170907767400b0078db18d7972sm983422ejc.117.2022.12.16.08.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:05:05 -0800 (PST)
Date: Fri, 16 Dec 2022 16:04:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev <mjt@tls.msk.ru>, 
 qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 0/6] Trivial PPC cleanups
In-Reply-To: <832b5af6-dffd-7fa1-d648-3068834f8a15@kaod.org>
References: <20221216145709.271940-1-shentey@gmail.com>
 <832b5af6-dffd-7fa1-d648-3068834f8a15@kaod.org>
Message-ID: <96C50C7E-28BD-4A1F-9940-170432338A6C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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



Am 16=2E Dezember 2022 15:32:00 UTC schrieb "C=C3=A9dric Le Goater" <clg@k=
aod=2Eorg>:
>On 12/16/22 15:57, Bernhard Beschow wrote:
>> These are some patches which helped me when getting a u-boot image to r=
un on ppce500 machine=2E
>
>Nice=2E Did you simply use the qemu-ppce500_defconfig ? or an u-boot old =
image ?

I used P1020RDB-PC_NAND_defconfig from the u-boot repository plus my branc=
h https://github=2Ecom/shentok/qemu/commits/e500-u-boot =2E I had to commen=
t out the fdt handling in u-boot for now since I didn't figure out yet how =
to include the dt blob in the elf binary=2E Anyway, with this I get a u-boo=
t shell!

>
>We could update the qemu_ppc_e500mc_defconfig in buildroot to generate th=
e
>uboot=2Ebin if that worked=2E

I haven't looked into that yet but this sounds interesting!

Best regards,
Bernhard

>
>
>>=20
>> Testing done:
>> - `make check`
>> - `make check-avocado`
>>=20
>> Bernhard Beschow (6):
>>    target/ppc/mmu_common: Log which effective address had no TLB entry
>>      found
>>    target/ppc/mmu_common: Fix table layout of "info tlb" HMP command
>>    hw/ppc/virtex_ml507: Prefer local over global variable
>>    hw/ppc/e500: Prefer local variable over qdev_get_machine()
>>    hw/ppc/e500: Resolve variable shadowing
>>    hw/ppc/e500: Move comment to more appropriate place
>>=20
>>   hw/ppc/e500=2Ec           | 10 ++++------
>>   hw/ppc/virtex_ml507=2Ec   |  2 +-
>>   target/ppc/mmu_common=2Ec |  5 +++--
>>   3 files changed, 8 insertions(+), 9 deletions(-)
>>=20
>
>
>Reviewed-by: C=C3=A9dric Le Goater <clg@kaod=2Eorg>
>
>Thanks,
>
>C=2E

