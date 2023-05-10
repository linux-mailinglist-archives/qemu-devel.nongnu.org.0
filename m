Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2966FE406
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:27:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwoWl-0006u3-F7; Wed, 10 May 2023 14:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pwoWj-0006ti-Og; Wed, 10 May 2023 14:27:01 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pwoWh-0004fR-PN; Wed, 10 May 2023 14:27:01 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so1506792166b.1; 
 Wed, 10 May 2023 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683743217; x=1686335217;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aDtGWuM6iHwB2ZbUgFVPHaL7zW78MYtFq2HuJPI4cTY=;
 b=n0cuGAN+RItQsDQDhwcPJ1YpFaVykWsS2a+ra0fYncHOYw47jeePat/DcdHI7D9ESP
 R6mSDAWkbO542UemMz0Go67QJgFJ3gwamP+cFwUPKyzwsJ6GaKi6EVo9lr2fB/3g7W+C
 sAvesBsXz0IvGLUDh5lR4js2Wu5/G0R80zad5tHLHoxmWkdeuHiPVwiwhW0Ft/fZVCjv
 oF4Zw4Hi/bMvrqwk+eOoJzI1NbdV9j4CsGXlS0NUXusy8875dmp0kOCfAbtAuWlwS866
 kqtNSowWlmFw+NBK5M87vI0I4hFemeKC1VDqVLwP+b2PwvRdwVfrYIFx1F5cDwhXx7lS
 qieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683743217; x=1686335217;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aDtGWuM6iHwB2ZbUgFVPHaL7zW78MYtFq2HuJPI4cTY=;
 b=YLCttagys30V9NK+ONFzw/Eae19+/m6WlfVOU+uyY/RJyrjQ8TDgDZqSDcxyVg4Gjf
 RmPYZT0C3aa6nrCRsi/7r/0n29DRjw+ICpc3MNCgTcAviirtoPEvs4SuxGtP/JVM39Uz
 yMQu853dzkWtXDQf+Z+x5xLjdM1tVal8zvnllMnNWXtHilVv5kLTxypUTpaQFLj0HWxe
 4NwaX8boECT7Qvycgl3Do2Z/VQBHC1yz2n2jC3osE3GZBdTGomt3enz8WeXhaltnFDO6
 gGKUkhud0Q2x4nCGCB5E8Qe/HVPjJt1dGdewdP99BaMBbitm9Vp23KZCFXqmK3v3w3SD
 W9hg==
X-Gm-Message-State: AC+VfDyOuXUgc2R9bqW/jFE0NZe+XdPtUM/c7e4dDeFsjGdKS8jTXWBq
 EMgbaVgdGYV7KmbA5OMjRt9k+BZNqLw=
X-Google-Smtp-Source: ACHHUZ4eUGh5/rTHcfwuCbhw4piv+LIOvVu77TlVU3S6QYhVEy0dMXGDRLtVwdJSfZ8Y3TfYRFe+9Q==
X-Received: by 2002:a17:907:9345:b0:94e:c4b:4d95 with SMTP id
 bv5-20020a170907934500b0094e0c4b4d95mr15575666ejc.69.1683743217485; 
 Wed, 10 May 2023 11:26:57 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-021-051.89.12.pool.telefonica.de.
 [89.12.21.51]) by smtp.gmail.com with ESMTPSA id
 wi21-20020a170906fd5500b0094edbe5c7ddsm2997996ejb.38.2023.05.10.11.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 11:26:57 -0700 (PDT)
Date: Wed, 10 May 2023 18:26:54 +0000
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
In-Reply-To: <4A6D076C-5091-42A5-BB83-695B5BF2F04D@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
 <776DAC15-E708-47BF-9EF6-D511731DF56D@gmail.com>
 <4A6D076C-5091-42A5-BB83-695B5BF2F04D@gmail.com>
Message-ID: <73EFF09E-8246-4E6E-8F6E-189BA222A7D7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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



Am 5=2E M=C3=A4rz 2023 07:45:55 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>
>
>Am 13=2E Februar 2023 16:45:05 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>>
>>
>>Am 13=2E Februar 2023 16:19:55 UTC schrieb Bernhard Beschow <shentey@gma=
il=2Ecom>:
>>>This series contains some cleanups I came across when working on the PC=

>>>
>>>machines=2E It consists of reducing the usage of global variables and e=
liminating
>>>
>>>some redundancies=2E
>>>
>>>
>>>
>>>One notable change is that the SMRAM memory region gets moved from the =
i440fx
>>>
>>>and q35 host bridges into the x86 machine=2E This will simplify cleanin=
g up these
>>>
>>>host bridges which will be done in a separate series=2E Note that the m=
ovement of
>>>
>>>the SMRAM memory region apparently doesn't change migration ABI for the=
 pc and
