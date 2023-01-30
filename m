Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE0F681909
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqD-0000zK-0x; Mon, 30 Jan 2023 13:25:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq5-0000yP-Tl
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYq2-0008C9-Of
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id a3so5288009wrt.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=KTUZj6OwTzx4KnfWCe+7Mw0jDxWQUK6APccDZAtmbdo=;
 b=ypxKx5yTJW/VJn8GqVpjT8fbdq8taNAKII9x8Wqxk9OiJMrhQkjAmIVunNbE/AcRfW
 Z1gCVEyUMhJ9CKOKAGFAsZi9LhYA5354peHXWEObOixaS2yN8t7g/2BXMyjRvCAgqD4I
 Vy/Ymn8+kEmfceXFAPD10AFNoJ5w+8VDlW9vbJMRXQJTfR3+UBbvvYCupa6B2GQfWZU/
 AQ1Cf+0sDy9ggZlfuVldY9w9g68d9QHBagIVex0kQzhUZuj8+PqEoog47evFs0Vxys3+
 1U3onAMbmQw+5jC8MQpIF+y5zs67TxurtESk4CfU7TH+Ys9XX2qh5gCbiBQh+h+HuST3
 5K4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KTUZj6OwTzx4KnfWCe+7Mw0jDxWQUK6APccDZAtmbdo=;
 b=q2zrz5UgGPf4ogbThbJ3Cqrdkez79SBDAW4OBKyFRsKdCXq+AUHQQt/zWgJwajs3cl
 QGgWd3O3tZMPFMRGXE2Pgo3TA+5ggRqa1mKRc2bYRQJwryFjAp5Cz0KBXRfqeWmOdCxI
 +QrhXkU6IX/sOBg2n+DIBjkXTV/h0Uzj7CY0Lu6B85fi+W/7TPcneFzCWXe7sa6uI8cH
 KJCP2XjRwbMTfUnyyOxiprl45Qjoqh/R1CnGmAkI+Wnc8lUfSfkJq8oGWflOhIqLBSNv
 pPo1zleCzji+yWSvv3FCC5AOcA5/+3JRTV0uI/0nFSxPK4F1Z1PKasJmhZ/0asOpjKfl
 zAUQ==
X-Gm-Message-State: AO0yUKVzX81KIiKy4YJwGztb+2wCmbWrNYLadudxUCeXTsab7TANEqsF
 OLoSLvcy0VJdpphPIR6+BdBdSQ==
X-Google-Smtp-Source: AK7set+rv81cTGFe6MKIspEYScLP3G8/18Mtxj6Qd+acpRvXIRG9g2jxvCPa1DV3vngc3/q1gybgSg==
X-Received: by 2002:a5d:404c:0:b0:2bf:e7c1:46d1 with SMTP id
 w12-20020a5d404c000000b002bfe7c146d1mr6091409wrp.50.1675103101217; 
 Mon, 30 Jan 2023 10:25:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/23] target/arm: Implement FEAT_FGT fine-grained traps
Date: Mon, 30 Jan 2023 18:24:36 +0000
Message-Id: <20230130182459.3309057-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

This series implements the FEAT_FGT fine-grained traps architectural
feature. The bulk of this is new system registers HFGRTR_EL2, HFGWTR_EL2,
HFGITR_EL2, HDFGRTR_EL2, HDFGWTR_EL2, which have bits that enable
trapping of system register and system instruction accesses on a
fine-grained basis (typically one or a few sysregs at a time).

Changes v1->v2:
 * patch 6 updated to use RTH's suggestion of doing the check
   inline rather than in a helper function
 * all other patches are already reviewed

In theory we could implement this with our existing ARMCPRegInfo::accessfn
machinery, but we would end up with many many very nearly identical
access functions. Instead this series adds a new ARMCPRegInfo::fgt
field, which specifies which bit in which FGT register should be
checked; this is then tested by code in the access_check_cp_reg
helper function.

A few bits in HFGITR_EL2 allow trapping of instructions which aren't
handled by the ARMCPRegInfo mechanism: ERET and SVC. These we just
implement "by hand". FEAT_FGT also adds new MDCR_EL3.TDCC and
MDCR_EL2.TDCC bits for trapping the Debug Comms Channel registers;
these we implement with a standard accessfn.

The first seven patches are various cleanups and bugfixes that
I noticed while I was doing the FEAT_FGT work. In particular, we
weren't getting the priority of HSTR_EL2 traps right -- these should
take priority over UNDEF-at-EL traps but not over UNDEF-at-EL0 traps.
The rest of the series is FEAT_FGT itself.

thanks
-- PMM

Peter Maydell (23):
  target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs correctly
  target/arm: Correct syndrome for ATS12NSO* at Secure EL1
  target/arm: Remove CP_ACCESS_TRAP_UNCATEGORIZED_{EL2, EL3}
  target/arm: Move do_coproc_insn() syndrome calculation earlier
  target/arm: All UNDEF-at-EL0 traps take priority over HSTR_EL2 traps
  target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1
  target/arm: Disable HSTR_EL2 traps if EL2 is not enabled
  target/arm: Define the FEAT_FGT registers
  target/arm: Implement FGT trapping infrastructure
  target/arm: Mark up sysregs for HFGRTR bits 0..11
  target/arm: Mark up sysregs for HFGRTR bits 12..23
  target/arm: Mark up sysregs for HFGRTR bits 24..35
  target/arm: Mark up sysregs for HFGRTR bits 36..63
  target/arm: Mark up sysregs for HDFGRTR bits 0..11
  target/arm: Mark up sysregs for HDFGRTR bits 12..63
  target/arm: Mark up sysregs for HFGITR bits 0..11
  target/arm: Mark up sysregs for HFGITR bits 12..17
  target/arm: Mark up sysregs for HFGITR bits 18..47
  target/arm: Mark up sysregs for HFGITR bits 48..63
  target/arm: Implement the HFGITR_EL2.ERET trap
  target/arm: Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 traps
  target/arm: Implement MDCR_EL2.TDCC and MDCR_EL3.TDCC traps
  target/arm: Enable FEAT_FGT on '-cpu max'

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpregs.h           | 484 +++++++++++++++++++++++++++++++++-
 target/arm/cpu.h              |  18 ++
 target/arm/internals.h        |  20 ++
 target/arm/syndrome.h         |  10 +
 target/arm/translate.h        |   6 +
 hw/intc/arm_gicv3_cpuif.c     |   2 +
 target/arm/cpu64.c            |   1 +
 target/arm/debug_helper.c     |  46 +++-
 target/arm/helper.c           | 245 ++++++++++++++++-
 target/arm/op_helper.c        |  58 +++-
 target/arm/translate-a64.c    |  22 +-
 target/arm/translate.c        | 125 +++++----
 13 files changed, 974 insertions(+), 64 deletions(-)

-- 
2.34.1


