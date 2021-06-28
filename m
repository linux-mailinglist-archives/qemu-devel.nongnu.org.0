Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29C3B6ADC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:12:22 +0200 (CEST)
Received: from localhost ([::1]:54348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzUL-0000aI-FA
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQY-00011g-2J
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:26 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQQ-0006IG-UR
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:25 -0400
Received: by mail-pf1-x431.google.com with SMTP id c5so15406347pfv.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/s+Gri2Ok0ukt6u01K6TNKDtNlxwEADD2265TMPJCTI=;
 b=BIvIrhfod87VIelrN9EFMkIN/rzHFM1+boqArW2B9RaFSGOeHoW+y1yMGsRMEiD8+H
 zq2MGMoJsyta5DHvLDRr2dR2dyGCO1eKIdNal8nhLl5vLr0/BTQn8EpvQ7H4E2rdh4gh
 P0VWLCHwK57Y8gAzhSyvA5KtNXOwIFDrRXgNUH1G8DnhUZPr8GOIGqnRpTJwwvpYVs8X
 kAp0LDliWv12y03E9SIB6A60/7L7kcGUsCoEovMJg8skzgzmNdZRL65vgH12QhYIYDvE
 z3s+R+DuxGAmh0rcYykz/9Te++rIq1oh9UefwVAByu+PP6b8mxxEnK2//GhlZ8QqlOFx
 i2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/s+Gri2Ok0ukt6u01K6TNKDtNlxwEADD2265TMPJCTI=;
 b=Q/ANwA5aRyymLcmuTHkEoo4dEsbjBFgA5pfSv8vqT8vqnO7xpwuv8jaqybmRZpJWSG
 p9TxeOxxrrKOA/qkjfaFrcwCOS0t2bCEyKs01Kmglujb/hcVx4pa6pHqV3dEfNU+fRD3
 oj5QHOWeYJbNmnRdUUQ0tmdNWPmeunpV0slCl6s+DOWFhmb4fopOpRUVg6xOlOwKm/Q+
 s23/qJOwgoAs4WbvCZ2uVTJcaEhx2jU9F924KKYLH3vFGrKOCaTZ/ff+gOmWev5++S3y
 7lmfiG1NuurJbJd6lFvVSMCVDFiBtacMwGkQhyXVyCrKCm+xT21LfQ61mRkwI1wNQoIf
 uxLg==
X-Gm-Message-State: AOAM532dxQbupLlLuteWCGaRFpUZ1bM6K7BS6rZ6h95Ut2AIZ5urf0OV
 9TLNZO+4N2Nso6sjlg04qM67zIx8CYyLlQ==
X-Google-Smtp-Source: ABdhPJwqFYYlcC0qR1H/93hpx8k2alPRb/rA2n1GxeNN8wjpuZENY3QBMwQxOJBkd6S4PXswio9gog==
X-Received: by 2002:a65:42c3:: with SMTP id l3mr24753697pgp.259.1624918096603; 
 Mon, 28 Jun 2021 15:08:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm16030164pgh.34.2021.06.28.15.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 15:08:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/9] target/nios2: Clean up goto in handle_instruction
Date: Mon, 28 Jun 2021 15:08:08 -0700
Message-Id: <20210628220810.2919600-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628220810.2919600-1-richard.henderson@linaro.org>
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
index 6fd4330b31..9e71267b42 100644
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


