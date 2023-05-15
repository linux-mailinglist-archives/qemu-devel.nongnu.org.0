Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD1B70300E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:37:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIc-0000F7-3v; Mon, 15 May 2023 10:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006xy-Na
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGZ-0004yl-GR
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:46 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1aaf706768cso98045135ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161213; x=1686753213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXvb5M+QQ4GlJC4+AWTZXZCLTvkRCJufT4wwLa/Umbo=;
 b=s4NhjvT2n7X+pja39Pi4BDc1sNK7U0CQVYP46Ulru9k1GoWMfgt59ssGik9AVDTNWg
 vbfm0HVMdgLD6Yvghnb8VABMDYUed5x9qeu4mMimczP/Q/Cw43VuPYlwejpOwwhdIrQQ
 xa0Xnxh//jtRJgKj1rGnYMFjYG2KKbbMZYZJhSW6p/i3DJho7xqIjvNex9O8MLXgd2cL
 Inw0IkGguUeaxzjxUAExJiaX94/lelPAudR1q2bkXDvzLEoJ30BNsTHn0k7r/qeNLmGY
 RtFzvUKxIbO2IWH2NS/wQ9BSiBhcnuU+kiRBkmY3sptzTgbmTn5P9nJwy8uv2LiBpEPQ
 UVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161213; x=1686753213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXvb5M+QQ4GlJC4+AWTZXZCLTvkRCJufT4wwLa/Umbo=;
 b=GvAFvVvrpPbkdvY3UEYIPHZCz0svVa4djv3HZsyGZAnT7iO3YJR6Q/6YIqucePE00y
 FycUE5Zx08rHOtfIIQbfJ6Le/2N8no5ngjV+OTu3q3mEaTrFIdZ1OLxh/zTHIIwIibrf
 5FLNai4Sq4m23TCt6RQkBZAtJJO6QJnOrayMy6wmH/ey1WeWR+bkiCclw2KQR+w+/hhh
 Vgn+iZ4iGibuTzWVvPt6oFn+eEKAURJZRGCHXiujEaOols+6O112up29+ey+0XagnPN6
 FafCLPUkOMAghtZWEuB8qN+pZejiK6CK3ap1vsI/Jq4aTe0bjFUZoy1EyVjIyLoiiOIV
 Npfw==
X-Gm-Message-State: AC+VfDzBtOkXNp8Ya3nd4KW5khvpG0ZgEOImutj/PgM8r9CdOU4HzdrZ
 ak2e0R448mwbdhNXqnwuTxBSSdL0jNCtujk6Vbs=
X-Google-Smtp-Source: ACHHUZ6VWzp7P+L/FXcwkyiXwZ1sWY9WYU5kGD9M8urESd+O2Ob1kz3ADsplfX32I0HQrEX9yqg/7w==
X-Received: by 2002:a17:903:1247:b0:1ab:afd:903a with SMTP id
 u7-20020a170903124700b001ab0afd903amr44833633plh.24.1684161213068; 
 Mon, 15 May 2023 07:33:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 21/54] tcg/arm: Use full load/store helpers in user-only
 mode
Date: Mon, 15 May 2023 07:32:40 -0700
Message-Id: <20230515143313.734053-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


