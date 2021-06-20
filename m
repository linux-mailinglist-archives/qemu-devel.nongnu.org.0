Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650713AE0D5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 00:13:45 +0200 (CEST)
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv5hI-0004ZJ-CP
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 18:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eY-0001aR-HK
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:54 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eW-0007tK-TN
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:54 -0400
Received: by mail-pf1-x434.google.com with SMTP id p13so12221904pfw.0
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 15:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FotWsbbqFz4VjRP/kt0GkMjsWufTyPRcDViebjol4/4=;
 b=laxXVToE5b9UknWrrXrBBckbw67MXuUnYI7XqDCGZyNO9FENqEhPI0k9XAc2uzDGOB
 AmcrE8yHRbZ6+7/4uUOjA8BA7UEiR9+1SxNkyvfTf8uL1KMo3uCtu0hTOZ8sI0BNu3MH
 nWh9+/x+3Djek6Igv++l6xAWBhYwiFvmL8StJ6U4SNAqjijY749mlxCRJHHYCXulYIGY
 uwMISvkjmTF+mQdF4jp1dbcUKTE4NuuCAhjWgD7zdyUvGJpvmsbKoA7SRNdBQQUDjcuk
 1e/lM2sO9uFB+ZZlEHkgIQRLIGdisJB9ItHVQR7Kl+XT8Jctz/t4HkCrOAx1v3CKmOxs
 Py8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FotWsbbqFz4VjRP/kt0GkMjsWufTyPRcDViebjol4/4=;
 b=ZVuRGfYFjR9Md4vsw/Lo0Qyxnwhcvda8Ax5o9DJw3mWv8XBNBWcuiG7rxJzfMpRnqP
 bSzsbVbQXU8DSrHulhhVPVy8+I+00JBfqWBnEFRn35EGjK/2OI5DQMIXRHQayitHc9rf
 v35npGLidrpbvCvcZpoPuGaLVZEeXb2U9QNjDKdogpdoeU96LrhlXmal1GdIBRrODLQG
 nuf8WbMyo4RGaNvNXkotreItkqJcFvIUYlEATxnvWYN9yVBGHwXal0mEBxzk3eou3nev
 fDVMeHbveKnYdd+5astF3aZ3wXfk8t7u9JoJVfgaxFqSiqYj8qR1C0653DZM0aYabhu7
 nlJA==
X-Gm-Message-State: AOAM5309GIAGpfBrVRxRUOsGfYeRx/ZSQwCxFaXIZRn7ZDSjaUwFMPDa
 tppcaINzCxrCIydO0ghhERDUiERM9rX8Yw==
X-Google-Smtp-Source: ABdhPJxr8YflXHQvF81GIX8dLT7caJvy2EyfCpot4KU+DnUG9mj9Ya3sy+IHRqLhfJuLvtkdO2B5Qw==
X-Received: by 2002:aa7:8e18:0:b029:2ec:a754:570e with SMTP id
 c24-20020aa78e180000b02902eca754570emr16092727pfr.38.1624227051635; 
 Sun, 20 Jun 2021 15:10:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm11122961pgf.20.2021.06.20.15.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 15:10:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] target/nios2: Clean up goto in handle_instruction
Date: Sun, 20 Jun 2021 15:10:46 -0700
Message-Id: <20210620221046.1526418-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620221046.1526418-1-richard.henderson@linaro.org>
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 31f63d9faa..276643cee0 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -753,7 +753,8 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
     op = get_opcode(code);
 
     if (unlikely(op >= ARRAY_SIZE(i_type_instructions))) {
-        goto illegal_op;
+        t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
+        return;
     }
 
     dc->zero = NULL;
@@ -764,11 +765,6 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
     if (dc->zero) {
         tcg_temp_free(dc->zero);
     }
-
-    return;
-
-illegal_op:
-    t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
 }
 
 static const char * const regnames[] = {
-- 
2.25.1


