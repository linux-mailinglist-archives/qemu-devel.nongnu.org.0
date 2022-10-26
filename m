Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B776C60E904
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:32:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onm3L-0000Nc-I0; Wed, 26 Oct 2022 15:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1onm3J-0008Mt-Ef; Wed, 26 Oct 2022 15:27:01 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1onm3H-0003oy-PD; Wed, 26 Oct 2022 15:27:01 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 26 Oct 2022 16:26:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 40BD88001F1;
 Wed, 26 Oct 2022 16:26:36 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [RFC PATCH v2 5/5] target/ppc: Enable hardfpu for Power
Date: Wed, 26 Oct 2022 16:25:48 -0300
Message-Id: <20221026192548.67303-6-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026192548.67303-1-victor.colombo@eldorado.org.br>
References: <20221026192548.67303-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Oct 2022 19:26:36.0734 (UTC)
 FILETIME=[DD63BDE0:01D8E970]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Change the build conditional from softfloat.c, allowing TARGET_PPC
to use hardfpu. For PPC, this is only implemented in linux-user.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 fpu/softfloat.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c7454c3eb1..f395096275 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -220,11 +220,13 @@ GEN_INPUT_FLUSH3(float64_input_flush3, float64)
  * the use of hardfloat, since hardfloat relies on the inexact flag being
  * already set.
  */
-#if defined(TARGET_PPC) || defined(__FAST_MATH__)
-# if defined(__FAST_MATH__)
-#  warning disabling hardfloat due to -ffast-math: hardfloat requires an exact \
+#if defined(__FAST_MATH__)
+# warning disabling hardfloat due to -ffast-math: hardfloat requires an exact \
     IEEE implementation
-# endif
+# define QEMU_NO_HARDFLOAT 1
+# define QEMU_SOFTFLOAT_ATTR QEMU_FLATTEN
+#elif defined(TARGET_PPC) && (!defined(CONFIG_USER_ONLY) || !defined(CONFIG_LINUX_USER))
+/* In PPC hardfloat only works for linux-user */
 # define QEMU_NO_HARDFLOAT 1
 # define QEMU_SOFTFLOAT_ATTR QEMU_FLATTEN
 #else
-- 
2.25.1


