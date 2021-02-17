Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CC831E346
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:54:19 +0100 (CET)
Received: from localhost ([::1]:42574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWeA-0006YH-9K
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRk-000169-Cb
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:28 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRe-0004l5-9C
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:27 -0500
Received: by mail-pg1-x529.google.com with SMTP id o38so9502906pgm.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BZYHnTZFbPkFROK+gKOOuSU33WSqb/WO2X72YmtxBd8=;
 b=tl53032UkocvwEM9iAfmWd/h3z1Hw+l9hIlt2WCqpwqtmpHRJf3WseCPpO0xR1kA7z
 1nGbdaELi2fF69BXA1OPVqRw1REz1rEQyPrDsupu+Oe6+AL0qpNPIZf6QIVFvDTEscpp
 oUjTQIvPEyCHXH1d9o6c2ShDp8klulkPF5TpuBBtVo+VhEY3Pluo3K6briMI7e+Qnh2j
 HgB+30M5f8l1BfRHi1KZieJKLhRk/juoII8TW4OWYr1XhsbcefBPQCq4SFODvWPla2PZ
 6ofYvVAXHv9oBvUXBcLzZFX0g1j8P1VYtOOvJ30dgTg9zWQpS7FyG+Z/q7b5lJtkzJGh
 CdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZYHnTZFbPkFROK+gKOOuSU33WSqb/WO2X72YmtxBd8=;
 b=txaM6j95dSTTbGLVQ5IsH05KiC1Vcd+tcduT2eI60ZpJ6ais9Z4gbIGrj6U120OG/g
 zXnYfTAocMz8VDsAMp/Y+FS0uyz/A9I0ZUTC9bG/osAbL1q90QkJpWTPzhyIx0Hlvmzz
 CpJmLHNWDmZJEg5wh04YutyUMNg8mJrXZEmNZkCicXd+dxA8kNkWiwqAU8WbE/lE/GdX
 httiS8S7KzMvF7fgSe9wOJI4aWCR71ZAHqgZ2YE1CoCD9yE29dk14iUT9UyUtxyfe8Fh
 jnKJgnJD8sxG3T0vOooZgpN6iz3gYXnpAdUFthY0XFP3SJ/KBPBxLYhT8Jg1geNk2lPq
 N6cg==
X-Gm-Message-State: AOAM533d5S0BSdaHzzGZ/hQCO9FVaQyp8OPDtuU1A5Y2K4fwd4OO7Sc+
 54bzhwGbphnplLz4+Rgq1MdyZBgXZ/N2UA==
X-Google-Smtp-Source: ABdhPJwIAnzm69oK6uTEOqTAKdjrMh0BUbBEwE+6eT6SEeV7+7heLQ8XqddIyiF2/1+4geqRkPFF+A==
X-Received: by 2002:a62:ee09:0:b029:1c0:ba8c:fcea with SMTP id
 e9-20020a62ee090000b02901c0ba8cfceamr1529966pfi.7.1613605280176; 
 Wed, 17 Feb 2021 15:41:20 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/35] Hexagon (target/hexagon) generator phase 2 - generate
 header files
Date: Wed, 17 Feb 2021 15:40:09 -0800
Message-Id: <20210217234023.1742406-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Python scripts generate the following files
    helper_protos_generated.h.inc
        For each instruction we create DEF_HELPER function prototype
    helper_funcs_generated.c.inc
        For each instruction we create the helper function definition
    tcg_funcs_generated.c.inc
        For each instruction we create TCG code to generate call to helper
    tcg_func_table_generated.c.inc
        Table of function pointers indexed by opcode
    shortcode_generated.h.inc
        Generate a table of instruction "shortcode" semantics
    opcodes_def_generated.h.inc
        Gives a list of all the opcodes
    op_attribs_generated.h.inc
        Lists all the attributes associated with each instruction
    op_regs_generated.h.inc
        Lists the register and immediate operands for each instruction
    printinsn_generated.h.inc
        Data for printing (disassembling) each instruction (format
        string + operands)

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-21-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_helper_funcs.py   | 220 ++++++++++++
 target/hexagon/gen_helper_protos.py  | 150 +++++++++
 target/hexagon/gen_op_attribs.py     |  39 +++
 target/hexagon/gen_op_regs.py        | 110 ++++++
 target/hexagon/gen_opcodes_def.py    |  36 ++
 target/hexagon/gen_printinsn.py      | 173 ++++++++++
 target/hexagon/gen_shortcode.py      |  60 ++++
 target/hexagon/gen_tcg_func_table.py |  58 ++++
 target/hexagon/gen_tcg_funcs.py      | 485 +++++++++++++++++++++++++++
 target/hexagon/hex_common.py         | 234 +++++++++++++
 10 files changed, 1565 insertions(+)
 create mode 100755 target/hexagon/gen_helper_funcs.py
 create mode 100755 target/hexagon/gen_helper_protos.py
 create mode 100755 target/hexagon/gen_op_attribs.py
 create mode 100755 target/hexagon/gen_op_regs.py
 create mode 100755 target/hexagon/gen_opcodes_def.py
 create mode 100755 target/hexagon/gen_printinsn.py
 create mode 100755 target/hexagon/gen_shortcode.py
 create mode 100755 target/hexagon/gen_tcg_func_table.py
 create mode 100755 target/hexagon/gen_tcg_funcs.py
 create mode 100755 target/hexagon/hex_common.py

