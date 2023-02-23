Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640D06A13A5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:19:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKqz-00005S-IB; Thu, 23 Feb 2023 18:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKqv-00004z-1r
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:18 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKqt-0000Tz-II
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:18:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id j2so12062892wrh.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YodLQ6Jy9StluVoxn7rMSmPHABPnJhceDgMNZVIgnqg=;
 b=dD0eu13AiHPkBpWeOpOuxOHSQFyf8qaDNZL4ohACPWUqiwZG0FEXl7gHJ7/mUjMuIU
 gQrnhqOX+rjrG+o8Vs9NgcFpznkR8iTnWhlLfxbabQSDI3BRMJVfcPLm4uEYMZ4GUAzQ
 n6ANllaEoQNlcEpK+WeccGeED8TryjpqyrkQlmQpZOzgHR/ErRicnH1N4jlWGJct/w7S
 9q+jJ09Pzf5F4s2odLp8U39aSWpaGWCplqpCHn+DoLS83mn8LyadlulU3dGMDv92B1yo
 EFKTYRFRzoVwnwbMob2DpqZJh4nSqglPQzu5RKjKCXZ60nm+NDNZenQtXbo13mWPoU8W
 Rt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YodLQ6Jy9StluVoxn7rMSmPHABPnJhceDgMNZVIgnqg=;
 b=QL+5DNUQGQVDNJdNkln8n6VtzN2xtP07zDxMJJ8FUKfE3o6M/zEmQQ1+64KtfgxrH6
 1/mXxqCJBj7zmMLNYmKdevFFTcU2Kv9I90ia1Fq4umUS3ol+oX7vi/VFn4lDoSu3NtBm
 nswaTAvKAX1xcLpIrO+Hz1d/fsc9oiopTRBdEB6HW9F3n1SSmg/9cGdNapyOSSBba1Nu
 Q6TBIAg4I25M5vklI5TvZli2A6Sz2xgYYoKs3JDpc0i6KWD3Wsdd49NUROUv86RgOc+4
 FYwDVq7CKrFlf3S/R4GRC5sU9RorjE3oObu38L1KrOOD9dnmIVtVnun3dXrXTrIFQhoR
 0kGQ==
X-Gm-Message-State: AO0yUKWlA96c05gGF/3f/T2MmX1im8uWlyrstEPsug9XJ4VNpNMzDNUT
 RlHHZ589eT+NOg4XrqNmEGmrUgfj9LrZa5lV
X-Google-Smtp-Source: AK7set9qH57vuXYEmvJqUiztfqyeRV4ODthIE45KaAXfMf5c374shWRrB9VdJk87B2ZAqlcxx24Feg==
X-Received: by 2002:a05:6000:103:b0:2c5:4ffa:ba55 with SMTP id
 o3-20020a056000010300b002c54ffaba55mr11930694wrx.69.1677194293830; 
 Thu, 23 Feb 2023 15:18:13 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 iw8-20020a05600c54c800b003e70a7c1b73sm743589wmb.16.2023.02.23.15.18.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 15:18:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 3/7] dump: Correct headers included
Date: Fri, 24 Feb 2023 00:17:51 +0100
Message-Id: <20230223231755.81633-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223231755.81633-1-philmd@linaro.org>
References: <20230223231755.81633-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

"qemu/win_dump_defs.h" is only required by win_dump.c,
but win_dump.h requires "sysemu/dump.h" which declares
the DumpState type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/win_dump.c | 1 +
 dump/win_dump.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/dump/win_dump.c b/dump/win_dump.c
index f20b6051b6..12b7da5da0 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -21,6 +21,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
 #include "hw/misc/vmcoreinfo.h"
+#include "qemu/win_dump_defs.h"
 #include "win_dump.h"
 
 static size_t win_dump_ptr_size(bool x64)
diff --git a/dump/win_dump.h b/dump/win_dump.h
index b8c25348f4..56f63683c3 100644
--- a/dump/win_dump.h
+++ b/dump/win_dump.h
@@ -11,7 +11,7 @@
 #ifndef WIN_DUMP_H
 #define WIN_DUMP_H
 
-#include "qemu/win_dump_defs.h"
+#include "sysemu/dump.h"
 
 void create_win_dump(DumpState *s, Error **errp);
 
-- 
2.38.1


