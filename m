Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB7D5108E2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:21:55 +0200 (CEST)
Received: from localhost ([::1]:51888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQl0-0005EK-8h
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPq1-0001s1-Dh
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:04 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPpz-0005TD-UE
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:23:01 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c23so31033860plo.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5lQ3QQmzEghJch5edn2tjFgDaTVnAJ5/vXlb5qvEBk=;
 b=OJQl0xec91YW6WB8y4DLhAS9sN7e/Te4p4ZcA0F5mb1589SCRDwL4GS22+/S2vl2EX
 Bh5AWzkn8RI3iwqSBjJAmYEcUZ44rDboF+lJMK7h4pDcQeQvKm9MFWNYBOyZuEBw/ypX
 Psq5yuISnjrrU5WeUQKyDoJSa/0wV2g1codkE0maUrKmIM8vdxC7EJ8tXGl5n1FXhdPj
 or6ydsPC5HQxtzVAeHK/hDMowtfQxMmZAXflQlD2sfMtfCTu/CU1rVPYitPPjNQ9QyTl
 t+tzYhj3xM1XTDj45b2bMkeTHLWIQKzY/T0iDpo7KRQEVbKKzlDJYEVa8qxIgiN3ytWf
 A0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5lQ3QQmzEghJch5edn2tjFgDaTVnAJ5/vXlb5qvEBk=;
 b=z0HUsvShn5JYhsAGfzeX74FUP6z/eiceHpm75YA7S8LXswfjjhmPVxClMxcRxds3UX
 dLMdUSWPiltMJWyYBt9zA4VgrzPQhynRDI3tBmXkGCpqHejAkEBr7YUrmcDENXfLMWO+
 BOHomMRAFh0dQcLpyn4/R7HY6+E2CO+JonaNUvafIQXlQdVZgazNrfFVmhaQY9QWsBhf
 kNkvpAE1BFQHzCQqw2LgSJKYXje2q/0oNvOdV2yE4CtHJnlvgPF8ZGiS3qynBknPJjuu
 kueANXcZVQTeKpUa9MBlll9VRqpojneAefBIwT8dbuV/KrenHiGc/UUZn4ZWXJMDorIi
 +SHw==
X-Gm-Message-State: AOAM532GN9wCa7joTOWb78JvjSAvOpUZHCMiQ6S5tThohxQOJKQapBgd
 85l9vrWmzBrBlcRYBLHS4+9uiIciCeW45A==
X-Google-Smtp-Source: ABdhPJwKF8HkI5iEflnG/awNIQg2/5pC5cFKhwBtwOk02YJPfoJ0oEw1PWmrkLYgrPN1icCngx/9VA==
X-Received: by 2002:a17:902:7610:b0:158:89a5:fc5a with SMTP id
 k16-20020a170902761000b0015889a5fc5amr25217934pll.116.1650997377968; 
 Tue, 26 Apr 2022 11:22:57 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k187-20020a636fc4000000b003983a01b896sm13585053pgc.90.2022.04.26.11.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:22:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 54/68] target/nios2: Use gen_goto_tb for DISAS_TOO_MANY
Date: Tue, 26 Apr 2022 11:18:53 -0700
Message-Id: <20220426181907.103691-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
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


