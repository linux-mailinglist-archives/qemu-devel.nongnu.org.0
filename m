Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D7D4D06C2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:43:34 +0100 (CET)
Received: from localhost ([::1]:54740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIKT-0007wX-Nj
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:43:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI43-0006Dd-HA
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI42-0006tm-0m
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646677591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DOiSA/xKTOL3iTWpMDdcLBMuVcHGzrE3Nc6MuP2DmK4=;
 b=TGih+4P//eOJEQ5Bv+wM2l3UuOQtKvPfYbvq9IxI7d96UggtS7I4GWmcr1znB0RJx/0+a6
 l1Cfh26GCbTvDqYzyuE8hWhgHt31xEz4y/0zEs3ZUjOKWIRVHIhQfB7+nDgHMMKrjbwdbQ
 LBkuDIblgnxr6VCteNdG8UoDEmkngao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-ehZZjNiSOU2a9rcCSix4cw-1; Mon, 07 Mar 2022 13:26:28 -0500
X-MC-Unique: ehZZjNiSOU2a9rcCSix4cw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43FE0FC81;
 Mon,  7 Mar 2022 18:26:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 128AE804DB;
 Mon,  7 Mar 2022 18:26:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] tests/tcg/s390x: Cleanup of mie3 tests.
Date: Mon,  7 Mar 2022 19:26:05 +0100
Message-Id: <20220307182609.94466-4-thuth@redhat.com>
In-Reply-To: <20220307182609.94466-1-thuth@redhat.com>
References: <20220307182609.94466-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Miller <dmiller423@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Miller <dmiller423@gmail.com>

Adds clobbers and merges remaining separate asm statements.

Signed-off-by: David Miller <dmiller423@gmail.com>
Message-Id: <20220301214305.2778-1-dmiller423@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[thuth: dropped changes to mie3-compl.c, whitespace fixes]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/mie3-mvcrl.c | 10 ++++++----
 tests/tcg/s390x/mie3-sel.c   | 35 +++++++++++++++--------------------
 2 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c
index 57b08e48d0..93c7b0a290 100644
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
diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c
index b0c5c9857d..0dfd532ed4 100644
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
-- 
2.27.0


