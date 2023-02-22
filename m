Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AACF69FF81
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:30:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWH-0000ON-Bt; Wed, 22 Feb 2023 18:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWE-0000NN-Hc
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:26 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWC-0005Id-Vb
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:26 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 d1-20020a17090a3b0100b00229ca6a4636so10902012pjc.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5v/dwvyzqW0LrwkDssVFFMNck7V5COuSNYqzQhD5srA=;
 b=IJCLofA0xfgefN5Z5D1g+iH6fJsUKeTYfxRYg3z1I+qGzLZAnu2UALo3d/D+Zq8ao9
 QoXFDgJhHOPa2cpQcI4/cFxYnVBQb3Ix6XVMewK/SbebivAniTLbQM/WHRN1Mbxs3x9y
 lwPcjAD24CxSsRtCjHdMLjekAgxRn78+tPnJzd2aH8WTXEKDFxFtXVMYNkXq9YGGrHVh
 UeKAxtGQfGQ0kBPgDlBBtT4i/gtondIYAbhhxkC1ncKPw+AnVuhNEDxCz1uqB+kq0A/q
 ZFLCTUQCBhlX6MAkRXBgLXxDzwa26ItF9gs9MDwJ1upPdiYMPUxo8rmrdu5bP8JNrsLY
 JcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5v/dwvyzqW0LrwkDssVFFMNck7V5COuSNYqzQhD5srA=;
 b=CGIqfnVlsE89llvhSZrrQ5INqz5NWZW53m7IZ55GLCAJYn8rTuX46BLsSDRuFqxeOI
 XeU87ETzFkPaEVYGsBX3Xr+4mI/Iih9UD8YX89q23nYVFrykPO8Ejg7LfPkGVMsDWZIH
 M6E+jfI/e+cVpfbQFMfDr5TU6nbF8MWypT1MYJ+5xxeAF2Izq5A2P2DWyva0BrhSBUms
 LIbNgKfmKK+hjksqBNLbH6pGPs5OeUucozvrS9om4tHnQ8vyb7OZxX7LvmsHtjIduQ3c
 ZSFTO6dG/WIEgXAQP/JBC4rDgGQkbTB3jmYyyw8X6iQf2QV4CdpoukDQrmTZMT3QHkau
 Ju6A==
X-Gm-Message-State: AO0yUKXyt5fi0JdoDcA9j/8Q8OdGlt9heitHKNAqjCbhpZ+i/7SmyByc
 nXk60yv5KZUrLxL4ULVtbvtcPDW+o85a3WACDio=
X-Google-Smtp-Source: AK7set+iQRzl36OP2KiMzTyWt+knbDyKFxxIX7fsSG9np3KEBL1whtxMdgClV2x7uEF6gavG9GRCBw==
X-Received: by 2002:a17:90b:33d0:b0:234:d78:9b4c with SMTP id
 lk16-20020a17090b33d000b002340d789b4cmr12049982pjb.18.1677108443359; 
 Wed, 22 Feb 2023 15:27:23 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/28] tcg: Remove branch-to-next regardless of reference
 count
Date: Wed, 22 Feb 2023 13:26:51 -1000
Message-Id: <20230222232715.15034-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Just because the label reference count is more than 1 does
not mean we cannot remove a branch-to-next.  By doing this
first, the label reference count may drop to 0, and then
the label itself gets removed as before.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 06209e6160..0992fb4f31 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2638,7 +2638,7 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
 /* Reachable analysis : remove unreachable code.  */
 static void reachable_code_pass(TCGContext *s)
 {
-    TCGOp *op, *op_next;
+    TCGOp *op, *op_next, *op_prev;
     bool dead = false;
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
@@ -2648,6 +2648,22 @@ static void reachable_code_pass(TCGContext *s)
         switch (op->opc) {
         case INDEX_op_set_label:
             label = arg_label(op->args[0]);
+
+            /*
+             * Optimization can fold conditional branches to unconditional.
+             * If we find a label which is preceded by an unconditional
+             * branch to next, remove the branch.  We couldn't do this when
+             * processing the branch because any dead code between the branch
+             * and label had not yet been removed.
+             */
+            op_prev = QTAILQ_PREV(op, link);
+            if (op_prev->opc == INDEX_op_br &&
+                label == arg_label(op_prev->args[0])) {
+                tcg_op_remove(s, op_prev);
+                /* Fall through means insns become live again.  */
+                dead = false;
+            }
+
             if (label->refs == 0) {
                 /*
                  * While there is an occasional backward branch, virtually
@@ -2661,21 +2677,6 @@ static void reachable_code_pass(TCGContext *s)
                 /* Once we see a label, insns become live again.  */
                 dead = false;
                 remove = false;
-
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
-                        tcg_op_remove(s, op_prev);
-                        remove = true;
-                    }
-                }
             }
             break;
 
-- 
2.34.1


