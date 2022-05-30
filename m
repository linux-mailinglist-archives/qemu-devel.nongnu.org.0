Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCA1537A8F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:21:01 +0200 (CEST)
Received: from localhost ([::1]:54698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nveOK-0007k6-1V
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nveD2-0005Zp-JX
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:09:20 -0400
Received: from [187.72.171.209] (port=50549 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1nveCz-0000lS-P3
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:09:20 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 30 May 2022 09:08:09 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 29DFA800502;
 Mon, 30 May 2022 09:08:09 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH] checkpatch: add regex to match decodetree structs in
 typeList
Date: Mon, 30 May 2022 09:07:50 -0300
Message-Id: <20220530120750.1016067-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 May 2022 12:08:09.0377 (UTC)
 FILETIME=[ED6EE110:01D8741D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Decodetree generates code with structs named "arg_<identifier>" for
each argument set. When implementing methods that receive pointers to
these structs, like in [1], checkpatch will sometimes misinterpret them
as variables, resulting in errors like:

    ERROR: spaces required around that '*' (ctx:WxV)

Add a regex in typeList to match decodetree structs so they are always
correctly identified as types.

[1] https://lists.gnu.org/archive/html/qemu-ppc/2022-05/msg00431.html

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
This patch does get rid of the false positives related to decodetree
structs under target/ppc/translate/, but I'm no Perl programmer, so
maybe I've misunderstood the root cause of this problem. Even if it's
correct, there may be other ways to fix this, like adding a regex to
typeTypedef, but I'm not sure what would be preferable, so RFC.
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d900d18048..2b98094c6f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -305,6 +305,7 @@ our @typeList = (
 	qr{${Ident}_handler},
 	qr{${Ident}_handler_fn},
 	qr{target_(?:u)?long},
+	qr{arg_${Ident}},
 	qr{hwaddr},
         # external libraries
 	qr{xen\w+_handle},
-- 
2.25.1


