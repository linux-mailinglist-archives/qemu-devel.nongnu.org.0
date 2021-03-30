Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F034EB03
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:50:32 +0200 (CEST)
Received: from localhost ([::1]:56168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFhP-0000RL-0j
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lRFVk-00039y-NX
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:28 -0400
Received: from rev.ng ([5.9.113.41]:48431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lRFVe-0004xC-71
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QA7pKJPo5gsYV4WzI+RKKPhDfhbkegEXiBWbsgpnV1o=; b=fbFTj/Abts1h/AwiwUTh1+QmrU
 i6y8CgU68vmKTaDntwE2XuQLv3nq/WwOcw2zdA8XEeqpVDwiT02QzNvvrd3iKQ9eTVPDs57KJAJxQ
 IqtfaWgnk/1Z9LLiSed9tCOOZZgbjCz0m3DEo1qnq1/pl61s3KQhhno3KAOhVLfYVuP8=;
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com, bcain@quicinc.com, babush@rev.ng, nizzo@rev.ng,
 philmd@redhat.com, richard.henderson@linaro.org,
 Alessandro Di Federico <ale@rev.ng>
Subject: [PATCH v3 11/12] target/hexagon: call idef-parser functions
Date: Tue, 30 Mar 2021 16:37:49 +0200
Message-Id: <20210330143750.3037824-12-ale.qemu@rev.ng>
In-Reply-To: <20210330143750.3037824-1-ale.qemu@rev.ng>
References: <20210330143750.3037824-1-ale.qemu@rev.ng>
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

Extend gen_tcg_funcs.py in order to emit calls to the functions emitted
by the idef-parser, if available.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
---
 target/hexagon/gen_tcg_funcs.py | 28 ++++++++++++++++++++++++++--
 target/hexagon/hex_common.py    | 10 ++++++++++
 target/hexagon/meson.build      | 24 ++++++++++++++----------
 3 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index db9f663a77..5980dab8ee 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -394,7 +394,29 @@ def gen_tcg_func(f, tag, regs, imms):
         if (hex_common.is_read(regid)):
             genptr_src_read_opn(f,regtype,regid,tag)
 
-    if ( hex_common.skip_qemu_helper(tag) ):
+    if hex_common.is_idef_parser_enabled(tag):
+        declared = []
+        ## Handle registers
+        for regtype,regid,toss,numregs in regs:
+            if (hex_common.is_pair(regid)
+                or (hex_common.is_single(regid)
+                    and hex_common.is_old_val(regtype, regid, tag))):
+                declared.append("%s%sV" % (regtype, regid))
+                if regtype == "M":
+                    declared.append("%s%sN" % (regtype, regid))
+            elif hex_common.is_new_val(regtype, regid, tag):
+                declared.append("%s%sN" % (regtype,regid))
+            else:
+                print("Bad register parse: ",regtype,regid,toss,numregs)
+
+        ## Handle immediates
+        for immlett,bits,immshift in imms:
+            declared.append(hex_common.imm_name(immlett))
+
+        arguments = ", ".join(["ctx", "insn", "pkt"] + declared)
+        f.write("    emit_%s(%s);\n" % (tag, arguments))
+
+    elif ( hex_common.skip_qemu_helper(tag) ):
         f.write("    fGEN_TCG_%s(%s);\n" % (tag, hex_common.semdict[tag]))
     else:
         ## Generate the call to the helper
@@ -455,12 +477,14 @@ def main():
     hex_common.read_attribs_file(sys.argv[2])
     hex_common.read_overrides_file(sys.argv[3])
     hex_common.calculate_attribs()
+    hex_common.read_idef_parser_enabled_file(sys.argv[4])
     tagregs = hex_common.get_tagregs()
     tagimms = hex_common.get_tagimms()
 
-    with open(sys.argv[4], 'w') as f:
+    with open(sys.argv[5], 'w') as f:
         f.write("#ifndef HEXAGON_TCG_FUNCS_H\n")
         f.write("#define HEXAGON_TCG_FUNCS_H\n\n")
+        f.write("#include \"idef-generated-emitter.h.inc\"\n\n")
 
         for tag in hex_common.tags:
             ## Skip the priv instructions
diff --git a/target/hexagon/hex_common.py b/target/hexagon/hex_common.py
index b3b534057d..648ad29e94 100755
--- a/target/hexagon/hex_common.py
+++ b/target/hexagon/hex_common.py
@@ -28,6 +28,7 @@
 attribinfo = {}       # Register information and misc
 tags = []             # list of all tags
 overrides = {}        # tags with helper overrides
+idef_parser_enabled = {} # tags enabled for idef-parser
 
 # We should do this as a hash for performance,
 # but to keep order let's keep it as a list.
@@ -201,6 +202,9 @@ def need_ea(tag):
 def skip_qemu_helper(tag):
     return tag in overrides.keys()
 
+def is_idef_parser_enabled(tag):
+    return tag in idef_parser_enabled
+
 def imm_name(immlett):
     return "%siV" % immlett
 
@@ -232,3 +236,9 @@ def read_overrides_file(name):
             continue
         tag = overridere.findall(line)[0]
         overrides[tag] = True
+
+def read_idef_parser_enabled_file(name):
+    global idef_parser_enabled
+    with open(name, "r") as idef_parser_enabled_file:
+        lines = idef_parser_enabled_file.read().strip().split("\n")
+        idef_parser_enabled = set(lines)
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 2b7d6c8c62..6adfe0468d 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -72,16 +72,6 @@ helper_protos_generated = custom_target(
 )
 hexagon_ss.add(helper_protos_generated)
 
-tcg_funcs_generated = custom_target(
-    'tcg_funcs_generated.c.inc',
-    output: 'tcg_funcs_generated.c.inc',
-    input: 'gen_tcg_funcs.py',
-    depends: [semantics_generated],
-    depend_files: [hex_common_py, attribs_def, gen_tcg_h],
-    command: [python, '@INPUT@', semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
-)
-hexagon_ss.add(tcg_funcs_generated)
-
 tcg_func_table_generated = custom_target(
     'tcg_func_table_generated.c.inc',
     output: 'tcg_func_table_generated.c.inc',
@@ -234,4 +224,18 @@ idef_generated_tcg = custom_target(
     command: [idef_parser, '@INPUT@', '@OUTPUT0@', '@OUTPUT1@', '@OUTPUT2@'],
 )
 
+idef_generated_list = idef_generated_tcg[2].full_path()
+
+hexagon_ss.add(idef_generated_tcg)
+
+tcg_funcs_generated = custom_target(
+    'tcg_funcs_generated.c.inc',
+    output: 'tcg_funcs_generated.c.inc',
+    input: 'gen_tcg_funcs.py',
+    depends: [semantics_generated, idef_generated_tcg],
+    depend_files: [hex_common_py, attribs_def, gen_tcg_h],
+    command: [python, '@INPUT@', semantics_generated, attribs_def, gen_tcg_h, idef_generated_list, '@OUTPUT@'],
+)
+hexagon_ss.add(tcg_funcs_generated)
+
 target_arch += {'hexagon': hexagon_ss}
-- 
2.31.1


