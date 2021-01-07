Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FED2EE6C3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:24:41 +0100 (CET)
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbpo-0002La-F5
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgU-0000g0-UT
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:02 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbgT-0001Od-6Z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:02 -0500
Received: by mail-pj1-x1029.google.com with SMTP id b5so4476505pjk.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gg9A/5gaDVuEyHmllR9pFxKENnKvr5cIesU49SidzlU=;
 b=Lq/HYIf4bCUFFNsQkQ4KVw9BXj/yaBtX0AiHl5q+MY1iqWMZ7bukq4RVWPqX4K+Al6
 5246Jju6ROSPErq0Qr9cBWIWlFOGp7+8m8uaVqGyZZmh4jwLJsYvAm3lAs7qmYVsvcAL
 F7wovWAHjFGPj4LQP5BT/N/y78HQBBlWDLVd0EEs36x9Es3nUnAK61EL7v2+XZiXuvdq
 53KaZcw31YZws6PHcnZtD/ygXLi+nv6vlCciYL8aUsvCrivuGJfdhl9Y8/pbEB2VWtdD
 kZwJTrH28QJp33kvCDeUhH5NX7FFWYA8DY/IGqTg1RovH9/6EXcsVBS/f6/KiMHwGoBM
 VE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gg9A/5gaDVuEyHmllR9pFxKENnKvr5cIesU49SidzlU=;
 b=hw1jnMrFQcwnlr1VgcZzDz/NOOK4qczkvAbRIUkyuHiZIZk5it06N/OiAN/+p6tnPu
 tufsQr0emmeXUXF6AcRApQvT+gPpAhLGoPWQiICIoV7shssNtg8UzIPV7n0xwK3wbScZ
 xpqr9+SRWiHeH3dRSa/EDobA5nHeTKGOH0OK5ylQXZkg/MzbH47QNIRH0Vp8ho0tIEQm
 ouJGC7YgN1/YSIlA3ICSJg7m3C6x+ZTY9py397gxnfxyhkAbE2RWHJac1FYArmUCoDit
 3taUiYQV0C3CCyDwzrUV/6TO7bqyijbgLtmSIMG3+ii0Wqnp39o7HSpRYlFOkPNf/R0I
 FR2g==
X-Gm-Message-State: AOAM533Pz8tIE7Z3JaWUEwmalumlYgPcvS1Uv/ZxdgcclOGDh3UaqUpC
 LRzE61jTSWOHkLbMZ05IK629gCaJMXrrig==
X-Google-Smtp-Source: ABdhPJx60EqaK8KnBJjO/TxpR/zeXW+cN0oelnSfmGmTcS6S8tABXWxmOofxHfHSRQxnuELvw5cXpw==
X-Received: by 2002:a17:90a:6a48:: with SMTP id
 d8mr186484pjm.130.1610050499682; 
 Thu, 07 Jan 2021 12:14:59 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:14:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/47] util/oslib-win32: Use _aligned_malloc for
 qemu_try_memalign
Date: Thu,  7 Jan 2021 10:14:05 -1000
Message-Id: <20210107201448.1152301-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not need or want to be allocating page sized quanta.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20201018164836.1149452-1-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/oslib-win32.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 01787df74c..8adc651259 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -39,6 +39,7 @@
 #include "trace.h"
 #include "qemu/sockets.h"
 #include "qemu/cutils.h"
+#include <malloc.h>
 
 /* this must come after including "trace.h" */
 #include <shlobj.h>
@@ -56,10 +57,8 @@ void *qemu_try_memalign(size_t alignment, size_t size)
 {
     void *ptr;
 
-    if (!size) {
-        abort();
-    }
-    ptr = VirtualAlloc(NULL, size, MEM_COMMIT, PAGE_READWRITE);
+    g_assert(size != 0);
+    ptr = _aligned_malloc(alignment, size);
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
 }
@@ -93,9 +92,7 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared)
 void qemu_vfree(void *ptr)
 {
     trace_qemu_vfree(ptr);
-    if (ptr) {
-        VirtualFree(ptr, 0, MEM_RELEASE);
-    }
+    _aligned_free(ptr);
 }
 
 void qemu_anon_ram_free(void *ptr, size_t size)
-- 
2.25.1


