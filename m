Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF5331A4DB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:59:59 +0100 (CET)
Received: from localhost ([::1]:35636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdfa-0002Ss-N0
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVd-0001yc-Sn
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:41 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVa-0007u2-NT
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:41 -0500
Received: by mail-pg1-x52f.google.com with SMTP id t11so237760pgu.8
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EwcrKH1NrGFZArzgiK/QBy4uHtN2oVX1PxAv1FeIOOw=;
 b=DiLrXxI0Ffv4avwGKh88sSoPyKVauqpSPo/aXj3T8Y6ImGeDsNs3MFQW79jw6dBcUM
 aVTO3gr5cgIYneJYUK0Eoqn7zTAny1NQ4SVKuWfjEmy4J1L7EwckCWUsa3Br3HVVw59y
 Hlxr7u8k0b8uZHGfsjzeUbuIkDN4hRjce/f1RxYdIlWqYOgVFGxP3+KQz0QhVz0GhAfm
 9bFXxEDfgl2ZyTbBMEUFICPifHR2pkYBoRU6+DxgAJohTVcu7MuxDzK/qJ8OxKGO3YFB
 nws2Fro3+/xZyrF0RnlUmnxHVBZ95/RctcDxnFL54xZ16aVi623hsUglILxnBIkVXTsM
 nDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EwcrKH1NrGFZArzgiK/QBy4uHtN2oVX1PxAv1FeIOOw=;
 b=NBof9E4MfBT27NzjutXNi3j427yiT4bxPnfFDEhWNXEjLozH8m9o79F7kSKVqjtCtp
 PR/7xRDni0Rv8AGY9liPRh1oTXDMMtg6ux8PQVWZAG9c6gxkROyhMn5czGxzLpQwzwGh
 +IiNA75AVeKUcYDu9jFoSW3vcVB27hh3Sxl6Nl7m4kcvmqgqWe1PRw1HoBdhb8y4PwAs
 CW7A1pVPkpO5iPzBYQJ4IOGx+K/U3qvuKV1JdMxasGmpFaSSKu3lMK7ol1LkqL7SDS5L
 vn/3zc9Ik2Rc+Up/2vnEjk1IvHHUP+brRI+RYdj9rMZB+tjZoEaYQN5HDr7CVkJUu4VC
 PtIw==
X-Gm-Message-State: AOAM530MUu5tcywYs5AGV1jpUAZnKcnlUK/EGtRjtfPKeIGQNViRFG/a
 mptQYu7elk19LWQxcqgDTSKxbNjyaw0rtw==
X-Google-Smtp-Source: ABdhPJwsGOwZaFm9uH0BmKiN+KP3JsgvMBRQmQQSI+YDFeGIe2lx6HkIg1IzCyb2fPnBYMsgI30dqQ==
X-Received: by 2002:a05:6a00:23c5:b029:1e6:2f2e:a438 with SMTP id
 g5-20020a056a0023c5b02901e62f2ea438mr4228835pfc.75.1613155777385; 
 Fri, 12 Feb 2021 10:49:37 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 27/31] linux-user/aarch64: Signal SEGV_MTESERR for sync tag
 check fault
Date: Fri, 12 Feb 2021 10:48:58 -0800
Message-Id: <20210212184902.1251044-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h | 2 ++
 linux-user/aarch64/cpu_loop.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index ddd73169f0..777fb667fe 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -21,5 +21,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
+
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 4e43906e66..b6a2e65593 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -134,6 +134,9 @@ void cpu_loop(CPUARMState *env)
             case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
                 info.si_code = TARGET_SEGV_ACCERR;
                 break;
+            case 0x11: /* Synchronous Tag Check Fault */
+                info.si_code = TARGET_SEGV_MTESERR;
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.25.1


