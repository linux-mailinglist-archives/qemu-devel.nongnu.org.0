Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A116A6E4B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:23:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNM6-0000Iu-77; Wed, 01 Mar 2023 09:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pXNLp-0008Pj-M4
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:22:38 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pXNLo-0000r4-1l
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 09:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+I4qRuHciEfRJecQBuQQhrSG2K8AU8/5R1o5v8ket0E=; b=pw/Zh94zK1E3TxEbRIaJ0acQun
 U9/pqPJDIZE9uKoy/f9m4GfeFdUpFDslKGbwDjA+21kGI5N2cbFpa31zFKLlA/qeO+QSOja9g0W+B
 JJP/H9zdXcXh0xKkY7Q/CAHvqAdGAezZHhJVfUYcjiMq/qvSj1ZG1B7oAgiM0Mj2OpFI=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	richard.henderson@linaro.org,
	tsimpson@quicinc.com
Subject: [PATCH] tcg: `reachable_code_pass()` remove empty else-branch
Date: Wed,  1 Mar 2023 15:22:21 +0100
Message-Id: <20230301142221.24495-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch extends reachable_code_pass() to also deal with empty
else-branches of the form

  br $L0
  set_label $L1
  set_label $L0

converting them to

  set_label $L1

when $L0 is only referenced by the br op.  This type of empty-else
branch will be emitted by idef-parser in the Hexagon frontend once
CANCEL statements have been ignored.

Signed-off-by: Anton Johansson <anjo@rev.ng>
---
 tcg/tcg.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index a4a3da6804..531bc74231 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2664,21 +2664,40 @@ static void reachable_code_pass(TCGContext *s)
                 dead = false;
                 remove = false;

-                /*
-                 * Optimization can fold conditional branches to unconditional.
-                 * If we find a label with one reference which is preceded by
-                 * an unconditional branch to it, remove both.  This needed to
-                 * wait until the dead code in between them was removed.
-                 */
-                if (label->refs == 1) {
-                    TCGOp *op_prev = QTAILQ_PREV(op, link);
-                    if (op_prev->opc == INDEX_op_br &&
-                        label == arg_label(op_prev->args[0])) {
+                TCGOp *op_prev = QTAILQ_PREV(op, link);
+                if (label->refs == 1 &&
+                    op_prev->opc == INDEX_op_br &&
+                    label == arg_label(op_prev->args[0])) {
+                    /*
+                     * Optimization can fold conditional branches to
+                     * unconditional. If we find a label with one reference
+                     * which is preceded by an unconditional branch to it,
+                     * remove both.  This needed to wait until the dead code
+                     * in between them was removed.
+                     */
+                    tcg_op_remove(s, op_prev);
+                    remove = true;
+                } else if (op_next->opc == INDEX_op_set_label) {
+                    /*
+                     * The Hexagon frontend can generate empty else-branches for
+                     * certain instructions.  If we encounter
+                     *
+                     *   br $L0
+                     *   set_label $L1
+                     *   set_label $L0
+                     *
+                     * where $L0 only has a single reference, remove the branch
+                     * to $L0 and the corresonding label.
+                     */
+                    TCGLabel *next_label = arg_label(op_next->args[0]);
+                    if (next_label->refs == 1 &&
+                        op_prev->opc == INDEX_op_br &&
+                        next_label == arg_label(op_prev->args[0])) {
                         tcg_op_remove(s, op_prev);
-                        remove = true;
                     }
                 }
             }
+
             break;

         case INDEX_op_br:
--
2.39.1

