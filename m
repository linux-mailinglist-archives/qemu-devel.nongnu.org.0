Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFD4C9484
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:40:31 +0100 (CET)
Received: from localhost ([::1]:49666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8MH-0005KS-OH
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:40:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP7xp-0007Qe-Nh; Tue, 01 Mar 2022 14:15:13 -0500
Received: from [2607:f8b0:4864:20::732] (port=44817
 helo=mail-qk1-x732.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP7xn-0002Ch-6O; Tue, 01 Mar 2022 14:15:13 -0500
Received: by mail-qk1-x732.google.com with SMTP id q4so13696118qki.11;
 Tue, 01 Mar 2022 11:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pN50RO5xqGvCIY/Li1giasTnDCa4tPHNtSiubtwpL74=;
 b=W+fKATg7APjb/+r4MY5u9SrjmjJnCrHkJH5jlXRLAutW2gnO45lwGag0DaeVWrLwYE
 tZRWebt0T5yJlBLcBhPdbCksghhe3BnZnlpZcaYYXjhKOGdw8HXkxdETUc0RK6Vrngwl
 iO4hubuIQLqFF9hfx7tCp+DvB1+yKg07XUVDREYp7XFYVUVuSBQhswMfbMvAyR9N8NTB
 1GfVCs2cq9m7Jhf4tx9f6Z4YHBvvsZLeIVa00nWZ0UOr02B3emyKHhnfLpFJ/nBmfJAe
 2kBkQHGecKixP4pX7l9XdC3trDbRgpAYjAH5xjllSlzk/nRIu+5h0guulnXYuZC7xq5Y
 XtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pN50RO5xqGvCIY/Li1giasTnDCa4tPHNtSiubtwpL74=;
 b=Ja2nm7ShygMF1LYX5r/PDsHj905PQScJUAbwaoRIDKEDm4w4nk8R6wHBk0/+gUCkYG
 fd8DKxAlAxYUR5r/xEeT+vdsrGiF1CCOj2mlRZBGcrvbji/VRJUno+H+59Vi2PdOmcUn
 mUAd8swH4i8S1K3GGJg1WZ7Zm77N4No5a1G+xXlkvh5hNaqiMQTd3/6D4BmsJYUWgxmP
 Qd7RZuiuelGQmzJmtT/lxUaEwq7Bejy7ICrcjcnBg80smc54fUfkGKs8Oz6rf400yd6Q
 bnXP0jliycBN+AycTNPYEkfGNg++iAhETACu1kMVZ9BU+sqaXAEMPl9Zu8J1yOJoejR5
 kTxA==
X-Gm-Message-State: AOAM530UdMvQFFNHttiiyttftqPCTCMYfu3mapReYO5meO1RSoiEoTVo
 q6t1TntMiHneepiEnHa4C9jBfpinIz4bk6l9lJc=
X-Google-Smtp-Source: ABdhPJwHNtFL6lE1zJWGwPHff47oubzmZ6sd4mt76Lv40AxzgmSlsk9B+jxEhW7mNkA1ySTxMs374Q==
X-Received: by 2002:a37:a845:0:b0:63b:b65c:ad11 with SMTP id
 r66-20020a37a845000000b0063bb65cad11mr14308244qke.574.1646162108534; 
 Tue, 01 Mar 2022 11:15:08 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-147-183.pwrtc.com.
 [205.174.147.183]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05620a223200b00476534e4fdbsm6856338qkh.95.2022.03.01.11.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 11:15:08 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg/s390x: Cleanup of mie3 tests.
Date: Tue,  1 Mar 2022 14:14:55 -0500
Message-Id: <20220301191455.19004-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::732
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=dmiller423@gmail.com; helo=mail-qk1-x732.google.com
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

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 tests/tcg/s390x/mie3-compl.c | 42 +++++++++++++++++++++++-------------
 tests/tcg/s390x/mie3-mvcrl.c | 12 +++++++----
 tests/tcg/s390x/mie3-sel.c   | 40 ++++++++++++++++++----------------
 3 files changed, 57 insertions(+), 37 deletions(-)

diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
index 35649f3b02..85b23a9b7a 100644
--- a/tests/tcg/s390x/mie3-compl.c
+++ b/tests/tcg/s390x/mie3-compl.c
@@ -1,32 +1,44 @@
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
+    "llihf %%r0,801\n"  \
+    "lg %%r2, %[a]\n"   \
+    "lg %%r3, %[b]\n"   \
+    ASM                 \
+    "stg %%r0, %[res] " \
+    : [res] "=m" (res)  \
+    : [a] "m" (a)       \
+    , [b] "m" (b)       \
+    : "r0", "r2", "r3"  \
+);                      \
+    return res;         \
 }
 
