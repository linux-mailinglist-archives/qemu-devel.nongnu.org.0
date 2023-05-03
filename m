Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34426F5206
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:42:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6wu-0008Ie-Pk; Wed, 03 May 2023 03:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6wi-0007lJ-RX
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:30:44 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6we-00071W-3r
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:30:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3023a56048bso4438877f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683099034; x=1685691034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NJv9OOJTdlX++M0pyUMomvcf+tdOdIff0jFcTgQSmI=;
 b=PMfo1BfOr6M/UEEksrRIxXTs2fW/SJc+NN9yWTJAGblk+FlIk7IBD+IkLWIxsJWOyd
 S+U7GyvEloKvtCqDxyi5+eYA6pvRvnPfGbdqhIWcF69kl+yOi/oxpTByU1khEpq4n1e6
 LSXT4e0TVY0prJXJERLQPkrksdmxi1YAi9bUQBHZhKwmaojydduy/K0t0hrL2+unLv2g
 OeUF5K57iNYjmYxT1222SZHvk8wDCwwCuWTUeJBYnsfdJFyV3fmdLhx6w0lUap9bNWw4
 wO3rtEDzxeRXlxMjoYxOqkhCvEMVlzvJOCVs+gEqXIZFreFxoZvJJNgrLJHUczIquz3c
 tNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683099034; x=1685691034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2NJv9OOJTdlX++M0pyUMomvcf+tdOdIff0jFcTgQSmI=;
 b=WuWbP7vO6OY/jVTV2mrUQuh0kQ2VI+FtI/TiPglgWm3mms/VONRDWOFEaVY2Hnz35h
 r3dWNeluTBa5ZEBct3ksl70yZT0ptUCUtpezC3k4DECKRW8LMu823WdceoK1OHIkrlqQ
 po+SrqbhKCYwYO9L2nznfKJn5rmBtan0BJ9ib6NEJfH2QJqH1zJ4lVWApkATvgRpQvAU
 ms9lzcJ19SnAtURzIKc4j0p/9dxp3SWBuFNI6saGXFa0VLs8OfqjjJcR/N+MgLhvSlIG
 ljRR52qiNgB9ieMyveb7lRSRyPbAdg0T1TB46U8axUUUFimAWmj4KsouNntinhtbhYX8
 UDGQ==
X-Gm-Message-State: AC+VfDyxhnG3OzRHTxFFFvMUYb5/u9pKs90Hk8zCY9fA332msQxM0AiM
 261e+628T3m9sqBX3o091qv5FLOxnQMZKxJP6vaPaA==
X-Google-Smtp-Source: ACHHUZ77Pr4vc+1aNWmYiONFjutEYyW5LoFJYLrbJbC8VP2onl/XkcVVs6dNS/RB8EM2cbVxhERGiw==
X-Received: by 2002:a05:6000:1145:b0:306:2cf5:79dc with SMTP id
 d5-20020a056000114500b003062cf579dcmr6012766wrx.35.1683099034279; 
 Wed, 03 May 2023 00:30:34 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a1cc918000000b003f0ad8d1c69sm982896wmb.25.2023.05.03.00.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:30:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 81/84] tcg: Split out exec/user/guest-base.h
Date: Wed,  3 May 2023 08:23:28 +0100
Message-Id: <20230503072331.1747057-82-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

TCG will need this declaration, without all of the other
bits that come with cpu-all.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h         |  5 +----
 include/exec/user/guest-base.h | 12 ++++++++++++
 tcg/tcg.c                      |  3 +++
 3 files changed, 16 insertions(+), 4 deletions(-)
 create mode 100644 include/exec/user/guest-base.h

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 95b9947e20..09bf4c0cc6 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -84,11 +84,8 @@
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
+#include "exec/user/guest-base.h"
 
-/* On some host systems the guest address space is reserved on the host.
- * This allows the guest address space to be offset to a convenient location.
- */
-extern uintptr_t guest_base;
 extern bool have_guest_base;
 
 /*
diff --git a/include/exec/user/guest-base.h b/include/exec/user/guest-base.h
new file mode 100644
index 0000000000..afe2ab7fbb
--- /dev/null
+++ b/include/exec/user/guest-base.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+/*
+ * Declaration of guest_base.
+ *  Copyright (c) 2003 Fabrice Bellard
+ */
+
+#ifndef EXEC_USER_GUEST_BASE_H
+#define EXEC_USER_GUEST_BASE_H
+
+extern uintptr_t guest_base;
+
+#endif
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 8314b912f7..460ec66490 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -57,6 +57,9 @@
 #include "tcg/tcg-temp-internal.h"
 #include "tcg-internal.h"
 #include "accel/tcg/perf.h"
+#ifdef CONFIG_USER_ONLY
+#include "exec/user/guest-base.h"
+#endif
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
-- 
2.34.1


