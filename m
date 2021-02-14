Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E75F31B1BD
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:02:45 +0100 (CET)
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLjH-0008Oa-Ix
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLfz-0006c4-KN
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:19 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLfx-00046O-M9
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:59:19 -0500
Received: by mail-wm1-x332.google.com with SMTP id x4so5838338wmi.3
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HAvL4S+O4jaJH9/J9IWd4k81RI6viJyPFIVV3UFrvRA=;
 b=Fb3kNrj8hQMZwXxMfz7elXbrV3y5bQXBMs70PIL/OtqHfc6K8JCU1tOsCSABC+7hhc
 lp5rfvhUXgHVL8ayZewhdZ8upwOdHHVQtBlCgQcoKE0BqdF/nKuYjUtcPM5TXXSdgUsC
 HUkG/JjJ8lfbGVHHruS166C8GP/ExcdfBLUSMx1mwsRudqU2t4bwQNCF/zwIpe0lIPal
 LIw7IRa2IfKpbjoC/u3f/qVWR3gDTfMuf3vBykE1lyr7jOkGGuueo2pTJXz45TZWK7y4
 vnWNrdRgd8PRy+uGqidaToz9XmdE/jDhPNy97cAEm2rKCqbkVSs/DxBcrT5d280q3sWS
 /N0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HAvL4S+O4jaJH9/J9IWd4k81RI6viJyPFIVV3UFrvRA=;
 b=VGWuwrFkNErcsXPE98q98FgsJT43xqxwWPDZXeEPE/z7IPiouw5vVR+GLVGnDbSqQM
 PLq9wREJmIBkoRUtZ5vE0+uV/7IVXu3Qt7SHFxWP86OSJ76eZUaD3E/hco7AXmH+UCix
 TrLHDpCYTQHpBPv2zqIdQ4k3m7Rpkp57tBSJ0W+7d5MHRU3ap/STV7QGorIt8ge3jSMT
 +HnjKoly2W8Rl/MxT4CTuzl6KN78pt0AhCAEFnQI93AV3N4Z36S7Rm3upDQR0Za90VSk
 qomlQX2qYm0iV+1utCnUCeF52RpBtK52KPewPJpl7r9dbRiNukE+os8leA/UFqi1XW3Z
 qezg==
X-Gm-Message-State: AOAM532VBijyoqVDYA2h4kFFP3WYS+cGC+XwxU9iz8ZtpALW8FEzGRI/
 58yt1wXIDiwg0Jzv7Bjjl6XnjwpgOw4=
X-Google-Smtp-Source: ABdhPJyLg9pmLYrlczknHYpKAMFZX250B5xIbNE1ODKMCcAVwxGMJ2W3JF4Xr63Q1u5Bd9K/blahpQ==
X-Received: by 2002:a1c:68d4:: with SMTP id
 d203mr10908289wmc.153.1613325555850; 
 Sun, 14 Feb 2021 09:59:15 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n11sm20193043wrt.34.2021.02.14.09.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:59:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/42] target/mips: Reintroduce the R5900 CPU (with more
 testing)
Date: Sun, 14 Feb 2021 18:58:30 +0100
Message-Id: <20210214175912.732946-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The R5900 CPU was removed some time ago (frankly I don't remember=0D
why). This series add it back, but to prove it works, we also add=0D
testing at the end.=0D
=0D
The main motivation is to have MIPS R5900 coverage, but to be able=0D
to run real world r5900 binaries, I had to implement more opcodes.=0D
=0D
42 patches are a lot, but 3 are already queued in linux-user-for-6.0,=0D
and the 11 last ones are pure testing. I suppose in next versions=0D
I'll split the testing patches, but to show the final objective I=0D
included them in here.=0D
=0D
I tagged it RFC because some parts because:=0D
=0D
- We'd rather not add yet another target, but we need the=0D
  ILP32-on-64bit ABI (o32 64-bit)=0D
=0D
- RDHWR glibc kludge for user-mode=0D
=0D
- Avocado patches are only here to show the final test.=0D
  They are useful for my set of tests, but not meant to=0D
  be merged in mainstream.=0D
