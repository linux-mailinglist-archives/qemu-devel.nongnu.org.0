Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550B1411688
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:13:39 +0200 (CEST)
Received: from localhost ([::1]:59820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSK38-0001wg-CD
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEP1-000866-Ho
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:51 -0400
Received: from [115.28.160.31] (port=35578 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSEOz-0005Ma-Op
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:11:51 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 96D07633F9;
 Mon, 20 Sep 2021 16:05:29 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125129; bh=tQo2Jk9T916EHodWVi5R/SJp4gVXrLiLL0nctftLKPo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=miTGJ1Cxmp8Xd89hhNMwk6ZtfWeS+ee6CMF2kmJ2faCbtH3PKBO/utiDljOKpXnIs
 eL1fmgR4tifMOSVdrkdjwMdDgIZEIbd4ME0AnqjVFiGFSmF8Z3ViOmayiUzzvEDhrn
 mLFim1Hox7onEyh07x+VcyBbMpHahuLJx3dLMJfs=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/30] tcg/loongarch: Implement the memory barrier op
Date: Mon, 20 Sep 2021 16:04:29 +0800
Message-Id: <20210920080451.408655-9-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Sep 2021 09:57:24 -0400
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 tcg/loongarch/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index 8be34f8275..71564e3246 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -248,3 +248,35 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
         g_assert_not_reached();
     }
 }
+
+#include "tcg-insn-defs.c.inc"
+
+/*
+ * TCG intrinsics
+ */
+
+static void tcg_out_mb(TCGContext *s, TCGArg a0)
+{
+    /* Baseline LoongArch only has the full barrier, unfortunately.  */
+    tcg_out_opc_dbar(s, 0);
+}
+
+/*
+ * Entry-points
+ */
+
+static void tcg_out_op(TCGContext *s, TCGOpcode opc,
+                       const TCGArg args[TCG_MAX_OP_ARGS],
+                       const int const_args[TCG_MAX_OP_ARGS])
+{
+    TCGArg a0 = args[0];
+
+    switch (opc) {
+    case INDEX_op_mb:
+        tcg_out_mb(s, a0);
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.33.0


