Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D878A694C5F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:21:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbZL-0004Zs-Qe; Mon, 13 Feb 2023 11:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZI-0004YF-Q0; Mon, 13 Feb 2023 11:20:40 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRbZG-0007vD-RT; Mon, 13 Feb 2023 11:20:40 -0500
Received: by mail-ej1-x631.google.com with SMTP id sb24so9244869ejb.8;
 Mon, 13 Feb 2023 08:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CWeQEhkJ06ecAyh8L7LOO2aEbqr7bNhwpy+DgMqY1Vo=;
 b=nKV+BRiPyBDuKBpBkqn9HNgy41DijQu6VM/A+nU6M3AXCpLwZMx/q+YmlCe7dp8kBY
 5pDCtzOx2Z1O/vNSDumF1IJcwNuEF7f8A/hA4ZZC0lzblSqqxGyikPFqtM7NBYKaze4p
 2ApvoRKuyBv92hpvGChinzrSIFWIp1emMGMKStR3B9Aorqeic2dzFp7zMBzZb/BVOVcq
 Wwx2WjPwrrjKMonhNJ8wAXKn80VFId583SciwzILLm+ooOpL3+9cOy4v5koeiiOxiKeC
 /MvT3e4NCBYSzjXOSkSjwXrD61efmRxGqbXBDO9R3uwwU032InLfGJtx5+9N6uC+16gO
 b8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CWeQEhkJ06ecAyh8L7LOO2aEbqr7bNhwpy+DgMqY1Vo=;
 b=ttpY/2L/lNqNH6Ix7q5JVczlQCu7j0OBJrqZI6vVGgjkS3eHDk8UCfiu6D5bsjYQr4
 6KcXC1h/3so76NqNWjh45fDE9MR2rp037LhsfdUjHPyrcTUEFrR0KmgtvToQrhvKky3H
 MJeOu1XtE7zV9a2aMCfO4knnZzBgXyztUXxJTHFcd+Jz+OLIeMCLyzGDuxLd3hI1Aq/Q
 xOSuZQspqtvi40Y+dB5JmH/p5DtKLA/QxR/cbJJP4DhRyUxiLUo4hfskodzn5eyO/Prq
 /5SuyeQyAyIvxIlZLeUOumoOdyZrSYxjlzj9QiOHok8g1dSJ9CbveGuTtEs5F6aDsF51
 PPVg==
X-Gm-Message-State: AO0yUKWB5bVaOzEwu/HGkHNG81rBEE6eOoijtKfzEOqQWBmkCy4dWjlv
 qXqWWugob2EOfiHbUxdzmqfVOBBrbGI=
X-Google-Smtp-Source: AK7set8aYYsDPd/KMfDz0y0+kDDszQX7lhOPzyw8fZI+ej451czJ9tiUtvmeIypTjC7DPl4Qe9BnXQ==
X-Received: by 2002:a17:906:fe49:b0:8aa:c0d6:2dc6 with SMTP id
 wz9-20020a170906fe4900b008aac0d62dc6mr27539000ejb.29.1676305236320; 
 Mon, 13 Feb 2023 08:20:36 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm6979952ejl.211.2023.02.13.08.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:20:35 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 0/9] PC cleanups
Date: Mon, 13 Feb 2023 17:19:55 +0100
Message-Id: <20230213162004.2797-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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
machines. It consists of reducing the usage of global variables and elimina=
ting=0D
some redundancies.=0D
=0D
One notable change is that the SMRAM memory region gets moved from the i440=
fx=0D
and q35 host bridges into the x86 machine. This will simplify cleaning up t=
hese=0D
host bridges which will be done in a separate series. Note that the movemen=
t of=0D
the SMRAM memory region apparently doesn't change migration ABI for the pc =
and=0D
q35 machines (see below).=0D
=0D
Testing done:=0D
* `make check`=0D
' `make check-avocado`=0D
* `qemu-system-x86_64 -M q35 -m 2G -cdrom \=0D
   manjaro-kde-21.3.2-220704-linux515.iso`=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.3.2-220704-linux515=
.iso`=0D
* Confirm that JSON representation of migration files (pc & q35) are empty:=
=0D
  1. Create four migration files {pc,q35}-{before,after}.mig by running=0D
     `qemu-system-x86_64 -M {pc,q35} -S` with QEMU built from master and fr=
om=0D
     this series.=0D
  2. Run `./scripts/analyze-migration.py -d desc -f *.mig > *.json` on the =
four=0D
     files=0D
  3. Compare the diffs -> both are empty=0D
=0D
v4:=0D
* Remove ram_memory variable in pc_q35 completely (Zoltan)=0D
=0D
v3:=0D
* Add three patches regarding init_pam() and SMRAM.=0D
* Drop 'hw/i386/pc_q35: Resolve redundant q35_host variable' since Phil pos=
ted=0D
  a similar patch in a more comprehensive series:=0D
  https://lore.kernel.org/qemu-devel/20230203180914.49112-13-philmd@linaro.=
org/=0D
* Drop 'hw/isa/lpc_ich9: Reuse memory and io address space of PCI bus' sinc=
e=0D
  it inadvertantly changed the memory hierarchy.=0D
* Drop ICH9 cleanups again in favor of a separate series.=0D
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
Bernhard Beschow (9):=0D
  hw/pci-host/i440fx: Inline sysbus_add_io()=0D
  hw/pci-host/q35: Inline sysbus_add_io()=0D
  hw/i386/pc_q35: Reuse machine parameter=0D
  hw/i386/pc_{q35,piix}: Reuse MachineClass::desc as SMB product name=0D
  hw/i386/pc_{q35,piix}: Minimize usage of get_system_memory()=0D
  hw/i386/pc: Initialize ram_memory variable directly=0D
  hw/pci-host/pam: Make init_pam() usage more readable=0D
  hw/i386/x86: Make TYPE_X86_MACHINE the owner of smram=0D
  target/i386/tcg/sysemu/tcg-cpu: Avoid own opinion about smram size=0D
=0D
 include/hw/i386/pc.h             |  1 -=0D
 include/hw/i386/x86.h            |  2 ++=0D
 include/hw/pci-host/i440fx.h     |  7 ++++---=0D
 include/hw/pci-host/pam.h        |  5 +++--=0D
 include/hw/pci-host/q35.h        |  4 +++-=0D
 hw/i386/pc.c                     |  2 --=0D
 hw/i386/pc_piix.c                | 10 +++++-----=0D
 hw/i386/pc_q35.c                 | 17 +++++++++--------=0D
 hw/i386/x86.c                    |  4 ++++=0D
 hw/pci-host/i440fx.c             | 28 +++++++++++++---------------=0D
 hw/pci-host/pam.c                | 12 ++++++------=0D
 hw/pci-host/q35.c                | 31 ++++++++++++++++---------------=0D
 target/i386/tcg/sysemu/tcg-cpu.c |  3 +--=0D
 13 files changed, 66 insertions(+), 60 deletions(-)=0D
=0D
-- =0D
2.39.1=0D
=0D

