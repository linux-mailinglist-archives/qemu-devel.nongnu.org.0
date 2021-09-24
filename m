Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1013541797A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:11:53 +0200 (CEST)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTojn-0006YA-WA
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY2-0002fZ-3D
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:43 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:41541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXw-0006x0-Mw
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:41 -0400
Received: by mail-qk1-x72e.google.com with SMTP id m7so11925475qke.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uDmWChPs4lp5UI8b6weWaZXX8zbdz4czXb1drnckGg=;
 b=y1R55l3yDenfrNbpwSVjFg0dDYxN3NAVRc4/S5F6XCa3I1mbBizZCnYiqMdkoIiP5J
 6M6ipzFF+AG2LVcdEVBcSRVKqMYrjNZYLhY5xIvFNqNghP+cYi6pjc1/fonXga4F/q3U
 OfzGz8CMN/oJ8UxLCraq2npbYiNwUCCHuMbkPWPxtvLu7VsIychWmtoKnfJw2MVNoUQY
 TeF4odtEcCqz3m/awjef3Q+k03djVl5WWA6vz3CSdv81jm7N/gehtIMQidr7L0Xxdx5F
 IsbcJcGGYe+3LZFzVr2Cow1NXfaTbfjULbvoMjwDwy0H+BO6Ism/oGJhft0FqNwtfFzI
 R+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uDmWChPs4lp5UI8b6weWaZXX8zbdz4czXb1drnckGg=;
 b=30jGSA9WAC2MBZmKLhTQ5/ISOuT9z7asZcLVOY8+LGCpIOe4XGp8C8p0VhCLZLcMso
 wIZYYsUqMOpB+Zr7+vvlMHRdseM+pNaCb/P23NzrDD50KlgpccYJj0KjQ38d5YafdJFv
 mH+FfFY/2AI6C9XHQbYCu0MvombvUHtP7ajWEVmDHDjPtvRdmMBUSOKwJAIOUVUiFeIn
 dSkxaxmAHFH1NsBvsK/6SB9bO776aRxbfu2QKv8ltkk8LXGp5nom58XpXivWj5j/9j9H
 D4ednnFACOSkY6dG/pB2c9pHCsbTCMq7+Lc7r3sQCY5MrdZsPb1UeLp3o6MJXt0toARI
 F1SQ==
X-Gm-Message-State: AOAM532NBtOzZLOuT/gOFGUFphihIV1sHYbEGBdMYdfFak14Yi8pGJgh
 mJB4iG1rNmkoy5335/ZoM5KX41/7azLiug==
X-Google-Smtp-Source: ABdhPJwrAeKbWbscNeC9hhJdJpelF0X8l7V28bM6GecKbHCTeJ3iFNz73miTOtQNRKe8Gjveah6IRA==
X-Received: by 2002:a37:64cc:: with SMTP id y195mr11350785qkb.97.1632502774804; 
 Fri, 24 Sep 2021 09:59:34 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/27] linux-user/hppa: Document non-use of setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:08 -0400
Message-Id: <20210924165926.752809-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We cannot use a raw sigtramp page for hppa,
but must wait for full vdso support.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/target_signal.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index 7f525362e9..d558119ee7 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -71,4 +71,18 @@ typedef struct target_sigaltstack {
 /* mask for all SS_xxx flags */
 #define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
 
+/*
+ * We cannot use a bare sigtramp page for hppa-linux.
+ *
+ * Unlike other guests where we use the instructions at PC to validate
+ * an offset from SP, the hppa libgcc signal frame fallback unwinding uses
+ * the PC address itself to find the frame.  This is due to the fact that
+ * the hppa grows the stack upward, and the frame is of unknown size.
+ *
+ * TODO: We should be able to use a VDSO to address this, by providing
+ * proper unwind info for the sigtramp code, at which point the fallback
+ * unwinder will not be used.
+ */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* HPPA_TARGET_SIGNAL_H */
-- 
2.25.1


