Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC435E815
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:18:09 +0200 (CEST)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQQC-0000yK-Mv
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQM1-0007MS-8y; Tue, 13 Apr 2021 17:13:49 -0400
Received: from [201.28.113.2] (port=27024 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQLz-0007YY-OC; Tue, 13 Apr 2021 17:13:49 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 13 Apr 2021 18:13:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 3FE63801212;
 Tue, 13 Apr 2021 18:13:41 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 1/5] decodetree: Add support for 64-bit instructions
Date: Tue, 13 Apr 2021 18:11:25 -0300
Message-Id: <20210413211129.457272-2-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413211129.457272-1-luis.pires@eldorado.org.br>
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Apr 2021 21:13:41.0562 (UTC)
 FILETIME=[E124F1A0:01D730A9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org,
 Luis Pires <luis.pires@eldorado.org.br>, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow '64' to be specified for the instruction width command line params
and use the appropriate insn/field data types, mask, extract and deposit
functions in that case.

This will be used to implement the new 64-bit Power ISA 3.1 instructions.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 docs/devel/decodetree.rst |  5 +++--
 scripts/decodetree.py     | 26 +++++++++++++++++++++-----
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
index 74f66bf46e..d776dae14f 100644
--- a/docs/devel/decodetree.rst
+++ b/docs/devel/decodetree.rst
@@ -40,8 +40,9 @@ and returns an integral value extracted from there.
 
 A field with no ``unnamed_fields`` and no ``!function`` is in error.
 
-FIXME: the fields of the structure into which this result will be stored
-is restricted to ``int``.  Which means that we cannot expand 64-bit items.
+The fields of the structure into which this result will be stored are
+defined as ``int`` when the instruction size is set to 16 or 32 bits
+and as ``int64_t`` when the instruction size is set to 64 bits.
 
 Field examples:
 
diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 4637b633e7..4e18f52a65 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -42,6 +42,10 @@
 output_fd = None
 insntype = 'uint32_t'
 decode_function = 'decode'
+field_data_type = 'int'
+extract_function = 'extract32'
+sextract_function = 'sextract32'
+deposit_function = 'deposit32'
 
 # An identifier for C.
 re_C_ident = '[a-zA-Z][a-zA-Z0-9_]*'
@@ -185,9 +189,9 @@ def __str__(self):
 
     def str_extract(self):
         if self.sign:
-            extr = 'sextract32'
+            extr = sextract_function
         else:
-            extr = 'extract32'
+            extr = extract_function
         return '{0}(insn, {1}, {2})'.format(extr, self.pos, self.len)
 
     def __eq__(self, other):
@@ -215,8 +219,9 @@ def str_extract(self):
             if pos == 0:
                 ret = f.str_extract()
             else:
-                ret = 'deposit32({0}, {1}, {2}, {3})' \
-                      .format(ret, pos, 32 - pos, f.str_extract())
+                ret = '{4}({0}, {1}, {2}, {3})' \
+                      .format(ret, pos, insnwidth - pos, f.str_extract(),
+                              deposit_function)
             pos += f.len
         return ret
 
@@ -311,7 +316,7 @@ def output_def(self):
         if not self.extern:
             output('typedef struct {\n')
             for n in self.fields:
-                output('    int ', n, ';\n')
+                output('    ', field_data_type, ' ', n, ';\n')
             output('} ', self.struct_name(), ';\n\n')
 # end Arguments
 
@@ -1264,6 +1269,10 @@ def main():
     global insntype
     global insnmask
     global decode_function
+    global extract_function
+    global sextract_function
+    global deposit_function
+    global field_data_type
     global variablewidth
     global anyextern
 
@@ -1293,6 +1302,13 @@ def main():
             if insnwidth == 16:
                 insntype = 'uint16_t'
                 insnmask = 0xffff
+            elif insnwidth == 64:
+                insntype = 'uint64_t'
+                insnmask = 0xffffffffffffffff
+                field_data_type = 'int64_t'
+                extract_function = 'extract64'
+                sextract_function = 'sextract64'
+                deposit_function = 'deposit64'
             elif insnwidth != 32:
                 error(0, 'cannot handle insns of width', insnwidth)
         else:
-- 
2.25.1


