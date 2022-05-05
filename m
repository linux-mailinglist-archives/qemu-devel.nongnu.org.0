Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAEA51B986
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 09:56:22 +0200 (CEST)
Received: from localhost ([::1]:41338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmWLV-0003ti-OX
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 03:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkei@sfc.wide.ad.jp>)
 id 1nmPYL-0005mz-JI; Wed, 04 May 2022 20:41:09 -0400
Received: from mail1.sfc.wide.ad.jp ([203.178.142.133]:36092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkei@sfc.wide.ad.jp>)
 id 1nmPYF-0008Gz-7C; Wed, 04 May 2022 20:41:07 -0400
Received: from localhost (h219-110-166-078.catv02.itscom.jp [219.110.166.78])
 (Authenticated sender: mkei)
 by mail1.sfc.wide.ad.jp (Postfix) with ESMTPSA id 6F03D1103;
 Thu,  5 May 2022 09:40:48 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sfc.wide.ad.jp;
 s=mail1; t=1651711248;
 bh=KSqF29AEingAgln34VcmqF+WeN8XhSc84wgbRg18ENE=;
 h=From:To:Cc:Subject:Date:From;
 b=GChMe9pfyG3UBlm6KQoGJS78+zIUHOY70V5iDzt+bciQOpw0gpd2tDeOFfj47WWPh
 E7EQ5Kpn/HkGMUJw26PTwsHxZwYE22G0OjEjCcl14ZPSCsVIuWgNsLLEQ8qLmyl9ch
 JAZrG6vOF5R6BlkpyWVCof5F/k30NwTJhWuoYHn++dj87E5dh4Sb5iyNGZwHcRFKON
 /uWye8X5E+JGLF+tqBXadjd7EbQ+enc3PWAVXT/PKyfdf1Es41rPJAiBWvPuh6G8cZ
 Az5+gbE0OPKaEhw7KfnvDTD+OER/Abat7XoWpzruQjqHXS5tEVf4lce8G+I7W+mZzl
 vJ6Q1NwR+z2ew==
From: mkei@sfc.wide.ad.jp
To: qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Keisuke Iida <mkei@sfc.wide.ad.jp>
Subject: [PATCH] target/arm: fix s2mmu input size check
Date: Thu,  5 May 2022 09:40:46 +0900
Message-Id: <20220505004046.6711-1-mkei@sfc.wide.ad.jp>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.178.142.133; envelope-from=mkei@sfc.wide.ad.jp;
 helo=mail1.sfc.wide.ad.jp
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 May 2022 03:52:33 -0400
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

From: Keisuke Iida <mkei@sfc.wide.ad.jp>

The maximum IPA size('inputsize') is constrained by the implemented PA size that is
specified by ID_AA64MMFR0_EL1.PARange. Please reference Arm Architecture Reference
Manual for A-profile architecture "Supported IPA size" on page D5-4788.

Signed-off-by: Keisuke Iida <mkei@sfc.wide.ad.jp>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5a244c3ed9..868e7a2c0b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11116,7 +11116,7 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         }
 
         /* Inputsize checks.  */
-        if (inputsize > outputsize &&
+        if (inputsize > arm_pamax(cpu) &&
             (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
             /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
             return false;
-- 
2.34.1


