Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCA958A904
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:49:17 +0200 (CEST)
Received: from localhost ([::1]:48048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtxF-0002ga-1T
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoR-0007XX-No
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:14 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:34605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoB-0001Qb-PZ
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:40:11 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id j2so1951648vsp.1
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=QB/5qmGWS4u0i7sC1ex+BKonx3yOH474dHRANyJ0+4Q=;
 b=JpRru5Kqo6nIyzNN19SApd80jZ6GAROKhOEzvGUjNv2oP6XA2ehWCMS23p9zKVIZAn
 310rNNhTvkA0ieVxexxeNzTMiUicNn0ILJnZGdywX37qSnx38jO9i2B8hYB0/SmbeZWb
 vRzPMwIR5ZvxzUZY+kMFml6JZjJljf0kMUGIJdlsGMZarNnIjfe3d7qkMMKx0n9Ngpyo
 eWOGx1LNYPnxzQmprRwnmZbxwThYrdTfm4oAxUYQ4btKDaCUFdSl4VyONuyaJHNK75g8
 f7kD+cWNWycNLDf62hqRkti1bS/j9nyiJqVOgA7nvAbGE3h3WUapvpTkxbmzZ0QLgcLv
 qpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=QB/5qmGWS4u0i7sC1ex+BKonx3yOH474dHRANyJ0+4Q=;
 b=3taCGQhnpQn4dGfvE3OfrvaQx+dBMgUeeNSkwmUXXGqrEQLLczp8+aIcO5Fpzv917x
 pIG0Oyby3t4dl8v01QsGb4trX7XH7HnoHnXHkz/Gk4xpdC8mOmXT7QCQjIrQqBJMwy/F
 SIP1kCOc1Urrmg74u2yRHHV8aWosz3nvSHUNrDOoD4NcNFwJ3vNqGGMw1K/pwsmb4z3L
 JCrm6XY2GZFl9c/qtjYrVjTUzYqoIILmmQFkLSFEMgX9yohEuKb5MKf5PAIJlfbbNFJz
 h340SdA8s9n1+/hUmv2hhzxRpTsuxYnBf5HDm0B+0rTfZiy2QqFcN8wmvFwkCNBYPyMr
 WiLw==
X-Gm-Message-State: ACgBeo2XbKaCXJq+5HwLOs8TT9Wii3OIojfD9V23S28x6XYWMBNfI/3d
 VWPEiFdMOue3m6djNjM2UHBzIIvz0Xg=
X-Google-Smtp-Source: AA6agR51+pldTU6gr6zYmTY999Fb1xRvG73C8hdPnl45yTwwrZgKI+G9+cBKzwedSpBwO36Z/8OY0w==
X-Received: by 2002:a67:ba03:0:b0:385:b608:300d with SMTP id
 l3-20020a67ba03000000b00385b608300dmr2559024vsn.33.1659692393059; 
 Fri, 05 Aug 2022 02:39:53 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:39:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v2 00/20] QMP/HMP: add 'dumpdtb' and 'info fdt'
 commands
Date: Fri,  5 Aug 2022 06:39:28 -0300
Message-Id: <20220805093948.82561-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This second version implements the review comments/suggestion made in
the v1 review [1].

First 13 patches are adaptations (basically set machine->fdt) I made in
several machines to enable them to work with these commands. Patches
14-20 have the actual QMP/HMP/device_tree implementation. A plan for the
machine patches would be to get an ack from the machine owners and push
them with the QMP/HMP patches. Pick the machine patches in their own
trees and push it separately also works. Or, or course, NACK the machine
changes if I somewhat messed up. Either way, patches 14-20 are
independent from the individual machine changes.

Notable cases where I chose not to change the machine code:

- hw/rx/rx-gdbsim: I didn't see the point of enabling this command in
the GDB simulator. Can be done if required;

- hw/mips/boston: the FDT is handled as a const void* pointer inside
boston_mach_init(), as result of the return type of boston_fdt_filter()
return the 'const' modifier in the FDT. I left it alone because the
required change would be to either cast the const pointer as
non-constant in machine->fdt or change boston_fdt_filter() to not return
a const pointer. Can also be done but it requires a little more thought
(unless we're ok with a "void *" cast).

Other notable changes from v1:

- 'save-fdt' was renamed as 'dumpdtb'´;

- Both commands were changed to have a base QMP implementation that does
all the work, with the HMP support calling the QMP logic behind the
scenes.  'dumpdtb' is implemented as qmp_dumpdtb(), 'info fdt' is
implemented as x-query-fdt(). I didn't mark 'dumpdtb' as unstable
because we're doing the same thing as -machine dumpdtb does for awhile.
'info fdt' is more of a debug tool than something that we expect regular
users to consume;

- 'info fdt' is now receiving a second 'propname' argument to support
printing properties, as suggested by David Gilbert;

- the QMP/HMP implementations are now gated with "ifdef CONFIG_FDT" to
allow for successful build in systems that do not have libfdt support.

All other code changes made are consequences of the changes mentioned above.

Changes from v1:
- all patches that set machine->fdt:
  - updated comments to explain why we're setting machine->fdt
- patches 2-6, 8, 10-12: new
  - set machine->fdt for most of the machines that uses the FDT via
load_device_tree()
- patch 14 (former 4):
  - renamed 'fdt-save' command to 'dumpdtb'
  - added QMP counterpart 'qmp_dumpdtb'
- patch 15 (former 5):
  - added QMP counterpart 'x-query-fdt' of 'info fdt'
- patch 20 (former 10):
  - added the 'propname' parameter to support parameters instead of parsing
the fullpath of the parameter
  - helper fdt_find_property() was removed. The logic is short enough to
be open coded in qmp_x_query_fdt()
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg04119.html
  
[1] https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg04119.html

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
  device_tree.c: support string props in fdt_format_node()
  device_tree.c: support remaining FDT prop types
  device_node.c: enable 'info fdt' to print subnodes
  device_tree.c: add fdt_format_property() helper
  hmp, device_tree.c: add 'info fdt <property>' support

 hmp-commands-info.hx         |  14 +++
 hmp-commands.hx              |  13 +++
 hw/arm/boot.c                |   8 +-
 hw/microblaze/boot.c         |  13 ++-
 hw/microblaze/meson.build    |   2 +-
 hw/nios2/boot.c              |  13 ++-
 hw/nios2/meson.build         |   2 +-
 hw/ppc/e500.c                |  15 ++-
 hw/ppc/pegasos2.c            |   9 ++
 hw/ppc/pnv.c                 |   6 +-
 hw/ppc/ppc440_bamboo.c       |  13 ++-
 hw/ppc/sam460ex.c            |  10 +-
 hw/ppc/spapr.c               |   6 ++
 hw/ppc/spapr_hcall.c         |   8 ++
 hw/ppc/virtex_ml507.c        |  13 ++-
 hw/riscv/sifive_u.c          |   8 ++
 hw/riscv/spike.c             |  11 +++
 hw/xtensa/meson.build        |   2 +-
 hw/xtensa/xtfpga.c           |  11 ++-
 include/monitor/hmp.h        |   2 +
 include/sysemu/device_tree.h |   7 ++
 monitor/hmp-cmds.c           |  28 ++++++
 monitor/qmp-cmds.c           |  27 ++++++
 qapi/machine.json            |  38 ++++++++
 softmmu/device_tree.c        | 181 +++++++++++++++++++++++++++++++++++
 25 files changed, 448 insertions(+), 12 deletions(-)

-- 
2.36.1


