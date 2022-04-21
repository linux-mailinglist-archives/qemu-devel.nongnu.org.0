Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E555E50A486
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:43:11 +0200 (CEST)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYxb-0004YO-1X
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZF-0007EP-7b
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:01 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:40543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZD-0006Fj-Ma
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:00 -0400
Received: by mail-pf1-x432.google.com with SMTP id i24so5287756pfa.7
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ztYJkBMJIODpfPhZffINJhEEGUVQal4Iwfoe3eQ1+c=;
 b=if2kJ4tL3hbleVJoyMPVj9GfYn9YL8ID9uKIsrMkPd/9bjsnusm/4mqxuFI7HrcSHT
 qoR5Gnk8M3V4POaB5vISqoo5nJeT5rBEQRxEziWaywWEQbTiyUua8KvuSJSTwYXfvYq4
 4nQUrokkM6dMRNi3ce3bKzss2b+5GHnKft1YY8rE4ilOckaijiLb7VqTMhmDC1x7u6cS
 Fad1xaLmDHn6LLvQvNXbgqITpxDZO0acc/pDzA3p62cgvfDN2saCmDxhRMIJ6Ccp8NfV
 IQwskfDCcU7g5AV0BH16V1aScqsZbGjySHU29+VG3DTtbCtAY6NZj4vBKyCzT+WD+aAj
 Vh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ztYJkBMJIODpfPhZffINJhEEGUVQal4Iwfoe3eQ1+c=;
 b=sbYHvflf4b8ZuxdPIjOJdSBOHe18PkfO35NrvuKgooFW1fT/xJunl0AJVtOYE7qnI/
 YdCN64kuc6hBtTDzACfF0aCQMAnW2wcmdZJaUk3BQbNGaZ6L1gi8FXAP7v/uhxN2vGvA
 WFiP2rKfdH2/bR7vw2o42TjETgyl5bFsFdwz7D8sPmuzO2h5cYVgAyXf1MY+yfLryq1x
 tMaAKGwhpNFDPoOGcUinyQa3IGpCM6FQ4aILs4Bo4cMV/WT0fNSLErw1J4jZ0jl1fR/o
 yGKmYpfWpla3sI8sQ0mVYZpGL2+5lUopCp+jT+f6RYatJGxf5CikzDr6Lr0ncJ0WYy0x
 Wwmw==
X-Gm-Message-State: AOAM532Y3e9vzU78Ep4J8uNbxJOZqwwKxqJY4K/mdKNfeA1Dyw+AICan
 ME8ELvGC4l80ui8MNcMUNnA94Ofm88pdXg==
X-Google-Smtp-Source: ABdhPJxgNlz8colWarzCh9gScmhGHdMagdXZ4EEhui6G5/TkkMnH0E+opVPuWAV1u5JYYQHnOUDQ/g==
X-Received: by 2002:a65:4789:0:b0:3a2:4866:dc48 with SMTP id
 e9-20020a654789000000b003a24866dc48mr24572506pgs.87.1650554278448; 
 Thu, 21 Apr 2022 08:17:58 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/64] target/nios2: Check supervisor on eret
Date: Thu, 21 Apr 2022 08:16:44 -0700
Message-Id: <20220421151735.31996-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

eret instruction is only allowed in supervisor mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-2-amir.gonnen@neuroblade.ai>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 89b97ef520..eb97e13feb 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -384,6 +384,8 @@ static const Nios2Instruction i_type_instructions[] = {
  */
 static void eret(DisasContext *dc, uint32_t code, uint32_t flags)
 {
+    gen_check_supervisor(dc);
+
     tcg_gen_mov_tl(cpu_R[CR_STATUS], cpu_R[CR_ESTATUS]);
     tcg_gen_mov_tl(cpu_R[R_PC], cpu_R[R_EA]);
 
-- 
2.34.1


