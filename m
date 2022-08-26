Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01A35A292B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:16:04 +0200 (CEST)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRa7v-0004nP-AU
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa40-0007Si-33; Fri, 26 Aug 2022 10:12:00 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:43958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa3y-0003ms-86; Fri, 26 Aug 2022 10:11:59 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 92-20020a9d0be5000000b0063946111607so1073697oth.10; 
 Fri, 26 Aug 2022 07:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=u8FLDH2c0JrCGjIRSRvxOqt6PpKw+6qo27WXNdikJa8=;
 b=cpX7p2uTfw31BHjGE4/O889u8ZHROY70XGSh/qdfFOecEsqY2lC2KBnLF86+XCdSbs
 cH2z/gBME7Z2Uz5Sn92ujQNxOE4RgnHCYSAEuVBoPBlVIMGJVbixsedqIQxHfGNWWnVl
 dhc/eLoT29Imu9rpF12MHzRkGdMbU3HbSqfnMDQCOueLXfNJt+efx/kjHI+SaArKor6J
 G+ATZ9SJa0aJ2nFcHeSimf5PylDt2eA/vAKXyb6o8qCDF3r0OAfx3QP4DdTbIAA5p/ei
 hKkAtuBbaOiixNAJK6eHMety4Mt7DUnod5TMeRvZeTQFyziRLiqLpRLPG2iKF/OGhfn4
 /cXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=u8FLDH2c0JrCGjIRSRvxOqt6PpKw+6qo27WXNdikJa8=;
 b=xCR/7AhBAx3XyMnVDx8gpjqen+VASXZKbg+/1Q2/hEKUPT7YQA2AjKJA2qOC2Z5LPq
 t3HdA0+WUb6BBMoO34YxseGd4eeDe1KXZcEnpNF1dOfQxXF/IsrbSjImBKoawT6GmejK
 ywqgZLRn/CVXQcISiS9BaNniXgwHbpCiCuz/eOaD6PD3n/VQW0XS2aHcYTWfA/LIblll
 2+Qavc56gak1HqAkbGUE/tgAlQB2Uv3DIiY+bpobzaK8bCq1V+X6eJFeIl7+5RvSDymP
 S0yY/MnkCC7Q1CafUYscZfO5t3gKnybgNJYynm8/7PT+gqRpFPUkD+x+UdrdUsZSanUJ
 CGhQ==
X-Gm-Message-State: ACgBeo2u3S7f+yRhNKAzBvIacBo9CfrhhuVLEYaDjFU6Hi7A5GQvwdNe
 +O4gVyDtMVn8OA7iOMvJ9sJB3fdCVYc=
X-Google-Smtp-Source: AA6agR5wBad1NwSVnFJ7eYxjJ3DGRsNoE+dvx+v5WvCpiv6S+DK8RuGrYP18DS78b07uQdU0IVzBtQ==
X-Received: by 2002:a05:6830:3696:b0:61c:af74:13d7 with SMTP id
 bk22-20020a056830369600b0061caf7413d7mr1478028otb.28.1661523116108; 
 Fri, 26 Aug 2022 07:11:56 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:11:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 00/21] QMP/HMP: add 'dumpdtb' and 'info fdt'
 commands
Date: Fri, 26 Aug 2022 11:11:29 -0300
Message-Id: <20220826141150.7201-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
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

In this new version we have changes based on review comments from v3.

I've also added a new patch (21) that adds an extra parameter called
'textformat' to the dumpdtb QMP command. Using this parameter will
write the FDT in text format, using DTS compatible formatting like
the 'info fdt' command is already using. This will allow users to
see the FDT contents in a text file without the need of decoding the
blob using 'dtc':

    (qemu) dumpdtb -t fdt.txt
    
    $ file fdt.txt
    fdt.txt: ASCII text, with very long lines (4746)
    
    $ grep -A 3 'persistent-memory' fdt.txt
        ibm,persistent-memory {
            device_type = "ibm,persistent-memory";
            #size-cells = <0x0>;
            #address-cells = <0x1>;
        };


Changes from v3:
- patch 10:
  - clarified in the commit message that, in the current code base, the
    spapr internal FDT won't always match what the guest is using 
- patch 14:
  - changed 'filename' to type F
  - use 'hmp_handle_error' instead of 'error_report_err'
- patch 15:
  - added a semi-colon at the end of each closing bracket
- patch 16:
  - added an extra space after each individual string in the string
    array
- patch 20:
  - fixed commit msg with the actual output of 'info fdt'
- patch 21 (NEW):
  - added a '-t' parameter to 'dumpdtb' to create a FDT file in plain
    text format, using the same formatting we already implemented with
    'info fdt'
- v3 link:
  https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02419.html 

Daniel Henrique Barboza (21):
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
  qmp/hmp, device_tree.c: add textformat dumpdtb option

 hmp-commands-info.hx         |  14 +++
 hmp-commands.hx              |  14 +++
 hw/arm/boot.c                |   6 +-
 hw/microblaze/boot.c         |  11 +-
 hw/microblaze/meson.build    |   2 +-
 hw/nios2/boot.c              |  11 +-
 hw/nios2/meson.build         |   2 +-
 hw/ppc/e500.c                |  13 +-
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
 include/sysemu/device_tree.h |   8 ++
 monitor/hmp-cmds.c           |  29 +++++
 monitor/qmp-cmds.c           |  29 +++++
 qapi/machine.json            |  38 ++++++
 softmmu/device_tree.c        | 238 +++++++++++++++++++++++++++++++++++
 25 files changed, 490 insertions(+), 12 deletions(-)

-- 
2.37.2


