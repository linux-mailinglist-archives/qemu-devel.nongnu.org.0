Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4431E33A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:50:54 +0100 (CET)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWar-0002rv-Mz
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRh-00013A-Lf
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:25 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRf-0004lU-EM
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:25 -0500
Received: by mail-pg1-x52f.google.com with SMTP id z68so6698pgz.0
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fu/TR1IVvSb6dKMp4A2TQfufe4q9OBagOWhl4/lILBg=;
 b=LYWjHzQN5d9jp5sggv/RN+C4reTcwbUrWgtX4vBlO2ruW5bsbRZ2eRM+X+fqYQVeYp
 82FG2d1ckTM0EezFpMzkgC6jiciAUVEtUk79ZTZvrNkCKkvH3J30nh9q9/u79oGqLhrV
 JIhHQIq/0dBb2YT2RqFHjbEp5mEOtM/du9J2ZE58LtxvpLKDIKa3HBfZMRsGmQPJNmkO
 bRhetNFnh7Vy5DRS66qDzAk8WiyjDA0D/EcnpW0bfrnI0tDvcDZu8vxrFUpctYlZxCi+
 /8PUq5HqX2pmBAx5SVCt9e1EeYnoMA4QDijF9KFnwVj7JMIBvkastvwl4pv42PAxUmID
 x9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fu/TR1IVvSb6dKMp4A2TQfufe4q9OBagOWhl4/lILBg=;
 b=BsqqxFn07JwAf8d1LYtht/IZKqu0AhC0Sp6QiEKex96U1xXVv0W1PBS3pt6b+jECDC
 arQ70AAFEGLm/sKXuW/BpVgn2aI1z13LOw34tWePcQvKe1cnQS0gjq/Om5CRyGZjS7cf
 leMTdsXyX7UF1+mV/44YGU5HMbWMn7M1FO+y/MsRwP9rcJl1Rb7iaY2XCl+aN5ctISXr
 jT4i3drHDNwXU2qarrHE4N+nNdkSCaruZM4RxD3tm577/RJTW13ZxadLQd1gPXz5zpQl
 sL+aU5PXtYaUgx6od/ICgYIhUq8dNxz9w6wxPA8i+V+mm3XBFcNc8SwyyGdwGZ1pFTeA
 exKQ==
X-Gm-Message-State: AOAM533g0UEPZGx1q4NArx/NpJEJmbYlQEYKGohCvfNIJbfYbqFyKwoS
 WH1sMfSO3csQyZkyJafQv3DeSMVVqsZ0iw==
X-Google-Smtp-Source: ABdhPJylZjLl80OC7yy10Ole3RWoWhhN/cTXjnlsxfzepNLldDDIKTkJsAbtYhiyDxLMsAIkiFOtcQ==
X-Received: by 2002:a62:7808:0:b029:1df:1e0c:3263 with SMTP id
 t8-20020a6278080000b02901df1e0c3263mr1505398pfc.21.1613605281893; 
 Wed, 17 Feb 2021 15:41:21 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/35] Hexagon (target/hexagon) generator phase 3 - C
 preprocessor for decode tree
Date: Wed, 17 Feb 2021 15:40:10 -0800
Message-Id: <20210217234023.1742406-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Run the C preprocessor across the instruction definition and encoding
files to expand macros and prepare the iset.py file.  The resulting
fill contains python data structures used to build the decode tree.

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-22-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_dectree_import.c | 188 ++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 target/hexagon/gen_dectree_import.c

