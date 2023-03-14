Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4BA6BA169
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 22:25:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcC8k-00060H-14; Tue, 14 Mar 2023 17:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pcC8O-0005zv-BR
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 17:24:41 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pcC8J-0006oT-TX
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 17:24:39 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EKNle8019710
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 21:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=GrrbdlI1Sm376zB61v7VsKEu6ocRrJ3h05UOV8XH/xk=;
 b=cLFHov8RKVyeWqQSLEIiNwh+vy8jaKdDAt8uRgt1vaMNQzi25UNzy4tXYYGzo5qRZqYV
 6J39llfr8rTnBcJvgsxB+Sivt9eSREgXwKdWZufHnbAA+VLArZZHZ4qrvsgDobWCC9RM
 iU7FYzpqfZRhWjKM2GL+aGp1FB+0K/okCR0pmq7vhA7RnD8MLaXvJtuBL4XzdAvscpHh
 PWistWtKuxOzMHyIKp2EqtzaPflnYeVWZRVegzg/raeY/eeBgS8DKFDZOY5q68GJuRGx
 QBHKpRc9icvkXPX1PlbtSO6TylUv48BYs7JWkTODMmfKQEckFri1amDdQ5C06GM/W6mK pQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3paqe0sk10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 21:24:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32ELOUBD025269
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 21:24:30 GMT
Received: from hu-mliebel-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 14 Mar 2023 14:24:30 -0700
From: Marco Liebel <quic_mliebel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: Taylor Simpson <tsimpson@quicinc.com>, Marco Liebel
 <quic_mliebel@quicinc.com>
Subject: [PATCH v2] Use f-strings in python scripts
Date: Tue, 14 Mar 2023 14:24:18 -0700
Message-ID: <20230314212418.3925751-1-quic_mliebel@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qHoZKPqgNAcFcL5Z17qizALhDegik6qH
X-Proofpoint-ORIG-GUID: qHoZKPqgNAcFcL5Z17qizALhDegik6qH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=781
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140171
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mliebel@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Replace python 2 format string with f-strings

Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
---
 target/hexagon/gen_analyze_funcs.py     | 115 ++++-----
 target/hexagon/gen_helper_funcs.py      |  54 ++--
 target/hexagon/gen_helper_protos.py     |  10 +-
 target/hexagon/gen_idef_parser_funcs.py |   8 +-
 target/hexagon/gen_op_attribs.py        |   4 +-
 target/hexagon/gen_op_regs.py           |  10 +-
 target/hexagon/gen_opcodes_def.py       |   2 +-
 target/hexagon/gen_printinsn.py         |  14 +-
 target/hexagon/gen_shortcode.py         |   2 +-
 target/hexagon/gen_tcg_func_table.py    |   2 +-
 target/hexagon/gen_tcg_funcs.py         | 317 +++++++++++-------------
 target/hexagon/hex_common.py            |   4 +-
 12 files changed, 243 insertions(+), 299 deletions(-)

diff --git a/target/hexagon/gen_analyze_funcs.py b/target/hexagon/gen_analyze_funcs.py
index ebd3e7afb9..1e246209e8 100755
--- a/target/hexagon/gen_analyze_funcs.py
+++ b/target/hexagon/gen_analyze_funcs.py
@@ -29,57 +29,49 @@ def is_predicated(tag):
     return 'A_CONDEXEC' in hex_common.attribdict[tag]
 
 def analyze_opn_old(f, tag, regtype, regid, regno):
-    regN = "%s%sN" % (regtype, regid)
+    regN = f"{regtype}{regid}N"
     predicated = "true" if is_predicated(tag) else "false"
     if (regtype == "R"):
         if (regid in {"ss", "tt"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"dd", "ee", "xx", "yy"}):
-            f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
-            f.write("    ctx_log_reg_write_pair(ctx, %s, %s);\n" % \
-                (regN, predicated))
+            f.write(f"    const int {regN} = insn->regno[{regno}];\n")
+            f.write(f"    ctx_log_reg_write_pair(ctx, {regN}, {predicated});\n")
         elif (regid in {"s", "t", "u", "v"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"d", "e", "x", "y"}):
