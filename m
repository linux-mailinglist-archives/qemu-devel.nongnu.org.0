Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA5631E33C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:51:04 +0100 (CET)
Received: from localhost ([::1]:34662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWb1-00038v-QE
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRD-0008Kq-HZ
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:55 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRA-0004dd-T1
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:55 -0500
Received: by mail-pj1-x102a.google.com with SMTP id c19so240503pjq.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Ct613QdC6dlEWBE/nYo3PltwiwMWPpntLMKNmtZ7L0=;
 b=I/cqg8RjinVjqos4iKyz2HBGWbSW1e7hWaq+Tt3vI2f4ch6l04uHgSF0W3c9GBUBCy
 CQIiNwPvxHHZZDdKcPWYASM89B3sTEfZxJLrTMwGsliq9MHKatDvc55Xm+IMY0XZ9O6c
 m1HlTUszkxrOF0dREQ28Q/pjCBQqZbqFDml2A1KEnXLHu8DVj2+xesJwKQn58EyIaKlo
 tkYcNwze7iSxt73o9y1/o0WQ9WRIOy1G03N4kdWsoarN9Dtb5P1bTPS9wSwuLOomqtYK
 w+lbCcpGk9dAnFRTf0AlBKHNFwsOhzDJDOHbOPPe4259lsnIzK0cebZaDRHr2QGl+Be3
 6kCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Ct613QdC6dlEWBE/nYo3PltwiwMWPpntLMKNmtZ7L0=;
 b=czCdYMA6ysTgdbjV9ipwdnKWPkBhb7xVM3DWr22l06oZKkwMSikCvGjlQjT2Iw6O02
 z/b5s+guaZwLg1YswL3p+teQWiz70qwCHI3sBaUAzD+An6s2R9rCY0wCshrOb8tRpeQk
 9ciIzwYKoPXnkrIWvdUG+qWvsvLoIz6f9i7wLz/yAo6lElPkJBnxtXxgXtfnN8VZ1r5U
 upIaXiD/wz9tgoG3YlQUCftYPSKOCov/HcXzMA/P38GwAQgylepAFzxxTaAcT4mGdaUP
 g2IJm3RukunZuiqES3gh/yHnF9ZspvM0Vo9tmlPTM78E3evOXrHiNLxwHushK05pIkcP
 Qf9w==
X-Gm-Message-State: AOAM530wUH5tRVcfODnVHm3gEgbFOIbUPgBm9vhhCK51Nuwni2Vs6fzL
 M1cEef0luqI61Dt2OKl5xjsxXEcZheBn6g==
X-Google-Smtp-Source: ABdhPJzQg4oxaWamFDYOoBUZBrm3T8x2xmJEjvE8dYIME7J/hfHXJ8MCbrEck3yjd0mkqO5Y49FP6w==
X-Received: by 2002:a17:902:8201:b029:e3:95d2:eb0a with SMTP id
 x1-20020a1709028201b02900e395d2eb0amr1575092pln.43.1613605251352; 
 Wed, 17 Feb 2021 15:40:51 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/35] Hexagon (target/hexagon) instruction and packet types
Date: Wed, 17 Feb 2021 15:39:59 -0800
Message-Id: <20210217234023.1742406-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

The insn_t and packet_t are the interface between instruction decoding and
TCG code generation

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-11-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/insn.h | 74 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 target/hexagon/insn.h

diff --git a/target/hexagon/insn.h b/target/hexagon/insn.h
new file mode 100644
index 0000000000..5756a1d0ca
--- /dev/null
+++ b/target/hexagon/insn.h
@@ -0,0 +1,74 @@
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
+#ifndef HEXAGON_INSN_H
+#define HEXAGON_INSN_H
+
+#include "cpu.h"
+
+#define INSTRUCTIONS_MAX 7    /* 2 pairs + loopend */
+#define REG_OPERANDS_MAX 5
+#define IMMEDS_MAX 2
+
+struct Instruction;
+struct Packet;
+struct DisasContext;
+
+typedef void (*SemanticInsn)(CPUHexagonState *env,
+                             struct DisasContext *ctx,
+                             struct Instruction *insn,
+                             struct Packet *pkt);
+
+struct Instruction {
+    SemanticInsn generate;            /* pointer to genptr routine */
+    uint8_t regno[REG_OPERANDS_MAX];    /* reg operands including predicates */
+    uint16_t opcode;
+
+    uint32_t iclass:6;
+    uint32_t slot:3;
+    uint32_t part1:1;        /*
+                              * cmp-jumps are split into two insns.
+                              * set for the compare and clear for the jump
+                              */
+    uint32_t extension_valid:1;   /* Has a constant extender attached */
+    uint32_t which_extended:1;    /* If has an extender, which immediate */
+    uint32_t is_endloop:1;   /* This is an end of loop */
+    uint32_t new_value_producer_slot:4;
+    int32_t immed[IMMEDS_MAX];    /* immediate field */
+};
+
+typedef struct Instruction Insn;
+
+struct Packet {
+    uint16_t num_insns;
+    uint16_t encod_pkt_size_in_bytes;
+
+    /* Pre-decodes about COF */
+    uint32_t pkt_has_cof:1;          /* Has any change-of-flow */
+    uint32_t pkt_has_endloop:1;
+
+    uint32_t pkt_has_dczeroa:1;
+
+    uint32_t pkt_has_store_s0:1;
+    uint32_t pkt_has_store_s1:1;
+
+    Insn insn[INSTRUCTIONS_MAX];
+};
+
+typedef struct Packet Packet;
+
+#endif
-- 
2.25.1


