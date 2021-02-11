Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB6E31956F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 22:56:37 +0100 (CET)
Received: from localhost ([::1]:59860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAJwy-0001x8-OR
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 16:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lAJrm-0006HU-1W
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:51:14 -0500
Received: from rev.ng ([5.9.113.41]:46089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lAJri-00011c-Te
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 16:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6YFpg73l/ixYZuxNPYgpw3KIqsyRhTC+VGFpVA2q/+k=; b=AilHcLF87AM9tOyqqTqwM+Fwuq
 1EVA0+mq+kghtcNmRZG36h4DodRVvD5fvWEu3d3R55arWAJvB2ahPyxuThhp8m19xlaHHr09CPyJ+
 C6+RRdlqwy6qbvam8Pe0OfWapClTWETvlckRoy91/KU6inBu0Q3MOgLNu8b5aKoENhOs=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 Alessandro Di Federico <ale@rev.ng>
Subject: [RFC PATCH 06/10] target/hexagon: prepare input for the idef-parser
Date: Thu, 11 Feb 2021 22:50:47 +0100
Message-Id: <20210211215051.2102435-7-ale.qemu@rev.ng>
In-Reply-To: <20210211215051.2102435-1-ale.qemu@rev.ng>
References: <20210211215051.2102435-1-ale.qemu@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

Introduce infrastructure necessary to produce a file suitable for being
parsed by the idef-parser.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
---
 target/hexagon/gen_idef_parser_funcs.py | 114 ++++++++++++++++
 target/hexagon/idef-parser/macros.inc   | 166 ++++++++++++++++++++++++
 target/hexagon/idef-parser/prepare      |  33 +++++
 target/hexagon/meson.build              |  18 +++
 4 files changed, 331 insertions(+)
 create mode 100644 target/hexagon/gen_idef_parser_funcs.py
 create mode 100644 target/hexagon/idef-parser/macros.inc
 create mode 100755 target/hexagon/idef-parser/prepare

diff --git a/target/hexagon/gen_idef_parser_funcs.py b/target/hexagon/gen_idef_parser_funcs.py
new file mode 100644
index 0000000000..6fb3659201
--- /dev/null
+++ b/target/hexagon/gen_idef_parser_funcs.py
@@ -0,0 +1,114 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2020 rev.ng Srls. All Rights Reserved.
+##
+##  This program is free software; you can redistribute it and/or modify
+##  it under the terms of the GNU General Public License as published by
+##  the Free Software Foundation; either version 2 of the License, or
+##  (at your option) any later version.
+##
+##  This program is distributed in the hope that it will be useful,
+##  but WITHOUT ANY WARRANTY; without even the implied warranty of
+##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+##  GNU General Public License for more details.
+##
+##  You should have received a copy of the GNU General Public License
+##  along with this program; if not, see <http://www.gnu.org/licenses/>.
+##
+
+import sys
+import re
+import string
+from io import StringIO
+
+import hex_common
+
+##
+## Generate code to be fed to the idef_parser
+##
+## Consider A2_add:
+##
+##     Rd32=add(Rs32,Rt32), { RdV=RsV+RtV;}
+##
+## We produce:
+##
+##     A2_add(RdV, in RsV, in RtV) {
+##       { RdV=RsV+RtV;}
+##     }
+##
+## A2_add represents the instruction tag. Then we have a list of TCGv
+## that the code generated by the parser can expect in input. Some of
+## them are inputs ("in" prefix), while some others are outputs.
+##
+def main():
+    hex_common.read_semantics_file(sys.argv[1])
+    hex_common.read_attribs_file(sys.argv[2])
+    hex_common.read_overrides_file(sys.argv[3])
+    hex_common.calculate_attribs()
+    tagregs = hex_common.get_tagregs()
+    tagimms = hex_common.get_tagimms()
+
+    with open(sys.argv[4], 'w') as f:
+        f.write('#include "macros.inc"\n\n')
+
+        for tag in hex_common.tags:
+            ## Skip the priv instructions
+            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the guest instructions
+            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip instructions using switch
+            if ( tag in {'S4_vrcrotate_acc', 'S4_vrcrotate'} ) :
+                continue
+            ## Skip trap instructions
+            if ( tag in {'J2_trap0', 'J2_trap1'} ) :
+                continue
+            ## Skip 128-bit instructions
+            if ( tag in {'A7_croundd_ri', 'A7_croundd_rr'} ) :
+                continue
+            ## Skip other unsupported instructions
+            if ( tag.startswith('S2_cabacdecbin') ) :
+                continue
+            if ( tag.startswith('Y') ) :
+                continue
+            if ( tag.startswith('V6_') ) :
+                continue
+            if ( tag.startswith('F') ) :
+                continue
+            if ( tag.endswith('_locked') ) :
+                continue
+
+            regs = tagregs[tag]
+            imms = tagimms[tag]
+
+            arguments = []
+            if hex_common.need_ea(tag):
+                arguments.append("EA")
+
+            for regtype,regid,toss,numregs in regs:
+                prefix = "in " if hex_common.is_read(regid) else ""
+
+                is_pair = hex_common.is_pair(regid)
+                is_single_old = (hex_common.is_single(regid)
+                                 and hex_common.is_old_val(regtype, regid, tag))
+                is_single_new = (hex_common.is_single(regid)
+                                 and hex_common.is_new_val(regtype, regid, tag))
+
+                if is_pair or is_single_old:
+                    arguments.append("%s%s%sV" % (prefix, regtype, regid))
+                elif is_single_new:
+                    arguments.append("%s%s%sN" % (prefix, regtype, regid))
+                else:
+                    print("Bad register parse: ",regtype,regid,toss,numregs)
+
+            for immlett,bits,immshift in imms:
+                arguments.append(hex_common.imm_name(immlett))
+
+            f.write("%s(%s) {\n" % (tag, ", ".join(arguments)))
+            f.write("    %s\n" % hex_common.semdict[tag])
+            f.write("}\n\n")
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/idef-parser/macros.inc b/target/hexagon/idef-parser/macros.inc
new file mode 100644
index 0000000000..719bebaee3
--- /dev/null
+++ b/target/hexagon/idef-parser/macros.inc
@@ -0,0 +1,166 @@
+/*
+ * Copyright(c) 2019-2020 rev.ng Srls. All Rights Reserved.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
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
+/* Copy rules */
+#define fLSBOLD(VAL) (fGETBIT(0, VAL))
+#define fSATH(VAL) fSATN(16, VAL)
+#define fSATUH(VAL) fSATUN(16, VAL)
+#define fVSATH(VAL) fVSATN(16, VAL)
+#define fVSATUH(VAL) fVSATUN(16, VAL)
+#define fSATUB(VAL) fSATUN(8, VAL)
+#define fSATB(VAL) fSATN(8, VAL)
+#define fVSATUB(VAL) fVSATUN(8, VAL)
+#define fVSATB(VAL) fVSATN(8, VAL)
+#define fCALL(A) fWRITE_LR(fREAD_NPC()); fWRITE_NPC(A);
+#define fCALLR(A) fWRITE_LR(fREAD_NPC()); fWRITE_NPC(A);
+#define fCAST2_8s(A) fSXTN(16, 64, A)
+#define fCAST2_8u(A) fZXTN(16, 64, A)
+#define fCAST8S_16S(A) (fSXTN(64, 128, A))
+#define fCAST16S_8S(A) (fSXTN(128, 64, A))
+#define fVSATW(A) fVSATN(32, fCAST8_8s(A))
+#define fSATW(A) fSATN(32, fCAST8_8s(A))
+#define fVSAT(A) fVSATN(32, A)
+#define fSAT(A) fSATN(32, A)
+
+/* Ease parsing */
+#define f8BITSOF(VAL) ((VAL) ? 0xff : 0x00)
+#define fREAD_GP() (Constant_extended ? (0) : GP)
+#define fCLIP(DST, SRC, U) (DST = fMIN((1 << U) - 1, fMAX(SRC, -(1 << U))))
+#define fBIDIR_ASHIFTL(SRC, SHAMT, REGSTYPE)                            \
+    ((SHAMT > 0) ?                                                      \
+     (fCAST##REGSTYPE##s(SRC) << SHAMT) :                               \
+     (fCAST##REGSTYPE##s(SRC) >> -SHAMT))
+
+#define fBIDIR_LSHIFTL(SRC, SHAMT, REGSTYPE)    \
+    ((SHAMT > 0) ?                              \
+     (fCAST##REGSTYPE##u(SRC) << SHAMT) :       \
+     (fCAST##REGSTYPE##u(SRC) >>> -SHAMT))
+
+#define fBIDIR_ASHIFTR(SRC, SHAMT, REGSTYPE)    \
+    ((SHAMT > 0) ?                              \
+     (fCAST##REGSTYPE##s(SRC) >> SHAMT) :       \
+     (fCAST##REGSTYPE##s(SRC) << -SHAMT))
+
+#define fBIDIR_SHIFTR(SRC, SHAMT, REGSTYPE) \
+    (((SHAMT) < 0) ? ((fCAST##REGSTYPE(SRC) << ((-(SHAMT)) - 1)) << 1)  \
+                   : (fCAST##REGSTYPE(SRC) >> (SHAMT)))
+
+#define fBIDIR_LSHIFTR(SRC, SHAMT, REGSTYPE)                            \
+    fBIDIR_SHIFTR(SRC, SHAMT, REGSTYPE##u)
+
+#define fSATVALN(N, VAL)                                                \
+    fSET_OVERFLOW(                                                      \
+        ((VAL) < 0) ? (-(1LL << ((N) - 1))) : ((1LL << ((N) - 1)) - 1)  \
+    )
+
+#define fSAT_ORIG_SHL(A, ORIG_REG)                                      \
+    (((fCAST4s((fSAT(A)) ^ (fCAST4s(ORIG_REG)))) < 0)                   \
+        ? fSATVALN(32, (fCAST4s(ORIG_REG)))                             \
+        : ((((ORIG_REG) > 0) && ((A) == 0)) ? fSATVALN(32, (ORIG_REG))  \
+                                            : fSAT(A)))
+
+#define fBIDIR_ASHIFTR_SAT(SRC, SHAMT, REGSTYPE)                        \
+    (((SHAMT) < 0) ? fSAT_ORIG_SHL((fCAST##REGSTYPE##s(SRC)             \
+                        << ((-(SHAMT)) - 1)) << 1, (SRC))               \
+                   : (fCAST##REGSTYPE##s(SRC) >> (SHAMT)))
+
+#define fBIDIR_ASHIFTL_SAT(SRC, SHAMT, REGSTYPE)                        \
+    (((SHAMT) < 0)                                                      \
+     ? ((fCAST##REGSTYPE##s(SRC) >> ((-(SHAMT)) - 1)) >> 1)             \
+     : fSAT_ORIG_SHL(fCAST##REGSTYPE##s(SRC) << (SHAMT), (SRC)))
+
+#define fEXTRACTU_BIDIR(INREG, WIDTH, OFFSET)                           \
+    (fZXTN(WIDTH, 32, fBIDIR_LSHIFTR((INREG), (OFFSET), 4_8)))
+
+#define fCARRY_FROM_ADD(A, B, C)                                        \
+    fGETUWORD(1,                                                        \
+              fGETUWORD(1, A) +                                         \
+              fGETUWORD(1, B) +                                         \
+              fGETUWORD(1,                                              \
+                        fGETUWORD(0, A) +                               \
+                        fGETUWORD(0, B) + C))
+
+#define fADDSAT64(DST, A, B)                                            \
+        __a = fCAST8u(A);                                               \
+        __b = fCAST8u(B);                                               \
+        __sum = __a + __b;                                              \
+        __xor = __a ^ __b;                                              \
+        __mask = 0x8000000000000000ULL;                                 \
+        if (__xor & __mask) {                                           \
+            DST = __sum;                                                \
+        }                                                               \
+        else if ((__a ^ __sum) & __mask) {                              \
+            if (__sum & __mask) {                                       \
+                DST = 0x7FFFFFFFFFFFFFFFLL;                             \
+                fSET_OVERFLOW();                                        \
+            } else {                                                    \
+                DST = 0x8000000000000000ULL;                            \
+                fSET_OVERFLOW();                                        \
+            }                                                           \
+        } else {                                                        \
+            DST = __sum;                                                \
+        }
+
+/* Negation operator */
+#define fLSBOLDNOT(VAL) (!fGETBIT(0, VAL))
+#define fLSBNEWNOT(PNUM) (!fLSBNEW(PNUM))
+#define fLSBNEW0NOT (!fLSBNEW0)
+
+/* Assignments */
+#define fPCALIGN(IMM) (IMM = IMM & ~3)
+#define fWRITE_LR(A) (LR = A)
+#define fWRITE_FP(A) (FP = A)
+#define fWRITE_SP(A) (SP = A)
+#define fBRANCH(LOC, TYPE) (PC = LOC)
+#define fJUMPR(REGNO, TARGET, TYPE) (PC = TARGET)
+#define fWRITE_LOOP_REGS0(START, COUNT) SA0 = START; (LC0 = COUNT)
+#define fWRITE_LOOP_REGS1(START, COUNT) SA1 = START; (LC1 = COUNT)
+#define fWRITE_LC0(VAL) (LC0 = VAL)
+#define fWRITE_LC1(VAL) (LC1 = VAL)
+#define fSET_LPCFG(VAL) (USR.LPCFG = VAL)
+#define fWRITE_P0(VAL) P0 = VAL;
+#define fWRITE_P1(VAL) P1 = VAL;
+#define fWRITE_P3(VAL) P3 = VAL;
+#define fEA_RI(REG, IMM) (EA = REG + IMM)
+#define fEA_RRs(REG, REG2, SCALE) (EA = REG + (REG2 << SCALE))
+#define fEA_IRs(IMM, REG, SCALE) (EA = IMM + (REG << SCALE))
+#define fEA_IMM(IMM) (EA = IMM)
+#define fEA_REG(REG) (EA = REG)
+#define fEA_BREVR(REG) (EA = fbrev(REG))
+#define fEA_GPI(IMM) (EA = fREAD_GP() + IMM)
+#define fPM_I(REG, IMM) (REG = REG + IMM)
+#define fPM_M(REG, MVAL) (REG = REG + MVAL)
+#define fWRITE_NPC(VAL) (PC = VAL)
+
+/* Unary operators */
+#define fROUND(A) (A + 0x8000)
+
+/* Binary operators */
+#define fADD128(A, B) (A + B)
+#define fSUB128(A, B) (A - B)
+#define fSHIFTR128(A, B) (size8s_t) (A >> B)
+#define fSHIFTL128(A, B) (A << B)
+#define fAND128(A, B) (A & B)
+#define fSCALE(N, A) (A << N)
+#define fASHIFTR(SRC, SHAMT, REGSTYPE) (SRC >> SHAMT)
+#define fLSHIFTR(SRC, SHAMT, REGSTYPE) (SRC >>> SHAMT)
+#define fROTL(SRC, SHAMT, REGSTYPE) fROTL(SRC, SHAMT)
+#define fASHIFTL(SRC, SHAMT, REGSTYPE) (fCAST##REGSTYPE##s(SRC) << SHAMT)
+
+/* Purge non-relavant parts */
+#define fHIDE(A)
+#define fBRANCH_SPECULATE_STALL(A, B, C, D, E)
diff --git a/target/hexagon/idef-parser/prepare b/target/hexagon/idef-parser/prepare
new file mode 100755
index 0000000000..a11a86dc01
--- /dev/null
+++ b/target/hexagon/idef-parser/prepare
@@ -0,0 +1,33 @@
+#!/bin/bash
+
+#
+# Copyright(c) 2019-2020 rev.ng Srls. All Rights Reserved.
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+#
+
+set -e
+set -o pipefail
+
+# 1. Run the preprocessor
+# 2. Transform
+#
+#        condition ? A = B : A = C
+#
+#    in
+#
+#        A = (condition ? B : C)
+#
+# 3. Remove comments (starting with "#")
+cpp "$@" | sed 's/\(\s*[{;]\)\s*\([^;?]*\) ? (\([^;=]*\)=\([^;)]*\))\s*:\s*([^;=]*=\([^;)]*\));/\1 \3 = (\2) ? \4 : \5;/' | grep -v '^#'
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 06f449da66..e2e6b64766 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -22,6 +22,7 @@ prog_python = import('python').find_installation('python3')
 hex_common_py = 'hex_common.py'
 attribs_def = meson.current_source_dir() / 'attribs_def.h.inc'
 gen_tcg_h = meson.current_source_dir() / 'gen_tcg.h'
+idef_parser_dir = meson.current_source_dir() / 'idef-parser'
 
 #
 #  Step 1
@@ -190,4 +191,21 @@ hexagon_ss.add(files(
     'conv_emu.c',
 ))
 
+idef_parser_input_generated = custom_target(
+    'idef_parser_input.h.inc',
+    output: 'idef_parser_input.h.inc',
+    input: 'gen_idef_parser_funcs.py',
+    depend_files: [hex_common_py],
+    command: [prog_python, '@INPUT@', semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
+)
+
+idef_parser_input_generated_prep = custom_target(
+    'idef_parser_input.preprocessed.h.inc',
+    output: 'idef_parser_input.preprocessed.h.inc',
+    input: idef_parser_input_generated,
+    capture: true,
+    depend_files: [hex_common_py],
+    command: [idef_parser_dir / 'prepare', '@INPUT@', '-I' + idef_parser_dir],
+)
+
 target_arch += {'hexagon': hexagon_ss}
-- 
2.30.0


