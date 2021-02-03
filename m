Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A830E336
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:27:13 +0100 (CET)
Received: from localhost ([::1]:45544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7No0-0002DC-KG
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NON-0007JR-Pc
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:43 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOD-0001YO-42
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:43 -0500
Received: by mail-pj1-x102c.google.com with SMTP id my11so3795640pjb.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=bckRd6Jntpm8j9phal4Wv/hlW8xv7NccfSHl2zp6pd4x/pB0UZBdENRTyqBRSI+ZXo
 9+3wKfrTrutDC35eRD62nfV0bGyELB2vmcgcqyAcsK0vUWolWqcGgTNI/zoEcLh7dWJb
 TaXih1jLxmjf6LAkUFZqPfbh5fdWwI90hfqp6XZL1qslkFI4eSKkySTKlUVW8d2tkmVy
 L4I4GY7dfcZ/7Frz7ZisKmEa+gmzBf6NEkxrqMQ+8lktZ1yBecPDWzleYgpTM1bX6Owq
 EmX2takP5qrW4WNksabmJmRbaF5LaCPv1ojQx0+g/TDYLiDZgoSdNH0n75Q3qY6fZ+lH
 wB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=TxJzTKCAw7VY6ayB6X2pQ94J4xCTyG8OdLyPq4EOUSzjPj0kWBLSDs4ehr8lamjSp6
 aIohUksbsLVHGe9nepaH7B1SLHaA3XmQAPlGsPsI4/kAcFfCRhX/6E5n87wbvovHscJx
 Y+tqzwKsX/Z1adIXcFyxqSw+/28KK/mMS/K5/6xGvVZ5SHn0FnpmRx715GYv0PI0XtBR
 UxmDQJiCTta3s1HlI8LHcgKYnLNA3/yISdGX3GXmxKiC1SwMT7+Q4F5N3ebBcPn/Q8FE
 6wLav5svb1b2lV+7xJ8YLu2bvu1LA3O3vPC4VlBC2NKr/5BS8KJiL6MEAc/evD8CLNpO
 sUDw==
X-Gm-Message-State: AOAM531ZrGRLrOA4iEc8pZvhFDq+vfawOg0JE9P5GHMbFaOT0o6v9ddF
 kcgEOu0tNeiZwzLqWZUhv803gk0iIL2F9mRu
X-Google-Smtp-Source: ABdhPJz7VLvJ9lfjLsDmBWR6Wr5p6p4UxlXI4nsWlLhv4iGf56VNS8XQ09MeQQoGkVx9zwEIpMtn2g==
X-Received: by 2002:a17:90a:5209:: with SMTP id v9mr4553068pjh.8.1612378828804; 
 Wed, 03 Feb 2021 11:00:28 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/31] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Wed,  3 Feb 2021 08:59:46 -1000
Message-Id: <20210203190010.759771-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 441ba6a78b..9251337daf 100644
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
2.25.1


