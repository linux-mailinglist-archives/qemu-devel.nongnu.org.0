Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C720A2C16C1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:48:30 +0100 (CET)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIlB-0002qE-Pb
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIhi-0000gM-NJ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:44:54 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIhg-000162-O2
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:44:54 -0500
Received: by mail-wr1-x431.google.com with SMTP id z7so4292811wrn.3
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TYBKIgV2ZOsbNODkS/2vXdBzzoGoptsMfMrhlFd4BPQ=;
 b=R2pd8Y2tyQA4pLslKrwgActvaLKp9EZJKT7zw/Uqht3mS/oRHNx1kXBaKZcQGOokvA
 UYaujqva0wOO6STYi6OMdYWtoTK6PPN9L3BkHsq96E5PxWcLg8KkZL1OPwl9mZjdLN8s
 BD/PgyMtqfHcnmt1rfec72YIobIG/txcXbye9N6y5HfWr4ophrj0FUbdWe8KTxoTN3to
 ww319KMFLW5uJT0VlMmJLpG8irN5lm2d9rOcIRe/RilLawBM61B0bDQslzio3AXSTUJU
 VEEtIdOInWrPv3jelOYn5LVJoxuMHjGUeMwj94B01+GUKqx6YI90rlahY3P6C9gvIgQt
 /t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TYBKIgV2ZOsbNODkS/2vXdBzzoGoptsMfMrhlFd4BPQ=;
 b=iIsJPw6tYr564/rhkoWH8wiWtdwuF9xcWJ2DcBleZsGjiN8n7+6FbYi99QLJ/8kg7O
 q+NDRM/tf+zOy4nQMX+w8Ue0Her/iJvaWFm8T+Zfu8qoVZV/JLtQBU3A3J+C3I+kV0ob
 xD9aGSZz1ScZKArApq8Nl5WSfF76Al33FDHRGqRC0HBJZbSAH9BhROfcf/yRSsMSwUpR
 a+4dhrZnhCfEmFOVW/tkfMrRsKojLtvmv5ZS9l6fAhfx3TMuhBJg4aYYYZuuA28jPVXb
 yByok9AvDrcx5LpUVYh02u2dhXpo7eRAQWqfOzxML4ShjH4+JAgUd45TuOlSc1mpxmTA
 KDCQ==
X-Gm-Message-State: AOAM530nnn850yn8CAMnWDI14LNnoKxNLe5PBYRRCW6+xP6dG6cPMRQH
 NZHmjJiJ09ca7cCC7uAK5edg4XyJ2NU=
X-Google-Smtp-Source: ABdhPJxnWiOnttWz1efF6tONh2tZ0GiM2hL/O4u/KCftRSAwCRxozNT+6SDQCqx1oBXPbb60Ux4oeQ==
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr1450653wrx.337.1606164290714; 
 Mon, 23 Nov 2020 12:44:50 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id y2sm22310739wrn.31.2020.11.23.12.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:44:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/28] target/mips: Explode 60% of the 32K-lines translate.c
Date: Mon, 23 Nov 2020 21:44:20 +0100
Message-Id: <20201123204448.3260804-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

Since v1:=0D
- Addressed Richard review comments=0D
=0D
Patches missing review: 1,3,4,21,22,25=0D
=0D
Hi,=0D
=0D
This series, while boring, helps maintainability.=0D
=0D
I simply exploded 60% of the huge target/mips/translate.c,=0D
reducing it from 32K lines of code to 13500.=0D
=0D
The small overhead in the diffstat is due to entries added in=0D
MAINTAINERS and license boilerplate addition:=0D
20225 insertions(+), 19987 deletions(-)=0D
=0D
While being a massive diff, it is a no-brain review using=0D
'git-diff --color-moved=3Ddimmed-zebra' which highlights very few=0D
changes: #include and license lines.=0D
=0D
The exploded new layout, which allows more useful filtering=0D
with the get_maintainer.pl script, is:=0D
=0D
- MIPS ISA, ASE and modules:=0D
=0D
 . isa-micromips_helper.h.inc=0D
 . isa-nanomips_translate.c.inc=0D