diff --git a/target/hexagon/gen_helper_funcs.py b/target/hexagon/gen_helper_funcs.py
new file mode 100755
index 0000000000..2b1c5d8e3e
--- /dev/null
+++ b/target/hexagon/gen_helper_funcs.py
@@ -0,0 +1,220 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+import hex_common
+
+##
+## Helpers for gen_helper_function
+##
+def gen_decl_ea(f):
+    f.write("    uint32_t EA;\n")
+
+def gen_helper_return_type(f,regtype,regid,regno):
+    if regno > 1 : f.write(", ")
+    f.write("int32_t")
+
+def gen_helper_return_type_pair(f,regtype,regid,regno):
+    if regno > 1 : f.write(", ")
+    f.write("int64_t")
+
+def gen_helper_arg(f,regtype,regid,regno):
+    if regno > 0 : f.write(", " )
+    f.write("int32_t %s%sV" % (regtype,regid))
+
+def gen_helper_arg_new(f,regtype,regid,regno):
+    if regno >= 0 : f.write(", " )
+    f.write("int32_t %s%sN" % (regtype,regid))
+
+def gen_helper_arg_pair(f,regtype,regid,regno):
+    if regno >= 0 : f.write(", ")
+    f.write("int64_t %s%sV" % (regtype,regid))
+
+def gen_helper_arg_opn(f,regtype,regid,i,tag):
+    if (hex_common.is_pair(regid)):
+        gen_helper_arg_pair(f,regtype,regid,i)
+    elif (hex_common.is_single(regid)):
+        if hex_common.is_old_val(regtype, regid, tag):
+            gen_helper_arg(f,regtype,regid,i)
+        elif hex_common.is_new_val(regtype, regid, tag):
+            gen_helper_arg_new(f,regtype,regid,i)
+        else:
+            print("Bad register parse: ",regtype,regid,toss,numregs)
+    else:
+        print("Bad register parse: ",regtype,regid,toss,numregs)
+
+def gen_helper_arg_imm(f,immlett):
+    f.write(", int32_t %s" % (hex_common.imm_name(immlett)))
+
+def gen_helper_dest_decl(f,regtype,regid,regno,subfield=""):
+    f.write("    int32_t %s%sV%s = 0;\n" % \
+        (regtype,regid,subfield))
+
+def gen_helper_dest_decl_pair(f,regtype,regid,regno,subfield=""):
+    f.write("    int64_t %s%sV%s = 0;\n" % \
+        (regtype,regid,subfield))
+
+def gen_helper_dest_decl_opn(f,regtype,regid,i):
+    if (hex_common.is_pair(regid)):
+        gen_helper_dest_decl_pair(f,regtype,regid,i)
+    elif (hex_common.is_single(regid)):
+        gen_helper_dest_decl(f,regtype,regid,i)
+    else:
+        print("Bad register parse: ",regtype,regid,toss,numregs)
+
+def gen_helper_return(f,regtype,regid,regno):
+    f.write("    return %s%sV;\n" % (regtype,regid))
+
+def gen_helper_return_pair(f,regtype,regid,regno):
+    f.write("    return %s%sV;\n" % (regtype,regid))
+
+def gen_helper_return_opn(f, regtype, regid, i):
+    if (hex_common.is_pair(regid)):
+        gen_helper_return_pair(f,regtype,regid,i)
+    elif (hex_common.is_single(regid)):
+        gen_helper_return(f,regtype,regid,i)
+    else:
+        print("Bad register parse: ",regtype,regid,toss,numregs)
+
+##
+## Generate the TCG code to call the helper
+##     For A2_add: Rd32=add(Rs32,Rt32), { RdV=RsV+RtV;}
+##     We produce:
+##       int32_t HELPER(A2_add)(CPUHexagonState *env, int32_t RsV, int32_t RtV)
+##       {
+##           uint32_t slot __attribute__(unused)) = 4;
+##           int32_t RdV = 0;
+##           { RdV=RsV+RtV;}
+##           COUNT_HELPER(A2_add);
+##           return RdV;
+##       }
+##
+def gen_helper_function(f, tag, tagregs, tagimms):
+    regs = tagregs[tag]
+    imms = tagimms[tag]
+
+    numresults = 0
+    numscalarresults = 0
+    numscalarreadwrite = 0
+    for regtype,regid,toss,numregs in regs:
+        if (hex_common.is_written(regid)):
+            numresults += 1
+            if (hex_common.is_scalar_reg(regtype)):
+                numscalarresults += 1
+        if (hex_common.is_readwrite(regid)):
+            if (hex_common.is_scalar_reg(regtype)):
+                numscalarreadwrite += 1
+
+    if (numscalarresults > 1):
+        ## The helper is bogus when there is more than one result
+        f.write("void HELPER(%s)(CPUHexagonState *env) { BOGUS_HELPER(%s); }\n"
+                % (tag, tag))
+    else:
+        ## The return type of the function is the type of the destination
+        ## register
+        i=0
+        for regtype,regid,toss,numregs in regs:
+            if (hex_common.is_written(regid)):
+                if (hex_common.is_pair(regid)):
+                    gen_helper_return_type_pair(f,regtype,regid,i)
+                elif (hex_common.is_single(regid)):
+                    gen_helper_return_type(f,regtype,regid,i)
+                else:
+                    print("Bad register parse: ",regtype,regid,toss,numregs)
+            i += 1
+
+        if (numscalarresults == 0):
+            f.write("void")
+        f.write(" HELPER(%s)(CPUHexagonState *env" % tag)
+
+        i = 1
+
+        ## Arguments to the helper function are the source regs and immediates
+        for regtype,regid,toss,numregs in regs:
+            if (hex_common.is_read(regid)):
+                gen_helper_arg_opn(f,regtype,regid,i,tag)
+                i += 1
+        for immlett,bits,immshift in imms:
+            gen_helper_arg_imm(f,immlett)
+            i += 1
+        if hex_common.need_slot(tag):
+            if i > 0: f.write(", ")
+            f.write("uint32_t slot")
+            i += 1
+        if hex_common.need_part1(tag):
+            if i > 0: f.write(", ")
+            f.write("uint32_t part1")
+        f.write(")\n{\n")
+        if (not hex_common.need_slot(tag)):
+            f.write("    uint32_t slot __attribute__((unused)) = 4;\n" )
+        if hex_common.need_ea(tag): gen_decl_ea(f)
+        ## Declare the return variable
+        i=0
+        for regtype,regid,toss,numregs in regs:
+            if (hex_common.is_writeonly(regid)):
+                gen_helper_dest_decl_opn(f,regtype,regid,i)
+            i += 1
+
+        if 'A_FPOP' in hex_common.attribdict[tag]:
+            f.write('    arch_fpop_start(env);\n');
+
+        f.write("    %s\n" % hex_common.semdict[tag])
+
+        if 'A_FPOP' in hex_common.attribdict[tag]:
+            f.write('    arch_fpop_end(env);\n');
+
+        ## Save/return the return variable
+        for regtype,regid,toss,numregs in regs:
+            if (hex_common.is_written(regid)):
+                gen_helper_return_opn(f, regtype, regid, i)
+        f.write("}\n\n")
+        ## End of the helper definition
+
+def main():
+    hex_common.read_semantics_file(sys.argv[1])
+    hex_common.read_attribs_file(sys.argv[2])
+    hex_common.read_overrides_file(sys.argv[3])
+    hex_common.calculate_attribs()
+    tagregs = hex_common.get_tagregs()
+    tagimms = hex_common.get_tagimms()
+
+    with open(sys.argv[4], 'w') as f:
+        for tag in hex_common.tags:
+            ## Skip the priv instructions
+            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the guest instructions
+            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the diag instructions
+            if ( tag == "Y6_diag" ) :
+                continue
+            if ( tag == "Y6_diag0" ) :
+                continue
+            if ( tag == "Y6_diag1" ) :
+                continue
+            if ( hex_common.skip_qemu_helper(tag) ):
+                continue
+
+            gen_helper_function(f, tag, tagregs, tagimms)
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/gen_helper_protos.py b/target/hexagon/gen_helper_protos.py
new file mode 100755
index 0000000000..ea41007ec9
--- /dev/null
+++ b/target/hexagon/gen_helper_protos.py
@@ -0,0 +1,150 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+import hex_common
+
+##
+## Helpers for gen_helper_prototype
+##
+def_helper_types = {
+    'N' : 's32',
+    'O' : 's32',
+    'P' : 's32',
+    'M' : 's32',
+    'C' : 's32',
+    'R' : 's32',
+    'V' : 'ptr',
+    'Q' : 'ptr'
+}
+
+def_helper_types_pair = {
+    'R' : 's64',
+    'C' : 's64',
+    'S' : 's64',
+    'G' : 's64',
+    'V' : 'ptr',
+    'Q' : 'ptr'
+}
+
+def gen_def_helper_opn(f, tag, regtype, regid, toss, numregs, i):
+    if (hex_common.is_pair(regid)):
+        f.write(", %s" % (def_helper_types_pair[regtype]))
+    elif (hex_common.is_single(regid)):
+        f.write(", %s" % (def_helper_types[regtype]))
+    else:
+        print("Bad register parse: ",regtype,regid,toss,numregs)
+
+##
+## Generate the DEF_HELPER prototype for an instruction
+##     For A2_add: Rd32=add(Rs32,Rt32)
+##     We produce:
+##         DEF_HELPER_3(A2_add, s32, env, s32, s32)
+##
+def gen_helper_prototype(f, tag, tagregs, tagimms):
+    regs = tagregs[tag]
+    imms = tagimms[tag]
+
+    numresults = 0
+    numscalarresults = 0
+    numscalarreadwrite = 0
+    for regtype,regid,toss,numregs in regs:
+        if (hex_common.is_written(regid)):
+            numresults += 1
+            if (hex_common.is_scalar_reg(regtype)):
+                numscalarresults += 1
+        if (hex_common.is_readwrite(regid)):
+            if (hex_common.is_scalar_reg(regtype)):
+                numscalarreadwrite += 1
+
+    if (numscalarresults > 1):
+        ## The helper is bogus when there is more than one result
+        f.write('DEF_HELPER_1(%s, void, env)\n' % tag)
+    else:
+        ## Figure out how many arguments the helper will take
+        if (numscalarresults == 0):
+            def_helper_size = len(regs)+len(imms)+numscalarreadwrite+1
+            if hex_common.need_part1(tag): def_helper_size += 1
+            if hex_common.need_slot(tag): def_helper_size += 1
+            f.write('DEF_HELPER_%s(%s' % (def_helper_size, tag))
+            ## The return type is void
+            f.write(', void' )
+        else:
+            def_helper_size = len(regs)+len(imms)+numscalarreadwrite
+            if hex_common.need_part1(tag): def_helper_size += 1
+            if hex_common.need_slot(tag): def_helper_size += 1
+            f.write('DEF_HELPER_%s(%s' % (def_helper_size, tag))
+
+        ## Generate the qemu DEF_HELPER type for each result
+        i=0
+        for regtype,regid,toss,numregs in regs:
+            if (hex_common.is_written(regid)):
+                gen_def_helper_opn(f, tag, regtype, regid, toss, numregs, i)
+                i += 1
+
+        ## Put the env between the outputs and inputs
+        f.write(', env' )
+        i += 1
+
+        ## Generate the qemu type for each input operand (regs and immediates)
+        for regtype,regid,toss,numregs in regs:
+            if (hex_common.is_read(regid)):
+                gen_def_helper_opn(f, tag, regtype, regid, toss, numregs, i)
+                i += 1
+        for immlett,bits,immshift in imms:
+            f.write(", s32")
+
+        ## Add the arguments for the instruction slot and part1 (if needed)
+        if hex_common.need_slot(tag): f.write(', i32' )
+        if hex_common.need_part1(tag): f.write(' , i32' )
+        f.write(')\n')
+
+def main():
+    hex_common.read_semantics_file(sys.argv[1])
+    hex_common.read_attribs_file(sys.argv[2])
+    hex_common.read_overrides_file(sys.argv[3])
+    hex_common.calculate_attribs()
+    tagregs = hex_common.get_tagregs()
+    tagimms = hex_common.get_tagimms()
+
+    with open(sys.argv[4], 'w') as f:
+        for tag in hex_common.tags:
+            ## Skip the priv instructions
+            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the guest instructions
+            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the diag instructions
+            if ( tag == "Y6_diag" ) :
+                continue
+            if ( tag == "Y6_diag0" ) :
+                continue
+            if ( tag == "Y6_diag1" ) :
+                continue
+
+            if ( hex_common.skip_qemu_helper(tag) ):
+                continue
+
+            gen_helper_prototype(f, tag, tagregs, tagimms)
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/gen_op_attribs.py b/target/hexagon/gen_op_attribs.py
new file mode 100755
index 0000000000..6a1a1ca21d
--- /dev/null
+++ b/target/hexagon/gen_op_attribs.py
@@ -0,0 +1,39 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+import hex_common
+
+def main():
+    hex_common.read_semantics_file(sys.argv[1])
+    hex_common.read_attribs_file(sys.argv[2])
+    hex_common.calculate_attribs()
+
+    ##
+    ##     Generate all the attributes associated with each instruction
+    ##
+    with open(sys.argv[3], 'w') as f:
+        for tag in hex_common.tags:
+            f.write('OP_ATTRIB(%s,ATTRIBS(%s))\n' % \
+                (tag, ','.join(sorted(hex_common.attribdict[tag]))))
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/gen_op_regs.py b/target/hexagon/gen_op_regs.py
new file mode 100755
index 0000000000..e8137d4a12
--- /dev/null
+++ b/target/hexagon/gen_op_regs.py
@@ -0,0 +1,110 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+import hex_common
+
+##
+##     Generate the register and immediate operands for each instruction
+##
+def calculate_regid_reg(tag):
+    def letter_inc(x): return chr(ord(x)+1)
+    ordered_implregs = [ 'SP','FP','LR' ]
+    srcdst_lett = 'X'
+    src_lett = 'S'
+    dst_lett = 'D'
+    retstr = ""
+    mapdict = {}
+    for reg in ordered_implregs:
+        reg_rd = 0
+        reg_wr = 0
+        if ('A_IMPLICIT_WRITES_'+reg) in hex_common.attribdict[tag]: reg_wr = 1
+        if reg_rd and reg_wr:
+            retstr += srcdst_lett
+            mapdict[srcdst_lett] = reg
+            srcdst_lett = letter_inc(srcdst_lett)
+        elif reg_rd:
+            retstr += src_lett
+            mapdict[src_lett] = reg
+            src_lett = letter_inc(src_lett)
+        elif reg_wr:
+            retstr += dst_lett
+            mapdict[dst_lett] = reg
+            dst_lett = letter_inc(dst_lett)
+    return retstr,mapdict
+
+def calculate_regid_letters(tag):
+    retstr,mapdict = calculate_regid_reg(tag)
+    return retstr
+
+def strip_reg_prefix(x):
+    y=x.replace('UREG.','')
+    y=y.replace('MREG.','')
+    return y.replace('GREG.','')
+
+def main():
+    hex_common.read_semantics_file(sys.argv[1])
+    hex_common.read_attribs_file(sys.argv[2])
+    tagregs = hex_common.get_tagregs()
+    tagimms = hex_common.get_tagimms()
+
+    with open(sys.argv[3], 'w') as f:
+        for tag in hex_common.tags:
+            regs = tagregs[tag]
+            rregs = []
+            wregs = []
+            regids = ""
+            for regtype,regid,toss,numregs in regs:
+                if hex_common.is_read(regid):
+                    if regid[0] not in regids: regids += regid[0]
+                    rregs.append(regtype+regid+numregs)
+                if hex_common.is_written(regid):
+                    wregs.append(regtype+regid+numregs)
+                    if regid[0] not in regids: regids += regid[0]
+            for attrib in hex_common.attribdict[tag]:
+                if hex_common.attribinfo[attrib]['rreg']:
+                    rregs.append(strip_reg_prefix(attribinfo[attrib]['rreg']))
+                if hex_common.attribinfo[attrib]['wreg']:
+                    wregs.append(strip_reg_prefix(attribinfo[attrib]['wreg']))
+            regids += calculate_regid_letters(tag)
+            f.write('REGINFO(%s,"%s",\t/*RD:*/\t"%s",\t/*WR:*/\t"%s")\n' % \
+                (tag,regids,",".join(rregs),",".join(wregs)))
+
+        for tag in hex_common.tags:
+            imms = tagimms[tag]
+            f.write( 'IMMINFO(%s' % tag)
+            if not imms:
+                f.write(''','u',0,0,'U',0,0''')
+            for sign,size,shamt in imms:
+                if sign == 'r': sign = 's'
+                if not shamt:
+                    shamt = "0"
+                f.write(''','%s',%s,%s''' % (sign,size,shamt))
+            if len(imms) == 1:
+                if sign.isupper():
+                    myu = 'u'
+                else:
+                    myu = 'U'
+                f.write(''','%s',0,0''' % myu)
+            f.write(')\n')
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/gen_opcodes_def.py b/target/hexagon/gen_opcodes_def.py
new file mode 100755
index 0000000000..fa604a8db9
--- /dev/null
+++ b/target/hexagon/gen_opcodes_def.py
@@ -0,0 +1,36 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+import hex_common
+
+def main():
+    hex_common.read_semantics_file(sys.argv[1])
+
+    ##
+    ##     Generate a list of all the opcodes
+    ##
+    with open(sys.argv[3], 'w') as f:
+        for tag in hex_common.tags:
+            f.write ( "OPCODE(%s),\n" % (tag) )
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/gen_printinsn.py b/target/hexagon/gen_printinsn.py
new file mode 100755
index 0000000000..12737bf8a0
--- /dev/null
+++ b/target/hexagon/gen_printinsn.py
@@ -0,0 +1,173 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+import hex_common
+
+##
+##     Generate data for printing each instruction (format string + operands)
+##
+def regprinter(m):
+    str = m.group(1)
+    str += ":".join(["%d"]*len(m.group(2)))
+    str += m.group(3)
+    if ('S' in m.group(1)) and (len(m.group(2)) == 1):
+        str += "/%s"
+    elif ('C' in m.group(1)) and (len(m.group(2)) == 1):
+        str += "/%s"
+    return str
+
+def spacify(s):
+    # Regular expression that matches any operator that contains '=' character:
+    opswithequal_re = '[-+^&|!<>=]?='
+    # Regular expression that matches any assignment operator.
+    assignment_re = '[-+^&|]?='
+
+    # Out of the operators that contain the = sign, if the operator is also an
+    # assignment, spaces will be added around it, unless it's enclosed within
+    # parentheses, or spaces are already present.
+
+    equals = re.compile(opswithequal_re)
+    assign = re.compile(assignment_re)
+
+    slen = len(s)
+    paren_count = {}
+    i = 0
+    pc = 0
+    while i < slen:
+        c = s[i]
+        if c == '(':
+            pc += 1
+        elif c == ')':
+            pc -= 1
+        paren_count[i] = pc
+        i += 1
+
+    # Iterate over all operators that contain the equal sign. If any
+    # match is also an assignment operator, add spaces around it if
+    # the parenthesis count is 0.
+    pos = 0
+    out = []
+    for m in equals.finditer(s):
+        ms = m.start()
+        me = m.end()
+        # t is the string that matched opswithequal_re.
+        t = m.string[ms:me]
+        out += s[pos:ms]
+        pos = me
+        if paren_count[ms] == 0:
+            # Check if the entire string t is an assignment.
+            am = assign.match(t)
+            if am and len(am.group(0)) == me-ms:
+                # Don't add spaces if they are already there.
+                if ms > 0 and s[ms-1] != ' ':
+                    out.append(' ')
+                out += t
+                if me < slen and s[me] != ' ':
+                    out.append(' ')
+                continue
+        # If this is not an assignment, just append it to the output
+        # string.
+        out += t
+
+    # Append the remaining part of the string.
+    out += s[pos:len(s)]
+    return ''.join(out)
+
+def main():
+    hex_common.read_semantics_file(sys.argv[1])
+    hex_common.read_attribs_file(sys.argv[2])
+
+    immext_casere = re.compile(r'IMMEXT\(([A-Za-z])')
+
+    with open(sys.argv[3], 'w') as f:
+        for tag in hex_common.tags:
+            if not hex_common.behdict[tag]: continue
+            extendable_upper_imm = False
+            extendable_lower_imm = False
+            m = immext_casere.search(hex_common.semdict[tag])
+            if m:
+                if m.group(1).isupper():
+                    extendable_upper_imm = True
+                else:
+                    extendable_lower_imm = True
+            beh = hex_common.behdict[tag]
+            beh = hex_common.regre.sub(regprinter,beh)
+            beh = hex_common.absimmre.sub(r"#%s0x%x",beh)
+            beh = hex_common.relimmre.sub(r"PC+%s%d",beh)
+            beh = spacify(beh)
+            # Print out a literal "%s" at the end, used to match empty string
+            # so C won't complain at us
+            if ("A_VECX" in hex_common.attribdict[tag]):
+                macname = "DEF_VECX_PRINTINFO"
+            else: macname = "DEF_PRINTINFO"
+            f.write('%s(%s,"%s%%s"' % (macname,tag,beh))
+            regs_or_imms = \
+                hex_common.reg_or_immre.findall(hex_common.behdict[tag])
+            ri = 0
+            seenregs = {}
+            for allregs,a,b,c,d,allimm,immlett,bits,immshift in regs_or_imms:
+                if a:
+                    #register
+                    if b in seenregs:
+                        regno = seenregs[b]
+                    else:
+                        regno = ri
+                    if len(b) == 1:
+                        f.write(', insn->regno[%d]' % regno)
+                        if 'S' in a:
+                            f.write(', sreg2str(insn->regno[%d])' % regno)
+                        elif 'C' in a:
+                            f.write(', creg2str(insn->regno[%d])' % regno)
+                    elif len(b) == 2:
+                        f.write(', insn->regno[%d] + 1, insn->regno[%d]' % \
+                            (regno,regno))
+                    else:
+                        print("Put some stuff to handle quads here")
+                    if b not in seenregs:
+                        seenregs[b] = ri
+                        ri += 1
+                else:
+                    #immediate
+                    if (immlett.isupper()):
+                        if extendable_upper_imm:
+                            if immlett in 'rR':
+                                f.write(',insn->extension_valid?"##":""')
+                            else:
+                                f.write(',insn->extension_valid?"#":""')
+                        else:
+                            f.write(',""')
+                        ii = 1
+                    else:
+                        if extendable_lower_imm:
+                            if immlett in 'rR':
+                                f.write(',insn->extension_valid?"##":""')
+                            else:
+                                f.write(',insn->extension_valid?"#":""')
+                        else:
+                            f.write(',""')
+                        ii = 0
+                    f.write(', insn->immed[%d]' % ii)
+            # append empty string so there is at least one more arg
+            f.write(',"")\n')
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/gen_shortcode.py b/target/hexagon/gen_shortcode.py
new file mode 100755
index 0000000000..9b589d0189
--- /dev/null
+++ b/target/hexagon/gen_shortcode.py
@@ -0,0 +1,60 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+import hex_common
+
+def gen_shortcode(f, tag):
+    f.write('DEF_SHORTCODE(%s, %s)\n' % (tag, hex_common.semdict[tag]))
+
+def main():
+    hex_common.read_semantics_file(sys.argv[1])
+    hex_common.read_attribs_file(sys.argv[2])
+    hex_common.calculate_attribs()
+    tagregs = hex_common.get_tagregs()
+    tagimms = hex_common.get_tagimms()
+
+    with open(sys.argv[3], 'w') as f:
+        f.write("#ifndef DEF_SHORTCODE\n")
+        f.write("#define DEF_SHORTCODE(TAG,SHORTCODE)    /* Nothing */\n")
+        f.write("#endif\n")
+
+        for tag in hex_common.tags:
+            ## Skip the priv instructions
+            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the guest instructions
+            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the diag instructions
+            if ( tag == "Y6_diag" ) :
+                continue
+            if ( tag == "Y6_diag0" ) :
+                continue
+            if ( tag == "Y6_diag1" ) :
+                continue
+
+            gen_shortcode(f, tag)
+
+        f.write("#undef DEF_SHORTCODE\n")
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/gen_tcg_func_table.py b/target/hexagon/gen_tcg_func_table.py
new file mode 100755
index 0000000000..4809d3273e
--- /dev/null
+++ b/target/hexagon/gen_tcg_func_table.py
@@ -0,0 +1,58 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+import hex_common
+
+def main():
+    hex_common.read_semantics_file(sys.argv[1])
+    hex_common.read_attribs_file(sys.argv[2])
+    hex_common.calculate_attribs()
+    tagregs = hex_common.get_tagregs()
+    tagimms = hex_common.get_tagimms()
+
+    with open(sys.argv[3], 'w') as f:
+        f.write("#ifndef HEXAGON_FUNC_TABLE_H\n")
+        f.write("#define HEXAGON_FUNC_TABLE_H\n\n")
+
+        f.write("const SemanticInsn opcode_genptr[XX_LAST_OPCODE] = {\n")
+        for tag in hex_common.tags:
+            ## Skip the priv instructions
+            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the guest instructions
+            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the diag instructions
+            if ( tag == "Y6_diag" ) :
+                continue
+            if ( tag == "Y6_diag0" ) :
+                continue
+            if ( tag == "Y6_diag1" ) :
+                continue
+
+            f.write("    [%s] = generate_%s,\n" % (tag, tag))
+        f.write("};\n\n")
+
+        f.write("#endif    /* HEXAGON_FUNC_TABLE_H */\n")
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
new file mode 100755
index 0000000000..fe4d8e5730
--- /dev/null
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -0,0 +1,485 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+import hex_common
+
+##
+## Helpers for gen_tcg_func
+##
+def gen_decl_ea_tcg(f, tag):
+    if ('A_CONDEXEC' in hex_common.attribdict[tag] or
+        'A_LOAD' in hex_common.attribdict[tag]):
+        f.write("    TCGv EA = tcg_temp_local_new();\n")
+    else:
+        f.write("    TCGv EA = tcg_temp_new();\n")
+
+def gen_free_ea_tcg(f):
+    f.write("    tcg_temp_free(EA);\n")
+
+def genptr_decl_pair_writeble(f, tag, regtype, regid, regno):
+    regN="%s%sN" % (regtype,regid)
+    f.write("    TCGv_i64 %s%sV = tcg_temp_local_new_i64();\n" % \
+        (regtype, regid))
+    if (regtype == "C"):
+        f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
+            (regN, regno))
+    else:
+        f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
+    if ('A_CONDEXEC' in hex_common.attribdict[tag]):
+        f.write("    if (!is_preloaded(ctx, %s)) {\n" % regN)
+        f.write("        tcg_gen_mov_tl(hex_new_value[%s], hex_gpr[%s]);\n" % \
+                             (regN, regN))
+        f.write("    }\n")
+        f.write("    if (!is_preloaded(ctx, %s + 1)) {\n" % regN)
+        f.write("        tcg_gen_mov_tl(hex_new_value[%s + 1], hex_gpr[%s + 1]);\n" % \
+                             (regN, regN))
+        f.write("    }\n")
+
+def genptr_decl_writeble(f, tag, regtype, regid, regno):
+    regN="%s%sN" % (regtype,regid)
+    f.write("    TCGv %s%sV = tcg_temp_local_new();\n" % \
+        (regtype, regid))
+    if (regtype == "C"):
+        f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
+            (regN, regno))
+    else:
+        f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
+    if ('A_CONDEXEC' in hex_common.attribdict[tag]):
+        f.write("    if (!is_preloaded(ctx, %s)) {\n" % regN)
+        f.write("        tcg_gen_mov_tl(hex_new_value[%s], hex_gpr[%s]);\n" % \
+                             (regN, regN))
+        f.write("    }\n")
+
+def genptr_decl(f, tag, regtype, regid, regno):
+    regN="%s%sN" % (regtype,regid)
+    if (regtype == "R"):
+        if (regid in {"ss", "tt"}):
+            f.write("    TCGv_i64 %s%sV = tcg_temp_local_new_i64();\n" % \
+                (regtype, regid))
+            f.write("    const int %s = insn->regno[%d];\n" % \
+                (regN, regno))
+        elif (regid in {"dd", "ee", "xx", "yy"}):
+            genptr_decl_pair_writeble(f, tag, regtype, regid, regno)
+        elif (regid in {"s", "t", "u", "v"}):
+            f.write("    TCGv %s%sV = hex_gpr[insn->regno[%d]];\n" % \
+                (regtype, regid, regno))
+        elif (regid in {"d", "e", "x", "y"}):
+            genptr_decl_writeble(f, tag, regtype, regid, regno)
+        else:
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "P"):
+        if (regid in {"s", "t", "u", "v"}):
+            f.write("    TCGv %s%sV = hex_pred[insn->regno[%d]];\n" % \
+                (regtype, regid, regno))
+        elif (regid in {"d", "e", "x"}):
+            genptr_decl_writeble(f, tag, regtype, regid, regno)
+        else:
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "C"):
+        if (regid == "ss"):
+            f.write("    TCGv_i64 %s%sV = tcg_temp_local_new_i64();\n" % \
+                (regtype, regid))
+            f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
+                (regN, regno))
+        elif (regid == "dd"):
+            genptr_decl_pair_writeble(f, tag, regtype, regid, regno)
+        elif (regid == "s"):
+            f.write("    TCGv %s%sV = tcg_temp_local_new();\n" % \
+                (regtype, regid))
+            f.write("    const int %s%sN = insn->regno[%d] + HEX_REG_SA0;\n" % \
+                (regtype, regid, regno))
+        elif (regid == "d"):
+            genptr_decl_writeble(f, tag, regtype, regid, regno)
+        else:
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "M"):
+        if (regid == "u"):
+            f.write("    const int %s%sN = insn->regno[%d];\n"% \
+                (regtype, regid, regno))
+            f.write("    TCGv %s%sV = hex_gpr[%s%sN + HEX_REG_M0];\n" % \
+                (regtype, regid, regtype, regid))
+        else:
+            print("Bad register parse: ", regtype, regid)
+    else:
+        print("Bad register parse: ", regtype, regid)
+
+def genptr_decl_new(f,regtype,regid,regno):
+    if (regtype == "N"):
+        if (regid in {"s", "t"}):
+            f.write("    TCGv %s%sN = hex_new_value[insn->regno[%d]];\n" % \
+                (regtype, regid, regno))
+        else:
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "P"):
+        if (regid in {"t", "u", "v"}):
+            f.write("    TCGv %s%sN = hex_new_pred_value[insn->regno[%d]];\n" % \
+                (regtype, regid, regno))
+        else:
+            print("Bad register parse: ", regtype, regid)
+    else:
+        print("Bad register parse: ", regtype, regid)
+
+def genptr_decl_opn(f, tag, regtype, regid, toss, numregs, i):
+    if (hex_common.is_pair(regid)):
+        genptr_decl(f, tag, regtype, regid, i)
+    elif (hex_common.is_single(regid)):
+        if hex_common.is_old_val(regtype, regid, tag):
+            genptr_decl(f,tag, regtype, regid, i)
+        elif hex_common.is_new_val(regtype, regid, tag):
+            genptr_decl_new(f,regtype,regid,i)
+        else:
+            print("Bad register parse: ",regtype,regid,toss,numregs)
+    else:
+        print("Bad register parse: ",regtype,regid,toss,numregs)
+
+def genptr_decl_imm(f,immlett):
+    if (immlett.isupper()):
+        i = 1
+    else:
+        i = 0
+    f.write("    int %s = insn->immed[%d];\n" % \
+        (hex_common.imm_name(immlett), i))
+
+def genptr_free(f,regtype,regid,regno):
+    if (regtype == "R"):
+        if (regid in {"dd", "ss", "tt", "xx", "yy"}):
+            f.write("    tcg_temp_free_i64(%s%sV);\n" % (regtype, regid))
+        elif (regid in {"d", "e", "x", "y"}):
+            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
+        elif (regid not in {"s", "t", "u", "v"}):
+            print("Bad register parse: ",regtype,regid)
+    elif (regtype == "P"):
+        if (regid in {"d", "e", "x"}):
+            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
+        elif (regid not in {"s", "t", "u", "v"}):
+            print("Bad register parse: ",regtype,regid)
+    elif (regtype == "C"):
+        if (regid in {"dd", "ss"}):
+            f.write("    tcg_temp_free_i64(%s%sV);\n" % (regtype, regid))
+        elif (regid in {"d", "s"}):
+            f.write("    tcg_temp_free(%s%sV);\n" % (regtype, regid))
+        else:
+            print("Bad register parse: ",regtype,regid)
+    elif (regtype == "M"):
+        if (regid != "u"):
+            print("Bad register parse: ", regtype, regid)
+    else:
+        print("Bad register parse: ", regtype, regid)
+
+def genptr_free_new(f,regtype,regid,regno):
+    if (regtype == "N"):
+        if (regid not in {"s", "t"}):
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "P"):
+        if (regid not in {"t", "u", "v"}):
+            print("Bad register parse: ", regtype, regid)
+    else:
+        print("Bad register parse: ", regtype, regid)
+
+def genptr_free_opn(f,regtype,regid,i,tag):
+    if (hex_common.is_pair(regid)):
+        genptr_free(f,regtype,regid,i)
+    elif (hex_common.is_single(regid)):
+        if hex_common.is_old_val(regtype, regid, tag):
+            genptr_free(f,regtype,regid,i)
+        elif hex_common.is_new_val(regtype, regid, tag):
+            genptr_free_new(f,regtype,regid,i)
+        else:
+            print("Bad register parse: ",regtype,regid,toss,numregs)
+    else:
+        print("Bad register parse: ",regtype,regid,toss,numregs)
+
+def genptr_src_read(f,regtype,regid):
+    if (regtype == "R"):
+        if (regid in {"ss", "tt", "xx", "yy"}):
+            f.write("    tcg_gen_concat_i32_i64(%s%sV, hex_gpr[%s%sN],\n" % \
+                (regtype, regid, regtype, regid))
+            f.write("                                 hex_gpr[%s%sN + 1]);\n" % \
+                (regtype, regid))
+        elif (regid in {"x", "y"}):
+            f.write("    tcg_gen_mov_tl(%s%sV, hex_gpr[%s%sN]);\n" % \
+                (regtype,regid,regtype,regid))
+        elif (regid not in {"s", "t", "u", "v"}):
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "P"):
+        if (regid == "x"):
+            f.write("    tcg_gen_mov_tl(%s%sV, hex_pred[%s%sN]);\n" % \
+                (regtype, regid, regtype, regid))
+        elif (regid not in {"s", "t", "u", "v"}):
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "C"):
+        if (regid == "ss"):
+            f.write("    gen_read_ctrl_reg_pair(ctx, %s%sN, %s%sV);\n" % \
+                             (regtype, regid, regtype, regid))
+        elif (regid == "s"):
+            f.write("    gen_read_ctrl_reg(ctx, %s%sN, %s%sV);\n" % \
+                             (regtype, regid, regtype, regid))
+        else:
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "M"):
+        if (regid != "u"):
+            print("Bad register parse: ", regtype, regid)
+    else:
+        print("Bad register parse: ", regtype, regid)
+
+def genptr_src_read_new(f,regtype,regid):
+    if (regtype == "N"):
+        if (regid not in {"s", "t"}):
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "P"):
+        if (regid not in {"t", "u", "v"}):
+            print("Bad register parse: ", regtype, regid)
+    else:
+        print("Bad register parse: ", regtype, regid)
+
+def genptr_src_read_opn(f,regtype,regid,tag):
+    if (hex_common.is_pair(regid)):
+        genptr_src_read(f,regtype,regid)
+    elif (hex_common.is_single(regid)):
+        if hex_common.is_old_val(regtype, regid, tag):
+            genptr_src_read(f,regtype,regid)
+        elif hex_common.is_new_val(regtype, regid, tag):
+            genptr_src_read_new(f,regtype,regid)
+        else:
+            print("Bad register parse: ",regtype,regid,toss,numregs)
+    else:
+        print("Bad register parse: ",regtype,regid,toss,numregs)
+
+def gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i):
+    if (i > 0): f.write(", ")
+    if (hex_common.is_pair(regid)):
+        f.write("%s%sV" % (regtype,regid))
+    elif (hex_common.is_single(regid)):
+        if hex_common.is_old_val(regtype, regid, tag):
+            f.write("%s%sV" % (regtype,regid))
+        elif hex_common.is_new_val(regtype, regid, tag):
+            f.write("%s%sN" % (regtype,regid))
+        else:
+            print("Bad register parse: ",regtype,regid,toss,numregs)
+    else:
+        print("Bad register parse: ",regtype,regid,toss,numregs)
+
+def gen_helper_decl_imm(f,immlett):
+    f.write("    TCGv tcgv_%s = tcg_const_tl(%s);\n" % \
+        (hex_common.imm_name(immlett), hex_common.imm_name(immlett)))
+
+def gen_helper_call_imm(f,immlett):
+    f.write(", tcgv_%s" % hex_common.imm_name(immlett))
+
+def gen_helper_free_imm(f,immlett):
+    f.write("    tcg_temp_free(tcgv_%s);\n" % hex_common.imm_name(immlett))
+
+def genptr_dst_write_pair(f, tag, regtype, regid):
+    if ('A_CONDEXEC' in hex_common.attribdict[tag]):
+        f.write("    gen_log_predicated_reg_write_pair(%s%sN, %s%sV, insn->slot);\n" % \
+            (regtype, regid, regtype, regid))
+    else:
+        f.write("    gen_log_reg_write_pair(%s%sN, %s%sV);\n" % \
+            (regtype, regid, regtype, regid))
+    f.write("    ctx_log_reg_write_pair(ctx, %s%sN);\n" % \
+        (regtype, regid))
+
+def genptr_dst_write(f, tag, regtype, regid):
+    if (regtype == "R"):
+        if (regid in {"dd", "xx", "yy"}):
+            genptr_dst_write_pair(f, tag, regtype, regid)
+        elif (regid in {"d", "e", "x", "y"}):
+            if ('A_CONDEXEC' in hex_common.attribdict[tag]):
+                f.write("    gen_log_predicated_reg_write(%s%sN, %s%sV,\n" % \
+                    (regtype, regid, regtype, regid))
+                f.write("                                 insn->slot);\n")
+            else:
+                f.write("    gen_log_reg_write(%s%sN, %s%sV);\n" % \
+                    (regtype, regid, regtype, regid))
+            f.write("    ctx_log_reg_write(ctx, %s%sN);\n" % \
+                (regtype, regid))
+        else:
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "P"):
+        if (regid in {"d", "e", "x"}):
+            f.write("    gen_log_pred_write(%s%sN, %s%sV);\n" % \
+                (regtype, regid, regtype, regid))
+            f.write("    ctx_log_pred_write(ctx, %s%sN);\n" % \
+                (regtype, regid))
+        else:
+            print("Bad register parse: ", regtype, regid)
+    elif (regtype == "C"):
+        if (regid == "dd"):
+            f.write("    gen_write_ctrl_reg_pair(ctx, %s%sN, %s%sV);\n" % \
+                             (regtype, regid, regtype, regid))
+        elif (regid == "d"):
+            f.write("    gen_write_ctrl_reg(ctx, %s%sN, %s%sV);\n" % \
+                             (regtype, regid, regtype, regid))
+        else:
+            print("Bad register parse: ", regtype, regid)
+    else:
+        print("Bad register parse: ", regtype, regid)
+
+def genptr_dst_write_opn(f,regtype, regid, tag):
+    if (hex_common.is_pair(regid)):
+        genptr_dst_write(f, tag, regtype, regid)
+    elif (hex_common.is_single(regid)):
+        genptr_dst_write(f, tag, regtype, regid)
+    else:
+        print("Bad register parse: ",regtype,regid,toss,numregs)
+
+##
+## Generate the TCG code to call the helper
+##     For A2_add: Rd32=add(Rs32,Rt32), { RdV=RsV+RtV;}
+##     We produce:
+##    static void generate_A2_add()
+##                    CPUHexagonState *env
+##                    DisasContext *ctx,
+##                    Insn *insn,
+##                    Packet *pkt)
+##       {
+##           TCGv RdV = tcg_temp_local_new();
+##           const int RdN = insn->regno[0];
+##           TCGv RsV = hex_gpr[insn->regno[1]];
+##           TCGv RtV = hex_gpr[insn->regno[2]];
+##           <GEN>
+##           gen_log_reg_write(RdN, RdV);
+##           ctx_log_reg_write(ctx, RdN);
+##           tcg_temp_free(RdV);
+##       }
+##
+##       where <GEN> depends on hex_common.skip_qemu_helper(tag)
+##       if hex_common.skip_qemu_helper(tag) is True
+##       <GEN>  is fGEN_TCG_A2_add({ RdV=RsV+RtV;});
+##       if hex_common.skip_qemu_helper(tag) is False
+##       <GEN>  is gen_helper_A2_add(RdV, cpu_env, RsV, RtV);
+##
+def gen_tcg_func(f, tag, regs, imms):
+    f.write("static void generate_%s(\n" %tag)
+    f.write("                CPUHexagonState *env,\n")
+    f.write("                DisasContext *ctx,\n")
+    f.write("                Insn *insn,\n")
+    f.write("                Packet *pkt)\n")
+    f.write('{\n')
+    if hex_common.need_ea(tag): gen_decl_ea_tcg(f, tag)
+    i=0
+    ## Declare all the operands (regs and immediates)
+    for regtype,regid,toss,numregs in regs:
+        genptr_decl_opn(f, tag, regtype, regid, toss, numregs, i)
+        i += 1
+    for immlett,bits,immshift in imms:
+        genptr_decl_imm(f,immlett)
+
+    if 'A_PRIV' in hex_common.attribdict[tag]:
+        f.write('    fCHECKFORPRIV();\n')
+    if 'A_GUEST' in hex_common.attribdict[tag]:
+        f.write('    fCHECKFORGUEST();\n')
+
+    ## Read all the inputs
+    for regtype,regid,toss,numregs in regs:
+        if (hex_common.is_read(regid)):
+            genptr_src_read_opn(f,regtype,regid,tag)
+
+    if ( hex_common.skip_qemu_helper(tag) ):
+        f.write("    fGEN_TCG_%s(%s);\n" % (tag, hex_common.semdict[tag]))
+    else:
+        ## Generate the call to the helper
+        for immlett,bits,immshift in imms:
+            gen_helper_decl_imm(f,immlett)
+        if hex_common.need_part1(tag):
+            f.write("    TCGv part1 = tcg_const_tl(insn->part1);\n")
+        if hex_common.need_slot(tag):
+            f.write("    TCGv slot = tcg_const_tl(insn->slot);\n")
+        f.write("    gen_helper_%s(" % (tag))
+        i=0
+        ## If there is a scalar result, it is the return type
+        for regtype,regid,toss,numregs in regs:
+            if (hex_common.is_written(regid)):
+                gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i)
+                i += 1
+        if (i > 0): f.write(", ")
+        f.write("cpu_env")
+        i=1
+        for regtype,regid,toss,numregs in regs:
+            if (hex_common.is_read(regid)):
+                gen_helper_call_opn(f, tag, regtype, regid, toss, numregs, i)
+                i += 1
+        for immlett,bits,immshift in imms:
+            gen_helper_call_imm(f,immlett)
+
+        if hex_common.need_slot(tag): f.write(", slot")
+        if hex_common.need_part1(tag): f.write(", part1" )
+        f.write(");\n")
+        if hex_common.need_slot(tag):
+            f.write("    tcg_temp_free(slot);\n")
+        if hex_common.need_part1(tag):
+            f.write("    tcg_temp_free(part1);\n")
+        for immlett,bits,immshift in imms:
+            gen_helper_free_imm(f,immlett)
+
+    ## Write all the outputs
+    for regtype,regid,toss,numregs in regs:
+        if (hex_common.is_written(regid)):
+            genptr_dst_write_opn(f,regtype, regid, tag)
+
+    ## Free all the operands (regs and immediates)
+    if hex_common.need_ea(tag): gen_free_ea_tcg(f)
+    for regtype,regid,toss,numregs in regs:
+        genptr_free_opn(f,regtype,regid,i,tag)
+        i += 1
+
+    f.write("}\n\n")
+
+def gen_def_tcg_func(f, tag, tagregs, tagimms):
+    regs = tagregs[tag]
+    imms = tagimms[tag]
+
+    gen_tcg_func(f, tag, regs, imms)
+
+def main():
+    hex_common.read_semantics_file(sys.argv[1])
+    hex_common.read_attribs_file(sys.argv[2])
+    hex_common.read_overrides_file(sys.argv[3])
+    hex_common.calculate_attribs()
+    tagregs = hex_common.get_tagregs()
+    tagimms = hex_common.get_tagimms()
+
+    with open(sys.argv[4], 'w') as f:
+        f.write("#ifndef HEXAGON_TCG_FUNCS_H\n")
+        f.write("#define HEXAGON_TCG_FUNCS_H\n\n")
+
+        for tag in hex_common.tags:
+            ## Skip the priv instructions
+            if ( "A_PRIV" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the guest instructions
+            if ( "A_GUEST" in hex_common.attribdict[tag] ) :
+                continue
+            ## Skip the diag instructions
+            if ( tag == "Y6_diag" ) :
+                continue
+            if ( tag == "Y6_diag0" ) :
+                continue
+            if ( tag == "Y6_diag1" ) :
+                continue
+
+            gen_def_tcg_func(f, tag, tagregs, tagimms)
+
+        f.write("#endif    /* HEXAGON_TCG_FUNCS_H */\n")
+
+if __name__ == "__main__":
+    main()
diff --git a/target/hexagon/hex_common.py b/target/hexagon/hex_common.py
new file mode 100755
index 0000000000..b3b534057d
--- /dev/null
+++ b/target/hexagon/hex_common.py
@@ -0,0 +1,234 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+
+behdict = {}          # tag ->behavior
+semdict = {}          # tag -> semantics
+attribdict = {}       # tag -> attributes
+macros = {}           # macro -> macro information...
+attribinfo = {}       # Register information and misc
+tags = []             # list of all tags
+overrides = {}        # tags with helper overrides
+
+# We should do this as a hash for performance,
+# but to keep order let's keep it as a list.
+def uniquify(seq):
+    seen = set()
+    seen_add = seen.add
+    return [x for x in seq if x not in seen and not seen_add(x)]
+
+regre = re.compile(
+    r"((?<!DUP)[MNORCPQXSGVZA])([stuvwxyzdefg]+)([.]?[LlHh]?)(\d+S?)")
+immre = re.compile(r"[#]([rRsSuUm])(\d+)(?:[:](\d+))?")
+reg_or_immre = \
+    re.compile(r"(((?<!DUP)[MNRCOPQXSGVZA])([stuvwxyzdefg]+)" + \
+                "([.]?[LlHh]?)(\d+S?))|([#]([rRsSuUm])(\d+)[:]?(\d+)?)")
+relimmre = re.compile(r"[#]([rR])(\d+)(?:[:](\d+))?")
+absimmre = re.compile(r"[#]([sSuUm])(\d+)(?:[:](\d+))?")
+
+finished_macros = set()
+
+def expand_macro_attribs(macro,allmac_re):
+    if macro.key not in finished_macros:
+        # Get a list of all things that might be macros
+        l = allmac_re.findall(macro.beh)
+        for submacro in l:
+            if not submacro: continue
+            if not macros[submacro]:
+                raise Exception("Couldn't find macro: <%s>" % l)
+            macro.attribs |= expand_macro_attribs(
+                macros[submacro], allmac_re)
+            finished_macros.add(macro.key)
+    return macro.attribs
+
+# When qemu needs an attribute that isn't in the imported files,
+# we'll add it here.
+def add_qemu_macro_attrib(name, attrib):
+    macros[name].attribs.add(attrib)
+
+immextre = re.compile(r'f(MUST_)?IMMEXT[(]([UuSsRr])')
+def calculate_attribs():
+    add_qemu_macro_attrib('fREAD_PC', 'A_IMPLICIT_READS_PC')
+    add_qemu_macro_attrib('fTRAP', 'A_IMPLICIT_READS_PC')
+    add_qemu_macro_attrib('fWRITE_P0', 'A_WRITES_PRED_REG')
+    add_qemu_macro_attrib('fWRITE_P1', 'A_WRITES_PRED_REG')
+    add_qemu_macro_attrib('fWRITE_P2', 'A_WRITES_PRED_REG')
+    add_qemu_macro_attrib('fWRITE_P3', 'A_WRITES_PRED_REG')
+
+    # Recurse down macros, find attributes from sub-macros
+    macroValues = list(macros.values())
+    allmacros_restr = "|".join(set([ m.re.pattern for m in macroValues ]))
+    allmacros_re = re.compile(allmacros_restr)
+    for macro in macroValues:
+        expand_macro_attribs(macro,allmacros_re)
+    # Append attributes to all instructions
+    for tag in tags:
+        for macname in allmacros_re.findall(semdict[tag]):
+            if not macname: continue
+            macro = macros[macname]
+            attribdict[tag] |= set(macro.attribs)
+    # Figure out which instructions write predicate registers
+    tagregs = get_tagregs()
+    for tag in tags:
+        regs = tagregs[tag]
+        for regtype, regid, toss, numregs in regs:
+            if regtype == "P" and is_written(regid):
+                attribdict[tag].add('A_WRITES_PRED_REG')
+
+def SEMANTICS(tag, beh, sem):
+    #print tag,beh,sem
+    behdict[tag] = beh
+    semdict[tag] = sem
+    attribdict[tag] = set()
+    tags.append(tag)        # dicts have no order, this is for order
+
+def ATTRIBUTES(tag, attribstring):
+    attribstring = \
+        attribstring.replace("ATTRIBS","").replace("(","").replace(")","")
+    if not attribstring:
+        return
+    attribs = attribstring.split(",")
+    for attrib in attribs:
+        attribdict[tag].add(attrib.strip())
+
+class Macro(object):
+    __slots__ = ['key','name', 'beh', 'attribs', 're']
+    def __init__(self, name, beh, attribs):
+        self.key = name
+        self.name = name
+        self.beh = beh
+        self.attribs = set(attribs)
+        self.re = re.compile("\\b" + name + "\\b")
+
+def MACROATTRIB(macname,beh,attribstring):
+    attribstring = attribstring.replace("(","").replace(")","")
+    if attribstring:
+        attribs = attribstring.split(",")
+    else:
+        attribs = []
+    macros[macname] = Macro(macname,beh,attribs)
+
+def compute_tag_regs(tag):
+    return uniquify(regre.findall(behdict[tag]))
+
+def compute_tag_immediates(tag):
+    return uniquify(immre.findall(behdict[tag]))
+
+##
+##  tagregs is the main data structure we'll use
+##  tagregs[tag] will contain the registers used by an instruction
+##  Within each entry, we'll use the regtype and regid fields
+##      regtype can be one of the following
+##          C                control register
+##          N                new register value
+##          P                predicate register
+##          R                GPR register
+##          M                modifier register
+##      regid can be one of the following
+##          d, e             destination register
+##          dd               destination register pair
+##          s, t, u, v, w    source register
+##          ss, tt, uu, vv   source register pair
+##          x, y             read-write register
+##          xx, yy           read-write register pair
+##
+def get_tagregs():
+    return dict(zip(tags, list(map(compute_tag_regs, tags))))
+
+def get_tagimms():
+    return dict(zip(tags, list(map(compute_tag_immediates, tags))))
+
+def is_pair(regid):
+    return len(regid) == 2
+
+def is_single(regid):
+    return len(regid) == 1
+
+def is_written(regid):
+    return regid[0] in "dexy"
+
+def is_writeonly(regid):
+    return regid[0] in "de"
+
+def is_read(regid):
+    return regid[0] in "stuvwxy"
+
+def is_readwrite(regid):
+    return regid[0] in "xy"
+
+def is_scalar_reg(regtype):
+    return regtype in "RPC"
+
+def is_old_val(regtype, regid, tag):
+    return regtype+regid+'V' in semdict[tag]
+
+def is_new_val(regtype, regid, tag):
+    return regtype+regid+'N' in semdict[tag]
+
+def need_slot(tag):
+    if ('A_CONDEXEC' in attribdict[tag] or
+        'A_STORE' in attribdict[tag] or
+        'A_LOAD' in attribdict[tag]):
+        return 1
+    else:
+        return 0
+
+def need_part1(tag):
+    return re.compile(r"fPART1").search(semdict[tag])
+
+def need_ea(tag):
+    return re.compile(r"\bEA\b").search(semdict[tag])
+
+def skip_qemu_helper(tag):
+    return tag in overrides.keys()
+
+def imm_name(immlett):
+    return "%siV" % immlett
+
+def read_semantics_file(name):
+    eval_line = ""
+    for line in open(name, 'rt').readlines():
+        if not line.startswith("#"):
+            eval_line += line
+            if line.endswith("\\\n"):
+                eval_line.rstrip("\\\n")
+            else:
+                eval(eval_line.strip())
+                eval_line = ""
+
+def read_attribs_file(name):
+    attribre = re.compile(r'DEF_ATTRIB\(([A-Za-z0-9_]+), ([^,]*), ' +
+            r'"([A-Za-z0-9_\.]*)", "([A-Za-z0-9_\.]*)"\)')
+    for line in open(name, 'rt').readlines():
+        if not attribre.match(line):
+            continue
+        (attrib_base,descr,rreg,wreg) = attribre.findall(line)[0]
+        attrib_base = 'A_' + attrib_base
+        attribinfo[attrib_base] = {'rreg':rreg, 'wreg':wreg, 'descr':descr}
+
+def read_overrides_file(name):
+    overridere = re.compile("#define fGEN_TCG_([A-Za-z0-9_]+)\(.*")
+    for line in open(name, 'rt').readlines():
+        if not overridere.match(line):
+            continue
+        tag = overridere.findall(line)[0]
+        overrides[tag] = True
-- 
2.25.1


