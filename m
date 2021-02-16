Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991B831CDF6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:26:40 +0100 (CET)
Received: from localhost ([::1]:53062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3BP-0001tL-DB
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32L-00074c-Dt
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC329-0002Mo-SQ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:17 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m1so15025905wml.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Mlct+xf6atwH2F+7bny1ciUcRQbh2ZMFeBccJN2qdb0=;
 b=wwryUxyQB3YORbNFNgoxElWOs/WYVZtvQb5minWMsik+05Iz01P8rzWkJZjTLOwpZv
 HrIcptxsEOxIsJkX+fut0bInhSwIQtZCgOoeZwQV4bL+6l2bvk3yxCujnbGwsHCM07aa
 pQ72Hd8mgaIxivU4OdWqsxWQcF3hQTO4y+Tx03dvFdvO4VtUkj9p2tf51kkWsNIsEn/r
 FEBMQOYJeVrD7E90kJ9vreXyV7VS45KRDUNSBkGW1wJCeXvmLk+alKz8ysmQJvXRkxSQ
 vrXWmbZZZ9x7gklhG+ny4DUzGmvt+asGj2szxY56wJ0AXjhrWxqiU2YeRBa9aMLjubfj
 EIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mlct+xf6atwH2F+7bny1ciUcRQbh2ZMFeBccJN2qdb0=;
 b=EqZjMToW6PAASLkRi5tBPSHXN6w2VTN4MD0Ae117umdbfp3p3X0VlpMxRjCq3AU3oa
 tebq2IcvAdkym/pN5HlrV+NVjNHCuyql1qtTI3fihrXkAuX1FKOk5KcOvF4+jE5L7PyZ
 KVxktfUoGRJBqeLOiAWZCJEnHua03iG87lXH350ljoA4q5aJTT67h23kanWp9sSPK940
 EpI3HcXyVHG83UAu98UR0WckB6LH5Wz7Br4Pfsy90oIkUEPqLVO0OXQa4UOS+UU9eFzA
 aiLJKpzl875SVBmZfqkoXR5ulcOkxVjmsr9c0Z2Dve6nxzd86UmvDpmF3rJKhAIR4QCr
 1OLw==
X-Gm-Message-State: AOAM530l1633Pp/WOLU8C4b6qI6bSkvCtFMTe47wIqoJIOfNknUECHED
 cbN0mcpon9YofC8GSmhqellREZPiLLNHMg==
X-Google-Smtp-Source: ABdhPJynyylOala1fK0ZUziCCZvwYxQyoBQnpTJQgm1UEVnLNILhfsgM2v4teMAnf8ukFOD2fcH2sQ==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr3890690wmj.182.1613492224465; 
 Tue, 16 Feb 2021 08:17:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/40] linux-user: Check for overflow in access_ok
Date: Tue, 16 Feb 2021 16:16:24 +0000
Message-Id: <20210216161658.29881-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Verify that addr + size - 1 does not wrap around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 17aa9921657..441ba6a78bb 100644
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
2.20.1