=0D
 . ase-mips16e_translate.c.inc=0D
=0D
 . mod-dsp_helper.c=0D
 . mod-dsp_helper.h.inc=0D
 . mod-dsp_translate.c.inc=0D
 . mod-msa_helper.h.inc=0D
 . mod-msa_translate.c.inc=0D
 . mod-msa_helper.c=0D
 . mod-mt_helper.h.inc=0D
=0D
- MIPS Vendor Specific:=0D
=0D
 . vendor-loong-simd_helper.c=0D
 . vendor-loong-ext_translate.c.inc=0D
 . vendor-loong-simd_helper.h.inc=0D
 . vendor-loong-simd_translate.c.inc=0D
=0D
 . vendor-tx-mmi_translate.c.inc=0D
 . vendor-tx_translate.c.inc=0D
=0D
 . vendor-vr54xx_helper.c=0D
 . vendor-vr54xx_helper.h.inc=0D
 . vendor-vr54xx_translate.c.inc=0D
=0D
 . vendor-mxu_translate.c.inc=0D
=0D
There should be no logical code change (only code movement).=0D
=0D
The series is available at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/mips_translate_explode-v2=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (28):=0D
  target/mips: Use FloatRoundMode enum for FCR31 modes conversion=0D
  target/mips: Extract FPU helpers to 'fpu_helper.h'=0D
  target/mips: Rename msa_helper.c as mod-msa_helper.c=0D
  target/mips: Extract MSA helpers from op_helper.c=0D
  target/mips: Extract MSA helper definitions=0D
  target/mips: Extract MSA translation routines=0D
  target/mips: Rename dsp_helper.c as mod-dsp_helper.c=0D
  target/mips: Extract DSP helper definitions=0D
  target/mips: Extract DSP translation routines=0D
  target/mips: Extract Multi-Threading helper definitions=0D
  target/mips: Extract Code Compaction ASE translation routines=0D
  target/mips: Extract the microMIPS ISA helper definitions=0D
  target/mips: Extract the microMIPS ISA translation routines=0D
  target/mips: Extract nanoMIPS ISA translation routines=0D
  target/mips: Extract NEC Vr54xx helpers to vendor-vr54xx_helper.c=0D
  target/mips: Extract NEC Vr54xx helper definitions=0D
  target/mips: Extract NEC Vr54xx translation routines=0D
  target/mips: Rename lmmi_helper.c as loong-simd_helper.c=0D
  target/mips: Extract Loongson SIMD helper definitions=0D
  target/mips: Extract Loongson SIMD translation routines=0D
  target/mips: Extract Loongson EXTensions translation routines=0D
  target/mips: Extract XBurst Media eXtension Unit translation routines=0D
  target/mips: Make pipeline 1 multiply opcodes generic=0D
  target/mips: Extract Toshiba TXx9 translation routines=0D
  target/mips: Extract Toshiba TX79 multimedia translation routines=0D
  MAINTAINERS: Add entry for MIPS Loongson TCG=0D
  MAINTAINERS: Add entry for MIPS Ingenic Xburst TCG=0D
  MAINTAINERS: Add entry for MIPS Toshiba TCG=0D