-            f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
-            f.write("    ctx_log_reg_write(ctx, %s, %s);\n" % \
-                (regN, predicated))
+            f.write(f"    const int {regN} = insn->regno[{regno}];\n")
+            f.write(f"    ctx_log_reg_write(ctx, {regN}, {predicated});\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "P"):
         if (regid in {"s", "t", "u", "v"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"d", "e", "x"}):
-            f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
-            f.write("    ctx_log_pred_write(ctx, %s);\n" % (regN))
+            f.write(f"    const int {regN} = insn->regno[{regno}];\n")
+            f.write(f"    ctx_log_pred_write(ctx, {regN});\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "C"):
         if (regid == "ss"):
-            f.write("//    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}] "
+                     "+ HEX_REG_SA0;\n")
         elif (regid == "dd"):
-            f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
-                (regN, regno))
-            f.write("    ctx_log_reg_write_pair(ctx, %s, %s);\n" % \
-                (regN, predicated))
+            f.write(f"    const int {regN} = insn->regno[{regno}] "
+                     "+ HEX_REG_SA0;\n")
+            f.write(f"    ctx_log_reg_write_pair(ctx, {regN}, {predicated});\n")
         elif (regid == "s"):
-            f.write("//    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}] "
+                     "+ HEX_REG_SA0;\n")
         elif (regid == "d"):
-            f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
-                (regN, regno))
-            f.write("    ctx_log_reg_write(ctx, %s, %s);\n" % \
-                (regN, predicated))
+            f.write(f"    const int {regN} = insn->regno[{regno}] "
+                     "+ HEX_REG_SA0;\n")
+            f.write(f"    ctx_log_reg_write(ctx, {regN}, {predicated});\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "M"):
         if (regid == "u"):
-            f.write("//    const int %s = insn->regno[%d];\n"% \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "V"):
@@ -89,84 +81,67 @@ def analyze_opn_old(f, tag, regtype, regid, regno):
         elif (hex_common.is_tmp_result(tag)):
             newv = "EXT_TMP"
         if (regid in {"dd", "xx"}):
-            f.write("    const int %s = insn->regno[%d];\n" %\
-                (regN, regno))
-            f.write("    ctx_log_vreg_write_pair(ctx, %s, %s, %s);\n" % \
-                (regN, newv, predicated))
+            f.write(f"    const int {regN} = insn->regno[{regno}];\n")
+            f.write(f"    ctx_log_vreg_write_pair(ctx, {regN}, {newv}, "
+                    f"{predicated});\n")
         elif (regid in {"uu", "vv"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"s", "u", "v", "w"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"d", "x", "y"}):
-            f.write("    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
-            f.write("    ctx_log_vreg_write(ctx, %s, %s, %s);\n" % \
-                (regN, newv, predicated))
+            f.write(f"    const int {regN} = insn->regno[{regno}];\n")
+            f.write(f"    ctx_log_vreg_write(ctx, {regN}, {newv}, "
+                    f"{predicated});\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "Q"):
         if (regid in {"d", "e", "x"}):
-            f.write("    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
-            f.write("    ctx_log_qreg_write(ctx, %s);\n" % (regN))
+            f.write(f"    const int {regN} = insn->regno[{regno}];\n")
+            f.write(f"    ctx_log_qreg_write(ctx, {regN});\n")
         elif (regid in {"s", "t", "u", "v"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "G"):
         if (regid in {"dd"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"d"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"ss"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"s"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "S"):
         if (regid in {"dd"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"d"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"ss"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"s"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     else:
         print("Bad register parse: ", regtype, regid)
 
 def analyze_opn_new(f, tag, regtype, regid, regno):
-    regN = "%s%sN" % (regtype, regid)
+    regN = f"{regtype}{regid}N"
     if (regtype == "N"):
         if (regid in {"s", "t"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "P"):
         if (regid in {"t", "u", "v"}):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "O"):
         if (regid == "s"):
-            f.write("//    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"//    const int {regN} = insn->regno[{regno}];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     else:
@@ -199,7 +174,7 @@ def analyze_opn(f, tag, regtype, regid, toss, numregs, i):
 ##     }
 ##
 def gen_analyze_func(f, tag, regs, imms):
-    f.write("static void analyze_%s(DisasContext *ctx)\n" %tag)
+    f.write(f"static void analyze_{tag}(DisasContext *ctx)\n")
     f.write('{\n')
 
     f.write("    Insn *insn G_GNUC_UNUSED = ctx->insn;\n")
diff --git a/target/hexagon/gen_helper_funcs.py b/target/hexagon/gen_helper_funcs.py
index 7a224b66e6..dc67eaf716 100755
--- a/target/hexagon/gen_helper_funcs.py
+++ b/target/hexagon/gen_helper_funcs.py
@@ -38,23 +38,23 @@ def gen_helper_return_type_pair(f,regtype,regid,regno):
 
 def gen_helper_arg(f,regtype,regid,regno):
     if regno > 0 : f.write(", " )
-    f.write("int32_t %s%sV" % (regtype,regid))
+    f.write(f"int32_t {regtype}{regid}V")
 
 def gen_helper_arg_new(f,regtype,regid,regno):
     if regno >= 0 : f.write(", " )
-    f.write("int32_t %s%sN" % (regtype,regid))
+    f.write(f"int32_t {regtype}{regid}N")
 
 def gen_helper_arg_pair(f,regtype,regid,regno):
     if regno >= 0 : f.write(", ")
-    f.write("int64_t %s%sV" % (regtype,regid))
+    f.write(f"int64_t {regtype}{regid}V")
 
 def gen_helper_arg_ext(f,regtype,regid,regno):
     if regno > 0 : f.write(", ")
-    f.write("void *%s%sV_void" % (regtype,regid))
+    f.write(f"void *{regtype}{regid}V_void")
 
 def gen_helper_arg_ext_pair(f,regtype,regid,regno):
     if regno > 0 : f.write(", ")
-    f.write("void *%s%sV_void" % (regtype,regid))
+    f.write(f"void *{regtype}{regid}V_void")
 
 def gen_helper_arg_opn(f,regtype,regid,i,tag):
     if (hex_common.is_pair(regid)):
@@ -76,27 +76,25 @@ def gen_helper_arg_opn(f,regtype,regid,i,tag):
         print("Bad register parse: ",regtype,regid,toss,numregs)
 
 def gen_helper_arg_imm(f,immlett):
-    f.write(", int32_t %s" % (hex_common.imm_name(immlett)))
+    f.write(f", int32_t {hex_common.imm_name(immlett)}")
 
 def gen_helper_dest_decl(f,regtype,regid,regno,subfield=""):
-    f.write("    int32_t %s%sV%s = 0;\n" % \
-        (regtype,regid,subfield))
+    f.write(f"    int32_t {regtype}{regid}V{subfield} = 0;\n")
 
 def gen_helper_dest_decl_pair(f,regtype,regid,regno,subfield=""):
-    f.write("    int64_t %s%sV%s = 0;\n" % \
-        (regtype,regid,subfield))
+    f.write(f"    int64_t {regtype}{regid}V{subfield} = 0;\n")
 
 def gen_helper_dest_decl_ext(f,regtype,regid):
     if (regtype == "Q"):
-        f.write("    /* %s%sV is *(MMQReg *)(%s%sV_void) */\n" % \
-            (regtype,regid,regtype,regid))
+        f.write(f"    /* {regtype}{regid}V is *(MMQReg *)"
+                f"({regtype}{regid}V_void) */\n")
     else:
-        f.write("    /* %s%sV is *(MMVector *)(%s%sV_void) */\n" % \
-            (regtype,regid,regtype,regid))
+        f.write(f"    /* {regtype}{regid}V is *(MMVector *)"
+                f"({regtype}{regid}V_void) */\n")
 
 def gen_helper_dest_decl_ext_pair(f,regtype,regid,regno):
-    f.write("    /* %s%sV is *(MMVectorPair *))%s%sV_void) */\n" % \
-        (regtype,regid,regtype, regid))
+    f.write(f"    /* {regtype}{regid}V is *(MMVectorPair *))"
+            f"{regtype}{regid}V_void) */\n")
 
 def gen_helper_dest_decl_opn(f,regtype,regid,i):
     if (hex_common.is_pair(regid)):
@@ -114,21 +112,21 @@ def gen_helper_dest_decl_opn(f,regtype,regid,i):
 
 def gen_helper_src_var_ext(f,regtype,regid):
     if (regtype == "Q"):
-       f.write("    /* %s%sV is *(MMQReg *)(%s%sV_void) */\n" % \
-           (regtype,regid,regtype,regid))
+       f.write(f"    /* {regtype}{regid}V is *(MMQReg *)"
+               f"({regtype}{regid}V_void) */\n")
     else:
-       f.write("    /* %s%sV is *(MMVector *)(%s%sV_void) */\n" % \
-           (regtype,regid,regtype,regid))
+       f.write(f"    /* {regtype}{regid}V is *(MMVector *)"
+               f"({regtype}{regid}V_void) */\n")
 
 def gen_helper_src_var_ext_pair(f,regtype,regid,regno):
-    f.write("    /* %s%sV%s is *(MMVectorPair *)(%s%sV%s_void) */\n" % \
-        (regtype,regid,regno,regtype,regid,regno))
+    f.write(f"    /* {regtype}{regid}V{regno} is *(MMVectorPair *)"
+            f"({regtype}{regid}V{regno}_void) */\n")
 
 def gen_helper_return(f,regtype,regid,regno):
-    f.write("    return %s%sV;\n" % (regtype,regid))
+    f.write(f"    return {regtype}{regid}V;\n")
 
 def gen_helper_return_pair(f,regtype,regid,regno):
-    f.write("    return %s%sV;\n" % (regtype,regid))
+    f.write(f"    return {regtype}{regid}V;\n")
 
 def gen_helper_dst_write_ext(f,regtype,regid):
     return
@@ -181,8 +179,8 @@ def gen_helper_function(f, tag, tagregs, tagimms):
 
     if (numscalarresults > 1):
         ## The helper is bogus when there is more than one result
-        f.write("void HELPER(%s)(CPUHexagonState *env) { BOGUS_HELPER(%s); }\n"
-                % (tag, tag))
+        f.write(f"void HELPER({tag})(CPUHexagonState *env) "
+                f"{{ BOGUS_HELPER({tag}); }}\n")
     else:
         ## The return type of the function is the type of the destination
         ## register (if scalar)
@@ -205,7 +203,7 @@ def gen_helper_function(f, tag, tagregs, tagimms):
 
         if (numscalarresults == 0):
             f.write("void")
-        f.write(" HELPER(%s)(CPUHexagonState *env" % tag)
+        f.write(f" HELPER({tag})(CPUHexagonState *env")
 
         ## Arguments include the vector destination operands
         i = 1
@@ -290,7 +288,7 @@ def gen_helper_function(f, tag, tagregs, tagimms):
         if 'A_FPOP' in hex_common.attribdict[tag]:
             f.write('    arch_fpop_start(env);\n');
 
-        f.write("    %s\n" % hex_common.semdict[tag])
+        f.write(f"    {hex_common.semdict[tag]}\n")
 
         if 'A_FPOP' in hex_common.attribdict[tag]:
             f.write('    arch_fpop_end(env);\n');
diff --git a/target/hexagon/gen_helper_protos.py b/target/hexagon/gen_helper_protos.py
index ddddc9e4f0..d795f32047 100755
--- a/target/hexagon/gen_helper_protos.py
+++ b/target/hexagon/gen_helper_protos.py
@@ -47,9 +47,9 @@
 
 def gen_def_helper_opn(f, tag, regtype, regid, toss, numregs, i):
     if (hex_common.is_pair(regid)):
-        f.write(", %s" % (def_helper_types_pair[regtype]))
+        f.write(f", {def_helper_types_pair[regtype]}")
     elif (hex_common.is_single(regid)):
-        f.write(", %s" % (def_helper_types[regtype]))
+        f.write(f", {def_helper_types[regtype]}")
     else:
         print("Bad register parse: ",regtype,regid,toss,numregs)
 
@@ -77,7 +77,7 @@ def gen_helper_prototype(f, tag, tagregs, tagimms):
 
     if (numscalarresults > 1):
         ## The helper is bogus when there is more than one result
-        f.write('DEF_HELPER_1(%s, void, env)\n' % tag)
+        f.write(f'DEF_HELPER_1({tag}, void, env)\n')
     else:
         ## Figure out how many arguments the helper will take
         if (numscalarresults == 0):
@@ -88,7 +88,7 @@ def gen_helper_prototype(f, tag, tagregs, tagimms):
             if hex_common.need_PC(tag): def_helper_size += 1
             if hex_common.helper_needs_next_PC(tag): def_helper_size += 1
             if hex_common.need_condexec_reg(tag, regs): def_helper_size += 1
-            f.write('DEF_HELPER_%s(%s' % (def_helper_size, tag))
+            f.write(f'DEF_HELPER_{def_helper_size}({tag}')
             ## The return type is void
             f.write(', void' )
         else:
@@ -99,7 +99,7 @@ def gen_helper_prototype(f, tag, tagregs, tagimms):
             if hex_common.need_PC(tag): def_helper_size += 1
             if hex_common.need_condexec_reg(tag, regs): def_helper_size += 1
             if hex_common.helper_needs_next_PC(tag): def_helper_size += 1
-            f.write('DEF_HELPER_%s(%s' % (def_helper_size, tag))
+            f.write(f'DEF_HELPER_{def_helper_size}({tag}')
 
         ## Generate the qemu DEF_HELPER type for each result
         ## Iterate over this list twice
diff --git a/target/hexagon/gen_idef_parser_funcs.py b/target/hexagon/gen_idef_parser_funcs.py
index 917753d6d8..60be8e37b6 100644
--- a/target/hexagon/gen_idef_parser_funcs.py
+++ b/target/hexagon/gen_idef_parser_funcs.py
@@ -110,20 +110,20 @@ def main():
                                  and hex_common.is_new_val(regtype, regid, tag))
 
                 if is_pair or is_single_old:
-                    arguments.append("%s%s%sV" % (prefix, regtype, regid))
+                    arguments.append(f"{prefix}{regtype}{regid}V")
                 elif is_single_new:
-                    arguments.append("%s%s%sN" % (prefix, regtype, regid))
+                    arguments.append(f"{prefix}{regtype}{regid}N")
                 else:
                     print("Bad register parse: ",regtype,regid,toss,numregs)
 
             for immlett,bits,immshift in imms:
                 arguments.append(hex_common.imm_name(immlett))
 
-            f.write("%s(%s) {\n" % (tag, ", ".join(arguments)))
+            f.write(f"{tag}({', '.join(arguments)}) {{\n")
             f.write("    ");
             if hex_common.need_ea(tag):
                 f.write("size4u_t EA; ");
-            f.write("%s\n" % hex_common.semdict[tag])
+            f.write(f"{hex_common.semdict[tag]}\n")
             f.write("}\n\n")
 
 if __name__ == "__main__":
diff --git a/target/hexagon/gen_op_attribs.py b/target/hexagon/gen_op_attribs.py
index 6a1a1ca21d..fc705375d4 100755
--- a/target/hexagon/gen_op_attribs.py
+++ b/target/hexagon/gen_op_attribs.py
@@ -32,8 +32,8 @@ def main():
     ##
     with open(sys.argv[3], 'w') as f:
         for tag in hex_common.tags:
-            f.write('OP_ATTRIB(%s,ATTRIBS(%s))\n' % \
-                (tag, ','.join(sorted(hex_common.attribdict[tag]))))
+            f.write(f'OP_ATTRIB({tag},ATTRIBS('
+                    f'{",".join(sorted(hex_common.attribdict[tag]))}))\n')
 
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_op_regs.py b/target/hexagon/gen_op_regs.py
index e8137d4a12..5f0ae20722 100755
--- a/target/hexagon/gen_op_regs.py
+++ b/target/hexagon/gen_op_regs.py
@@ -85,25 +85,25 @@ def main():
                 if hex_common.attribinfo[attrib]['wreg']:
                     wregs.append(strip_reg_prefix(attribinfo[attrib]['wreg']))
             regids += calculate_regid_letters(tag)
-            f.write('REGINFO(%s,"%s",\t/*RD:*/\t"%s",\t/*WR:*/\t"%s")\n' % \
-                (tag,regids,",".join(rregs),",".join(wregs)))
+            f.write(f'REGINFO({tag},"{regids}",\t/*RD:*/\t"{",".join(rregs)}",'
+                    f'\t/*WR:*/\t"{",".join(wregs)}")\n')
 
         for tag in hex_common.tags:
             imms = tagimms[tag]
-            f.write( 'IMMINFO(%s' % tag)
+            f.write(f'IMMINFO({tag}')
             if not imms:
                 f.write(''','u',0,0,'U',0,0''')
             for sign,size,shamt in imms:
                 if sign == 'r': sign = 's'
                 if not shamt:
                     shamt = "0"
-                f.write(''','%s',%s,%s''' % (sign,size,shamt))
+                f.write(f''','{sign}',{size},{shamt}''')
             if len(imms) == 1:
                 if sign.isupper():
                     myu = 'u'
                 else:
                     myu = 'U'
-                f.write(''','%s',0,0''' % myu)
+                f.write(f''','{myu}',0,0''')
             f.write(')\n')
 
 if __name__ == "__main__":
diff --git a/target/hexagon/gen_opcodes_def.py b/target/hexagon/gen_opcodes_def.py
index fa604a8db9..550949cbc6 100755
--- a/target/hexagon/gen_opcodes_def.py
+++ b/target/hexagon/gen_opcodes_def.py
@@ -30,7 +30,7 @@ def main():
     ##
     with open(sys.argv[3], 'w') as f:
         for tag in hex_common.tags:
-            f.write ( "OPCODE(%s),\n" % (tag) )
+            f.write(f"OPCODE({tag}),\n")
 
 if __name__ == "__main__":
     main()
diff --git a/target/hexagon/gen_printinsn.py b/target/hexagon/gen_printinsn.py
index 12737bf8a0..fe02572922 100755
--- a/target/hexagon/gen_printinsn.py
+++ b/target/hexagon/gen_printinsn.py
@@ -119,7 +119,7 @@ def main():
             if ("A_VECX" in hex_common.attribdict[tag]):
                 macname = "DEF_VECX_PRINTINFO"
             else: macname = "DEF_PRINTINFO"
-            f.write('%s(%s,"%s%%s"' % (macname,tag,beh))
+            f.write(f'{macname}({tag},"{beh}%s"')
             regs_or_imms = \
                 hex_common.reg_or_immre.findall(hex_common.behdict[tag])
             ri = 0
@@ -132,14 +132,14 @@ def main():
                     else:
                         regno = ri
                     if len(b) == 1:
-                        f.write(', insn->regno[%d]' % regno)
+                        f.write(f', insn->regno[{regno}]')
                         if 'S' in a:
-                            f.write(', sreg2str(insn->regno[%d])' % regno)
+                            f.write(f', sreg2str(insn->regno[{regno}])')
                         elif 'C' in a:
-                            f.write(', creg2str(insn->regno[%d])' % regno)
+                            f.write(f', creg2str(insn->regno[{regno}])')
                     elif len(b) == 2:
-                        f.write(', insn->regno[%d] + 1, insn->regno[%d]' % \
-                            (regno,regno))
+                        f.write(f', insn->regno[{regno}] + 1'
+                                f', insn->regno[{regno}]')
                     else:
                         print("Put some stuff to handle quads here")
                     if b not in seenregs:
@@ -165,7 +165,7 @@ def main():
                         else:
                             f.write(',""')
                         ii = 0
-                    f.write(', insn->immed[%d]' % ii)
+                    f.write(f', insn->immed[{ii}]')
             # append empty string so there is at least one more arg
             f.write(',"")\n')
 
diff --git a/target/hexagon/gen_shortcode.py b/target/hexagon/gen_shortcode.py
index 9b589d0189..ea0965d306 100755
--- a/target/hexagon/gen_shortcode.py
+++ b/target/hexagon/gen_shortcode.py
@@ -23,7 +23,7 @@
 import hex_common
 
 def gen_shortcode(f, tag):
-    f.write('DEF_SHORTCODE(%s, %s)\n' % (tag, hex_common.semdict[tag]))
+    f.write(f'DEF_SHORTCODE({tag}, {hex_common.semdict[tag]})\n')
 
 def main():
     hex_common.read_semantics_file(sys.argv[1])
diff --git a/target/hexagon/gen_tcg_func_table.py b/target/hexagon/gen_tcg_func_table.py
index 4809d3273e..ec9ca20561 100755
--- a/target/hexagon/gen_tcg_func_table.py
+++ b/target/hexagon/gen_tcg_func_table.py
@@ -49,7 +49,7 @@ def main():
             if ( tag == "Y6_diag1" ) :
                 continue
 
-            f.write("    [%s] = generate_%s,\n" % (tag, tag))
+            f.write(f"    [{tag}] = generate_{tag},\n")
         f.write("};\n\n")
 
         f.write("#endif    /* HEXAGON_FUNC_TABLE_H */\n")
diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index fa93e185ce..285b3abe3a 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -29,170 +29,151 @@ def gen_decl_ea_tcg(f, tag):
     f.write("    TCGv EA G_GNUC_UNUSED = tcg_temp_new();\n")
 
 def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
-    regN="%s%sN" % (regtype,regid)
+    regN=f"{regtype}{regid}N"
     if (regtype == "R"):
-        f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
+        f.write(f"    const int {regN} = insn->regno[{regno}];\n")
     elif (regtype == "C"):
-        f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
-            (regN, regno))
+        f.write(f"    const int {regN} = insn->regno[{regno}] + HEX_REG_SA0;\n")
     else:
         print("Bad register parse: ", regtype, regid)
-    f.write("    TCGv_i64 %s%sV = get_result_gpr_pair(ctx, %s);\n" % \
-        (regtype, regid, regN))
+    f.write(f"    TCGv_i64 {regtype}{regid}V = "
+            f"get_result_gpr_pair(ctx, {regN});\n")
 
 def genptr_decl_writable(f, tag, regtype, regid, regno):
-    regN="%s%sN" % (regtype,regid)
+    regN=f"{regtype}{regid}N"
     if (regtype == "R"):
-        f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
-        f.write("    TCGv %s%sV = get_result_gpr(ctx, %s);\n" % \
-            (regtype, regid, regN))
+        f.write(f"    const int {regN} = insn->regno[{regno}];\n")
+        f.write(f"    TCGv {regtype}{regid}V = get_result_gpr(ctx, {regN});\n")
     elif (regtype == "C"):
-        f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
-            (regN, regno))
-        f.write("    TCGv %s%sV = get_result_gpr(ctx, %s);\n" % \
-            (regtype, regid, regN))
+        f.write(f"    const int {regN} = insn->regno[{regno}] + HEX_REG_SA0;\n")
+        f.write(f"    TCGv {regtype}{regid}V = get_result_gpr(ctx, {regN});\n")
     elif (regtype == "P"):
-        f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
-        f.write("    TCGv %s%sV = tcg_temp_new();\n" % \
-            (regtype, regid))
+        f.write(f"    const int {regN} = insn->regno[{regno}];\n")
+        f.write(f"    TCGv {regtype}{regid}V = tcg_temp_new();\n")
     else:
         print("Bad register parse: ", regtype, regid)
 
 def genptr_decl(f, tag, regtype, regid, regno):
-    regN="%s%sN" % (regtype,regid)
+    regN=f"{regtype}{regid}N"
     if (regtype == "R"):
         if (regid in {"ss", "tt"}):
-            f.write("    TCGv_i64 %s%sV = tcg_temp_new_i64();\n" % \
-                (regtype, regid))
-            f.write("    const int %s = insn->regno[%d];\n" % \
-                (regN, regno))
+            f.write(f"    TCGv_i64 {regtype}{regid}V = tcg_temp_new_i64();\n")
+            f.write(f"    const int {regN} = insn->regno[{regno}];\n")
         elif (regid in {"dd", "ee", "xx", "yy"}):
             genptr_decl_pair_writable(f, tag, regtype, regid, regno)
         elif (regid in {"s", "t", "u", "v"}):
-            f.write("    TCGv %s%sV = hex_gpr[insn->regno[%d]];\n" % \
-                (regtype, regid, regno))
+            f.write(f"    TCGv {regtype}{regid}V = "
+                    f"hex_gpr[insn->regno[{regno}]];\n")
         elif (regid in {"d", "e", "x", "y"}):
             genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "P"):
         if (regid in {"s", "t", "u", "v"}):
-            f.write("    TCGv %s%sV = hex_pred[insn->regno[%d]];\n" % \
-                (regtype, regid, regno))
+            f.write(f"    TCGv {regtype}{regid}V = "
+                    f"hex_pred[insn->regno[{regno}]];\n")
         elif (regid in {"d", "e", "x"}):
             genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "C"):
         if (regid == "ss"):
-            f.write("    TCGv_i64 %s%sV = tcg_temp_new_i64();\n" % \
-                (regtype, regid))
-            f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
-                (regN, regno))
+            f.write(f"    TCGv_i64 {regtype}{regid}V = "
+                    f"tcg_temp_new_i64();\n")
+            f.write(f"    const int {regN} = insn->regno[{regno}] + "
+                    "HEX_REG_SA0;\n")
         elif (regid == "dd"):
             genptr_decl_pair_writable(f, tag, regtype, regid, regno)
         elif (regid == "s"):
-            f.write("    TCGv %s%sV = tcg_temp_new();\n" % \
-                (regtype, regid))
-            f.write("    const int %s%sN = insn->regno[%d] + HEX_REG_SA0;\n" % \
-                (regtype, regid, regno))
+            f.write(f"    TCGv {regtype}{regid}V = tcg_temp_new();\n")
+            f.write(f"    const int {regtype}{regid}N = insn->regno[{regno}] + "
+                    "HEX_REG_SA0;\n")
         elif (regid == "d"):
             genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "M"):
         if (regid == "u"):
-            f.write("    const int %s%sN = insn->regno[%d];\n"% \
-                (regtype, regid, regno))
-            f.write("    TCGv %s%sV = hex_gpr[%s%sN + HEX_REG_M0];\n" % \
-                (regtype, regid, regtype, regid))
+            f.write(f"    const int {regtype}{regid}N = "
+                    f"insn->regno[{regno}];\n")
+            f.write(f"    TCGv {regtype}{regid}V = hex_gpr[{regtype}{regid}N + "
+                    "HEX_REG_M0];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "V"):
         if (regid in {"dd"}):
-            f.write("    const int %s%sN = insn->regno[%d];\n" %\
-                (regtype, regid, regno))
-            f.write("    const intptr_t %s%sV_off =\n" %\
-                 (regtype, regid))
+            f.write(f"    const int {regtype}{regid}N = "
+                    f"insn->regno[{regno}];\n")
+            f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
             if (hex_common.is_tmp_result(tag)):
-                f.write("        ctx_tmp_vreg_off(ctx, %s%sN, 2, true);\n" % \
-                     (regtype, regid))
+                f.write(f"        ctx_tmp_vreg_off(ctx, {regtype}{regid}N, 2, "
+                        "true);\n")
             else:
-                f.write("        ctx_future_vreg_off(ctx, %s%sN," % \
-                     (regtype, regid))
+                f.write(f"        ctx_future_vreg_off(ctx, {regtype}{regid}N,")
                 f.write(" 2, true);\n")
             if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    TCGv_ptr %s%sV = tcg_temp_new_ptr();\n" % \
-                    (regtype, regid))
-                f.write("    tcg_gen_addi_ptr(%s%sV, cpu_env, %s%sV_off);\n" % \
-                    (regtype, regid, regtype, regid))
+                f.write(f"    TCGv_ptr {regtype}{regid}V = "
+                        "tcg_temp_new_ptr();\n")
+                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                        f"{regtype}{regid}V_off);\n")
         elif (regid in {"uu", "vv", "xx"}):
-            f.write("    const int %s%sN = insn->regno[%d];\n" % \
-                (regtype, regid, regno))
-            f.write("    const intptr_t %s%sV_off =\n" % \
-                 (regtype, regid))
-            f.write("        offsetof(CPUHexagonState, %s%sV);\n" % \
-                 (regtype, regid))
+            f.write(f"    const int {regtype}{regid}N = "
+                    f"insn->regno[{regno}];\n")
+            f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
+            f.write(f"        offsetof(CPUHexagonState, {regtype}{regid}V);\n")
             if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    TCGv_ptr %s%sV = tcg_temp_new_ptr();\n" % \
-                    (regtype, regid))
-                f.write("    tcg_gen_addi_ptr(%s%sV, cpu_env, %s%sV_off);\n" % \
-                    (regtype, regid, regtype, regid))
+                f.write(f"    TCGv_ptr {regtype}{regid}V = "
+                        "tcg_temp_new_ptr();\n")
+                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                        f"{regtype}{regid}V_off);\n")
         elif (regid in {"s", "u", "v", "w"}):
-            f.write("    const int %s%sN = insn->regno[%d];\n" % \
-                (regtype, regid, regno))
-            f.write("    const intptr_t %s%sV_off =\n" % \
-                              (regtype, regid))
-            f.write("        vreg_src_off(ctx, %s%sN);\n" % \
-                              (regtype, regid))
+            f.write(f"    const int {regtype}{regid}N = "
+                    f"insn->regno[{regno}];\n")
+            f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
+            f.write(f"        vreg_src_off(ctx, {regtype}{regid}N);\n")
             if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    TCGv_ptr %s%sV = tcg_temp_new_ptr();\n" % \
-                    (regtype, regid))
+                f.write(f"    TCGv_ptr {regtype}{regid}V = "
+                        "tcg_temp_new_ptr();\n")
         elif (regid in {"d", "x", "y"}):
-            f.write("    const int %s%sN = insn->regno[%d];\n" % \
-                (regtype, regid, regno))
-            f.write("    const intptr_t %s%sV_off =\n" % \
-                (regtype, regid))
+            f.write(f"    const int {regtype}{regid}N = "
+                    f"insn->regno[{regno}];\n")
+            f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
             if (regid == "y"):
                 f.write("        offsetof(CPUHexagonState, vtmp);\n")
             elif (hex_common.is_tmp_result(tag)):
-                f.write("        ctx_tmp_vreg_off(ctx, %s%sN, 1, true);\n" % \
-                    (regtype, regid))
+                f.write(f"        ctx_tmp_vreg_off(ctx, {regtype}{regid}N, 1, "
+                        "true);\n")
             else:
-                f.write("        ctx_future_vreg_off(ctx, %s%sN," % \
-                    (regtype, regid))
+                f.write(f"        ctx_future_vreg_off(ctx, {regtype}{regid}N,")
                 f.write(" 1, true);\n");
 
             if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    TCGv_ptr %s%sV = tcg_temp_new_ptr();\n" % \
-                    (regtype, regid))
-                f.write("    tcg_gen_addi_ptr(%s%sV, cpu_env, %s%sV_off);\n" % \
-                    (regtype, regid, regtype, regid))
+                f.write(f"    TCGv_ptr {regtype}{regid}V = "
+                        "tcg_temp_new_ptr();\n")
+                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                        f"{regtype}{regid}V_off);\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "Q"):
         if (regid in {"d", "e", "x"}):
-            f.write("    const int %s%sN = insn->regno[%d];\n" % \
-                (regtype, regid, regno))
-            f.write("    const intptr_t %s%sV_off =\n" % \
-                (regtype, regid))
-            f.write("        get_result_qreg(ctx, %s%sN);\n" % \
-                (regtype, regid))
+            f.write(f"    const int {regtype}{regid}N = "
+                    f"insn->regno[{regno}];\n")
+            f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
+            f.write(f"        get_result_qreg(ctx, {regtype}{regid}N);\n")
             if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    TCGv_ptr %s%sV = tcg_temp_new_ptr();\n" % \
-                    (regtype, regid))
-                f.write("    tcg_gen_addi_ptr(%s%sV, cpu_env, %s%sV_off);\n" % \
-                    (regtype, regid, regtype, regid))
+                f.write(f"    TCGv_ptr {regtype}{regid}V = "
+                        "tcg_temp_new_ptr();\n")
+                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                        f"{regtype}{regid}V_off);\n")
         elif (regid in {"s", "t", "u", "v"}):
