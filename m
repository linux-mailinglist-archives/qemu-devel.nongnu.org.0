Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDBF67ECD0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:57:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSwt-0000oP-Jv; Fri, 27 Jan 2023 12:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-0000mr-S6
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:31 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwT-0005yR-9m
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:15 -0500
Received: by mail-wr1-x434.google.com with SMTP id h16so5640615wrz.12
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=uvuf0K3RKNAPJETXJV9XevZKYErx9RVt5zxuzgDSynQ=;
 b=rVWb9Mgnv9uPZXJYiAAK+Uy3P8sm4aTdS2P//YzaHxe3p9K0A9vv3KpRnc4Aspfq7z
 m/m1OXfJNSqAVW3FKHuy6E+YIvY9qD8wtT94tjUfogTORWDhkpTFTIU56oxTJMCCIeoR
 WpZ/FsjyIVNZWWz8IbJoOCZWIrZE2iLcxgZMa1ds0FWIYosJtRh/BrKjFZn5mVydlq9S
 3gMnPEgxAQZi67k20hCzX+dyIFvAmxZVNDwYiis4q9KMS5omlcwn2Xph2XhgtzHM8XW2
 IDpGhZNxA1I98qzAtCGytu4KB8vvQiSmibRSwjkwIt9qkvHv2Fl+2IDD6UkdmjVJhv9h
 qSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uvuf0K3RKNAPJETXJV9XevZKYErx9RVt5zxuzgDSynQ=;
 b=oqU86xCJ1L2zMvhTIUFxDs7US71CiTeSBp7rBs7OIie0+/OcobNUdBE1bhJLwICA75
 JFyN3suhwT6fqvNRNWGr2UoBracqqPLDDI32gRmwk9j1mt+Qp1fJlBPo/bbwjodZzclO
 Cvw1n34BfnThlxht/DVo6ektBI1NDTC2n3sERnrTodvKYwBfssnCvtdRycUVsw3D/AGO
 WtGJcUiteVC2HKjhMwdIYAKzvtB85j9VHnpnH8glZ7dIzGmoSoS2+H4Er3hdl7BPQ5jS
 ilZbDBMqjcT5MXud4w1gsURFElT8OU5IJUdAy7jqEmoDX/ZBmnuhedaZC50wheI/RYd4
 drdg==
X-Gm-Message-State: AO0yUKV2zqRIR81DUOvBiCOMHuLZV8kM21BffG/zar3GIcBy6V1mxftd
 58UGE2ZA1qGobkzJ2kG1i1W2yzJ7XcQi8eb1
X-Google-Smtp-Source: AK7set9+XDwNlGt//ZAdPNSDiA0IR1fc2e7hx0uZfCOYiS4PVSNnmFsfudWTN+IpCDelQFonE+G0AA==
X-Received: by 2002:a5d:4951:0:b0:2bf:d425:11ba with SMTP id
 r17-20020a5d4951000000b002bfd42511bamr2806451wrs.22.1674842110542; 
 Fri, 27 Jan 2023 09:55:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/23] target/arm: Implement FEAT_FGT fine-grained traps
Date: Fri, 27 Jan 2023 17:54:44 +0000
Message-Id: <20230127175507.2895013-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
  target/arm: Remove CP_ACCESS_TRAP_UNCATEGORIZED_{EL2,EL3}
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
 target/arm/helper.h           |   1 +
 target/arm/internals.h        |  20 ++
 target/arm/syndrome.h         |  10 +
 target/arm/translate.h        |   6 +
 hw/intc/arm_gicv3_cpuif.c     |   2 +
 target/arm/cpu64.c            |   1 +
 target/arm/debug_helper.c     |  46 +++-
 target/arm/helper.c           | 245 ++++++++++++++++-
 target/arm/op_helper.c        |  65 ++++-
 target/arm/translate-a64.c    |  22 +-
 target/arm/translate.c        | 132 ++++++----
 14 files changed, 986 insertions(+), 67 deletions(-)

-- 
2.34.1


