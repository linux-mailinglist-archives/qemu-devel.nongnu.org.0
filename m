Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B71B3F8A01
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:19:40 +0200 (CEST)
Received: from localhost ([::1]:35168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJGEF-0007zf-LQ
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJGBT-0006Oi-Px; Thu, 26 Aug 2021 10:16:47 -0400
Received: from [201.28.113.2] (port=2975 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mJGBS-0003xy-EX; Thu, 26 Aug 2021 10:16:47 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 26 Aug 2021 11:15:26 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id BA959800930;
 Thu, 26 Aug 2021 11:15:25 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 2/2] target/ppc: fix vextu[bhw][lr]x helpers
Date: Thu, 26 Aug 2021 11:14:46 -0300
Message-Id: <20210826141446.2488609-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826141446.2488609-1-matheus.ferst@eldorado.org.br>
References: <20210826141446.2488609-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Aug 2021 14:15:26.0155 (UTC)
 FILETIME=[D0E1F9B0:01D79A84]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, f4bug@amsat.org,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

These helpers shouldn't depend on the host endianness, as they only use
shifts, ands, and int128_* methods.

Fixes: 60caf2216bf0 ("target-ppc: add vextu[bhw][lr]x instructions")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/int_helper.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index efa833ef64..c2d3248d1e 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1492,34 +1492,16 @@ void helper_vlogefp(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *b)
     }
 }
 
-#if defined(HOST_WORDS_BIGENDIAN)
-#define VEXTU_X_DO(name, size, left)                                \
-    target_ulong glue(helper_, name)(target_ulong a, ppc_avr_t *b)  \
-    {                                                               \
-        int index;                                                  \
-        if (left) {                                                 \
-            index = (a & 0xf) * 8;                                  \
-        } else {                                                    \
-            index = ((15 - (a & 0xf) + 1) * 8) - size;              \
-        }                                                           \
-        return int128_getlo(int128_rshift(b->s128, index)) &        \
-            MAKE_64BIT_MASK(0, size);                               \
-    }
-#else
-#define VEXTU_X_DO(name, size, left)                                \
-    target_ulong glue(helper_, name)(target_ulong a, ppc_avr_t *b)  \
-    {                                                               \
-        int index;                                                  \
-        if (left) {                                                 \
-            index = ((15 - (a & 0xf) + 1) * 8) - size;              \
-        } else {                                                    \
-            index = (a & 0xf) * 8;                                  \
-        }                                                           \
-        return int128_getlo(int128_rshift(b->s128, index)) &        \
-            MAKE_64BIT_MASK(0, size);                               \
-    }
-#endif
-
+#define VEXTU_X_DO(name, size, left)                            \
+target_ulong glue(helper_, name)(target_ulong a, ppc_avr_t *b)  \
+{                                                               \
+    int index = (a & 0xf) * 8;                                  \
+    if (left) {                                                 \
+        index = 128 - index - size;                             \
+    }                                                           \
+    return int128_getlo(int128_rshift(b->s128, index)) &        \
+        MAKE_64BIT_MASK(0, size);                               \
+}
 VEXTU_X_DO(vextublx,  8, 1)
 VEXTU_X_DO(vextuhlx, 16, 1)
 VEXTU_X_DO(vextuwlx, 32, 1)
-- 
2.25.1


