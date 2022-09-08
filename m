Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1700C5B173B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 10:37:15 +0200 (CEST)
Received: from localhost ([::1]:36158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWD29-0002Mv-Kr
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 04:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oWD09-0000Oq-SE; Thu, 08 Sep 2022 04:35:11 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oWD06-000246-Ej; Thu, 08 Sep 2022 04:35:09 -0400
Received: by mail-ed1-x536.google.com with SMTP id z21so13183781edi.1;
 Thu, 08 Sep 2022 01:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=mP236qehDKg5tuQqgpGr9qvg2EX7rM7yHBXfsuw1mIk=;
 b=BwWpCsNYAlCBDIURrcHSGW1JsP/iGZhDaZ/5F/KvCsbohkChD59tUZmxSyeTQ4Wtu4
 8oZrm2R4L6G0tc96+LY41EtOg4WIlyraT6E3LqqjgZsFvFMarsGT/i9URU8Sz41Y1YpM
 pcv6MgLE9ehTclpJIqwBLEyaLqThB7DYQNpGEypIXNlHrrthGIeMl0cdnDk5Mxghb+co
 HYK26U/Tv1/qP3a1F2qie4bq0LtiaZ6Ko+Ae96ump/eq3QpQ7eLpTpYUeE4F1HiCu9Qf
 KbCs4eETU0iJ1EzhM5K2kFJG4W1ZliR8y2F+9ZD+G3D3umaYSTuCF7ojIQPexTIEmxWL
 n30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mP236qehDKg5tuQqgpGr9qvg2EX7rM7yHBXfsuw1mIk=;
 b=m/T0DK8eJ6U308L0Uyu5HmmZtdzJ1WvkOPE6ijfSnyfvI79vR7PPUvvG0GEW0pgmK7
 YEUWIfp5sawwxmwHuNWgdf/aPzqNATfMWQhhmIpM3le+sOUiYnCEkOs0W28rsCF7zK7j
 Q8jLyhqZX6+PA5dLXdzyz1K+d/1oFQBdGmyisLw4L35ldfxAhYhNAjicpxczBeGjHIpR
 ON0WfZXB7RdhrGA3B9x5+hNS3hKqimT7Coy0d4lJ8dAdoEFyOvsJ0yStdvpCVYs2Itlb
 c7pbPSL8cQoIW0k631qn0HOwymuekY0/b9iMh8xkkdY1+KVw21x89zKldr80H/9IrwCr
 2MhA==
X-Gm-Message-State: ACgBeo3U1MsOo/DGG6tK7YuaUXcJz7KOwDB7z/I+N+JqUV8/Cp9Lmgjl
 yjB9qpfBCDlBWfD5TfQsqSZZwD8pX+w=
X-Google-Smtp-Source: AA6agR5NuJHOBF6EC9P6VZjFR+1YB3hiRDJN+b777978b8Q+4fuCwvMqQ6g9jmy2Ysz0qf13f2VEwg==
X-Received: by 2002:a05:6402:4411:b0:437:b723:72 with SMTP id
 y17-20020a056402441100b00437b7230072mr6382980eda.38.1662626103498; 
 Thu, 08 Sep 2022 01:35:03 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-172-011.89.14.pool.telefonica.de.
 [89.14.172.11]) by smtp.gmail.com with ESMTPSA id
 g9-20020a170906520900b0073ddd36ba8csm941038ejm.145.2022.09.08.01.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 01:35:03 -0700 (PDT)
