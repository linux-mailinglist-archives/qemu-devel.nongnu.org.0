Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866165F5717
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 17:05:57 +0200 (CEST)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og5y8-00079Y-AF
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 11:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1og5Xx-00066m-Lz; Wed, 05 Oct 2022 10:38:53 -0400
Received: from [200.168.210.66] (port=55228 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1og5Xu-0004bx-UI; Wed, 05 Oct 2022 10:38:53 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 5 Oct 2022 11:37:25 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id ADB6B8003B3;
 Wed,  5 Oct 2022 11:37:24 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [RFC PATCH 4/4] target/ppc: Enable hardfpu for Power
Date: Wed,  5 Oct 2022 11:37:19 -0300
Message-Id: <20221005143719.65241-5-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
References: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Oct 2022 14:37:25.0363 (UTC)
 FILETIME=[FC7DE430:01D8D8C7]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the build conditional from softfloat.c, allowing TARGET_PPC
to use hardfpu.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 fpu/softfloat.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c7454c3eb1..de94732f6a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -220,11 +220,9 @@ GEN_INPUT_FLUSH3(float64_input_flush3, float64)
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
 # define QEMU_NO_HARDFLOAT 1
 # define QEMU_SOFTFLOAT_ATTR QEMU_FLATTEN
 #else
-- 
2.25.1


