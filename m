Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511666FE615
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 23:20:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwrDl-0006j0-Hh; Wed, 10 May 2023 17:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pwrDj-0006if-My; Wed, 10 May 2023 17:19:35 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pwrDh-0006DM-Jw; Wed, 10 May 2023 17:19:35 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9659f452148so1377292466b.1; 
 Wed, 10 May 2023 14:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683753570; x=1686345570;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrYuWyyaR+n6ic1gYEfiqe4BjmXyu/qkyBJLPKzd3T0=;
 b=lLcPKQvI7jF02dx+jWS5TJgsuIyCTyKuxIbBLtgrx/4p4nTn9mLfl0xADDVpaGLAvh
 Nrwe0wegqBM74cNJmlrWJnbNOKjuBYLkDSmGrik7cxDcg/SWsRr/0muXwE7T1wm7/Qze
 OG/a9f4WT5BUKyFHEeHIoH6cb3VhHn7aHblyLxrh77zveAxZRwQ4fosjeLES/8dsADCd
 FeD3ocLGE7lnezRxYR7pPP8O7j+zRM73+gjcblYBso+yq4ARhtrWfzjSPzoxXYiOAFxb
 QSItyNfDUb9b5Fr6mXIm0zbYu6hLyApMY4xNOzVu0oND1qIk1IJZw9VHx76k27PMtqSk
 ZecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683753570; x=1686345570;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wrYuWyyaR+n6ic1gYEfiqe4BjmXyu/qkyBJLPKzd3T0=;
 b=VvSCAFeCl+hlB8JEePeamt8d10QmyNx6+c93UwyvrYkFZJ8K26EaJ3RAnErwT/LYoM
 FZ5IrC3A9YHTOqApg9BeoOOyid5K3FNqe8EJ6yjDPVWYSiWFtWqfjbXD1UW7GFZjC6gf
 dPxB7oLDL8wziaH3DF6e984xVRyM1qPXiGDp5d01htsF6KTSFY7Ba5TwLdi7kXlTnQDi
 NBOz2kp+Bwp6L/h8655mk8YD97NA/AP6oE1Lao+RtIS2Q/ctFmFcO13DCdJCXfOfmdGF
 5hZQLlbCUilPpvmLbgtGl40Jjc0vhWsalLj2jRQK0+G5yCwYHA+GGleIi5YvFTM7BjdC
 KNjg==
X-Gm-Message-State: AC+VfDwnOFH54KSrDtGzCclt0xrdSl62wkNokYHuvoC4H5pEQMJDOPlM
 XtJvZ8ov/MoByDCRQJoZQn0=
X-Google-Smtp-Source: ACHHUZ7iaYvN3fOGrU7/yHe98BpVrRc7Brv68RIChXeH4kQrvNJC8VBPO19wUYkx80hobi8UbQotWA==
X-Received: by 2002:a17:907:36c1:b0:94f:36a0:da45 with SMTP id
 bj1-20020a17090736c100b0094f36a0da45mr16021577ejc.29.1683753570229; 
 Wed, 10 May 2023 14:19:30 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-021-051.89.12.pool.telefonica.de.
 [89.12.21.51]) by smtp.gmail.com with ESMTPSA id
 jl2-20020a17090775c200b00965cbcaf31fsm3113990ejc.99.2023.05.10.14.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 14:19:29 -0700 (PDT)
Date: Wed, 10 May 2023 21:19:25 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v4 0/9] PC cleanups
In-Reply-To: <20230510152043-mutt-send-email-mst@kernel.org>
References: <20230213162004.2797-1-shentey@gmail.com>
 <776DAC15-E708-47BF-9EF6-D511731DF56D@gmail.com>
 <4A6D076C-5091-42A5-BB83-695B5BF2F04D@gmail.com>
 <73EFF09E-8246-4E6E-8F6E-189BA222A7D7@gmail.com>
 <20230510152043-mutt-send-email-mst@kernel.org>
Message-ID: <1F853F97-D4A3-456F-8B4A-665EA7BC9076@gmail.com>
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



Am 10=2E Mai 2023 19:20:59 UTC schrieb "Michael S=2E Tsirkin" <mst@redhat=
=2Ecom>:
>On Wed, May 10, 2023 at 06:26:54PM +0000, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 5=2E M=C3=A4rz 2023 07:45:55 UTC schrieb Bernhard Beschow <shentey@g=
mail=2Ecom>:
>> >
>> >
>> >Am 13=2E Februar 2023 16:45:05 UTC schrieb Bernhard Beschow <shentey@g=
mail=2Ecom>:
>> >>
>> >>
>> >>Am 13=2E Februar 2023 16:19:55 UTC schrieb Bernhard Beschow <shentey@=
gmail=2Ecom>:
>> >>>This series contains some cleanups I came across when working on the=
 PC
>> >>>
>> >>>machines=2E It consists of reducing the usage of global variables an=
d eliminating
>> >>>
>> >>>some redundancies=2E
>> >>>
>> >>>
>> >>>
>> >>>One notable change is that the SMRAM memory region gets moved from t=
he i440fx
>> >>>
>> >>>and q35 host bridges into the x86 machine=2E This will simplify clea=
ning up these
>> >>>
>> >>>host bridges which will be done in a separate series=2E Note that th=
e movement of
>> >>>
>> >>>the SMRAM memory region apparently doesn't change migration ABI for =
the pc and
>> >>>
>> >>>q35 machines (see below)=2E
>> >>>
>> >>>
>> >>>
>> >>>Testing done:
>> >>>
>> >>>* `make check`
>> >>>
>> >>>' `make check-avocado`
>> >>>
>> >>>* `qemu-system-x86_64 -M q35 -m 2G -cdrom \
>> >>>
>> >>>   manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>> >>>
>> >>>* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21=2E3=2E2-2207=
04-linux515=2Eiso`
>> >>>
>> >>>* Confirm that JSON representation of migration files (pc & q35) are=
 empty:
>> >>>
>> >>>  1=2E Create four migration files {pc,q35}-{before,after}=2Emig by =
running
>> >>>
>> >>>     `qemu-system-x86_64 -M {pc,q35} -S` with QEMU built from master=
 and from
>> >>>
>> >>>     this series=2E
>> >>>
>> >>>  2=2E Run `=2E/scripts/analyze-migration=2Epy -d desc -f *=2Emig > =
*=2Ejson` on the four
>> >>>
>> >>>     files
>> >>>
>> >>>  3=2E Compare the diffs -> both are empty
>> >>>
>> >>>
>> >>>
>> >>>v4:
>> >>>
>> >>>* Remove ram_memory variable in pc_q35 completely (Zoltan)
>> >>>
>> >>
>> >>The last two patches still need review=2E Comments welcome!
>> >
>> >Ping
>> >
>> >Can we queue the reviewed patches (all but the last two) already?
>>=20
>> Ping 2
>
>
>queued 1-7

Thanks -- also for the RTC ones!

Best regards,
Bernhard

>
>> >
>> >Thanks,
>> >Bernhard
>> >
>> >>
>> >>>
>> >>>
>> >>>v3:
>> >>>
>> >>>* Add three patches regarding init_pam() and SMRAM=2E
>> >>>
>> >>>* Drop 'hw/i386/pc_q35: Resolve redundant q35_host variable' since P=
hil posted
>> >>>
>> >>>  a similar patch in a more comprehensive series:
>> >>>
>> >>>  https://lore=2Ekernel=2Eorg/qemu-devel/20230203180914=2E49112-13-p=
hilmd@linaro=2Eorg/
>> >>>
>> >>>* Drop 'hw/isa/lpc_ich9: Reuse memory and io address space of PCI bu=
s' since
>> >>>
>> >>>  it inadvertantly changed the memory hierarchy=2E
>> >>>
>> >>>* Drop ICH9 cleanups again in favor of a separate series=2E
>> >>>
>> >>>
>> >>>
>> >>>v2:
>> >>>
>> >>>* Factor out 'hw/i386/pc_q35: Reuse machine parameter' from 'hw/i386=
/pc_q35:
>> >>>
>> >>>  Resolve redundant q35_host variable' (Zoltan)
>> >>>
>> >>>* Lower type of phb to Object in 'hw/i386/pc_q35: Resolve redundant =
q35_host
>> >>>
>> >>>  variable' (Zoltan)
>> >>>
>> >>>* Add ICH9 cleanups
>> >>>
>> >>>
>> >>>
>> >>>Bernhard Beschow (9):
>> >>>
>> >>>  hw/pci-host/i440fx: Inline sysbus_add_io()
>> >>>
>> >>>  hw/pci-host/q35: Inline sysbus_add_io()
>> >>>
>> >>>  hw/i386/pc_q35: Reuse machine parameter
>> >>>
>> >>>  hw/i386/pc_{q35,piix}: Reuse MachineClass::desc as SMB product nam=
e
>> >>>
>> >>>  hw/i386/pc_{q35,piix}: Minimize usage of get_system_memory()
>> >>>
>> >>>  hw/i386/pc: Initialize ram_memory variable directly
>> >>>
>> >>>  hw/pci-host/pam: Make init_pam() usage more readable
>> >>>
>> >>>  hw/i386/x86: Make TYPE_X86_MACHINE the owner of smram
>> >>>
>> >>>  target/i386/tcg/sysemu/tcg-cpu: Avoid own opinion about smram size
>> >>>
>> >>>
>> >>>
>> >>> include/hw/i386/pc=2Eh             |  1 -
>> >>>
>> >>> include/hw/i386/x86=2Eh            |  2 ++
>> >>>
>> >>> include/hw/pci-host/i440fx=2Eh     |  7 ++++---
>> >>>
>> >>> include/hw/pci-host/pam=2Eh        |  5 +++--
>> >>>
>> >>> include/hw/pci-host/q35=2Eh        |  4 +++-
>> >>>
>> >>> hw/i386/pc=2Ec                     |  2 --
>> >>>
>> >>> hw/i386/pc_piix=2Ec                | 10 +++++-----
>> >>>
>> >>> hw/i386/pc_q35=2Ec                 | 17 +++++++++--------
>> >>>
>> >>> hw/i386/x86=2Ec                    |  4 ++++
>> >>>
>> >>> hw/pci-host/i440fx=2Ec             | 28 +++++++++++++--------------=
-
>> >>>
>> >>> hw/pci-host/pam=2Ec                | 12 ++++++------
>> >>>
>> >>> hw/pci-host/q35=2Ec                | 31 ++++++++++++++++-----------=
----
>> >>>
>> >>> target/i386/tcg/sysemu/tcg-cpu=2Ec |  3 +--
>> >>>
>> >>> 13 files changed, 66 insertions(+), 60 deletions(-)
>> >>>
>> >>>
>> >>>
>> >>>-- >
>> >>>2=2E39=2E1
>> >>>
>> >>>
>> >>>
>