Date: Thu, 08 Sep 2022 08:34:55 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v5 00/13] Instantiate VT82xx functions in host device
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
Message-ID: <6B91888F-40E0-4E92-B49D-BA0A7E784183@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 1=2E September 2022 11:41:14 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>v5:
>
>* Add patch "Inline vt82c686b_southbridge_init() and remove it" (Zoltan)
=
>
>* Use machine parameter when creating rtc-time alias (Zoltan)
>
>
>
>Testing done: Same as in v3=2E
>
>
>
>v4:
>
>* Fix in comment: AC97 Modem -> MC97 Modem (Zoltan)
>
>* Introduce TYPE_VT82C686B_USB_UHCI define (Zoltan)
>
>* Introduce TYPE_VIA_IDE define (for consistency)
>
>
>
>v3:
>
>* Replace pre increment by post increment in for loop (Zoltan)
>
>* Move class defines close to where the class is defined (Zoltan)
>
>
>
>Testing done:
>
>* `make check-avocado`
>
>  Passes for boot_linux_console=2Epy for mips64el_fuloong2e
>
>* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati-vg=
a,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3=2E17=2Eiso -kernel mo=
rphos-3=2E17/boot=2Eimg`
>
>  Boots successfully and it is possible to open games and tools=2E
>
>
>
>v2:
>
>* Keep the call to pci_ide_create_devs() in board code for consistency (Z=
oltan)
>
>* Create rtc-time alias in board rather than in south bridge code
>
>* Remove stale comments about PCI functions (Zoltan)
>
>
>
>v1:
>
>This series instantiates all PCI functions of the VT82xx south bridges in=
 the south bridges themselves=2E
>
>For the IDE function this is especially important since its interrupt rou=
ting is configured in the
>
>ISA function, hence doesn't make sense to instantiate it as a "Frankenste=
in" device=2E The interrupt
>
>routing is currently hardcoded and changing that is currently not in the =
scope of this series=2E
>
>
>
>Testing done:
>
>* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati-vg=
a,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3=2E17=2Eiso -kernel mo=
rphos-3=2E17/boot=2Eimg`
>
>  Boots successfully and it is possible to open games and tools=2E
>
>
>
>* I was unable to test the fuloong2e board even before this series since =
it seems to be unfinished [1]=2E
>
>  A buildroot-baked kernel [2] booted but doesn't find its root partition=
, though the issues could be in the buildroot receipt I created=2E
>
>
>
>[1] https://osdn=2Enet/projects/qmiga/wiki/SubprojectPegasos2
>
>[2] https://github=2Ecom/shentok/buildroot/commits/fuloong2e
>

Ping

Zoltan, would you mind giving your Reviewed-by for 'hw/mips/fuloong2e: Inl=
ine vt82c686b_southbridge_init() and remove it' explicitly? Perhaps I was t=
oo eager to omit it since I didn't want to put words in your mouth=2E

What else is missing? Who would do the pull request?

Thanks,
Bernhard
>
>
>Bernhard Beschow (13):
>
>  hw/isa/vt82c686: Resolve chip-specific realize methods
>
>  hw/isa/vt82c686: Resolve unneeded attribute
>
>  hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()
>
>  hw/isa/vt82c686: Reuse errp
>
>  hw/isa/vt82c686: Introduce TYPE_VIA_IDE define
>
>  hw/isa/vt82c686: Instantiate IDE function in host device
>
>  hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI define
>
>  hw/isa/vt82c686: Instantiate USB functions in host device
>
>  hw/isa/vt82c686: Instantiate PM function in host device
>
>  hw/isa/vt82c686: Instantiate AC97 and MC97 functions in host device
>
>  hw/mips/fuloong2e: Inline vt82c686b_southbridge_init() and remove it
>
>  hw/isa/vt82c686: Embed RTCState in host device
>
>  hw/isa/vt82c686: Create rtc-time alias in boards instead
>
>
>
> configs/devices/mips64el-softmmu/default=2Emak |   1 -
>
> hw/ide/via=2Ec                                 |   2 +-
>
> hw/isa/Kconfig                               |   1 +
>
> hw/isa/vt82c686=2Ec                            | 120 +++++++++++++++----=

>
> hw/mips/fuloong2e=2Ec                          |  39 +++---
>
> hw/ppc/Kconfig                               |   1 -
>
> hw/ppc/pegasos2=2Ec                            |  25 ++--
>
> hw/usb/vt82c686-uhci-pci=2Ec                   |   4 +-
>
> include/hw/isa/vt82c686=2Eh                    |   4 +-
>
> 9 files changed, 126 insertions(+), 71 deletions(-)
>
>
>
>-- >
>2=2E37=2E3
>
>
>


