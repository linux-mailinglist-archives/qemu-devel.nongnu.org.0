Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E8030819D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:59:26 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GG5-0005aP-F2
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzQ-0005XT-22
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:12 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzC-00086a-6n
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:07 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b21so5276650pgk.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=R/F3YyFCc8P4RFEKcagFfxMLOvG9vlxwyTklHlikzFx6WPnuKQWec2SILIg7td2fzU
 siH2mWYc7CCMnj+eJF0B1Vixgveut2jo7Gkp8pTi0j65BJQwNvY9Wk1i8kSpJCCRitxo
 YXfGFUeZ+PoJHlJLTCfHOP5unBeerJ+X9jd+1tl0ifjkhOGWY9XaQ8PAgK3H5c78Ij1a
 qDLjKceXJ0esgipHREPO4UGuRZ+VzXEpjn2xkifg7SLO2dLTtzV/ps1Z3s+Phn47H0pO
 OHGfGN7qBSirTQtcKvERMM2v2c77rPhuQ6cdWl4FTgjZQJi+QSCULyeZFwICdhAGjaLa
 JjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAOD8rB2c9GoNvNcKMZwjdplIAr1RvdqOJ4SbnIjxU0=;
 b=Tz8GLrClhmxVdHXzU8PFxcMKpOkxLgsm+K+a0qyIdBthhPFewhcAj9QHXbGG9DF346
 S8aG0Y48qWwCms2596iDuyqHRU7y6AYnCcREQDfX/iNyuts690ZLwfVn+4KLaOVEoVm0
 LzA0OamRo6lw+QSA/H6TKjxPX2gs8SuzNfjAv9sPOe368AyUO2/p/T11UG85yf94iNnv
 kkxNTeoY1khzRZAI5YBI4q6n93WWhkzsG5xMGrA830X6q75nXw6Qz1NZdGng7dQquQgX
 EuM+j1hUNISd5VTvv2URhQHCr6e6pIVxkAYxQAlDuVbP5B0TKHnT6Jhtqct+kA4lx50S
 Z4Sg==
X-Gm-Message-State: AOAM533KrQIEZf+EjiD69HPugc+qW7l1dZFj+bjgtt7PXq86ZBEYwQ4p
 R96nyfT9c2LXonqJ6oe4CfkDdlW3d/ppyGQD
X-Google-Smtp-Source: ABdhPJyCoHhIpJobTui0FmknN/9uXGPI9TVSZnqw3kykCRB1K6dV+XhFOTMI17nfHpzknwMquxbmVg==
X-Received: by 2002:a65:408c:: with SMTP id t12mr1532592pgp.157.1611873714714; 
 Thu, 28 Jan 2021 14:41:54 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:41:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/23] linux-user: Check for overflow in access_ok
Date: Thu, 28 Jan 2021 12:41:24 -1000
Message-Id: <20210128224141.638790-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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


