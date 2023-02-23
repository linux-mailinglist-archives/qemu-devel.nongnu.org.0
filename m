Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63B6A13A8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:19:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKqs-0008Vy-Hc; Thu, 23 Feb 2023 18:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKqp-0008Vj-IA
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:11 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKqn-0000T0-Vy
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so857493wmb.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A3Lx/mtOBWkhA4XGJqZifqoY0L2i4FrcNzgDZGb4hiw=;
 b=kMTb0RUtsQU4GqDDSpGtidlgHuVx8RX/IY30nkhnHgrJ0lJjVBEhlJyXuAvGZU134K
 rtnhiHo4jIJqTlE3HL/6as8Uaq4kEhA6B6bNNLPN8I/vqIIC9sBvfL9Md/2lRZdZN8qI
 JqiD/pLhp1UTHP7elxg5o+JQ/Jqg1w07WFH1AA+uXcu4BqHR1c2VIjqLRGOJBZAOMaYC
 vBzZDvRFD6mY4ztsxGpMh4LbN22LZ3GFkV1U6fim2KlWa19l6HNsPyHb5g5jyf9D/zYf
 rLaU+S8tJtapqCYFQaaI7xaIs50JTrsyHP0mpLjQKZbOGMNqSFCuBufSeh5yIVzICpGx
 Q5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A3Lx/mtOBWkhA4XGJqZifqoY0L2i4FrcNzgDZGb4hiw=;
 b=qbUeBaC1OND49vyhXKlWAdTOiuAN/yu0kPLzwrCMPGKF5+aMJrzWWwBlnbtFmnR6nq
 3d/iC9ab9DYAMlDabkN3zGhEkrHTghOzzSskaNdtZN0Kgbr+P1CkNTK/TeVaIkNqHHfx
 XwxqRfn/EqSPLlNuNoFztQ+WTgjHHJqx66YXKwp+cvD73noUOrtf3CymfNTwGNT2obCp
 m3cI1auKIykxauVqi9ePyYOc9dnZsHnBu7G0aWODtUYPPu61V3oJPZck2UHt5z9rkIkA
 bYLnUuX0JPtaQO0AeO5s/DWL1O4AuX53sUF5eSLd+J8bbASQkPKlHD2sGRHzLMcuFY92
 U8hw==
X-Gm-Message-State: AO0yUKWEaS1U7+n17wJrpDJgtKjR7J4p9ylxFp7myd15Bld3+Tccq1qV
 7YJuzQwYhoK8E6ASa1TH6sYuMpO7apA/ufVf
X-Google-Smtp-Source: AK7set95dWP/ESeVzWvSUIhTXhBFq0DurpKCiN/y8Sdz2xMEAa2YBcj7FTLs2o17UX3JJs0MqriJuA==
X-Received: by 2002:a05:600c:810:b0:3db:2e06:4091 with SMTP id
 k16-20020a05600c081000b003db2e064091mr10609938wmp.37.1677194288110; 
 Thu, 23 Feb 2023 15:18:08 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a1cf716000000b003e1fee8baacsm758351wmh.25.2023.02.23.15.18.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 15:18:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 2/7] dump: Replace TARGET_PAGE_SIZE ->
 qemu_target_page_size()
Date: Fri, 24 Feb 2023 00:17:50 +0100
Message-Id: <20230223231755.81633-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223231755.81633-1-philmd@linaro.org>
References: <20230223231755.81633-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

TARGET_PAGE_SIZE is target specific. In preparation of
making dump.c target-agnostic, replace the compile-time
TARGET_PAGE_SIZE definition by runtime qemu_target_page_size().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/dump/dump.c b/dump/dump.c
index 7101169ecb..3784a9054d 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -15,6 +15,7 @@
 #include "qemu/cutils.h"
 #include "elf.h"
 #include "exec/hwaddr.h"
+#include "exec/target_page.h"
 #include "monitor/monitor.h"
 #include "sysemu/kvm.h"
 #include "sysemu/dump.h"
@@ -1859,7 +1860,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     }
 
     if (!s->dump_info.page_size) {
-        s->dump_info.page_size = TARGET_PAGE_SIZE;
+        s->dump_info.page_size = qemu_target_page_size();
     }
 
     s->note_size = cpu_get_note_size(s->dump_info.d_class,
-- 
2.38.1


