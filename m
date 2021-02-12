Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B4D31A51A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:13:36 +0100 (CET)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdsl-0005Ju-4C
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVX-0001my-O7
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:35 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVM-0007os-W9
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:35 -0500
Received: by mail-pg1-x52a.google.com with SMTP id o21so220206pgn.12
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ACfOE8SVSBgg4JpZZoxjcwYfYXJzG1xX3fS2kxeRIKY=;
 b=mqpzC3VXtPsyNvOu96d9QAxow7rc8cCVYVdFUm7f8PC5uK+feQM8oOMxIt+kCgQmpi
 FqLVdNHGmsQAQM4cpndsvQTzyXL3+9dyXkNzysandX9P3TSmNuQMlpgTE5PZXIo1Wuuc
 oydzT5r8Zh902SE4GFgK0ph42F/qP0xNVZOl5F5FQOVw+UDb3wKkqJWILy+WwsrEVBb+
 bLzy1OinMLvpQaZHBvPufDYT5Kdpvu5z0Y0yFlEUZHVgxHDdko/v2EaqKVU7woLig8Pk
 vQKi0VMaePrFMp9ZCMpg0Ct2dNsnEUCr4DF9q8TpVZA4osjAVjcLzI6XjzteUhbLi1OU
 cWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ACfOE8SVSBgg4JpZZoxjcwYfYXJzG1xX3fS2kxeRIKY=;
 b=N4WCJFSgCg/+lvhw0hizyDrxMxPd3LKtLD+9JsIp9j2Z8omMeprZaNJ68V1PWhbvMy
 EOxkv/Do9qz4hEzAnaLK84H83xntSBjF472900hXXnuowBHDZppwN0jWZoghlsCnQq8m
 bSKpl3Tj6nUQvD2R3dJJHZ7VgoGo6UhTi8yRT6u2BzzAiP47iJfsS5w0qUkDkSMsliDo
 V4q7sgPAQOpbjOnBewLuSWq+XW2P99FCe7URWJnkH4jFL2FAQ3Oy01wPZSMeP4qCkYRp
 OO7PJTBsWrFVGlOWkDVkavncrcHk0KjlTvuI7EYIKqCWEQakFf/Zu3UUCU5uAwommMU8
 +SSg==
X-Gm-Message-State: AOAM530TW757Y/foecdf5O+2zt1EsRBrYso3sp0OEn57m2CF9GEDjn7A
 GH3nns4Ul2zsL3oEuBUZ1Bv2OnSSoRw7Ng==
X-Google-Smtp-Source: ABdhPJydE8ReR37DxxImAdYUNdQjeDi0KUR5MOfTJ6MYVFkKSBgtxTxDAMxGtKlzIMJeK6FjdT8h7Q==
X-Received: by 2002:a62:8c85:0:b029:1bd:5441:6cb8 with SMTP id
 m127-20020a628c850000b02901bd54416cb8mr4238386pfd.29.1613155762557; 
 Fri, 12 Feb 2021 10:49:22 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 14/31] linux-user: Use guest_range_valid in access_ok
Date: Fri, 12 Feb 2021 10:48:45 -0800
Message-Id: <20210212184902.1251044-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

We're currently open-coding the range check in access_ok;
use guest_range_valid when size != 0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 9fbc5edc4b..ba122a7903 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -493,12 +493,9 @@ extern unsigned long guest_stack_size;
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    if (!guest_addr_valid(addr)) {
-        return false;
-    }
-    if (size != 0 &&
-        (addr + size - 1 < addr ||
-         !guest_addr_valid(addr + size - 1))) {
+    if (size == 0
+        ? !guest_addr_valid(addr)
+        : !guest_range_valid(addr, size)) {
         return false;
     }
     return page_check_range((target_ulong)addr, size, type) == 0;
-- 
2.25.1


