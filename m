Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA0E5F5FE4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:04:42 +0200 (CEST)
Received: from localhost ([::1]:35484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogI7l-0003bI-Db
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoK-0004BA-CP
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:36 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoI-0003u0-AM
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:35 -0400
Received: by mail-pf1-x429.google.com with SMTP id i6so936980pfb.2
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cdk+wqhXrtt2egBbh65dqBvCP5p2fyN7igj25PdmOsY=;
 b=YJbQNcKfU2EaOAXioXTiSWKd9zjsuzXy0q9kTPrVfLeL/qfnBi72PXkk6tLSoKh51f
 VQosDBl4RcgrmEPjlp5he/BQO+qxqe+cDl1dYBuileCQADnMGAuR8u9R1X0N/7FzmNMD
 M14fBGp5gXa0rT6M2CL73vctuY3/ATC/6BaPlwtSDIPDfVq/UKZ62DsWB7zCzkvSkwUf
 ioICgNrrVsgl0dvNX/wj12bDSnHgsXbgiiOt+8vweiqD53mNj5SLGpppY7y0qxShBNvR
 S4umJ/jpcbzEkwWfX2AJ2EhXmefYKLateO8nAsdQ+fd87b7Y6Njrea4FJDF3KSZRzHzu
 vq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cdk+wqhXrtt2egBbh65dqBvCP5p2fyN7igj25PdmOsY=;
 b=EF2KeL3Oy+PZ33psOpEV2DrSXOWTpchHVYy/wP7jWxhWlGSzMFg5lIuSrIm3S4R9CU
 ZNFXTKYXUAzL17kI76ot+kFAmBjggxL8ToY0k/XJycU+DYL9r42sPF1ScjAvMBq9Iz8u
 CB1jwS71ZaI6AvKoV8l2wBWJR2s/VREecv7koTlO6KSlULpHpDKWtgW8606rFaJLGRsQ
 xOD/m3QIWgdBB0AjSyK2BYI0dybkgoTRmp6eSGUFOLYb/U+B+Z+xjTHpvKFdkyrX+0Qx
 4BBYykrwkEQ/oGmFlPtfVuzmu7fJ6lPp8gqLCpAmOeQAimO1iTTxCsnfkuXi3orkVsdb
 PClw==
X-Gm-Message-State: ACrzQf1ya5+H77SJE/kepnBOZiA3FtQvh/xh+mzJMaUN6NBfMYFyS238
 mHvAAyDFnGugPUmO8yLhemY1DYYX0htNdw==
X-Google-Smtp-Source: AMsMyM4jdgnSzbisfG25+PGxSUOxAAa3Y1rAqSUXtVWjaS4cm3x6p182UcHVVK8bEUyPnaxElANqKw==
X-Received: by 2002:a63:eb43:0:b0:447:f457:fa83 with SMTP id
 b3-20020a63eb43000000b00447f457fa83mr2671086pgk.573.1665027872741; 
 Wed, 05 Oct 2022 20:44:32 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 10/26] target/s390x: Use gen_psw_addr_disp in op_sam
Date: Wed,  5 Oct 2022 20:44:05 -0700
Message-Id: <20221006034421.1179141-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Complicated because we may now require a runtime jump.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 40 +++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index ad73a64b05..2ea3feb803 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -3922,7 +3922,7 @@ static DisasJumpType op_sacf(DisasContext *s, DisasOps *o)
 static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
 {
     int sam = s->insn->data;
-    TCGv_i64 tsam;
+    TCGLabel *fault = NULL;
     uint64_t mask;
 
     switch (sam) {
@@ -3937,20 +3937,36 @@ static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
         break;
     }
 
-    /* Bizarre but true, we check the address of the current insn for the
-       specification exception, not the next to be executed.  Thus the PoO
-       documents that Bad Things Happen two bytes before the end.  */
-    if (s->base.pc_next & ~mask) {
-        gen_program_exception(s, PGM_SPECIFICATION);
-        return DISAS_NORETURN;
-    }
-    s->pc_tmp &= mask;
+    /*
+     * Bizarre but true, we check the address of the current insn for the
+     * specification exception, not the next to be executed.  Thus the PoO
+     * documents that Bad Things Happen two bytes before the end.
+     */
+    if (mask != -1) {
+        TCGv_i64 t = tcg_temp_new_i64();
+        fault = gen_new_label();
 
-    tsam = tcg_constant_i64(sam);
-    tcg_gen_deposit_i64(psw_mask, psw_mask, tsam, 31, 2);
+        gen_psw_addr_disp(s, t, 0);
+        tcg_gen_andi_i64(t, t, ~mask);
+        tcg_gen_brcondi_i64(TCG_COND_NE, t, 0, fault);
+        tcg_temp_free_i64(t);
+    }
+
+    update_cc_op(s);
+
+    tcg_gen_deposit_i64(psw_mask, psw_mask, tcg_constant_i64(sam), 31, 2);
+
+    gen_psw_addr_disp(s, psw_addr, s->ilen);
+    tcg_gen_andi_i64(psw_addr, psw_addr, mask);
 
     /* Always exit the TB, since we (may have) changed execution mode.  */
-    return DISAS_TOO_MANY;
+    tcg_gen_lookup_and_goto_ptr();
+
+    if (mask != -1) {
+        gen_set_label(fault);
+        gen_program_exception(s, PGM_SPECIFICATION);
+    }
+    return DISAS_NORETURN;
 }
 
 static DisasJumpType op_sar(DisasContext *s, DisasOps *o)
-- 
2.34.1


