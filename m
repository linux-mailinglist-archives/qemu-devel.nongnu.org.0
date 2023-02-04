Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8315868AADB
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:12:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOKBy-0002OK-MS; Sat, 04 Feb 2023 10:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKBv-0002NS-Ji; Sat, 04 Feb 2023 10:10:59 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKBt-0006a1-S8; Sat, 04 Feb 2023 10:10:59 -0500
Received: by mail-ej1-x630.google.com with SMTP id dr8so22831222ejc.12;
 Sat, 04 Feb 2023 07:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EfmMdCHz+Fhltt6YfTaJbRbrlBRK7jA6WLfOJqml/3o=;
 b=eNaXTzLgKJsYzN9zpLA0l3RTGY5gIYeyG0JDFd8eSxZMtmjjNL2RquNP0+WSb3+tiC
 tuZrvLQkSTLwjcgmVoIAuif/ASIMoerjt3u6FjZjqK7+vjXjA8m2xGG9i3DOeD7dg8ho
 PmqkFt/Emnv6gEFRTVHSfmWzNpq+LsW8+mk75gipGnW0JCiHN7IpZ41850yMdJPCI5GK
 xgaZ1xn5HKG+9sqQZ9D8KqLlBIdFStNA1zxSVfJIAdg5VXTn8Y6RDpjcBi8MVlf5aG7r
 kj5jF4aI8Xbw1OEgQXzmNe7jH2OO4t7NJ/s9qrvPOz8jS/PTPL/4pMdkSF77p9m3EafZ
 5VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EfmMdCHz+Fhltt6YfTaJbRbrlBRK7jA6WLfOJqml/3o=;
 b=Ed+tWxhKC2OMcI06LiG/pf9IbYjECGJ6ZVp/P/AwSfY2Z5d6xKfhETCrp6PUi4LX6t
 ird5Bnjro7cIPCX8cxUdCPgs5wwWgGSPpVt0P0TiWb0bbTer2QGa7VZbRVI7Dhs1JaEQ
 eGeGc1IYcZtElktl4JmyoSn09/743NH+TgnuGleVz7zUfA6X1BNWIUqClddLnFxvsRK0
 oFnhLc1HXyackwD1bkcwLdbVVXrBwxdQTP2eaGeobOUnsFexYmf3OwHV4eoGB1BckbcA
 Oyh6xBl3YNwIKhs25ebmNGRHwxftNlQBTBruSfYk8meZGkHuUmqPkZcQ9TTlu7JZiViO
 AN2Q==
X-Gm-Message-State: AO0yUKUUq62CiNDDC31H2QEyv8ME2pnQiyAIRIOtvapv21iyH6BlSfhW
 jQT0E4HFR5SkUGCB6qx/NbrjbHQhEu8=
X-Google-Smtp-Source: AK7set+ARqWwQbRVk8DA5O5aHkUkYVLQ3MFi6x4JOlpACJjgCpRlyrd13UMPIVTG9G5cZf8kttrOJg==
X-Received: by 2002:a17:907:8e93:b0:888:a06f:104b with SMTP id
 tx19-20020a1709078e9300b00888a06f104bmr15905424ejc.36.1675523455272; 
 Sat, 04 Feb 2023 07:10:55 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-183-077-083.77.183.pool.telefonica.de. [77.183.77.83])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0088a2aebb146sm2937922ejt.52.2023.02.04.07.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 07:10:54 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 0/9] PC cleanups
Date: Sat,  4 Feb 2023 16:10:18 +0100
Message-Id: <20230204151027.39007-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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
host bridges which will be done in a separate series.=0D
=0D
Testing done:=0D
* `make check`=0D
' `make check-avocado`=0D
* `qemu-system-x86_64 -M q35 -m 2G -cdrom \=0D
   manjaro-kde-21.3.2-220704-linux515.iso`=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.3.2-220704-linux515=
.iso`=0D
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
 hw/i386/pc_q35.c                 | 16 +++++++++-------=0D
 hw/i386/x86.c                    |  4 ++++=0D
 hw/pci-host/i440fx.c             | 28 +++++++++++++---------------=0D
 hw/pci-host/pam.c                | 12 ++++++------=0D
 hw/pci-host/q35.c                | 31 ++++++++++++++++---------------=0D
 target/i386/tcg/sysemu/tcg-cpu.c |  3 +--=0D
 13 files changed, 66 insertions(+), 59 deletions(-)=0D
=0D
-- =0D
2.39.1=0D
=0D

