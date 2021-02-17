Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4836D31E345
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:54:18 +0100 (CET)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWe9-0006dq-Bf
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRH-0008U2-2g
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:59 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRE-0004ek-QV
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:58 -0500
Received: by mail-pj1-x102c.google.com with SMTP id t2so269301pjq.2
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGnaYxKKBgT3k2qwC/vFmzHYIKgNtQ/wsfJ4eKxQ8qk=;
 b=BD4LmWgkWmSTY7UpudGTrM66DwiVhJLaditD9NfIaYrAZK34zawRmleVyjBlrELM3f
 xGwNtPDfLzTTD6HGsth3BsDGU34xWGNR/GX0Gx8YeCNG+Nem7Up+gZweMp5+GIuAgzR/
 vgxdVT2iU4zCkM96HRX44K+IFdpzo2Zfk1kwz217FY5lxzYKid/bIEAml1BtBLo9ShDO
 i2wSlYx2wWiMfrjGoPsCHQsDCDd8giWgeKoEVj3cLlAi0Mgnor/He+Fvmc3dBWdpd/Lp
 5fNvHnL49BRBGCLgmbA6PveDU2RVKqz3ZG7CJv8vUebzIPNKVAC7bDj9yp2k+ZIQ3uLz
 ayyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGnaYxKKBgT3k2qwC/vFmzHYIKgNtQ/wsfJ4eKxQ8qk=;
 b=eTnYH0VHUh569S4f7KxxbCFpOD5rhf4oMjHxWrOPN3wLv/ma6DW5PpgQy3gsDsOLV7
 o93JV79TKwW0aXZwgpXrI+WVtGwb2FAw+DP476ulpSZkTMPNV9u3cOGf3o4g4uLjLGNc
 PoxpHqik/wKu+N1nVjKMZiP92idm4N7oIdm+fxXJVWZ2gejteU2NBZ7cWkG8MV2M3xd7
 YL68Lzk9lpL3ScDawsCZPv8aXALGAiIk8/whPGy93I4/ZLxzvg0g2bwV44uSVcRu2bEd
 ITtIscl9PFvUD7mM4SWVr015gR+7uNsOgkOZD+MjjL0axrK3X+mmfjlAzqQBWwyee4VP
 QkdA==
X-Gm-Message-State: AOAM530hpNDRz/4k8CIayPS4t0RbOnh5D/YhurBMR+OJhe45FSRbWQps
 Wacpc94UgzvN3y4a78QwT6G8qOTYurE2xQ==
X-Google-Smtp-Source: ABdhPJws/qTTxlH0xGROVRzaUqKxnUiJBotQwp7FGRUKIq4/w6fDKl1IyyYF7zm+UU/lYD3pj4pC1w==
X-Received: by 2002:a17:902:8501:b029:e2:ebb4:6e77 with SMTP id
 bj1-20020a1709028501b02900e2ebb46e77mr1346757plb.43.1613605255386; 
 Wed, 17 Feb 2021 15:40:55 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/35] Hexagon (target/hexagon) instruction attributes
Date: Wed, 17 Feb 2021 15:40:01 -0800
Message-Id: <20210217234023.1742406-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-13-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/attribs.h         | 35 ++++++++++++
 target/hexagon/attribs_def.h.inc | 97 ++++++++++++++++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 target/hexagon/attribs.h
 create mode 100644 target/hexagon/attribs_def.h.inc

