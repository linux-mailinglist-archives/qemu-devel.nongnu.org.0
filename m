Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACBD4BAD33
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 00:22:23 +0100 (CET)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKq6Q-0006Jz-HT
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 18:22:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKq1z-0000HL-49; Thu, 17 Feb 2022 18:17:47 -0500
Received: from [2607:f8b0:4864:20::f35] (port=34436
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKq1x-00085O-Eo; Thu, 17 Feb 2022 18:17:46 -0500
Received: by mail-qv1-xf35.google.com with SMTP id fh9so11417389qvb.1;
 Thu, 17 Feb 2022 15:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ws1Uq9o0dc3PMzm7vjp3Z/TRyPVzPcf1fGpu52pJhJc=;
 b=d1kd4DTCvjmWw68AscX0xNuEL6AprHR7AmNK39GIdax/hDyqtnHG1dTmtwScSkHqQ4
 ildPnfV4TPSGgs8+LEr0068Xj97Zyffu16xoCDEQgOYHZoNYdO68+o/VPLzjHM7aEUZG
 zBznkflIlHiCQW8esi9aBBa97XbUA1JKSjIwsFs7DMgDvl1bFLtUYsSDIMrCMyhG271i
 52/PlQvoZWGsKmSOJigF4CVFcJgzve1RgzXPhZkhalE9CGwXh8obwd0FhWhOOuSAMZqE
 E6CQAT85efNPHCuXDg1auRKVHUnKQ3kbI4N/EJKdzuBwjxIOrMeysfwstMIcf9N4I3Nh
 wfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ws1Uq9o0dc3PMzm7vjp3Z/TRyPVzPcf1fGpu52pJhJc=;
 b=GvNorsjT6Xol5t0RNjt0t+YSgYxzzHLjSx8rnX4CpKjK79PfDU2OY9OK2RYLggXbkn
 9B7bvkR97LYIIeIkrGb/ZRsN2xxq5kJABTPy9YUadKWSjpKi0b1/DFHIY+vAb52Y3EeM
 I8Dxa+hVIwRTFx8Sz3fZhiboHcZA99lEMyzGzeT4jUSiibYsQB7/Uy1zHmAO3b8C10PU
 hgTt45vL6z4xTpIYhI2kJZIyEPd4WdJ3yZ44U57GZeW1T5Sjq3t60s7cq4Y9nicyAVRO
 cGvi501hYLdxA2iahCx6Wmn2mPmZ5QWZH2tXBIw8uPJOt9VbFB5Yb0h7MP5JQ3zAWjwq
 N4lQ==
X-Gm-Message-State: AOAM5300uPtZP++YmmyXqYCFAFCjWtD/5wFzHk51KHqCMIWRfKU/VAox
 kt8O297RbqLX7aNsAKQWQ5e2MAIOC31ygFj3BgFr/m6B
X-Google-Smtp-Source: ABdhPJyw7zrjzf4GKHfIFHWeD+DzSzZKqPWOGoN1LqIQv3yiHGWF4KbUaDiGQtuMde96Znfl5Qcn6w==
X-Received: by 2002:ad4:40ce:0:b0:42c:f251:778d with SMTP id
 x14-20020ad440ce000000b0042cf251778dmr3896729qvp.71.1645139863662; 
 Thu, 17 Feb 2022 15:17:43 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 h10sm21272939qko.92.2022.02.17.15.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 15:17:43 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
Date: Thu, 17 Feb 2022 18:17:27 -0500
Message-Id: <20220217231728.13932-4-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220217231728.13932-1-dmiller423@gmail.com>
References: <20220217231728.13932-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/tcg/s390x/mie3-compl.c: [N]*K instructions
tests/tcg/s390x/mie3-mvcrl.c: MVCRL instruction
tests/tcg/s390x/mie3-sel.c:  SELECT instruction

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 tests/tcg/s390x/Makefile.target |  5 ++-
 tests/tcg/s390x/mie3-compl.c    | 55 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/mie3-mvcrl.c    | 31 +++++++++++++++++++
 tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
 4 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/mie3-compl.c
 create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
 create mode 100644 tests/tcg/s390x/mie3-sel.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 1a7238b4eb..54e67446aa 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -1,12 +1,15 @@
 S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
 VPATH+=$(S390X_SRC)
-CFLAGS+=-march=zEC12 -m64
+CFLAGS+=-march=z15 -m64
 TESTS+=hello-s390x
 TESTS+=csst
 TESTS+=ipm
 TESTS+=exrl-trt
 TESTS+=exrl-trtr
 TESTS+=pack
+TESTS+=mie3-compl
+TESTS+=mie3-mvcrl
+TESTS+=mie3-sel
 TESTS+=mvo
 TESTS+=mvc
 TESTS+=shift
diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
new file mode 100644
index 0000000000..98281ee683
--- /dev/null
+++ b/tests/tcg/s390x/mie3-compl.c
@@ -0,0 +1,55 @@
+#include <stdint.h>
+
+
+#define F_EPI "stg %%r0, %[res] " : [res] "+m" (res) : : "r0", "r2", "r3"
+
+#define F_PRO    asm ( \
+    "llihf %%r0,801\n" \
+    "lg %%r2, %[a]\n"  \
+    "lg %%r3, %[b] "   \
+    : : [a] "m" (a),   \
+        [b] "m" (b)    \
+    : "r2", "r3")
+
+#define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
+{ uint64_t res = 0; F_PRO; ASM; return res; }
+
+/* AND WITH COMPLEMENT */
+FbinOp(_ncrk,  asm("ncrk  %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_ncgrk, asm("ncgrk %%r0, %%r3, %%r2\n" F_EPI))
+
+/* NAND */
+FbinOp(_nnrk,  asm("nnrk  %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_nngrk, asm("nngrk %%r0, %%r3, %%r2\n" F_EPI))
+
+/* NOT XOR */
+FbinOp(_nxrk,  asm("nxrk  %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_nxgrk, asm("nxgrk %%r0, %%r3, %%r2\n" F_EPI))
+
+/* NOR */
+FbinOp(_nork,  asm("nork  %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_nogrk, asm("nogrk %%r0, %%r3, %%r2\n" F_EPI))
+
+/* OR WITH COMPLEMENT */
+FbinOp(_ocrk,  asm("ocrk  %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_ocgrk, asm("ocgrk %%r0, %%r3, %%r2\n" F_EPI))
+
+
+int main(int argc, char *argv[])
+{
+    if (_ncrk(0xFF88, 0xAA11)  != 0x0000032100000011ull ||
+        _nnrk(0xFF88, 0xAA11)  != 0x00000321FFFF55FFull ||
+        _nork(0xFF88, 0xAA11)  != 0x00000321FFFF0066ull ||
+        _nxrk(0xFF88, 0xAA11)  != 0x00000321FFFFAA66ull ||
+        _ocrk(0xFF88, 0xAA11)  != 0x00000321FFFFAA77ull ||
+        _ncgrk(0xFF88, 0xAA11) != 0x0000000000000011ull ||
+        _nngrk(0xFF88, 0xAA11) != 0xFFFFFFFFFFFF55FFull ||
+        _nogrk(0xFF88, 0xAA11) != 0xFFFFFFFFFFFF0066ull ||
+        _nxgrk(0xFF88, 0xAA11) != 0xFFFFFFFFFFFFAA66ull ||
+        _ocgrk(0xFF88, 0xAA11) != 0xFFFFFFFFFFFFAA77ull)
+    {
+        return 1;
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c
new file mode 100644
index 0000000000..81cf3ad702
--- /dev/null
+++ b/tests/tcg/s390x/mie3-mvcrl.c
@@ -0,0 +1,31 @@
+#include <stdint.h>
+#include <string.h>
+
+
+static inline void mvcrl_8(const char *dst, const char *src)
+{
+    asm volatile (
+    "llill %%r0, 8\n"
+    "mvcrl 0(%[dst]), 0(%[src])\n"
+    : : [dst] "d" (dst), [src] "d" (src)
+    : "memory");
+}
+
+
+int main(int argc, char *argv[])
+{
+    const char *alpha = "abcdefghijklmnop";
+
+    /* array missing 'i' */
+    char tstr[17] = "abcdefghjklmnop\0" ;
+
+    /* mvcrl reference use: 'open a hole in an array' */
+    mvcrl_8(tstr + 9, tstr + 8);
+
+    /* place missing 'i' */
+    tstr[8] = 'i';
+
+    return strncmp(alpha, tstr, 16ul);
+}
+
+
diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c
new file mode 100644
index 0000000000..d6b7b0933b
--- /dev/null
+++ b/tests/tcg/s390x/mie3-sel.c
@@ -0,0 +1,42 @@
+#include <stdint.h>
+
+
+#define F_EPI "stg %%r0, %[res] " : [res] "+m" (res) : : "r0", "r2", "r3"
+
+#define F_PRO    asm ( \
+    "lg %%r2, %[a]\n"  \
+    "lg %%r3, %[b]\n"  \
+    "lg %%r0, %[c]\n"  \
+    "ltgr %%r0, %%r0"  \
+    : : [a] "m" (a),   \
+        [b] "m" (b),   \
+        [c] "m" (c)    \
+    : "r0", "r2", "r3", "r4")
+
+
+
+#define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
+{ uint64_t res = 0; F_PRO ; ASM ; return res; }
+
+
+Fi3 (_selre,     asm("selre    %%r0, %%r3, %%r2\n" F_EPI))
+Fi3 (_selgrz,    asm("selgrz   %%r0, %%r3, %%r2\n" F_EPI))
+Fi3 (_selfhrnz,  asm("selfhrnz %%r0, %%r3, %%r2\n" F_EPI))
+
+
+int main(int argc, char *argv[])
+{
+    uint64_t a = ~0, b = ~0, c = ~0;
+    a =    _selre(0x066600000066ull, 0x066600000006ull, a);
+    b =   _selgrz(0xF00D00000005ull, 0xF00D00000055ull, b);
+    c = _selfhrnz(0x004400000044ull, 0x000400000004ull, c);
+
+    if ((0xFFFFFFFF00000066ull != a) ||
+        (0x0000F00D00000005ull != b) ||
+        (0x00000004FFFFFFFFull != c))
+    {
+        return 1;
+    }
+    return 0;
+}
+
-- 
2.32.0


