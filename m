Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0236593CA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:22:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2sN-0003rw-RH; Thu, 29 Dec 2022 19:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rX-00039O-4w
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:05 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2rS-0002k6-68
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:03:02 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d15so20366259pls.6
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mg8MgGwO6jjwnW8nsumFgvs1cdVJMS+XlnPx9WvPnOA=;
 b=pEOa2wPaBsS3NLwY8gsUY2XRYZ4dG/tsoWx5c3orahVx6Y7lejdgvBFdHKCFayk6cB
 Hj/NLOY8YEU1lRVQ2yOaBAxTxkvJEm8GC1k547Z0U2Fk7QHrZHllcW8KBI9mMDqTZK2K
 T+/LWriI9vw6/wynBbd1rHDizAy2oEgGUKRShO1V3wWZtwytnEdJaTxJXs1QdgB4ITGi
 KLf7QDHveGiaauoaxUZyN9U+4mRcRP/yJXieNrLbG9tCSlrzOdj3ijowLY7QEw0Otrtv
 2qGpRRvezhQ3PYGZJ9e4fGj9rgawDvGScO4zbEHrWp/u2Ol4QHJKFvJTQdfpuuL287Cs
 3GFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mg8MgGwO6jjwnW8nsumFgvs1cdVJMS+XlnPx9WvPnOA=;
 b=Wj/G1y63Czx0/h2QWqASKQFv7/9eaiqtlCl//7/CcaKXd3V1nrHvsLiSlMc/yERwN2
 T0ZYceSwtvDIE4EdQvRxW2PXrMyF4ylvNh5/ZU/kCBYdXmRwRTX6h/BYH80nLTjjOWr6
 10sRH+zQgjAnwd9uV0K16gXhbMZqtub4UFjULu29RZ9hwnfzXhdtkUjVgw68QKbZhAdV
 NWDxUf4vHJz0c7fEL2h/XdlIPG7PpLPznj50EbFR9HCOmVC/Bcv8dG+zevahCL621Ygs
 5SGOu50/a4gz/M1bj8CFI0/nhfyqQovoco251v3G4tswQEtDuTwd0IjVNeB216/e9mBO
 fTtw==
X-Gm-Message-State: AFqh2koJXPs+Vphdaz1frBrsEfuQnrQBREtTkWeRTIXbJK/uYO1FwZOg
 iB3l1Zl7M+grIq6X7EHbtvSrBeKr7lEl+Y1Z
X-Google-Smtp-Source: AMrXdXvSxnnETyd8+GX2r8BG/0OcTOWyfYa+LBBRAF5/zIssDz2WEKUC7OSi0Q6fYzrVPvcGQWgBoQ==
X-Received: by 2002:a17:902:da86:b0:188:f570:7bdf with SMTP id
 j6-20020a170902da8600b00188f5707bdfmr42104367plx.40.1672358574143; 
 Thu, 29 Dec 2022 16:02:54 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 34/47] accel/tcg/plugin: Use copy_op in append_{udata,mem}_cb
Date: Thu, 29 Dec 2022 16:02:08 -0800
Message-Id: <20221230000221.2764875-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


