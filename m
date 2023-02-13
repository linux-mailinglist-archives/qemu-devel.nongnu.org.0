Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75DE694D30
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:46:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbxD-0004AY-5X; Mon, 13 Feb 2023 11:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbxB-0004AJ-45; Mon, 13 Feb 2023 11:45:21 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbx9-00041j-6j; Mon, 13 Feb 2023 11:45:20 -0500
Received: by mail-ej1-x633.google.com with SMTP id dr8so33303416ejc.12;
 Mon, 13 Feb 2023 08:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uus+PB3PAwGM2OjocJM0cSAakTMGCbD6B2Qy8FUIyTU=;
 b=Og6w0QZiIc4Rrwh1PnZ8yGMsUl78WxFDLyFie8z+kUgO441BXOPDzQcNLvEtu4QpKs
 NrreCR//GNRExYg3Htiw2KQG/LiMOC1NRukAtR+wILVr3scjQZkrDL25ec4L/rADYp6M
 65njEfMVUGLWZ3DEQijz1idCTnVUs3pp5Lt4xgVNAQI5TBFQEG8KLzWugupS7pvyZV/t
 spRVG3S+VoHYrfUx6nkSKHQ7DEtCPJTXT8cCiVp23UdBrV0QqGDNKn5xM7ndsipj6XBd
 mMJ2F0ftfMGWjlmg6d/hNnIbjaq0Kz3oxF4IkDOP6HBetph58GmR6eHLLp2NylTtweib
 FSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uus+PB3PAwGM2OjocJM0cSAakTMGCbD6B2Qy8FUIyTU=;
 b=b4nSyvqOHdOU3T8tMDr6reQCq3YmhCHPcvCGPvxmRazA7EZUebLbrkVr2BcCHQNWAy
 1ImCp1lnxGoOcniwnqqQNmODW9dzvblHdKf60mSZxDVgUzW3hEMyiM9Br9SzJgt+RtSX
 +yD1GuUxbJ9uZb5W8MN9H9qlf+K4DkPM6QAycwpmmj03qidzBVFWqNFFa/EW5PxlAGQD
 AE0+JvbpyHp63QB/8G5wwNXeKHIl271SlrE1j2uo+NDHTUDrKnHVTy8lUhaOhoDv6Zbn
 sgc1oB7jXzxQ25uV7qC0vtbKcPWm6tz3mUKgDudLkWCWC6sP7JRIXoCeD/i6Y6gNddWz
 CSzw==
X-Gm-Message-State: AO0yUKUy41VxOtF0AkgvePpT3m8eNTKLS+VxUTuVrvaHxwnFSPKhz5Mo
 mcw7Z4QIIkFOV7qE90Uel5cQXVSkjwk=
X-Google-Smtp-Source: AK7set8upnJ9YmXXOuUVBZS98qpHrSenJo28x5CvEbryD7RbkHGjdbiCjvXnn6Z+ZaLAaBgOeTc50A==
X-Received: by 2002:a17:906:4e54:b0:8af:2b57:b80f with SMTP id
 g20-20020a1709064e5400b008af2b57b80fmr14495600ejw.55.1676306713833; 
 Mon, 13 Feb 2023 08:45:13 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-133-198.78.55.pool.telefonica.de.
 [78.55.133.198]) by smtp.gmail.com with ESMTPSA id
 t16-20020a508d50000000b004acbe66e653sm3007997edt.84.2023.02.13.08.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 08:45:13 -0800 (PST)
Date: Mon, 13 Feb 2023 16:45:05 +0000
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
In-Reply-To: <20230213162004.2797-1-shentey@gmail.com>
References: <20230213162004.2797-1-shentey@gmail.com>
Message-ID: <776DAC15-E708-47BF-9EF6-D511731DF56D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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



