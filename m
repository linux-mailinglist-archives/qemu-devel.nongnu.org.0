Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAAA318BED
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:25:56 +0100 (CET)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAByl-0004pA-2q
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYr-0007rW-CE
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABYn-0008Ky-Sd
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id g10so4123384wrx.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gQrBoxbz171rw0tzOvaF5Z4ybjSP1s8QC0fPYVKKgNg=;
 b=rU/EndC9FYN5f/eKExsLm3FCagHo/hELLBoIrCV9RSRMpJBMMyqh9SmAbOztCwPrww
 2A2UXZizCvpzAStDT77ZMm1yyfowrjws7ZlgDESlzoqFuIh8lW3knC+5HVpKwJPj/Lk8
 ISPA5Rotjg3xHSoHm8IvMajMPAFT2eZaFunhMitpe4nLTWrGHSEIKyUgUJIZ3WQN8uJQ
 p72w9wiNJ9knfZG1+SW0NqGMPKbLKPh7mahSxS2YfdJF+kCaTUmfnxuf9v4zqc47YuUd
 B6nbfD4begwMmqo1hpWyC09glpmYoNTrwMFu3A4wasjtBPZ2y75/kFcYhNrEuBWdgXRn
 7G0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQrBoxbz171rw0tzOvaF5Z4ybjSP1s8QC0fPYVKKgNg=;
 b=rNcxsWpVcs0NISdgOuoqYwmRFBUy7KgnlV3J+tcD9fnDUvBm7iVFfGpurdTpYCyH5o
 48mxv6s650g/wDE2A8ckn5/54xEJgprbbnN0nyeLg8und86mTs5W0dBoAuQP99E0DeM7
 b22g24Ux1hvAcpSLWCikGYn9y1j0YU8f9GLj/FU+zn4KIemx2QAkJeCwabYsrTiR2Zam
 W4MoZzUo1Mu+Fx1pc2XrAcQKCbNeKoEur3lLH04HITK2eqr2qbGOMb3dyKoiTuvygRPg
 HcDAMoyBt6a/WmZ1bNeBq+sFdOPZt6K5SFtGO6zjZRtYiPadUq5oLEvb55BGDFGKtLzQ
 7cxA==
X-Gm-Message-State: AOAM530S9IyFpNktYw3nkW8y5h9tvRUSBFLaAEwOcMUFlenonmjZ4ieq
 26wAZdbwvUTe4TSgje6oVNkfxdBOkdzp0w==
X-Google-Smtp-Source: ABdhPJxCNMn63t4C5oYKmLtRlpt2AU4PdyMVscyiTzDItQlae+fh1CQs4YG0gwQthZQLiHDr3xyQUg==
X-Received: by 2002:adf:fe46:: with SMTP id m6mr5692717wrs.92.1613048344675;
 Thu, 11 Feb 2021 04:59:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/45] hw/arm: Remove GPIO from unimplemented NPCM7XX
Date: Thu, 11 Feb 2021 12:58:18 +0000
Message-Id: <20210211125900.22777-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hao Wu <wuhaotsh@google.com>

NPCM7XX GPIO devices have been implemented in hw/gpio/npcm7xx-gpio.c. So
we removed them from the unimplemented devices list.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu<wuhaotsh@google.com>
Message-id: 20210129005845.416272-2-wuhaotsh@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 72040d40799..d1fe9bd1df6 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -576,14 +576,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
     create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gfxi",         0xf000e000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[0]",      0xf0010000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[1]",      0xf0011000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[2]",      0xf0012000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[3]",      0xf0013000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[4]",      0xf0014000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[5]",      0xf0015000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[6]",      0xf0016000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[7]",      0xf0017000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[0]",     0xf0080000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[1]",     0xf0081000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[2]",     0xf0082000,   4 * KiB);
-- 
2.20.1