+
 /* AND WITH COMPLEMENT */
-FbinOp(_ncrk,  ".insn rrf, 0xB9F50000, %[res], %[b], %[a], 0\n")
-FbinOp(_ncgrk, ".insn rrf, 0xB9E50000, %[res], %[b], %[a], 0\n")
+FbinOp(_ncrk,  ".insn rrf, 0xB9F50000, %%r0, %%r3, %%r2, 0\n")
+FbinOp(_ncgrk, ".insn rrf, 0xB9E50000, %%r0, %%r3, %%r2, 0\n")
 
 /* NAND */
-FbinOp(_nnrk,  ".insn rrf, 0xB9740000, %[res], %[b], %[a], 0\n")
-FbinOp(_nngrk, ".insn rrf, 0xB9640000, %[res], %[b], %[a], 0\n")
+FbinOp(_nnrk,  ".insn rrf, 0xB9740000, %%r0, %%r3, %%r2, 0\n")
+FbinOp(_nngrk, ".insn rrf, 0xB9640000, %%r0, %%r3, %%r2, 0\n")
 
 /* NOT XOR */
-FbinOp(_nxrk,  ".insn rrf, 0xB9770000, %[res], %[b], %[a], 0\n")
-FbinOp(_nxgrk, ".insn rrf, 0xB9670000, %[res], %[b], %[a], 0\n")
+FbinOp(_nxrk,  ".insn rrf, 0xB9770000, %%r0, %%r3, %%r2, 0\n")
+FbinOp(_nxgrk, ".insn rrf, 0xB9670000, %%r0, %%r3, %%r2, 0\n")
 
 /* NOR */
-FbinOp(_nork,  ".insn rrf, 0xB9760000, %[res], %[b], %[a], 0\n")
-FbinOp(_nogrk, ".insn rrf, 0xB9660000, %[res], %[b], %[a], 0\n")
+FbinOp(_nork,  ".insn rrf, 0xB9760000, %%r0, %%r3, %%r2, 0\n")
+FbinOp(_nogrk, ".insn rrf, 0xB9660000, %%r0, %%r3, %%r2, 0\n")
 
 /* OR WITH COMPLEMENT */
-FbinOp(_ocrk,  ".insn rrf, 0xB9750000, %[res], %[b], %[a], 0\n")
-FbinOp(_ocgrk, ".insn rrf, 0xB9650000, %[res], %[b], %[a], 0\n")
+FbinOp(_ocrk,  ".insn rrf, 0xB9750000, %%r0, %%r3, %%r2, 0\n")
+FbinOp(_ocgrk, ".insn rrf, 0xB9650000, %%r0, %%r3, %%r2, 0\n")
+
 
 int main(int argc, char *argv[])
 {
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
index b0c5c9857d..98cf4d40f5 100644
--- a/tests/tcg/s390x/mie3-sel.c
+++ b/tests/tcg/s390x/mie3-sel.c
@@ -1,29 +1,32 @@
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
+    uint64_t res = 0;   \
+asm volatile (          \
+    "lg %%r2, %[a]\n"   \
+    "lg %%r3, %[b]\n"   \
+    "lg %%r0, %[c]\n"   \
+    "ltgr %%r0, %%r0\n" \
+    ASM                 \
+    "stg %%r0, %[res] " \
+    : [res] "=m" (res)  \
+    : [a] "m" (a),      \
+      [b] "m" (b),      \
+      [c] "m" (c)       \
+    : "r0", "r2",       \
+      "r3", "r4"        \
+);                      \
+    return res;         \
 }
 
+
 Fi3 (_selre,     ".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n")
 Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n")
 Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n")
 
+
 int main(int argc, char *argv[])
 {
     uint64_t a = ~0, b = ~0, c = ~0;
@@ -34,5 +37,6 @@ int main(int argc, char *argv[])
     return (int) (
         (0xFFFFFFFF00000066ull != a) ||
         (0x0000F00D00000005ull != b) ||
-        (0x00000654FFFFFFFFull != c));
+        (0x00000654FFFFFFFFull != c) );
 }
+
-- 
2.34.1


