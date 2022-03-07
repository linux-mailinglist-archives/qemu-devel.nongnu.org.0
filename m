Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5CA4D049A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:53:23 +0100 (CET)
Received: from localhost ([::1]:51590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGbq-0005kg-Fi
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:53:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVx-0001N2-H9
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:17 -0500
Received: from [2a00:1450:4864:20::42d] (port=39515
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVv-0007iz-Qv
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n15so10165596wra.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wNLlmiJKgcgevH7l2nRJUQn8/Ms/TerlHklY+uOxLsA=;
 b=xTyjjVL2OXeg6EXRwId/5u2w32ZmV6gDAzGVwLT/AKmz4mcTs608VSAqj0yAeczzUc
 K4nGm7aHCDGHZOiPlc38ZXUFMco9IOjpsUy9J1evcJ8VWFZBusSi2jc6k/EVzMp3gUE4
 mGT+vZW50G38wefn7vvcv78q0AmzD7g0RFh/E5Am2Mbfr2leCOogZ7sf9XL3RIy5TCi6
 HofSJdoCHwXWN/FGsD+DY3DYBOIByevQ1h+Ky3qRnCcxwFwfX1tNuvOoqLuehyc73vMd
 esIQ7153KkeRMJcBY/y/kA0StG9GhLBxGMCKmux4Dgq59Kc7GpEiKMYXuYhzsu3XAFWH
 K5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wNLlmiJKgcgevH7l2nRJUQn8/Ms/TerlHklY+uOxLsA=;
 b=uLnQUqg87uNdRqRVdf4+ChFf8j1JF/TF85pmUUL/+JhUgqlNIfULQE2VUB+fts9+p9
 ZCtGHiATM34rFYF4cYJvKH2KfP9pWkLgWbO1dME/vC37I9DX/RYtHCTJ/RRdsO0G2TI3
 Zqp4WW/zH/Wsj4Q/J55Q2LeSoCUWZ2k5D+9xVe3P0BtjVBokOe4DLAyRBPZKfWiMVbdH
 W8htKSO2O1t/9NFUaTqZUOyycKISMfOhKqQhCJAj7D7D5QCAWxVk1S0lKu+XnMjR3j/T
 MAvc0KL10yYvDK4ojSDLx/vxjsOxU++KknAZ2zZtu2VRfgGM+rEs0qPLbyEHzqPfShFL
 /mmQ==
X-Gm-Message-State: AOAM533PtyegshhGmt2tl1gGN2Caim2yx3aKJ3cWyaVyzVQ6EOvWJ+ei
 Vhki7P4qW2B2hlGomGqo6dz6rCE8bqN9Mw==
X-Google-Smtp-Source: ABdhPJyoR4SzrLYfoJQrJj553yEq1lUK0dNicSOPjv+Q06b82YF+60d1ITwT4/a5bTlS2ds504yVxw==
X-Received: by 2002:a05:6000:15cb:b0:1f1:e283:fcc0 with SMTP id
 y11-20020a05600015cb00b001f1e283fcc0mr8029596wry.18.1646671634444; 
 Mon, 07 Mar 2022 08:47:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/18] util: Return valid allocation for qemu_try_memalign()
 with zero size
Date: Mon,  7 Mar 2022 16:46:54 +0000
Message-Id: <20220307164709.2503250-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently qemu_try_memalign()'s behaviour if asked to allocate
0 bytes is rather variable:
 * on Windows, we will assert
 * on POSIX platforms, we get the underlying behaviour of
   the posix_memalign() or equivalent function, which may be
   either "return a valid non-NULL pointer" or "return NULL"

Explictly check for 0 byte allocations, so we get consistent
behaviour across platforms.  We handle them by incrementing the size
so that we return a valid non-NULL pointer that can later be passed
to qemu_vfree().  This is permitted behaviour for the
posix_memalign() API and is the most usual way that underlying
malloc() etc implementations handle a zero-sized allocation request,
because it won't trip up calling code that assumes NULL means an
error.  (This includes our own qemu_memalign(), which will abort on
NULL.)

This change is a preparation for sharing the qemu_try_memalign() code
between Windows and POSIX.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 util/oslib-posix.c | 3 +++
 util/oslib-win32.c | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 0278902ee79..f7e22f4ff9b 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -209,6 +209,9 @@ void *qemu_try_memalign(size_t alignment, size_t size)
         g_assert(is_power_of_2(alignment));
     }
 
+    if (size == 0) {
+        size++;
+    }
 #if defined(CONFIG_POSIX_MEMALIGN)
     int ret;
     ret = posix_memalign(&ptr, alignment, size);
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 05857414695..8c28d70904d 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -48,12 +48,14 @@ void *qemu_try_memalign(size_t alignment, size_t size)
 {
     void *ptr;
 
-    g_assert(size != 0);
     if (alignment < sizeof(void *)) {
         alignment = sizeof(void *);
     } else {
         g_assert(is_power_of_2(alignment));
     }
+    if (size == 0) {
+        size++;
+    }
     ptr = _aligned_malloc(size, alignment);
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
-- 
2.25.1


