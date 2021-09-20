Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C244128A1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:04:40 +0200 (CEST)
Received: from localhost ([::1]:52798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSROx-0000mp-Ro
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR5p-0002f8-1x
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:44:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR5n-0001Ip-9X
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:44:52 -0400
Received: by mail-wr1-x436.google.com with SMTP id w29so33569255wra.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RTwi2igTT3+qrBhQS4cIH1iklh8guDt/ShiMKOefJYo=;
 b=Yvr51NBwXtey5nqidsNDLhdDL69geuMIooc1oWKXyIcP5WD7ddTMsUpxoEzqWjdRDI
 YsOFTY3pV19uttk5e1QONgEzecDbm1LIxUXve1Ad/oAxXKmY1dTUcvms5OqKdlBONcbp
 RaJkREAl+xuwAn6EtMA8zpGQ2L/5VzNxyLMnl9dTV4v50jfkaIx18u1VCnOnXxrmKzpY
 8Z2a17sUELHRGBRfhGGJNOEcmkJz7KRO/NAV989LRlkDiDCySLHnc74rATVuZPWHDGKP
 H8zs4/LzPPNDkNkYFfXfgPjCpQt2st5WRC0SEsG6IQxpf71t99Ua0vjm+kcO5Rp9PGLW
 vBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RTwi2igTT3+qrBhQS4cIH1iklh8guDt/ShiMKOefJYo=;
 b=4T5r6S74G7ZyqHAEN5K7hx6Qnuj6F90P/zQfsXn7nPl/emhGmsMC0XVA3v2JGCAxio
 yUPJ2eUq3fEWt0qr+qXcMHrXIOj8aaDFncNi9zDxRjxpzAqdc6hvwxsr36Pwupu08/TI
 SvOpTsWre9ZYQj1yBpZ70aGrY5ZTY7JhsOFoJOfhAMdaPuvhJxYWaXyPgm0XsSy30bXi
 pDmx/kJ4VzwuUsH+8T+3lDXjMkdo5nnBUtyxsBimIxyO5X17ZJL8eiM8xQMACb6FYYhW
 Z//tdAtcL6UcGKBceMW4aQf/LXedX2hliAeLQfgJjwLuZieOFz0INGzECbDEIwdUI0Fr
 Fj5A==
X-Gm-Message-State: AOAM530usBHw7i9AqnP/EJcMtaTPLrgbmSONBZT8VjSHUeLZgFAUapBX
 ihaw2jl6/gqrqNFMA+y7gJEevF0VtZw=
X-Google-Smtp-Source: ABdhPJwy9K8nEqH7WgoQKfcRtl0SLJbs2ubU6iJ7aRqEofWBkXJ8uSGSNfkE7ZdkUavtnCBuphgm7w==
X-Received: by 2002:a1c:3881:: with SMTP id f123mr1089011wma.185.1632174289304; 
 Mon, 20 Sep 2021 14:44:49 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 d129sm771686wmd.23.2021.09.20.14.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:44:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/31] accel: Move has_work() from SysemuCPUOps to
 AccelOpsClass
