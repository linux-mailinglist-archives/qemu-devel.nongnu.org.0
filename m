Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BD0569362
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:35:37 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BkG-0004Xv-3I
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMF-0000fO-9L; Wed, 06 Jul 2022 16:10:49 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:42651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMD-0003cZ-Pf; Wed, 06 Jul 2022 16:10:47 -0400
Received: by mail-vs1-xe35.google.com with SMTP id i186so16201044vsc.9;
 Wed, 06 Jul 2022 13:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ka+GqenWKO9U1GWgR7IlBfSIF7hFMPHj3lpA0rwTxcI=;
 b=Nf5J5+ypQC1nS7s6316jODSrsyyLnrIUALD+BYu1FeSf/yxIbbkQw49NozInMH4yWX
 fV0snDtUB1s62AM8bpmd1MfzzeJwYxXVhMyLrxWxQOeRgnr5rxP8fy6JWPqLRvD4YPzM
 17928GtQ75UQZ71qPoL9PlZhihdM2rf517XpBxkG83KRg/A/8Qnz3efU9oGileTmpdGw
 73/yvvK488g3RSAJIQmZ7xsxi2cqas47WNWtpvM0s8ryJcchW5AjRDhIPrKkN7OC+jIO
 0Oxr/eA9X6LQbG8sSN3t0ldp47/M0aYNKB54xVCCM/GhtvTg4YTotHlLI98rQeEDf3gl
 Fxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ka+GqenWKO9U1GWgR7IlBfSIF7hFMPHj3lpA0rwTxcI=;
 b=51Rmt/ECZrygwrFJAr7cvb8gLXvhenIBVSAMKFPxflhyCwwGnlDI5bQ1GO6aIEQMtu
 P7IOX/s0r6hPQseLZnNJ8pv/e0HAcXXCOPNX5SVH1+Wa/BbiLUuj38nDsvXSB2ZMl1Ws
 zQX0j1zoAP9ghx+XR0+x06qZRlvoER3NJYpFJUNp5zVMyZEg7Qyri4qZYZUxdH07xod5
 nwdTmUr6yX/5ZU5GBQpl8QpV/StzBrdcEyhIf+H/DT5Bybe5g+KHJxxearJ6U/om8Bcw
 lOheR+X1vA5j8JjODTlBcbUiNxubtLxh3VZ9BLUcHblm5G1CKWaRIG7BnTrjm0ubx+/b
 TJnQ==
X-Gm-Message-State: AJIora+tcMWU3OmG5imwZiAiNWFYPq/anjLp+usT0gzSXpbM1xLLKE2S
 eB2bd8TTjCcyWCtb9owLkUlbNH01G+E=
X-Google-Smtp-Source: AGRyM1u+cnS1uZWbAtKr1VD01zCPudYzBYNcKII9nRpj82MN9nA5ESeR0byJN59GoRx6FZWfZ/giMQ==
X-Received: by 2002:a05:6102:c07:b0:356:f9cc:b3b6 with SMTP id
 x7-20020a0561020c0700b00356f9ccb3b6mr6495345vss.34.1657138244528; 
 Wed, 06 Jul 2022 13:10:44 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 27/34] tests/tcg/ppc64: Add mffsce test
Date: Wed,  6 Jul 2022 17:09:39 -0300
Message-Id: <20220706200946.471114-28-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Add mffsce test to check both the return value and the new fpscr
stored in the cpu.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220629162904.105060-8-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/tcg/ppc64/Makefile.target   |  1 +
 tests/tcg/ppc64le/Makefile.target |  1 +
 tests/tcg/ppc64le/mffsce.c        | 37 +++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 tests/tcg/ppc64le/mffsce.c

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index babd209573..331fae628e 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -11,6 +11,7 @@ endif
 $(PPC64_TESTS): CFLAGS += -mpower8-vector
 
 PPC64_TESTS += mtfsf
+PPC64_TESTS += mffsce
 
 ifneq ($(CROSS_CC_HAS_POWER10),)
 PPC64_TESTS += byte_reverse sha512-vector
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 5b0eb5e870..6ca3003f02 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -24,6 +24,7 @@ run-sha512-vector: QEMU_OPTS+=-cpu POWER10
 run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
 
 PPC64LE_TESTS += mtfsf
+PPC64LE_TESTS += mffsce
 PPC64LE_TESTS += signal_save_restore_xer
 PPC64LE_TESTS += xxspltw
 
diff --git a/tests/tcg/ppc64le/mffsce.c b/tests/tcg/ppc64le/mffsce.c
new file mode 100644
index 0000000000..20d882cb45
--- /dev/null
+++ b/tests/tcg/ppc64le/mffsce.c
@@ -0,0 +1,37 @@
+#include <stdlib.h>
+#include <stdint.h>
+#include <assert.h>
+
+#define MTFSF(FLM, FRB) asm volatile ("mtfsf %0, %1" :: "i" (FLM), "f" (FRB))
+#define MFFS(FRT) asm("mffs %0" : "=f" (FRT))
+#define MFFSCE(FRT) asm("mffsce %0" : "=f" (FRT))
+
+#define PPC_BIT_NR(nr) (63 - (nr))
+
+#define FP_VE  (1ull << PPC_BIT_NR(56))
+#define FP_UE  (1ull << PPC_BIT_NR(58))
+#define FP_ZE  (1ull << PPC_BIT_NR(59))
+#define FP_XE  (1ull << PPC_BIT_NR(60))
+#define FP_NI  (1ull << PPC_BIT_NR(61))
+#define FP_RN1 (1ull << PPC_BIT_NR(63))
+
+int main(void)
+{
+    uint64_t frt, fpscr;
+    uint64_t test_value = FP_VE | FP_UE | FP_ZE |
+                          FP_XE | FP_NI | FP_RN1;
+    MTFSF(0b11111111, test_value); /* set test value to cpu fpscr */
+    MFFSCE(frt);
+    MFFS(fpscr); /* read the value that mffsce stored to cpu fpscr */
+
+    /* the returned value should be as the cpu fpscr was before */
+    assert((frt & 0xff) == test_value);
+
+    /*
+     * the cpu fpscr last 3 bits should be unchanged
+     * and enable bits should be unset
+     */
+    assert((fpscr & 0xff) == (test_value & 0x7));
+
+    return 0;
+}
-- 
2.36.1


