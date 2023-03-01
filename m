Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06216A660E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:00:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCf8-0002Le-Tt; Tue, 28 Feb 2023 21:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCf7-0002Cw-6Q
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:49 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCf5-0003Jo-9n
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id n6so11178862plf.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krNMuzPiCobn56SlmIYf/PRBtrXsN7JQ0TzAirhgLBc=;
 b=dR3IcZ+tbUgEiCOHy6CXhkFSVsWobdene7EX/3B8S7+xMQOZACDwF4kE1/5B5kQGAs
 S4afR+M7jxOrsl7IYPzNaOt6KB+4H6Zo+azNq9TIcknKOjBdivTiamjKVC3vz1kyZYwx
 G0c0LOB3fz10BkngFyk3dJSZrPwoR1pLMjHvp//z3OjlRe6K82WtcG8iWzTqHpzDA1C2
 7P8L32w/npG9xa3l20st/YfiM2BSahKSacFCosI4wnBcBEUUVuG7w0vbh5iuFsHYOg0/
 PbriF1f5yD75TV8IXduBry0iuFrcALqx4OTX2Ijrbd/HajI1vUJoVIu+JB0Zq3dgKuNd
 YHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=krNMuzPiCobn56SlmIYf/PRBtrXsN7JQ0TzAirhgLBc=;
 b=jXkdEEcsp3xnH8bz0+Gdd+3iWdp7buJU9o2q4g55rT5l8cflJnFwdwaGeeI9Z3StP3
 z8JPk3RwTjOQEn+6mFBFvhmFM5pIqfNGcNnQva4Xb6zaNpNll65e9QW6UU6uYcegDDWC
 oIYXBry0Elz2s44JA3HiNadXF9tU7b1NlihyeHR8wq+hl3FI4KYdco0zjhQUXNaWUb0w
 xS9EcjS6QxLF1S9roQhFokJ1BNo7y1alKEvItlaOsHrnDv+e1+9qJ9N+DFNFWquO5IWW
 aYkESToOvlZW0eGGZH52pMtzfFgriCORXWjzskYsH3b0GYXJlBDLIXlZuyo04JdiXOrm
 NWOQ==
X-Gm-Message-State: AO0yUKVom67mkPzoGJOrdCgWw5J/+/2dEaEfj3oNttGUxGn1vqUvJVHj
 TSLQoBNyf9zkpfIFyts2S/rSQg1sIjxTHAXba7I=
X-Google-Smtp-Source: AK7set9uo58sNBiykEVFSXFSFbcE4tEjPLlSEB2PW9CyaFCn376MEutK6C/JeZiIsy5T3lOmacqJ0w==
X-Received: by 2002:a17:903:1110:b0:19c:ba57:a869 with SMTP id
 n16-20020a170903111000b0019cba57a869mr5001911plh.13.1677639465883; 
 Tue, 28 Feb 2023 18:57:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 35/62] tcg: Remove branch-to-next regardless of reference count
Date: Tue, 28 Feb 2023 16:56:16 -1000
Message-Id: <20230301025643.1227244-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 855e4cc537..9739e4830f 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2637,7 +2637,7 @@ TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *old_op,
 /* Reachable analysis : remove unreachable code.  */
 static void reachable_code_pass(TCGContext *s)
 {
-    TCGOp *op, *op_next;
+    TCGOp *op, *op_next, *op_prev;
     bool dead = false;
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
@@ -2647,6 +2647,22 @@ static void reachable_code_pass(TCGContext *s)
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
@@ -2660,21 +2676,6 @@ static void reachable_code_pass(TCGContext *s)
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


