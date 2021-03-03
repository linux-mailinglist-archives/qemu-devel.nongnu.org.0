Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E7B32BC43
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:49:03 +0100 (CET)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZMc-0004d8-QL
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZKv-0002ln-Vz; Wed, 03 Mar 2021 16:47:18 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZKs-00023G-NH; Wed, 03 Mar 2021 16:47:16 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w11so25340443wrr.10;
 Wed, 03 Mar 2021 13:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1BaoAdExj6YRv7tms7y+nWAE3grOuJDNl0g6v2cn370=;
 b=CTbMElCNFd3kzKfBoNZ9l2kkocibYVYTec9Yj3YpR7xU91uwqq9ZX4wkhuhO8R4GUD
 ygaWFXW2MeSmbIRlS2zUzQJGQU+Jv6Y28jmSFi47cD25c5/ePw53WNhbdKsNR4CsSH6y
 yj3S36vnGOnnlwAmgYcwE+BHif60Bl34I4XhuDe0odU93yP3sdDQc/CbIwlL1JknhC8V
 rwckDWevZ9jhdUTk7la/44Dd+MZn5azyrf4ZieECWiAeuJOQBD2BEMCUSe7ZSmB5dxRl
 asTGMSy3NH3+unc9G2905YP9hNk+vv7KZ38s+eAM1ZTggwHbJKS9etUgRuyQnsW5D2jB
 aWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1BaoAdExj6YRv7tms7y+nWAE3grOuJDNl0g6v2cn370=;
 b=EhV2sidd8g+jZFHdt4E57uSHLnHoCaVhV7+ASzszzQX7Pq1+XebrXl53wqLseKbpCA
 l/hqPenplOny1GGq2iu6eYLsEtaZYPJU6gBZkG4UVC9vzVzflmcfZzTVRM8F1EgO+A08
 8HSSohL6uUMacqXCDldtVDP1FAE1/oTD1r09L+u1/HNqG5WKSGueIFUHoKJCogkHsRkF
 rieoq5IM7vYtFKqzvr0iNkKRuiqfyPVWPDtaAolsZ6bOzg5+gfuqznLk661C1yQZFhy2
 7FxKOCk08TteZ4ictRFNb4wye+t0/yqgI1CD+WWKfFF70w/P4hl+QMXIEWfSJWn1pXeF
 Z22A==
X-Gm-Message-State: AOAM530Cot9UkkK/6EI/t91f/TUKUqRdq24awt9oeXN/HKbzIkpz01WL
 L+OwW6KFjoBdOJWOgzav+95klLT8q5g=
X-Google-Smtp-Source: ABdhPJwD3Hdi9EbcVkN4LjMz1QFpr5AoWtN2XMirdefd0SY1etAbXF56toM1YzNZhSnBdVIw7P2fIw==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr789229wrt.168.1614808030644; 
 Wed, 03 Mar 2021 13:47:10 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 21sm7280767wme.6.2021.03.03.13.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:47:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/28] cpu: Introduce SysemuCPUOps structure, remove
 watchpoints from usermode
Date: Wed,  3 Mar 2021 22:46:40 +0100
Message-Id: <20210303214708.1727801-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series is inspired on Claudio TCG work.=0D
=0D
Instead of separate TCG from other accelerators, here we=0D
separate sysemu operations (system VS user).=0D
=0D
Patches 1-6 are generic cleanups.=0D
Patches 7-15 move from CPUClass to SysemuCPUOps=0D
Patch   16 restricts SysemuCPUOps to sysemu=0D
Patches 17-26 remove watchpoint code from user emulation=0D
Patches 27-28 remove USER_ONLY #ifdef'ry from "cpu.h"=0D
=0D
Since v3:=0D
- SysemuCPUOps const (Richard)=0D
- added missing xtensa #ifdef'ry=0D
- added missing aa64/sve #ifdef'ry=0D
- added Laurent R-b=0D
=0D
Since v2:=0D
- fixed lm32/unicore32=0D
- remove USER_ONLY ifdef'ry from "cpu.h" (Claudio)=0D
=0D
Since v1:=0D
- Name 'sysemu' (Claudio)=0D
- change each field progressively (Richard)=0D
=0D
$ git backport-diff -u v3=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
ve=3D=0D
ly=0D
=0D
001/28:[----] [--] 'target: Set CPUClass::vmsd instead of DeviceClass::vmsd=
'=0D
002/28:[----] [--] 'cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_fr=
om=3D=0D
_attrs'=0D
003/28:[----] [--] 'cpu: Introduce cpu_virtio_is_big_endian()'=0D
004/28:[----] [--] 'cpu: Directly use cpu_write_elf*() fallback handlers in=
 p=3D=0D
