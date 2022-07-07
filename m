Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8A856A217
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:35:17 +0200 (CEST)
Received: from localhost ([::1]:43116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Qiy-0005rR-0h
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbf-0007jk-Vw
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:44 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbe-0006vU-8P
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 r11-20020a1c440b000000b003a2d053adcbso530008wma.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=58Nx8NOneDW9Nuz2TKQHd20F0hjUoWlS9lRm0FSj/KI=;
 b=LeYAgsOdMfL9g+wARPHQMZ6KTrq8tJcZgJFJY8U+O7pSlMKn8FclkSPk5g8ZsY2R9y
 7vpQOUhLpbrKanX0xiJWZThLegnMMv5wn119SkP7XDP88h/pldSzBsnjor+TOUsXQCeb
 kkeCQVYgvqRa0iMYIo0aboLPsbEo7nXH0srVDR/TXjRwa9Phg4+YMf7kwPDUBQMHaHI0
 EKxooife6LrVSIrxf6bEELo11bW9teDnmUb1vLZfAlvUpwE/XmRz190iccFqee1bTtC6
 T3aAgpnjWzu+ebhoXxLCnjd6FxydXqWLJaUrObjJqQraOROTR3L1UvqREltDvjaKNKuX
 bmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58Nx8NOneDW9Nuz2TKQHd20F0hjUoWlS9lRm0FSj/KI=;
 b=qjeTNcstiQxKpbBBN8fg6JYuJACgrn3jE4+hsFn76XSOqxg8Dvf+dSvaPlQ6OWtbWH
 boqSldiIPbAwGbBCClC2gJU5J+WkZQI8ShAdvGj0ZvDFOdftL8CX1mSIUON8S2cwGYpW
 u5YlE3QO+Kx9CH0k26yGXH/9e/iMXoWFssa2jP7wHSWXAtGlZrLAeEXNkv6fW5VZWqYr
 /uBNsevJvO5QBaIOOz4U6YM84VvIEilUMYqb6MoBHHPXZmvGadvzdP94I0QoPS3beQRw
 aAnIcL8RuZjVP3zmRWqTwwBTbitHVbh1WanRgBn7ymNxxpKE2PyBh6K+W8DjvzScnZBp
 d2Vg==
X-Gm-Message-State: AJIora+3+Cl5DFdfxKKSMz2DjPDSZABdP6zqTL1Yi+RTC2wurSsLXHcy
 bVD4U0RgPQf0XuiEgaTIuQoB/79AQXGX2A==
X-Google-Smtp-Source: AGRyM1vl66KEwJ3we3ZHcqD1CRT7uF9zqR9X47xcrdfPqH4RiBnmcC/JwWx1ejSFpRpqBF7xmv0NFw==
X-Received: by 2002:a7b:c4d3:0:b0:3a2:aef9:2415 with SMTP id
 g19-20020a7bc4d3000000b003a2aef92415mr4225865wmk.72.1657196859855; 
 Thu, 07 Jul 2022 05:27:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm29177618wmq.44.2022.07.07.05.27.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:27:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] target/arm: Record tagged bit for user-only in
 sve_probe_page
Date: Thu,  7 Jul 2022 13:27:28 +0100
Message-Id: <20220707122734.288929-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707122734.288929-1-peter.maydell@linaro.org>
References: <20220707122734.288929-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Fixes a bug in that we were not honoring MTE from user-only
SVE. Copy the user-only MTE logic from allocation_tag_mem
into sve_probe_page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index db15d03ded8..0c6379e6e80 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5337,6 +5337,9 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
 
 #ifdef CONFIG_USER_ONLY
     memset(&info->attrs, 0, sizeof(info->attrs));
+    /* Require both MAP_ANON and PROT_MTE -- see allocation_tag_mem. */
+    arm_tlb_mte_tagged(&info->attrs) =
+        (flags & PAGE_ANON) && (flags & PAGE_MTE);
 #else
     /*
      * Find the iotlbentry for addr and return the transaction attributes.
-- 
2.25.1


