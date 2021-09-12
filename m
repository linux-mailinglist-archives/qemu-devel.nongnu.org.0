Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACF407EF2
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:29:27 +0200 (CEST)
Received: from localhost ([::1]:57248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTIE-00074M-T8
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGT-0005Co-Kt
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:27:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGR-0004CY-UY
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:27:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id t18so10972465wrb.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RkHwVgRRTDLcuOV1tBO7mxvd7UvHSIHa+ht5NC0mO90=;
 b=UlqLHHZSDuUrZTLM/C/hgs9LTBkxnRhionewISmDzQ8CoYMlgjM+aWyfwlwb/tO3qo
 lBtVaxSfxaidon2htTbVB8cNL9xiR/AxftWEoqXozgBeIJeBZl49HJ3x/r7MWPJlRKw+
 nOBnQHWe7dCu4HuIjTwS2bCnmrm4fkrWTtKr/mzea8rJRNtOcyottdJB+LStU99Ok+pj
 iXnWXX826tikfLEHxvQu+KIv/lZEpHU7jzeRfO009DjBzYR8rod0b/6sYBzAxyfal4vk
 twg3lOGINiuxX/SmtJTIklJpLTP2Cyzng7ZPYo+Qo8RTITnf9yutVh1q3b+/np0LSnQV
 7W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=RkHwVgRRTDLcuOV1tBO7mxvd7UvHSIHa+ht5NC0mO90=;
 b=T7LI87n/koXw+PSFzm9Xin+nn0iEBN6Az0Piy07vDSC/mOgeCM5zl5uLIHR2VOcL3S
 boGX2+L82aa1D22Te8O99/fkhtqSNDO2OJsiztkTi1/09u/drwsSWJqTje3zh68ZJ8Bk
 nzlwpdZhUOIEQIAEBor3+DIjpAvkuh+IjG/cozuQHUbvGWmmJmnSpz9eBco6V66FSu76
 hjJyVd14qr+PfHjapJGnGOOyesMRhfTwq9RWAxIZQ7uEwVQyAFOBqS1pNnASjff60cff
 Eva7Ow/IjvB6ELOO1RTn1L9mRaTFbtgW7gc2JV1s+ENcNAryNdExC7cxW6fEZQzzlV5p
 a50A==
X-Gm-Message-State: AOAM533IqKGrkkaYTqzPP8mraWSs4wXqsoW4NAwNg/sn3TSwX44iAFHN
 nyQCgJchel8YLui9ANMtq8m3EYEV/ms=
X-Google-Smtp-Source: ABdhPJzOTJjijete+pTCaiWqoO5uBlcvn/fgCXQtTjLINmZn+W5bdqKEcJv6XJSxpaGLYQFUtV5Ncw==
X-Received: by 2002:adf:e684:: with SMTP id r4mr1259495wrm.229.1631467653257; 
 Sun, 12 Sep 2021 10:27:33 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o12sm4262854wms.15.2021.09.12.10.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:27:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/30] accel: Move has_work() from SysemuCPUOps to
 AccelOpsClass
Date: Sun, 12 Sep 2021 19:27:01 +0200
Message-Id: <20210912172731.789788-1-f4bug@amsat.org>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review:=0D
- 0001-accel-tcg-Restrict-cpu_handle_halt-to-sysemu.patch=0D
- 0020-target-ppc-Introduce-PowerPCCPUClass-has_work.patch=0D
- 0021-target-ppc-Restrict-has_work-handlers-to-sysemu-and-.patch=0D
- 0026-target-sparc-Remove-pointless-use-of-CONFIG_TCG-defi.patch=0D
=0D
Hi,=0D
=0D
CPU has_work() is a per-accelerator handler. This series=0D
- explicit the KVM / WHPX implementations=0D
- moves TCG implementations in AccelOpsClass=0D
- explicit missing implementations (returning 'false').=0D
=0D
Since v3:=0D
- Remove pointless CONFIG_TCG uses (rth)=0D
- Rework PPC patches, still using indirection=0D
=0D
Since v2:=0D
- Full rewrite, no more RFC.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (30):=0D
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
 accel/tcg/tcg-accel-ops.c         | 12 ++++++++++=0D
 accel/xen/xen-all.c               |  6 +++++=0D
 hw/core/cpu-common.c              |  6 -----=0D
 softmmu/cpus.c                    | 10 ++++++---=0D
 target/alpha/cpu.c                |  4 +++-=0D
 target/arm/cpu.c                  |  7 ++++--=0D
 target/avr/cpu.c                  |  2 +-=0D
 target/cris/cpu.c                 |  4 +++-=0D
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
 36 files changed, 179 insertions(+), 86 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

