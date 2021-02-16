Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B1C31CDF4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:26:05 +0100 (CET)
Received: from localhost ([::1]:52066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3Aq-0001Ue-5W
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32R-00077f-0r
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:24 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32A-0002N4-TK
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:22 -0500
Received: by mail-wr1-x435.google.com with SMTP id r21so13739885wrr.9
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r54xv40YLSv8QxrOB/Rr5FE/dlpTfC1FACPhqcFCkyM=;
 b=ZOxHKyS/lv3w5MGir8b9dBkKM4dpiXuQ4VYJIbbHtvc1+zPh7sHEpGEY64NsARoORy
 AE/Vbj1MENWTHh6/lSaPiH91RYij/EvRkGM8aeFzFlJnYz8x5C3KbIt4Wwp25SJI59Fs
 35QCFaraxfc0ON7kNWC16Jq+DAhbB8wtn85C7uPGNEBVqkbLOIBxcDYZ+9wBmFt4Sh6b
 0KQs7PX5nHflXVpWe05uF3n1cfYjgsTH/O7ViLAl168hMJ1FJi1iOTRvBhjvtNYEki6s
 w+xFRwIqH3Kuc6MXBoPbUCUhTyKRhVeqRhwfYsjj4H9wfqrFk+KMTASwEZOOsYeBUdr1
 mGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r54xv40YLSv8QxrOB/Rr5FE/dlpTfC1FACPhqcFCkyM=;
 b=Mz23FIulHJexCNylWN95QhNwYULI33CQigj0SSwQOGff6MMcdeok5Z/XmivzpuWaP8
 L28BHidWYhFm/9IBxzq0+BP35z8qX2epI8OVWLtQsr+U1vYJyCXOg3hnKN9G0Ft/TaWI
 tp1IVQGOofX6vd95VQpDrNv7lVmWkzx+1gwbKAfPm0VBYPLiz1KWuqjSa1MgMJMJfoK5
 JheAn+6i1MdqCm/ybNrurRVIgWPKs9PF24gHtNhlH5qPDpFXiPHleT+qrrqomwFqARBX
 OSCheuwcLa+O4mhDEwnW1PqBOOPpSp0MT9tXCiECvT1m5Nw6Yd/NGjAWzQtaSYxdg9JC
 8oUw==
X-Gm-Message-State: AOAM530cyKqN0yZNDOdD1creNWHQWq5wMcxpNsiDI6sRQryQ30Z9wLpt
 3V/s3J1MSHuOugUEPxeutb6rvmzUaSek7w==
X-Google-Smtp-Source: ABdhPJyRKdgTX+0bjevqeCd0npCX8SNL6kCq9+ubF588L7iyHLYWtLbC9/smIljZ3Y/lITOXz2zSSQ==
X-Received: by 2002:a5d:6883:: with SMTP id h3mr24142585wru.90.1613492225068; 
 Tue, 16 Feb 2021 08:17:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/40] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Tue, 16 Feb 2021 16:16:25 +0000
Message-Id: <20210216161658.29881-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-8-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 441ba6a78bb..9251337daf2 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -488,8 +488,8 @@ extern unsigned long guest_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
@@ -501,9 +501,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
          !guest_addr_valid(addr + size - 1))) {
         return false;
     }
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ :
-                            (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.20.1