=0D
- gitlab jobs are only here to show the tests work.=0D
  If the target is ever accepted, it would go in an already=0D
  existing job.=0D
=0D
I'm OK to maintain 64-bit o32 and the testing out of tree, but the=0D
TCG opcodes are worthwhile review for mainstream.=0D
=0D
Note: there is a sign-extension bug somewhere but I can't find it:=0D
=0D
 $ qemu-r5900o32el busybox free=0D
  =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3D=
C2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3D=0D
=3DA0total =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC=
2=3DA0=3DC2=3DA0used =3DC2=3DA0=3DC2=3DA0=3DC2=3D=0D
=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0free =3DC2=3DA0=3DC2=
=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0sha=3D=0D
red =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0buffers=0D
  =3DC2=3DA0Mem: =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA03682012 =
=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3D=0D
=3DC2=3DA0=3DC2=3DA0812620 =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3D=
A02869392 =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3D=0D
=3DC2=3DA0=3DC2=3DA01367556 =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=
=3DA0=3DC2=3DA0321136=0D
  Swap: =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA02095100 =3DC2=3DA=
0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0-149854=3D=0D
4 =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA03593644=0D
 Total: =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA05777112 =3DC2=3DA=
0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0-=3D=0D
685924 =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA06463036=0D
=0D
 $ free # host=0D
  =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3D=
C2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3D=0D
=3DA0total =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC=
2=3DA0used =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3D=0D
=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0free =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=
=3DA0=3DC2=3DA0shared =3DC2=3DA0buff/cac=3D=0D
he =3DC2=3DA0=3DC2=3DA0available=0D
 Mem: =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA016264924 =
=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA093=3D=0D
23500 =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA02822500 =3DC2=3DA0=3DC2=3DA0=
=3DC2=3DA0=3DC2=3DA01377288 =3DC2=3DA0=3D=0D
=3DC2=3DA0=3DC2=3DA0=3DC2=3DA04118924 =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=
=3DA05149548=0D
 Swap: =3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA018872316 =3DC2=3DA=
0=3DC2=3DA0=3DC2=3DA011084368 =3DC2=3D=0D
=3DA0=3DC2=3DA0=3DC2=3DA0=3DC2=3DA07787948=0D
=0D
See the used swap:=0D
=0D
  11084368 =3D3D 0x00a92250=0D
  -1498544 =3D3D 0xffe92250=0D
=0D
Fredrik Noring (2):=0D
  linux-user/mips64: Support the n32 ABI for the R5900=0D
  tests/tcg/mips: Test user mode DMULT for the R5900=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (40):=0D
  linux-user/mips64: Restore setup_frame() for o32 ABI=0D
  linux-user/mips64: Support o32 ABI syscalls=0D
  target/mips/translate: Make cpu_HI/LO registers public=0D
  target/mips: Promote 128-bit multimedia registers as global ones=0D
  target/mips: Rename 128-bit upper halve GPR registers=0D
  target/mips: Introduce gen_load_gpr_hi() / gen_store_gpr_hi() helpers=0D
  target/mips/translate: Use GPR move functions in gen_HILO1_tx79()=0D
  target/mips/tx79: Move MFHI1 / MFLO1 opcodes to decodetree=0D
  target/mips/tx79: Move MTHI1 / MTLO1 opcodes to decodetree=0D
  target/mips/translate: Simplify PCPYH using deposit_i64()=0D
  target/mips/tx79: Move PCPYH opcode to decodetree=0D
  target/mips/tx79: Move PCPYLD / PCPYUD opcodes to decodetree=0D
  target/mips: Remove 'C790 Multimedia Instructions' dead code=0D
  target/mips/tx79: Salvage instructions description comment=0D
  target/mips/tx79: Introduce PAND/POR/PXOR/PNOR opcodes (parallel=0D
    logic)=0D
  target/mips/tx79: Introduce PSUB* opcodes (Parallel Subtract)=0D
  target/mips/tx79: Introduce PEXTUW (Parallel Extend Upper from Word)=0D
  target/mips/tx79: Introduce PEXTU[BHW] opcodes (Parallel Extend Lower)=0D
  target/mips/tx79: Introduce PCEQ* opcodes (Parallel Compare for Equal)=0D
  target/mips/tx79: Introduce PCGT* (Parallel Compare for Greater Than)=0D
  target/mips/tx79: Introduce PPACW opcode (Parallel Pack to Word)=0D
  target/mips/tx79: Introduce PINTEH (Parallel Interleave Even Halfword)=0D
  target/mips/tx79: Introduce PEXE[HW] opcodes (Parallel Exchange Even)=0D
  target/mips/tx79: Introduce PROT3W opcode (Parallel Rotate 3 Words)=0D
  target/mips/tx79: Introduce LQ opcode (Load Quadword)=0D
  target/mips/tx79: Introduce SQ opcode (Store Quadword)=0D
  target/mips/translate: Make gen_rdhwr() public=0D
  target/mips/tx79: Move RDHWR usermode kludge to trans_SQ()=0D
  target/mips: Reintroduce the R5900 CPU=0D
  default-configs: Support o32 ABI with R5900 64-bit MIPS CPU=0D
  docker: Add gentoo-mipsr5900el-cross image=0D
  gitlab-ci: Pass optional EXTRA_FILES when building docker images=0D
  gitlab-ci: Build MIPS R5900 cross-toolchain (Gentoo based)=0D
  tests/tcg: Add MIPS R5900 to arches filter=0D
  gitlab-ci: Add job to test the MIPS r5900o32el target=0D
  tests/acceptance: Extract QemuBaseTest from Test=0D
  tests/acceptance: Make pick_default_qemu_bin() more generic=0D
  tests/acceptance: Introduce QemuUserTest base class=0D
  tests/acceptance: Test R5900 CPU with BusyBox from Sony PS2=0D
  gitlab-ci: Add job to run integration tests for the r5900o32el target=0D
