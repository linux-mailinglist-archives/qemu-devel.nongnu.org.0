Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01506BFC97
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:07:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcnH-0004xB-N5; Sat, 18 Mar 2023 16:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnG-0004wq-0H
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:04:46 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnE-0006qL-7w
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:04:45 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 m20-20020a9d6094000000b0069caf591747so4729325otj.2
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ncu5iwQkMkbpaLC68HQcWDBPz+hMPOKD2guRGXpoOg4=;
 b=AEclgwTawECKJc1cJ8uwm61I4HEVmuhqXm2kq7zmSMf4ofKnF34yt3HWZWv975nUU3
 scktEBLKBVM9UxMiZiuXhOfuMzkUl79PM/N1ycNXZz7rTJrKezG2qAUXsuwr/tJzaZ8A
 vbeFQSN4dVQL3VODxqBfdqloVaduDyH+pU6lME5juJFPUbePdG2yzeWEhGju7fO8WPsd
 zGPkDYHwfAfFAhkB5JlJZxuWjfmXI9q43yv3ReYrBXocGM8v0/6dCA/oYRE+iogzzAIn
 /uBaJNGYVUky4dWXKfHxvDuC35Kq2daPwCqvOjTZ2i9V6SXpU7RhfDl82BNJOnVDrh2d
 6hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169882;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ncu5iwQkMkbpaLC68HQcWDBPz+hMPOKD2guRGXpoOg4=;
 b=yxhQCwSMYcehAW/4d4nhc9pR7V1FBKOzLeTg0I4ls0DbvTQZQoStlSG+XUxHcSlvSR
 twqpoThCYtW2mYKc1fIwc3Gw0wMvqiJG0fe1EGoFGtd0eumGpFoOUk+x3wyifyogLQtM
 w6I1SYFlOdBOgw4wIngq71FqATjLi06mt2GT1YA93rvI4XJTWNcsuZC1T0MwylYm/Qm8
 Z/asrUsbNqQJyH9x0ujRxGis4V5vjmxywG+jiYCcJUv8AEPpHj5f/S26DWpP4l9a8azr
 y2GkfM1QKoWNbzHYUiXWhbMIHYoz+UktFISRY1gf3kjihUvQbwu/cAJJnY8Wk0dzgX8Y
 za0g==
X-Gm-Message-State: AO0yUKUATP69g7Rr1BOclQp+1YAcWF9l5DdiqqNqR6m/IuPzOiE2gL71
 izkgONMivRb+5da5zHeVAA/LzwHcHZbCC4UDq+c=
X-Google-Smtp-Source: AK7set86cGlpgp9drC5drEBVc9g1zdtDaywVbBUgrca+DhusA7WG7W2RninNaJkKCp9xlKNLJe4kXA==
X-Received: by 2002:a05:6830:1687:b0:699:45ab:52f7 with SMTP id
 k7-20020a056830168700b0069945ab52f7mr1674627otr.14.1679169882346; 
 Sat, 18 Mar 2023 13:04:42 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:04:41 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 00/26] target/riscv: rework CPU extensions
 validation
Date: Sat, 18 Mar 2023 17:04:10 -0300
Message-Id: <20230318200436.299464-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This new version contains changes suggested by Weiwei Li. I've also
reworked write_misa() to cover more cases. write_misa() is now able to
properly enable RVG, RVV and RVE.

A more in-depth description of what was attempted here can be found in
[1]. Note that the current validation flow already prevents certain misa
bits from being disabled (e.g. RVF) due to the presence of Z extensions
that are already enabled in the hart, so I decided not to add extra
logic to handle these cases.

Patches are rebased on top of Alistair's riscv-to-apply.next.

Changes from v2:
- patches removed:
  - patch 15 ('do not allow RVG in write_misa()')
  - patch 19 ('add misa_ext V-> D & F dependency')
- patch 15:
  - add zfinx dependency to enable RVG
- patch 19 (former patch 17):
  -  remove misa_ext* assignment from validate_set_extensions()
- patch 23 (former 25):
  - enable RVE in write_misa()
- new patch 25:
  - enable RVG in write_misa()
- new patch 26:
  - enable RVV in write_misa()
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04424.html

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg04674.html

Daniel Henrique Barboza (26):
  target/riscv/cpu.c: add riscv_cpu_validate_v()
  target/riscv/cpu.c: remove set_vext_version()
  target/riscv/cpu.c: remove set_priv_version()
  target/riscv: add PRIV_VERSION_LATEST
  target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
  target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
  target/riscv: move pmp and epmp validations to
    validate_set_extensions()
  target/riscv/cpu.c: validate extensions before riscv_timer_init()
  target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
  target/riscv/cpu.c: avoid set_misa() in validate_set_extensions()
  target/riscv/cpu.c: set cpu config in set_misa()
  target/riscv/cpu.c: redesign register_cpu_props()
  target/riscv: put env->misa_ext <-> cpu->cfg code into helpers
  target/riscv: add RVG
  target/riscv/cpu.c: split RVG code from validate_set_extensions()
  target/riscv/cpu.c: add riscv_cpu_validate_misa_ext()
  target/riscv: move riscv_cpu_validate_v() to validate_misa_ext()
  target/riscv: error out on priv failure for RVH
  target/riscv: write env->misa_ext* in register_generic_cpu_props()
  target/riscv: make validate_misa_ext() use a misa_ext val
  target/riscv: split riscv_cpu_validate_set_extensions()
  target/riscv: use misa_ext val in riscv_cpu_validate_extensions()
  target/riscv: rework write_misa()
  target/riscv: update cpu->cfg misa bits in commit_cpu_cfg()
  target/riscv: allow write_misa() to enable RVG
  target/riscv: allow write_misa() to enable RVV

 target/riscv/cpu.c | 691 +++++++++++++++++++++++++++++----------------
 target/riscv/cpu.h |  17 +-
 target/riscv/csr.c |  85 ++++--
 3 files changed, 522 insertions(+), 271 deletions(-)

-- 
2.39.2


