Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F483F9519
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:29:28 +0200 (CEST)
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWIp-0007oI-SD
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW0U-0001Xj-Mp; Fri, 27 Aug 2021 03:10:30 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35601 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJW0S-0007Yn-Tc; Fri, 27 Aug 2021 03:10:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSZ6LQDz9ssD; Fri, 27 Aug 2021 17:09:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048190;
 bh=147H9+3QSwLTeEziBePQV7SwyFSR7Q9ng1E4ohJFjnM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gI5NN/gwRe9ifiTWOqF5IVvOENvmYVwC7ceuBvdLTmQ9Dxqq4YG8Ah7OLgl/mbN0I
 fy3HjiB225mCFuu080URyhYqFznvQbpYzNCybRI4u7fREzRBkrQTxHS6HfqcEd/wuD
 ujMptjhJ2sznVepq4u/c5ScoP0X6YAoc5LDjgahs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 16/18] target/ppc: fix vextu[bhw][lr]x helpers
Date: Fri, 27 Aug 2021 17:09:44 +1000
Message-Id: <20210827070946.219970-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

These helpers shouldn't depend on the host endianness, as they only use
shifts, ands, and int128_* methods.

Fixes: 60caf2216bf0 ("target-ppc: add vextu[bhw][lr]x instructions")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210826141446.2488609-3-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


