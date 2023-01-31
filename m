Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9556682BE9
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpD2-00060V-1C; Tue, 31 Jan 2023 06:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpCz-0005zY-5D; Tue, 31 Jan 2023 06:53:53 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpCx-0002Kb-EP; Tue, 31 Jan 2023 06:53:52 -0500
Received: by mail-ed1-x533.google.com with SMTP id u21so14134834edv.3;
 Tue, 31 Jan 2023 03:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CV6DbXQ4WiiwIhud5+egk51JZFhVFpinyxfLOWtC5KM=;
 b=hS8u0yfNSODGlbdvvokhCmm/RqOiimQhtAoUhvVGqbQm3KoOXgJa51iyM7bmipVkfu
 ep7HU8wEHg/Rntbcm68h/ElmFCCKtVUTgy1tbqH6TcqnmBkvAGhX5HriJPBgGpZs6nbG
 NqTgoDZApLH3fYhz0qbgC7ox/PtI/4uPN8EKHlTrtNXPqQItfY2ad8TdoMMazVIoN75F
 gOj0oDG5EbnPqGpqWQDD7C7hXPVgUlxFG+EKIbuH36WJdcOTzSkLugL9ze3hZqfWkHZz
 tb6NNsq+axEtWqdlijfBK7cR73EY51wdEKOM/p6TSalfQAt+HGm9H/NYrZ9azUZ5Gugr
 +1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CV6DbXQ4WiiwIhud5+egk51JZFhVFpinyxfLOWtC5KM=;
 b=fGQn9Iqv+Hhdw8dpfb5NmDQVqKX0Llo46/cmuhrBRtl2+qzB4RI65P/MN7D4OnNCNF
 cMZgmt4TqM5ZzbhCsr4E2fqpNxP0mhJoZqddK5zFHXKyjcgNy32hjQ0IuZhmMzkyeGbm
 32jpjjA1wJG+0RrDXoDs95sOT15aRtBBzrnjy8rumhfkSbnG7waK2teDqO//WG8fCwuE
 cJPz1W/mjl72UBY0X6a7o+R1oB5h8+IyvIpihrgj9WMuluji+AAgnCJ7oJnVOmRY76k/
 T+VJ2589lup7GUPJsVVVkUiyz8JL8A5ays++aVRxj08ww6+Norv2Pctea3EvE6JuzNaM
 nUbA==
X-Gm-Message-State: AO0yUKV97XEJ2qzogb+Hu29ErsOsm5eJHp/oTJ0WjLjFnwJwADIQR6L0
 wjNMqaRV1eTKY6izOjSsQwoiOC2Nl/s=
X-Google-Smtp-Source: AK7set86H77md3MaSm7rxmA8WKmVJT0h9YguovCyd7ctlnbIl+wB7Y47v5WlWjJbzZhnCFBdaYZMug==
X-Received: by 2002:a05:6402:35d2:b0:4a2:3612:40c with SMTP id
 z18-20020a05640235d200b004a23612040cmr13076866edc.10.1675166029016; 
 Tue, 31 Jan 2023 03:53:49 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:53:48 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 00/20] PC and ICH9 cleanups
Date: Tue, 31 Jan 2023 12:53:06 +0100
Message-Id: <20230131115326.12454-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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

This series contains some cleanups I came across when working on the PC=0D
machines. It consists of reducing the usage of global variables and=0D
eliminating some redundancies.=0D
=0D
The ICH9 cleanups include further QOM'ification, making it more self-contai=
ned,=0D
and reducing its x86/pc dependencies.=0D
=0D
Testing done:=0D
* `make check`=0D
' `make check-avocado`=0D
* `qemu-system-x86_64 -M q35 -m 2G -cdrom \=0D
   manjaro-kde-21.3.2-220704-linux515.iso`=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.3.2-220704-linux515=
