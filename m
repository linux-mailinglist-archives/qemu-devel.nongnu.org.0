Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FA631E358
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:59:33 +0100 (CET)
Received: from localhost ([::1]:59300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWjE-0005IR-1u
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRp-00018K-Tk
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:35 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRg-0004lb-Gc
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:33 -0500
Received: by mail-pg1-x52b.google.com with SMTP id m2so9526031pgq.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wCQDJjv5dp1zQTdh7sTFK04v3fhiE0inPOMJx+iX1dA=;
 b=worM/Tbigbf1l/K87YSNHmoSzFS6/Lv50RxjSiYN071gU/oau9iGbEzfJNSQlGt4PD
 CbELLvSn/GojjkNsygroIyGWaCZoiCKnuZaeORPj1UFx8qUTA7QZJwCC85F5iYeJiLaR
 nFau/oiRoHDvj3rPjZQeabIG5lYbh6LDOcYgj34kPWF0DCS3uvdX+Uy4DD93mziFvidv
 rAvfymK+dfp5rfMi+WKixj0DasRHXxLyw4Lgy0CGIEYA0m21N+3zLn3tZxboJq473O4S
 doupX0SxDNyj49VpL/qSzZdZmCLYa++mlYujDUN6ue+BL6zpA6shYmp7lqZcGzShIV5o
 kBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wCQDJjv5dp1zQTdh7sTFK04v3fhiE0inPOMJx+iX1dA=;
 b=MoZy6AWfq1W0dH+iS2K+UecdMG9smyTAnaaw8bnjvguiyt5CCFRETk5xLjDvcaFQll
 PuEjezM2e27VacZLXOavZ23bal4wHVFgeqIESvNEx0rfZpP03OcOu9bk5iqWCtTmzrMS
 3WHiH5fNxaDPtPSgUOjbffDomQlLs2JeLWspsSg5Kl7jr04BMwoTWEg2O5k/fWW4ti2S
 Bj3sQv8TT4rS/S3jhma+kbZvjpWGYjjZ1U+rSK3+y//Jbzm1ESGF3ZGt6WXyCmAIkuvT
 57edr8VNjlcdPY4mn8nabm2ap6fjWSatlLN5S/31EEwe49atiIYjG2UFN0o3WjZ6OVvN
 y3Ew==
X-Gm-Message-State: AOAM530bKgjMHqA5Lff5Yrxt13xTznIsAcmcAAUyrjh9lcGklIXTJhbO
 pmysQkmNM8btEmTRioxJksu8ME8To3qIHA==
X-Google-Smtp-Source: ABdhPJyOm3C8xpoTRSAbqdHsszxfJLpCo+WXFcqqs0NxkQbf9WbmTAqhONz+xdIjgeNs+rzG5KBf1w==
X-Received: by 2002:a62:6382:0:b029:1d2:46ed:d813 with SMTP id
 x124-20020a6263820000b02901d246edd813mr1475280pfb.44.1613605273575; 
 Wed, 17 Feb 2021 15:41:13 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/35] Hexagon (target/hexagon) generator phase 1 - C
 preprocessor for semantics
Date: Wed, 17 Feb 2021 15:40:08 -0800
Message-Id: <20210217234023.1742406-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Run the C preprocessor across the instruction definition files and macro
definition file to expand macros and prepare the semantics_generated.pyinc
file.  The resulting file contains one entry with the semantics for each
instruction and one line with the instruction attributes associated with
each macro.

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-20-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_semantics.c | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 target/hexagon/gen_semantics.c

diff --git a/target/hexagon/gen_semantics.c b/target/hexagon/gen_semantics.c
new file mode 100644
index 0000000000..c5fccecc9e
--- /dev/null
+++ b/target/hexagon/gen_semantics.c
@@ -0,0 +1,88 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * This program generates the semantics file that is processed by
+ * the do_qemu.py script.  We use the C preporcessor to manipulate the
+ * files imported from the Hexagon architecture library.
+ */
+
+#include <stdio.h>
+#define STRINGIZE(X) #X
+
+int main(int argc, char *argv[])
+{
+    FILE *outfile;
+
+    if (argc != 2) {
+        fprintf(stderr, "Usage: gen_semantics ouptputfile\n");
+        return 1;
+    }
+    outfile = fopen(argv[1], "w");
+    if (outfile == NULL) {
+        fprintf(stderr, "Cannot open %s for writing\n", argv[1]);
+        return 1;
+    }
+
+/*
+ * Process the instruction definitions
+ *     Scalar core instructions have the following form
+ *         Q6INSN(A2_add,"Rd32=add(Rs32,Rt32)",ATTRIBS(),
+ *         "Add 32-bit registers",
+ *         { RdV=RsV+RtV;})
+ */
+#define Q6INSN(TAG, BEH, ATTRIBS, DESCR, SEM) \
+    do { \
+        fprintf(outfile, "SEMANTICS( \\\n" \
+                         "    \"%s\", \\\n" \
+                         "    %s, \\\n" \
+                         "    \"\"\"%s\"\"\" \\\n" \
+                         ")\n", \
+                #TAG, STRINGIZE(BEH), STRINGIZE(SEM)); \
+        fprintf(outfile, "ATTRIBUTES( \\\n" \
+                         "    \"%s\", \\\n" \
+                         "    \"%s\" \\\n" \
+                         ")\n", \
+                #TAG, STRINGIZE(ATTRIBS)); \
+    } while (0);
+#include "imported/allidefs.def"
+#undef Q6INSN
+
+/*
+ * Process the macro definitions
+ *     Macros definitions have the following form
+ *         DEF_MACRO(
+ *             fLSBNEW0,
+ *             predlog_read(thread,0),
+ *             ()
+ *         )
+ * The important part here is the attributes.  Whenever an instruction
+ * invokes a macro, we add the macro's attributes to the instruction.
+ */
+#define DEF_MACRO(MNAME, BEH, ATTRS) \
+    fprintf(outfile, "MACROATTRIB( \\\n" \
+                     "    \"%s\", \\\n" \
+                     "    \"\"\"%s\"\"\", \\\n" \
+                     "    \"%s\" \\\n" \
+                     ")\n", \
+            #MNAME, STRINGIZE(BEH), STRINGIZE(ATTRS));
+#include "imported/macros.def"
+#undef DEF_MACRO
+
+    fclose(outfile);
+    return 0;
+}
-- 
2.25.1


