Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BED1430437
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:33:33 +0200 (CEST)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboUu-00025U-A3
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDc-0008ON-TC
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:42 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDX-00025r-Fx
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:40 -0400
Received: by mail-pl1-x636.google.com with SMTP id s1so6669649plg.12
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JJxLTlxFu0AfTN8BnVgjMTGGYMK7HKK3rg1mTzBv8V4=;
 b=dBTxRx5kdQAYhNnYlq9R7FHU41IPzOxuDLP0gPUn5FAwrX1LoyEMdJWz6t5B2VbDJv
 EMlYFRIP5zBUNGUKzI0zizxVjvMK+Bnq191MdrV4a/Irb2lp+g2vdKsV3fGTHBzIWItj
 funCHDrfV4oQhPexqmZBt1mMl0vq5yO9nJubAQxeknmlSTOjI8TNZ/TvdNLm0tpbH2fs
 HYIyJBaT7CzdYVW1oPukJ1D1cQftB5ArwrwsoKqZ9xj/AMMd0n5bhMbklTG2Jr12P2ph
 /BywkQQGpVFv7pDTTdb4QlmI6mKFuCXho0oyX9Ie4FebtRtnljzXxWNBMNPgXRKt6kTm
 /zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JJxLTlxFu0AfTN8BnVgjMTGGYMK7HKK3rg1mTzBv8V4=;
 b=xxNr2Vpt0uxqIqblQxKR3gmLlBWz1D/nHZvq2EIPXJbba1Mee4oqjDvlrJc+3TV7Et
 ZmDVnXlQhmZBPtE5Q7/bMNjq5fFUCw+kHH24RUuazW0tiWYVx98SYz4UVeT7B0NUsClE
 c1TJa+cGFM/HwLeb/oS4gS2PVCOAbTzKf0xfrN6+N7zp4Dhw58NNWHTRm2xVjQ4Wr+xe
 k5G2SGv9KUeeMA/o+NK2+owgDUtHx06kEK9fmuz8zbDLZCrVJ3OCq3dr7cl6TpuD/EKF
 EesTseqhBrHQMhKBd0CVN7d31GsP+LDPrIqvEDXF3otumleqSuY4d5nviSruxsmH66aL
 AqGw==
X-Gm-Message-State: AOAM533TFhhsHfk7CfNOJH2uSF2JTZ5hOXMblWKuAvZKP/G41ICJIOMI
 frTBb6XFJQ1h/i1u+5lglTFqnvLkfiM=
X-Google-Smtp-Source: ABdhPJyooHD2z4SxBdDqPWxR5+UbNOl1D6kIqLVIlPlBh0Cl8kqlYyOYUYgnCkj0w8L1KI+zeZBJCQ==
X-Received: by 2002:a17:90a:a41:: with SMTP id
 o59mr36568579pjo.243.1634408133901; 
 Sat, 16 Oct 2021 11:15:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/24] target/s390x: Drop check for singlestep_enabled
Date: Sat, 16 Oct 2021 11:15:10 -0700
Message-Id: <20211016181514.3165661-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a2d6fa5cca..dcc249a197 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -149,7 +149,6 @@ struct DisasContext {
     uint64_t pc_tmp;
     uint32_t ilen;
     enum cc_op cc_op;
-    bool do_debug;
 };
 
 /* Information carried about a condition to be evaluated.  */
@@ -6544,7 +6543,6 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
-    dc->do_debug = dc->base.singlestep_enabled;
 }
 
 static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
@@ -6596,10 +6594,8 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         /* FALLTHRU */
     case DISAS_PC_CC_UPDATED:
         /* Exit the TB, either by raising a debug exception or by return.  */
-        if (dc->do_debug) {
-            gen_exception(EXCP_DEBUG);
-        } else if ((dc->base.tb->flags & FLAG_MASK_PER) ||
-                   dc->base.is_jmp == DISAS_PC_STALE_NOCHAIN) {
+        if ((dc->base.tb->flags & FLAG_MASK_PER) ||
+             dc->base.is_jmp == DISAS_PC_STALE_NOCHAIN) {
             tcg_gen_exit_tb(NULL, 0);
         } else {
             tcg_gen_lookup_and_goto_ptr();
-- 
2.25.1


