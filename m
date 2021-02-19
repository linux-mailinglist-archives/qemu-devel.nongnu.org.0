Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B831FB98
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:03:20 +0100 (CET)
Received: from localhost ([::1]:42460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7J9-0003V9-2C
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73V-0002QR-N9
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:53 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73D-0003WM-J4
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:53 -0500
Received: by mail-wm1-x32f.google.com with SMTP id x4so7881760wmi.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x3QvCng870R2M1an25U0lcsqU4U17wJtXVQiS6BwppM=;
 b=vBhO5lyBNpcCE87gGkko+ZNIF+1sjB0gHhXKhgSn5LTNk+Ihz/ohrw5KHq5vu2iTMf
 fOCcJ5jVHVtJV47skJ2C8rQbb8AOu/a0ulSbF9ArxGh3LQJmbUYrO5yl5jtyi/GMSEX4
 SZ6o6ZZWBoOOYmBmqv21TsyVn4PJLEMUT0GR2YHpqDMldfFTbJfKclsFs7ZvCjEwphoG
 n8NagR1+t3IzOqWqwSh5wiG844tEybXlZxAvDmtVvr3lVJx52uLWKsf/+MyLcHjM289k
 i/2ZkTDgWBOPcPmxpiLT5abolop36Anx7ZnZCYaDSEcCSHCZQMWEZGNGPxpkOFqhbTzb
 OxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x3QvCng870R2M1an25U0lcsqU4U17wJtXVQiS6BwppM=;
 b=ikTcBnm2V57TQjU/tYmgBI+rEKn/JGi9Ikbom3SP3upeewaixGMB37UNKcRoZa5MSV
 B3+q7+dfQQ9XADlEKGvS4LBRNrIej8sHMA9532Cmo/Yz+YVChMADQ4myAbNhsqeBCEyf
 IFKMToL4UiCHax+YGG9T3xHxEPYUdnjm/aePCf17RGeJUGj0g/uWBPkQq50WMX3s3mLG
 XkGjjVXxHe3Yb/7jITqd2VwPX0LYwzuOAUpyin3ItCyVChYiRw7x2hNqPcuCSlks19vZ
 aw0OhCx1P7XkgN7S7Tb8RlqzGQqisjlkvIM8v7bXP5rpnF6+BJoFpOzq+9SFAS8uiLhj
 AQFQ==
X-Gm-Message-State: AOAM531/QgtaQ/w/gHOFAqVoQ4kCkNHUgN4A/4RgrjG3eXtDCBFg64Vo
 5sZ64yHq3we3gNhS6+efG4WILhjuPLiUAg==
X-Google-Smtp-Source: ABdhPJxHUbpQyYAKEIu4rZya5kN27ZxgHP2ARqIOEzEvOjo6IMukYIm32mEDhje64xtV4INHcEmvIQ==
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr8597480wmc.168.1613745994121; 
 Fri, 19 Feb 2021 06:46:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/44] hw/misc/iotkit-sysctl: Implement SSE-200 and SSE-300
 PID register values
Date: Fri, 19 Feb 2021 14:45:51 +0000
Message-Id: <20210219144617.4782-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

The SSE-200 and SSE-300 have different PID register values from the
IoTKit for the sysctl register block.  We incorrectly implemented the
SSE-200 with the same PID values as IoTKit.  Fix the SSE-200 bug and
report these register values for SSE-300.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/iotkit-sysctl.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index a80f68b7995..54d6b6c165c 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -74,12 +74,19 @@ REG32(CID2, 0xff8)
 REG32(CID3, 0xffc)
 
 /* PID/CID values */
-static const int sysctl_id[] = {
+static const int iotkit_sysctl_id[] = {
     0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
     0x54, 0xb8, 0x0b, 0x00, /* PID0..PID3 */
     0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
 };
 
+/* Also used by the SSE300 */
+static const int sse200_sysctl_id[] = {
+    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
+    0x54, 0xb8, 0x1b, 0x00, /* PID0..PID3 */
+    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
+};
+
 /*
  * Set the initial secure vector table offset address for the core.
  * This will take effect when the CPU next resets.
@@ -327,7 +334,17 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         }
         break;
     case A_PID4 ... A_CID3:
-        r = sysctl_id[(offset - A_PID4) / 4];
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+            r = iotkit_sysctl_id[(offset - A_PID4) / 4];
+            break;
+        case ARMSSE_SSE200:
+        case ARMSSE_SSE300:
+            r = sse200_sysctl_id[(offset - A_PID4) / 4];
+            break;
+        default:
+            g_assert_not_reached();
+        }
         break;
     case A_SECDBGSET:
     case A_SECDBGCLR:
-- 
2.20.1