-            f.write("    const int %s%sN = insn->regno[%d];\n" % \
-                (regtype, regid, regno))
-            f.write("    const intptr_t %s%sV_off =\n" %\
-                (regtype, regid))
-            f.write("        offsetof(CPUHexagonState, QRegs[%s%sN]);\n" % \
-                (regtype, regid))
+            f.write(f"    const int {regtype}{regid}N = "
+                    f"insn->regno[{regno}];\n")
+            f.write(f"    const intptr_t {regtype}{regid}V_off =\n")
+            f.write(f"        offsetof(CPUHexagonState, "
+                    f"QRegs[{regtype}{regid}N]);\n")
             if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    TCGv_ptr %s%sV = tcg_temp_new_ptr();\n" % \
-                    (regtype, regid))
+                f.write(f"    TCGv_ptr {regtype}{regid}V = "
+                        "tcg_temp_new_ptr();\n")
         else:
             print("Bad register parse: ", regtype, regid)
     else:
@@ -201,29 +182,28 @@ def genptr_decl(f, tag, regtype, regid, regno):
 def genptr_decl_new(f, tag, regtype, regid, regno):
     if (regtype == "N"):
         if (regid in {"s", "t"}):
-            f.write("    TCGv %s%sN = hex_new_value[insn->regno[%d]];\n" % \
-                (regtype, regid, regno))
+            f.write(f"    TCGv {regtype}{regid}N = "
+                    f"hex_new_value[insn->regno[{regno}]];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "P"):
         if (regid in {"t", "u", "v"}):
-            f.write("    TCGv %s%sN = hex_new_pred_value[insn->regno[%d]];\n" % \
-                (regtype, regid, regno))
+            f.write(f"    TCGv {regtype}{regid}N = "
+                    f"hex_new_pred_value[insn->regno[{regno}]];\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "O"):
         if (regid == "s"):
-            f.write("    const intptr_t %s%sN_num = insn->regno[%d];\n" % \
-                (regtype, regid, regno))
+            f.write(f"    const intptr_t {regtype}{regid}N_num = "
+                    f"insn->regno[{regno}];\n")
             if (hex_common.skip_qemu_helper(tag)):
-                f.write("    const intptr_t %s%sN_off =\n" % \
-                    (regtype, regid))
-                f.write("         ctx_future_vreg_off(ctx, %s%sN_num," % \
-                    (regtype, regid))
+                f.write(f"    const intptr_t {regtype}{regid}N_off =\n")
+                f.write("         ctx_future_vreg_off(ctx, "
+                        f"{regtype}{regid}N_num,")
                 f.write(" 1, true);\n")
             else:
-                f.write("    TCGv %s%sN = tcg_constant_tl(%s%sN_num);\n" % \
-                    (regtype, regid, regtype, regid))
+                f.write(f"    TCGv {regtype}{regid}N = "
+                        f"tcg_constant_tl({regtype}{regid}N_num);\n")
         else:
             print("Bad register parse: ", regtype, regid)
     else:
@@ -247,38 +227,37 @@ def genptr_decl_imm(f,immlett):
         i = 1
     else:
         i = 0
-    f.write("    int %s = insn->immed[%d];\n" % \
-        (hex_common.imm_name(immlett), i))
+    f.write(f"    int {hex_common.imm_name(immlett)} = insn->immed[{i}];\n")
 
 def genptr_src_read(f, tag, regtype, regid):
     if (regtype == "R"):
         if (regid in {"ss", "tt", "xx", "yy"}):
-            f.write("    tcg_gen_concat_i32_i64(%s%sV, hex_gpr[%s%sN],\n" % \
-                (regtype, regid, regtype, regid))
-            f.write("                                 hex_gpr[%s%sN + 1]);\n" % \
-                (regtype, regid))
+            f.write(f"    tcg_gen_concat_i32_i64({regtype}{regid}V, "
+                    f"hex_gpr[{regtype}{regid}N],\n")
+            f.write(f"                                 hex_gpr[{regtype}"
+                    f"{regid}N + 1]);\n")
         elif (regid in {"x", "y"}):
             ## For read/write registers, we need to get the original value into
             ## the result TCGv.  For conditional instructions, this is done in
             ## gen_start_packet.  For unconditional instructions, we do it here.
             if ('A_CONDEXEC' not in hex_common.attribdict[tag]):
-                f.write("    tcg_gen_mov_tl(%s%sV, hex_gpr[%s%sN]);\n" % \
-                    (regtype, regid, regtype, regid))
+                f.write(f"    tcg_gen_mov_tl({regtype}{regid}V, "
+                        f"hex_gpr[{regtype}{regid}N]);\n")
         elif (regid not in {"s", "t", "u", "v"}):
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "P"):
         if (regid == "x"):
-            f.write("    tcg_gen_mov_tl(%s%sV, hex_pred[%s%sN]);\n" % \
-                (regtype, regid, regtype, regid))
+            f.write(f"    tcg_gen_mov_tl({regtype}{regid}V, "
+                    f"hex_pred[{regtype}{regid}N]);\n")
         elif (regid not in {"s", "t", "u", "v"}):
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "C"):
         if (regid == "ss"):
