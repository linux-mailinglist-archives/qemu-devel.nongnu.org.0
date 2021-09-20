Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3002411705
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:29:58 +0200 (CEST)
Received: from localhost ([::1]:34040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKIv-0005r2-HX
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSETb-0008Sc-87
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:16:36 -0400
Received: from [115.28.160.31] (port=35658 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSETZ-0000yj-LJ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:16:35 -0400
Received: from ld50.lan (unknown [101.88.25.142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E3F156340A;
 Mon, 20 Sep 2021 16:06:12 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632125172; bh=VtbntofemEsOm7UqG3/evjLaoLVj9ThUM57Q0GFNT18=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jcZMzhPWnbE+Y6PrSMHZi8xqeGHr6xcSQGg6hs02VBJYSpPpRfVKAC6R0v/+Kt7dJ
 3Yg8F/lt8AhlFaXGV6jAxdX9IGmaLqctRJKC6JYNRmfbpdoPBym2N9gxBvU8byMvuT
 MNL969h/gSPyGsAu//TvblCzSSqWM8ut3pZfn8tQ=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/30] tcg/loongarch: Implement exit_tb/goto_tb
Date: Mon, 20 Sep 2021 16:04:46 +0800
Message-Id: <20210920080451.408655-26-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920080451.408655-1-git@xen0n.name>
References: <20210920080451.408655-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 tcg/loongarch/tcg-target.c.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tcg/loongarch/tcg-target.c.inc b/tcg/loongarch/tcg-target.c.inc
index 10df007087..585bf8dba0 100644
--- a/tcg/loongarch/tcg-target.c.inc
+++ b/tcg/loongarch/tcg-target.c.inc
@@ -899,6 +899,25 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     int c2 = const_args[2];
 
     switch (opc) {
+    case INDEX_op_exit_tb:
+        /* Reuse the zeroing that exists for goto_ptr.  */
+        if (a0 == 0) {
+            tcg_out_call_int(s, tcg_code_gen_epilogue, true);
+        } else {
+            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_A0, a0);
+            tcg_out_call_int(s, tb_ret_addr, true);
+        }
+        break;
+
+    case INDEX_op_goto_tb:
+        assert(s->tb_jmp_insn_offset == 0);
+        /* indirect jump method */
+        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_REG_ZERO,
+                   (uintptr_t)(s->tb_jmp_target_addr + a0));
+        tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_TMP0, 0);
+        set_jmp_reset_offset(s, a0);
+        break;
+
     case INDEX_op_mb:
         tcg_out_mb(s, a0);
         break;
-- 
2.33.0


