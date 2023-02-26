Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3766A33FC
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 21:39:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWNn5-0001Bn-As; Sun, 26 Feb 2023 15:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWNn2-0001BV-Vb; Sun, 26 Feb 2023 15:38:36 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pWNn0-0003m7-VJ; Sun, 26 Feb 2023 15:38:36 -0500
Received: by mail-ed1-x529.google.com with SMTP id eg37so17796101edb.12;
 Sun, 26 Feb 2023 12:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JeHygLt0t/p4VC6IxOdKLXj72TytEKY2sjqRnBvZKy4=;
 b=E+2tUpttDgt+pAg6hlys2hjDozFHrYk3nZwvXgBnZqTETor9nlS8Bf99iNmy06O3vi
 bCtFtuQBkRH8ofRqr0mwNG2ienPyXXye6lA0VLDkQJ612YzZgnGTaOuX0Q3/SqjO2ipY
 qOldLBTaWZB7D80oDcs/4408n6KBs9iVw19jGmHMbzcIlfUDkipXQovmgEnxOA3P5JJZ
 HiLB7WCKN9pFuF5mNgotyKw6ExNW+CDukB2Pkj29Pfj82syi/pRUrjqJCOWDqd3nawuA
 +/rDag8rskwxsNNoLSDjkBPSCaEP0FGOXrjXu6XyfgFs6kICTsbm2YBgfknIAGq9RtD5
 hD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JeHygLt0t/p4VC6IxOdKLXj72TytEKY2sjqRnBvZKy4=;
 b=B+03v/MewuMKylWDuAvNEVhEvR3yUK8qXv2x3OhsH8esu0lOLrzcvNNuBR0v/gNEao
 bvrnHvzr+BIJdXPh8W1M6jU+8kPdSMJNMcreBN0HEixXiogSLCPEEGucreNlvXB6+O1D
 aHhPUwt82O2v9HXEpXpVbDcSVdSM8Eea4P6LIyhvkAzrNeUt6UmOK/HKCOQi1yOqPfHL
 LSr81WEjBl4JTvkQYt5WGOAoBxICJO2Je8GiM+NpeOKorTWqRfyoIAOycZ4jm+QNuQVN
 Wl5veTXlAf1PqoNmmlFpN253bpUkI1IdLgMTOlM99hO5zkfcmxbhTlOihxUVGCCcJHhR
 M0tQ==
X-Gm-Message-State: AO0yUKXlzykRk/k0L+/Oa7Qp5xe9UJFyD90BxJYjP9AsBAe3PhOclRxd
 SfFNRe1X3IFa73+WCQPkOcU=
X-Google-Smtp-Source: AK7set8ibNQt6SYHCD1apDkXjBnUhuJ8qk/S0VK9aEg40wAUeTPUeEoJ5EhY0sLih0WD3NswP6fUzg==
X-Received: by 2002:a17:907:7f1f:b0:87b:bbdc:468 with SMTP id
 qf31-20020a1709077f1f00b0087bbbdc0468mr41074602ejc.70.1677443910686; 
 Sun, 26 Feb 2023 12:38:30 -0800 (PST)
Received: from [127.0.0.1] ([46.183.103.8]) by smtp.gmail.com with ESMTPSA id
 ml12-20020a170906cc0c00b008b1fc59a22esm2334884ejb.65.2023.02.26.12.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 12:38:30 -0800 (PST)
Date: Sun, 26 Feb 2023 20:38:24 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 00/10] Resolve isabus global
In-Reply-To: <20230224112230-mutt-send-email-mst@kernel.org>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230224112230-mutt-send-email-mst@kernel.org>
Message-ID: <EF0E7E03-2330-410C-BB6D-D0708D1DC05B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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



Am 24=2E Februar 2023 16:22:48 UTC schrieb "Michael S=2E Tsirkin" <mst@red=
hat=2Ecom>:
>On Thu, Jan 26, 2023 at 10:17:30PM +0100, Bernhard Beschow wrote:
>> This series resolves the global "isabus" variable and is basically a v2=
 of [1]=2E
