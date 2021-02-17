Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 535BB31E35F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 01:05:27 +0100 (CET)
Received: from localhost ([::1]:48466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWow-0004PR-C2
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 19:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRz-0001Af-NH
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:46 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRj-0004mV-HB
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:38 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b21so9518501pgk.7
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LIEOAUG+JkwvNv25LtjNH0tsK4duimcTBk2bKR0/Buw=;
 b=krgYlL13NzzTk1X70Fk3CSTVMuaOruZ9+OjCq1fSrUpYmxg9RFAciByp1zeevHDvAi
 Wm44Mp5M4LLEBpiv+OJ50mc1+X38+2Wk8zmpNQa9v3g1K+sByPDTT/llVwwNj0Eq0qhl
 tnURF3iXoSF7lAkr9O/hDx1hqXbLYpfiB15yteIlIv2jmb+zAUIiBOPONrL27KGVrL83
 DCO9oAJkbtu2uP3L7GYU7bndgXj5KvUIWtjYck+acN9tSKwM49oXD1PMw7vqS5dkn95m
 trK+3Y6oFKccs/R+JemLfQezzIwNkkxUIWrl13k2hmQFV4Q4RCEBjvzPBi0jkDlFy21R
 bHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LIEOAUG+JkwvNv25LtjNH0tsK4duimcTBk2bKR0/Buw=;
 b=awuk/7h4yPr3e3nGcvQ23YMbv0WnCH0VbLbvrB2p4AdhOlDZqJ/htxitqri+9KDmv/
 OE/NpvIi403IUmTeV/GTAn/bq1B2B89Dst+4N89ZUrKRaxOb+pToHVwnTFzzPFs95xGK
 osk+s2wSjYFhdaStEXCppl2rvRin0EoGonbWP5hyhyFRtWFpNbKFO/P0ElTeWOgaQT3v
 fVarn6U8qnAbQ5K8fi47+QuHFFkf+KbIOCKg0f8Oc6a41b7eeUVkPbOK9qe0ym+OjahZ
 sAhTqCnSusYZVXKVm10ZDTgkgd4Vpom9hroEBZhMWmHlv++nru1fgqJHNXV2oLETZzLV
 hdmQ==
X-Gm-Message-State: AOAM531ZBtFM2CiD6nLqjASaEp5dSsJoCdRc2romiRuSzgr7dViupSlO
 a5L8npNcoW+kHK3nE8boGQkbhsAb8rUikg==
X-Google-Smtp-Source: ABdhPJxkHQBKYxriWlWM9iXlgpoUjUyu6137zHFGcd7to6yhoMrVw8/oDOy38ZZsTan8Yw46JaCAPw==
X-Received: by 2002:a62:8453:0:b029:1e4:3a6a:d5ba with SMTP id
 k80-20020a6284530000b02901e43a6ad5bamr1565727pfd.54.1613605285374; 
 Wed, 17 Feb 2021 15:41:25 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/35] Hexagon (target/hexagon) opcode data structures
Date: Wed, 17 Feb 2021 15:40:12 -0800
Message-Id: <20210217234023.1742406-25-richard.henderson@linaro.org>
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

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <1612763186-18161-24-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/opcodes.h |  58 ++++++++++++++++
 target/hexagon/opcodes.c | 142 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 target/hexagon/opcodes.h
 create mode 100644 target/hexagon/opcodes.c

