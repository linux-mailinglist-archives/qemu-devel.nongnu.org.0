Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991ED5649CB
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 22:54:33 +0200 (CEST)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o86bw-0004yH-8P
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 16:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pali@kernel.org>)
 id 1o85d5-0007sw-U5; Sun, 03 Jul 2022 15:51:39 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:47096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pali@kernel.org>)
 id 1o85d3-0002c1-MI; Sun, 03 Jul 2022 15:51:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C9CCC611AF;
 Sun,  3 Jul 2022 19:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8381C341CB;
 Sun,  3 Jul 2022 19:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656877887;
 bh=dYbAk4ZbTZaQETY3C428c/kh75PdrCFUkU6Dw7Qv5/s=;
 h=From:To:Cc:Subject:Date:From;
 b=nCm3NyxbI1u+M10pp/D4tCeI9UNcWFQxAgZ7AF4fFkYJmGAXNcLwnx0KX8Gjveu93
 0thJXD8ZkC2m2wLfkoxz1dJ7C9u4ZRmep6mFfmYobBY4uA/bfCXSoZf9yuk/eajMNQ
 wohzWAQZ6h+edeG49X2CJiIjBNDkbfLmj2T+LOKhu5ABj/VnIVgmcaCyUaiTbECnIu
 YtAwit0NMad/2xPTfyBTzusrzj5L1QJNb0BQiuRLF09Ecwo156GWaEBOor/8L6PtdB
 6z3xZi/mRmkNqWgLn3MCBw5666Rq2/8dc+PFdP7jYXSwey1dArNPXckRSt0uerj9IM
 UBTri+X1Dt9lg==
Received: by pali.im (Postfix)
 id E01A211B0; Sun,  3 Jul 2022 21:51:23 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Cc: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Fix MPC8555 and MPC8560 core type to e500v1
Date: Sun,  3 Jul 2022 21:50:29 +0200
Message-Id: <20220703195029.23793-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=pali@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 03 Jul 2022 16:53:07 -0400
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

Commit 80d11f4467c4 ("Add definitions for Freescale PowerPC implementations")
changed core type of MPC8555 and MPC8560 from e500v1 to e500v2.

But both MPC8555 and MPC8560 have just e500v1 cores, there are no features
of e500v2 cores. It can be verified by reading NXP documentations:
https://www.nxp.com/docs/en/data-sheet/MPC8555EEC.pdf
https://www.nxp.com/docs/en/data-sheet/MPC8560EC.pdf
https://www.nxp.com/docs/en/reference-manual/MPC8555ERM.pdf
https://www.nxp.com/docs/en/reference-manual/MPC8560RM.pdf

Therefore fix core type of MPC8555 and MPC8560 back to e500v1.

