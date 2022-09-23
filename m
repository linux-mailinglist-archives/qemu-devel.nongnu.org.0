Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D075E7651
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 10:58:01 +0200 (CEST)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obeVU-0003kE-M3
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 04:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMK-00059M-E9; Fri, 23 Sep 2022 04:48:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMB-0005Ho-Dk; Fri, 23 Sep 2022 04:48:28 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm575q84z4xGQ;
 Fri, 23 Sep 2022 18:48:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm543SyDz4x1L;
 Fri, 23 Sep 2022 18:48:08 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/6] aspeed: avocado test boosts
Date: Fri, 23 Sep 2022 10:47:57 +0200
Message-Id: <20220923084803.498337-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hello,

Alex's patchset [1] showed that by avoiding the class cast checkers in
hot code paths, performance is greatly improved. See results below.

This is a partial resend of [1] plus an extra caching a reference on
the AspeedSMC class, which adds an extra 10% boost.

Thanks ,

C.

[1] http://patchwork.ozlabs.org/project/qemu-devel/list/?series=313458


On a ThinkPad T480 i7-8650U, 

Before :

$ build/tests/venv/bin/avocado --show=app run build/tests/avocado/machine_aspeed.py
    ...
   (1/7) AST1030Machine.test_ast1030_zephyros: PASS (0.21 s)
   (2/7) AST2x00Machine.test_arm_ast2400_palmetto_openbmc_v2_9_0: PASS (23.51 s)
   (3/7) AST2x00Machine.test_arm_ast2500_romulus_openbmc_v2_9_0: PASS (39.59 s)
   (4/7) AST2x00Machine.test_arm_ast2500_evb_buildroot: PASS (23.74 s)
   (5/7) AST2x00Machine.test_arm_ast2600_evb_buildroot: PASS (34.44 s)
   (6/7) AST2x00MachineSDK.test_arm_ast2500_evb_sdk: PASS (91.13 s)
   (7/7) AST2x00MachineSDK.test_arm_ast2600_evb_sdk: PASS (112.27 s)
  RESULTS    : PASS 7 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 325.72 s

After :

  $ build/tests/venv/bin/avocado --show=app run build/tests/avocado/machine_aspeed.py
    ...
   (1/7) AST1030Machine.test_ast1030_zephyros: PASS (0.22 s)
   (2/7) AST2x00Machine.test_arm_ast2400_palmetto_openbmc_v2_9_0: PASS (12.44 s)
   (3/7) AST2x00Machine.test_arm_ast2500_romulus_openbmc_v2_9_0: PASS (13.98 s)
   (4/7) AST2x00Machine.test_arm_ast2500_evb_buildroot: PASS (11.74 s)
   (5/7) AST2x00Machine.test_arm_ast2600_evb_buildroot: PASS (15.90 s)
   (6/7) AST2x00MachineSDK.test_arm_ast2500_evb_sdk: PASS (66.75 s)
   (7/7) AST2x00MachineSDK.test_arm_ast2600_evb_sdk: PASS (82.34 s)
  RESULTS    : PASS 7 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 204.33 s
  
  


Alex Bennée (4):
  cpu: cache CPUClass in CPUState for hot code paths
  hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
  cputlb: used cached CPUClass in our hot-paths
  ssi: cache SSIPeripheralClass to avoid GET_CLASS()

Cédric Le Goater (2):
  tests/avocado/machine_aspeed.py: Fix typos on buildroot
  aspeed/smc: Cache AspeedSMCClass

 include/hw/core/cpu.h           |  9 +++++++++
 include/hw/ssi/aspeed_smc.h     |  2 ++
 include/hw/ssi/ssi.h            |  3 +++
 accel/tcg/cputlb.c              | 15 ++++++---------
 cpu.c                           |  9 ++++-----
 hw/core/cpu-sysemu.c            |  5 ++---
 hw/ssi/aspeed_smc.c             |  9 ++++-----
 hw/ssi/ssi.c                    | 18 ++++++++----------
 tests/avocado/machine_aspeed.py | 16 ++++++++--------
 9 files changed, 46 insertions(+), 40 deletions(-)

-- 
2.37.3