diff --git a/target/hexagon/opcodes.h b/target/hexagon/opcodes.h
new file mode 100644
index 0000000000..6e90e00fe2
--- /dev/null
+++ b/target/hexagon/opcodes.h
@@ -0,0 +1,58 @@
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
+#ifndef HEXAGON_OPCODES_H
+#define HEXAGON_OPCODES_H
+
+typedef enum {
+#define OPCODE(IID) IID
+#include "opcodes_def_generated.h.inc"
+    XX_LAST_OPCODE
+#undef OPCODE
+} Opcode;
+
+typedef enum {
+    NORMAL,
+    HALF,
+    SUBINSN_A,
+    SUBINSN_L1,
+    SUBINSN_L2,
+    SUBINSN_S1,
+    SUBINSN_S2,
+    EXT_noext,
+    EXT_mmvec,
+    XX_LAST_ENC_CLASS
+} EncClass;
+
+extern const char * const opcode_names[];
+
+extern const char * const opcode_reginfo[];
+extern const char * const opcode_rregs[];
+extern const char * const opcode_wregs[];
+
+typedef struct {
+    const char * const encoding;
+    const EncClass enc_class;
+} OpcodeEncoding;
+
+extern const OpcodeEncoding opcode_encodings[XX_LAST_OPCODE];
+
+void opcode_init(void);
+
+int opcode_which_immediate_is_extended(Opcode opcode);
+
+#endif
diff --git a/target/hexagon/opcodes.c b/target/hexagon/opcodes.c
new file mode 100644
index 0000000000..4eef5fc40f
--- /dev/null
+++ b/target/hexagon/opcodes.c
@@ -0,0 +1,142 @@
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
+ * opcodes.c
+ *
+ * data tables generated automatically
+ * Maybe some functions too
+ */
+
+#include "qemu/osdep.h"
+#include "attribs.h"
+#include "decode.h"
+
+#define VEC_DESCR(A, B, C) DESCR(A, B, C)
+#define DONAME(X) #X
+
+const char * const opcode_names[] = {
+#define OPCODE(IID) DONAME(IID)
+#include "opcodes_def_generated.h.inc"
+    NULL
+#undef OPCODE
+};
+
+const char * const opcode_reginfo[] = {
+#define IMMINFO(TAG, SIGN, SIZE, SHAMT, SIGN2, SIZE2, SHAMT2)    /* nothing */
+#define REGINFO(TAG, REGINFO, RREGS, WREGS) REGINFO,
+#include "op_regs_generated.h.inc"
+    NULL
+#undef REGINFO
+#undef IMMINFO
+};
+
+
+const char * const opcode_rregs[] = {
+#define IMMINFO(TAG, SIGN, SIZE, SHAMT, SIGN2, SIZE2, SHAMT2)    /* nothing */
+#define REGINFO(TAG, REGINFO, RREGS, WREGS) RREGS,
+#include "op_regs_generated.h.inc"
+    NULL
+#undef REGINFO
+#undef IMMINFO
+};
+
+
+const char * const opcode_wregs[] = {
+#define IMMINFO(TAG, SIGN, SIZE, SHAMT, SIGN2, SIZE2, SHAMT2)    /* nothing */
+#define REGINFO(TAG, REGINFO, RREGS, WREGS) WREGS,
+#include "op_regs_generated.h.inc"
+    NULL
+#undef REGINFO
+#undef IMMINFO
+};
+
+const char * const opcode_short_semantics[] = {
+#define DEF_SHORTCODE(TAG, SHORTCODE)              [TAG] = #SHORTCODE,
+#include "shortcode_generated.h.inc"
+#undef DEF_SHORTCODE
+    NULL
+};
+
+DECLARE_BITMAP(opcode_attribs[XX_LAST_OPCODE], A_ZZ_LASTATTRIB);
+
+static void init_attribs(int tag, ...)
+{
+    va_list ap;
+    int attr;
+    va_start(ap, tag);
+    while ((attr = va_arg(ap, int)) != 0) {
+        set_bit(attr, opcode_attribs[tag]);
+    }
+}
+
+const OpcodeEncoding opcode_encodings[] = {
+#define DEF_ENC32(OPCODE, ENCSTR) \
+    [OPCODE] = { .encoding = ENCSTR },
+
+#define DEF_ENC_SUBINSN(OPCODE, CLASS, ENCSTR) \
+    [OPCODE] = { .encoding = ENCSTR, .enc_class = CLASS },
+
+#define DEF_EXT_ENC(OPCODE, CLASS, ENCSTR) \
+    [OPCODE] = { .encoding = ENCSTR, .enc_class = CLASS },
+
+#include "imported/encode.def"
+
+#undef DEF_ENC32
+#undef DEF_ENC_SUBINSN
+#undef DEF_EXT_ENC
+};
+
+void opcode_init(void)
+{
+    init_attribs(0, 0);
+
+#define ATTRIBS(...) , ## __VA_ARGS__, 0
+#define OP_ATTRIB(TAG, ARGS) init_attribs(TAG ARGS);
+#include "op_attribs_generated.h.inc"
+#undef OP_ATTRIB
+#undef ATTRIBS
+
+    decode_init();
+}
+
+
+#define NEEDLE "IMMEXT("
+
+int opcode_which_immediate_is_extended(Opcode opcode)
+{
+    const char *p;
+
+    g_assert(opcode < XX_LAST_OPCODE);
+    g_assert(GET_ATTRIB(opcode, A_EXTENDABLE));
+
+    p = opcode_short_semantics[opcode];
+    p = strstr(p, NEEDLE);
+    g_assert(p);
+    p += strlen(NEEDLE);
+    while (isspace(*p)) {
+        p++;
+    }
+    /* lower is always imm 0, upper always imm 1. */
+    if (islower(*p)) {
+        return 0;
+    } else if (isupper(*p)) {
+        return 1;
+    } else {
+        g_assert_not_reached();
+    }
+}
-- 
2.25.1


