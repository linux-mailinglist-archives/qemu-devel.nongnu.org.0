Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EB539E4CF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:06:40 +0200 (CEST)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIhy-0000SX-Na
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaE-0007NO-2Y
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:38 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa9-0007u8-Gb
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:37 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r9so1729922wrz.10
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iY76aJwB+mbu7BatyWo5ZgTCehVn9Ly4x7fuNCDZ8aY=;
 b=mmSf0YpJOSVmFPcnPudPRbUA92RsY8I4CXrmsiaPOBipmqa4Mvi2ZATM7TItBzDTCx
 1OaokDzvR5jHk9BCCjq8iEjTEWy31qNbrxHCuokh0liRSYHv5J2Fat5wislQLhvU3882
 OcD4cmXuinV29E40Y0Yhduc4EfMCoW4OfSzYQMyBvBT4czDMgoxBNmA4TP58R9Z3+kij
 t188MRrT1xko9YthKzzO27yJtPiXxd7NmlsDUHs62zg9OgbvsSO6I8Ayztye5W4kUxBi
 bT0OF2Dz90hzidC4SO8ALJbfLhXPTxLMq4Cs+T3WdWzX4YVXo6ZaCQYNgX2k9TOHHx3p
 Rveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iY76aJwB+mbu7BatyWo5ZgTCehVn9Ly4x7fuNCDZ8aY=;
 b=tbE/UclZiS8Y/mP0GUsVqkQZCQzDRn7EAAdlEoo6PcHy5sJfW5TcWCfaKlDNI5cUOo
 2lrtUqoBKvPREsr0Lc5d8YJ1wfn1x9ZwcRWXXD4fj2yu3i+nc7XQpQTPS6S/qiRaCjjU
 j3RQT1U/fDyOyXcVRoj6sQQvQySUw3Znyk40nwoSNAdU1mLIVO9y6NWaDratyp7VmMa3
 2xkIBejKVzJ52JjyEz9cTR3RAJKOlaJI8MZ5UWTFBEho4lcKswyMJ+LnRty+bVbr8XQf
 jdI2KVr7N8NxCLgJUoZXOJaoZK5k1EdFmOF1c3qmmTf4TGOIwQvaMOxG6b4du47cKNAR
 K1Og==
X-Gm-Message-State: AOAM531cHCqkHjzSv0MMq4j8IuPoz98C7JCZMNdkLOELwRDV5x1Mz1Dg
 vtyvGGJZqS8Mog2RYjoxPbpENg==
X-Google-Smtp-Source: ABdhPJwG8fXrCERhT5HUPv3LScMjhy7Ps2mgw+ITOclLkL5kpKd/tZvhgKXpQ2M0WW6y2G1kUYyvrA==
X-Received: by 2002:a05:6000:1849:: with SMTP id
 c9mr18484206wri.140.1623085112233; 
 Mon, 07 Jun 2021 09:58:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/55] target/arm: Add framework for MVE decode
Date: Mon,  7 Jun 2021 17:57:36 +0100
Message-Id: <20210607165821.9892-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the framework for decoding MVE insns, with the necessary new
files and the meson.build rules, but no actual content yet.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h |  1 +
 target/arm/mve.decode      | 20 ++++++++++++++++++++
 target/arm/translate-mve.c | 29 +++++++++++++++++++++++++++++
 target/arm/translate.c     |  1 +
 target/arm/meson.build     |  2 ++
 5 files changed, 53 insertions(+)
 create mode 100644 target/arm/mve.decode
 create mode 100644 target/arm/translate-mve.c

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index c946ac440ce..0a0053949f5 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -22,6 +22,7 @@
 
 /* Prototypes for autogenerated disassembler functions */
 bool disas_m_nocp(DisasContext *dc, uint32_t insn);
+bool disas_mve(DisasContext *dc, uint32_t insn);
 bool disas_vfp(DisasContext *s, uint32_t insn);
 bool disas_vfp_uncond(DisasContext *s, uint32_t insn);
 bool disas_neon_dp(DisasContext *s, uint32_t insn);
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
new file mode 100644
index 00000000000..c8492bb5763
--- /dev/null
+++ b/target/arm/mve.decode
@@ -0,0 +1,20 @@
+# M-profile MVE instruction descriptions
+#
+#  Copyright (c) 2021 Linaro, Ltd
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+
+#
+# This file is processed by scripts/decodetree.py
+#
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
new file mode 100644
index 00000000000..c54d5cb7305
--- /dev/null
+++ b/target/arm/translate-mve.c
@@ -0,0 +1,29 @@
+/*
+ *  ARM translation: M-profile MVE instructions
+
+ *  Copyright (c) 2021 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "tcg/tcg-op.h"
+#include "tcg/tcg-op-gvec.h"
+#include "exec/exec-all.h"
+#include "exec/gen-icount.h"
+#include "translate.h"
+#include "translate-a32.h"
+
+/* Include the generated decoder */
+#include "decode-mve.c.inc"
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6d70c89961a..ee17125465b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8919,6 +8919,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     if (disas_t32(s, insn) ||
         disas_vfp_uncond(s, insn) ||
         disas_neon_shared(s, insn) ||
+        disas_mve(s, insn) ||
         ((insn >> 28) == 0xe && disas_vfp(s, insn))) {
         return;
     }
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 5bfaf43b500..2b50be3f862 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -6,6 +6,7 @@ gen = [
   decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
   decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
+  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
@@ -27,6 +28,7 @@ arm_ss.add(files(
   'tlb_helper.c',
   'translate.c',
   'translate-m-nocp.c',
+  'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
-- 
2.20.1


