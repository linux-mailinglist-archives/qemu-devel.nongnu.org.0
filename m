Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85CE31A50E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:11:53 +0100 (CET)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdr6-0003OQ-Me
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVM-0001ZG-Iw
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:24 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:55131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVB-0007lL-L5
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:24 -0500
Received: by mail-pj1-x102c.google.com with SMTP id gb24so132106pjb.4
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=VZ6+CWl+bBO+BSD8d9sZUHaxueIgafPA2gTAEFM6jHJf0AxCDbSXN3MNx0p2xvSO47
 59kzg8T9vHbZla+IhFzqMA6oELLFJi62Uwz4j8DKXsVqRk4IW2mqjQQU6y4bG10K/5hl
 OYulIPfWNsoFdxUmNY1W2Lp9Pd6sfaNE1SVJczRL68eHeeSlVfW/Lw8AvcXgQbrDAdcP
 yCq8fdN+26Ucr/XV/KBiO/ydQGEZ/IZRpLVlNJQNAxxJFqk9i3dZsQ4OmISC0/UPnf6+
 sZUDu5c83C8EyOL3WPK5TvztV1SH5ZfWo2CbS+PEnBQauo7ehz2rBQMQm0693d/FxKC7
 T24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=cO7yXqj6IXRoY8mVfLekJtXC4sScnQc7Bk+Cd7KM5TgHockVprqoB0fa+RH2SDmohb
 KDltqxHFWukTvoDaFrWafKYOANIenc87YXl3bFM124VtsZmtf2QtTZHUDufeGSL1/TaW
 NrNsmMVd6JY23I2QKdhd3BPnAoQzmNtWVmOrQs6xpUicG1qdkOSb6Nkg9kQZzisGEfZt
 Mzef1ga5dX2Gh2a/MnicXaKzBRZFvrgTpDoMjKsclQ5UD3EaJKFMXUxeBn/16yc/MpNM
 Grd0NKdw9tNWst/0B/1zrXmyP/oZhSpbq4KsmiAXDLgQhGS9n6U7d6MFKO9VyFwk3nu2
 G8mw==
X-Gm-Message-State: AOAM5329gQsK4s0WMFwVM0CkMgObBhMewlb5azP8sw8sLbP8lb0q5rvO
 FjcEA7uF2paLCHNxvzvliei5mCVaG6U+zA==
X-Google-Smtp-Source: ABdhPJxzEB9ElhEDZgAvqRLMa+z39jFnXLuk+KpVsVR0qHJmNyy/rmQRz+vL/dPo75hPY48NQazMYg==
X-Received: by 2002:a17:90a:b38b:: with SMTP id
 e11mr4052016pjr.214.1613155752310; 
 Fri, 12 Feb 2021 10:49:12 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/31] linux-user: Check for overflow in access_ok
Date: Fri, 12 Feb 2021 10:48:37 -0800
Message-Id: <20210212184902.1251044-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
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


