Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60BB4C5742
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:09:44 +0100 (CET)
Received: from localhost ([::1]:60604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1Vn-0008QK-H3
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Tk-0005aD-04
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:36 -0500
Received: from [2a00:1450:4864:20::329] (port=41949
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Th-0004Nr-H2
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 o62-20020a1ca541000000b00380e3cc26b7so3626277wme.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=do5lIaZ/npTxEx4N07G4cTOPZppTqORcQBGB7xayAeQ=;
 b=vd7fEOm7KERL1VCwiDR1WbWUzWoCfYOgI+gwn0eGVbyeg0YTV3DxGCe8a9yMWSQYX4
 JLEjbn9IE3J5xSk4PyeBH8bZ5+dIHI6hfCDcgcVk/iQKZ3oiEkP/Rmw7iL006SSMPwnl
 zvVvPn1ouVUlEhktkzW+uqaR2MaUpurKvHnHSsQMqzJhvlc93wsoXtt7I6i4dktKSegL
 rGQ0cIvNS2iKJWHcw9oe0NT4k9EDQs7p8rNtUxeJz4UQRmML3rNHkGIUETJMFTW0dHEG
 8dkzh86f7bCRJFx3pvq8JgSIWxfnm/kb7k2zHD5o8Vsy2WxHRnSimw+UZfi15uTNBjIQ
 EVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=do5lIaZ/npTxEx4N07G4cTOPZppTqORcQBGB7xayAeQ=;
 b=rryfXb4SHzMEguU7Z1BcJ4RY0w1dexnkO4Cjc21iV+PhgNb7uHfFZRtVtUU6Q9FBne
 RtbL3IM0YLcBlLIPxzZyaRdLlgx5HIqAkf7G5Rd8evO7wCpuGneKM9iDuVeDSELdi9fr
 zS4gsH0Gko3BJ72DvzxeaaSbutZsAOtCt+lfNgMcR+K3mUyUL6mA+oibGZ7YVk9bzRG6
 hdxCV+2UMxL8ezhtTuzzI95Sr0Uoj/q+pD/a5cIt++AOlOWxbLNOoEHLRxiq7dNoAKc0
 +wMOtQdyaDi5tcNZTE2z7x2YdlSer6KsWX3TximfJ9C5toUDGLYJal/WyYf7r9Igapdm
 SEwA==
X-Gm-Message-State: AOAM533cQWdyS+M6IACQr7mD9U3fi8Y9mT+No1RSgn8aCaLZrUNU1Yhj
 PyE7xd/vMtV/GXzzxPx3D7R7hPLLYHihmA==
X-Google-Smtp-Source: ABdhPJxJKRDwiJnf3KtKp48LlKA7YhgO+rpAUSs5+RkNFyhkJwz15pCRfo2Vwg6Hj1fG83ze+8J6BA==
X-Received: by 2002:a1c:a483:0:b0:380:c27c:225b with SMTP id
 n125-20020a1ca483000000b00380c27c225bmr7407547wme.121.1645898849860; 
 Sat, 26 Feb 2022 10:07:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe64f000000b001e60965a5d4sm5622409wrn.44.2022.02.26.10.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:07:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] util/oslib-win32: Return NULL on qemu_try_memalign() with
 zero size
Date: Sat, 26 Feb 2022 18:07:18 +0000
Message-Id: <20220226180723.1706285-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220226180723.1706285-1-peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently if qemu_try_memalign() is asked to allocate 0 bytes, we assert.
Instead return NULL; this is in line with the posix_memalign() API,
and is valid to pass to _aligned_free() (which will do nothing).

This change is a preparation for sharing the qemu_try_memalign()
code between Windows and POSIX -- at the moment only the Windows
version has the assert that size != 0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 util/oslib-win32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 05857414695..8c1c64719d7 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -48,13 +48,16 @@ void *qemu_try_memalign(size_t alignment, size_t size)
 {
     void *ptr;
 
-    g_assert(size != 0);
     if (alignment < sizeof(void *)) {
         alignment = sizeof(void *);
     } else {
         g_assert(is_power_of_2(alignment));
     }
-    ptr = _aligned_malloc(size, alignment);
+    if (size) {
+        ptr = _aligned_malloc(size, alignment);
+    } else {
+        ptr = NULL;
+    }
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
 }
-- 
2.25.1


