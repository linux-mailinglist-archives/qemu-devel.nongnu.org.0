Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981350BF5A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:16:00 +0200 (CEST)
Received: from localhost ([::1]:38634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxp0-0003qy-SJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxHu-0008IL-2o
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:48 -0400
Received: from rev.ng ([5.9.113.41]:49047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxHp-00069U-Bj
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RgKVWEGdWnxc4DR3VjhBTocs97skuT2GOEm3ozrHXgA=; b=i1njaWzikynoHgO83qfVYZck1S
 9aoIlTcgzUEEZmoCbF12UCau+F4TxRgxelSXOSSwLfCBqIHOB0JsO8DqaGdj70G+0dtyJzCVITD0q
 wnjp7xZW1+6+BQOmZ6jbBCwqoLegs3UUtIqDoyrOny9vyLfdJHLvjWop5NsjiSPO0qKQ=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v9 07/12] target/hexagon: prepare input for the idef-parser
Date: Fri, 22 Apr 2022 19:40:54 +0200
Message-Id: <20220422174059.4304-8-anjo@rev.ng>
In-Reply-To: <20220422174059.4304-1-anjo@rev.ng>
References: <20220422174059.4304-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

Introduce infrastructure necessary to produce a file suitable for being
parsed by the idef-parser.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gen_idef_parser_funcs.py | 128 ++++++++++++++++++++++
 target/hexagon/idef-parser/macros.inc   | 140 ++++++++++++++++++++++++
 target/hexagon/idef-parser/prepare      |  24 ++++
 target/hexagon/meson.build              |  17 +++
 4 files changed, 309 insertions(+)
 create mode 100644 target/hexagon/gen_idef_parser_funcs.py
 create mode 100644 target/hexagon/idef-parser/macros.inc
 create mode 100755 target/hexagon/idef-parser/prepare

diff --git a/target/hexagon/gen_idef_parser_funcs.py b/target/hexagon/gen_idef_parser_funcs.py
new file mode 100644
index 0000000000..178648b287
--- /dev/null
+++ b/target/hexagon/gen_idef_parser_funcs.py
@@ -0,0 +1,128 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2022 rev.ng Labs Srl. All Rights Reserved.
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
+    hex_common.calculate_attribs()
+    tagregs = hex_common.get_tagregs()
+    tagimms = hex_common.get_tagimms()
+
+    with open(sys.argv[3], 'w') as f:
+        f.write('#include "macros.inc"\n\n')
+
+        for tag in hex_common.tags:
+            ## Skip the priv instructions
+            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the guest instructions
+            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip instructions that saturate in a ternary expression
+            if ( tag in {'S2_asr_r_r_sat', 'S2_asl_r_r_sat'} ) :
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
+            if ( tag in {'M7_wcmpyrw', 'M7_wcmpyrwc',
+                         'M7_wcmpyiw', 'M7_wcmpyiwc',
+                         'M7_wcmpyrw_rnd', 'M7_wcmpyrwc_rnd',
+                         'M7_wcmpyiw_rnd', 'M7_wcmpyiwc_rnd'} ) :
+                continue
+            ## Skip interleave/deinterleave instructions
+            if ( tag in {'S2_interleave', 'S2_deinterleave'} ) :
+                continue
+            ## Skip instructions using bit reverse
+            if ( tag in {'S2_brev', 'S2_brevp', 'S2_ct0', 'S2_ct1',
+                         'S2_ct0p', 'S2_ct1p', 'A4_tlbmatch'} ) :
+                continue
+            ## Skip other unsupported instructions
+            if ( tag == 'S2_cabacdecbin' or tag == 'A5_ACS' ) :
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
+            f.write("    ");
+            if hex_common.need_ea(tag):
+                f.write("size4u_t EA; ");
+            f.write("%s\n" % hex_common.semdict[tag])
+            f.write("}\n\n")
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/idef-parser/macros.inc b/target/hexagon/idef-parser/macros.inc
new file mode 100644
index 0000000000..6b697da87a
--- /dev/null
+++ b/target/hexagon/idef-parser/macros.inc
@@ -0,0 +1,140 @@
+/*
+ *  Copyright(c) 2019-2022 rev.ng Labs Srl. All Rights Reserved.
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
+/* Least significant bit operations */
+#define fLSBNEW0 fLSBNEW(P0N)
+#define fLSBNEW1 fLSBNEW(P1N)
+#define fLSBOLDNOT(VAL) fGETBIT(0, ~VAL)
+#define fLSBNEWNOT(PRED) (fLSBNEW(~PRED))
+#define fLSBNEW0NOT fLSBNEW(~P0N)
+#define fLSBNEW1NOT fLSBNEW(~P1N)
+
+/* Assignments */
+#define fPCALIGN(IMM) (IMM = IMM & ~3)
+#define fWRITE_LR(A) (LR = A)
+#define fWRITE_FP(A) (FP = A)
+#define fWRITE_SP(A) (SP = A)
+/*
+ * Note: There is a rule in the parser that matches `PC = ...` and emits
+ * a call to `gen_write_new_pc`. We need to call `gen_write_new_pc` to
+ * get the correct semantics when there are multiple stores in a packet.
+ */
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
+#define fSCALE(N, A) (A << N)
+#define fASHIFTR(SRC, SHAMT, REGSTYPE) (fCAST##REGSTYPE##s(SRC) >> SHAMT)
+#define fLSHIFTR(SRC, SHAMT, REGSTYPE) (SRC >>> SHAMT)
+#define fROTL(SRC, SHAMT, REGSTYPE) fROTL(SRC, SHAMT)
+#define fASHIFTL(SRC, SHAMT, REGSTYPE) (fCAST##REGSTYPE##s(SRC) << SHAMT)
+
+/* Include fHIDE macros which hide type declarations */
+#define fHIDE(A) A
+
+/* Purge non-relavant parts */
+#define fBRANCH_SPECULATE_STALL(A, B, C, D, E)
diff --git a/target/hexagon/idef-parser/prepare b/target/hexagon/idef-parser/prepare
new file mode 100755
index 0000000000..72d6fcbd21
--- /dev/null
+++ b/target/hexagon/idef-parser/prepare
@@ -0,0 +1,24 @@
+#!/bin/bash
+
+#
+#  Copyright(c) 2019-2021 rev.ng Labs Srl. All Rights Reserved.
+#
+#  This program is free software; you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License as published by
+#  the Free Software Foundation; either version 2 of the License, or
+#  (at your option) any later version.
+#
+#  This program is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#  GNU General Public License for more details.
+#
+#  You should have received a copy of the GNU General Public License
+#  along with this program; if not, see <http://www.gnu.org/licenses/>.
+#
+
+set -e
+set -o pipefail
+
+# Run the preprocessor and drop comments
+cpp "$@"
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index b61243103f..5945098cc4 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -21,6 +21,7 @@ hex_common_py = 'hex_common.py'
 attribs_def = meson.current_source_dir() / 'attribs_def.h.inc'
 gen_tcg_h = meson.current_source_dir() / 'gen_tcg.h'
 gen_tcg_hvx_h = meson.current_source_dir() / 'gen_tcg_hvx.h'
+idef_parser_dir = meson.current_source_dir() / 'idef-parser'
 
 #
 #  Step 1
@@ -179,4 +180,20 @@ hexagon_ss.add(files(
     'mmvec/system_ext_mmvec.c',
 ))
 
+idef_parser_input_generated = custom_target(
+    'idef_parser_input.h.inc',
+    output: 'idef_parser_input.h.inc',
+    depends: [semantics_generated],
+    depend_files: [hex_common_py],
+    command: [python, files('gen_idef_parser_funcs.py'), semantics_generated, attribs_def, '@OUTPUT@'],
+)
+
+preprocessed_idef_parser_input_generated = custom_target(
+    'idef_parser_input.preprocessed.h.inc',
+    output: 'idef_parser_input.preprocessed.h.inc',
+    input: idef_parser_input_generated,
+    depend_files: [idef_parser_dir / 'macros.inc'],
+    command: [idef_parser_dir / 'prepare', '@INPUT@', '-I' + idef_parser_dir, '-o', '@OUTPUT@'],
+)
+
 target_arch += {'hexagon': hexagon_ss}
-- 
2.35.1


