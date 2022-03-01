Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C01F4C97E6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 22:45:36 +0100 (CET)
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAJK-0007BF-OX
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 16:45:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPAH6-0006Ne-Fb; Tue, 01 Mar 2022 16:43:16 -0500
Received: from [2607:f8b0:4864:20::f29] (port=45975
 helo=mail-qv1-xf29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPAH4-00064g-Nt; Tue, 01 Mar 2022 16:43:16 -0500
Received: by mail-qv1-xf29.google.com with SMTP id h13so17668363qvk.12;
 Tue, 01 Mar 2022 13:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JLxlk3CC7CytXTMI2dxu+MOUSLwt7+JAIDELIXCgbTc=;
 b=lRjBrtOfhQeM5e3bv35dlBA4C3yZ1cb7ztHT31jrwjLkG4PiLlfswu4OOP0M1FSz4e
 oWX//QxbRwY3mSxtrV46Pt7VhnARtdm1MxDxKuTR7PkheHFEPzx8efPNxgguGcamGXTn
 eJlwMfvFIHG3NVcNH37DEv2fgpuMys4MXlypgKBl08jb+A8spkAQpwxbh1XTEPgUJ15z
 0GJh8U1xupLx1RgnE8II98S+0VCWKH2fxq7Ixhp1uRh1uZXKiOVt/FklGInnNkikYv6u
 aDdDjE7yEOnq1O9jxwJWFZ7P6b4JouuvV9FgbDwejltOq/WjuNIuZp/GaQudPzvQTmQY
 xfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JLxlk3CC7CytXTMI2dxu+MOUSLwt7+JAIDELIXCgbTc=;
 b=5z/pF7Ra1IS32fuqSCwBGyqyIcHxshrNcj3dKq2hJYCqTNVTw5T6LA8UwjB1RVmkAD
 vSWA7qk+7ar8lYuidjGOnDT6nhsai/nZr3rgpVyMra74zVADhjRDjb1VCNBubkrFQ7EX
 ZAOWiSyHK6eo7nRUM2DZnKkFhrEDaWH4mWxCKUCa3do5vInwxxgL2WiKB8VFzLGPtWMs
 16IVG9rd8vqdjI+s8SNHWvycPhPI6R2k4oLo2+OHOnkmN8inekFKO2W61A43joQqVcuY
 52z5V3elY6btlZB6Oz7FkxNHi2mzDrAwxvhzp2HrcKYkESgWV1qhTivNb2SzlwZKP7fH
 amRA==
X-Gm-Message-State: AOAM533JBJMZ/HUv8TnnNhn/vu43ZOXnW0vzSIoXj8u6LUVvmQX7pS5S
 8231JofUF76ilKOZ9MEOqAJ+x02eUHYPxT0bUfs=
X-Google-Smtp-Source: ABdhPJwi6q7Zfbr/uU2wt/EyN7fz2QizJfd6ZfspiB+0xeneE2C4AkF9GnfOtsUGT7NW+28OhQwmNQ==
X-Received: by 2002:ad4:5d6b:0:b0:434:3139:958 with SMTP id
 fn11-20020ad45d6b000000b0043431390958mr5037303qvb.91.1646170993197; 
 Tue, 01 Mar 2022 13:43:13 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-147-183.pwrtc.com.
 [205.174.147.183]) by smtp.gmail.com with ESMTPSA id
 j18-20020ac85c52000000b002deaca065dfsm9920092qtj.10.2022.03.01.13.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 13:43:12 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3] tests/tcg/s390x: Cleanup of mie3 tests.
Date: Tue,  1 Mar 2022 16:43:05 -0500
Message-Id: <20220301214305.2778-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf29.google.com
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

Adds clobbers and merges remaining separate asm statements.

v2 -> v3:
* Removed all direct memory references in mie3-sel.c

v1 -> v2:
* Corrected side in rebase conflict, removing older code.

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 tests/tcg/s390x/mie3-compl.c | 18 ++++++++++++-----
 tests/tcg/s390x/mie3-mvcrl.c | 12 ++++++++----
 tests/tcg/s390x/mie3-sel.c   | 38 ++++++++++++++++--------------------
 3 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
index 35649f3b02..938938df9e 100644
--- a/tests/tcg/s390x/mie3-compl.c
+++ b/tests/tcg/s390x/mie3-compl.c
@@ -1,13 +1,20 @@
 #include <stdint.h>
 
+
 #define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
