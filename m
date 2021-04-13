Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5C35E831
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:24:36 +0200 (CEST)
Received: from localhost ([::1]:43744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQWS-0006G9-0R
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQM6-0007VR-G2; Tue, 13 Apr 2021 17:13:54 -0400
Received: from [201.28.113.2] (port=27024 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQM5-0007YY-15; Tue, 13 Apr 2021 17:13:54 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 13 Apr 2021 18:13:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B80B4801212;
 Tue, 13 Apr 2021 18:13:41 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 3/5] decodetree: Allow custom var width load functions
Date: Tue, 13 Apr 2021 18:11:27 -0300
Message-Id: <20210413211129.457272-4-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413211129.457272-1-luis.pires@eldorado.org.br>
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Apr 2021 21:13:42.0078 (UTC)
 FILETIME=[E173ADE0:01D730A9]
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

This is useful in situations where you want decodetree
to handle variable width instructions but you want to
provide custom code to load the instructions. Suppressing
the generation of the load function is necessary to avoid
compilation errors due to the load function being unused.

This will be used by the PowerPC decodetree code.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 scripts/decodetree.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 935b2964e0..a62b8d8d76 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1278,9 +1278,10 @@ def main():
     global anyextern
 
     decode_scope = 'static '
+    noloadfunc = False
 
     long_opts = ['decode=', 'translate=', 'output=', 'insnwidth=',
-                 'static-decode=', 'varinsnwidth=']
+                 'static-decode=', 'varinsnwidth=', 'noloadfunc']
     try:
         (opts, args) = getopt.gnu_getopt(sys.argv[1:], 'o:vw:', long_opts)
     except getopt.GetoptError as err:
@@ -1312,6 +1313,8 @@ def main():
                 deposit_function = 'deposit64'
             elif insnwidth != 32:
                 error(0, 'cannot handle insns of width', insnwidth)
+        elif o == '--noloadfunc':
+            noloadfunc = True
         else:
             assert False, 'unhandled option'
 
@@ -1401,12 +1404,13 @@ def main():
     output(i4, 'return false;\n')
     output('}\n')
 
-    if variablewidth:
-        output('\n', decode_scope, insntype, ' ', decode_function,
-               '_load(DisasContext *ctx)\n{\n',
-               '    ', insntype, ' insn = 0;\n\n')
-        stree.output_code(4, 0, 0, 0)
-        output('}\n')
+    if not noloadfunc:
+        if variablewidth:
+            output('\n', decode_scope, insntype, ' ', decode_function,
+                   '_load(DisasContext *ctx)\n{\n',
+                   '    ', insntype, ' insn = 0;\n\n')
+            stree.output_code(4, 0, 0, 0)
+            output('}\n')
 
     if output_file:
         output_fd.close()
-- 
2.25.1


