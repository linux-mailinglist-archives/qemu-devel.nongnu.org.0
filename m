Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFCE35E816
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:18:11 +0200 (CEST)
Received: from localhost ([::1]:59854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQQE-00010Q-4x
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQM4-0007R3-0U; Tue, 13 Apr 2021 17:13:52 -0400
Received: from [201.28.113.2] (port=27024 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQM2-0007YY-GD; Tue, 13 Apr 2021 17:13:51 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 13 Apr 2021 18:13:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 834FC8011B4;
 Tue, 13 Apr 2021 18:13:41 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 2/5] decodetree: Fix empty input files for varinsnwidth
Date: Tue, 13 Apr 2021 18:11:26 -0300
Message-Id: <20210413211129.457272-3-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413211129.457272-1-luis.pires@eldorado.org.br>
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Apr 2021 21:13:41.0781 (UTC)
 FILETIME=[E1465C50:01D730A9]
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

Decodetree would throw an error when the input file was empty
and --varinsnwidth was specified.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 scripts/decodetree.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 4e18f52a65..935b2964e0 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1178,11 +1178,12 @@ def output_code(self, i, extracted, outerbits, outermask):
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


