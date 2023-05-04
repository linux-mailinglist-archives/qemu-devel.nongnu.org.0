Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E06F712B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:38:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoX-00079M-1z; Thu, 04 May 2023 13:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pubeV-0007Cb-O5
 for qemu-devel@nongnu.org; Thu, 04 May 2023 12:17:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pubeS-000392-SC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 12:17:55 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344EqMH4017351; Thu, 4 May 2023 16:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=ixo7oL/Sq4sZgO1hSFLI1NhQ3nSmtcT4YVa+o6ex3Bo=;
 b=EZSwTT2DmKB6IR5QoJEsR4XRxyaL80GBGqA2DOMBDPheldiWvus8D161Xbx5kracUTSj
 7Fo4obWXwKLVntccsU5/Vxy7H8OwNztnU9o/RbyScBBgYlSJQWrUtQy0si1P4SEdZeUL
 overtKBELq9O3rmAntwuIsPys7o3W21hsK+fa8EU/jZHu2RowpyKH+vtBH2hqkgyXx8t
 IeRbVpTAJejn1UEMStpG1eJMYPCEP99J+St1xTbUbpFy2HH0mMWPt5aD/y1dylJ3ZhG5
 07juadNI8pFVfJ3mkojfV6AeefyfBgQLWy7S1MrgFj/dvUwa0DRmD7PcqhvhZmtV50sI aA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qca1j94r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 16:17:50 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 344GHnOu006339; 
 Thu, 4 May 2023 16:17:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3qbe39b2cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 16:17:49 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 344GHnxI006334;
 Thu, 4 May 2023 16:17:49 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 344GHnaX006333
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 16:17:49 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 0AB7A70E9; Thu,  4 May 2023 13:17:49 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, anjo@rev.ng
Subject: [PATCH] Hexagon (target/hexagon/*.py): raise exception on reg parsing
 error
Date: Thu,  4 May 2023 13:17:47 -0300
Message-Id: <1f5dbd92f68fdd89e2647e4ba527a2c32cf0f070.1683217043.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Xo9OVjseIIUIqb22MP6cFj2I9oxy2vX7
X-Proofpoint-GUID: Xo9OVjseIIUIqb22MP6cFj2I9oxy2vX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_10,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxlogscore=315 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1011
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040131
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently, the python scripts used for the hexagon building will not
abort the compilation when there is an error parsing a register. Let's
make the compilation properly fail in such cases by rasing an exception
instead of just printing a warning message, which might get lost in the
output.

This patch was generated with:

 git grep -l "Bad register" *hexagon* | \
 xargs sed -i "" -e 's/print("Bad register parse: "[, ]*\([^)]*\))/hex_common.bad_register(\1)/g'

Plus the bad_register() helper added to hex_common.py.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 target/hexagon/gen_analyze_funcs.py     | 30 +++++-----
 target/hexagon/gen_helper_funcs.py      | 14 ++---
 target/hexagon/gen_helper_protos.py     |  2 +-
 target/hexagon/gen_idef_parser_funcs.py |  2 +-
 target/hexagon/gen_tcg_funcs.py         | 78 ++++++++++++-------------
 target/hexagon/hex_common.py            |  3 +
 6 files changed, 66 insertions(+), 63 deletions(-)

diff --git a/target/hexagon/gen_analyze_funcs.py b/target/hexagon/gen_analyze_funcs.py
index c74443da78..0584ef9d4d 100755
--- a/target/hexagon/gen_analyze_funcs.py
+++ b/target/hexagon/gen_analyze_funcs.py
@@ -45,7 +45,7 @@ def analyze_opn_old(f, tag, regtype, regid, regno):
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
             f.write(f"    ctx_log_reg_write(ctx, {regN}, {predicated});\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "P":
         if regid in {"s", "t", "u", "v"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
@@ -53,7 +53,7 @@ def analyze_opn_old(f, tag, regtype, regid, regno):
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
             f.write(f"    ctx_log_pred_write(ctx, {regN});\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "C":
         if regid == "ss":
             f.write(
@@ -70,12 +70,12 @@ def analyze_opn_old(f, tag, regtype, regid, regno):
             f.write(f"    const int {regN} = insn->regno[{regno}] " "+ HEX_REG_SA0;\n")
             f.write(f"    ctx_log_reg_write(ctx, {regN}, {predicated});\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "M":
         if regid == "u":
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "V":
         newv = "EXT_DFL"
         if hex_common.is_new_result(tag):
@@ -95,7 +95,7 @@ def analyze_opn_old(f, tag, regtype, regid, regno):
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
             f.write(f"    ctx_log_vreg_write(ctx, {regN}, {newv}, " f"{predicated});\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "Q":
         if regid in {"d", "e", "x"}:
             f.write(f"    const int {regN} = insn->regno[{regno}];\n")
@@ -103,7 +103,7 @@ def analyze_opn_old(f, tag, regtype, regid, regno):
         elif regid in {"s", "t", "u", "v"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "G":
         if regid in {"dd"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
@@ -114,7 +114,7 @@ def analyze_opn_old(f, tag, regtype, regid, regno):
         elif regid in {"s"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "S":
         if regid in {"dd"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
@@ -125,9 +125,9 @@ def analyze_opn_old(f, tag, regtype, regid, regno):
         elif regid in {"s"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     else:
-        print("Bad register parse: ", regtype, regid)
+        hex_common.bad_register(regtype, regid)
 
 
 def analyze_opn_new(f, tag, regtype, regid, regno):
@@ -136,19 +136,19 @@ def analyze_opn_new(f, tag, regtype, regid, regno):
         if regid in {"s", "t"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "P":
         if regid in {"t", "u", "v"}:
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "O":
         if regid == "s":
             f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     else:
-        print("Bad register parse: ", regtype, regid)
+        hex_common.bad_register(regtype, regid)
 
 
 def analyze_opn(f, tag, regtype, regid, toss, numregs, i):
@@ -160,9 +160,9 @@ def analyze_opn(f, tag, regtype, regid, toss, numregs, i):
         elif hex_common.is_new_val(regtype, regid, tag):
             analyze_opn_new(f, tag, regtype, regid, i)
         else:
-            print("Bad register parse: ", regtype, regid, toss, numregs)
+            hex_common.bad_register(regtype, regid, toss, numregs)
     else:
-        print("Bad register parse: ", regtype, regid, toss, numregs)
+        hex_common.bad_register(regtype, regid, toss, numregs)
 
 
 ##
diff --git a/target/hexagon/gen_helper_funcs.py b/target/hexagon/gen_helper_funcs.py
index c73d792580..b9af864161 100755
--- a/target/hexagon/gen_helper_funcs.py
+++ b/target/hexagon/gen_helper_funcs.py
@@ -87,9 +87,9 @@ def gen_helper_arg_opn(f, regtype, regid, i, tag):
         elif hex_common.is_new_val(regtype, regid, tag):
             gen_helper_arg_new(f, regtype, regid, i)
         else:
-            print("Bad register parse: ", regtype, regid, toss, numregs)
+            hex_common.bad_register(regtype, regid, toss, numregs)
     else:
-        print("Bad register parse: ", regtype, regid, toss, numregs)
+        hex_common.bad_register(regtype, regid, toss, numregs)
 
 
 def gen_helper_arg_imm(f, immlett):
@@ -135,7 +135,7 @@ def gen_helper_dest_decl_opn(f, regtype, regid, i):
         else:
             gen_helper_dest_decl(f, regtype, regid, i)
     else:
-        print("Bad register parse: ", regtype, regid, toss, numregs)
+        hex_common.bad_register(regtype, regid, toss, numregs)
 
 
 def gen_helper_src_var_ext(f, regtype, regid):
@@ -185,7 +185,7 @@ def gen_helper_return_opn(f, regtype, regid, i):
         else:
             gen_helper_return(f, regtype, regid, i)
     else:
-        print("Bad register parse: ", regtype, regid, toss, numregs)
+        hex_common.bad_register(regtype, regid, toss, numregs)
 
 
 ##
@@ -239,7 +239,7 @@ def gen_helper_function(f, tag, tagregs, tagimms):
                     else:
                         gen_helper_return_type(f, regtype, regid, i)
                 else:
-                    print("Bad register parse: ", regtype, regid, toss, numregs)
+                    hex_common.bad_register(regtype, regid, toss, numregs)
             i += 1
 
         if numscalarresults == 0:
@@ -262,7 +262,7 @@ def gen_helper_function(f, tag, tagregs, tagimms):
                         # This is the return value of the function
                         continue
                 else:
-                    print("Bad register parse: ", regtype, regid, toss, numregs)
+                    hex_common.bad_register(regtype, regid, toss, numregs)
                 i += 1
 
         ## For conditional instructions, we pass in the destination register
@@ -327,7 +327,7 @@ def gen_helper_function(f, tag, tagregs, tagimms):
                     if hex_common.is_hvx_reg(regtype):
                         gen_helper_src_var_ext(f, regtype, regid)
                 else:
-                    print("Bad register parse: ", regtype, regid, toss, numregs)
+                    hex_common.bad_register(regtype, regid, toss, numregs)
 
         if "A_FPOP" in hex_common.attribdict[tag]:
             f.write("    arch_fpop_start(env);\n")
diff --git a/target/hexagon/gen_helper_protos.py b/target/hexagon/gen_helper_protos.py
index 187cd6e04e..b49368f5a4 100755
--- a/target/hexagon/gen_helper_protos.py
+++ b/target/hexagon/gen_helper_protos.py
@@ -52,7 +52,7 @@ def gen_def_helper_opn(f, tag, regtype, regid, toss, numregs, i):
     elif hex_common.is_single(regid):
         f.write(f", {def_helper_types[regtype]}")
     else:
-        print("Bad register parse: ", regtype, regid, toss, numregs)
+        hex_common.bad_register(regtype, regid, toss, numregs)
 
 
 ##
diff --git a/target/hexagon/gen_idef_parser_funcs.py b/target/hexagon/gen_idef_parser_funcs.py
index afe68bdb6f..83cb5c9ec4 100644
--- a/target/hexagon/gen_idef_parser_funcs.py
+++ b/target/hexagon/gen_idef_parser_funcs.py
@@ -130,7 +130,7 @@ def main():
                 elif is_single_new:
                     arguments.append(f"{prefix}{regtype}{regid}N")
                 else:
-                    print("Bad register parse: ", regtype, regid, toss, numregs)
+                    hex_common.bad_register(regtype, regid, toss, numregs)
 
             for immlett, bits, immshift in imms:
                 arguments.append(hex_common.imm_name(immlett))
diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index fcb3384480..e7fe40356e 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -37,7 +37,7 @@ def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
     elif regtype == "C":
         f.write(f"    const int {regN} = insn->regno[{regno}] + HEX_REG_SA0;\n")
     else:
-        print("Bad register parse: ", regtype, regid)
+        hex_common.bad_register(regtype, regid)
     f.write(f"    TCGv_i64 {regtype}{regid}V = " f"get_result_gpr_pair(ctx, {regN});\n")
 
 
@@ -53,7 +53,7 @@ def genptr_decl_writable(f, tag, regtype, regid, regno):
         f.write(f"    const int {regN} = insn->regno[{regno}];\n")
         f.write(f"    TCGv {regtype}{regid}V = tcg_temp_new();\n")
     else:
-        print("Bad register parse: ", regtype, regid)
+        hex_common.bad_register(regtype, regid)
 
 
 def genptr_decl(f, tag, regtype, regid, regno):
@@ -71,7 +71,7 @@ def genptr_decl(f, tag, regtype, regid, regno):
         elif regid in {"d", "e", "x", "y"}:
             genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "P":
         if regid in {"s", "t", "u", "v"}:
             f.write(
@@ -80,7 +80,7 @@ def genptr_decl(f, tag, regtype, regid, regno):
         elif regid in {"d", "e", "x"}:
             genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "C":
         if regid == "ss":
             f.write(f"    TCGv_i64 {regtype}{regid}V = " f"tcg_temp_new_i64();\n")
@@ -96,7 +96,7 @@ def genptr_decl(f, tag, regtype, regid, regno):
         elif regid == "d":
             genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "M":
         if regid == "u":
             f.write(f"    const int {regtype}{regid}N = " f"insn->regno[{regno}];\n")
@@ -105,7 +105,7 @@ def genptr_decl(f, tag, regtype, regid, regno):
                 "HEX_REG_M0];\n"
             )
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "V":
         if regid in {"dd"}:
             f.write(f"    const int {regtype}{regid}N = " f"insn->regno[{regno}];\n")
@@ -159,7 +159,7 @@ def genptr_decl(f, tag, regtype, regid, regno):
                     f"{regtype}{regid}V_off);\n"
                 )
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "Q":
         if regid in {"d", "e", "x"}:
             f.write(f"    const int {regtype}{regid}N = " f"insn->regno[{regno}];\n")
@@ -180,9 +180,9 @@ def genptr_decl(f, tag, regtype, regid, regno):
             if not hex_common.skip_qemu_helper(tag):
                 f.write(f"    TCGv_ptr {regtype}{regid}V = " "tcg_temp_new_ptr();\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     else:
-        print("Bad register parse: ", regtype, regid)
+        hex_common.bad_register(regtype, regid)
 
 
 def genptr_decl_new(f, tag, regtype, regid, regno):
@@ -193,7 +193,7 @@ def genptr_decl_new(f, tag, regtype, regid, regno):
                 f"hex_new_value[insn->regno[{regno}]];\n"
             )
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "P":
         if regid in {"t", "u", "v"}:
             f.write(
@@ -201,7 +201,7 @@ def genptr_decl_new(f, tag, regtype, regid, regno):
                 f"hex_new_pred_value[insn->regno[{regno}]];\n"
             )
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "O":
         if regid == "s":
             f.write(
@@ -218,9 +218,9 @@ def genptr_decl_new(f, tag, regtype, regid, regno):
                     f"tcg_constant_tl({regtype}{regid}N_num);\n"
                 )
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     else:
-        print("Bad register parse: ", regtype, regid)
+        hex_common.bad_register(regtype, regid)
 
 
 def genptr_decl_opn(f, tag, regtype, regid, toss, numregs, i):
@@ -232,9 +232,9 @@ def genptr_decl_opn(f, tag, regtype, regid, toss, numregs, i):
         elif hex_common.is_new_val(regtype, regid, tag):
             genptr_decl_new(f, tag, regtype, regid, i)
         else:
-            print("Bad register parse: ", regtype, regid, toss, numregs)
+            hex_common.bad_register(regtype, regid, toss, numregs)
     else:
-        print("Bad register parse: ", regtype, regid, toss, numregs)
+        hex_common.bad_register(regtype, regid, toss, numregs)
 
 
 def genptr_decl_imm(f, immlett):
@@ -266,7 +266,7 @@ def genptr_src_read(f, tag, regtype, regid):
                     f"hex_gpr[{regtype}{regid}N]);\n"
                 )
         elif regid not in {"s", "t", "u", "v"}:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "P":
         if regid == "x":
             f.write(
@@ -274,7 +274,7 @@ def genptr_src_read(f, tag, regtype, regid):
                 f"hex_pred[{regtype}{regid}N]);\n"
             )
         elif regid not in {"s", "t", "u", "v"}:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "C":
         if regid == "ss":
             f.write(
@@ -287,10 +287,10 @@ def genptr_src_read(f, tag, regtype, regid):
                 f"{regtype}{regid}V);\n"
             )
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "M":
         if regid != "u":
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "V":
         if regid in {"uu", "vv", "xx"}:
             f.write(f"    tcg_gen_gvec_mov(MO_64, {regtype}{regid}V_off,\n")
@@ -311,7 +311,7 @@ def genptr_src_read(f, tag, regtype, regid):
             f.write(f"        vreg_src_off(ctx, {regtype}{regid}N),\n")
             f.write("        sizeof(MMVector), sizeof(MMVector));\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "Q":
         if regid in {"s", "t", "u", "v"}:
             if not hex_common.skip_qemu_helper(tag):
@@ -326,23 +326,23 @@ def genptr_src_read(f, tag, regtype, regid):
             )
             f.write("        sizeof(MMQReg), sizeof(MMQReg));\n")
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     else:
-        print("Bad register parse: ", regtype, regid)
+        hex_common.bad_register(regtype, regid)
 
 
 def genptr_src_read_new(f, regtype, regid):
     if regtype == "N":
         if regid not in {"s", "t"}:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "P":
         if regid not in {"t", "u", "v"}:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "O":
         if regid != "s":
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     else:
-        print("Bad register parse: ", regtype, regid)
+        hex_common.bad_register(regtype, regid)
 
 
 def genptr_src_read_opn(f, regtype, regid, tag):
@@ -354,9 +354,9 @@ def genptr_src_read_opn(f, regtype, regid, tag):
         elif hex_common.is_new_val(regtype, regid, tag):
             genptr_src_read_new(f, regtype, regid)
         else:
-            print("Bad register parse: ", regtype, regid, toss, numregs)
+            hex_common.bad_register(regtype, regid, toss, numregs)
     else:
-        print("Bad register parse: ", regtype, regid, toss, numregs)
+        hex_common.bad_register(regtype, regid, toss, numregs)
 
 
 def gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i):
@@ -370,9 +370,9 @@ def gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i):
         elif hex_common.is_new_val(regtype, regid, tag):
             f.write(f"{regtype}{regid}N")
         else:
-            print("Bad register parse: ", regtype, regid, toss, numregs)
+            hex_common.bad_register(regtype, regid, toss, numregs)
     else:
-        print("Bad register parse: ", regtype, regid, toss, numregs)
+        hex_common.bad_register(regtype, regid, toss, numregs)
 
 
 def gen_helper_decl_imm(f, immlett):
@@ -399,7 +399,7 @@ def genptr_dst_write(f, tag, regtype, regid):
                 f"    gen_log_reg_write({regtype}{regid}N, " f"{regtype}{regid}V);\n"
             )
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "P":
         if regid in {"d", "e", "x"}:
             f.write(
@@ -407,7 +407,7 @@ def genptr_dst_write(f, tag, regtype, regid):
                 f"{regtype}{regid}V);\n"
             )
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "C":
         if regid == "dd":
             f.write(
@@ -420,9 +420,9 @@ def genptr_dst_write(f, tag, regtype, regid):
                 f"{regtype}{regid}V);\n"
             )
         else:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     else:
-        print("Bad register parse: ", regtype, regid)
+        hex_common.bad_register(regtype, regid)
 
 
 def genptr_dst_write_ext(f, tag, regtype, regid, newv="EXT_DFL"):
@@ -438,12 +438,12 @@ def genptr_dst_write_ext(f, tag, regtype, regid, newv="EXT_DFL"):
                 f"{regtype}{regid}N, {newv});\n"
             )
         elif regid not in {"dd", "d", "x"}:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     elif regtype == "Q":
         if regid not in {"d", "e", "x"}:
-            print("Bad register parse: ", regtype, regid)
+            hex_common.bad_register(regtype, regid)
     else:
-        print("Bad register parse: ", regtype, regid)
+        hex_common.bad_register(regtype, regid)
 
 
 def genptr_dst_write_opn(f, regtype, regid, tag):
@@ -466,7 +466,7 @@ def genptr_dst_write_opn(f, regtype, regid, tag):
         else:
             genptr_dst_write(f, tag, regtype, regid)
     else:
-        print("Bad register parse: ", regtype, regid, toss, numregs)
+        hex_common.bad_register(regtype, regid, toss, numregs)
 
 
 ##
@@ -530,7 +530,7 @@ def gen_tcg_func(f, tag, regs, imms):
             elif hex_common.is_new_val(regtype, regid, tag):
                 declared.append(f"{regtype}{regid}N")
             else:
-                print("Bad register parse: ", regtype, regid, toss, numregs)
+                hex_common.bad_register(regtype, regid, toss, numregs)
 
         ## Handle immediates
         for immlett, bits, immshift in imms:
diff --git a/target/hexagon/hex_common.py b/target/hexagon/hex_common.py
index 40f28ca933..4da6c1504a 100755
--- a/target/hexagon/hex_common.py
+++ b/target/hexagon/hex_common.py
@@ -30,6 +30,9 @@
 overrides = {}  # tags with helper overrides
 idef_parser_enabled = {}  # tags enabled for idef-parser
 
+def bad_register(*args):
+    args_str = ", ".join(map(str, args))
+    raise Exception(f"Bad register parse: {args_str}")
 
 # We should do this as a hash for performance,
 # but to keep order let's keep it as a list.
-- 
2.37.2


