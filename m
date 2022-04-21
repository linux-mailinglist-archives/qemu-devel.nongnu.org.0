Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47836509ECC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:39:34 +0200 (CEST)
Received: from localhost ([::1]:43198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhV9p-00089a-Bm
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpz-00036b-Qw
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpy-0003UZ-5c
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id p18so6213967wru.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bxmVBnLL0UuF4+CoaLzsddoXXo7cHYtUouPIfgvtaUY=;
 b=p6NDZ1Ew73HpfEgMv2z6nHwUjJv8hThRBvuFlxwSK3ByuJ31BKV1u7iWkgV+msmU/p
 7YdA4trxkmibIJ2JukjDTvX/LlyHD6pPtOsYCSWSN76OynV2NwPEVn5jUhXF3dlnM6G8
 O+DOIpg1PZy/q90wvjT5/ZiKY+Qf1mjCKXrOLb7F20RrVS7a09ODPR6h07e4PC+KSJ0H
 IEKj2JOdfTqgObf0h3s2ymdmwpff5l5CfVe/H7zAOWZuvzIQvyOmlP62pCZjm1G2TPIy
 8jyp2XnJkNxcCI3cUd7J3Sts3z6RHuK0div1xx04Y5L4tRU0gicF9FQUJ3r4cmmbgJwF
 AuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bxmVBnLL0UuF4+CoaLzsddoXXo7cHYtUouPIfgvtaUY=;
 b=OWDWsFPjb050vfwb73sj/ZFEDFQljizHEXFbMmNzVeAGYtHp+LJkJVh7o2s1UJ7iHJ
 BA4n/zW+OLdmbH11oH3CLPXknWNClI/Pjvi3WdssxVGLmWFufko38+Im7d6vcrrqIQZd
 B4MZOiZKvqTNgF6p8sVC+OkqyJl6Q+d7cWnWvZtdTcPc+ApZVyoljnO0JbkNfZxKzdvS
 D63N6R0MD26XIpKKg7QTOx9xzC9QbqSQL4Vh+f1PaS43E6Z9306r/LqgBvfofvxOnmpH
 ZWiLI7OW/oAnduYYCCUDY6iTetkku2zPM7Eb5o6wKZm2pRKeYsJwYYhfrQwX5RENw/z/
 oTBw==
X-Gm-Message-State: AOAM532LjrkwNgUrQCk00mhtb+DqtYhwQQlUVPxwbOYPU45mS+Mmzh0T
 Nlnn0Ubvx39UKZakiaA5Zfjdsj6SDmgLFw==
X-Google-Smtp-Source: ABdhPJxGDZeI/3CFBo/LModIyAC0BhfOnUPn759MKlgKuGUVPcLmMXWOOlhz6pukvWz4xCnNAcN0/g==
X-Received: by 2002:a5d:424f:0:b0:20a:c08b:551a with SMTP id
 s15-20020a5d424f000000b0020ac08b551amr1580529wrr.521.1650539939827; 
 Thu, 21 Apr 2022 04:18:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/31] hw/arm/exynos4210: Fix code style nit in
 combiner_grp_to_gic_id[]
Date: Thu, 21 Apr 2022 12:18:28 +0100
Message-Id: <20220421111846.2011565-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Fix a missing set of spaces around '-' in the definition of
combiner_grp_to_gic_id[]. We're about to move this code, so
fix the style issue first to keep checkpatch happy with the
code-motion patch.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-7-peter.maydell@linaro.org
---
 hw/intc/exynos4210_gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index ec79b96f6d1..3b77a485780 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -121,7 +121,7 @@ enum ExtInt {
  */
 
 static const uint32_t
-combiner_grp_to_gic_id[64-EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
+combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
     /* int combiner groups 16-19 */
     { }, { }, { }, { },
     /* int combiner group 20 */
-- 
2.25.1


