Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5B450A5F3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:38:31 +0200 (CEST)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZp8-0001zt-An
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd4-0005SR-AA
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:58 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:45732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYd0-000780-Vl
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:21:57 -0400
Received: by mail-io1-xd36.google.com with SMTP id z19so1030103iof.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yM5/IXlcmLh5dqa/bpkHel5N4l6bVVM680j+tLWxiUU=;
 b=ypM2Zrg2wnBTjODswPX3aoBkhXutqhjJ2EUGx/xCKUBA1kb1d+WhdBjGuAJGXrbbZ1
 JkE3YKU7TUDlz3df878Ji3Cg8SH/GW+9qPy1neJUespCuNElOMFYad00EBtxPUYY5JI6
 ltvZQrNklHR1u/0KCIh2PjzniCZAjyElepEbgrf2ddPcw4niNw0za+0J26TYPqCK+U6C
 ZhT5RAA9hZEfWk5GMfStM2YoM+Rc48ptR4iOOC/z/lw1R3bCf9Fvcr1gIGUOHsy69r6B
 YSEThtSJwwAyFDn7cUMVWZqVSnA6KH3ETrdzn4Z9+UbdNp3l98ez30GW3uyHab20/W0V
 2MkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yM5/IXlcmLh5dqa/bpkHel5N4l6bVVM680j+tLWxiUU=;
 b=dt/RmeWk2LbGof19av8WZsX/MCIdM8PHKICv6K/x52ZN1xY2HUfK62W9bcOnoQkVUj
 SZW8iFLSopEWTa879bwRmpBcMYsCml3oomhZP+GjUCGRSeQTSsSUYkoUxpU/wyCyHjkv
 B+MgQ3xE5RDGxD1xVbs0TlWQ+NTzfiUhtBJhktAItFowUM9+sqaWo7mUBI2F205DjV7I
 uek5tg/2q5mwkE7izn/a/PzZ9CFXI/vUXATwArYvWvsogjyb/035RjqA32K1aPh2/p7f
 TN6yqvYs/agHfa+tW00Ao+BScZ5T2zO0/KUnHlSmQ44VGNCGDe0QSptE7xn2JLnDiXpt
 5sbA==
X-Gm-Message-State: AOAM530naG0lHID4lXSrDLB3X6b9pH0vGfHQuqJvg3EKAEqr0/B5XGvm
 D4c42hGyW0T/U/6UZiKrYUwvLV5U4mYIwg==
X-Google-Smtp-Source: ABdhPJyf+fz5J6QtdGiWgl1PTy538JjaBHkovOsyiF9kIqiIBEXROMaYbDlpLaRnYy0Le+m2jgl46g==
X-Received: by 2002:a05:6638:144b:b0:321:589b:a8ea with SMTP id
 l11-20020a056638144b00b00321589ba8eamr53623jad.296.1650554514053; 
 Thu, 21 Apr 2022 08:21:54 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a926e01000000b002cc52449a19sm3985402ilc.35.2022.04.21.08.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:21:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 50/64] target/nios2: Use gen_goto_tb for DISAS_TOO_MANY
Date: Thu, 21 Apr 2022 08:17:21 -0700
Message-Id: <20220421151735.31996-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd36.google.com
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
---
 target/nios2/translate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 1686d2b82f..c9b5de2981 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -904,8 +904,11 @@ static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
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


