Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0D9687CE7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 13:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNYLu-0005ss-Cv; Thu, 02 Feb 2023 07:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNYL4-0005pQ-0g
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:21 -0500
Received: from doohan.uni-paderborn.de ([2001:638:502:c003::16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNYL0-0006Kc-4p
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 07:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w/4+6AcdXkqfzhjret0FUKEnAHTU1o55A3bXoLdNKrE=; b=rvhXTdCE+b93NI9dQBZuvxtZaH
 2T85JRUKQXEnCyd3bG9mLDTy/wsGwC/rgvyHRawtsDHS/5rkUahzxkvPRMM7qJ62DIQvYLIFhQKUx
 DB4rhphVlhjMU7rbj0rYuUS8Yvq1Wg3Sj2d0TsFabwcqBLdrgoD7/PRH+xFAWC8P1Nkw=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de, anton.kochkov@proton.me,
 richard.henderson@linaro.org
Subject: [PATCH v2 00/10] TriCore instruction bugfixes
Date: Thu,  2 Feb 2023 13:04:22 +0100
Message-Id: <20230202120432.1268-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Intern
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.2.115717, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::16;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=doohan.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

while resolving [1], I noticed a few more bugs in DEXTR and LD_BU_PREINC which
this patch series fixes.

I also included the solo patch [2] into this series.

For v2 I added testcases in tests/tcg/tricore that exercise the errors
that these patches fix.

Cheers,
Bastian

[1] https://gitlab.com/qemu-project/qemu/-/issues/653
[2] https://lore.kernel.org/qemu-devel/20230113123759.677960-1-kbastian@mail.uni-paderborn.de/

Bastian Koppelmann (10):
  target/tricore: Fix OPC2_32_RCRW_IMASK translation
  tests/tcg/tricore: Add test for OPC2_32_RCRW_IMASK
  target/tricore: Fix OPC2_32_RCRW_INSERT translation
  tests/tcg/tricore: Add test for OPC2_32_RCRW_INSERT
  target/tricore: Fix RRPW_DEXTR
  tests/tcg/tricore: Add tests for RRPW_DEXTR
  target/tricore: Fix OPC2_32_RRRR_DEXTR
  tests/tcg/tricore: Add OPC2_32_RRRR_DEXTR tests
  target/tricore: Fix OPC2_32_BO_LD_BU_PREINC
  tests/tcg/tricore: Add LD.BU tests

 target/tricore/translate.c                | 39 ++++++------
 tests/tcg/tricore/Makefile.softmmu-target |  4 ++
 tests/tcg/tricore/macros.h                | 63 +++++++++++++++++--
 tests/tcg/tricore/test_dextr.S            | 75 +++++++++++++++++++++++
 tests/tcg/tricore/test_imask.S            | 10 +++
 tests/tcg/tricore/test_insert.S           |  9 +++
 tests/tcg/tricore/test_ld_bu.S            | 15 +++++
 7 files changed, 193 insertions(+), 22 deletions(-)
 create mode 100644 tests/tcg/tricore/test_dextr.S
 create mode 100644 tests/tcg/tricore/test_imask.S
 create mode 100644 tests/tcg/tricore/test_insert.S
 create mode 100644 tests/tcg/tricore/test_ld_bu.S

-- 
2.39.1


