Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3EC4C956B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 21:08:01 +0100 (CET)
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8mu-0007oY-PK
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 15:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP8eu-0002o7-VF; Tue, 01 Mar 2022 14:59:48 -0500
Received: from [2607:f8b0:4864:20::830] (port=42898
 helo=mail-qt1-x830.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP8et-0007tB-9Y; Tue, 01 Mar 2022 14:59:44 -0500
Received: by mail-qt1-x830.google.com with SMTP id 11so10959354qtt.9;
 Tue, 01 Mar 2022 11:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lQcyY9seI0jzbnW0sDztw/nODtmYIpcS6UHhCh/ZaV0=;
 b=QJuZoRRbpvky1jhYwhrCJo9m2K4MVCMH4OAhrWzNSdzUjOKFZFY8QP4CmshMJisPTN
 uTvJQl3l5kW2QuF+ieWdNS9oHpMNhZhY9CU0dcT/OGDOd1oWVBJA7oKq53/Vkdya/bT2
 JnF4ZZgKs0xHN+6xaib6D5u2YmjnRdkyazCw7eJcBYw++QTSZrnxuneOne3JO2iPcWqz
 UYBfcMdIiBUuwsuid7OVRUrlkBLW/fnvKXW/OnHwL0fiHA5hMDpYYPHVz1RUSFcv2CK2
 kj5DkZNd2vk2htitqoprm3+4KBOQ+Ap6qBOkucyLQdJVc6hShvHxZ0S79lszYu1n1363
 uS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lQcyY9seI0jzbnW0sDztw/nODtmYIpcS6UHhCh/ZaV0=;
 b=6NPm2NX81YekH1ocXFWkIOO7Ca/1zeykiT41IsfVCdvuGYkqBSgA0VAdM0MWMv1bKl
 Jfzt/9h9BPy7PwoWKMbAcDxBOra4H+OgYev5VDu3h/AtOiCzmW1LoK0vDz6jmGCITwTf
 l0GC8mwB4jJx+2foMBnpMkmhJZLyoeVtEkA4AF4ZxLMprp5ZgTXmAaq6Bp2B6gG2xcmZ
 yYSi/hKCFtMVhPZSIkFQMezfrOsei5u62gG4JVOZnyAnwn544g70L4eCivULCIgZJTRE
 Jv/hZy+fQeUB8rLleENwviJdXZFRIWZEanw1el932gshFJn379Bzkn3Sy3V+mW54sXcT
 RT7Q==
X-Gm-Message-State: AOAM531sESESfnZmBg7QV8LWgr3rNdX/PhI7hVlzFzKUVLQ8F6cRZGKT
 ZfhJbWFxsyw1YEr/5ykOI4a9nSEiVr2VZdacN8c=
X-Google-Smtp-Source: ABdhPJzjsOewnvGsMeOQ4aHYZ7mTcME7g/HV7voRdnpa9qJ4KH8lKchmiuP2/PAoWTNfY90Dds4qhw==
X-Received: by 2002:ac8:5753:0:b0:2dc:ed41:5abe with SMTP id
 19-20020ac85753000000b002dced415abemr20917772qtx.222.1646164781783; 
 Tue, 01 Mar 2022 11:59:41 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-147-183.pwrtc.com.
 [205.174.147.183]) by smtp.gmail.com with ESMTPSA id
 y16-20020a05622a121000b002deaa0af9e2sm9670100qtx.49.2022.03.01.11.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 11:59:41 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2] tests/tcg/s390x: Cleanup of mie3 tests.
Date: Tue,  1 Mar 2022 14:59:33 -0500
Message-Id: <20220301195933.1500-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::830
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=dmiller423@gmail.com; helo=mail-qt1-x830.google.com
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

v1 -> v2:
* Corrected side in rebase conflict, removing older code.


Signed-off-by: David Miller <dmiller423@gmail.com>
---
 tests/tcg/s390x/mie3-compl.c | 18 +++++++++++-----
 tests/tcg/s390x/mie3-mvcrl.c | 12 +++++++----
 tests/tcg/s390x/mie3-sel.c   | 41 ++++++++++++++++++------------------
 3 files changed, 41 insertions(+), 30 deletions(-)

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
index b0c5c9857d..ca6043251b 100644
--- a/tests/tcg/s390x/mie3-sel.c
+++ b/tests/tcg/s390x/mie3-sel.c
@@ -1,28 +1,26 @@
 #include <stdint.h>
 
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
+    uint64_t res = 0;   \
+asm volatile (          \
+    "lg %%r0, %[c]\n"   \
+    "ltgr %%r0, %%r0\n" \
+    ASM                 \
+    "stg %%r0, %[res] " \
+    : [res] "=m" (res)  \
+    : [a] "r" (a),      \
+      [b] "r" (b),      \
+      [c] "m" (c)       \
+    : "r0", "memory"    \
+);                      \
+    return res;         \
 }
 
-Fi3 (_selre,     ".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n")
-Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n")
-Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n")
+Fi3 (_selre,     ".insn rrf, 0xB9F00000, %%r0, %[b], %[a], 8\n")
+Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %%r0, %[b], %[a], 8\n")
+Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %%r0, %[b], %[a], 7\n")
+
 
 int main(int argc, char *argv[])
 {
@@ -34,5 +32,6 @@ int main(int argc, char *argv[])
     return (int) (
         (0xFFFFFFFF00000066ull != a) ||
         (0x0000F00D00000005ull != b) ||
-        (0x00000654FFFFFFFFull != c));
+        (0x00000654FFFFFFFFull != c) );
 }
+
-- 
2.34.1


