Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F69599A86
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 13:18:38 +0200 (CEST)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP01N-0005R1-3o
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 07:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkQ-0002Dm-61
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkK-0001R2-D6
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b5so485118wrr.5
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 04:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=uhwJFdO0H01eXY5Lyz7NeMke3RGgO/dYgfglq68Auzw=;
 b=p27WeET1DkKXn2Bq+I2168oF6apMA9lHbKtx3bWHy6TRh73UzFg5iVi6VQr/Fu6twg
 HgS13tHxpG93O/QOPYrffE7GA8P6iLp7Umrp0kKqY7PA653fJI+DAfVTfxIu7jfIqmBV
 GTS1UMZDDpji1DAkKQpGdf3OZ7y/rJZ96dQ6XLPGtWfw58Wbha+u6Qjw285F90/hNDxS
 2vIF2JnD7j62xTXLjF6ZE5SM6cb7ONY24WtIz1eWjUqOebrT2fiHCt69RLW4iWO3/wqC
 6Iew9xd04A7QdJF7AJufNOoPpk1ig5zx/Otmr1fAz8KP3scU7govT1jPQ0cIjIKvQN3z
 8XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=uhwJFdO0H01eXY5Lyz7NeMke3RGgO/dYgfglq68Auzw=;
 b=67IEEZLVXC70us0g4iJi36GqLpF0xjv3SxHqdkNTbWkmTcU0cWlyoU7YSY+KLZhEf6
 4rM1cTugzDzyeQ3bXdC9bggZl1Whm5S8vMX2APFFdArsqH1oKNoAqB1r8HE7ZBvx2PMj
 vh9OKLlxvwwV9pTroCh9JB9SBwvjt6Tes5W50PEFe4ssbzs5q3vjeYWmmVHAsNheCM3l
 7CZG2w8QKYd6mprhvKPBGMHQtRhXSwnxlB3hNnrfH2j97LQJewtts19GkGY1t55KfH7M
 rDZYdAsa+sQRD911iRpX9VABPR9aiKq1LBS8g9Rc2TOIUUxuy7d121ArdKMhutG9m/15
 p8Uw==
X-Gm-Message-State: ACgBeo1RItR8ZTOqH6JEbimWDNDMevMU0Mtkj/cwxDEikSpVDAl7azKG
 OrYfdE4GbifeC9wmTUlAzGltrw==
X-Google-Smtp-Source: AA6agR4I2ef4SmeWkX9m31eW9Maxyy2H7Ek/cUIHm0wkyfNKobm8NEA3hwKYKhPejaiG5rj/qgCncg==
X-Received: by 2002:a5d:5a82:0:b0:224:f744:1799 with SMTP id
 bp2-20020a5d5a82000000b00224f7441799mr3839724wrb.582.1660906859067; 
 Fri, 19 Aug 2022 04:00:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/arm: Add missing space in comment
Date: Fri, 19 Aug 2022 12:00:52 +0100
Message-Id: <20220819110052.2942289-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a missing space before a comment terminator.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu_tcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f63f8cdd954..b714c61d940 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -64,7 +64,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = FIELD_DP32(t, ID_MMFR4, HPDS, 1);         /* FEAT_AA32HPD */
     t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
     t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
-    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX*/
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_mmfr5;
-- 
2.25.1


