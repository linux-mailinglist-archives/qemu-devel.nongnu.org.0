Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9E315AA4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:10:05 +0100 (CET)
Received: from localhost ([::1]:60240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9d52-0001fo-Ir
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy0-0003a2-E5
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:48 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxn-0007z8-U2
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:48 -0500
Received: by mail-pj1-x102e.google.com with SMTP id fa16so108071pjb.1
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=xzvsbmpHnqExAvvspw2vZltKkMn0UiHvydl6tbDwLu6HvTy2tc0Evv+eTOeX70SEpr
 cT7FxwdegNyWWGvKX37O+CgqsDJy1Dfhv9lrD/sOw3Mc5DWdQJchcvJq7Rt976ZyoxIy
 tcVnOzQnA+pYxFz/MYLbPbkuPt09ibuBg7RsG7pZobOCUWWZhb0FTaCZoVLLUE/4GYHs
 ISAAWGIina0Vkx/Jvq/K5Vap01ZjWznhCuQiTOzxdXn8VO2OGTGfrUlszsAIOt4ikmVx
 +PRLHCAc8b6yLV52QBpC450Q+XBICW08hpdLhGT+lM7+4JAp8HPAmwuetDQNK/vWuajB
 ckkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=ow9VbxRKv3yzjRvgyY1uRPlDRhT550LcJ5GOctqwZ84+U7n8R9/JioEIZy1Xc0WZot
 UGS99nuyMyVfRfHwL6LisJfSmu3dhcIXEtzSf5eRS75BNQ84anyH3G/PSxB904+lkXDV
 ifRfM/kr4VDDdcAFfIqrpYadkuSZV2DY/WJnz92CoHer+uHlsnYGRwUxYDREJ7BWTRU3
 Jcf9uJragj9pXSA34sTjwYyXEUsE56MI9Fmbw7/1awekFBytWKiQfRmIX9a7LXWpTdjS
 ma2cTrDB0r7SMEJ9adAQ1SEohz77ySdMFStP9LM8CVMsXf5YcgrJv/85GNDlgio40VvN
 bPOA==
X-Gm-Message-State: AOAM531XTAQYXFqOR2tTSDSm6hJ92VeMTOwC4H2jaMbZ5N1Yk881lBU/
 NotcmDxF1qeEcpaHl4WwlNegoalRUBczxg==
X-Google-Smtp-Source: ABdhPJwKoYXD4Q+CbzELXa1j2V9fzoNopg/wECEBTSlsL1lAeXv9+Q3Gu0e8evz64ZpzHTm0VELPtA==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr372200pjb.166.1612915353260; 
 Tue, 09 Feb 2021 16:02:33 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/31] linux-user: Check for overflow in access_ok
Date: Tue,  9 Feb 2021 16:01:58 -0800
Message-Id: <20210210000223.884088-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that addr + size - 1 does not wrap around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 17aa992165..441ba6a78b 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -491,12 +491,19 @@ extern unsigned long guest_stack_size;
 #define VERIFY_READ 0
 #define VERIFY_WRITE 1 /* implies read access */
 
-static inline int access_ok(int type, abi_ulong addr, abi_ulong size)
+static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    return guest_addr_valid(addr) &&
-           (size == 0 || guest_addr_valid(addr + size - 1)) &&
-           page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ : (PAGE_READ | PAGE_WRITE)) == 0;
+    if (!guest_addr_valid(addr)) {
+        return false;
+    }
+    if (size != 0 &&
+        (addr + size - 1 < addr ||
+         !guest_addr_valid(addr + size - 1))) {
+        return false;
+    }
+    return page_check_range((target_ulong)addr, size,
+                            (type == VERIFY_READ) ? PAGE_READ :
+                            (PAGE_READ | PAGE_WRITE)) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1