Am 13=2E Februar 2023 16:19:55 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>This series contains some cleanups I came across when working on the PC
>
>machines=2E It consists of reducing the usage of global variables and eli=
minating
>
>some redundancies=2E
>
>
>
>One notable change is that the SMRAM memory region gets moved from the i4=
40fx
>
>and q35 host bridges into the x86 machine=2E This will simplify cleaning =
up these
>
>host bridges which will be done in a separate series=2E Note that the mov=
ement of
>
>the SMRAM memory region apparently doesn't change migration ABI for the p=
c and
>
>q35 machines (see below)=2E
>
>
>
>Testing done:
>
>* `make check`
>
>' `make check-avocado`
>
>* `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>
>   manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>
>* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21=2E3=2E2-220704-li=
nux515=2Eiso`
>
>* Confirm that JSON representation of migration files (pc & q35) are empt=
y:
>
>  1=2E Create four migration files {pc,q35}-{before,after}=2Emig by runni=
ng
>
>     `qemu-system-x86_64 -M {pc,q35} -S` with QEMU built from master and =
from
>
>     this series=2E
>
>  2=2E Run `=2E/scripts/analyze-migration=2Epy -d desc -f *=2Emig > *=2Ej=
son` on the four
>
>     files
>
>  3=2E Compare the diffs -> both are empty
>
>
>
>v4:
>
>* Remove ram_memory variable in pc_q35 completely (Zoltan)
>

The last two patches still need review=2E Comments welcome!

>
>
>v3:
>
>* Add three patches regarding init_pam() and SMRAM=2E
>
>* Drop 'hw/i386/pc_q35: Resolve redundant q35_host variable' since Phil p=
osted
>
>  a similar patch in a more comprehensive series:
>
>  https://lore=2Ekernel=2Eorg/qemu-devel/20230203180914=2E49112-13-philmd=
@linaro=2Eorg/
>
>* Drop 'hw/isa/lpc_ich9: Reuse memory and io address space of PCI bus' si=
nce
>
>  it inadvertantly changed the memory hierarchy=2E
>
>* Drop ICH9 cleanups again in favor of a separate series=2E
>
>
>
>v2:
>
>* Factor out 'hw/i386/pc_q35: Reuse machine parameter' from 'hw/i386/pc_q=
35:
>
>  Resolve redundant q35_host variable' (Zoltan)
>
>* Lower type of phb to Object in 'hw/i386/pc_q35: Resolve redundant q35_h=
ost
>
>  variable' (Zoltan)
>
>* Add ICH9 cleanups
>
>
>
>Bernhard Beschow (9):
>
>  hw/pci-host/i440fx: Inline sysbus_add_io()
>
>  hw/pci-host/q35: Inline sysbus_add_io()
>
>  hw/i386/pc_q35: Reuse machine parameter
>
>  hw/i386/pc_{q35,piix}: Reuse MachineClass::desc as SMB product name
>
>  hw/i386/pc_{q35,piix}: Minimize usage of get_system_memory()
>
>  hw/i386/pc: Initialize ram_memory variable directly
>
>  hw/pci-host/pam: Make init_pam() usage more readable
>
>  hw/i386/x86: Make TYPE_X86_MACHINE the owner of smram
>
>  target/i386/tcg/sysemu/tcg-cpu: Avoid own opinion about smram size
>
>
>
> include/hw/i386/pc=2Eh             |  1 -
>
> include/hw/i386/x86=2Eh            |  2 ++
>
> include/hw/pci-host/i440fx=2Eh     |  7 ++++---
>
> include/hw/pci-host/pam=2Eh        |  5 +++--
>
> include/hw/pci-host/q35=2Eh        |  4 +++-
>
> hw/i386/pc=2Ec                     |  2 --
>
> hw/i386/pc_piix=2Ec                | 10 +++++-----
>
> hw/i386/pc_q35=2Ec                 | 17 +++++++++--------
>
> hw/i386/x86=2Ec                    |  4 ++++
>
> hw/pci-host/i440fx=2Ec             | 28 +++++++++++++---------------
>
> hw/pci-host/pam=2Ec                | 12 ++++++------
>
> hw/pci-host/q35=2Ec                | 31 ++++++++++++++++---------------
=
>
> target/i386/tcg/sysemu/tcg-cpu=2Ec |  3 +--
>
> 13 files changed, 66 insertions(+), 60 deletions(-)
>
>
>
>-- >
>2=2E39=2E1
>
>
>

