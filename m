Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBEF6F4A00
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:58:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvCG-00053v-It; Tue, 02 May 2023 14:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1ptvCD-00053F-Ic
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:57:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1ptvCB-0002BY-Vp
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:57:53 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so2624738f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 11:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683053870; x=1685645870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEF1qi6MMuB+c4HTiM42q+lLMXcDmiJq+W9maCZXnaA=;
 b=kDBHiS6FPPfleL2cXIDNRnVtSgSb+9dLs6tuBIuhecfoD2tL0SQrTJjrbz6rK2IrZF
 eWyWPOCTkF/UhEsGuH9PlUW/XFWSDDqmxJ9WMhQfQCuAmtCzUSm8VCFF1eX229r6lPFf
 zWpXa/Cm8zOiMRK6w7KNK1ahXt3xP+Grb2y4xBUH+SXK/wX514GJm6+j+rN86W1g4M12
 9ofy4klE3UV83KQJoRiSv2X2d0ZJybE9SdLLybjW9RvG/r3ElmxQJapSgUXQx/sYSUSi
 4CXNZsPDZtd20+kbHHu/LOceGk9bmYZ2SNLLG1P/F4G1vI/xhz7b1cxlVPVZJ7uFufQE
 Lngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683053870; x=1685645870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEF1qi6MMuB+c4HTiM42q+lLMXcDmiJq+W9maCZXnaA=;
 b=WjayGhSnleFZqVrlfEnmtrjFzKRdTHM7mRbLi5el2EKH+oxudKqguCPt2dVbStqFYN
 UuZuWDX3JA/4E0J3AGc47uuaxLKtgHhUB5+hXsMVXqXB0U1oXWiaK+ziK2GGCS+CklmE
 Nes687Nytlk3flIpCe3cY2wJqpM885oon4jwlahEWwjV5ZTzlBvyfPR1kIHaadMTcaVN
 i5SlonwYGBo0NMKgz9G4/e1R6PfN/xNjUPVN+XH1MRr/IFtDdmtIKuhhChNOAkpPRAlN
 REOueWiI+vY+j/nRmPlfTeoYiHSUHGdRszuJL3+vTjFN0ac5+F53LfCYCcjRAijJNHhu
 RP6A==
X-Gm-Message-State: AC+VfDwZT+hiJV5yY5HbGZGnDLJBn8VNWUB/Xi4tBnE/IKrA0l0QPGPO
 NeFie+2ynAWPVc3P3BKHQcOI8if1onU=
X-Google-Smtp-Source: ACHHUZ4S3dfBdfy774H5DOYO04fbZftVf7nnvy1feT14LQdwK+lxJm6piyX4Alhews/LsFoB0ERmbw==
X-Received: by 2002:a5d:460f:0:b0:2d8:47c7:7b50 with SMTP id
 t15-20020a5d460f000000b002d847c77b50mr11827686wrq.1.1683053869896; 
 Tue, 02 May 2023 11:57:49 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 u12-20020adfdd4c000000b0030635735a57sm3073320wrm.60.2023.05.02.11.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 11:57:49 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH 3/3] target/openrisc: Setup FPU for detecting tininess before
 rounding
Date: Tue,  2 May 2023 19:57:31 +0100
Message-Id: <20230502185731.3543420-4-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230502185731.3543420-1-shorne@gmail.com>
References: <20230502185731.3543420-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

OpenRISC defines tininess to be detected before rounding.  Setup qemu to
obey this.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 0ce4f796fa..cdbff26fb5 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "fpu/softfloat-helpers.h"
 #include "tcg/tcg.h"
 
 static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
@@ -90,6 +91,10 @@ static void openrisc_cpu_reset_hold(Object *obj)
     s->exception_index = -1;
     cpu_set_fpcsr(&cpu->env, 0);
 
+    set_default_nan_mode(1, &cpu->env.fp_status);
+    set_float_detect_tininess(float_tininess_before_rounding,
+                              &cpu->env.fp_status);
+
 #ifndef CONFIG_USER_ONLY
     cpu->env.picmr = 0x00000000;
     cpu->env.picsr = 0x00000000;
-- 
2.39.1