=0D
 docs/user/main.rst                            |   3 +=0D
 .../targets/r5900o32el-linux-user.mak         |   7 +=0D
 linux-user/mips64/syscall_nr.h                |   5 +-=0D
 linux-user/mips64/target_elf.h                |   3 +=0D
 linux-user/mips64/target_signal.h             |   4 +=0D
 target/mips/cpu.h                             |  10 +-=0D
 target/mips/translate.h                       |  14 +=0D
 target/mips/tx79.decode                       |  76 ++=0D
 target/mips/translate.c                       | 862 +----------------=0D
 target/mips/tx79_translate.c                  | 877 ++++++++++++++++++=0D
 target/mips/txx9_translate.c                  |  20 +=0D
 tests/tcg/mips/mipsn32r5900/dmult.c           |  40 +=0D
 target/mips/cpu-defs.c.inc                    |  59 ++=0D
 .gitlab-ci.d/containers.yml                   |   8 +=0D
 .gitlab-ci.yml                                |  22 +=0D
 MAINTAINERS                                   |   1 +=0D
 target/mips/meson.build                       |   5 +=0D
 tests/acceptance/avocado_qemu/__init__.py     |  56 +-=0D
 tests/acceptance/mips_r5900_ps2.py            |  69 ++=0D
 tests/docker/Makefile.include                 |   3 +=0D
 .../gentoo-mipsr5900el-cross.docker           |  35 +=0D
 .../crossdev.conf                             |   5 +=0D
 tests/tcg/configure.sh                        |   8 +-=0D
 tests/tcg/mips/mipsn32r5900/Makefile          |  25 +=0D
 24 files changed, 1375 insertions(+), 842 deletions(-)=0D
 create mode 100644 default-configs/targets/r5900o32el-linux-user.mak=0D
 create mode 100644 target/mips/tx79.decode=0D
 create mode 100644 target/mips/tx79_translate.c=0D
 create mode 100644 target/mips/txx9_translate.c=0D
 create mode 100644 tests/tcg/mips/mipsn32r5900/dmult.c=0D
 create mode 100644 tests/acceptance/mips_r5900_ps2.py=0D
 create mode 100644 tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docke=
r=0D
 create mode 100644 tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docke=
r.=3D=0D
d/crossdev.conf=0D
 create mode 100644 tests/tcg/mips/mipsn32r5900/Makefile=0D
=0D
--=3D20=0D
2.26.2=0D
=0D

