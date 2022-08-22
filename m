Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E817A59C246
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:14:10 +0200 (CEST)
Received: from localhost ([::1]:60716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ97w-0005Yf-Uh
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ94a-00005p-U9
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:10:41 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ94Z-0003ph-0T
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:10:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 r83-20020a1c4456000000b003a5cb389944so7953974wma.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Gfz0HnW6RMeLFEqq6r6/F6DhHZBpETiLd+4QXjFIXZI=;
 b=wdsiJcXYnaXesZhaSg6aGup//VqRkkoHoSgpTEQjdinE7wUxGMfx97MC0HJKac7zO4
 KLVjvWaFxSs/Y/7T1QznPolQjuO8CTamQNoohlKHYYkvmQ5jWcNBX89omjTeHz7H/2qG
 GtcM0DNUPPHiJM4jrlh/sXzVAkuJ7e60lbX/6aI41QRuJiwIJIXOccJYs0gxMhauKLie
 FAtyO7QCoZ2Rs0fOsdU05ko+LghdGodHS02aR9ztk7jGREmvgNFdzGMNo7sDy7LFgIne
 w5lQQp+Y4w+yxyLVE3Sv2+Qwi5UUBU2lQqp9Cj6V9kkG3zGongKEQuDjpTylZE+xnjUS
 joBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Gfz0HnW6RMeLFEqq6r6/F6DhHZBpETiLd+4QXjFIXZI=;
 b=Tu1aUjXibuSESWEgyjLUkHTAVuQrgSUjtwZ6aL3OkhGxmZ4k89kUsBAGNd4hpnvews
 VGRVJLTxCvvCKj0K01Djnv43AT9qwxC4rB1sWG2jWpGuDshU7s+2Zg81HRuJqb+PgTPc
 sKWrO8NY9yh3eVc+R/uir3Z+W55U9X4PZlYjGd4cL3HK/V3KfkberMrW4xp/3GdmQSZW
 HtEIZyidpYS9RYGD8Q78ONAiz0rLPWIfx8+liKWm+XuamQdbEoMApXKkRRLQQW9O4I6b
 Jf/eBM0HkBJdtS/GDbgOIm2GPPNaNko8uljNpBdSMXU/2bkPWvMIIj/XuFKtI6YUKBm1
 NMkg==
X-Gm-Message-State: ACgBeo0sYwbirsj/2g+MfdwJ3Evq8qJzLh/LrpymXorw+XEBu7tZMsfk
 jR0RvHi5dRdlFcuRvmOR5Dhgs/eI1OfjZg==
X-Google-Smtp-Source: AA6agR4VJB9iciT83iCEiW5paNkBQM19WgiOpzLvZXBVu7NlDGZ6xleRIKlcSBzokVw0iXHvB+RAmA==
X-Received: by 2002:a05:600c:254:b0:3a5:a401:a1e2 with SMTP id
 20-20020a05600c025400b003a5a401a1e2mr14859295wmj.14.1661177553937; 
 Mon, 22 Aug 2022 07:12:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh16-20020a05600c3d1000b003a3561d4f3fsm15184908wmb.43.2022.08.22.07.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 07:12:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
Subject: [PATCH v2 0/7] Allow semihosting from user mode
Date: Mon, 22 Aug 2022 15:12:23 +0100
Message-Id: <20220822141230.3658237-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently our semihosting implementations usually prohibit use of
semihosting calls in system emulation from the guest userspace.  This
is a very long standing behaviour justified originally "to provide
some semblance of security" (since code with access to the semihosting
ABI can do things like read and write arbitrary files on the host
system).  However, it is sometimes useful to be able to run trusted
guest code which performs semihosting calls from guest userspace,
notably for test code.

This patchset adds a command line suboption to the existing
semihosting-config option group so that you can explicitly opt in to
semihosting from guest userspace with "-semihosting-config
userspace=on".

It also brings all our target architectures into line about
how they handle semihosting. Currently these fall into three
different groups:

 * semihosting permitted only in privileged mode and only
   if enabled on the command line:
   - arm
   - m68k
 * semihosting permitted in any mode, if enabled on the command line:
   - mips
   - nios2
   - xtensa
 * semihosting permitted only in privileged mode, but fails
   to honour the existing "enable semihosting" option, instead
   enabling it all the time:
   - riscv

The effect of the new option for group 1 is:
 * user can now optionally also allow semihosting in usermode

For group 2 it is:
 * usermode semihosting used to be permitted, but now changes
   to default-disabled, needing explicit enablement

For group 3 it is:
 * semihosting overall used to be default-enabled and is
   now default-disabled, needing explicit enablement.
   Semihosting in usermode can also be enabled.

That means this is a "things that used to work no longer do
unless you change your commandline" change for groups 2 and 3
(so, mips, nios2. xtensa, riscv). Consensus seems to be that
it's OK to call this "fixing a bug" and note it in the
changelog/releasenotes.

Changes v1->v2:
 * make riscv check for semihosting being disabled at
   translate time, not runtime

Only patch 7 needs review.

thanks
-- PMM

Peter Maydell (7):
  semihosting: Allow optional use of semihosting from userspace
  target/arm: Honour -semihosting-config userspace=on
  target/m68k: Honour -semihosting-config userspace=on
  target/mips: Honour -semihosting-config userspace=on
  target/nios2: Honour -semihosting-config userspace=on
  target/xtensa: Honour -semihosting-config userspace=on
  target/riscv: Honour -semihosting-config userspace=on and enable=on

 include/semihosting/semihost.h                 | 10 ++++++++--
 semihosting/config.c                           | 10 ++++++++--
 softmmu/vl.c                                   |  2 +-
 stubs/semihost.c                               |  2 +-
 target/arm/translate-a64.c                     | 12 +-----------
 target/arm/translate.c                         | 16 ++++------------
 target/m68k/op_helper.c                        |  3 +--
 target/mips/tcg/translate.c                    |  9 +++++----
 target/nios2/translate.c                       |  3 ++-
 target/riscv/cpu_helper.c                      |  9 +++------
 target/riscv/translate.c                       |  1 +
 target/xtensa/translate.c                      |  7 ++++---
 target/mips/tcg/micromips_translate.c.inc      |  6 +++---
 target/mips/tcg/mips16e_translate.c.inc        |  2 +-
 target/mips/tcg/nanomips_translate.c.inc       |  4 ++--
 target/riscv/insn_trans/trans_privileged.c.inc |  3 ++-
 qemu-options.hx                                | 11 +++++++++--
 17 files changed, 56 insertions(+), 54 deletions(-)

-- 
2.25.1