Date: Mon, 20 Sep 2021 23:44:16 +0200
Message-Id: <20210920214447.2998623-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Missing review:=0D
- 0001-target-arm-Implement-arm_v7m_cpu_has_work.patch=0D
- 0005-sysemu-Introduce-AccelOpsClass-has_work.patch=0D
- 0008-accel-tcg-Implement-AccelOpsClass-has_work-as-stub.patch=0D
- 0010-target-arm-Restrict-has_work-handler-to-sysemu-and-T.patch=0D
- 0012-target-cris-Restrict-has_work-handler-to-sysemu.patch=0D
=0D
Hi,=0D
=0D
CPU has_work() is a per-accelerator handler. This series=0D
- explicit the KVM / WHPX implementations=0D
- moves TCG implementations in AccelOpsClass=0D
- explicit missing implementations (returning 'false').=0D
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
$ git backport-diff v3..v4=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
vely=0D
=0D
001/31:[down] 'target/arm: Implement arm_v7m_cpu_has_work()'=0D
002/31:[----] [--] 'accel/tcg: Restrict cpu_handle_halt() to sysemu'=0D
003/31:[----] [--] 'hw/core: Restrict cpu_has_work() to sysemu'=0D
004/31:[----] [--] 'hw/core: Un-inline cpu_has_work()'=0D
005/31:[0006] [FC] 'sysemu: Introduce AccelOpsClass::has_work()'=0D
006/31:[----] [--] 'accel/kvm: Implement AccelOpsClass::has_work()'=0D
007/31:[----] [--] 'accel/whpx: Implement AccelOpsClass::has_work()'=0D
008/31:[0004] [FC] 'accel/tcg: Implement AccelOpsClass::has_work() as stub'=
=0D
009/31:[----] [--] 'target/alpha: Restrict has_work() handler to sysemu'=0D
010/31:[0002] [FC] 'target/arm: Restrict has_work() handler to sysemu and T=
CG'=0D
011/31:[----] [--] 'target/avr: Restrict has_work() handler to sysemu'=0D
012/31:[0001] [FC] 'target/cris: Restrict has_work() handler to sysemu'=0D
013/31:[----] [--] 'target/hexagon: Remove unused has_work() handler'=0D
014/31:[----] [--] 'target/hppa: Restrict has_work() handler to sysemu'=0D
015/31:[----] [--] 'target/i386: Restrict has_work() handler to sysemu and =
TCG'=0D
016/31:[----] [--] 'target/m68k: Restrict has_work() handler to sysemu'=0D
017/31:[----] [--] 'target/microblaze: Restrict has_work() handler to sysem=
u'=0D
018/31:[----] [--] 'target/mips: Restrict has_work() handler to sysemu and =
TCG'=0D
019/31:[----] [--] 'target/nios2: Restrict has_work() handler to sysemu'=0D
020/31:[----] [--] 'target/openrisc: Restrict has_work() handler to sysemu'=
=0D
021/31:[----] [--] 'target/ppc: Introduce PowerPCCPUClass::has_work()'=0D
022/31:[----] [--] 'target/ppc: Restrict has_work() handlers to sysemu and =
TCG'=0D
023/31:[----] [--] 'target/riscv: Restrict has_work() handler to sysemu and=
 TCG'=0D
024/31:[----] [--] 'target/rx: Restrict has_work() handler to sysemu'=0D
025/31:[----] [--] 'target/s390x: Restrict has_work() handler to sysemu and=
 TCG'=0D
026/31:[----] [--] 'target/sh4: Restrict has_work() handler to sysemu'=0D
027/31:[----] [--] 'target/sparc: Remove pointless use of CONFIG_TCG defini=
tion'=0D
028/31:[----] [--] 'target/sparc: Restrict has_work() handler to sysemu'=0D
029/31:[----] [--] 'target/tricore: Restrict has_work() handler to sysemu'=
=0D
030/31:[----] [--] 'target/xtensa: Restrict has_work() handler to sysemu'=0D
031/31:[0006] [FC] 'accel: Add missing AccelOpsClass::has_work() and drop S=
ysemuCPUOps one'=0D
=0D
Philippe Mathieu-Daud=C3=A9 (31):=0D
  target/arm: Implement arm_v7m_cpu_has_work()=0D
  accel/tcg: Restrict cpu_handle_halt() to sysemu=0D
  hw/core: Restrict cpu_has_work() to sysemu=0D
  hw/core: Un-inline cpu_has_work()=0D
  sysemu: Introduce AccelOpsClass::has_work()=0D
  accel/kvm: Implement AccelOpsClass::has_work()=0D
  accel/whpx: Implement AccelOpsClass::has_work()=0D
  accel/tcg: Implement AccelOpsClass::has_work() as stub=0D
  target/alpha: Restrict has_work() handler to sysemu=0D
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
  accel: Add missing AccelOpsClass::has_work() and drop SysemuCPUOps one=0D
=0D
 include/hw/core/cpu.h             | 28 +++++++++--------------=0D
 include/hw/core/tcg-cpu-ops.h     |  4 ++++=0D
 include/sysemu/accel-ops.h        |  5 +++++=0D
 target/ppc/cpu-qom.h              |  3 +++=0D
 accel/hvf/hvf-accel-ops.c         |  6 +++++=0D
 accel/kvm/kvm-accel-ops.c         |  6 +++++=0D
 accel/qtest/qtest.c               |  6 +++++=0D
 accel/tcg/cpu-exec.c              |  6 +++--=0D
 accel/tcg/tcg-accel-ops.c         | 10 +++++++++=0D
 accel/xen/xen-all.c               |  6 +++++=0D
 hw/core/cpu-common.c              |  6 -----=0D
 softmmu/cpus.c                    | 10 ++++++---=0D
 target/alpha/cpu.c                |  4 +++-=0D
 target/arm/cpu.c                  |  7 ++++--=0D
 target/arm/cpu_tcg.c              |  6 +++++=0D
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
 37 files changed, 184 insertions(+), 86 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

