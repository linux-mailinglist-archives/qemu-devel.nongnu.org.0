Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D16EE86D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:44:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prORa-0005Js-3e; Tue, 25 Apr 2023 15:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOR2-00042j-JC
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:44 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOQv-0004fq-PS
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:34:43 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2a8baeac4d1so60911771fa.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451277; x=1685043277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xpq7kVqaR8GJII9yFdioUA+mHFs0Vvahpm47qCN+m6U=;
 b=jt7TNt5DWjizBJapfZ31R5C06O4aDIUDs7PHZggrEDcEbISgEv8g25mUVe7JeZQ3hj
 7tXtcPN1cIg9OBwdbs+OcStjudqj2xKhDRWCmgeWaAdSMtxz4nGFZ8Jj4tZYVdClsxis
 EE3e2ohYoOwWaZo7svq5MvATiGurNypqgiowXqdqtwXoI1yNO1wUEV+acvL2YSdjZRu3
 XyroGDOrBZ4slsL9/U7Lci3AB+3iBoI/aZZG/fcaTRg322bQFghMsp2IH9qFl9BKu8FH
 TbpIbfo2AJHAOy9Kh/f+r1Y78Qb69tAZ56T8p9h0TfylkFbzYPOK7fLfNUoBtDLpVUGY
 tiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451277; x=1685043277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xpq7kVqaR8GJII9yFdioUA+mHFs0Vvahpm47qCN+m6U=;
 b=RGDXAB997uC4cTYtwVbl8qrp0U6P0yOPifJk5CXW70eceeoVxS/2xp35xo68CbAlZQ
 TPFh+eNq7YCpAVbLwk+MLRUvgCTsy5UG+FSocMt6aKGN5U3+AGe6RZRhMq1cJWr+9cd9
 j8GnlWw32O8l55xGURwOFXEAf3qwcMwmIV4H1yii6xHjGXPuisNOFvhDPqffc22X2kWw
 N7r9+Jpec7ns9tTN3gghNZq5W9KVZAS5vX5jj1csqnlAwlTiIPeJcH43nrizn5A6A9D7
 j4ptNIWGrb+NDwD9XOxsv565jrEcckr3rr7o9N5VTbg6C+nea3WqaCbi2rNo3ebthkRA
 +xuQ==
X-Gm-Message-State: AAQBX9dHe32HvmilIeY3WwQdbRf3YosH9it3LVHdGrard4A1K/Iug+O5
 PLIFrp1zYSldE8ww6yiBF1DbGl+yR7eoYJJetSltNA==
X-Google-Smtp-Source: AKy350bzlvDQMzCejBPQXTTRjLLrvZXmruW3HsRXZyV7/BzuMXNjAl+t2euVfq0La3cEAwOIRMjqjA==
X-Received: by 2002:a2e:82cd:0:b0:2a8:b188:139a with SMTP id
 n13-20020a2e82cd000000b002a8b188139amr3574025ljh.45.1682451276744; 
 Tue, 25 Apr 2023 12:34:36 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 27/57] tcg/arm: Use full load/store helpers in user-only
 mode
Date: Tue, 25 Apr 2023 20:31:16 +0100
Message-Id: <20230425193146.2106111-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 45 ----------------------------------------
 1 file changed, 45 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index a02804dd69..eb0542f32e 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1325,7 +1325,6 @@ typedef struct {
     bool index_scratch;
 } HostAddress;
 
-#ifdef CONFIG_SOFTMMU
 static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
     /* We arrive at the slow path via "BLNE", so R14 contains l->raddr. */
@@ -1368,50 +1367,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc24(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    if (TARGET_LONG_BITS == 64) {
-        /* 64-bit target address is aligned into R2:R3. */
-        TCGMovExtend ext[2] = {
-            { .dst = TCG_REG_R2, .dst_type = TCG_TYPE_I32,
-              .src = l->addrlo_reg,
-              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-            { .dst = TCG_REG_R3, .dst_type = TCG_TYPE_I32,
-              .src = l->addrhi_reg,
-              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-        };
-        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, l->addrlo_reg);
-    }
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R0, TCG_AREG0);
-
-    /*
-     * Tail call to the helper, with the return address back inline,
-     * just for the clarity of the debugging traceback -- the helper
-     * cannot return.  We have used BLNE to arrive here, so LR is
-     * already set.
-     */
-    tcg_out_goto(s, COND_AL, (const void *)
-                 (l->is_ld ? helper_unaligned_ld : helper_unaligned_st));
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-#endif /* SOFTMMU */
 
 static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                                            TCGReg addrlo, TCGReg addrhi,
-- 
2.34.1


