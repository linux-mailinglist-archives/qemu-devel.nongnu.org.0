Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9445EE4CA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 21:09:24 +0200 (CEST)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odcQs-0007DK-OE
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 15:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odcMb-0002uq-IO
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:05:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odcMZ-0000dq-Ta
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:04:57 -0400
Received: by mail-wm1-x335.google.com with SMTP id iv17so9091652wmb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=nzIFbCVuoALpm1M0uWrolz9JaBDgmqc+fXOMe8f+jss=;
 b=GjezmAFM7cGy3AFvVRRcUR88a0veVD2nRULTPTK+c9SiC4RWPfC1vZWhIK9R+zW4XR
 hutRntPQZpSjW6hXAbtXVbZSh4cgW+W+sqzlheltFNTMwGc6By4EOm/CzdZgN25iRb79
 2HPGnJOt0RvuZPyW8D3oz2wOA2AwnJutRQF/8JX0D2ITcHutiDBfdBbIYNLO4Sko8dbr
 MYdmFi2RyYNAbnjIp26vPArI8T+7aEp3Lmrmv5dhGLtzCb3Kh5ogyMLvsrDOpullI8Ea
 1VF6NlczfVenTWkgQKvw/G7p9yvvBO2fMKORrgn5FU1VMmvWu8faz2+klPvjn6cD8UKZ
 yYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=nzIFbCVuoALpm1M0uWrolz9JaBDgmqc+fXOMe8f+jss=;
 b=CBKkR7VxJX6jgl0dbbmC21KpocxcAUQj+pdMac0wUe2TJ8s0HqVHwgMhdrHiuBMmxN
 iuq0czpZI/iVx2G46mt46JeqAy8c8ep05QS4DMRIJPMfP/pGjaDF6+KcdYZwzoa6Rjmm
 emWzS6TTYOiHnisNBof+SoF+h+TIHLeLHGbNb3NWqk8LMhaRyJ5ZHtbGvL8YUoUUUws4
 +016qukIG6zapiu+oCX892jnqCvTv+eneC0oH+cSSf5a7rBXJMnusGiiT108a+GCf5pO
 6DpNrVcjwHFyKj4yCmyBN/yp4PegSzrfIpvogyW7fxNsA475NEOT5zSSfmHuaNchwMe9
 hRmQ==
X-Gm-Message-State: ACrzQf22RfGeZTWX1w5DMF5GN2cXfmweLsajqn33g4mKJfeeoCyUnSn8
 L5vyRAvljq7TFKwQwMT0RRTtvQ==
X-Google-Smtp-Source: AMsMyM6nWJ2Qed06cs3jUT3i/b1YcLNRm8JOX/vne4Mc4GEyAnRn/KYoCi4C2N1TAGLpDBcQl0DKyA==
X-Received: by 2002:a05:600c:154d:b0:3b4:aae6:4bd7 with SMTP id
 f13-20020a05600c154d00b003b4aae64bd7mr8043005wmg.63.1664391892087; 
 Wed, 28 Sep 2022 12:04:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c3b8200b003a540fef440sm2477092wms.1.2022.09.28.12.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 12:04:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4810E1FFB7;
 Wed, 28 Sep 2022 20:04:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH] semihosting: update link to spec
Date: Wed, 28 Sep 2022 20:04:44 +0100
Message-Id: <20220928190444.204118-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The old link has moved but it seems the document is now hosted on
Arm's github along with a license update to CC-BY-SA-4.0.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e741674238..bfea9e9337 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -24,7 +24,7 @@
  *
  *  ARM Semihosting is documented in:
  *     Semihosting for AArch32 and AArch64 Release 2.0
- *     https://static.docs.arm.com/100863/0200/semihosting.pdf
+ *     https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst
  *
  *  RISC-V Semihosting is documented in:
  *     RISC-V Semihosting
-- 
2.34.1


