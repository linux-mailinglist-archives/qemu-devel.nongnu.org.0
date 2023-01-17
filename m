Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E25670CE5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 00:13:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHv6m-0003Rd-Ca; Tue, 17 Jan 2023 18:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6e-0003N5-UW
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:05 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHv6d-0001Iy-6W
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 18:11:04 -0500
Received: by mail-pl1-x630.google.com with SMTP id p24so35078261plw.11
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 15:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OhlXNm9D8DQ2mjuxBN4Ft6JpruPMQiHKfihtVFgq2XI=;
 b=w7Ij5+/HjF2usqrcsqYvLMBTaJETfPqBBKyDK6FuRvyJbZ/+T3GVuNJCnYoAH8udzo
 oNILjeotS+U4iuTrG7C5TPIiSRZdgzVkp5CywYLkavD+ay5UskKQJsaP9TVSrmJkbBnj
 soB2uATd7yFoz6KbhLD9qBMHUoYo63ToBYhlPzOyt0K1pydbnTtx5CjXmz6ySVToqFIs
 lbZbtG2i1BE5Iv5DIa3wdPbkbzJUt+hjXd6DAeiSTsSk1h2UTrYtdvI/OsyJchUA/w6U
 Uuxut1e/UMKLbc5hFMsvZR66KvU1IAGreo0CckVUnyRPwXdtSSdbGc+MZtJQXENI1aiL
 mdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OhlXNm9D8DQ2mjuxBN4Ft6JpruPMQiHKfihtVFgq2XI=;
 b=amQjKGHsPY9Hra7ZOISi6MESrGLXN0W7+7XfJU9imirDOrTZzajjWdX2KDa5mLPxfh
 oHNKolHFy9qWHiNj5qizlREiQy5T6Rb4ujsBHOxmKzv0OjeVscewYZhPS4WN4KVvPC8h
 nzKbdpcUqOJ+vUQQ3Fn7B+isnjlVjoDjtJyASmQ2lraIE1bbWOKSO5kQclxpr/Si20YR
 loUxcagd2MClqUSv8pMhv2OovDPI8mxcnOMKGtTn5lfYrjjNTtr7/TajTVLNla0c7Anj
 EynH0bwNRUwzD04NgwIrvAj+75f1atmcly3h/xJh4aLU95qpb2xNRYe0Uhiluye7Wf/6
 7iGQ==
X-Gm-Message-State: AFqh2kqWXtYSAdKLMpulG/CLw3sB7ioB4+/+nRN0Mo/e+T0dzgtDsQDb
 FoYSmfOaoKLcSfrJiAuXxH2NSUwAz14hWBrn
X-Google-Smtp-Source: AMrXdXsBiYlJCBmvJyMesemt2amWxcOvY7P6wataQIlCrzCqxeM3Q4hoL+UEEJMZTgEe1FEyZrnmrQ==
X-Received: by 2002:a05:6a20:ce43:b0:9d:efbe:2066 with SMTP id
 id3-20020a056a20ce4300b0009defbe2066mr4315396pzb.28.1673997061768; 
 Tue, 17 Jan 2023 15:11:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 b193-20020a621bca000000b005810c4286d6sm20747070pfb.0.2023.01.17.15.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:11:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 04/22] tcg/sparc64: Remove unused goto_tb code for indirect jump
Date: Tue, 17 Jan 2023 13:10:33 -1000
Message-Id: <20230117231051.354444-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117231051.354444-1-richard.henderson@linaro.org>
References: <20230117231051.354444-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 41 +++++++++++-------------------------
 1 file changed, 12 insertions(+), 29 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index d2d8b46815..26b00d1638 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -537,17 +537,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
     return false;
 }
 
-static void tcg_out_ld_ptr(TCGContext *s, TCGReg ret, const void *arg)
-{
-    intptr_t diff = tcg_tbrel_diff(s, arg);
-    if (USE_REG_TB && check_fit_ptr(diff, 13)) {
-        tcg_out_ld(s, TCG_TYPE_PTR, ret, TCG_REG_TB, diff);
-        return;
-    }
-    tcg_out_movi(s, TCG_TYPE_PTR, ret, (uintptr_t)arg & ~0x3ff);
-    tcg_out_ld(s, TCG_TYPE_PTR, ret, ret, (uintptr_t)arg & 0x3ff);
-}
-
 static void tcg_out_sety(TCGContext *s, TCGReg rs)
 {
     tcg_out32(s, WRY | INSN_RS1(TCG_REG_G0) | INSN_RS2(rs));
@@ -1463,27 +1452,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* direct jump method */
-            if (USE_REG_TB) {
-                /* make sure the patch is 8-byte aligned.  */
-                if ((intptr_t)s->code_ptr & 4) {
-                    tcg_out_nop(s);
-                }
-                s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-                tcg_out_sethi(s, TCG_REG_T1, 0);
-                tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
-                tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
-                tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
-            } else {
-                s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
-                tcg_out32(s, CALL);
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
+        /* Direct jump. */
+        if (USE_REG_TB) {
+            /* make sure the patch is 8-byte aligned.  */
+            if ((intptr_t)s->code_ptr & 4) {
                 tcg_out_nop(s);
             }
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            tcg_out_sethi(s, TCG_REG_T1, 0);
+            tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
+            tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
+            tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
         } else {
-            /* indirect jump method */
-            tcg_out_ld_ptr(s, TCG_REG_TB, s->tb_jmp_target_addr + a0);
-            tcg_out_arithi(s, TCG_REG_G0, TCG_REG_TB, 0, JMPL);
+            s->tb_jmp_insn_offset[a0] = tcg_current_code_size(s);
+            tcg_out32(s, CALL);
             tcg_out_nop(s);
         }
         set_jmp_reset_offset(s, a0);
-- 
2.34.1


