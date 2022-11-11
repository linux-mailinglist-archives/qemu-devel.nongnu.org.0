Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE8625498
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:48:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOfs-0006cm-UQ; Fri, 11 Nov 2022 02:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfo-0006RP-1L
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:00 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOfm-0008TL-DM
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:41:59 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 b1-20020a17090a7ac100b00213fde52d49so4042615pjl.3
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hLmDMZ6Q2dYQvv5OiwJz7cIfL/6TjT5fPdV3Xfp0DQ4=;
 b=VcHJ+uLkTnF3d7zgP8Ry046aISww/6Hd1Udnlqkop4/nuqhVmcuoFvjfEbOg1xblFP
 JTdPaOEYFAopzw2AFQu1CYpNONovTGo3XamBGBL8S6QYn8+T+/uAlBYhrv7mlAcTo4RJ
 1QLCcYa50wpkYACjH0mREYjXRXtVnv3JtFR7x7OcNWNsvBYQkmS/2y+2MEp9F84pdyvP
 Sh3xDgAGUKF8/P6XwCovZmRUAr7PoNay+49e07zVw5WwiL7ydTlplaOKKN8+KbjHwUqh
 Eh0GtTTWyHTxyjSOsfGTFoWkx8SmcUn2cPx5KdnlYRcfilCgRpnn7Dl7eNKfQN4bd0SA
 CQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLmDMZ6Q2dYQvv5OiwJz7cIfL/6TjT5fPdV3Xfp0DQ4=;
 b=uOhPJOzCOBRSEoiNkDsFP+iJ2GN+QbRPrmJmqn9bKG9nXadwNN+BlHS0QJpO6dHFaG
 sOoKrWuyZDUup8gamBVJbjewYCeNKSnOGtssAiDhG5pAnlCcnIxtkHPTpEi2+vWJJDYZ
 FAVE+dCXnCzR0YnG+rr/hiPhm0ISfH6J6j3TA36ATbKUOjmfA+HtmRDjeJRv+gcP/IVw
 daw5fht7eIiVx9JzNMqMxeBfBMmy+++JVG08V+k2h12ee0WQdPiGjEbO55ny7SLkBUT9
 Sdsg+5URboC0F3VkOuSYtv93q8pIEmh3vewuLH6id20GaWQuj1yBMzMDdhoOazgvgrau
 WVhg==
X-Gm-Message-State: ANoB5pmja5JCC+KzdJMcLXfE5ugT6DKF2W9hXSY/pfALQ9w1MkVfa5lQ
 BwlQziExVoBVjRWJHaD84pO/rqZ1G70zZz7V
X-Google-Smtp-Source: AA0mqf56ShdZlZ2ABoGlJd1ibWsrujjd5CJH7z/Y601qbzgXmYES+wipXmuq0c0njMWkzTpzHYdWgA==
X-Received: by 2002:a17:902:9b96:b0:186:8558:ded2 with SMTP id
 y22-20020a1709029b9600b001868558ded2mr1400707plp.95.1668152516965; 
 Thu, 10 Nov 2022 23:41:56 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.41.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:41:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 21/45] accel/tcg/plugin: Use copy_op in
 append_{udata, mem}_cb
Date: Fri, 11 Nov 2022 17:40:37 +1000
Message-Id: <20221111074101.2069454-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Better to re-use the existing function for copying ops.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/plugin-gen.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 77e6823d6b..a6aaacd053 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -415,11 +415,11 @@ static TCGOp *append_udata_cb(const struct qemu_plugin_dyn_cb *cb,
     op = copy_const_ptr(&begin_op, op, cb->userp);
 
     /* copy the ld_i32, but note that we only have to copy it once */
-    begin_op = QTAILQ_NEXT(begin_op, link);
-    tcg_debug_assert(begin_op && begin_op->opc == INDEX_op_ld_i32);
     if (*cb_idx == -1) {
-        op = tcg_op_insert_after(tcg_ctx, op, INDEX_op_ld_i32);
-        memcpy(op->args, begin_op->args, sizeof(op->args));
+        op = copy_op(&begin_op, op, INDEX_op_ld_i32);
+    } else {
+        begin_op = QTAILQ_NEXT(begin_op, link);
+        tcg_debug_assert(begin_op && begin_op->opc == INDEX_op_ld_i32);
     }
 
     /* call */
@@ -462,11 +462,11 @@ static TCGOp *append_mem_cb(const struct qemu_plugin_dyn_cb *cb,
     op = copy_const_ptr(&begin_op, op, cb->userp);
 
     /* copy the ld_i32, but note that we only have to copy it once */
-    begin_op = QTAILQ_NEXT(begin_op, link);
-    tcg_debug_assert(begin_op && begin_op->opc == INDEX_op_ld_i32);
     if (*cb_idx == -1) {
-        op = tcg_op_insert_after(tcg_ctx, op, INDEX_op_ld_i32);
-        memcpy(op->args, begin_op->args, sizeof(op->args));
+        op = copy_op(&begin_op, op, INDEX_op_ld_i32);
+    } else {
+        begin_op = QTAILQ_NEXT(begin_op, link);
+        tcg_debug_assert(begin_op && begin_op->opc == INDEX_op_ld_i32);
     }
 
     /* extu_tl_i64 */
-- 
2.34.1


