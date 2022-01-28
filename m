Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFAE49FE0C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:28:12 +0100 (CET)
Received: from localhost ([::1]:49052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDU6c-0003vg-Tx
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:28:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDN-0002Fz-S7
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:06 -0500
Received: from [2a00:1450:4864:20::32a] (port=51037
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDK-0006QH-SJ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m26so2236644wms.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OdtIkV/XqQbri3TA1b5zl/FnINW56thqfzKkEfK6UQo=;
 b=ERp3rE+NPQ5I6tC38USzx29S2c9NyMEUnopuxMRhpLazGp2RLMwrA1ZMVzIA2uYNai
 giafQVnmkYSBzC5gQ7BFe61vgSXEn1PpOi2CVouXndyEJOIoEcYpOwtseX2lr0I8rj6z
 yTz0lcRuH9uB9itcr3+D/xnUkRw3Hd8XxoY1RnCn9Ag4EujpwQvujGnrIQv+ohaeJa18
 ldcxeMlECKGhsAUT64psOuof9U2Futng4K4TxzOUfMo+pi+UbPnPxrduJ1CKZk/erp/u
 AOVi18W0pNZbSIfbRHn12vfcmBwFFfyr+Qz35VmANBQPNpFUIe+IluY2/ckNcblRfZap
 qHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OdtIkV/XqQbri3TA1b5zl/FnINW56thqfzKkEfK6UQo=;
 b=cTT641qHiblAuYTV7uN+9Ik22Y0nvc0dK4qca6tYv8qfpON6nK2SNBDCaRsEHE0ktA
 pfvdW82n/VCgE2ye1iHP3Y161ewSNyT4xYX6hnLWxjlU+irQ+oJ5TW7VFLldBtLrXHgR
 I3xZ1JqoGHY6gTlsLMmY60zkMtYMh96O8x4hSrpwnG3HDhNDjsCPPxx3iAaSiIjeCySW
 R4toHqdlHoajR4XwvEO993+wtdnwzecX/R1mxLv84YeZnn0eYh3RegEdk+9BV8oBmucK
 7LQNY+0IUCS45pyQ7VEg1QGFxDD+qCQd4uzwn9F5bSZJ4xVAoE38jmOwGd1dqSnv+V8x
 u+Cg==
X-Gm-Message-State: AOAM533pV/ZFqMmMXM2Mfo+DeOENwoA5pcnss+QIBzPoKCYoTjxuH4iB
 XQPn2vM/M1PbuGsBNVCmSlrWd2ikfyx5jQ==
X-Google-Smtp-Source: ABdhPJxDQk6nhiUQ90LPgqd8/+b5K9CBPlKQK26kUzad6+5/MlyvWY6x66zI7HhxwXf9XIqPfKSr/A==
X-Received: by 2002:a1c:4455:: with SMTP id r82mr7704132wma.103.1643383834380; 
 Fri, 28 Jan 2022 07:30:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/32] hw/intc/arm_gicv3_its: Don't clear GITS_CREADR when
 GITS_CTLR.ENABLED is set
Date: Fri, 28 Jan 2022 15:29:57 +0000
Message-Id: <20220128153009.2467560-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The current ITS code clears GITS_CREADR when GITS_CTLR.ENABLED is set.
This is not correct -- guest code can validly clear ENABLED and then
set it again and expect the ITS to continue processing where it left
off. Remove the erroneous assignment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-5-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 67f12d98af3..1763ba4a671 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -853,7 +853,6 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
             s->ctlr |= R_GITS_CTLR_ENABLED_MASK;
             extract_table_params(s);
             extract_cmdq_params(s);
-            s->creadr = 0;
             process_cmdq(s);
         } else {
             s->ctlr &= ~R_GITS_CTLR_ENABLED_MASK;
-- 
2.25.1