diff --git a/target/hexagon/attribs.h b/target/hexagon/attribs.h
new file mode 100644
index 0000000000..54576f4143
--- /dev/null
+++ b/target/hexagon/attribs.h
@@ -0,0 +1,35 @@
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
+#ifndef HEXAGON_ATTRIBS_H
+#define HEXAGON_ATTRIBS_H
+
+#include "qemu/bitmap.h"
+#include "opcodes.h"
+
+enum {
+#define DEF_ATTRIB(NAME, ...) A_##NAME,
+#include "attribs_def.h.inc"
+#undef DEF_ATTRIB
+};
+
+extern DECLARE_BITMAP(opcode_attribs[XX_LAST_OPCODE], A_ZZ_LASTATTRIB);
+
+#define GET_ATTRIB(opcode, attrib) \
+    test_bit(attrib, opcode_attribs[opcode])
+
+#endif /* ATTRIBS_H */
diff --git a/target/hexagon/attribs_def.h.inc b/target/hexagon/attribs_def.h.inc
new file mode 100644
index 0000000000..381550909d
--- /dev/null
+++ b/target/hexagon/attribs_def.h.inc
@@ -0,0 +1,97 @@
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
+/* Keep this as the first attribute: */
+DEF_ATTRIB(AA_DUMMY, "Dummy Zeroth Attribute", "", "")
+
+/* Misc */
+DEF_ATTRIB(EXTENSION, "Extension instruction", "", "")
+
+DEF_ATTRIB(PRIV, "Not available in user or guest mode", "", "")
+DEF_ATTRIB(GUEST, "Not available in user mode", "", "")
+
+DEF_ATTRIB(FPOP, "Floating Point Operation", "", "")
+
+DEF_ATTRIB(EXTENDABLE, "Immediate may be extended", "", "")
+
+DEF_ATTRIB(ARCHV2, "V2 architecture", "", "")
+DEF_ATTRIB(ARCHV3, "V3 architecture", "", "")
+DEF_ATTRIB(ARCHV4, "V4 architecture", "", "")
+DEF_ATTRIB(ARCHV5, "V5 architecture", "", "")
+
+DEF_ATTRIB(SUBINSN, "sub-instruction", "", "")
+
+/* Load and Store attributes */
+DEF_ATTRIB(LOAD, "Loads from memory", "", "")
+DEF_ATTRIB(STORE, "Stores to memory", "", "")
+DEF_ATTRIB(MEMLIKE, "Memory-like instruction", "", "")
+DEF_ATTRIB(MEMLIKE_PACKET_RULES, "follows Memory-like packet rules", "", "")
+
+
+/* Change-of-flow attributes */
+DEF_ATTRIB(JUMP, "Jump-type instruction", "", "")
+DEF_ATTRIB(INDIRECT, "Absolute register jump", "", "")
+DEF_ATTRIB(CALL, "Function call instruction", "", "")
+DEF_ATTRIB(COF, "Change-of-flow instruction", "", "")
+DEF_ATTRIB(CONDEXEC, "May be cancelled by a predicate", "", "")
+DEF_ATTRIB(DOTNEWVALUE, "Uses a register value generated in this pkt", "", "")
+DEF_ATTRIB(NEWCMPJUMP, "Compound compare and jump", "", "")
+
+/* access to implicit registers */
+DEF_ATTRIB(IMPLICIT_WRITES_LR, "Writes the link register", "", "UREG.LR")
+DEF_ATTRIB(IMPLICIT_WRITES_SP, "Writes the stack pointer", "", "UREG.SP")
+DEF_ATTRIB(IMPLICIT_WRITES_FP, "Writes the frame pointer", "", "UREG.FP")
+DEF_ATTRIB(IMPLICIT_WRITES_LC0, "Writes loop count for loop 0", "", "UREG.LC0")
+DEF_ATTRIB(IMPLICIT_WRITES_LC1, "Writes loop count for loop 1", "", "UREG.LC1")
+DEF_ATTRIB(IMPLICIT_WRITES_SA0, "Writes start addr for loop 0", "", "UREG.SA0")
+DEF_ATTRIB(IMPLICIT_WRITES_SA1, "Writes start addr for loop 1", "", "UREG.SA1")
+DEF_ATTRIB(IMPLICIT_WRITES_P0, "Writes Predicate 0", "", "UREG.P0")
+DEF_ATTRIB(IMPLICIT_WRITES_P1, "Writes Predicate 1", "", "UREG.P1")
+DEF_ATTRIB(IMPLICIT_WRITES_P2, "Writes Predicate 1", "", "UREG.P2")
+DEF_ATTRIB(IMPLICIT_WRITES_P3, "May write Predicate 3", "", "UREG.P3")
+DEF_ATTRIB(IMPLICIT_READS_PC, "Reads the PC register", "", "")
+DEF_ATTRIB(WRITES_PRED_REG, "Writes a predicate register", "", "")
+
+DEF_ATTRIB(CRSLOT23, "Can execute in slot 2 or slot 3 (CR)", "", "")
+DEF_ATTRIB(IT_NOP, "nop instruction", "", "")
+DEF_ATTRIB(IT_EXTENDER, "constant extender instruction", "", "")
+
+
+/* Restrictions to make note of */
+DEF_ATTRIB(RESTRICT_SLOT0ONLY, "Must execute on slot0", "", "")
+DEF_ATTRIB(RESTRICT_SLOT1ONLY, "Must execute on slot1", "", "")
+DEF_ATTRIB(RESTRICT_SLOT2ONLY, "Must execute on slot2", "", "")
+DEF_ATTRIB(RESTRICT_SLOT3ONLY, "Must execute on slot3", "", "")
+DEF_ATTRIB(RESTRICT_NOSLOT1, "No slot 1 instruction in parallel", "", "")
+DEF_ATTRIB(RESTRICT_PREFERSLOT0, "Try to encode into slot 0", "", "")
+
+DEF_ATTRIB(ICOP, "Instruction cache op", "", "")
+
+DEF_ATTRIB(HWLOOP0_END, "Ends HW loop0", "", "")
+DEF_ATTRIB(HWLOOP1_END, "Ends HW loop1", "", "")
+DEF_ATTRIB(DCZEROA, "dczeroa type", "", "")
+DEF_ATTRIB(ICFLUSHOP, "icflush op type", "", "")
+DEF_ATTRIB(DCFLUSHOP, "dcflush op type", "", "")
+DEF_ATTRIB(DCFETCH, "dcfetch type", "", "")
+
+DEF_ATTRIB(L2FETCH, "Instruction is l2fetch type", "", "")
+
+DEF_ATTRIB(ICINVA, "icinva", "", "")
+DEF_ATTRIB(DCCLEANINVA, "dccleaninva", "", "")
+
+/* Keep this as the last attribute: */
+DEF_ATTRIB(ZZ_LASTATTRIB, "Last attribute in the file", "", "")
-- 
2.25.1