Fixes: 80d11f4467c4 ("Add definitions for Freescale PowerPC implementations")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 target/ppc/cpu-models.c | 14 +++++++-------
 target/ppc/cpu-models.h | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 976be5e0d171..44a2710c5843 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -385,19 +385,19 @@
     POWERPC_DEF_SVR("mpc8548e_v21", "MPC8548E v2.1",
                     CPU_POWERPC_MPC8548E_v21, POWERPC_SVR_8548E_v21, e500v2)
     POWERPC_DEF_SVR("mpc8555_v10", "MPC8555 v1.0",
-                    CPU_POWERPC_MPC8555_v10,  POWERPC_SVR_8555_v10,  e500v2)
+                    CPU_POWERPC_MPC8555_v10,  POWERPC_SVR_8555_v10,  e500v1)
     POWERPC_DEF_SVR("mpc8555_v11", "MPC8555 v1.1",
-                    CPU_POWERPC_MPC8555_v11,  POWERPC_SVR_8555_v11,  e500v2)
+                    CPU_POWERPC_MPC8555_v11,  POWERPC_SVR_8555_v11,  e500v1)
     POWERPC_DEF_SVR("mpc8555e_v10", "MPC8555E v1.0",
-                    CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10, e500v2)
+                    CPU_POWERPC_MPC8555E_v10, POWERPC_SVR_8555E_v10, e500v1)
     POWERPC_DEF_SVR("mpc8555e_v11", "MPC8555E v1.1",
-                    CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11, e500v2)
+                    CPU_POWERPC_MPC8555E_v11, POWERPC_SVR_8555E_v11, e500v1)
     POWERPC_DEF_SVR("mpc8560_v10", "MPC8560 v1.0",
-                    CPU_POWERPC_MPC8560_v10,  POWERPC_SVR_8560_v10,  e500v2)
+                    CPU_POWERPC_MPC8560_v10,  POWERPC_SVR_8560_v10,  e500v1)
     POWERPC_DEF_SVR("mpc8560_v20", "MPC8560 v2.0",
-                    CPU_POWERPC_MPC8560_v20,  POWERPC_SVR_8560_v20,  e500v2)
+                    CPU_POWERPC_MPC8560_v20,  POWERPC_SVR_8560_v20,  e500v1)
     POWERPC_DEF_SVR("mpc8560_v21", "MPC8560 v2.1",
-                    CPU_POWERPC_MPC8560_v21,  POWERPC_SVR_8560_v21,  e500v2)
+                    CPU_POWERPC_MPC8560_v21,  POWERPC_SVR_8560_v21,  e500v1)
     POWERPC_DEF_SVR("mpc8567", "MPC8567",
                     CPU_POWERPC_MPC8567,      POWERPC_SVR_8567,      e500v2)
     POWERPC_DEF_SVR("mpc8567e", "MPC8567E",
diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
index 76775a74a9b6..1326493a9a05 100644
--- a/target/ppc/cpu-models.h
+++ b/target/ppc/cpu-models.h
@@ -184,13 +184,13 @@ enum {
 #define CPU_POWERPC_MPC8548E_v11     CPU_POWERPC_e500v2_v11
 #define CPU_POWERPC_MPC8548E_v20     CPU_POWERPC_e500v2_v20
 #define CPU_POWERPC_MPC8548E_v21     CPU_POWERPC_e500v2_v21
-#define CPU_POWERPC_MPC8555_v10      CPU_POWERPC_e500v2_v10
-#define CPU_POWERPC_MPC8555_v11      CPU_POWERPC_e500v2_v11
-#define CPU_POWERPC_MPC8555E_v10     CPU_POWERPC_e500v2_v10
-#define CPU_POWERPC_MPC8555E_v11     CPU_POWERPC_e500v2_v11
-#define CPU_POWERPC_MPC8560_v10      CPU_POWERPC_e500v2_v10
-#define CPU_POWERPC_MPC8560_v20      CPU_POWERPC_e500v2_v20
-#define CPU_POWERPC_MPC8560_v21      CPU_POWERPC_e500v2_v21
+#define CPU_POWERPC_MPC8555_v10      CPU_POWERPC_e500v1_v20
+#define CPU_POWERPC_MPC8555_v11      CPU_POWERPC_e500v1_v20
+#define CPU_POWERPC_MPC8555E_v10     CPU_POWERPC_e500v1_v20
+#define CPU_POWERPC_MPC8555E_v11     CPU_POWERPC_e500v1_v20
+#define CPU_POWERPC_MPC8560_v10      CPU_POWERPC_e500v1_v10
+#define CPU_POWERPC_MPC8560_v20      CPU_POWERPC_e500v1_v20
+#define CPU_POWERPC_MPC8560_v21      CPU_POWERPC_e500v1_v20
 #define CPU_POWERPC_MPC8567          CPU_POWERPC_e500v2_v22
 #define CPU_POWERPC_MPC8567E         CPU_POWERPC_e500v2_v22
 #define CPU_POWERPC_MPC8568          CPU_POWERPC_e500v2_v22
-- 
2.20.1


