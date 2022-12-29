Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873965902B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 19:13:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAxNd-0006mO-OB; Thu, 29 Dec 2022 13:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNb-0006lf-U8
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 13:11:47 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAxNZ-0003WF-Ef
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 13:11:47 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 i26-20020a9d68da000000b00672301a1664so11873061oto.6
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GkPxuGqubo5gkcTC+CaHoKT5dFTep1pb+T85TAi9dGY=;
 b=DPqyRdRSEJZ/5yNNKFkhPzvlK0qZR3/kp72T7q8etRS/R1pURVukT68hh+34C27I/O
 JrXWNv4z15PZKaw5osmTPrBIIHN04H3ZmHGgPFIuqbAxSBkzAvLW6WStkxFkUkyPc/If
 qiv52YVWfMeHele2GAKJwGkvOpCbeDyhdbZaniI+NR7mkbII294XvmHWKso4a0PTJeBL
 2fVuWF90mmB3eBVRqlklD9E075Fy2mGAhARQ/iUVaHY+JG9d1lbsZuiXAU7dPQO5c5/K
 bTA0XcHA8AmQsrg/EMxZGOILFsqJlxfbMlSI+kfjnWHce6gyvSefSy+r4nuIeV3qvz+e
 UHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GkPxuGqubo5gkcTC+CaHoKT5dFTep1pb+T85TAi9dGY=;
 b=PjiNjPDk5lTQ3Uzpr55NMMOH0jH3cx2232exLu4hbJTe9H0Xmof3B+Jbq6fsBivPKv
 iagPGCW1v4Wh1gCDlJvBU7DOUlIxAAkENQov1YrR+L2U99Y5XDnX4md74Kxpup/Au07I
 DybpItHd2oIktZ/oHFix4G/C2TJ/bTpW8E+ykNrlWxRTPm378ow9GwLPvbtI+3yWWzHr
 /mMkzmwYGKrVXWBdk9ZUhUyJOLzxm60xz/6geXZvtT5/evXKql3cSZOSb5CkY3nn2tk1
 GGIR5DMXRPlrSjmvdrNxcztkD+aZ7Zv6vX3xp4w2a01QlOivujzyGeqrngvUqy/G3fY4
 CBPQ==
X-Gm-Message-State: AFqh2krRlwaQQYcocYtF9Z+Gvs7Vxfd1BecfuykDy35kUkFP6IEqziYk
 6uUM7fvc50Z0DGmrqy1JKZo9O8jqr+S1MyvP
X-Google-Smtp-Source: AMrXdXs1VLwH/n8kJA64sg2PJHgTlOdiVctQ3pAU+TVup1lKbEGvXnS0boqtskGZNMsU3xVrGvWAqA==
X-Received: by 2002:a9d:4501:0:b0:670:75fc:9a04 with SMTP id
 w1-20020a9d4501000000b0067075fc9a04mr14005094ote.13.1672337502526; 
 Thu, 29 Dec 2022 10:11:42 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 d20-20020a056830139400b0066db09fb1b5sm9267205otq.66.2022.12.29.10.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 10:11:42 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 00/11] riscv: OpenSBI boot test and cleanups
Date: Thu, 29 Dec 2022 15:11:24 -0300
Message-Id: <20221229181135.270661-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

This new version is still rebased on top of [1]:

"[PATCH 00/12] hw/riscv: Improve Spike HTIF emulation fidelity"

from Bin Meng.

In this version there's a new patch, patch 4, where we added a
g_assert() guard in both riscv_load_kernel() and riscv_load_initrd(), as
proposed by Alex in the v3 review.

There were also some aesthetic changes were made in patch 1 w.r.t the
order of the tests in the avocado file and fixing 'opensbi' and
'Opensbi' instances to 'OpenSBI'.

* Patch without reviews: 3

Changes from v3:
- patch 1:
  - fixed more instances of 'opensbi' and 'Opensbi' to 'OpenSBI'
  - changed tests order
- patch 4 (new):
  - added a g_assert(filename) guard in riscv_load_initrd() and
    riscv_load_kernel()
v3 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04491.html 

Changes from v2:
- patch 1:
  - reduced code repetition with a boot_opensbi() helper
  - renamed 'opensbi' to 'OpenSBI' in the file header
- patch 9:
  - renamed riscv_load_kernel() to riscv_load_kernel_and_initrd()
v2 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg04466.html


Changes from v1:
- patches were rebased with [1]
- patches 13-15: removed
  * will be re-sent in a follow-up series
- patches 4-5: removed since they're picked by Bin in [1]
- patch 1:
  - added a 'skip' riscv32 spike test
v1 link: https://mail.gnu.org/archive/html/qemu-devel/2022-12/msg03860.html


Based-on: <20221227064812.1903326-1-bmeng@tinylab.org>

Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>

[1] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159

Daniel Henrique Barboza (11):
  tests/avocado: add RISC-V OpenSBI boot test
  hw/riscv/spike: use 'fdt' from MachineState
  hw/riscv/sifive_u: use 'fdt' from MachineState
  hw/riscv/boot.c: exit early if filename is NULL in
    load_(kernel|initrd)
  hw/riscv/spike.c: load initrd right after riscv_load_kernel()
  hw/riscv: write initrd 'chosen' FDT inside riscv_load_initrd()
  hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()
  hw/riscv/boot.c: use MachineState in riscv_load_initrd()
  hw/riscv/boot.c: use MachineState in riscv_load_kernel()
  hw/riscv/boot.c: introduce riscv_load_kernel_and_initrd()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c                | 92 ++++++++++++++++++++++------------
 hw/riscv/microchip_pfsoc.c     | 20 +-------
 hw/riscv/opentitan.c           |  3 +-
 hw/riscv/sifive_e.c            |  4 +-
 hw/riscv/sifive_u.c            | 32 +++---------
 hw/riscv/spike.c               | 38 ++++----------
 hw/riscv/virt.c                | 21 +-------
 include/hw/riscv/boot.h        |  8 ++-
 include/hw/riscv/sifive_u.h    |  3 --
 include/hw/riscv/spike.h       |  2 -
 tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++
 11 files changed, 151 insertions(+), 137 deletions(-)
 create mode 100644 tests/avocado/riscv_opensbi.py

-- 
2.38.1


