Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87793ABADB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:49:02 +0200 (CEST)
Received: from localhost ([::1]:45232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltw8T-0007RY-RL
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw6M-0003Xk-9R
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:46:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw6K-0002uE-Jl
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:46:50 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a11so7705157wrt.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDQm9DpsNmYxvtGWJs0R9tBWsFhduwTnC55OIbQEXSs=;
 b=LnRKeQu3AParML8aJlK7eJ4g1XjHLAA/x2Xc/T4d2/dO9lm3ozdRUy8dqU8gyzPaCn
 7U00YYCuDNARXX/ys7PGnQsXR8+mcURuJsK4x5gmo8pISq9ov08PdLP/hoURGWveWjDf
 2gc6qlZPXTXA+FvP+nWXhv6lGYCLFF9LWOwRo97Y9c56rpFLfA8R2dwtzd1Zc5H5Kpne
 itoC6KfK9vmWVQF1citBh0YY5hoEKT/xlhKaNkp+74luTVpzAAnOGpLWlVH+qzhcKmoB
 ZToHKwuOi41ixmm3Gr1jQVRTaGYZnbNoR0jaHuavwUrXYFnX0c8+15SZGe62HmJW6lFx
 4a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HDQm9DpsNmYxvtGWJs0R9tBWsFhduwTnC55OIbQEXSs=;
 b=DBI+yg4FQA/nGrE6eLXTqOx6BtDhgpX3DYfOl4etxPnbO4OlfRnh1TvGlkXVRXiGMa
 96RpelUzygbfIU6kyt6rjtGanzvgrdE9C4hDCIuKBaxwjH2QmIOkapH6rs+kEgqF/V/W
 KzcGf8AXjryuI0rDihIuratBYyBGeFVUOWpwyr0ZVySlxToJzaZPgTGyD+2AxnvU8qUu
 uYrftNDRPJA2oPExsJP36b1MNOJGkGsZO0mMaJ7ijuddAvRi0ewOsUzOR+bhu07z1DoS
 pDnqg52MEbQPeKsM46rdQqr2uKcwnprrVoWew9msC7ZPeeOHbljO8qUwqjhhtOyc+cxq
 /Z4A==
X-Gm-Message-State: AOAM5303kQ28Pwr3LZ7VhFBu4Tf9nwpdsZqySln9UGTELzxAG1cOPSvo
 dCBl2F5t8axNuSt3iyPDJQoulkAaGx70lw==
X-Google-Smtp-Source: ABdhPJzf2HTrlzVtXtSdHRVd2uIVR2DhUFihhd6bJ+wMlORTZ2DlLguFEwTiBAcTW/C9ZxE9C5SVQQ==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr7076715wrm.178.1623952006996; 
 Thu, 17 Jun 2021 10:46:46 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j11sm5255178wmq.4.2021.06.17.10.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:46:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/mips: Merge msa32/msa64 decodetree definitions
Date: Thu, 17 Jun 2021 19:46:36 +0200
Message-Id: <20210617174636.2902654-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174636.2902654-1-f4bug@amsat.org>
References: <20210617174636.2902654-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to maintain 2 sets of decodetree definitions.
Merge them into a single file.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/{msa32.decode => msa.decode} |  8 +++++---
 target/mips/tcg/msa64.decode                 | 17 -----------------
 target/mips/tcg/msa_translate.c              | 14 ++++----------
 target/mips/tcg/meson.build                  |  3 +--
 4 files changed, 10 insertions(+), 32 deletions(-)
 rename target/mips/tcg/{msa32.decode => msa.decode} (74%)
 delete mode 100644 target/mips/tcg/msa64.decode

diff --git a/target/mips/tcg/msa32.decode b/target/mips/tcg/msa.decode
similarity index 74%
rename from target/mips/tcg/msa32.decode
rename to target/mips/tcg/msa.decode
index ca200e373b1..bf132e36b9b 100644
--- a/target/mips/tcg/msa32.decode
+++ b/target/mips/tcg/msa.decode
@@ -6,9 +6,10 @@
 #
 # Reference:
 #       MIPS Architecture for Programmers Volume IV-j
-#       The MIPS32 SIMD Architecture Module, Revision 1.12
-#       (Document Number: MD00866-2B-MSA32-AFP-01.12)
-#
+#       - The MIPS32 SIMD Architecture Module, Revision 1.12
+#         (Document Number: MD00866-2B-MSA32-AFP-01.12)
+#       - The MIPS64 SIMD Architecture Module, Revision 1.12
+#         (Document Number: MD00868-1D-MSA64-AFP-01.12)
 
 &rtype              rs rt rd sa
 
@@ -19,6 +20,7 @@
 @bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
+DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
 
 BZ_V                010001 01011  ..... ................    @bz
 BNZ_V               010001 01111  ..... ................    @bz
diff --git a/target/mips/tcg/msa64.decode b/target/mips/tcg/msa64.decode
deleted file mode 100644
index d2442474d0b..00000000000
--- a/target/mips/tcg/msa64.decode
+++ /dev/null
@@ -1,17 +0,0 @@
-# MIPS SIMD Architecture Module instruction set
-#
-# Copyright (C) 2020  Philippe Mathieu-Daudé
-#
-# SPDX-License-Identifier: LGPL-2.1-or-later
-#
-# Reference:
-#       MIPS Architecture for Programmers Volume IV-j
-#       The MIPS64 SIMD Architecture Module, Revision 1.12
-#       (Document Number: MD00868-1D-MSA64-AFP-01.12)
-#
-
-&rtype              rs rt rd sa !extern
-
-@lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &rtype
-
-DLSA                 000000 ..... ..... ..... 000 .. 010101 @lsa
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 429039cc7c9..1ce0d87168c 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -18,8 +18,7 @@
 #include "internal.h"
 
 /* Include the auto-generated decoder.  */
-#include "decode-msa32.c.inc"
-#include "decode-msa64.c.inc"
+#include "decode-msa.c.inc"
 
 #define OPC_MSA (0x1E << 26)
 
@@ -2269,13 +2268,8 @@ static bool trans_LSA(DisasContext *ctx, arg_rtype *a)
 
 static bool trans_DLSA(DisasContext *ctx, arg_rtype *a)
 {
+    if (TARGET_LONG_BITS != 64) {
+        return false;
+    }
     return gen_dlsa(ctx, a->rd, a->rt, a->rs, a->sa);
 }
-
-bool decode_ase_msa(DisasContext *ctx, uint32_t insn)
-{
-    if (TARGET_LONG_BITS == 64 && decode_msa64(ctx, insn)) {
-        return true;
-    }
-    return decode_msa32(ctx, insn);
-}
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
index 5d8acbaf0d3..bf4001e5741 100644
--- a/target/mips/tcg/meson.build
+++ b/target/mips/tcg/meson.build
@@ -1,8 +1,7 @@
 gen = [
   decodetree.process('mips32r6.decode', extra_args: '--static-decode=decode_mips32r6'),
   decodetree.process('mips64r6.decode', extra_args: '--static-decode=decode_mips64r6'),
-  decodetree.process('msa32.decode', extra_args: '--static-decode=decode_msa32'),
-  decodetree.process('msa64.decode', extra_args: '--static-decode=decode_msa64'),
+  decodetree.process('msa.decode', extra_args: '--decode=decode_ase_msa'),
   decodetree.process('tx79.decode', extra_args: '--static-decode=decode_tx79'),
 ]
 
-- 
2.31.1