-            f.write("    gen_read_ctrl_reg_pair(ctx, %s%sN, %s%sV);\n" % \
-                             (regtype, regid, regtype, regid))
+            f.write(f"    gen_read_ctrl_reg_pair(ctx, {regtype}{regid}N, "
+                    f"{regtype}{regid}V);\n")
         elif (regid == "s"):
-            f.write("    gen_read_ctrl_reg(ctx, %s%sN, %s%sV);\n" % \
-                             (regtype, regid, regtype, regid))
+            f.write(f"    gen_read_ctrl_reg(ctx, {regtype}{regid}N, "
+                    f"{regtype}{regid}V);\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "M"):
@@ -286,39 +265,32 @@ def genptr_src_read(f, tag, regtype, regid):
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "V"):
         if (regid in {"uu", "vv", "xx"}):
-            f.write("    tcg_gen_gvec_mov(MO_64, %s%sV_off,\n" % \
-                (regtype, regid))
-            f.write("        vreg_src_off(ctx, %s%sN),\n" % \
-                (regtype, regid))
+            f.write(f"    tcg_gen_gvec_mov(MO_64, {regtype}{regid}V_off,\n")
+            f.write(f"        vreg_src_off(ctx, {regtype}{regid}N),\n")
             f.write("        sizeof(MMVector), sizeof(MMVector));\n")
             f.write("    tcg_gen_gvec_mov(MO_64,\n")
