Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F91A657699
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 13:44:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAVm4-00059U-MI; Wed, 28 Dec 2022 07:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVlo-00057r-OZ
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:42:58 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pAVlm-0007f7-8b
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:42:55 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 i26-20020a9d68da000000b00672301a1664so9788537oto.6
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 04:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WMy08FaZTs+K5MtyubSAO77LRTPhzUaXpfVFuFCVOvI=;
 b=PDQkKfvG27LbXkKGOKPu7wGEmJW6MR7pEqFQdVnajIpuPVyzr8s5xqo5HE+p0GAwkZ
 iq5i11Jqy0GNQA8qPADos0tWYs3pl2ikEFcd9Tjbka0lbc1/YxM1XNkFc0erBZP2r/C9
 p/hdyu4gct8nDTdiH58kEnR704NFFI0onyTsBT9gP9hdFmY7tm7kenL6m3ppR8qDt7N4
 ylavXAaKFrV0YA45TbNHcFbdlRehBA3qxpAslkJrEX4qW+3Nrta/PNaFL6Zy7yGohId8
 y18gP25GVZrkbx9sVp+QzsIiaoOQoDVHQZeUs19J4zhVZKSzHxhKKsJIw5UchyXVk8YW
 z8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WMy08FaZTs+K5MtyubSAO77LRTPhzUaXpfVFuFCVOvI=;
 b=7YKfnXzTICizv9ckOwvBIFRNXwmEECci9PX+hzuTjheWcJ8xOnC53Fmjo/frR9BGtB
 bQlFpDy5UELAAB1uoxdewGh+ukVdx19laiOpof+py812yWPx5YjQTgAi+nCqVVnT8Jf7
 QVWx3WTRFvzHUY/zU8bgUNxs9VT0yrPAZWXRpwXBruigHGgPlnVtRghObRwsi1cVzq2N
 8smlhIyImxPFi+UAmyZB3f90XGMl5r2veCO7djIZgk5aQMU4IkICunXbl1/d6QUhCIcj
 vxzSjEEeIF2FNfirDQnS2AYbPOV/tEOt8/bV431EUJevrdFsY4zbqYv0TAjbIHSGJDYp
 3LPg==
X-Gm-Message-State: AFqh2kq0ucXoPHvY8pXBenEozIAer4VSYuI5nIDSehHOwvTHDuVq94Di
 3cpYIrGPNUsLMyxzCVPKvFSBji0T2ybeyZY0
X-Google-Smtp-Source: AMrXdXvT8JS+gEZFs11lYumT17XnhqCxTdhWnPpN32xECSQPB7mFr33aTK+iG6QKEDOVpDPN/UqcUQ==
X-Received: by 2002:a9d:7397:0:b0:661:dfeb:ea4b with SMTP id
 j23-20020a9d7397000000b00661dfebea4bmr13446949otk.10.1672231372026; 
 Wed, 28 Dec 2022 04:42:52 -0800 (PST)
Received: from fedora.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 cj5-20020a056830640500b0066f09567827sm7689333otb.78.2022.12.28.04.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:42:51 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 00/10] riscv: opensbi boot test and cleanups
Date: Wed, 28 Dec 2022 09:42:32 -0300
Message-Id: <20221228124242.184784-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x332.google.com
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

In this new version I rebased the patches on top of

"[PATCH 00/12] hw/riscv: Improve Spike HTIF emulation fidelity"

from Bin Meng. Patches 4 and 5 from v1 got removed since Bin picked
them in the HTIF changes.

I also removed patches 13, 14 and 15 because I have another cleanup
already planned for the create_fdt() functions and these 3 patches are
more suitable there.

The actual change made from v1 was on patch 1, where I added a riscv32
spike test that is being skipped. The idea is that the skipped test will
be a reminder that we already have a spike riscv32 test that can be
reenabled as soon as the Opensib ROM has the appropriate fix:

 (11/18) tests/avocado/riscv_opensbi.py:RiscvOpensbi.test_riscv32_spike: SKIP: requires OpenSBI fix to work


Patch without reviews: 1

Changes from v1:
- patches were rebased with [1]
- patches 13-15: removed
  * will be re-sent in a follow-up series
- patches 4-5: removed since they're picked by Bin in [1]
- patch 1:
  - added a 'skip' riscv32 spike test


Based-on: <20221227064812.1903326-1-bmeng@tinylab.org>

[1] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159


Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>

Daniel Henrique Barboza (10):
  tests/avocado: add RISC-V opensbi boot test
  hw/riscv/spike: use 'fdt' from MachineState
  hw/riscv/sifive_u: use 'fdt' from MachineState
  hw/riscv/spike.c: load initrd right after riscv_load_kernel()
  hw/riscv: write initrd 'chosen' FDT inside riscv_load_initrd()
  hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()
  hw/riscv/boot.c: use MachineState in riscv_load_initrd()
  hw/riscv/boot.c: use MachineState in riscv_load_kernel()
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c                | 84 ++++++++++++++++++++++------------
 hw/riscv/microchip_pfsoc.c     | 19 +-------
 hw/riscv/opentitan.c           |  3 +-
 hw/riscv/sifive_e.c            |  3 +-
 hw/riscv/sifive_u.c            | 31 ++-----------
 hw/riscv/spike.c               | 35 ++++----------
 hw/riscv/virt.c                | 20 +-------
 include/hw/riscv/boot.h        |  4 +-
 include/hw/riscv/sifive_u.h    |  3 --
 include/hw/riscv/spike.h       |  2 -
 tests/avocado/riscv_opensbi.py | 77 +++++++++++++++++++++++++++++++
 11 files changed, 149 insertions(+), 132 deletions(-)
 create mode 100644 tests/avocado/riscv_opensbi.py

-- 
2.38.1


