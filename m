Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F0850BF1A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:58:18 +0200 (CEST)
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxXt-0006Kp-LK
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxI6-0008Mf-5V
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:42:00 -0400
Received: from rev.ng ([5.9.113.41]:58729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1nhxI1-0006AZ-JB
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 13:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HSrYVeOjCSDK+cuzd5PiS2uajC27o6yW1grrSpY8Axc=; b=G14QZOrH4Tb6+S3lsyoBCNVtUc
 oAkm0DKtl+N02povbPWAblEiIIOzByVpd3feYQo2sCnt6xFS4+G2RKbyoM/xmtfED3ukZa7IpFQ4u
 Rst1C5k8PcYCMREWQpBEak8FJVknrQtZ7pQ1jrJ+z21kwj2QmMokDpO9RTMNQJFlHpPQ=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 babush@rev.ng, nizzo@rev.ng, richard.henderson@linaro.org
Subject: [PATCH v9 11/12] target/hexagon: call idef-parser functions
Date: Fri, 22 Apr 2022 19:40:58 +0200
Message-Id: <20220422174059.4304-12-anjo@rev.ng>
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

Extend gen_tcg_funcs.py in order to emit calls to the functions emitted
by the idef-parser, if available. An option is also added to fully
disable the output of the idef-parser, which is useful for debugging
purposes.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 meson_options.txt                   |  3 +
 target/hexagon/gen_helper_funcs.py  | 17 +++++-
 target/hexagon/gen_helper_protos.py | 17 +++++-
 target/hexagon/gen_tcg_funcs.py     | 41 ++++++++++++-
 target/hexagon/hex_common.py        | 10 ++++
 target/hexagon/meson.build          | 92 +++++++++++++++++++----------
 6 files changed, 146 insertions(+), 34 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead4..ae8f53b1fd 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -270,3 +270,6 @@ option('profiler', type: 'boolean', value: false,
        description: 'profiler support')
 option('slirp_smbd', type : 'feature', value : 'auto',
        description: 'use smbd (at path --smbd=*) in slirp networking')
+
+option('hexagon_idef_parser_enabled', type : 'boolean', value : true,
+       description: 'Whether idef-parser should be used to automatically generate TCG code for the Hexagon frontend')
diff --git a/target/hexagon/gen_helper_funcs.py b/target/hexagon/gen_helper_funcs.py
index a446c45384..71d611283a 100755
--- a/target/hexagon/gen_helper_funcs.py
+++ b/target/hexagon/gen_helper_funcs.py
@@ -287,11 +287,24 @@ def main():
     hex_common.read_attribs_file(sys.argv[2])
     hex_common.read_overrides_file(sys.argv[3])
     hex_common.read_overrides_file(sys.argv[4])
+    ## Whether or not idef-parser is enabled is
+    ## determined by the number of arguments to
+    ## this script:
+    ##
+    ##   5 args. -> not enabled,
+    ##   6 args. -> idef-parser enabled.
+    ##
+    ## The 6:th arg. then holds a list of the successfully
+    ## parsed instructions.
+    is_idef_parser_enabled = len(sys.argv) > 6
+    if is_idef_parser_enabled:
+        hex_common.read_idef_parser_enabled_file(sys.argv[5])
     hex_common.calculate_attribs()
     tagregs = hex_common.get_tagregs()
     tagimms = hex_common.get_tagimms()
 
-    with open(sys.argv[5], 'w') as f:
+    output_file = sys.argv[-1]
+    with open(output_file, 'w') as f:
         for tag in hex_common.tags:
             ## Skip the priv instructions
             if ( "A_PRIV" in hex_common.attribdict[tag] ) :
@@ -308,6 +321,8 @@ def main():
                 continue
             if ( hex_common.skip_qemu_helper(tag) ):
                 continue
+            if ( hex_common.is_idef_parser_enabled(tag) ):
+                continue
 
             gen_helper_function(f, tag, tagregs, tagimms)
 
diff --git a/target/hexagon/gen_helper_protos.py b/target/hexagon/gen_helper_protos.py
index 3b4e993fd1..74eff457a6 100755
--- a/target/hexagon/gen_helper_protos.py
+++ b/target/hexagon/gen_helper_protos.py
@@ -136,11 +136,24 @@ def main():
     hex_common.read_attribs_file(sys.argv[2])
     hex_common.read_overrides_file(sys.argv[3])
     hex_common.read_overrides_file(sys.argv[4])
+    ## Whether or not idef-parser is enabled is
+    ## determined by the number of arguments to
+    ## this script:
+    ##
+    ##   5 args. -> not enabled,
+    ##   6 args. -> idef-parser enabled.
+    ##
+    ## The 6:th arg. then holds a list of the successfully
+    ## parsed instructions.
+    is_idef_parser_enabled = len(sys.argv) > 6
+    if is_idef_parser_enabled:
+        hex_common.read_idef_parser_enabled_file(sys.argv[5])
     hex_common.calculate_attribs()
     tagregs = hex_common.get_tagregs()
     tagimms = hex_common.get_tagimms()
 
-    with open(sys.argv[5], 'w') as f:
+    output_file = sys.argv[-1]
+    with open(output_file, 'w') as f:
         for tag in hex_common.tags:
             ## Skip the priv instructions
             if ( "A_PRIV" in hex_common.attribdict[tag] ) :
@@ -158,6 +171,8 @@ def main():
 
             if ( hex_common.skip_qemu_helper(tag) ):
                 continue
+            if ( hex_common.is_idef_parser_enabled(tag) ):
+                continue
 
             gen_helper_prototype(f, tag, tagregs, tagimms)
 
diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index 1fd9de95d5..4d12e192a7 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -610,7 +610,29 @@ def gen_tcg_func(f, tag, regs, imms):
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
@@ -677,12 +699,27 @@ def main():
     hex_common.read_overrides_file(sys.argv[3])
     hex_common.read_overrides_file(sys.argv[4])
     hex_common.calculate_attribs()
+    ## Whether or not idef-parser is enabled is
+    ## determined by the number of arguments to
+    ## this script:
+    ##
+    ##   5 args. -> not enabled,
+    ##   6 args. -> idef-parser enabled.
+    ##
+    ## The 6:th arg. then holds a list of the successfully
+    ## parsed instructions.
+    is_idef_parser_enabled = len(sys.argv) > 6
+    if is_idef_parser_enabled:
+        hex_common.read_idef_parser_enabled_file(sys.argv[5])
     tagregs = hex_common.get_tagregs()
     tagimms = hex_common.get_tagimms()
 
-    with open(sys.argv[5], 'w') as f:
+    output_file = sys.argv[-1]
+    with open(output_file, 'w') as f:
         f.write("#ifndef HEXAGON_TCG_FUNCS_H\n")
         f.write("#define HEXAGON_TCG_FUNCS_H\n\n")
+        if is_idef_parser_enabled:
+            f.write("#include \"idef-generated-emitter.h.inc\"\n\n")
 
         for tag in hex_common.tags:
             ## Skip the priv instructions
diff --git a/target/hexagon/hex_common.py b/target/hexagon/hex_common.py
index c81aca8d2a..901041d557 100755
--- a/target/hexagon/hex_common.py
+++ b/target/hexagon/hex_common.py
@@ -28,6 +28,7 @@
 attribinfo = {}       # Register information and misc
 tags = []             # list of all tags
 overrides = {}        # tags with helper overrides
+idef_parser_enabled = {} # tags enabled for idef-parser
 
 # We should do this as a hash for performance,
 # but to keep order let's keep it as a list.
@@ -216,6 +217,9 @@ def is_tmp_result(tag):
 def is_new_result(tag):
     return ('A_CVI_NEW' in attribdict[tag])
 
+def is_idef_parser_enabled(tag):
+    return tag in idef_parser_enabled
+
 def imm_name(immlett):
     return "%siV" % immlett
 
@@ -247,3 +251,9 @@ def read_overrides_file(name):
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
index bfc74ba441..6adf7e2464 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -43,10 +43,7 @@ hexagon_ss.add(semantics_generated)
 # Step 2
 # We use Python scripts to generate the following files
 #     shortcode_generated.h.inc
-#     helper_protos_generated.h.inc
-#     tcg_funcs_generated.c.inc
 #     tcg_func_table_generated.c.inc
-#     helper_funcs_generated.c.inc
 #     printinsn_generated.h.inc
 #     op_regs_generated.h.inc
 #     op_attribs_generated.h.inc
@@ -61,24 +58,6 @@ shortcode_generated = custom_target(
 )
 hexagon_ss.add(shortcode_generated)
 
-helper_protos_generated = custom_target(
-    'helper_protos_generated.h.inc',
-    output: 'helper_protos_generated.h.inc',
-    depends: [semantics_generated],
-    depend_files: [hex_common_py, attribs_def, gen_tcg_h, gen_tcg_hvx_h],
-    command: [python, files('gen_helper_protos.py'), semantics_generated, attribs_def, gen_tcg_h, gen_tcg_hvx_h, '@OUTPUT@'],
-)
-hexagon_ss.add(helper_protos_generated)
-
-tcg_funcs_generated = custom_target(
-    'tcg_funcs_generated.c.inc',
-    output: 'tcg_funcs_generated.c.inc',
-    depends: [semantics_generated],
-    depend_files: [hex_common_py, attribs_def, gen_tcg_h, gen_tcg_hvx_h],
-    command: [python, files('gen_tcg_funcs.py'), semantics_generated, attribs_def, gen_tcg_h, gen_tcg_hvx_h, '@OUTPUT@'],
-)
-hexagon_ss.add(tcg_funcs_generated)
-
 tcg_func_table_generated = custom_target(
     'tcg_func_table_generated.c.inc',
     output: 'tcg_func_table_generated.c.inc',
@@ -88,15 +67,6 @@ tcg_func_table_generated = custom_target(
 )
 hexagon_ss.add(tcg_func_table_generated)
 
-helper_funcs_generated = custom_target(
-    'helper_funcs_generated.c.inc',
-    output: 'helper_funcs_generated.c.inc',
-    depends: [semantics_generated],
-    depend_files: [hex_common_py, attribs_def, gen_tcg_h, gen_tcg_hvx_h],
-    command: [python, files('gen_helper_funcs.py'), semantics_generated, attribs_def, gen_tcg_h, gen_tcg_hvx_h, '@OUTPUT@'],
-)
-hexagon_ss.add(helper_funcs_generated)
-
 printinsn_generated = custom_target(
     'printinsn_generated.h.inc',
     output: 'printinsn_generated.h.inc',
@@ -180,6 +150,8 @@ hexagon_ss.add(files(
     'mmvec/system_ext_mmvec.c',
 ))
 
+idef_parser_enabled = get_option('hexagon_idef_parser_enabled')
+
 idef_parser_input_generated = custom_target(
     'idef_parser_input.h.inc',
     output: 'idef_parser_input.h.inc',
@@ -225,4 +197,64 @@ idef_generated_tcg = custom_target(
     command: [idef_parser, '@INPUT@', '@OUTPUT0@', '@OUTPUT1@', '@OUTPUT2@'],
 )
 
+indent = find_program('indent', required: false)
+if indent.found()
+  idef_generated_tcg_c = custom_target('asd',
+                                       input: idef_generated_tcg[0],
+                                       output: 'idef-generated-emitter.indented.c',
+                                       command: [indent, '-linux', '@INPUT@', '-o', '@OUTPUT@'])
+else
+  idef_generated_tcg_c = custom_target('asd',
+                                       input: idef_generated_tcg[0],
+                                       output: 'idef-generated-emitter.indented.c',
+                                       command: ['cp', '@INPUT@', '@OUTPUT@'])
+endif
+
+idef_generated_list = idef_generated_tcg[2].full_path()
+
+hexagon_ss.add(idef_generated_tcg_c)
+
+#
+# Step 5
+# We use Python scripts to generate the following files
+#     helper_protos_generated.h.inc
+#     helper_funcs_generated.c.inc
+#     tcg_funcs_generated.c.inc
+#
+if idef_parser_enabled
+  helper_dep = [semantics_generated, idef_generated_tcg_c, idef_generated_tcg]
+  helper_in = [semantics_generated, attribs_def, gen_tcg_h, gen_tcg_hvx_h,
+               idef_generated_list]
+else
+  helper_dep = [semantics_generated]
+  helper_in = [semantics_generated, attribs_def, gen_tcg_h, gen_tcg_hvx_h]
+endif
+
+helper_protos_generated = custom_target(
+    'helper_protos_generated.h.inc',
+    output: 'helper_protos_generated.h.inc',
+    depends: helper_dep,
+    depend_files: [hex_common_py, attribs_def, gen_tcg_h, gen_tcg_hvx_h],
+    command: [python, files('gen_helper_protos.py'), helper_in, '@OUTPUT@'],
+)
+hexagon_ss.add(helper_protos_generated)
+
+helper_funcs_generated = custom_target(
+    'helper_funcs_generated.c.inc',
+    output: 'helper_funcs_generated.c.inc',
+    depends: helper_dep,
+    depend_files: [hex_common_py, attribs_def, gen_tcg_h, gen_tcg_hvx_h],
+    command: [python, files('gen_helper_funcs.py'), helper_in, '@OUTPUT@'],
+)
+hexagon_ss.add(helper_funcs_generated)
+
+tcg_funcs_generated = custom_target(
+    'tcg_funcs_generated.c.inc',
+    output: 'tcg_funcs_generated.c.inc',
+    depends: helper_dep,
+    depend_files: [hex_common_py, attribs_def, gen_tcg_h, gen_tcg_hvx_h],
+    command: [python, files('gen_tcg_funcs.py'), helper_in, '@OUTPUT@'],
+)
+hexagon_ss.add(tcg_funcs_generated)
+
 target_arch += {'hexagon': hexagon_ss}
-- 
2.35.1


