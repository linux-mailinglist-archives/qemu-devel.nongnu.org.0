Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777ED50BE35
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:11:47 +0200 (CEST)
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwos-00063G-6N
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWr-0000sl-EU
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:09 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWq-0007Ft-0y
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:09 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d15so12081761pll.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6UYSlRGZfhDryiA9u1wA9vZSGmpcy5aRg3TaG0SXLQ4=;
 b=PZfOO4AMGrpELFvOUr3lygr5vpSb4R9fbKALp+uFhJvHzV+Z1FPaO/15r+EeySd/2w
 AYx/Wz60DRQqBPiSrwi3kpKNU9VCXi0jRo4A1jYrVJxMNM8gwU3LmN4AKU0Sc2LwHRgI
 ARatgfNznMBsCaAcDG+KwzT1k9gmhP4ccYt5DpWVuje+X0QBdx9B17FkoKvJqgQtGN0s
 zGg/FZoz0aPRB99Wzr6QdtpVGhfEpka4stp7vqDU0VnM3fl/u/+cZhV1NEpT4GqhZNb+
 MOfRdaf5XrOmKgywojFriEVA3b8Pl7G41euVRaKermKOpBZznH05AKPa0VyTAN/BOrij
 UkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6UYSlRGZfhDryiA9u1wA9vZSGmpcy5aRg3TaG0SXLQ4=;
 b=pERF8pwNDf9gylc12cJ6liCZmNlS00+YwDC0dZR/Wj8hMZ6QWWtRqsb493cEpFsh/r
 Em4QBetTJJtR1b3qsw9Q24axVa1jnLVW7Slwms1uTZT+o+bHbweV0aS1uW2xoK3asMa+
 VMF3UQT6PRFmX8NeaT7qh8vlOyFxHKpAmkAETJm45VhrW1IgK6GX5RHdG5bipRXukiJw
 c+Y7jaMWDoxMhpD4xslj78n1nCS2l9/g1y4hLbXuwcw4+MhvccTP+Yu+CRKTgLYP7KZj
 aafL2N6QksFPld7ot+FsI55B0Bal+vGBZbY1WrMFmDn8mSSv+O1XoBlUKDuUoQrbM0tV
 ZnLQ==
X-Gm-Message-State: AOAM530kp3Tq8yLj+JGoeGSVO55wqyOkcthaBNtdHB4fiPm4aqhtSZYI
 VLU1cBPoe/LC3F2V150U8slI+cydl9mIxURw
X-Google-Smtp-Source: ABdhPJxOMxH9vsm1a8zzU0VD5z/pfVFpbVOYb/yQuAr3yGOaZX5vvrSDq3qWPhHHelbHgggHC6lnMA==
X-Received: by 2002:a17:902:820f:b0:158:c308:d4c5 with SMTP id
 x15-20020a170902820f00b00158c308d4c5mr5176196pln.155.1650646383955; 
 Fri, 22 Apr 2022 09:53:03 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 13/68] target/nios2: Check supervisor on eret
Date: Fri, 22 Apr 2022 09:51:43 -0700
Message-Id: <20220422165238.1971496-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Message-Id: <20220421151735.31996-14-richard.henderson@linaro.org>
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


