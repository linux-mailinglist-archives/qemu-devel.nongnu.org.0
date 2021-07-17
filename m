Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7553CC6C7
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:27:26 +0200 (CEST)
Received: from localhost ([::1]:46458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4tiP-0006t3-9z
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcT-0001nk-A7
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcR-0000lP-Vv
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:17 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so10398550wmb.3
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=za/qVhXBTOOMGm/fSlxijFTtDoalddnYqbJh5v7Hspk=;
 b=Q42/H4TyUcJUNT0kaDMf7YVooSdRHqt4rXQWTihq3ACMul+OxFsdBmPp4zSqDJ9rip
 JBReggu7dWw1kNjq3vJEJWyYbx4fRD31MfcNLbMRPxHyCa1cyBCIsWqD9//75OUCyP7i
 M1LE/722B+uBHbXPvQi5OElM64rRiXduaSFgzLPam4xk+3O768Gs7VuRkqPrvYS+yYzH
 KkCZAHrXsCCdA8C53egYWaNo+qvcf5w74OYs8UU99XoY7wGBzt3rccDQk6JnGZIZ1Y/L
 ygqOfGwPc24mIp21SohDW595qC+AlRxvIa7autIjWaPChwGIqvRFB6/Clqt4tn1DDUyQ
 mTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=za/qVhXBTOOMGm/fSlxijFTtDoalddnYqbJh5v7Hspk=;
 b=Fm73RE+vQHQPzj6y8GaSXP3zj/3yc5GGo6AqnG648cYKx57xPK/oJkgBYXOflY2kEc
 +6s34jiNcnmIo+TZgwlyCgXYpUTf4R4SdmXMQVMGK9YKSBhQNUzpNZYslOLk3OVUispE
 8OwmtowTzqWO/9/68fpVzA/IG16rx+NXoIguq4wfUizOV3kJxQM5XDIoRi4qEjF8eZRt
 8bwPvVmSMJQbuUT/4LGGp0GQnGYVobSv+GwGC4Se7moWiP12TPGB7peNbidFCy7I1UMW
 8vEOkP1ekkwXEKkX6XkX6niZdnWzA268hxX8Ag8EARqf60UGaArgsEU/Da+iL3v5SjB3
 V4vg==
X-Gm-Message-State: AOAM533+LjnmblIqS9DHJ071sJ96wFFBRNLShd7MKypzyStb0+MJFIxc
 Vh0qndG55pIloZbS/VQ5zeJQAE+rXdhlEA==
X-Google-Smtp-Source: ABdhPJx1vvw5PkaIzh6DsU1bfxE90gz/bYm3v5HDoFgWsxjklr2EAAZJnQKv+DYJlueqDlEDcC5NQg==
X-Received: by 2002:a7b:cbd5:: with SMTP id n21mr24661176wmi.2.1626564073400; 
 Sat, 17 Jul 2021 16:21:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o15sm7082517wmh.40.2021.07.17.16.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:21:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 10/10] linux-user: Move DEBUG_REMAP undef to uaccess.c
Date: Sun, 18 Jul 2021 00:21:03 +0100
Message-Id: <20210717232103.18047-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210717232103.18047-1-peter.maydell@linaro.org>
References: <20210717232103.18047-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 687ca797893ca1e853, the code that looks at the debug
define DEBUG_REMAP is all in uaccess.c; move the #undef line to
there from qemu.h (thus reducing significantly the amount of code
that gets recompiled if you need to turn the debug on).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h    | 3 ---
 linux-user/uaccess.c | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 5c713fa8ab2..acc215b1a48 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -3,9 +3,6 @@
 
 #include "cpu.h"
 #include "exec/cpu_ldst.h"
-
-#undef DEBUG_REMAP
-
 #include "exec/user/abitypes.h"
 
 #include "syscall_defs.h"
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 425cbf677f7..56fb4358d4f 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -5,6 +5,8 @@
 #include "qemu.h"
 #include "user-internals.h"
 
+#undef DEBUG_REMAP
+
 void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy)
 {
     void *host_addr;
-- 
2.20.1


