Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BE030E325
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:19:46 +0100 (CET)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ngn-0003IX-3U
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOL-0007FZ-1L
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:41 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:56207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NO8-0001Y9-Q4
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:00:40 -0500
Received: by mail-pj1-x102d.google.com with SMTP id s24so221451pjp.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=XqG6wHWXj2zbXFyi07GXn8kljDPIB7SODWlzuojWV2tkEsNqUnOCNcwbv05skV0ORh
 kHLKA1xYnBBeDfFoNNkVW1iivJpGgHbUx6aD16A+17fw21y7/2QzMHN+iClSd2L/Ol+J
 c472h8YWr7GX7ishxIanPD8baEQ7JDUdIMenmBE94dZmAz1qRj4jAE2U+x46dzgK91Hx
 mAPUICY5Ydh4g/VLxBi6KV8zqdrJDK8rPX2QS830RBql4gvZS4Z8IVGioheYxDCk+ICl
 bQcizvgypCXD8WI9LI6rz87vT1z8ekCj2dgxTAYRuU2okPi1t+OabsqpiCDgbBackg9J
 Qoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=tzEI3RKSGit48bxFcVoqDunWhodfV3L+9IIUjSk50rUgV5bpdWgt5aB4SAmcziebil
 zxZqZk/vWj1DWOvCVnc5C0oNDV8+mLL2n67m74etg6O5u3S3rMczR/J0l82/jjShLagf
 t7uRPd9AXjgRpIu44MOr9DasTuV9iyME1DcqatAoXbl7c/kMz4D4PbOoHXXLuGtznLrA
 FxJ/G47q4b7mUQMfn9vLUOT42rwtrpI2t5ODIbC4CPIodfJ/VhwposSbPwoayaIk4nS4
 ToFTYHOIV00ka7iJewNQmmTCXFte1+YM1hKviriWcdbJ8HIlE3qa8fGnm5VjUKnoJV5o
 G0nw==
X-Gm-Message-State: AOAM532wzkspbD7dQjMg6qJp5FdRY2mb3BdR7fAMKw41Tqi2YIpA87bo
 znLz6CL6BAHnqGEor3hviN6U/050SjS5euwP
X-Google-Smtp-Source: ABdhPJwuJvYpenr2XkA045H7AFH9hrm85WdcAI4rL3GSCWMGmVRFztwYiqIReKnBbOong53V0Sag0Q==
X-Received: by 2002:a17:90a:fe11:: with SMTP id
 ck17mr4401886pjb.152.1612378826771; 
 Wed, 03 Feb 2021 11:00:26 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/31] linux-user: Check for overflow in access_ok
Date: Wed,  3 Feb 2021 08:59:45 -1000
Message-Id: <20210203190010.759771-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
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


