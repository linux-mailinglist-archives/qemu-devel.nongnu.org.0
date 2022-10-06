Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C558A5F6EF1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 22:24:08 +0200 (CEST)
Received: from localhost ([::1]:52360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXPb-0002r2-It
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 16:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogX9O-0002kE-CT; Thu, 06 Oct 2022 16:07:24 -0400
Received: from [200.168.210.66] (port=39047 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogX9L-0001fe-Ng; Thu, 06 Oct 2022 16:07:21 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 6 Oct 2022 17:07:03 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 891928002BE;
 Thu,  6 Oct 2022 17:07:03 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 3/6] target/ppc: fix REQUIRE_HV macro definition
Date: Thu,  6 Oct 2022 17:06:51 -0300
Message-Id: <20221006200654.725390-4-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Oct 2022 20:07:03.0823 (UTC)
 FILETIME=[33C921F0:01D8D9BF]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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

The macro is missing a '{' after the if condition. Any use of REQUIRE_HV
would cause a compilation error.

Fixes: fc34e81acd51 ("target/ppc: add macros to check privilege level")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index eaac8670b1..435066c4a3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6545,12 +6545,12 @@ static int64_t dw_compose_ea(DisasContext *ctx, int x)
         }                           \
     } while (0)
 
-#define REQUIRE_HV(CTX)                         \
-    do {                                        \
-        if (unlikely((CTX)->pr || !(CTX)->hv))  \
-            gen_priv_opc(CTX);                  \
-            return true;                        \
-        }                                       \
+#define REQUIRE_HV(CTX)                             \
+    do {                                            \
+        if (unlikely((CTX)->pr || !(CTX)->hv)) {    \
+            gen_priv_opc(CTX);                      \
+            return true;                            \
+        }                                           \
     } while (0)
 #else
 #define REQUIRE_SV(CTX) do { gen_priv_opc(CTX); return true; } while (0)
-- 
2.25.1


