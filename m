Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B98532B8DE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 16:18:11 +0100 (CET)
Received: from localhost ([::1]:49874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHTGM-0005d2-FZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 10:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lHTF4-0004lY-0N; Wed, 03 Mar 2021 10:16:50 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221]:55822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lHTF2-0003pP-6B; Wed, 03 Mar 2021 10:16:49 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 28278260AD8;
 Wed,  3 Mar 2021 16:16:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqQziC_f4iEX; Wed,  3 Mar 2021 16:16:42 +0100 (CET)
Received: from puchatek.lan (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A366B2606A7;
 Wed,  3 Mar 2021 16:16:41 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
Date: Wed,  3 Mar 2021 16:16:34 +0100
Message-Id: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arm BSA (Base System Architecture) specification says:

B_PE_09: PEs must implement the FEAT_PMUv3p1 extension, and the base
system must expose a minimum of four programmable PMU counters to the
operating system.

B_PE_21: The base system must expose a minimum of two programmable PMU
counters to a hypervisor.

It is then repeated in SBSA (Server Base System Architecture)
specification in level 3 requirements:

Each PE must implement a minimum of six programmable PMU counters.

So let make QEMU provide those 6 PMU counters.

SBSA-ACS says now:

  12 : Check number of PMU counters      : Result:  PASS

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b9421..02e25b5c22 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -38,7 +38,7 @@
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
-#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
+#define PMCR_NUM_COUNTERS 6 /* QEMU IMPDEF choice */
 
 #ifndef CONFIG_USER_ONLY
 
-- 
2.29.2


