Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950EB416F3C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:41:56 +0200 (CEST)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThiM-0005Xz-Gf
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfR-0002Z4-OI
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:38:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfP-0005oV-Lu
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:38:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u18so25539227wrg.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JvnpVVImzxRUAkiErIl1yb3T+bTJx0akVuGOL1sDX9w=;
 b=CDMFFMmokn3JqF0zJlToOGb4JpeYq0klq2nsClc4Lj1G+AaTPuSLHxedxXJ/u1oeHY
 ftJVVeHs1nMkG08DlUYBDFtpv+Psri8jmDr6sBoE8SoxGKzTMpw0OLEp5IASYzNzJr8R
 LeUbj29qp7F3Vw5PEmcDcQxpDju6z3joLtNnkm0p6vmOvGF81/JgmdHpoi3PU3kBQ+42
 eqOpSbaYkQai/sAf0VBev0lXBZZpGxQgzX+yBeG8JZM9f+XSUqInOl7IN+Qlr5E5xC8r
 ZdhGr0XAgjzDQ64JsviX7JZgloy59795uBqzEvVy19VFlSTer7vRysr7FMe2SH0/j2dK
 AgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JvnpVVImzxRUAkiErIl1yb3T+bTJx0akVuGOL1sDX9w=;
 b=u7bIs0At6R8j2l43Bxt5ahQFwVnpIOPNrsB7wv+b3TzFJi4sUeEy4Q//xFsesi4BpM
 5mcwVDRAp1fOcCdec5mpYFTY8XDPdO+W/gRLuLXN/xUjD9vwdB4dBwmT33kojx50cmBD
 CE1hcPONdb/rGNt3k4QMpTxbCbenDdVZPRMq7qg7ULIDU5v/Htiy6nyhVuE/LWO+ikm+
 8C2fLwOveKPFeZ25uhzZI0l0zs+7hs/UYPhsSxhqz+ffWZrAZFbBD3kJx1Ls4O4RW4jK
 DTxZeUVS4N33B2pW6rM0XK/KSZrh6B72YED0ggNZC5ahvj9SR2gjMfc1Vz5Ukru2+2xy
 k3Eg==
X-Gm-Message-State: AOAM531LQXu0e1LxfsIt4ItxXut9IW1nCITySYqIJlxIe1Dy5D7gKrBb
 IvkZu+dE6/GMN4VLXdhsGstTCiWyPlM=
X-Google-Smtp-Source: ABdhPJxc0qFvwz/qYGStyEUpsltUOXTyRyHnRfoHUhqa0oEtEjEkILszU8wDy4yLxZtKeKDEumRG1w==
X-Received: by 2002:a7b:cd8a:: with SMTP id y10mr1004214wmj.73.1632476329387; 
 Fri, 24 Sep 2021 02:38:49 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 g22sm10888276wmp.39.2021.09.24.02.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:38:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/40] accel: Move has_work() from CPUClass to AccelOpsClass
