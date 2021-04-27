Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E4836CDEF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 23:42:51 +0200 (CEST)
Received: from localhost ([::1]:60832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbVTl-0007cG-NB
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 17:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbVSI-0006w5-7h
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 17:41:18 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbVSC-0004Je-Ej
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 17:41:17 -0400
Received: by mail-pj1-x102b.google.com with SMTP id p17so3748998pjz.3
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 14:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vepzGBv1x3t6bweqcWp+CW3Wr0kgTq2tQ5XCt6U6rpw=;
 b=bCh4VHPTjx9IyrErQRVg7UttcfjkIf45PxaX/5bzPadvMUQXs65LJlOB8uwTk7sxee
 cFiUkZ8ZBt1b3pAkuQxf/uC6gEMJ5AGEQWMnuvMvJL+pvPmZZ+0rwdFxb5WkiYLvzIYm
 8d3uBmJoDJI8O8qdoG0Py++yG8GXFoP3G1O+aXXQcxqI42HQQ1MPH7htrne+8FZb6WLG
 4nxKuuJng6y+nSd3hc3N66kSW6U2wMh++TDIUOEvJKiItW4zay9eLZ8BrKM4Sk/DHHoe
 9ybnOpGS0o8qpNa/ssEcjgYEzna4wGD2KrulSK5AQJkMzDyQGznZoXO7LQS1BLXz1wC5
 fllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vepzGBv1x3t6bweqcWp+CW3Wr0kgTq2tQ5XCt6U6rpw=;
 b=NV9iUdrgMXo87uOYCFsGydP18q9CkJPdwDxF1p6sGvsZNiXFmmKIi/fX+ZSJ7g1Kn/
 S0ZgmbNkCiEQ+xEWFllDlVQ8MNqxLzT4nwjpSri2cjSkmS86oxCM1hv4zJRTv0giG2RW
 91Puv4ZQTWaXDCXQEEVkLSMjBHcjF4521JdLiQtcT91tmwmjWEL7EbtaX+Ke0WZ5EZxm
 AW0dZvlWA8wAoBJpaZ60fLkXv31C+ixFuKUElQFdabB9+HM/u9bYdl4V4GNyDEJmQAOZ
 /AYt1YbpyhiCEhIXVibxuO3IdJ5QkoESGkYOWpiYfsN0uJilxty9IEhwdBYIe2c/yO+M
 RXkw==
X-Gm-Message-State: AOAM532gcU0BD9s0C2UJd0z0CTH5u7+GRw9rooAri23wrjSSrEKupW5Z
 ueCnHQMeR5P35WPUTYBUTtxP09QNZLO2Mw==
X-Google-Smtp-Source: ABdhPJzxfc1YulS8NinXpmAwnupX1LreBjz8Wz47Rm4ry0w2BPo2efF49XABDY29hHwDMOWMc8qG2g==
X-Received: by 2002:a17:902:db01:b029:eb:36ed:36f4 with SMTP id
 m1-20020a170902db01b02900eb36ed36f4mr25981167plx.61.1619559670147; 
 Tue, 27 Apr 2021 14:41:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h8sm3318644pjt.17.2021.04.27.14.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 14:41:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/aarch64: Enable hwcap for RND, BTI, and MTE
Date: Tue, 27 Apr 2021 14:41:08 -0700
Message-Id: <20210427214108.88503-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These three features are already enabled by TCG, but are missing
their hwcap bits.  Update HWCAP2 from linux v5.12.

Cc: qemu-stable@nongnu.org (for 6.0.1)
Buglink: https://bugs.launchpad.net/bugs/1926044
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c6731013fd..fc9c4f12be 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -586,6 +586,16 @@ enum {
     ARM_HWCAP2_A64_SVESM4       = 1 << 6,
     ARM_HWCAP2_A64_FLAGM2       = 1 << 7,
     ARM_HWCAP2_A64_FRINT        = 1 << 8,
+    ARM_HWCAP2_A64_SVEI8MM      = 1 << 9,
+    ARM_HWCAP2_A64_SVEF32MM     = 1 << 10,
+    ARM_HWCAP2_A64_SVEF64MM     = 1 << 11,
+    ARM_HWCAP2_A64_SVEBF16      = 1 << 12,
+    ARM_HWCAP2_A64_I8MM         = 1 << 13,
+    ARM_HWCAP2_A64_BF16         = 1 << 14,
+    ARM_HWCAP2_A64_DGH          = 1 << 15,
+    ARM_HWCAP2_A64_RNG          = 1 << 16,
+    ARM_HWCAP2_A64_BTI          = 1 << 17,
+    ARM_HWCAP2_A64_MTE          = 1 << 18,
 };
 
 #define ELF_HWCAP   get_elf_hwcap()
@@ -640,6 +650,9 @@ static uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_dcpodp, ARM_HWCAP2_A64_DCPODP);
     GET_FEATURE_ID(aa64_condm_5, ARM_HWCAP2_A64_FLAGM2);
     GET_FEATURE_ID(aa64_frint, ARM_HWCAP2_A64_FRINT);
+    GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
+    GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
+    GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
 
     return hwcaps;
 }
-- 
2.25.1