=0D
 target/mips/fpu_helper.h                      |    50 +=0D
 target/mips/helper.h                          |   881 +-=0D
 target/mips/internal.h                        |    42 -=0D
 linux-user/mips/cpu_loop.c                    |     1 +=0D
 target/mips/fpu_helper.c                      |     3 +-=0D
 target/mips/gdbstub.c                         |     1 +=0D
 target/mips/kvm.c                             |     1 +=0D
 target/mips/machine.c                         |     1 +=0D
 .../mips/{dsp_helper.c =3D> mod-dsp_helper.c}   |     2 +=0D
 .../mips/{msa_helper.c =3D> mod-msa_helper.c}   |   393 +=0D
 target/mips/op_helper.c                       |   511 -=0D
 target/mips/translate.c                       | 18696 +---------------=0D
 ...mi_helper.c =3D> vendor-loong-simd_helper.c} |     0=0D
 target/mips/vendor-vr54xx_helper.c            |   131 +=0D
 MAINTAINERS                                   |    20 +=0D
 target/mips/ase-mips16e_translate.c.inc       |  1170 +=0D
 target/mips/isa-micromips_helper.h.inc        |    17 +=0D
 target/mips/isa-micromips_translate.c.inc     |  3316 +++=0D
 target/mips/isa-nanomips_translate.c.inc      |  4839 ++++=0D
 target/mips/meson.build                       |     8 +-=0D
 target/mips/mod-dsp_helper.h.inc              |   344 +=0D
 target/mips/mod-dsp_translate.c.inc           |  2158 ++=0D
 target/mips/mod-msa_helper.h.inc              |   443 +=0D
 target/mips/mod-msa_translate.c.inc           |  2218 ++=0D
 target/mips/mod-mt_helper.h.inc               |    36 +=0D
 target/mips/vendor-loong-ext_translate.c.inc  |   665 +=0D
 target/mips/vendor-loong-simd_helper.h.inc    |    69 +=0D
 target/mips/vendor-loong-simd_translate.c.inc |   492 +=0D
 target/mips/vendor-mxu_translate.c.inc        |  2892 +++=0D
 target/mips/vendor-tx-mmi_translate.c.inc     |   573 +=0D
 target/mips/vendor-tx_translate.c.inc         |   315 +=0D
 target/mips/vendor-vr54xx_helper.h.inc        |    24 +=0D
 target/mips/vendor-vr54xx_translate.c.inc     |    93 +=0D
 33 files changed, 20320 insertions(+), 20085 deletions(-)=0D
 create mode 100644 target/mips/fpu_helper.h=0D
 rename target/mips/{dsp_helper.c =3D> mod-dsp_helper.c} (99%)=0D
 rename target/mips/{msa_helper.c =3D> mod-msa_helper.c} (94%)=0D
 rename target/mips/{lmmi_helper.c =3D> vendor-loong-simd_helper.c} (100%)=
=0D
 create mode 100644 target/mips/vendor-vr54xx_helper.c=0D
 create mode 100644 target/mips/ase-mips16e_translate.c.inc=0D
 create mode 100644 target/mips/isa-micromips_helper.h.inc=0D
 create mode 100644 target/mips/isa-micromips_translate.c.inc=0D
 create mode 100644 target/mips/isa-nanomips_translate.c.inc=0D
 create mode 100644 target/mips/mod-dsp_helper.h.inc=0D
 create mode 100644 target/mips/mod-dsp_translate.c.inc=0D
 create mode 100644 target/mips/mod-msa_helper.h.inc=0D
 create mode 100644 target/mips/mod-msa_translate.c.inc=0D
 create mode 100644 target/mips/mod-mt_helper.h.inc=0D
 create mode 100644 target/mips/vendor-loong-ext_translate.c.inc=0D
 create mode 100644 target/mips/vendor-loong-simd_helper.h.inc=0D
 create mode 100644 target/mips/vendor-loong-simd_translate.c.inc=0D
 create mode 100644 target/mips/vendor-mxu_translate.c.inc=0D
 create mode 100644 target/mips/vendor-tx-mmi_translate.c.inc=0D
 create mode 100644 target/mips/vendor-tx_translate.c.inc=0D
 create mode 100644 target/mips/vendor-vr54xx_helper.h.inc=0D
 create mode 100644 target/mips/vendor-vr54xx_translate.c.inc=0D
=0D
-- =0D
2.26.2=0D
=0D