-            f.write("        %s%sV_off + sizeof(MMVector),\n" % \
-                (regtype, regid))
-            f.write("        vreg_src_off(ctx, %s%sN ^ 1),\n" % \
-                (regtype, regid))
+            f.write(f"        {regtype}{regid}V_off + sizeof(MMVector),\n")
+            f.write(f"        vreg_src_off(ctx, {regtype}{regid}N ^ 1),\n")
             f.write("        sizeof(MMVector), sizeof(MMVector));\n")
         elif (regid in {"s", "u", "v", "w"}):
             if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    tcg_gen_addi_ptr(%s%sV, cpu_env, %s%sV_off);\n" % \
-                                 (regtype, regid, regtype, regid))
+                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                        f"{regtype}{regid}V_off);\n")
         elif (regid in {"x", "y"}):
-            f.write("    tcg_gen_gvec_mov(MO_64, %s%sV_off,\n" % \
-                             (regtype, regid))
-            f.write("        vreg_src_off(ctx, %s%sN),\n" % \
-                             (regtype, regid))
+            f.write(f"    tcg_gen_gvec_mov(MO_64, {regtype}{regid}V_off,\n")
+            f.write(f"        vreg_src_off(ctx, {regtype}{regid}N),\n")
             f.write("        sizeof(MMVector), sizeof(MMVector));\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "Q"):
         if (regid in {"s", "t", "u", "v"}):
             if (not hex_common.skip_qemu_helper(tag)):
-                f.write("    tcg_gen_addi_ptr(%s%sV, cpu_env, %s%sV_off);\n" % \
-                    (regtype, regid, regtype, regid))
+                f.write(f"    tcg_gen_addi_ptr({regtype}{regid}V, cpu_env, "
+                        f"{regtype}{regid}V_off);\n")
         elif (regid in {"x"}):
-            f.write("    tcg_gen_gvec_mov(MO_64, %s%sV_off,\n" % \
-                (regtype, regid))
-            f.write("        offsetof(CPUHexagonState, QRegs[%s%sN]),\n" % \
-                (regtype, regid))
+            f.write(f"    tcg_gen_gvec_mov(MO_64, {regtype}{regid}V_off,\n")
+            f.write(f"        offsetof(CPUHexagonState, "
+                    f"QRegs[{regtype}{regid}N]),\n")
             f.write("        sizeof(MMQReg), sizeof(MMQReg));\n")
         else:
             print("Bad register parse: ", regtype, regid)
@@ -354,50 +326,50 @@ def genptr_src_read_opn(f,regtype,regid,tag):
 def gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i):
     if (i > 0): f.write(", ")
     if (hex_common.is_pair(regid)):
