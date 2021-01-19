Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9A62FBB0D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:25:40 +0100 (CET)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1st1-0000P2-W9
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfQ-00081Y-Mq
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfO-0001L1-U2
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c127so51867wmf.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cB+sGdbzxIG7CrDhfnjg4z90Rri/on2fMD6E1rGigFY=;
 b=C1EhynxFOpEtnVlE5M3G9gyv08S7UMGTGHr1jacMnpF6jhFzdS0FFmr+ibG8ZJH3JK
 mPowxHavBNy5hApPMHLwwqyEVHxfmUCUc2s9HLYp4yQHjfRNzxR4/ERdjPIm6YlD2EIN
 uqNqPhq5KNJnI1rodbLmQXB6pILD79asks1qHRaF4kolR49h+yGb+qyWmWO6Fef+yiTo
 eNRme4UXgR9bRuOg0Nat1mYA/oMcnPjSVBDdak9V3VbeC7b7s4AAAV7PrFXHChgEWLiD
 rI95fCA+NAG+J3YEda2nDLA2XyglCZb5kpY3fQ2sjtt84GNegWo5rlpi0ommYZX3zDBE
 Qw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cB+sGdbzxIG7CrDhfnjg4z90Rri/on2fMD6E1rGigFY=;
 b=gdIZzSlLqEYl7Xm7uJUSlvbZRRb5j+pzPB+j1socHsAVP8Xaml3srWJaNAVVswZs5D
 dJnpyCyCpuamj6W+C0e4tR9UTG8t5gXrawmrOm9RFrJi9PSMROm9dx9qbM3oajSM5aoF
 W9EDMqUntBZ7XPAOaJ2g7d5Dw4DGGZOuBDWadMoP5gkVXbtrU2o96r+wFK/yXaz96nQQ
 TXxZGXd2JCq/ikMFBS9VBWeVFB+qDAXyjlbpti+h4U/3T6JyiK2cdcKsHK6Fu3vo++re
 4/33KUV4W5WDsrGn1Z2s+qrURTvVjTLZVs+LsXpOduR6cihpf5SzJ+PFwCfFWcQaq13f
 KhFw==
X-Gm-Message-State: AOAM533I7eESgmrqBrwBemrem10MloUynOTQKvzy4TGlAq6IVWWa8ndU
 +N5AelZHC01aDoZAMHU5PVa9f8pXElwM7A==
X-Google-Smtp-Source: ABdhPJxinuKDYFKAbioyyn7BovenJPW1eQOLiD4Ui/lC2NczrgloMqKhq9ODA48XQrhsDD9ajmS+sw==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr94983wme.188.1611069093295;
 Tue, 19 Jan 2021 07:11:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/33] target/arm/m_helper: Silence GCC 10 maybe-uninitialized
 error
Date: Tue, 19 Jan 2021 15:11:03 +0000
Message-Id: <20210119151104.16264-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building with GCC 10.2 configured with --extra-cflags=-Os, we get:

  target/arm/m_helper.c: In function ‘arm_v7m_cpu_do_interrupt’:
  target/arm/m_helper.c:1811:16: error: ‘restore_s16_s31’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
   1811 |             if (restore_s16_s31) {
        |                ^
  target/arm/m_helper.c:1350:10: note: ‘restore_s16_s31’ was declared here
   1350 |     bool restore_s16_s31;
        |          ^~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Initialize the 'restore_s16_s31' variable to silence the warning.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210119062739.589049-1-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 61760030292..731c435c00b 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1347,7 +1347,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     bool exc_secure = false;
     bool return_to_secure;
     bool ftype;
-    bool restore_s16_s31;
+    bool restore_s16_s31 = false;
 
     /*
      * If we're not in Handler mode then jumps to magic exception-exit
-- 
2.20.1


