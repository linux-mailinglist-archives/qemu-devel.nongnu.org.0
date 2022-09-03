Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883C05AC128
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:37:14 +0200 (CEST)
Received: from localhost ([::1]:42382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUYx7-0003VW-1v
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuU-0006GP-SE; Sat, 03 Sep 2022 15:34:30 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:44649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYuT-0005Kq-2I; Sat, 03 Sep 2022 15:34:30 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11eab59db71so12813260fac.11; 
 Sat, 03 Sep 2022 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Orkykpn7RMbPHkxs9LztAdxQfpx4vEIr4EIMNZe6kMU=;
 b=FPWBmomHgLCrEXlBsaxxLDS6lg02jQxinolx/GJPEHM6mx0NhKUT/6NiD0B7EpaL5J
 Kss6QyB0D+dae9F4GwAmx9LpXimxFRdKTkWE0WuayLabRPb6angDAihoJlCt1e/iG/x1
 mlY4p/DCBJl46RI0WllzCRROYHruToD5w9NCB8aP0nDnhqFsOqWJ0o8UDgiUs7lI354+
 8xpeOBq2WAmNvc7sC4UzhUvROfX61ot5R03+5zeEQzMtOCzAGLbTHauMMuIE9rCbHfkq
 7ZS8TUqQfux+3yNroCQmGuJjRAK50zx1yRZ46530GCZ0ATk/7MUW2/ZCwpFd2opYP/Ba
 p+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Orkykpn7RMbPHkxs9LztAdxQfpx4vEIr4EIMNZe6kMU=;
 b=Vsci9MR311J86IAYR3r36BK3QZNSkXZxxteUuPRW1WIY6AZyvTaKOwXRi6O16wJHB6
 kuxAOLto/ZYWo0ZDIc47TK8YEyEabykTfUl8leoor8pDy2ofE1ekVKtmZZqP+rYVTtlQ
 JiDUwCe9Stfv8YZdi1Q1eG268xP+0nWiP1W5o0O2By5/DgLmMlKc4iYIS4l9ZR8A8Mx2
 s9IwsVlfGYeAmoVRGEzGOjyDGfIiPp78hHR5NEge5y8pLCW1KWX9r+IH59FMAhfv1Y7X
 qIptN0wwTR5F+qaReLloi7jFvoyx33HN+B6fhuDk7x/d3EI1dnBgh2qPde/Ncbd6cOt3
 zxkA==
X-Gm-Message-State: ACgBeo0G7fuVVXLKuJOXSp+KlyWU4Ptw1VsJX7q4aaWKkYAhtiFtYQX/
 ZJNcX1LfbYwy+EuEXGrIb5dOzLrRMDXetg==
X-Google-Smtp-Source: AA6agR6mPmnvBmupQntxHiwAtT/LTDcBodly/nhJaaLeP8rz9fMZuo2z+nF+2BkB/1t0YjzLmf4ouw==
X-Received: by 2002:a05:6870:5702:b0:11e:dd17:d4b6 with SMTP id
 k2-20020a056870570200b0011edd17d4b6mr5189966oap.112.1662233666571; 
 Sat, 03 Sep 2022 12:34:26 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:34:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 00/14] QMP/HMP: introduce 'dumpdtb'
Date: Sat,  3 Sep 2022 16:34:06 -0300
Message-Id: <20220903193420.115986-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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

In this version I removed the 'info fdt' command. It didn't get enough
traction/acceptance to justify the amount of code to implement it.

Aside from that, all other changes are based on Markus' feedback on
patch 14.

Changes from v4:
- patches 15-21: removed
- patch 14:
  - dumpdtb is now dependent on 'if: CONFIG_FDT' in qapi/machine.json
  - dumpdtb is now dependent on 'if defined(CONFIG_FDT)' in hmp-commands.hx
  - moved qmp_dumpdtb() and hmp_dumpdtb() to device_tree.c
  - added a GError pointer to g_file_set_contents() to report errors caught
  - hmp_handle_error() is now called unconditionally
- v4 link: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg04115.html


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
 hw/ppc/pegasos2.c            |  7 +++++++
 hw/ppc/pnv.c                 |  8 +++++++-
 hw/ppc/ppc440_bamboo.c       | 11 ++++++++++-
 hw/ppc/sam460ex.c            |  5 ++++-
 hw/ppc/spapr.c               |  6 ++++++
 hw/ppc/spapr_hcall.c         |  8 ++++++++
 hw/ppc/virtex_ml507.c        | 11 ++++++++++-
 hw/riscv/sifive_u.c          |  6 ++++++
 hw/riscv/spike.c             |  9 +++++++++
 hw/xtensa/meson.build        |  2 +-
 hw/xtensa/xtfpga.c           |  9 ++++++++-
 include/sysemu/device_tree.h |  1 +
 monitor/misc.c               |  1 +
 qapi/machine.json            | 18 ++++++++++++++++++
 softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
 22 files changed, 172 insertions(+), 12 deletions(-)

-- 
2.37.2


