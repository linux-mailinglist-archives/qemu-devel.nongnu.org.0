Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAD564BE92
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:37:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Cmf-0000b1-Qa; Tue, 13 Dec 2022 16:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cme-0000aq-BK
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:52 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5Cmc-0003D0-Qc
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:25:52 -0500
Received: by mail-oi1-x236.google.com with SMTP id l127so1027872oia.8
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqkUbgBv122Thnf546PHquT7r6o6Y94wYiKV+lBMbFo=;
 b=cT8jZ6EFQ9OPoDOINglVzMKkw4wuswZtoI/gnMYY5sAI03Vsahb0GVBaqfKRZJEFzi
 /5eDN/DdUgROXToXW16+qjF/U/XnznuWhPslNlpwiYqT9ikvKAjvLGIpOoufRP2p7m+m
 HB6fN0sHSwyORKljizgdyPEAAfe8fPl5nQa61BBcPBsRojM2+E/Y6/c0Grsx0Cng1bH2
 E7mntDxzWlYiN8+RAwjH+7PJEECtT1TpMJjCbkYxK4/7sTfii/6Z67OtuqiAeeucdVHR
 owfD+el12GVYbN68RqnevrnvpMxJOxGiyEFGO6SAn5pt2f6kTaHXUYl7fMd60RvNhrp+
 qS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RqkUbgBv122Thnf546PHquT7r6o6Y94wYiKV+lBMbFo=;
 b=I9kAVxnwo4+uyod2Gcf85WD3jC1Lkc3Kg4IaFvLH8TuMXIrBhTXS/T23fwpcdZKgWf
 b/r/qGf0YzlAWLjwcNjH8+USp0t7mCx+2cDlmTU2qMunfjBmAve22+KBNMknc90ONCzn
 8RahkyLCPrsk9qIYXY/9SVFEjNsAPMpTHpEJY0V1HY4svX1Z7oZDU8no9YmH2DdQy1w3
 kO1no4tIXJY7KSk5iW4O8Rd0ELaI9r9MyUT2PMo8CGcITAAYil7/BYjzhb1i98AJMIQb
 PoY4zmD99NnEe18AkWpzMf7eFIEHa30X1viUYh4HSWKhiCdFs9AVCHkutAmvDrLWnKuy
 Fzpg==
X-Gm-Message-State: ANoB5pmPUf7Kr9KlvKqEqwxMIOro5SGHBag9N9LnrBIp3pGR4u0RmhpP
 wFty6I9bm0mQ3SFHYTbh9GIIKYwUUfjQCut+mtE=
X-Google-Smtp-Source: AA0mqf5cZhTlplP3K0cz8wzpzaHoggX8D1f8ggvNKpcD+4ly34cmSq19e8qxx8oawsFDZRtMjZNhAg==
X-Received: by 2002:a05:6808:ecc:b0:35b:d885:97c with SMTP id
 q12-20020a0568080ecc00b0035bd885097cmr11607416oiv.53.1670966749421; 
 Tue, 13 Dec 2022 13:25:49 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a056808098700b0035c073aa0d8sm5006831oic.18.2022.12.13.13.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:25:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v4 06/27] target/sparc: Avoid TCGV_{LOW,HIGH}
Date: Tue, 13 Dec 2022 15:25:20 -0600
Message-Id: <20221213212541.1820840-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213212541.1820840-1-richard.henderson@linaro.org>
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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

Use the official extend/extract functions instead of routines
that will shortly be internal to tcg.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/translate.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 34858eb95f..150aeecd14 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -163,13 +163,6 @@ static inline void gen_update_fprs_dirty(DisasContext *dc, int rd)
 /* floating point registers moves */
 static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
 {
-#if TCG_TARGET_REG_BITS == 32
-    if (src & 1) {
-        return TCGV_LOW(cpu_fpr[src / 2]);
-    } else {
-        return TCGV_HIGH(cpu_fpr[src / 2]);
-    }
-#else
     TCGv_i32 ret = get_temp_i32(dc);
     if (src & 1) {
         tcg_gen_extrl_i64_i32(ret, cpu_fpr[src / 2]);
@@ -177,22 +170,16 @@ static TCGv_i32 gen_load_fpr_F(DisasContext *dc, unsigned int src)
         tcg_gen_extrh_i64_i32(ret, cpu_fpr[src / 2]);
     }
     return ret;
-#endif
 }
 
 static void gen_store_fpr_F(DisasContext *dc, unsigned int dst, TCGv_i32 v)
 {
-#if TCG_TARGET_REG_BITS == 32
-    if (dst & 1) {
-        tcg_gen_mov_i32(TCGV_LOW(cpu_fpr[dst / 2]), v);
-    } else {
-        tcg_gen_mov_i32(TCGV_HIGH(cpu_fpr[dst / 2]), v);
-    }
-#else
-    TCGv_i64 t = (TCGv_i64)v;
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_extu_i32_i64(t, v);
     tcg_gen_deposit_i64(cpu_fpr[dst / 2], cpu_fpr[dst / 2], t,
                         (dst & 1 ? 0 : 32), 32);
-#endif
+    tcg_temp_free_i64(t);
     gen_update_fprs_dirty(dc, dst);
 }
 
-- 
2.34.1