>> Note that the majority of the work consists of fixing ISA API calls in =
PIIX IDE
>> which implicitly rely on the usage of the isabus global=2E
>>=20
>> Rather than adding an ISABus pointer in PCIIDEState as in [1] this seri=
es uses
>> a qemu_irq array which is roughly the approach outlined in [2]=2E Moreo=
ver, this
>> series considers backwards compatibility for user-created PIIX IDE
>> "Frankensten" devices by fishing out TYPE_ISA_BUS from the QOM tree ins=
ide
>> the PIIX IDE device model=2E This hack can be removed again once a depr=
ecation
>> period of user-createable PIIX IDE devices is over=2E This deprecation =
wasn't
>> announced yet but now might be a good time=2E
>>=20
>> This series is structured as follows: The first three patches massage t=
he ISA
>> code for patch 8=2E Patches 4-8 change the PIIX IDE device models to no=
t use the
>> isabus global implicitly=2E Finally, the last two patches clan up and r=
emove the
>> isabus singleton=2E
>
>I expect there will be a v3 of this, right?

I would do it and I could rebase onto master if necessary=2E However, anot=
her series unrelated to this one but doing essentially the same thing with =
less backwards promises went through various iterations in the meantime=2E =
I don't know what the plan is=2E

Best regards,
Bernhard

>
>
>> Based-on: <20230109172347=2E1830-1-shentey@gmail=2Ecom>
>>           'Consolidate PIIX south bridges'
>>=20
>> v2:
>> - Big rework sticking closer to [1], giving it more credit and reusing =
one patch
>> - Add io port cleanup
>> - Rebase onto [4] so changes to PIIX could be done once and centrally
>>=20
>> Testing done:
>> * `make check`
>> * `=2E/qemu-system-x86_64 -M x-remote -device piix3-ide` still fails gr=
acefully with
>>   `qemu-system-x86_64: -device piix3-ide: No ISA bus found while piix3-=
ide requires one`
>> * `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21=2E3=2E2-220704-=
linux515=2Eiso`
>> * `qemu-system-x86_64 -M q35 -m 2G -device piix4-ide -cdrom \
>>    manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>> * `qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malta =
-hda \
>>   debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 conso=
le=3DttyS0"`
>>=20
>> [1] https://patchew=2Eorg/QEMU/20210518215545=2E1793947-1-philmd@redhat=
=2Ecom/
>> [2] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2020-03/msg017=
07=2Ehtml
>> [3] https://people=2Edebian=2Eorg/~aurel32/qemu/mips/
>> [4] https://patchew=2Eorg/QEMU/20230109172347=2E1830-1-shentey@gmail=2E=
com/
>>=20
>> Bernhard Beschow (9):
>>   softmmu/ioport: Move portio_list_init() in front of portio_list_add()
>>   softmmu/ioport: Merge portio_list_add() into portio_list_init()
>>   softmmu/ioport: Remove unused functions
>>   hw/ide/piix: Disuse isa_get_irq()
>>   Revert "hw/ide: Fix crash when plugging a piix3-ide device into the
>>     x-remote machine"
>>   hw/ide/pci: Add PCIIDEState::isa_irqs[]
>>   hw/ide/piix: Require an ISABus only for user-created instances
>>   hw/ide: Let ide_init_ioport() take a MemoryRegion argument instead of
>>     ISADevice
>>   hw/isa/isa-bus: Resolve isabus global
>>=20
>> Philippe Mathieu-Daud=C3=A9 (1):
>>   hw/isa: Remove use of global isa bus
>>=20
>>  include/exec/ioport=2Eh     |  8 ++---
>>  include/hw/ide/internal=2Eh |  3 +-
>>  include/hw/ide/pci=2Eh      |  2 ++
>>  include/hw/isa/isa=2Eh      | 15 ++++----
>>  hw/audio/adlib=2Ec          |  4 +--
>>  hw/display/qxl=2Ec          |  5 ++-
>>  hw/display/vga=2Ec          |  8 ++---
>>  hw/dma/i82374=2Ec           |  6 ++--
>>  hw/ide/ioport=2Ec           | 19 +++++-----
>>  hw/ide/isa=2Ec              |  4 ++-
>>  hw/ide/piix=2Ec             | 75 +++++++++++++++++++++++++++++++------=
--
>>  hw/isa/isa-bus=2Ec          | 54 +++++++++++++++-------------
>>  hw/isa/piix=2Ec             |  5 +++
>>  hw/watchdog/wdt_ib700=2Ec   |  4 +--
>>  softmmu/ioport=2Ec          | 70 +++++++++++-------------------------
>>  15 files changed, 149 insertions(+), 133 deletions(-)
>>=20
>> --=20
>> 2=2E39=2E1
>>=20
>