Date: Fri, 24 Sep 2021 11:38:07 +0200
Message-Id: <20210924093847.1014331-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
CPU has_work() is a per-accelerator handler. This series is organized=0D
in 2 parts:=0D
- Patches 1-15: Move has_work() from CPUClass to AccelOpsClass=0D
- Patches 16-40: Move remainging has_work() to TCGCPUOps=0D
=0D
I prefer to send as a single big series to be sure it is merged=0D
at once, since the 2nd part logic (TCGCPUOps) is related to the=0D
end of the first part (we proved remaining CPUClass::has_work=0D
handlers are TCG specific, thus can be moved to TCGCPUOps).=0D
=0D
Missing review:=0D
0001-accel-Simplify-qemu_init_vcpu.patch=0D
0005-hw-core-Move-cpu_common_has_work-to-cpu_has_work.patch=0D
0006-accel-Introduce-AccelOpsClass-has_work.patch=0D
0009-accel-hvf-Implement-AccelOpsClass-has_work.patch=0D
0010-accel-xen-Implement-AccelOpsClass-has_work.patch=0D
0011-accel-hax-Implement-AccelOpsClass-has_work.patch=0D
0012-accel-nvmm-Implement-AccelOpsClass-has_work.patch=0D
0013-accel-qtest-Implement-AccelOpsClass-has_work.patch=0D
0014-accel-tcg-Implement-AccelOpsClass-has_work.patch=0D
0015-accel-Simplify-cpu_has_work.patch=0D
0016-accel-tcg-Introduce-TCGCPUOps-has_work.patch=0D
0017-target-arm-Explicit-v7M-cores-use-arm_cpu_has_work-a.patch=0D
0018-target-arm-Restrict-has_work-handler-to-sysemu-and-T.patch=0D
0039-accel-tcg-Remove-CPUClass-has_work.patch=0D
0040-accel-tcg-Simplify-tcg_cpu_has_work.patch=0D
=0D
Since v5:=0D
- Rework ARM v7M case (pm215)=0D
- Reorder patch logic (rth)=0D
=0D
Since v4:=0D
- Implement arm_v7m_cpu_has_work() (new patch)=0D
- Assert has_work() handlers are set, don't use default value=0D
- Fix ARM v7M and cris CPUs=0D
- Reset R-b tags on modified patches=0D
=0D
Since v3:=0D
- Remove pointless CONFIG_TCG uses (rth)=0D
- Rework PPC patches, still using indirection=0D
=0D
Since v2:=0D
- Full rewrite, no more RFC.=0D
=0D
Supersedes: <20210920214447.2998623-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (40):=0D
  accel: Simplify qemu_init_vcpu()=0D
  accel/tcg: Restrict cpu_handle_halt() to sysemu=0D
  hw/core: Restrict cpu_has_work() to sysemu=0D
  hw/core: Un-inline cpu_has_work()=0D
  hw/core: Move cpu_common_has_work() to cpu_has_work()=0D
  accel: Introduce AccelOpsClass::has_work()=0D
  accel/kvm: Implement AccelOpsClass::has_work()=0D
  accel/whpx: Implement AccelOpsClass::has_work()=0D
  accel/hvf: Implement AccelOpsClass::has_work()=0D
  accel/xen: Implement AccelOpsClass::has_work()=0D
  accel/hax: Implement AccelOpsClass::has_work()=0D
  accel/nvmm: Implement AccelOpsClass::has_work()=0D
  accel/qtest: Implement AccelOpsClass::has_work()=0D
  accel/tcg: Implement AccelOpsClass::has_work()=0D
  accel: Simplify cpu_has_work()=0D
  accel/tcg: Introduce TCGCPUOps::has_work()=0D
  target/arm: Explicit v7M cores use arm_cpu_has_work as=0D
    CPUClass:has_work=0D
  target/arm: Restrict has_work() handler to sysemu and TCG=0D
  target/avr: Restrict has_work() handler to sysemu=0D
  target/cris: Restrict has_work() handler to sysemu=0D
  target/hexagon: Remove unused has_work() handler=0D
  target/hppa: Restrict has_work() handler to sysemu=0D
  target/i386: Restrict has_work() handler to sysemu and TCG=0D
  target/m68k: Restrict has_work() handler to sysemu=0D
  target/microblaze: Restrict has_work() handler to sysemu=0D
  target/mips: Restrict has_work() handler to sysemu and TCG=0D
  target/nios2: Restrict has_work() handler to sysemu=0D
  target/openrisc: Restrict has_work() handler to sysemu=0D
  target/ppc: Introduce PowerPCCPUClass::has_work()=0D
  target/ppc: Restrict has_work() handlers to sysemu and TCG=0D
  target/riscv: Restrict has_work() handler to sysemu and TCG=0D
  target/rx: Restrict has_work() handler to sysemu=0D
  target/s390x: Restrict has_work() handler to sysemu and TCG=0D
  target/sh4: Restrict has_work() handler to sysemu=0D
  target/sparc: Remove pointless use of CONFIG_TCG definition=0D
  target/sparc: Restrict has_work() handler to sysemu=0D
  target/tricore: Restrict has_work() handler to sysemu=0D
  target/xtensa: Restrict has_work() handler to sysemu=0D
  accel/tcg: Remove CPUClass::has_work()=0D
  accel/tcg: Simplify tcg_cpu_has_work()=0D
=0D
 include/hw/core/cpu.h             | 28 +++++++++--------------=0D
 include/hw/core/tcg-cpu-ops.h     |  4 ++++=0D
 include/sysemu/accel-ops.h        |  5 +++++=0D
 target/arm/internals.h            |  4 ++++=0D
 target/ppc/cpu-qom.h              |  3 +++=0D
 accel/hvf/hvf-accel-ops.c         |  6 +++++=0D
 accel/kvm/kvm-accel-ops.c         |  6 +++++=0D
 accel/qtest/qtest.c               |  6 +++++=0D
 accel/tcg/cpu-exec.c              | 10 +++++++--=0D
 accel/tcg/tcg-accel-ops.c         |  9 ++++++++=0D
 accel/xen/xen-all.c               |  6 +++++=0D
 hw/core/cpu-common.c              |  6 -----=0D
 softmmu/cpus.c                    | 17 +++++++++-----=0D
 target/arm/cpu.c                  |  9 +++++---=0D
 target/arm/cpu_tcg.c              |  1 +=0D
 target/avr/cpu.c                  |  2 +-=0D
 target/cris/cpu.c                 |  5 ++++-=0D
 target/hexagon/cpu.c              |  6 -----=0D
 target/hppa/cpu.c                 |  4 +++-=0D
 target/i386/cpu.c                 |  6 -----=0D
 target/i386/hax/hax-accel-ops.c   |  6 +++++=0D
 target/i386/nvmm/nvmm-accel-ops.c |  6 +++++=0D
 target/i386/tcg/tcg-cpu.c         |  8 ++++++-=0D
 target/i386/whpx/whpx-accel-ops.c |  6 +++++=0D
 target/m68k/cpu.c                 |  4 +++-=0D
 target/microblaze/cpu.c           |  8 +++----=0D
 target/mips/cpu.c                 |  4 +++-=0D
 target/nios2/cpu.c                |  4 +++-=0D
 target/openrisc/cpu.c             |  4 +++-=0D
 target/ppc/cpu_init.c             | 37 ++++++++++++++++++++++---------=0D
 target/riscv/cpu.c                |  8 +++----=0D
 target/rx/cpu.c                   |  4 +++-=0D
 target/s390x/cpu.c                |  4 +++-=0D
 target/sh4/cpu.c                  |  5 +++--=0D
 target/sparc/cpu.c                |  6 ++---=0D
 target/tricore/cpu.c              |  6 ++++-=0D
 target/xtensa/cpu.c               | 14 ++++++------=0D
 37 files changed, 189 insertions(+), 88 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