-        f.write("%s%sV" % (regtype,regid))
+        f.write(f"{regtype}{regid}V")
     elif (hex_common.is_single(regid)):
         if hex_common.is_old_val(regtype, regid, tag):
-            f.write("%s%sV" % (regtype,regid))
+            f.write(f"{regtype}{regid}V")
         elif hex_common.is_new_val(regtype, regid, tag):
-            f.write("%s%sN" % (regtype,regid))
+            f.write(f"{regtype}{regid}N")
         else:
             print("Bad register parse: ",regtype,regid,toss,numregs)
     else:
         print("Bad register parse: ",regtype,regid,toss,numregs)
 
 def gen_helper_decl_imm(f,immlett):
-    f.write("    TCGv tcgv_%s = tcg_constant_tl(%s);\n" % \
-        (hex_common.imm_name(immlett), hex_common.imm_name(immlett)))
+    f.write(f"    TCGv tcgv_{hex_common.imm_name(immlett)} = "
+            f"tcg_constant_tl({hex_common.imm_name(immlett)});\n")
 
 def gen_helper_call_imm(f,immlett):
-    f.write(", tcgv_%s" % hex_common.imm_name(immlett))
+    f.write(f", tcgv_{hex_common.imm_name(immlett)}")
 
 def genptr_dst_write_pair(f, tag, regtype, regid):
