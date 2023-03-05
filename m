Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E676AAE82
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 08:47:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYj4M-0004mU-Tu; Sun, 05 Mar 2023 02:46:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYj4J-0004m5-O9; Sun, 05 Mar 2023 02:46:07 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pYj4H-0007oc-NV; Sun, 05 Mar 2023 02:46:07 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so4491749wms.1; 
 Sat, 04 Mar 2023 23:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678002362;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DCoePLllw7iHMhcUCMFzvuRZ1jZVzAcpgvZ4ynSbjAk=;
 b=WIkm6wXWyDf6NNR05r64ogjdCS4MSRcrg+pUixRyC8NWljXuH+dOZH+raX3IiZFZ+x
 2iwA03JsHUEc4ru6q/JwEq8H6T7CHvcE/g80STPu9xgcIasgVLPvd62MjGuXERza9+2e
 IFuVCspgooeUrZvvwmCFhG+yDI08b72kSXwIwHeuM+0uB+IdRgWBa2Y5kOI1MghyXUWf
 JaoJRVDP6prjTDS70TnWzByDU43SloJODLXF3Wu33vzgUcbWoTWFFrWi5xGToCbyiN76
 Zd9z05iDhpWnx2dULYUNd7yffC/5Q+YpbFTYYEiUGUhlty8mFxxPbJEzP/nxUnhHDbhq
 Z34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678002362;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DCoePLllw7iHMhcUCMFzvuRZ1jZVzAcpgvZ4ynSbjAk=;
 b=3Fr/hpEcTLpG/6V62Xs5/ypA+n2ZKn01/tG771IjVTvgTOv9J2crLte88ZDHJ8RMZ8
 NlsAafqTmQb/CbKvQYLokstptQ5v9ILBAupLTKYhOXCWTGUhFKMNicy9MNe0C3KkOD9F
 I4HoD1QKgV4wyMNoHBVaUTZj+BdD8HvGtcqGhjZYIt31SpN+Czyqf52DqbmJsTuPGg8J
 XwZx7K1cbo7WwMx8qfqI2J7gt6ISIQudkIJPz6hbn0gyDXxuQHnk765uHI5/55Z6KOsI
 aT5qmuUlhsKI4JP6w6vbbX3wyqXzM4rbeI1k67+RywQBnCbulZmLT77SVj8O6gX59yiK
 YfKg==
X-Gm-Message-State: AO0yUKXohUTLRrgJIbF5CQ+dRLAdrhykG6CC/NwzxCJREh+39zJ2JZB6
 keTQq5zC3aU6x1P6d/97o0ZvLMc/j9k=
X-Google-Smtp-Source: AK7set+wuHBIYuQl5Ko4eXn2SQy4cMu/U5uzKXdtUqp/+iC+lPWYGL6Ya4D0i3g8M/yDzYkfZE+ueA==
X-Received: by 2002:a05:600c:4708:b0:3eb:20f6:2d5c with SMTP id
 v8-20020a05600c470800b003eb20f62d5cmr6313692wmo.35.1678002362356; 
 Sat, 04 Mar 2023 23:46:02 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-176-138.78.54.pool.telefonica.de.
 [78.54.176.138]) by smtp.gmail.com with ESMTPSA id
 z4-20020a056000110400b002ce3b31753fsm5735915wrw.26.2023.03.04.23.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 23:46:02 -0800 (PST)
Date: Sun, 05 Mar 2023 07:45:55 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v4 0/9] PC cleanups
In-Reply-To: <776DAC15-E708-47BF-9EF6-D511731DF56D@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
 <776DAC15-E708-47BF-9EF6-D511731DF56D@gmail.com>
Message-ID: <4A6D076C-5091-42A5-BB83-695B5BF2F04D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
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



Am 13=2E Februar 2023 16:45:05 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 13=2E Februar 2023 16:19:55 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>>This series contains some cleanups I came across when working on the PC
=
>>
>>machines=2E It consists of reducing the usage of global variables and el=
iminating
>>
>>some redundancies=2E
>>
>>
>>
>>One notable change is that the SMRAM memory region gets moved from the i=
440fx
>>
>>and q35 host bridges into the x86 machine=2E This will simplify cleaning=
 up these
