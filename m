Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6E50BEDE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:37:50 +0200 (CEST)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxE5-0000rm-JY
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwav-0000Fh-TN
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:23 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:45685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwat-00082U-Rt
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:21 -0400
Received: by mail-io1-xd2e.google.com with SMTP id z19so4612429iof.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5lQ3QQmzEghJch5edn2tjFgDaTVnAJ5/vXlb5qvEBk=;
 b=kIY0Qtz9zhbx8IMEOwJEu0blx+U7TNvmXCUAtE34VI1jHZRRFYI7v61tPXtmFcQumY
 6kztzNmLLCTbNCHcTvy2Ww7bHjAMeBWV/r92b2wZQyVYFK3mfDuoxnuOlmN9+xzPrUQb
 uwCgZfl7/e7q9so9rIftNevH8DlXVi1D0AXVkLsO/R4Iauwfea5s3CZoa7vHR0818xfd
 Trk1kEiTwBOZBeiCnZ1l1gKgIMg/tHu+NXeFAkMOANWrI8HZuyhdr+B8lmVPhjTKkWVJ
 0RYw5zTDp/KCy4+RAKJhJmHYbf2mLqkzNcv7Q5c/N2WQt2dMIyAHUMx1xkx6n2gPb84y
 Kepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5lQ3QQmzEghJch5edn2tjFgDaTVnAJ5/vXlb5qvEBk=;
 b=NYIEyq43PJTgIZNZCVKDtcrs1105EfjfCBme1B4QcyWNthvEX6hcC5RrDCVqMn+nMq
 8a5OwXRWAI5t4H0EOF88yp29CqjwptiH3djxPu8XLjPFy0IGHy4B7XQl/6Om77qk2+ee
 p2FkASnBnUFOO4XyydyEyvGVAiYttXquaVwsUO4CmW24hVqiE/hO73+K15iXN8x5lqYw
 sF8M7tZf2aGSdbR0IBdOblQI6+MxSDzG27dKXlsERx4OnLem2rJTJJh9dp0Oa3nFjK+t
 x4HBEzx4g17biO3wmAwXtPyam2BnkB1iIl4Uuki0kctaedWGxp8B5KEUqnF2s28OCYNw
 xNtw==
X-Gm-Message-State: AOAM530BjAv1oOxQXfjDMiGtzFHBIdLvTB73PcNNSG9QXfMBX8B4NeOW
 qjG0dpZnHV/mdLANsE3iLuqx+8CcpDWhg5iN
X-Google-Smtp-Source: ABdhPJyGOdZ59GH3DemWqXNeaI19iA1CrMDmgDKb+abhlLM33efyPs5sj5h71amvgDMJDTxtlKXUXA==
X-Received: by 2002:a05:6638:24d0:b0:328:6343:60ff with SMTP id
 y16-20020a05663824d000b00328634360ffmr2610318jat.41.1650646638507; 
 Fri, 22 Apr 2022 09:57:18 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 54/68] target/nios2: Use gen_goto_tb for DISAS_TOO_MANY
Date: Fri, 22 Apr 2022 09:52:24 -0700
Message-Id: <20220422165238.1971496-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the reason for ending the TB, we can chain
to the next TB because the PC is constant.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-51-richard.henderson@linaro.org>
---
 target/nios2/translate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index a55270cefa..87f3e57d4c 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -905,8 +905,11 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     /* Indicate where the next block should start */
     switch (dc->base.is_jmp) {
     case DISAS_TOO_MANY:
+        gen_goto_tb(dc, 0, dc->base.pc_next);
+        break;
+
     case DISAS_UPDATE:
-        /* Save the current PC back into the CPU register */
+        /* Save the current PC, and return to the main loop. */
         tcg_gen_movi_tl(cpu_pc, dc->base.pc_next);
         tcg_gen_exit_tb(NULL, 0);
         break;
-- 
2.34.1


