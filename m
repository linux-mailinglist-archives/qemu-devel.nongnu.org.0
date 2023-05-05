Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E316F86DD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:36:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puyOq-0000Z6-QL; Fri, 05 May 2023 12:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOh-0000Ya-G8; Fri, 05 May 2023 12:35:12 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOf-00055M-LD; Fri, 05 May 2023 12:35:07 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6a5ef766282so1538061a34.0; 
 Fri, 05 May 2023 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683304504; x=1685896504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KqvU8//8WYRiuqj0LMjiqtFrHPWBBdy2oZBbIlb2Uak=;
 b=lJECY7nh8zXY0KmqIJDMWVxaOhZtGiKYnIS6iCdl7Gvskhhggb1EWd5G6Na0Tqo2qe
 bg6qnOkWn2Emdqay4Z/VL8mZa3NSM/y0/+zHZEKxrDhNcFBNAqWN8lvki4Li6I0GafKP
 8FAyZLHCQ0bZWLAlNQmM8EOXOlazhCkgJq4Y/55iq5WOwk9RJtU3X8IxIp93f2jfgMUU
 fd4JZwqavmKNY5yIlcrbaTWEfdJ3XLNQ2btaaqH+yza3zg31rkK0Dsgr26d+I10RrlMx
 IiervQe/t/3EPYeFX0XIEpBZU/jgQZdeb7vPBOWsPTuxK8IYB6CFRQYMTfxnRxMSXIGu
 FOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683304504; x=1685896504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KqvU8//8WYRiuqj0LMjiqtFrHPWBBdy2oZBbIlb2Uak=;
 b=gjpTzRtTfbzQgeLFBSU7azpYBS6HUMnTD0vkORbdfQocQDuOkMCuCOstzG0jauH6la
 YT8TDLblAR3EiRgdJcVJy8NU5/wJijGEXhPPkqr9tfNFiiN+mejvPi/gvmtjv44JKBPB
 v7xZCBJdBYtMqfYa4aw+Y1S8OmKd+wLaEz+1B2SIOKxgF+4wnDfgCgQbUVwgzgS6AzfG
 VNOgyX4PhuFY6rMekMrObB1R6ZOw1JnPflvKZXxw3VjGIHETx173zJ/mQnpkaOWiavAD
 7x58uvD+yO/pzk2VVH+L2SKbmURTcuy6ewa3NDcBBi2+BXjLz+IAFhWHkG9IWlyWV33h
 IKPw==
X-Gm-Message-State: AC+VfDxx6V7fwQ3KJh1H6QS0V+wjWccWeNJHASVxVdtjyjlKWzkuYaPZ
 V+3yuR0K2+tI4kUUtkMAhjDnyutocVs=
X-Google-Smtp-Source: ACHHUZ6Pnjhm2l4BqRC8m6K6+ChFK7DDnZ0WTTchCJ7bwUWSYjb1X2Ig0czbWQbZ32OZvhxS5f1m0A==
X-Received: by 2002:a9d:65d7:0:b0:6a6:767:ed71 with SMTP id
 z23-20020a9d65d7000000b006a60767ed71mr1152422oth.18.1683304504026; 
 Fri, 05 May 2023 09:35:04 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a9d62c3000000b006a43519523fsm1033475otk.1.2023.05.05.09.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 09:35:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 John Platts <john_platts@hotmail.com>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 5/6] tests: tcg: ppc64: Add tests for Vector Extract Mask
 Instructions
Date: Fri,  5 May 2023 13:34:43 -0300
Message-Id: <20230505163444.347006-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505163444.347006-1-danielhb413@gmail.com>
References: <20230505163444.347006-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Shivaprasad G Bhat <sbhat@linux.ibm.com>

Add test for vextractbm, vextractwm, vextractdm and vextractqm
instructions. Test works for both qemu-ppc64 and qemu-ppc64le.

Based on the test case written by John Platts posted at [1]

References:
[1] - https://gitlab.com/qemu-project/qemu/-/issues/1536

Signed-off-by: John Platts <john_platts@hotmail.com>
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Reviewed-by: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Message-Id: <168319294881.1159309.17060400720026083557.stgit@ltc-boston1.aus.stglabs.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 tests/tcg/ppc64/Makefile.target |  5 +++-
 tests/tcg/ppc64/vector.c        | 51 +++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/ppc64/vector.c

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 6d47d3cae6..b084963b9a 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -20,7 +20,7 @@ PPC64_TESTS += mtfsf
 PPC64_TESTS += mffsce
 
 ifneq ($(CROSS_CC_HAS_POWER10),)
-PPC64_TESTS += byte_reverse sha512-vector
+PPC64_TESTS += byte_reverse sha512-vector vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
@@ -31,6 +31,9 @@ sha512-vector: sha512.c
 
 run-sha512-vector: QEMU_OPTS+=-cpu POWER10
 
+vector: CFLAGS += -mcpu=power10 -I$(SRC_PATH)/include
+run-vector: QEMU_OPTS += -cpu POWER10
+
 PPC64_TESTS += signal_save_restore_xer
 PPC64_TESTS += xxspltw
 
diff --git a/tests/tcg/ppc64/vector.c b/tests/tcg/ppc64/vector.c
new file mode 100644
index 0000000000..cbf4ae9332
--- /dev/null
+++ b/tests/tcg/ppc64/vector.c
@@ -0,0 +1,51 @@
+#include <assert.h>
+#include <stdint.h>
+#include "qemu/compiler.h"
+
+int main(void)
+{
+    unsigned int result_wi;
+    vector unsigned char vbc_bi_src = { 0xFF, 0xFF, 0, 0xFF, 0xFF, 0xFF,
+                                        0xFF, 0xFF, 0xFF, 0xFF, 0, 0, 0,
+                                        0, 0xFF, 0xFF};
+    vector unsigned short vbc_hi_src = { 0xFFFF, 0, 0, 0xFFFF,
+                                         0, 0, 0xFFFF, 0xFFFF};
+    vector unsigned int vbc_wi_src = {0, 0, 0xFFFFFFFF, 0xFFFFFFFF};
+    vector unsigned long long vbc_di_src = {0xFFFFFFFFFFFFFFFF, 0};
+    vector __uint128_t vbc_qi_src;
+
+    asm("vextractbm %0, %1" : "=r" (result_wi) : "v" (vbc_bi_src));
+#if HOST_BIG_ENDIAN
+    assert(result_wi == 0b1101111111000011);
+#else
+    assert(result_wi == 0b1100001111111011);
+#endif
+
+    asm("vextracthm %0, %1" : "=r" (result_wi) : "v" (vbc_hi_src));
+#if HOST_BIG_ENDIAN
+    assert(result_wi == 0b10010011);
+#else
+    assert(result_wi == 0b11001001);
+#endif
+
+    asm("vextractwm %0, %1" : "=r" (result_wi) : "v" (vbc_wi_src));
+#if HOST_BIG_ENDIAN
+    assert(result_wi == 0b0011);
+#else
+    assert(result_wi == 0b1100);
+#endif
+
+    asm("vextractdm %0, %1" : "=r" (result_wi) : "v" (vbc_di_src));
+#if HOST_BIG_ENDIAN
+    assert(result_wi == 0b10);
+#else
+    assert(result_wi == 0b01);
+#endif
+
+    vbc_qi_src[0] = 0x1;
+    vbc_qi_src[0] = vbc_qi_src[0] << 127;
+    asm("vextractqm %0, %1" : "=r" (result_wi) : "v" (vbc_qi_src));
+    assert(result_wi == 0b1);
+
+    return 0;
+}
-- 
2.40.1


