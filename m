Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA059614E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:40:54 +0200 (CEST)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0Yf-0002Et-D8
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sa-0004dt-JM; Tue, 16 Aug 2022 13:34:37 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:34782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0SY-0002Ld-Qg; Tue, 16 Aug 2022 13:34:36 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id j2so10869338vsp.1;
 Tue, 16 Aug 2022 10:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=/oFNtKNdiiXcAkpaat4ZW/Ar6aUCBN/PoVf3yPR8PiU=;
 b=V5kN8hFYzdbpLLFRUoTwE6pssBzUkzFVwPLqrXCHs49QxBbLBU22RifsjYWG9H3ISG
 nvZ+KY/yXzaTK+pcUprZpiH6UrKTxlZrfYaAyEjKC1GV7lDHtjO7ekfHrmSgYEFWR7Jb
 BiM0TZUeh2fQ1LLAb+JZB8MctMDJK7I2SP3Q5iinNKEXI5yfj3G04G01xWrQgFeYSOhA
 5zadzvneIY3wqSlNgq2TeL5MKddATtlI03458RwX1lW40ClVFrkxragDUbfCYaDyjypd
 T9TvEqJlsuht9WwNQAMtakXYGfYMS/2QyT9kDyBtmSLXPy3WdsIejnHk0ZVkWZh+0iir
 2O/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=/oFNtKNdiiXcAkpaat4ZW/Ar6aUCBN/PoVf3yPR8PiU=;
 b=NEcVY9yJzE0xCCQsMP0iamROu9yWfN0E9K5Vxit9ANa4AesOB2OewRvNOT9fauK/BP
 EhhvOO0koX6stMlpxnLAI4ouR8dK72b7ww6ulyu8pWDjYONBpYXiw/IfdyY8+JLqnnBV
 Gpw5t834TBEP5OKCnZDyvscpnlioYkphDGzl71+nJe/40/jnwmXomCRKunIBROha1LA6
 BQM8FgYaxtHT25nr34GYa6zHwo8iKILXwy6Vcm4ny7CodX/NTDpV6mBalT5q3SGqzwww
 0oHd34zgzsrw8aV4iFVMWz+ufwRAZRIpnmS5KdVqH3dXa1RJeUWkW5zOn9WIrNbokZmW
 wSiw==
X-Gm-Message-State: ACgBeo33oZ1QwM+1VlHU4+C62LGMgY5JwkrFGQW1yOin98urSdKbH8FC
 gxy/wueOI97gStP7m2vxJk+CQpVkjHGb7w==
X-Google-Smtp-Source: AA6agR4hmVafy4YoaM/yqBzjdKLmR80Kkp3WMvWX0QBNpXFV+xeoLE35a5lJEd6pQwS8qEHion5QTg==
X-Received: by 2002:a67:b243:0:b0:38c:2d4e:78b4 with SMTP id
 s3-20020a67b243000000b0038c2d4e78b4mr2003133vsh.73.1660671273112; 
 Tue, 16 Aug 2022 10:34:33 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 00/20] QMP/HMP: add 'dumpdtb' and 'info fdt'
 commands
Date: Tue, 16 Aug 2022 14:34:08 -0300
Message-Id: <20220816173428.157304-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2d.google.com
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

In this new version the most notable changes are:

- removed fdt_pack() from machine specific code. As discussed in the previous
version, the proper use of fdt_pack() would require more work/thought and,
since it's not required for the work we're doing here, it was removed;

- we're now handling string arrays. The previous version was interpreting
all string properties as a single, plain string. We're now dealing with string
arrays instead;

- changed the output format to be more in line with the dts format.

Other small changes were made based on the feeback of the previous version.

Changes from v2:
- patches 1-8:
  - remove fdt_pack() to shrink the FDT before assigning it to ms->fdt
- patch 9:
  - call g_free(ms->fdt) to avoid leaking an old fdt during reset
- patch 10:
  - added a commit msg note about why we're not eliminating spapr->fdt_blob
for machine->fdt at this moment
- patches 11, 12:
  - remove fdt_pack() to shrink the FDT before assigning it to ms->fdt
  - added Alistair's r-b
- patch 13:
  - remove fdt_pack() to shrink the FDT before assigning it to ms->fdt
- patch 14:
  - added a commit msg note about BQL
- patch 15:
  - added a commit msg note about BQL
- patch 16:
  - renamed fdt_prop_is_string to fdt_prop_is_string_array. \0 characters
in the middle of the data array is now legal
  - added a new fdt_prop_format_string_array() to format the string array
  - added a semicolon at the end of the string array
- patch 17:
  - added semicolon at the end of properties
  - use %02x instead of %x to format vals in [] notation

- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00937.html


Daniel Henrique Barboza (20):
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
  qmp/hmp, device_tree.c: introduce 'info fdt' command
  device_tree.c: support string array prop in fdt_format_node()
  device_tree.c: support remaining FDT prop types
  device_node.c: enable 'info fdt' to print subnodes
  device_tree.c: add fdt_format_property() helper
  hmp, device_tree.c: add 'info fdt <property>' support

 hmp-commands-info.hx         |  14 +++
 hmp-commands.hx              |  13 +++
 hw/arm/boot.c                |   6 +-
 hw/microblaze/boot.c         |  11 +-
 hw/microblaze/meson.build    |   2 +-
 hw/nios2/boot.c              |  11 +-
 hw/nios2/meson.build         |   2 +-
 hw/ppc/e500.c                |  13 ++-
 hw/ppc/pegasos2.c            |   7 ++
 hw/ppc/pnv.c                 |   8 +-
 hw/ppc/ppc440_bamboo.c       |  11 +-
 hw/ppc/sam460ex.c            |   8 +-
 hw/ppc/spapr.c               |   6 +
 hw/ppc/spapr_hcall.c         |   8 ++
 hw/ppc/virtex_ml507.c        |  11 +-
 hw/riscv/sifive_u.c          |   6 +
 hw/riscv/spike.c             |   9 ++
 hw/xtensa/meson.build        |   2 +-
 hw/xtensa/xtfpga.c           |   9 +-
 include/monitor/hmp.h        |   2 +
 include/sysemu/device_tree.h |   7 ++
 monitor/hmp-cmds.c           |  28 +++++
 monitor/qmp-cmds.c           |  27 +++++
 qapi/machine.json            |  38 ++++++
 softmmu/device_tree.c        | 219 +++++++++++++++++++++++++++++++++++
 25 files changed, 466 insertions(+), 12 deletions(-)

-- 
2.37.2