diff --git a/target/hexagon/gen_dectree_import.c b/target/hexagon/gen_dectree_import.c
new file mode 100644
index 0000000000..5b7ecfc6b3
--- /dev/null
+++ b/target/hexagon/gen_dectree_import.c
@@ -0,0 +1,188 @@
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
+ * This program generates the encodings file that is processed by
+ * the dectree.py script to produce the decoding tree.  We use the C
+ * preprocessor to manipulate the files imported from the Hexagon
+ * architecture library.
+ */
+#include <stdio.h>
+#include <string.h>
+#include "opcodes.h"
+
+#define STRINGIZE(X)    #X
+
+const char * const opcode_names[] = {
+#define OPCODE(IID) STRINGIZE(IID)
+#include "opcodes_def_generated.h.inc"
+    NULL
+#undef OPCODE
+};
+
+/*
+ * Process the instruction definitions
+ *     Scalar core instructions have the following form
+ *         Q6INSN(A2_add,"Rd32=add(Rs32,Rt32)",ATTRIBS(),
+ *         "Add 32-bit registers",
+ *         { RdV=RsV+RtV;})
+ */
+const char * const opcode_syntax[XX_LAST_OPCODE] = {
+#define Q6INSN(TAG, BEH, ATTRIBS, DESCR, SEM) \
+   [TAG] = BEH,
+#define EXTINSN(TAG, BEH, ATTRIBS, DESCR, SEM) \
+   [TAG] = BEH,
+#include "imported/allidefs.def"
+#undef Q6INSN
+#undef EXTINSN
+};
+
+const char * const opcode_rregs[] = {
+#define REGINFO(TAG, REGINFO, RREGS, WREGS) RREGS,
+#define IMMINFO(TAG, SIGN, SIZE, SHAMT, SIGN2, SIZE2, SHAMT2)  /* nothing */
+#include "op_regs_generated.h.inc"
+    NULL
+#undef REGINFO
+#undef IMMINFO
+};
+
+const char * const opcode_wregs[] = {
+#define REGINFO(TAG, REGINFO, RREGS, WREGS) WREGS,
+#define IMMINFO(TAG, SIGN, SIZE, SHAMT, SIGN2, SIZE2, SHAMT2)  /* nothing */
+#include "op_regs_generated.h.inc"
+    NULL
+#undef REGINFO
+#undef IMMINFO
+};
+
+const OpcodeEncoding opcode_encodings[] = {
+#define DEF_ENC32(TAG, ENCSTR) \
+    [TAG] = { .encoding = ENCSTR },
+#define DEF_ENC_SUBINSN(TAG, CLASS, ENCSTR) \
+    [TAG] = { .encoding = ENCSTR, .enc_class = CLASS },
+#define DEF_EXT_ENC(TAG, CLASS, ENCSTR) \
+    [TAG] = { .encoding = ENCSTR, .enc_class = CLASS },
+#include "imported/encode.def"
+#undef DEF_ENC32
+#undef DEF_ENC_SUBINSN
+#undef DEF_EXT_ENC
+};
+
+static const char * const opcode_enc_class_names[XX_LAST_ENC_CLASS] = {
+    "NORMAL",
+    "16BIT",
+    "SUBINSN_A",
+    "SUBINSN_L1",
+    "SUBINSN_L2",
+    "SUBINSN_S1",
+    "SUBINSN_S2",
+    "EXT_noext",
+    "EXT_mmvec",
+};
+
+static const char *get_opcode_enc(int opcode)
+{
+    const char *tmp = opcode_encodings[opcode].encoding;
+    if (tmp == NULL) {
+        tmp = "MISSING ENCODING";
+    }
+    return tmp;
+}
+
+static const char *get_opcode_enc_class(int opcode)
+{
+    return opcode_enc_class_names[opcode_encodings[opcode].enc_class];
+}
+
+static void gen_iset_table(FILE *out)
+{
+    int i;
+
+    fprintf(out, "iset = {\n");
+    for (i = 0; i < XX_LAST_OPCODE; i++) {
+        fprintf(out, "\t\'%s\' : {\n", opcode_names[i]);
+        fprintf(out, "\t\t\'tag\' : \'%s\',\n", opcode_names[i]);
+        fprintf(out, "\t\t\'syntax\' : \'%s\',\n", opcode_syntax[i]);
+        fprintf(out, "\t\t\'rregs\' : \'%s\',\n", opcode_rregs[i]);
+        fprintf(out, "\t\t\'wregs\' : \'%s\',\n", opcode_wregs[i]);
+        fprintf(out, "\t\t\'enc\' : \'%s\',\n", get_opcode_enc(i));
+        fprintf(out, "\t\t\'enc_class\' : \'%s\',\n", get_opcode_enc_class(i));
+        fprintf(out, "\t},\n");
+    }
+    fprintf(out, "};\n\n");
+}
+
+static void gen_tags_list(FILE *out)
+{
+    int i;
+
+    fprintf(out, "tags = [\n");
+    for (i = 0; i < XX_LAST_OPCODE; i++) {
+        fprintf(out, "\t\'%s\',\n", opcode_names[i]);
+    }
+    fprintf(out, "];\n\n");
+}
+
+static void gen_enc_ext_spaces_table(FILE *out)
+{
+    fprintf(out, "enc_ext_spaces = {\n");
+#define DEF_EXT_SPACE(SPACEID, ENCSTR) \
+    fprintf(out, "\t\'%s\' : \'%s\',\n", #SPACEID, ENCSTR);
+#include "imported/encode.def"
+#undef DEF_EXT_SPACE
+    fprintf(out, "};\n\n");
+}
+
+static void gen_subinsn_groupings_table(FILE *out)
+{
+    fprintf(out, "subinsn_groupings = {\n");
+#define DEF_PACKED32(TAG, TYPEA, TYPEB, ENCSTR) \
+    do { \
+        fprintf(out, "\t\'%s\' : {\n", #TAG); \
+        fprintf(out, "\t\t\'name\' : \'%s\',\n", #TAG); \
+        fprintf(out, "\t\t\'class_a\' : \'%s\',\n", #TYPEA); \
+        fprintf(out, "\t\t\'class_b\' : \'%s\',\n", #TYPEB); \
+        fprintf(out, "\t\t\'enc\' : \'%s\',\n", ENCSTR); \
+        fprintf(out, "\t},\n"); \
+    } while (0);
+#include "imported/encode.def"
+#undef DEF_PACKED32
+    fprintf(out, "};\n\n");
+}
+
+int main(int argc, char *argv[])
+{
+    FILE *outfile;
+
+    if (argc != 2) {
+        fprintf(stderr, "Usage: gen_dectree_import ouptputfile\n");
+        return 1;
+    }
+    outfile = fopen(argv[1], "w");
+    if (outfile == NULL) {
+        fprintf(stderr, "Cannot open %s for writing\n", argv[1]);
+        return 1;
+    }
+
+    gen_iset_table(outfile);
+    gen_tags_list(outfile);
+    gen_enc_ext_spaces_table(outfile);
+    gen_subinsn_groupings_table(outfile);
+
+    fclose(outfile);
+    return 0;
+}
-- 
2.25.1


