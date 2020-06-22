Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBCB202FC8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 08:36:17 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnG40-0008N9-Ph
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 02:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jnG1R-0006R9-6v; Mon, 22 Jun 2020 02:33:37 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jnG1P-0007u1-Ha; Mon, 22 Jun 2020 02:33:36 -0400
Received: by mail-wr1-x441.google.com with SMTP id z13so3624694wrw.5;
 Sun, 21 Jun 2020 23:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dGGddd8XMjE/mRc8huN4p5tMSlKo19awy1ee6h65k6Y=;
 b=gKMm217GKPwPpiCaC+x53jM+csQRZ/vVK0bY+U4Cb2wvojJOL5tT4pnzErxb4YQxw+
 71DMj0fkCWHwNR0KHYM5REMF6uVI9+eDgZJARC3oH0Qd6EJeiUJpnF1Dfod/Wxh+spY8
 XWqo6LYwVXxyAzhDc7ctmGuGfG3s6GxrE1goZznlka4xgvZjWq7R72BbQLd3DV5rmKMt
 aDqXouGx3EBxk7roleDywgqhPy+cVzWfSOMdPtBh6NNd8ZLaNXzRmJIEwwnBfNQWaFv0
 qbvlle0TcRKnAvvlqO4vG2JaLndpMfSqPpWgrBiWI0obxXMdg2mYQ+vcyqSiTNCxLWqZ
 8wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dGGddd8XMjE/mRc8huN4p5tMSlKo19awy1ee6h65k6Y=;
 b=S0HBvy6+lvkEwck1SMyM97T3iptnZvT6xHJJ6uzZr1JHSvBsgxdNoVwr78y4+Mj4js
 L9K9ULj1juDEFSW2pSqrJ82dMHIj5B6hl/BjvSBr2vX2nIvFJzXGQK5H38ZGre1XA3qo
 v9Vw/uuwHFBgsQ83lUrY8NbuXIT0jQwtTB31uNJnlSZ/176ofwxOvlE0J+syhbbOQ+IK
 vhOhKnpuzdBk5x2y7kvwsrPa5sHJxnExmrVcWueHWRmirJDoBS081hrVKg3yRCwtbVTd
 t3qL8fUPqn7Xk+zUkJmQVgDDMp836YOGzxL9WaPDcc0Mc0n57KL95so2oqcvNWXilSe4
 KcVw==
X-Gm-Message-State: AOAM532W6hbCM8B4H1ZfRJE7Ea/qbR07NUD1K1Kk5agwIW83AcRrHSQh
 Tjc1YQ3CgqerpcCiUqZjaR8=
X-Google-Smtp-Source: ABdhPJxdR34+94oVPZUUOvpzHZyQtDgsO6X9ik9s9cXcw/86v/xCkxF8/y3N/4cixurv8luvsfUHDw==
X-Received: by 2002:adf:e4ce:: with SMTP id v14mr17962639wrm.64.1592807613588; 
 Sun, 21 Jun 2020 23:33:33 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id a10sm16684240wrm.21.2020.06.21.23.33.31
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 21 Jun 2020 23:33:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 0/7] riscv: Switch to use generic platform of opensbi bios
 images
Date: Sun, 21 Jun 2020 23:33:17 -0700
Message-Id: <1592807604-20805-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=bmeng.cn@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The RISC-V generic platform is a flattened device tree (FDT) based
platform where all platform specific functionality is provided based
on FDT passed by previous booting stage. The support was added in
the upstream OpenSBI v0.8 release recently.

This series updates QEMU to switch to use generic platform of opensbi
bios images.

The patch emails do not contain binary bits, please grab all updates
at https://github.com/lbmeng/qemu.git bios branch.

Changes in v2:
- new patch: configure: Create symbolic links for pc-bios/*.elf files
- Upgrade OpenSBI to v0.8 release
- Copy the ELF images too in the make rules
- Include ELF images in the artifacts
- new patch: Makefile: Ship the generic platform bios images for RISC-V

Bin Meng (7):
  configure: Create symbolic links for pc-bios/*.elf files
  roms/opensbi: Upgrade from v0.7 to v0.8
  roms/Makefile: Build the generic platform for RISC-V OpenSBI firmware
  hw/riscv: Use pre-built bios image of generic platform for virt &
    sifive_u
  hw/riscv: spike: Change the default bios to use generic platform image
  gitlab-ci/opensbi: Update GitLab CI to build generic platform
  Makefile: Ship the generic platform bios images for RISC-V

 .gitlab-ci.d/opensbi.yml                     |  28 +++++++++--------------
 Makefile                                     |   4 ++--
 configure                                    |   1 +
 hw/riscv/sifive_u.c                          |   4 ++--
 hw/riscv/spike.c                             |   9 ++++++--
 hw/riscv/virt.c                              |   4 ++--
 pc-bios/opensbi-riscv32-generic-fw_jump.bin  | Bin 0 -> 58048 bytes
 pc-bios/opensbi-riscv32-generic-fw_jump.elf  | Bin 0 -> 554156 bytes
 pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin | Bin 49520 -> 0 bytes
 pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 49504 -> 0 bytes
 pc-bios/opensbi-riscv64-generic-fw_jump.bin  | Bin 0 -> 70792 bytes
 pc-bios/opensbi-riscv64-generic-fw_jump.elf  | Bin 0 -> 619960 bytes
 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 57936 -> 0 bytes
 pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 57920 -> 0 bytes
 roms/Makefile                                |  32 +++++++++------------------
 roms/opensbi                                 |   2 +-
 16 files changed, 35 insertions(+), 49 deletions(-)
 create mode 100644 pc-bios/opensbi-riscv32-generic-fw_jump.bin
 create mode 100644 pc-bios/opensbi-riscv32-generic-fw_jump.elf
 delete mode 100644 pc-bios/opensbi-riscv32-sifive_u-fw_jump.bin
 delete mode 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
 create mode 100644 pc-bios/opensbi-riscv64-generic-fw_jump.bin
 create mode 100644 pc-bios/opensbi-riscv64-generic-fw_jump.elf
 delete mode 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
 delete mode 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin

-- 
2.7.4