-    f.write("    gen_log_reg_write_pair(%s%sN, %s%sV);\n" % \
-        (regtype, regid, regtype, regid))
+    f.write(f"    gen_log_reg_write_pair({regtype}{regid}N, "
+            f"{regtype}{regid}V);\n")
 
 def genptr_dst_write(f, tag, regtype, regid):
     if (regtype == "R"):
         if (regid in {"dd", "xx", "yy"}):
             genptr_dst_write_pair(f, tag, regtype, regid)
         elif (regid in {"d", "e", "x", "y"}):
-            f.write("    gen_log_reg_write(%s%sN, %s%sV);\n" % \
-                (regtype, regid, regtype, regid))
+            f.write(f"    gen_log_reg_write({regtype}{regid}N, "
+                    f"{regtype}{regid}V);\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "P"):
         if (regid in {"d", "e", "x"}):
-            f.write("    gen_log_pred_write(ctx, %s%sN, %s%sV);\n" % \
-                (regtype, regid, regtype, regid))
+            f.write(f"    gen_log_pred_write(ctx, {regtype}{regid}N, "
+                    f"{regtype}{regid}V);\n")
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "C"):
         if (regid == "dd"):
-            f.write("    gen_write_ctrl_reg_pair(ctx, %s%sN, %s%sV);\n" % \
-                             (regtype, regid, regtype, regid))
+            f.write(f"    gen_write_ctrl_reg_pair(ctx, {regtype}{regid}N, "
+                    f"{regtype}{regid}V);\n")
         elif (regid == "d"):
