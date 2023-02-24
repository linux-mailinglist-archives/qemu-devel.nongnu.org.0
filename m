Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4476A1768
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:40:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSfc-0006US-M5; Fri, 24 Feb 2023 02:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfZ-0006Tw-PJ
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:39:05 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVSfY-0006o3-6q
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:39:05 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso1530471wmq.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=navyt3q4SPPjZARlijLLytRWCegL0Xe7XVQDuE6V1ZA=;
 b=I3ZjtrmiPLLgr8s6oROp3VpXvsEYc+YE+kYlcYhgwTdXS1XTfrAKC82Q13uh5SGumI
 GDeL6f0PNZo4z+JqhviWNtIlzDodQJ9xSz/YDJcXAH4Tc9YBldU8zQa5FDUzac5E2zqr
 RIVjO3Yzxqg8l/R7CDhG8soRdRLc3iCdpCW9S+iQtfJfNdAui2VLi2QjK6zDZkeC+0od
 d8FJVZV4Xf08O7nINszLm06oqKDFREhJoRF0qnyPT+4Cp3zKxz6ghO1/XR5Pm1RKTWuG
 LjuTbcm94d9WXbvT+qLF7OuPk9Wbz3JMMU+rh2msqg8Q1MWimkuF5GtdFt1B3iF+vjH2
 i6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=navyt3q4SPPjZARlijLLytRWCegL0Xe7XVQDuE6V1ZA=;
 b=PKCZL6S7dmEoZdtxqqOkrTkq1xwGKmieNdhHEQIHVUZvu8O++UFArPJzY+ngqsdTeR
 Q7RTxoUZG+bZQw2E/RK1rCadRMaxwzz0tWWkcrHg+I/ZdgCC6EUOv+kjV4twE6ipTxzQ
 t82Q4SCh+wRFwkO9OEmVRVteArDCcfnE3Lak5rfMKT7do06sSzFjlwTbIauIcg+/JnkE
 iEnTkyWAYs8DzCjpF+3dTvj8Y/EBdHXA2YkT8PPC35hE5CEXV7CmT8UTHa7P+hW5SgOk
 VsdcO88/4BzCV/0cJLKvWNTxMZ1nlsztdXtWwE6EAwBiTD5SvxD6NyJ423TS4H1n1jAY
 Z/IA==
X-Gm-Message-State: AO0yUKXCLghUz54WZbb8mKAkgEgPXrtfwhYHVmNLJO4RnZw6eer8o0i1
 q1hfMnpyUmfls/VGpO8+oO594UTTMvi0psoX
X-Google-Smtp-Source: AK7set8WFo6N1SqQGWqNkHl6f4l8MFcFc4e7i+p80y3djOMlRUM7pAJCZkv5EQRlXdVnbDgD+1ljfQ==
X-Received: by 2002:a05:600c:1652:b0:3eb:248f:a133 with SMTP id
 o18-20020a05600c165200b003eb248fa133mr295564wmn.38.1677224342299; 
 Thu, 23 Feb 2023 23:39:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a7bc2e8000000b003e6efc0f91csm1806573wmk.42.2023.02.23.23.39.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 23:39:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 2/5] dump: Replace TARGET_PAGE_SIZE ->
 qemu_target_page_size()
Date: Fri, 24 Feb 2023 08:38:47 +0100
Message-Id: <20230224073850.84913-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230224073850.84913-1-philmd@linaro.org>
References: <20230224073850.84913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


