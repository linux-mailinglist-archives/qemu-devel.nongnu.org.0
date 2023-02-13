Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A078694E00
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:31:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcfd-00083c-Nf; Mon, 13 Feb 2023 12:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfS-00082g-F2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:06 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRcfN-0005NO-85
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:31:02 -0500
Received: by mail-ej1-x634.google.com with SMTP id sa10so33657975ejc.9
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2g/yj7HSM1JWSFyh5FMydSD3mRWUMrKSy/FqqifK/ig=;
 b=Susz1sCSYqR/WbL9g6OFgSQ1c4YrRuOsNpo96GU3CJEeAgKeVYC5AJvyJ//DyZytwM
 GMKW8LV4raxOW7wusptM7+qW2xSqMk1ozEfYupwIKnSEpq3jQTJw20tYElEcTWP6+X8e
 KIog6PR6CLf82UlF1uUUzA7f3XCS2YxJfEm+FeWeys5XIZwg43qMTI+HtNSz+FqgY/rV
 njYspsWyHG+14bxuLtVRvvyzo1OhI8h//TWrF1+s5loz7HSpbiXHwRAxBJbKhkAxEqe1
 f1u7ywjor3n3CYF6BjwBiYNhokvjwAyREJGPbidsVhgZe9yjj2PktmjNQM/EcGoItPN2
 gfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2g/yj7HSM1JWSFyh5FMydSD3mRWUMrKSy/FqqifK/ig=;
 b=kg3T0RufflPdhFMwL4cBcSiUhsWAqn6pmmlNBwOp2SBHC5j0qvH1BNgDKZsL/rMADe
 MMctBEYhatMZc6NFiL5RH9TZ7l3I6NC3tHSQ2v41ZkKqXrN3AwRVGCDBrwkDYX/Bm0W5
 6ihSa7WPpVKEfEM5LOoTFhDC6Wlsll7oqS+M2XzIgGEmKs+4LlEhZb/gKFF7L7UsW7OI
 XgrhCPYX3HsbkBUyx6UDeNMNagxWZP12Geqy15AkrqMItTNtr5GjdGp6/qwVXbEjnLit
 P3H8jR8C55gg2tngYClqC/BpgxIjNfCtLp22l3KT/2o9JHgfSREPtOlDJq3ctT0xelQh
 daRA==
X-Gm-Message-State: AO0yUKV/fjdPdsSSqJsju/QOOHI2q1PaOlnV5eRjlmanHqksjwXE/3Q5
 qv+uA/uY+b1OQSY3/KwXR6v6+sf88f8=
X-Google-Smtp-Source: AK7set8Spcy8nBg12Ie96ikaExIBBoL6kP3AsKXywg++czn6iot1kh7tO8H4puxNeBjrTy26MRebzQ==
X-Received: by 2002:a17:906:3a8f:b0:88f:a236:69e6 with SMTP id
 y15-20020a1709063a8f00b0088fa23669e6mr24174475ejd.7.1676309459302; 
 Mon, 13 Feb 2023 09:30:59 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-133-198.78.55.pool.telefonica.de. [78.55.133.198])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170906684b00b008aea5e0938esm6988699ejs.183.2023.02.13.09.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 09:30:58 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/12] ICH9 cleanup
Date: Mon, 13 Feb 2023 18:30:21 +0100
Message-Id: <20230213173033.98762-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This series includes ICH9 cleanups such as further QOM'ification, making it=
 more=0D
self-contained, and reducing its x86/pc dependencies. While reducing x86=0D
dependencies, the IOAPIC sources are moved from hw/i386 to hw/intc which is=
=0D
consistent with the header files.=0D
=0D
The series was originally part of=0D
https://lore.kernel.org/qemu-devel/20230131115326.12454-1-shentey@gmail.com=
/ ,=0D
a series which has been split into two (see Based-on tag below). It is a re=
spin=0D
with Reviewd-By tags picked up.=0D
=0D
Testing done:=0D
* `make check`=0D
* `make check-avocado`=0D
* `qemu-system-x86_64 -M q35 -m 2G -cdrom \=0D
   manjaro-kde-21.3.2-220704-linux515.iso`=0D
=0D
Based-on: 20230213162004.2797-1-shentey@gmail.com=0D
          "[PATCH v4 0/9] PC cleanups"=0D
=0D
Bernhard Beschow (12):=0D
  hw/i386/ich9: Rename Q35_MASK to ICH9_MASK=0D
  hw/isa/lpc_ich9: Unexport PIRQ functions=0D
  hw/isa/lpc_ich9: Eliminate ICH9LPCState::isa_bus=0D
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
 MAINTAINERS                                 |  2 ++=0D
 include/hw/acpi/ich9.h                      |  6 ++--=0D
 include/hw/i386/x86.h                       |  3 +-=0D
 include/hw/{i386 =3D> intc}/ioapic.h          |  6 ++--=0D
 include/hw/{i386 =3D> intc}/ioapic_internal.h |  8 ++---=0D
 include/hw/{i386 =3D> southbridge}/ich9.h     | 35 ++++++++----------=0D
 hw/acpi/ich9.c                              | 10 ++----=0D
 hw/acpi/ich9_tco.c                          |  2 +-=0D
 hw/i2c/smbus_ich9.c                         | 39 +++++++++------------=0D
 hw/i386/acpi-build.c                        |  3 +-=0D
 hw/i386/kvm/ioapic.c                        |  3 +-=0D
 hw/i386/pc.c                                |  6 ++--=0D
 hw/i386/pc_q35.c                            | 34 +++++++++---------=0D
 hw/intc/apic.c                              |  2 +-=0D
 hw/intc/ioapic.c                            |  4 +--=0D
 hw/intc/ioapic_common.c                     |  4 +--=0D
 hw/isa/lpc_ich9.c                           | 34 +++++++++---------=0D
 hw/pci-bridge/i82801b11.c                   |  2 +-=0D
 target/i386/whpx/whpx-all.c                 |  2 +-=0D
 tests/qtest/tco-test.c                      |  2 +-=0D
 20 files changed, 94 insertions(+), 113 deletions(-)=0D
 rename include/hw/{i386 =3D> intc}/ioapic.h (93%)=0D
 rename include/hw/{i386 =3D> intc}/ioapic_internal.h (96%)=0D
 rename include/hw/{i386 =3D> southbridge}/ich9.h (91%)=0D
=0D
-- =0D
2.39.1=0D
=0D

