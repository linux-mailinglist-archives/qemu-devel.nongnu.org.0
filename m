Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A232E6A8F7F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:59:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvci-0007Rr-8f; Thu, 02 Mar 2023 21:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcb-0007Pc-FB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:13 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcZ-0001mZ-Vz
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:13 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so4851459pjh.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4wGdJDq5Z3S9B978lEtV+HF+zdV67+9n1J0Csb0VjI=;
 b=o7QGBGw1fd+TnjQWqbJR6B/4Dd9rjnnS/qRyFuN1FgRjAY+cVWVtYfj7edzy92ro7v
 3VvREFo3nWDg6tii5xNeN/elmpsr6D00O+GZcuUbBLT/Ap3gkt09mVrgIKHKI3X19yAw
 S7UwrL1RLgZlWFseMRBEq1msZd9f/RSt4OvXXXdq56hwPLoyKSuAcav5RHXqjl7+k8T4
 OHsVMyxsLW4pDn+lv9PbW60oowUHHFvjdLvGgCOi/YeMq1ck98N+VG31q4FjyEnQpW8w
 WTDA0SHO0q0VehV44fXZsnoUdxNVg57nx9GE63D/upzKrACNvQP5KIZYt01LR9WghjRp
 ui7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4wGdJDq5Z3S9B978lEtV+HF+zdV67+9n1J0Csb0VjI=;
 b=hKikqd95CqrelHTqeebXXKBxU0tTdU4akX+WQr7aiyl03qSg4Og3zh2DpDqrvgQC6R
 QndeiTX3Z4dF3+wNZxZ9JHi9FRw4+vrK8vgxjz6adsJJxLi3YnSnlIbUJrrSKbdeqizM
 cgSZkrF9hs/yLUKN5B2xfR6H9lJ/wjTSs4oJR/Xn4f5muVUAP3EGETH4GQEDp5JhSPq2
 +xamHBxLX0cLAZ4ipsOTLhqy3Zc5R3U+A+XEp0rH+s+AhOmiJztgKGwrVcYfq20TTn3B
 c8rlddGLq9f3MDtsYGRkcX1ctZItHmDun98io1puHoMrlGOFUxMXqOHb+87jEqc7kdfm
 1CnA==
X-Gm-Message-State: AO0yUKXPp5nGHm49y4fmnu3JCsG6puKM1WPadNZzlY5Jwvp/x7e5bcxf
 N/CHt9beT+4vH7YmJcn1xInOu/WvmVuqbXLt/Wg=
X-Google-Smtp-Source: AK7set+ee/rLw5sSnSiu80tIM2EHoieJCFdBh54fT04GVCoPSFexs2HUAiXDksvdWdJVSIIMagahTQ==
X-Received: by 2002:a17:903:283:b0:19c:d309:4612 with SMTP id
 j3-20020a170903028300b0019cd3094612mr655758plr.6.1677812289333; 
 Thu, 02 Mar 2023 18:58:09 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4.5 02/29] gdbstub: fix-up copyright and license files
Date: Thu,  2 Mar 2023 18:57:38 -0800
Message-Id: <20230303025805.625589-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

When I started splitting gdbstub apart I was a little too boilerplate
with my file headers. Fix up to carry over Fabrice's copyright and the
LGPL license header.

Fixes: ae7467b1ac (gdbstub: move breakpoint logic to accel ops)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-3-alex.bennee@linaro.org>
---
 gdbstub/softmmu.c | 3 ++-
 gdbstub/user.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index 129575e510..05db6f8a9f 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -4,9 +4,10 @@
  * Debug integration depends on support from the individual
  * accelerators so most of this involves calling the ops helpers.
  *
+ * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2022 Linaro Ltd
  *
- * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 484bd8f461..09a18fb23b 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -3,9 +3,10 @@
  *
  * We know for user-mode we are using TCG so we can call stuff directly.
  *
+ * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2022 Linaro Ltd
  *
- * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
-- 
2.34.1


