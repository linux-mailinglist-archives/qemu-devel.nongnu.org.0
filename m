Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9131038B348
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:32:06 +0200 (CEST)
Received: from localhost ([::1]:44760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkeb-0001mV-Ga
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbN-0007lJ-Dp
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbL-0000dM-Lv
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:45 -0400
Received: by mail-wr1-x433.google.com with SMTP id d11so18077146wrw.8
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anGLAxuF2ANNfuzvouPyHzw7PpS/Y9aRonPSrVr2uAQ=;
 b=y8diMeZwU2Rd7PyqCZyHP6zdGzkZWeH838l9sLvuicaSsG8gUMNPdnTHeWOcJH+4p8
 L7Iabcgi+WEeCbnu8+IeTymBBnCfSHq7GbMYqOaSI8iMYozPzZQOjhHZFSA+790TjVCj
 XmKmAku2xmKYiR/CF6AVAct97GfCReE/4CQ/0bUZZvwZaGFUNJcL8eg/QFIjK5Q/P/EN
 mtXff5/g/G3ysqebYyVY9r1eoOr3OsWeehOj8NmQV0TDKcdoGEA+bBq1/RFVce0I8RPG
 HOjMGtgC7NQbs9r6uCL3Fbl6Sx8gCii/Dp0kZcMYHaPrMi4JYpFU/CtxxjmDoPPy9l0E
 RxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anGLAxuF2ANNfuzvouPyHzw7PpS/Y9aRonPSrVr2uAQ=;
 b=kdhkxLRsYHxzGyKBuK5eR8mQddENQ8K7ILG2TLAiAPwigIfx5P3rbpKUg57pbwSUCG
 DdMekuYv9wPzn9ZizkkmWtHMEjtQR/rik+f44IVOPdBzuotK9N5epeMiYnZECbFVgFKG
 yiVzb3x7z85yJMY1n5MvY8JljPyTt4ZTvV0kUwzdh/gI82vFtNS8pBXJhSeANtBeYI/s
 Y2JVhcH+48b1LYw+05TbNVHkJmFzLhirpK2ouzuMSLKzDFoioLnWJnuXxSyi3SmhA0Hc
 mU83wNR+JrPjAO9NTg0GhwH15OUmVMFYS/tIX9OsUwMdQJUbil3dq/q+4Ihhvz/DgLya
 +soQ==
X-Gm-Message-State: AOAM5337SX1fmOzlViwYtkd8Se3FrDYIQ80Fg30KrjyZL8CIoShivCAq
 1MuEmAvam2904ERQ9SAdQigu0A==
X-Google-Smtp-Source: ABdhPJwAj0zyfpDI8l8a7ZUAt7pZ6d+RDpLZbdJBc0Tg2ns6zYGnDL1dspyu9BZIRz9BM0x34IYzSA==
X-Received: by 2002:a5d:414d:: with SMTP id c13mr4905066wrq.240.1621524522137; 
 Thu, 20 May 2021 08:28:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/9] target/arm: MVE preliminaries
Date: Thu, 20 May 2021 16:28:31 +0100
Message-Id: <20210520152840.24453-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset is a collection of easy preliminary MVE patches, which I
send out now just to try to avoid the MVE patchset landing as one
enormous series. These patches:
 * update feature checks on existing insns that should now check
   "if FP or MVE" rather than just "if FP"
 * fixes a minor non-guest-visible issue in fp_sysreg_checks()
 * adds support for reading and writing the MVE VPR register
 * makes FPSCR.LTPSIZE writable if MVE
 * makes FPSCR.QC exist for MVE
None of this code will be "live" yet, as no CPU sets the MVE ID
register fields.

The last patch is not MVE related but I've had it kicking about in a
private branch for a while now and it would be nice to have it
upstream even though we don't have an immediate in-tree use.  It just
makes the NS VTOR configurable by the board/SoC the same way the S
VTOR already is, which then matches the hardware.

thanks
-- PMM

Peter Maydell (9):
  target/arm: Add isar feature check functions for MVE
  target/arm: Update feature checks for insns which are "MVE or FP"
  target/arm: Move fpsp/fpdp isar check into callers of do_vfp_2op_sp/dp
  target/arm: Add MVE check to VMOV_reg_sp and VMOV_reg_dp
  target/arm: Fix return values in fp_sysreg_checks()
  target/arm: Implement M-profile VPR register
  target/arm: Make FPSCR.LTPSIZE writable for MVE
  target/arm: Enable FPSCR.QC bit for MVE
  target/arm: Allow board models to specify initial NS VTOR

 include/hw/arm/armv7m.h    |   2 +
 target/arm/cpu.h           |  33 ++++++++-
 hw/arm/armv7m.c            |   7 ++
 target/arm/cpu.c           |  10 +++
 target/arm/machine.c       |  20 ++++++
 target/arm/translate-vfp.c | 140 ++++++++++++++++++++++++++-----------
 target/arm/vfp_helper.c    |  12 ++--
 7 files changed, 179 insertions(+), 45 deletions(-)

-- 
2.20.1