>>>
>>>q35 machines (see below)=2E
>>>
>>>
>>>
>>>Testing done:
>>>
>>>* `make check`
>>>
>>>' `make check-avocado`
>>>
>>>* `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>>>
>>>   manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>>
>>>* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21=2E3=2E2-220704-=
linux515=2Eiso`
>>>
>>>* Confirm that JSON representation of migration files (pc & q35) are em=
pty:
>>>
>>>  1=2E Create four migration files {pc,q35}-{before,after}=2Emig by run=
ning
>>>
>>>     `qemu-system-x86_64 -M {pc,q35} -S` with QEMU built from master an=
d from
>>>
>>>     this series=2E
>>>
>>>  2=2E Run `=2E/scripts/analyze-migration=2Epy -d desc -f *=2Emig > *=
=2Ejson` on the four
>>>
>>>     files
>>>
>>>  3=2E Compare the diffs -> both are empty
>>>
>>>
>>>
>>>v4:
>>>
>>>* Remove ram_memory variable in pc_q35 completely (Zoltan)
>>>
>>
>>The last two patches still need review=2E Comments welcome!
>
>Ping
>
>Can we queue the reviewed patches (all but the last two) already?

Ping 2

>
>Thanks,
>Bernhard
>
>>
>>>
>>>
>>>v3:
>>>
>>>* Add three patches regarding init_pam() and SMRAM=2E
>>>
>>>* Drop 'hw/i386/pc_q35: Resolve redundant q35_host variable' since Phil=
 posted
>>>
>>>  a similar patch in a more comprehensive series:
>>>
>>>  https://lore=2Ekernel=2Eorg/qemu-devel/20230203180914=2E49112-13-phil=
md@linaro=2Eorg/
>>>
>>>* Drop 'hw/isa/lpc_ich9: Reuse memory and io address space of PCI bus' =
since
>>>
>>>  it inadvertantly changed the memory hierarchy=2E
>>>
>>>* Drop ICH9 cleanups again in favor of a separate series=2E
>>>
>>>
>>>
>>>v2:
>>>
>>>* Factor out 'hw/i386/pc_q35: Reuse machine parameter' from 'hw/i386/pc=
_q35:
>>>
>>>  Resolve redundant q35_host variable' (Zoltan)
>>>
>>>* Lower type of phb to Object in 'hw/i386/pc_q35: Resolve redundant q35=
_host
>>>
>>>  variable' (Zoltan)
>>>
>>>* Add ICH9 cleanups
>>>
>>>
>>>
>>>Bernhard Beschow (9):
>>>
>>>  hw/pci-host/i440fx: Inline sysbus_add_io()
>>>
>>>  hw/pci-host/q35: Inline sysbus_add_io()
>>>
>>>  hw/i386/pc_q35: Reuse machine parameter
>>>
>>>  hw/i386/pc_{q35,piix}: Reuse MachineClass::desc as SMB product name
>=
>>
>>>  hw/i386/pc_{q35,piix}: Minimize usage of get_system_memory()
>>>
>>>  hw/i386/pc: Initialize ram_memory variable directly
>>>
>>>  hw/pci-host/pam: Make init_pam() usage more readable
>>>
>>>  hw/i386/x86: Make TYPE_X86_MACHINE the owner of smram
>>>
>>>  target/i386/tcg/sysemu/tcg-cpu: Avoid own opinion about smram size
>>=
>
>>>
>>>
>>> include/hw/i386/pc=2Eh             |  1 -
>>>
>>> include/hw/i386/x86=2Eh            |  2 ++
>>>
>>> include/hw/pci-host/i440fx=2Eh     |  7 ++++---
>>>
>>> include/hw/pci-host/pam=2Eh        |  5 +++--
>>>
>>> include/hw/pci-host/q35=2Eh        |  4 +++-
>>>
>>> hw/i386/pc=2Ec                     |  2 --
>>>
>>> hw/i386/pc_piix=2Ec                | 10 +++++-----
>>>
>>> hw/i386/pc_q35=2Ec                 | 17 +++++++++--------
>>>
>>> hw/i386/x86=2Ec                    |  4 ++++
>>>
>>> hw/pci-host/i440fx=2Ec             | 28 +++++++++++++---------------
>=
>>
>>> hw/pci-host/pam=2Ec                | 12 ++++++------
>>>
>>> hw/pci-host/q35=2Ec                | 31 ++++++++++++++++--------------=
-
>>>
>>> target/i386/tcg/sysemu/tcg-cpu=2Ec |  3 +--
>>>
>>> 13 files changed, 66 insertions(+), 60 deletions(-)
>>>
>>>
>>>
>>>-- >
>>>2=2E39=2E1
>>>
>>>
>>>

