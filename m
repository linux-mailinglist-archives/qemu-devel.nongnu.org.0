Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD28F395052
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 11:47:27 +0200 (CEST)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnI2Y-00074J-GH
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 05:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnI0v-0005wW-8i
 for qemu-devel@nongnu.org; Sun, 30 May 2021 05:45:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnI0s-0001L6-L5
 for qemu-devel@nongnu.org; Sun, 30 May 2021 05:45:43 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so4829087wmq.0
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 02:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2EC4J/erMubaOu3m1nON3gbxEnc3GwM9+fThrDD6RQA=;
 b=e7J99iFVNn9j6qTqO84PEWYJMrmnFbJ97zQYHXSHBX6dI8dRQh1r9seD2vzHeZRpiB
 xv3btsI2x7vIKaRDIuvy+3jhdcsrCutbhaALSDbGSd7M+AXwWcU3BYKvoXInKTBkCa6V
 IpHoyWh8Me5qiSOhWUKE4v60z5BnX60HSq+hmpezDPtUbhwdFIbosx70B7Qele36n4wh
 KglN9yn7QmsMMdQ3Oa3coeDz3fUWqKLSRr04olB5CarRpuKjvgWjtdbWQ5iW46EzUPfL
 Xnq63iJXjqxpQhhXp+NSOPDVt0tag4tC8haPKR1IHIfSCNVKX6WuiwBdK2QTisH5hF/J
 svBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2EC4J/erMubaOu3m1nON3gbxEnc3GwM9+fThrDD6RQA=;
 b=aLYyoN6BfFEL3nq1/HJZ8dRg34535wnAYuIThn+9hh0Qy6tsrTtLEeClxJ535w2Qsr
 oO4a9lXHBfG3Qyt4nkQssCJhdu29nGWhvH2sLGLtZ/lmp9L0vVH7qtfi9zUplYZ0A0mZ
 27S/xA83lGPzlh7WvSEttMBRYugXgfqGK0VEbayM9qzHS9oyrWyl4I83UqlzANBHDeN/
 Zjpe3qFOoHrkpumUCivJ3RIVBwYIsANB3gp+7TW0pAxxuCpgC565D3jAYKIjUauLu7IO
 D/JQdGTGta7OujixWNcBQgHbLaxX2O51UNCQmCWoZLZ84uhHQgI4zhCESjoTClghQ9aW
 JwHg==
X-Gm-Message-State: AOAM530m5LkT/KwUB6rExz3athxwOuQk7+i3sRBj7FxyAXojL6jFHvyk
 wB6nLCcjKeg1vpFAZmznFnrImxyYPTrGwA==
X-Google-Smtp-Source: ABdhPJz64sHPtpoAMynOh/DxYmoEjc95oUptoZxVVVhwio0gGUxd4XyCLtwMrAYRJKge2zs4q0uJww==
X-Received: by 2002:a7b:c749:: with SMTP id w9mr2889757wmk.3.1622367940871;
 Sun, 30 May 2021 02:45:40 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a11sm13099262wrr.48.2021.05.30.02.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 02:45:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Fix TCG temporary leaks in
 gen_pool32a5_nanomips_insn()
Date: Sun, 30 May 2021 11:45:37 +0200
Message-Id: <20210530094538.1275329-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a pair of TCG temporary leak when translating nanoMIPS SHILO opcode.

Fixes: 3285a3e4445 ("target/mips: Add emulation of DSP ASE for nanoMIPS")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c03a8ae1fed..84c71a75c76 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -20177,16 +20177,18 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
         {
             TCGv tv0 = tcg_temp_new();
             TCGv tv1 = tcg_temp_new();
             int16_t imm = extract32(ctx->opcode, 16, 7);
 
             tcg_gen_movi_tl(tv0, rd >> 3);
             tcg_gen_movi_tl(tv1, imm);
             gen_helper_shilo(tv0, tv1, cpu_env);
+            tcg_temp_free(tv1);
+            tcg_temp_free(tv0);
         }
         break;
     case NM_MULEQ_S_W_PHL:
         check_dsp(ctx);
         gen_helper_muleq_s_w_phl(v1_t, v1_t, v2_t, cpu_env);
         gen_store_gpr(v1_t, ret);
         break;
     case NM_MULEQ_S_W_PHR:
-- 
2.26.3


