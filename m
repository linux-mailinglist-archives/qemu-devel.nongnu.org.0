Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939994182E9
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:53:57 +0200 (CEST)
Received: from localhost ([::1]:37392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU93s-0000rT-Ai
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91P-0007PF-UA
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:27 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91N-0004gR-PW
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:23 -0400
Received: by mail-wr1-x431.google.com with SMTP id i24so20527671wrc.9
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/n7TtPXC8vBz7roIm5TDLby2/gRtIZUi/EhVpQKUT8s=;
 b=HL4R+CGoWwuv+39V0D/z5tiMQjBo7f4E7SGTSJ8pRc7s4I08XA6iFmUzE25qfe1mzt
 L6Q3iTNwWlllyMqzcY3qhsGZMrfVRynL5xb1zUJfLlxPLkqBhgp4mZnnV+s6iyX0hUrY
 eh4vZDLhIPIqFMkIPbSfr8LlOcHsGp4LxvgtpWWDr6Ob1KbOONldDRqihPqcQnjfy5o5
 FBJjlWNm/5HN2p3N5M+Lizo6bg/GH3Jn3kE9v5skF7GVAZKww3LPuKGAJ8fOOMTlQhAu
 KEBYxQnKOKokg8dYUPeapOvdEZws5A8Da/w1hY7QVBoCkbbwC0hpq0udEp+/n0mIH9P9
 KKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/n7TtPXC8vBz7roIm5TDLby2/gRtIZUi/EhVpQKUT8s=;
 b=GjeA/v9gCb2rcIWiwW5SNfddU7TiQopCxo25T/1LinvjBQ6E+fMja9Fm1ceBPPUCfT
 ASAjkOgtGDmTYtLONLo6w7OgJ071c47T3twYLECjfO8BwARlFT4Mk+IKTNADG26Dfbh5
 h1XFYWLvd2w9Tl1epGeq3rRw3MDNJ/P0yn1BVY4CpknfLGt42+xMRPCHJRrxiYKqdnV7
 N0cE1Yu+JeqLWJ3/9NhTX69Tmg23f0iSxCBgfq764lAhaqZROi0o2WTDhKhfit+PFcnw
 0GcuWfG+lvCvbdVWENBdgbExn4NGC58Kg5Ho9al21SZbPcfmRxj+ShTsKxYxZiNCfGVu
 eAqQ==
X-Gm-Message-State: AOAM532mLSjlRoJ+Og4+gRUe1HeDWrEHvNZMMRvI5Awbv/4h5O5XYdu7
 +NvluTpitkgbNbU9fQgPfXaoeXOUbhA=
X-Google-Smtp-Source: ABdhPJzaaPnK56/Dd4NAEBdBvvyq6Kglzwv61kd+Stgp9u8fjpegNeH8TF75pUlAnlADIRXStAXNhA==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr7362576wmr.89.1632581479774;
 Sat, 25 Sep 2021 07:51:19 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 c7sm14010374wmq.13.2021.09.25.07.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:51:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/40] accel: Move has_work() from CPUClass to AccelOpsClass
Date: Sat, 25 Sep 2021 16:50:38 +0200
Message-Id: <20210925145118.1361230-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
0004-hw-core-Move-cpu_common_has_work-to-cpu_has_work.patch=0D
0005-accel-Introduce-AccelOpsClass-has_work.patch=0D
0008-accel-hvf-Implement-AccelOpsClass-has_work.patch=0D
0009-accel-xen-Implement-AccelOpsClass-has_work.patch=0D
0010-accel-hax-Implement-AccelOpsClass-has_work.patch=0D
0011-accel-nvmm-Implement-AccelOpsClass-has_work.patch=0D
0012-accel-qtest-Implement-AccelOpsClass-has_work.patch=0D
0013-accel-tcg-Implement-AccelOpsClass-has_work.patch=0D
0014-accel-Simplify-cpu_has_work.patch=0D
0015-accel-tcg-Introduce-TCGCPUOps-has_work.patch=0D
0016-target-arm-Explicit-v7M-cores-use-arm_cpu_has_work-a.patch=0D
0017-target-arm-Restrict-has_work-handler-to-sysemu-and-T.patch=0D
0018-target-alpha-Restrict-has_work-handler-to-sysemu.patch=0D
0039-accel-tcg-Remove-CPUClass-has_work.patch=0D
0040-accel-tcg-Simplify-tcg_cpu_has_work.patch=0D
=0D
Since v6:=0D
- Added missing target/alpha/ patch=0D
- Updated comment in qemu_s390_flic_has_service()=0D
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
  target/alpha: Restrict has_work() handler to sysemu=0D
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
 accel/tcg/cpu-exec.c              |  6 +++++=0D
 accel/tcg/tcg-accel-ops.c         |  9 ++++++++=0D
 accel/xen/xen-all.c               |  6 +++++=0D
 hw/core/cpu-common.c              |  6 -----=0D
 hw/intc/s390_flic.c               | 15 ++++++++++---=0D
 softmmu/cpus.c                    | 17 +++++++++-----=0D
 target/alpha/cpu.c                |  4 +++-=0D
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
 39 files changed, 202 insertions(+), 90 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

