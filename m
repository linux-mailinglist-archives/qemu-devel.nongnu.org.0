Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE7F434D31
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:12:19 +0200 (CEST)
Received: from localhost ([::1]:44202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCKI-0006vx-Sc
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mdCCf-0004YX-Mj
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:04:26 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mdCCd-0006V8-QB
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:04:25 -0400
Received: by mail-ed1-x529.google.com with SMTP id y12so29022048eda.4
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 07:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xkpyQ5AbPw+FNWjiWupZngTj/v1uTkaJRn/m66KNdZI=;
 b=BTw7umoj+miGB0KjxlLfq2Tvi/13DTGEzPAHa856igG/mqQrQdAkjNWCFRFi9mXfAV
 ko5uOphOPD3kdHtRE8iF0UPipGcobJQ6TGkDUtIK24Nc/S90VoOgd6T4A5i4FUgGt9fk
 9T43NtsuWe3ZL3XitYsVtEU8JcYVWxKXBlSl3ChzCVEB+a7Gdm4yNiAC3nKWi90lTyu4
 RbcrmjEeaTwWk8I2VhKNQ139Zfut75tqrq4+lVKm/cwLN3lJ8UHjysf3h5V8gko01+5S
 byzH/WcOj5+sTz+A6h5G9QhzEolHu84wpmuWN9/rw5HWp7D9GYOQx4xGIpDCmKT3K3tr
 JZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xkpyQ5AbPw+FNWjiWupZngTj/v1uTkaJRn/m66KNdZI=;
 b=BJlDkOIoLBsfZFEmxlF92m1zvPWBqq/Tg/5r8+cYha5gOmJTLutF32sSx7fUpaENzZ
 9mJMr8mkHNxA4VxQfLN19kMQYpMUZ8TGHNpdM7A1efWRrIDEkYIrbiX/Lla4mIkIiMGl
 zva9zOGC/2MHZ3S/1NWaEVX9p+JD1pAETDhMIJ7kvbIYwh40cFOA4YlHvzqOyTtLEXEZ
 VPGUh6q9PjYsVqyaw+FBdXUQFn2CE13t6dAksKkt9xE5LWE3Hep1NubsYKk6qCSYj2PR
 jGmF/d1d65A2gXig0wp81LySaALOeKtXhR1soO97cfNu7Tyj7FrVE1G3tgfBhG2Qqdak
 uqsA==
X-Gm-Message-State: AOAM5323lBB9eZNWnX4wjGOD9lIjvb1F2ilT52Om/DQtZHaAZhxm/+Vo
 6SlxAE1Eh1r7QzMpTBtRu0dmy+n3JkE=
X-Google-Smtp-Source: ABdhPJxNa20GUlpj7nOq5z0bUgbfoyQR1jPE+jhdbMxWhsoQcvIUYdz3R15S0N02Q9UdZPCv02R6Fw==
X-Received: by 2002:a17:907:1c0c:: with SMTP id
 nc12mr45193874ejc.548.1634738569901; 
 Wed, 20 Oct 2021 07:02:49 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a4sm1287095edk.71.2021.10.20.07.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 07:02:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] multiboot: Use DMA instead port-based transfer
Date: Wed, 20 Oct 2021 16:02:41 +0200
Message-Id: <20211020140244.485249-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: adam@l4re.org, marcus.haehnel@kernkonzept.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An updated version of the patch at
https://patchew.org/QEMU/YWM6jboU9fUib6Iy@os.inf.tu-dresden.de/,
which includes the necessary glue for compatibility with older
machine types.  When fw_cfg DMA is disabled, the existing ROM
is used instead.

Marcus Hähnel (1):
  optionrom: add a DMA-enabled multiboot ROM

Paolo Bonzini (2):
  target/i386: move linuxboot_dma_enabled to X86MachineState
  target/i386: use DMA-enabled multiboot ROM for new-enough QEMU machine
    types

 hw/i386/microvm.c                 |   5 ++-
 hw/i386/multiboot.c               |  10 ++++-
 hw/i386/multiboot.h               |   4 +-
 hw/i386/pc.c                      |   8 ++--
 hw/i386/pc_piix.c                 |   3 +-
 hw/i386/pc_q35.c                  |   3 +-
 hw/i386/x86.c                     |   7 ++--
 include/hw/i386/pc.h              |   3 --
 include/hw/i386/x86.h             |   5 ++-
 pc-bios/meson.build               |   1 +
 pc-bios/multiboot_dma.bin         | Bin 0 -> 1024 bytes
 pc-bios/optionrom/Makefile        |   4 +-
 pc-bios/optionrom/multiboot.S     |   4 +-
 pc-bios/optionrom/multiboot_dma.S |   2 +
 pc-bios/optionrom/optionrom.h     |  66 ++++++++++++++++++++++++++++++
 15 files changed, 102 insertions(+), 23 deletions(-)
 create mode 100644 pc-bios/multiboot_dma.bin
 create mode 100644 pc-bios/optionrom/multiboot_dma.S

-- 
2.31.1