>>
>>host bridges which will be done in a separate series=2E Note that the mo=
vement of
>>
>>the SMRAM memory region apparently doesn't change migration ABI for the =
pc and
>>
>>q35 machines (see below)=2E
>>
>>
>>
>>Testing done:
>>
>>* `make check`
>>
>>' `make check-avocado`
>>
>>* `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>>
>>   manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>
>>* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21=2E3=2E2-220704-l=
inux515=2Eiso`
>>
>>* Confirm that JSON representation of migration files (pc & q35) are emp=
ty:
>>
>>  1=2E Create four migration files {pc,q35}-{before,after}=2Emig by runn=
ing
>>
>>     `qemu-system-x86_64 -M {pc,q35} -S` with QEMU built from master and=
 from
>>
>>     this series=2E
>>
>>  2=2E Run `=2E/scripts/analyze-migration=2Epy -d desc -f *=2Emig > *=2E=
json` on the four
>>
>>     files
>>
>>  3=2E Compare the diffs -> both are empty
>>
>>
>>
>>v4:
>>
>>* Remove ram_memory variable in pc_q35 completely (Zoltan)
>>
>
>The last two patches still need review=2E Comments welcome!

Ping

Can we queue the reviewed patches (all but the last two) already?

Thanks,
Bernhard

>
>>
>>
>>v3:
>>
>>* Add three patches regarding init_pam() and SMRAM=2E
>>
>>* Drop 'hw/i386/pc_q35: Resolve redundant q35_host variable' since Phil =
posted
>>
>>  a similar patch in a more comprehensive series:
>>
>>  https://lore=2Ekernel=2Eorg/qemu-devel/20230203180914=2E49112-13-philm=
d@linaro=2Eorg/
>>
>>* Drop 'hw/isa/lpc_ich9: Reuse memory and io address space of PCI bus' s=
ince
>>
>>  it inadvertantly changed the memory hierarchy=2E
>>
>>* Drop ICH9 cleanups again in favor of a separate series=2E
>>
>>
>>
>>v2:
>>
>>* Factor out 'hw/i386/pc_q35: Reuse machine parameter' from 'hw/i386/pc_=
q35:
>>
>>  Resolve redundant q35_host variable' (Zoltan)
>>
>>* Lower type of phb to Object in 'hw/i386/pc_q35: Resolve redundant q35_=
host
>>
>>  variable' (Zoltan)
>>
>>* Add ICH9 cleanups
>>
>>
>>
>>Bernhard Beschow (9):
>>
>>  hw/pci-host/i440fx: Inline sysbus_add_io()
>>
>>  hw/pci-host/q35: Inline sysbus_add_io()
>>
>>  hw/i386/pc_q35: Reuse machine parameter
>>
>>  hw/i386/pc_{q35,piix}: Reuse MachineClass::desc as SMB product name
>>
>>  hw/i386/pc_{q35,piix}: Minimize usage of get_system_memory()
>>
>>  hw/i386/pc: Initialize ram_memory variable directly
>>
>>  hw/pci-host/pam: Make init_pam() usage more readable
>>
>>  hw/i386/x86: Make TYPE_X86_MACHINE the owner of smram
>>
>>  target/i386/tcg/sysemu/tcg-cpu: Avoid own opinion about smram size
>>
>>
>>
>> include/hw/i386/pc=2Eh             |  1 -
>>
>> include/hw/i386/x86=2Eh            |  2 ++
>>
>> include/hw/pci-host/i440fx=2Eh     |  7 ++++---
>>
>> include/hw/pci-host/pam=2Eh        |  5 +++--
>>
>> include/hw/pci-host/q35=2Eh        |  4 +++-
>>
>> hw/i386/pc=2Ec                     |  2 --
>>
>> hw/i386/pc_piix=2Ec                | 10 +++++-----
>>
>> hw/i386/pc_q35=2Ec                 | 17 +++++++++--------
>>
>> hw/i386/x86=2Ec                    |  4 ++++
>>
>> hw/pci-host/i440fx=2Ec             | 28 +++++++++++++---------------
>>
>> hw/pci-host/pam=2Ec                | 12 ++++++------
>>
>> hw/pci-host/q35=2Ec                | 31 ++++++++++++++++---------------=

>>
>> target/i386/tcg/sysemu/tcg-cpu=2Ec |  3 +--
>>
>> 13 files changed, 66 insertions(+), 60 deletions(-)
>>
>>
>>
>>-- >
>>2=2E39=2E1
>>
>>
>>