-{ \
-    uint64_t res = 0; \
-    asm ("llihf %[res],801\n" ASM \
-         : [res]"=&r"(res) : [a]"r"(a), [b]"r"(b) : "cc"); \
-    return res; \
+{                       \
+    uint64_t res = 0;   \
+asm volatile (          \
+    "llihf %[res],801\n"\
+    ASM                 \
+    : [res] "=&r" (res)  \
+    : [a] "r" (a)       \
+    , [b] "r" (b)       \
+);                      \
+    return res;         \
 }
 
+
 /* AND WITH COMPLEMENT */
 FbinOp(_ncrk,  ".insn rrf, 0xB9F50000, %[res], %[b], %[a], 0\n")
 FbinOp(_ncgrk, ".insn rrf, 0xB9E50000, %[res], %[b], %[a], 0\n")
@@ -28,6 +35,7 @@ FbinOp(_nogrk, ".insn rrf, 0xB9660000, %[res], %[b], %[a], 0\n")
 FbinOp(_ocrk,  ".insn rrf, 0xB9750000, %[res], %[b], %[a], 0\n")
 FbinOp(_ocgrk, ".insn rrf, 0xB9650000, %[res], %[b], %[a], 0\n")
 
+
 int main(int argc, char *argv[])
 {
     if (_ncrk(0xFF88, 0xAA11)  != 0x0000032100000011ull ||
diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c
index 57b08e48d0..f749dad9c2 100644
--- a/tests/tcg/s390x/mie3-mvcrl.c
+++ b/tests/tcg/s390x/mie3-mvcrl.c
@@ -1,15 +1,17 @@
 #include <stdint.h>
 #include <string.h>
 
+
 static inline void mvcrl_8(const char *dst, const char *src)
 {
     asm volatile (
-    "llill %%r0, 8\n"
-    ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
-    : : [dst] "d" (dst), [src] "d" (src)
-    : "memory");
+        "llill %%r0, 8\n"
+        ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
+        : : [dst] "d" (dst), [src] "d" (src)
+        : "r0", "memory");
 }
 
+
 int main(int argc, char *argv[])
 {
     const char *alpha = "abcdefghijklmnop";
@@ -25,3 +27,5 @@ int main(int argc, char *argv[])
 
     return strncmp(alpha, tstr, 16ul);
 }
+
+
diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c
index b0c5c9857d..4f54d37eeb 100644
--- a/tests/tcg/s390x/mie3-sel.c
+++ b/tests/tcg/s390x/mie3-sel.c
@@ -1,32 +1,27 @@
 #include <stdint.h>
 
+
 #define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
-{                            \
-    uint64_t res = 0;        \
-    asm (                    \
-         "lg %%r2, %[a]\n"   \
-         "lg %%r3, %[b]\n"   \
-         "lg %%r0, %[c]\n"   \
-         "ltgr %%r0, %%r0\n" \
-         ASM                 \
-         "stg %%r0, %[res] " \
-         : [res] "=m" (res)  \
-         : [a] "m" (a),      \
-           [b] "m" (b),      \
-           [c] "m" (c)       \
-         : "r0", "r2",       \
-           "r3", "r4"        \
-    );                       \
-    return res;              \
+{                       \
+asm volatile (          \
+    "ltgr %[c], %[c]\n" \
+    ASM                 \
+    : [c] "+r" (c)      \
+    : [a]  "r" (a)      \
+    , [b]  "r" (b)      \
+);                      \
+    return c;           \
 }
 
-Fi3 (_selre,     ".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n")
-Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n")
-Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n")
+Fi3 (_selre,     ".insn rrf, 0xB9F00000, %[c], %[b], %[a], 8\n")
+Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %[c], %[b], %[a], 8\n")
+Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %[c], %[b], %[a], 7\n")
+
 
 int main(int argc, char *argv[])
 {
     uint64_t a = ~0, b = ~0, c = ~0;
+
     a =    _selre(0x066600000066ull, 0x066600000006ull, a);
     b =   _selgrz(0xF00D00000005ull, 0xF00D00000055ull, b);
     c = _selfhrnz(0x043200000044ull, 0x065400000004ull, c);
@@ -34,5 +29,6 @@ int main(int argc, char *argv[])
     return (int) (
         (0xFFFFFFFF00000066ull != a) ||
         (0x0000F00D00000005ull != b) ||
-        (0x00000654FFFFFFFFull != c));
+        (0x00000654FFFFFFFFull != c) );
 }
+
-- 
2.34.1