lace'=0D
005/28:[----] [--] 'cpu: Directly use get_paging_enabled() fallback handler=
s =3D=0D
in place'=0D
006/28:[----] [--] 'cpu: Directly use get_memory_mapping() fallback handler=
s =3D=0D
in place'=0D
007/28:[0044] [FC] 'cpu: Introduce SysemuCPUOps structure'=0D
008/28:[----] [-C] 'cpu: Move CPUClass::vmsd to SysemuCPUOps'=0D
009/28:[----] [-C] 'cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOp=
s'=0D
010/28:[----] [-C] 'cpu: Move CPUClass::get_crash_info to SysemuCPUOps'=0D
011/28:[----] [-C] 'cpu: Move CPUClass::write_elf* to SysemuCPUOps'=0D
012/28:[----] [-C] 'cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps'=0D
013/28:[----] [-C] 'cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps=
'=0D
014/28:[----] [-C] 'cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps'=
=0D
015/28:[----] [-C] 'cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps'=
=0D
016/28:[----] [--] 'cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.=
c'=0D
017/28:[----] [--] 'linux-user: Remove dead code'=0D
018/28:[----] [--] 'gdbstub: Remove watchpoint dead code in gdbserver_fork(=
)'=0D
019/28:[----] [--] 'target/arm/internals: Fix code style for checkpatch.pl'=
=0D
020/28:[----] [--] 'target/arm: Move code blocks around'=0D
021/28:[----] [--] 'target/arm: Refactor some function bodies'=0D
022/28:[0012] [FC] 'target/arm: Restrict watchpoint code to system emulatio=
n'=0D
023/28:[----] [--] 'target/i386: Restrict watchpoint code to system emulati=
on'=0D
024/28:[down] 'target/xtensa: Restrict watchpoint code to system emulation'=
=0D
025/28:[----] [--] 'accel/tcg/cpu-exec: Restrict watchpoint code to system =
em=3D=0D
ulation'=0D
026/28:[----] [--] 'cpu: Remove watchpoint stubs for user emulation'=0D
027/28:[----] [--] 'cpu: Fix code style for checkpatch.pl'=0D
028/28:[----] [--] 'cpu: Move sysemu specific declarations to 'sysemu-cpu-o=
ps=3D=0D
.h''=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (28):=0D
  target: Set CPUClass::vmsd instead of DeviceClass::vmsd=0D
  cpu: Un-inline cpu_get_phys_page_debug and cpu_asidx_from_attrs=0D
  cpu: Introduce cpu_virtio_is_big_endian()=0D
  cpu: Directly use cpu_write_elf*() fallback handlers in place=0D
  cpu: Directly use get_paging_enabled() fallback handlers in place=0D
  cpu: Directly use get_memory_mapping() fallback handlers in place=0D
  cpu: Introduce SysemuCPUOps structure=0D
  cpu: Move CPUClass::vmsd to SysemuCPUOps=0D
  cpu: Move CPUClass::virtio_is_big_endian to SysemuCPUOps=0D
  cpu: Move CPUClass::get_crash_info to SysemuCPUOps=0D
  cpu: Move CPUClass::write_elf* to SysemuCPUOps=0D
  cpu: Move CPUClass::asidx_from_attrs to SysemuCPUOps=0D
  cpu: Move CPUClass::get_phys_page_debug to SysemuCPUOps=0D
  cpu: Move CPUClass::get_memory_mapping to SysemuCPUOps=0D
  cpu: Move CPUClass::get_paging_enabled to SysemuCPUOps=0D
  cpu: Restrict "hw/core/sysemu-cpu-ops.h" to target/cpu.c=0D
  linux-user: Remove dead code=0D
  gdbstub: Remove watchpoint dead code in gdbserver_fork()=0D
  target/arm/internals: Fix code style for checkpatch.pl=0D
  target/arm: Move code blocks around=0D
  target/arm: Refactor some function bodies=0D
  target/arm: Restrict watchpoint code to system emulation=0D
  target/i386: Restrict watchpoint code to system emulation=0D
  target/xtensa: Restrict watchpoint code to system emulation=0D
  accel/tcg/cpu-exec: Restrict watchpoint code to system emulation=0D
  cpu: Remove watchpoint stubs for user emulation=0D
  cpu: Fix code style for checkpatch.pl=0D
  cpu: Move sysemu specific declarations to 'sysemu-cpu-ops.h'=0D
