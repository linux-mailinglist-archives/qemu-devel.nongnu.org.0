Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E23165B183
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:53:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJN6-00076l-Fo; Mon, 02 Jan 2023 06:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJN4-00074e-62
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:52:50 -0500
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pCJN2-0002tq-C3
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:52:49 -0500
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1322d768ba7so33431533fac.5
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 03:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A7MfKIV6UJurYaYOAwW8AfZhVVvPn5Qy6LY3tqwPfbE=;
 b=U9dqzFRe86AVgLeiieuAY2fsjYbvsI0GYCdYtDhxbixQhDAl6wJRkkcZYg8vl8lD8s
 w+1RBY03kZf1K7utYWQOIiBVoJjqicuLR5zEAweIEoH7dy3xJ9zRxLck2HF4c0koHsQM
 Aienc9vebh+8nlQKTZNigb4ZhLMJVOlupUBn4d7kxCeZ9uUSlG0MbM4pbBh+XGe0rJEt
 vJgLMyLE4yk3WhOvykU+umzfUHqEG7oS8pD16nZGdQvhO28cXgp/3p78jvlO9QlC2zTW
 hQY/r9h7J1CnOxarouzSA6gZ/+cPjip+xx2BFVES2g4/fIdBVKn4xR+PQbnx506jiHru
 3daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A7MfKIV6UJurYaYOAwW8AfZhVVvPn5Qy6LY3tqwPfbE=;
 b=taYiNjwnb63/rgyFI4LDEoyHx0IDreyQTvZ7RGB4DrOAY+oUTRQHAhcNeFUu8xeFAP
 cqDNzLYkGk/gsLIMyHJ0uZTz1MH9U2Y2AVbGZjKNC3Cydei6hSN0Mx752z/lGezvquh7
 sP8FAeUp3H19xXKiO6f81eObKpfdcTz2xUO5lBOq7/2OV641Y2OTxiiAQq2ByPGAf7VP
 LKUeh60VokT1wTgbT/73IAvBGOtol/GGy5fb75nuiFf0uqStZ74BGsp8+veGzgS1B1KN
 baI95RZvwuxLsbWCP6SdlwQEEcompamrZrc1yc/167NpJuSC5xd4DvR+qLIvI0cDYocZ
 A4YQ==
X-Gm-Message-State: AFqh2kr3+MLUeAt1emSqqdKz4SZ76GCkOuI0L5ICfAU8gfR56BehI6un
 ITWQErOcWKxqHsXyuM0kLzOLqPunBmnV8bIV
X-Google-Smtp-Source: AMrXdXsxukA85VGjDG1DlsLz6tKrvhgvIZ/rLuzh5wmYMcJWDnkmtdJff08S72PDJ2uXshkzJv6vXg==
X-Received: by 2002:a05:6870:2104:b0:150:432e:e2a7 with SMTP id
 f4-20020a056870210400b00150432ee2a7mr10255861oae.55.1672660366606; 
 Mon, 02 Jan 2023 03:52:46 -0800 (PST)
Received: from grind.. ([191.17.222.139]) by smtp.gmail.com with ESMTPSA id
 l39-20020a05687106a700b0014fb4bdc746sm11354475oao.8.2023.01.02.03.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 03:52:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v5 00/11] riscv: OpenSBI boot test and cleanups
Date: Mon,  2 Jan 2023 08:52:30 -0300
Message-Id: <20230102115241.25733-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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

"[PATCH v2 00/12] hw/riscv: Improve Spike HTIF emulation fidelity"

from Bin Meng.

The change from v4 is on patch 9 where we added an extra flag in
riscv_load_kernel() to allow for boards that don't load initrd
(e.g. opentitan and sifive_e) to opt out from loading it altogether.

* Patch without reviews: 9

Changes from v4:
- patch 9:
  - added a 'load_init' flag in riscv_load_kernel() to control whether
    the function should execute riscv_load_initrd() or not
v4 link: https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg04652.html

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

[1] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334352

Daniel Henrique Barboza (11):
  tests/avocado: add RISC-V OpenSBI boot test
  hw/riscv/spike: use 'fdt' from MachineState
  hw/riscv/sifive_u: use 'fdt' from MachineState
  hw/riscv/boot.c: exit early if filename is NULL in load functions
  hw/riscv/spike.c: load initrd right after riscv_load_kernel()
  hw/riscv: write initrd 'chosen' FDT inside riscv_load_initrd()
  hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()
  hw/riscv/boot.c: use MachineState in riscv_load_initrd()
  hw/riscv/boot.c: use MachineState in riscv_load_kernel()
  hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
  hw/riscv/boot.c: make riscv_load_initrd() static

 hw/riscv/boot.c                | 91 +++++++++++++++++++++++-----------
 hw/riscv/microchip_pfsoc.c     | 20 +-------
 hw/riscv/opentitan.c           |  3 +-
 hw/riscv/sifive_e.c            |  4 +-
 hw/riscv/sifive_u.c            | 32 +++---------
 hw/riscv/spike.c               | 37 ++++----------
 hw/riscv/virt.c                | 21 +-------
 include/hw/riscv/boot.h        |  5 +-
 include/hw/riscv/sifive_u.h    |  3 --
 include/hw/riscv/spike.h       |  2 -
 tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++
 11 files changed, 150 insertions(+), 133 deletions(-)
 create mode 100644 tests/avocado/riscv_opensbi.py

-- 
2.39.0