.iso`=0D
=0D
v2:=0D
* Factor out 'hw/i386/pc_q35: Reuse machine parameter' from 'hw/i386/pc_q35=
:=0D
  Resolve redundant q35_host variable' (Zoltan)=0D
* Lower type of phb to Object in 'hw/i386/pc_q35: Resolve redundant q35_hos=
t=0D
  variable' (Zoltan)=0D
* Add ICH9 cleanups=0D
=0D
Bernhard Beschow (20):=0D
  hw/pci-host/i440fx: Inline sysbus_add_io()=0D
  hw/pci-host/q35: Inline sysbus_add_io()=0D
  hw/i386/pc_q35: Reuse machine parameter=0D
  hw/i386/pc_q35: Resolve redundant q35_host variable=0D
  hw/i386/pc_{q35,piix}: Reuse MachineClass::desc as SMB product name=0D
  hw/i386/pc_{q35,piix}: Minimize usage of get_system_memory()=0D
  hw/i386/pc: Initialize ram_memory variable directly=0D
  hw/i386/ich9: Rename Q35_MASK to ICH9_MASK=0D
  hw/isa/lpc_ich9: Unexport PIRQ functions=0D
  hw/isa/lpc_ich9: Eliminate ICH9LPCState::isa_bus=0D
  hw/isa/lpc_ich9: Reuse memory and io address space of PCI bus=0D
  hw/i2c/smbus_ich9: Move ich9_smb_set_irq() in front of=0D
    ich9_smbus_realize()=0D
  hw/i2c/smbus_ich9: Inline ich9_smb_init() and remove it=0D
  hw/i386/pc_q35: Allow for setting properties before realizing=0D
    TYPE_ICH9_LPC_DEVICE=0D
  hw/isa/lpc_ich9: Connect pm stuff to lpc internally=0D
  hw/isa/lpc_ich9: Remove redundant ich9_lpc_reset() invocation=0D
  hw/i386/ich9: Remove redundant GSI_NUM_PINS=0D
  hw: Move ioapic*.h to intc/=0D
  hw/i386/ich9: Clean up includes=0D
  hw: Move ich9.h to southbridge/=0D
=0D
 MAINTAINERS                                 |  2 +=0D
 include/hw/acpi/ich9.h                      |  6 +-=0D
 include/hw/i386/pc.h                        |  1 -=0D
 include/hw/i386/x86.h                       |  3 +-=0D
 include/hw/{i386 =3D> intc}/ioapic.h          |  6 +-=0D
 include/hw/{i386 =3D> intc}/ioapic_internal.h |  8 +--=0D
 include/hw/{i386 =3D> southbridge}/ich9.h     | 35 ++++------=0D
 hw/acpi/ich9.c                              | 10 +--=0D
 hw/acpi/ich9_tco.c                          |  2 +-=0D
 hw/i2c/smbus_ich9.c                         | 39 +++++------=0D
 hw/i386/acpi-build.c                        |  3 +-=0D
 hw/i386/kvm/ioapic.c                        |  3 +-=0D
 hw/i386/pc.c                                |  8 +--=0D
 hw/i386/pc_piix.c                           |  8 +--=0D
 hw/i386/pc_q35.c                            | 73 ++++++++++-----------=0D
 hw/intc/apic.c                              |  2 +-=0D
 hw/intc/ioapic.c                            |  4 +-=0D
 hw/intc/ioapic_common.c                     |  4 +-=0D
 hw/isa/lpc_ich9.c                           | 40 +++++------=0D
 hw/pci-bridge/i82801b11.c                   |  2 +-=0D
 hw/pci-host/i440fx.c                        |  5 +-=0D
 hw/pci-host/q35.c                           |  6 +-=0D
 target/i386/whpx/whpx-all.c                 |  2 +-=0D
 tests/qtest/tco-test.c                      |  2 +-=0D
 24 files changed, 127 insertions(+), 147 deletions(-)=0D
 rename include/hw/{i386 =3D> intc}/ioapic.h (93%)=0D
 rename include/hw/{i386 =3D> intc}/ioapic_internal.h (96%)=0D
 rename include/hw/{i386 =3D> southbridge}/ich9.h (91%)=0D
=0D
-- =0D
2.39.1=0D
=0D