=0D
 include/hw/core/cpu.h            | 258 +------------------------------=0D
 include/hw/core/sysemu-cpu-ops.h | 244 +++++++++++++++++++++++++++++=0D
 target/alpha/cpu.h               |   3 +=0D
 target/arm/cpu.h                 |   3 +=0D
 target/arm/internals.h           |  34 ++--=0D
 target/avr/cpu.h                 |   1 +=0D
 target/cris/cpu.h                |   3 +=0D
 target/hexagon/cpu.h             |   3 +=0D
 target/hppa/cpu.h                |   3 +=0D
 target/i386/cpu.h                |   3 +=0D
 target/lm32/cpu.h                |   3 +=0D
 target/m68k/cpu.h                |   3 +=0D
 target/microblaze/cpu.h          |   1 +=0D
 target/mips/cpu.h                |   3 +=0D
 target/moxie/cpu.h               |   3 +=0D
 target/nios2/cpu.h               |   1 +=0D
 target/openrisc/cpu.h            |   3 +=0D
 target/ppc/cpu.h                 |   3 +=0D
 target/riscv/cpu.h               |   3 +=0D
 target/rx/cpu.h                  |   1 +=0D
 target/s390x/cpu.h               |   3 +=0D
 target/sh4/cpu.h                 |   3 +=0D
 target/sparc/cpu.h               |   3 +=0D
 target/tilegx/cpu.h              |   3 +=0D
 target/tricore/cpu.h             |   3 +=0D
 target/unicore32/cpu.h           |   3 +=0D
 target/xtensa/cpu.h              |   3 +=0D
 accel/tcg/cpu-exec.c             |   5 +-=0D
 cpu.c                            |  19 ++-=0D
 gdbstub.c                        |   2 +-=0D
 hw/core/cpu.c                    | 113 ++++++++------=0D
 hw/virtio/virtio.c               |   4 +-=0D
 linux-user/main.c                |   5 -=0D
 softmmu/physmem.c                |   1 +=0D
 target/alpha/cpu.c               |  10 +-=0D
 target/arm/cpu.c                 |  22 ++-=0D
 target/arm/debug_helper.c        | 102 ++++++------=0D
 target/arm/helper.c              |   9 +-=0D
 target/arm/sve_helper.c          |  12 ++=0D
 target/avr/cpu.c                 |   8 +-=0D
 target/cris/cpu.c                |  10 +-=0D
 target/hppa/cpu.c                |  10 +-=0D
 target/i386/cpu.c                |  31 ++--=0D
 target/lm32/cpu.c                |  10 +-=0D
 target/m68k/cpu.c                |  10 +-=0D
 target/microblaze/cpu.c          |  10 +-=0D
 target/mips/cpu.c                |  10 +-=0D
 target/moxie/cpu.c               |  10 +-=0D
 target/nios2/cpu.c               |  15 +-=0D
 target/openrisc/cpu.c            |  10 +-=0D
 target/riscv/cpu.c               |  12 +-=0D
 target/rx/cpu.c                  |  16 +-=0D
 target/s390x/cpu.c               |  14 +-=0D
 target/sh4/cpu.c                 |  10 +-=0D
 target/sparc/cpu.c               |  10 +-=0D
 target/tricore/cpu.c             |  13 +-=0D
 target/unicore32/cpu.c           |   8 +-=0D
 target/xtensa/cpu.c              |  10 +-=0D
 target/xtensa/helper.c           |   4 +=0D
 target/ppc/translate_init.c.inc  |  20 +--=0D
 60 files changed, 702 insertions(+), 453 deletions(-)=0D
 create mode 100644 include/hw/core/sysemu-cpu-ops.h=0D
=0D
--=3D20=0D
2.26.2=0D
=0D

