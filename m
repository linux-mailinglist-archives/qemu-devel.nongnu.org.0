Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BE669ADB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:47:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnJ-0001WN-Vq; Fri, 13 Jan 2023 09:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKn2-0001GG-G1
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmn-0003eP-AL
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:06 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so1023084wml.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cKsR/tB/+nUT8ufiEVALMMa8QtZgWz/J+ACz6TTlZMk=;
 b=D7LrjU9stCNqwJRMh7gBjAMoX43x29W07JAGJjS3XgKBc4+lRUdlDXi1UuSVH2wWx+
 zd4D5zDVhpO+tkuYgmG9e3OI3DrBOorzqzlG36uYkloWM84Y2/MEFfYLOKb9yFk3TFtr
 GrR9S/8ts17M/fWZNd2ftn9MDH8HIWIX7/ertSg6fFHEM+CijWIKUuIyem9rymNAKxlP
 Sd5ZeOZaowmAmi8NdIYebCziDoeIa3371QFolDktgLrRTEmiZrkhKon7oXj3EHj8GA3S
 iyyhAHQR6m1o+8ICTPXkMko36w/CuoXKqtFDC1FEXo7nSYoW8bNwITBab2omBOcyeg0L
 jbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cKsR/tB/+nUT8ufiEVALMMa8QtZgWz/J+ACz6TTlZMk=;
 b=sGgaLvRB+adMNz9f7qcfo3pWxV4BydOJxsebyws++Oz55Zu7l45E5weOWZueBJahve
 QEkeF76C9gC6zPd3Kli2M/BgqJZp5GRFJLK94uFvUMeE4va5jz07b8aj4eB1C/3Wwygy
 3fL38vPYDC8/feK16fAHFauss/Rze/RTp5Z7ZeVePnj+0v5F61/xkEIm7NerK0sCCHo0
 4Ny09AdfozMOFcvy2CtNpUFKjhP//ayBLVQdJgG9hz5VUAX01/JgkHVsxL4ueM7Ze9RX
 ADOe7fDvkE9CN79pTDQH6XFYv+rtYmLfrnQZ/EPXIvXweDlXp5TlNigrs0frmR9ty/Xv
 vTTA==
X-Gm-Message-State: AFqh2koW4WNGjtBgAfvxkFfnuKdp27tqcTbOWQpAvZ2Tn4dAfxJ/b4QZ
 EaJSr7ODRq1WbEDondUdzNlKLdLGpHCtEy//
X-Google-Smtp-Source: AMrXdXthaLGlNp6LZUEzlEWduNKL95sPWfdDI2yfdZfZE1q2XPm9uF5+5XUmUCGenuT+JmP1gMSi9Q==
X-Received: by 2002:a05:600c:1d18:b0:3d9:73fe:9744 with SMTP id
 l24-20020a05600c1d1800b003d973fe9744mr49777586wms.26.1673619120481; 
 Fri, 13 Jan 2023 06:12:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/38] target/arm: allow writes to SCR_EL3.HXEn bit when
 FEAT_HCX is enabled
Date: Fri, 13 Jan 2023 14:11:26 +0000
Message-Id: <20230113141126.535646-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

ARM trusted firmware, when built with FEAT_HCX support, sets SCR_EL3.HXEn bit
to allow EL2 to modify HCRX_EL2 register without trapping it in EL3. Qemu
uses a valid mask to clear unsupported SCR_EL3 bits when emulating SCR_EL3
write, and that mask doesn't include SCR_EL3.HXEn bit even if FEAT_HCX is
enabled and exposed to the guest. As a result EL3 writes of that bit are
ignored.

Cc: qemu-stable@nongnu.org
Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Message-id: 20230105221251.17896-4-eiakovlev@linux.microsoft.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cee38043540..22ea8fbe368 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1866,6 +1866,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_sme, cpu)) {
             valid_mask |= SCR_ENTP2;
         }
+        if (cpu_isar_feature(aa64_hcx, cpu)) {
+            valid_mask |= SCR_HXEN;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
-- 
2.34.1


