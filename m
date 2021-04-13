Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BC935E67E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 20:33:27 +0200 (CEST)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWNqo-0000aV-3W
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 14:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWNn3-0007vf-O1
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 14:29:33 -0400
Received: from [201.28.113.2] (port=3719 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>) id 1lWNn2-0004ie-AI
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 14:29:33 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 13 Apr 2021 15:12:18 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id D18BB8011B4;
 Tue, 13 Apr 2021 15:12:18 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH] decodetree: Allow empty input files for var width
Date: Tue, 13 Apr 2021 15:09:58 -0300
Message-Id: <20210413180958.412991-1-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Apr 2021 18:12:19.0033 (UTC)
 FILETIME=[8AA6CC90:01D73090]
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
Cc: Luis Pires <luis.pires@eldorado.org.br>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was broken when varinsnwidth was specified.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 scripts/decodetree.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 3450a2a08d..fef5eeaf42 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1177,11 +1177,12 @@ def output_code(self, i, extracted, outerbits, outermask):
         ind = str_indent(i)
 
         # If we need to load more bytes, do so now.
-        if extracted < self.width:
-            output(ind, 'insn = ', decode_function,
-                   '_load_bytes(ctx, insn, {0}, {1});\n'
-                   .format(extracted // 8, self.width // 8));
-            extracted = self.width
+        if self.width is not None:
+            if extracted < self.width:
+                output(ind, 'insn = ', decode_function,
+                       '_load_bytes(ctx, insn, {0}, {1});\n'
+                       .format(extracted // 8, self.width // 8));
+                extracted = self.width
         output(ind, 'return insn;\n')
 # end SizeLeaf
 
-- 
2.25.1


