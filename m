Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE15AC821
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:38:31 +0200 (CEST)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzCA-0003wo-Q2
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz8s-0006fV-9u; Sun, 04 Sep 2022 19:35:06 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:41602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz8q-0004qZ-G4; Sun, 04 Sep 2022 19:35:06 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-12243fcaa67so18007217fac.8; 
 Sun, 04 Sep 2022 16:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=xWsYArDmHaPtKVtfPWMfJXrEbIaaa1l+vx94H/e4hqI=;
 b=enumopI/7E+ZM2oX4h9vY25zXSY+CKVF09kP7HfKJwAv9LRk7jTejfAZKHRJLQlPQf
 CpOD4MBDf2oH2X0PUBZWOfa7/jkSD/oE7GUvwSWtX9n+oG6tkdZQYiW7NyacZzpGtrhv
 9aw7KgVw+vqOVdZezUSEEbyYvokz9yv1basefi2rfY8ii1X6mnn3j/PFfABEybkq1ry1
 7BjbrogHMMbzF6LryH8xsHfiyyaxtDfWMWZhWCnIhsGIKHLv8sixXeT44B1qRnjD2x6A
 rj3AlUlDQdMtVxbTYnpbAdW+5vc+Ize3/1VbBbD5Hm6odjW3ptYyiEXeuQenGUzLmLZi
 TCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=xWsYArDmHaPtKVtfPWMfJXrEbIaaa1l+vx94H/e4hqI=;
 b=gcy5AXrRT1sHmMHjRp3jgLCex8HROrRWmMtfpxlx3apU7jOg5c4Mc0qECsIIe5yT0T
 c9Si4ozOs+C4hmQDxEcl0FagRjz8x9q9KYpJVkRO+xu2eHJVOX6mbSgMTCkdYyEJv2/D
 +3KuvfeIGAPfGorenvBlAhOGNGc16Gj2imUzUSmJZP0PpdvmNwmao8oNaAd7gZVtzBxZ
 uXsTqmG4pUWXfHD2FVS3GfxP33U8/EAhfOB+mp6E3fEQ7dt6tQp+ZAKEKrN2U4OLNS2w
 YvD630dQBkNHWUAoYwrssyZnuzeFjzKfBhSq0LYZ4CX+M+NZ5RwqAP/Vv/4SymrJvO2v
 Ej+Q==
X-Gm-Message-State: ACgBeo0fzLSzahRHle+Il3HjXLrd/vz73Fx2Hsj9iVuqAmk2bwfd0i/5
 2rCNooMKQxK8D8SZabAExYkaJJNzQylfow==
X-Google-Smtp-Source: AA6agR6w5JXgvhJ13YubwLQPBWRpT+fMs+7evbDlOdgEMfYa1WM/FI53P7uxpts4fblpz6PFXB9DWQ==
X-Received: by 2002:a05:6870:d0c9:b0:11e:8d58:33be with SMTP id
 k9-20020a056870d0c900b0011e8d5833bemr8005845oaa.294.1662334502062; 
 Sun, 04 Sep 2022 16:35:02 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v6 00/14] QMP/HMP: introduce 'dumpdtb'
Date: Sun,  4 Sep 2022 20:34:42 -0300
Message-Id: <20220904233456.209027-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version contains changes suggested by Zoltan in the v5 review.

Changes from v5:
- shortened the 'machine->fdt' comment in all relevant patches
- patch 6:
  - changed sam460ex_load_device_tree() to receive a MachineState
    pointer
- v5 link: https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00476.html

Daniel Henrique Barboza (14):
  hw/arm: do not free machine->fdt in arm_load_dtb()
  hw/microblaze: set machine->fdt in microblaze_load_dtb()
  hw/nios2: set machine->fdt in nios2_load_dtb()
  hw/ppc: set machine->fdt in ppce500_load_device_tree()
  hw/ppc: set machine->fdt in bamboo_load_device_tree()
  hw/ppc: set machine->fdt in sam460ex_load_device_tree()
  hw/ppc: set machine->fdt in xilinx_load_device_tree()
  hw/ppc: set machine->fdt in pegasos2_machine_reset()
  hw/ppc: set machine->fdt in pnv_reset()
  hw/ppc: set machine->fdt in spapr machine
  hw/riscv: set machine->fdt in sifive_u_machine_init()
  hw/riscv: set machine->fdt in spike_board_init()
  hw/xtensa: set machine->fdt in xtfpga_init()
  qmp/hmp, device_tree.c: introduce dumpdtb

 hmp-commands.hx              | 15 +++++++++++++++
 hw/arm/boot.c                |  3 ++-
 hw/microblaze/boot.c         |  8 +++++++-
 hw/microblaze/meson.build    |  2 +-
 hw/nios2/boot.c              |  8 +++++++-
 hw/nios2/meson.build         |  2 +-
 hw/ppc/e500.c                | 13 ++++++++++++-
 hw/ppc/pegasos2.c            |  4 ++++
 hw/ppc/pnv.c                 |  8 +++++++-
 hw/ppc/ppc440_bamboo.c       | 11 ++++++++++-
 hw/ppc/sam460ex.c            | 21 +++++++++++----------
 hw/ppc/spapr.c               |  3 +++
 hw/ppc/spapr_hcall.c         |  8 ++++++++
 hw/ppc/virtex_ml507.c        |  8 +++++++-
 hw/riscv/sifive_u.c          |  3 +++
 hw/riscv/spike.c             |  6 ++++++
 hw/xtensa/meson.build        |  2 +-
 hw/xtensa/xtfpga.c           |  6 +++++-
 include/sysemu/device_tree.h |  1 +
 monitor/misc.c               |  1 +
 qapi/machine.json            | 18 ++++++++++++++++++
 softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
 22 files changed, 161 insertions(+), 21 deletions(-)

-- 
2.37.2