-            f.write("    gen_write_ctrl_reg(ctx, %s%sN, %s%sV);\n" % \
-                             (regtype, regid, regtype, regid))
+            f.write(f"    gen_write_ctrl_reg(ctx, {regtype}{regid}N, "
+                    f"{regtype}{regid}V);\n")
         else:
             print("Bad register parse: ", regtype, regid)
     else:
@@ -406,17 +378,16 @@ def genptr_dst_write(f, tag, regtype, regid):
 def genptr_dst_write_ext(f, tag, regtype, regid, newv="EXT_DFL"):
     if (regtype == "V"):
         if (regid in {"xx"}):
-            f.write("    gen_log_vreg_write_pair(ctx, %s%sV_off, %s%sN, " % \
-                (regtype, regid, regtype, regid))
-            f.write("%s);\n" % \
-                (newv))
+            f.write(f"    gen_log_vreg_write_pair(ctx, {regtype}{regid}V_off, "
+                    f"{regtype}{regid}N, {newv});\n")
         elif (regid in {"y"}):
-            f.write("    gen_log_vreg_write(ctx, %s%sV_off, %s%sN, %s);\n" % \
-                (regtype, regid, regtype, regid, newv))
+            f.write(f"    gen_log_vreg_write(ctx, {regtype}{regid}V_off, "
+                    f"{regtype}{regid}N, {newv});\n")
         elif (regid not in {"dd", "d", "x"}):
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "Q"):
         if (regid not in {"d", "e", "x"}):
+
             print("Bad register parse: ", regtype, regid)
     else:
         print("Bad register parse: ", regtype, regid)
@@ -465,7 +436,7 @@ def genptr_dst_write_opn(f,regtype, regid, tag):
 ##       <GEN>  is gen_helper_A2_add(RdV, cpu_env, RsV, RtV);
 ##
 def gen_tcg_func(f, tag, regs, imms):
-    f.write("static void generate_%s(DisasContext *ctx)\n" %tag)
+    f.write(f"static void generate_{tag}(DisasContext *ctx)\n")
     f.write('{\n')
 
     f.write("    Insn *insn __attribute__((unused)) = ctx->insn;\n")
@@ -496,11 +467,11 @@ def gen_tcg_func(f, tag, regs, imms):
             if (hex_common.is_pair(regid)
                 or (hex_common.is_single(regid)
                     and hex_common.is_old_val(regtype, regid, tag))):
-                declared.append("%s%sV" % (regtype, regid))
+                declared.append(f"{regtype}{regid}V")
                 if regtype == "M":
-                    declared.append("%s%sN" % (regtype, regid))
+                    declared.append(f"{regtype}{regid}N")
             elif hex_common.is_new_val(regtype, regid, tag):
-                declared.append("%s%sN" % (regtype,regid))
+                declared.append(f"{regtype}{regid}N")
             else:
                 print("Bad register parse: ",regtype,regid,toss,numregs)
 
@@ -509,10 +480,10 @@ def gen_tcg_func(f, tag, regs, imms):
             declared.append(hex_common.imm_name(immlett))
 
         arguments = ", ".join(["ctx", "ctx->insn", "ctx->pkt"] + declared)
-        f.write("    emit_%s(%s);\n" % (tag, arguments))
+        f.write(f"    emit_{tag}({arguments});\n")
 
     elif ( hex_common.skip_qemu_helper(tag) ):
-        f.write("    fGEN_TCG_%s(%s);\n" % (tag, hex_common.semdict[tag]))
+        f.write(f"    fGEN_TCG_{tag}({hex_common.semdict[tag]});\n")
     else:
         ## Generate the call to the helper
         for immlett,bits,immshift in imms:
@@ -528,7 +499,7 @@ def gen_tcg_func(f, tag, regs, imms):
             f.write("    TCGv PC = tcg_constant_tl(ctx->pkt->pc);\n")
         if hex_common.helper_needs_next_PC(tag):
             f.write("    TCGv next_PC = tcg_constant_tl(ctx->next_PC);\n")
-        f.write("    gen_helper_%s(" % (tag))
+        f.write(f"    gen_helper_{tag}(")
         i=0
         ## If there is a scalar result, it is the return type
         for regtype,regid,toss,numregs in regs:
diff --git a/target/hexagon/hex_common.py b/target/hexagon/hex_common.py
index 0200a66cb6..9f9da81e20 100755
--- a/target/hexagon/hex_common.py
+++ b/target/hexagon/hex_common.py
@@ -55,7 +55,7 @@ def expand_macro_attribs(macro,allmac_re):
         for submacro in l:
             if not submacro: continue
             if not macros[submacro]:
-                raise Exception("Couldn't find macro: <%s>" % l)
+                raise Exception(f"Couldn't find macro: <{l}>")
             macro.attribs |= expand_macro_attribs(
                 macros[submacro], allmac_re)
             finished_macros.add(macro.key)
@@ -258,7 +258,7 @@ def is_idef_parser_enabled(tag):
     return tag in idef_parser_enabled
 
 def imm_name(immlett):
-    return "%siV" % immlett
+    return f"{immlett}iV"
 
 def read_semantics_file(name):
     eval_line = ""
-- 
2.25.1


