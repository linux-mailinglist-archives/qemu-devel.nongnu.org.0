Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A86A8F7A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:59:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvcm-0007Ut-LO; Thu, 02 Mar 2023 21:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvcj-0007Sh-2k
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:21 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXvch-0001pk-EY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:58:20 -0500
Received: by mail-pl1-x632.google.com with SMTP id ky4so1363141plb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677812298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzQlLd9zUuaRJux4t6YnHFCedCjY2bATUZGlQrOk4kk=;
 b=qq5GgzVXiFtb7paXe24HRWNpHl4VWdQqJbfqpdqEnYKpVQHUVCyEzd6csff+ybYZTp
 ZqUiugksfFt9qSpL17V2Vghs0Gt/1Wn6ICdVbKu8d6wGY47fM+sF6ZEJniMMNPORRiif
 eLzLMEcapxYvd+PflyyKBH5G5rb7lI9fXaKMmO+7cDGFKcMdzpD33D7Y9oWA+OYpkBjl
 16S5b6UfwDBuR/YVPHb8BMp+LXqYO1fR9DAl4qZ4uviwpK1kltmfE525Q4yEAaMD3d5T
 SGWPdyL949YyeVe65aZGJvbkZMHAvEkIPQHiVxc2/l35QGofSa16ZgildD9FgCvQwzCl
 Laig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677812298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mzQlLd9zUuaRJux4t6YnHFCedCjY2bATUZGlQrOk4kk=;
 b=ohO5DNfBn4BxChxRBwjk9eIWBM0d9eudKorCjaSaY8ETp2gP7C8ljyUSryy7hggYw4
 lUjtQXEYnvw5qUwpT9Ii0O8L8uIsKDller2yGscwz9eqQ5953/nsZ4zr83OyDF6fPROx
 a+YmvdAY4Zimx9KImLsKwZKYEaqrFnlEZvGbqi8j3/XzbmxYCTJv1xejDkYa/JU9BxpP
 bXxEEwVGwVNUFLbDjgnXlZS3lcf4s83xlStzTdfMxfi/28RaQu5EjRKsS3LF0PVlbzbA
 PL3BlL2OF0rrRMBsWGcIX7pLKhWoPjhPewKERZXRez0d2SKAobt7id7uN/7r2voE5HH1
 5KpQ==
X-Gm-Message-State: AO0yUKWibLZ7B7BrotORvDq0TQgj3wpFvSUjMJxx9/y7pYhRL43cq+is
 wcPPfyPbljnNkxuxM6qGbwxecFbAnlib01KdLNA=
X-Google-Smtp-Source: AK7set87bx/HKRI+FUVkym728A4Wfc4DTfaBEOOZCcTP2fS7PE/LGna8wWCt1k8ZqWsRorw0Kwt6xg==
X-Received: by 2002:a17:903:32cf:b0:19a:8e52:ce0 with SMTP id
 i15-20020a17090332cf00b0019a8e520ce0mr585261plr.58.1677812297862; 
 Thu, 02 Mar 2023 18:58:17 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:f3e6:4626:fbc8:b2ce])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001992e74d055sm372244plh.12.2023.03.02.18.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 18:58:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v4.5 12/29] gdbstub: rationalise signal mapping in softmmu
Date: Thu,  2 Mar 2023 18:57:48 -0800
Message-Id: <20230303025805.625589-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303025805.625589-1-richard.henderson@linaro.org>
References: <20230303025805.625589-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

We don't really need a table for mapping two symbols.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302190846.2593720-13-alex.bennee@linaro.org>
---
 gdbstub/softmmu.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index a6c196ade6..6796761fd9 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -506,20 +506,14 @@ enum {
     TARGET_SIGTRAP = 5
 };
 
-static int gdb_signal_table[] = {
-    -1,
-    -1,
-    TARGET_SIGINT,
-    -1,
-    -1,
-    TARGET_SIGTRAP
-};
-
 int gdb_signal_to_target(int sig)
 {
-    if (sig < ARRAY_SIZE(gdb_signal_table)) {
-        return gdb_signal_table[sig];
-    } else {
+    switch (sig) {
+    case 2:
+        return TARGET_SIGINT;
+    case 5:
+        return TARGET_SIGTRAP;
+    default:
         return -1;
     }
 }
-- 
2.34.1


