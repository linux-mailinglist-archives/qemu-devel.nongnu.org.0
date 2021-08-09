Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538833E4994
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 18:17:25 +0200 (CEST)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7xs-0002Nu-DA
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 12:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD7v4-0001TR-U9
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:14:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD7v2-0006B7-El
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:14:30 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso15137150wms.1
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YChhRY1Q09WDANrUvOKZQuT7fzBpyWYMh1Yu12+F6OI=;
 b=VdvtdjjlKTWOgABmUxs2T5UBXD54n6VJKs8vzQrlui6/vC0O0BihWedC5ZKQ5Ixr8a
 yc5P40hOYjXVK52iciWBccwZANJvS5WOSuKebjZreiKygFwF90CizpgxcXZx/MGq/4tu
 6H2aHV7agwvCcrrShhpAO5DvJQtXcP9tfRx/OBiykHERXW8xAW7zmM3seplxoPBE+4Ut
 lrUYJ5JkrJaSKRF0CKgaP9uH4r8cnwOazrURpqLdI0V4kzizDOKgtK+cwXxSEkAUgeru
 nNfn4Pn0DVSefSOc4SglLK+7nJ1pHKshh63stKcgqc0hDQVDulRs8yS/4inZou/FE715
 VZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YChhRY1Q09WDANrUvOKZQuT7fzBpyWYMh1Yu12+F6OI=;
 b=r4NZMqrCVcitYGbmMvV8TlshX1lWpqB5UPgrb1nvWFFKS/txkrukrBJt4pu13U5OAJ
 qk0oJ5t2xBeQku7aIjTLInpR7iHtBcSNpgJbksn72UjaZBaYV4L+3gqEcr4Q9e2GQKBQ
 wfKmm8SWHMDhJhRGh2O2joMBcaIO7EvgFZT34PFJlofGLTLVkm5hvGHNzBxqsMDkIic4
 Lbz2HbIDnaeIgMmSejP/LghNVPXLj0+ACqEiGvRKcr9a2RSpqAD3RH29/s42KfzBVqFT
 a5Jyv19YCCRA5t1HC88/BMbRhnPIQoj/PKbWHO6NrMniU/Ab4tR3wFiDhbG60cX2xKKX
 gCDA==
X-Gm-Message-State: AOAM530YrgMZUesBImGiU+Q/eWuor5eHRWAqjQ/MbE+bWFfGlefte+lA
 vg42ZPjwHOGZ+v0ln0fsL9nU4WPIhAa0uw==
X-Google-Smtp-Source: ABdhPJy8eUEZyuAnd8HCpztivigxi6Z8GasSeciziJNbNhk0Tqoe4v567PHLXflFJEP/bbUyHE+iXA==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr17880469wmr.168.1628525666275; 
 Mon, 09 Aug 2021 09:14:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u11sm19924148wrt.89.2021.08.09.09.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 09:14:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/sdl2: Check return value from g_setenv()
Date: Mon,  9 Aug 2021 17:14:24 +0100
Message-Id: <20210809161424.32355-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting environment variables can fail; check the return value
from g_setenv() and bail out if we couldn't set SDL_VIDEODRIVER.

Fixes: Coverity 1458798
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I followed existing practice in this function for how it
deals with errors (ie, fprintf to stderr and exit).
---
 ui/sdl2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 36d9010cb6c..17c0ec30ebf 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -817,7 +817,10 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
      * This is a bit hackish but saves us from bigger problem.
      * Maybe it's a good idea to fix this in SDL instead.
      */
-    g_setenv("SDL_VIDEODRIVER", "x11", 0);
+    if (!g_setenv("SDL_VIDEODRIVER", "x11", 0)) {
+        fprintf(stderr, "Could not set SDL_VIDEODRIVER environment variable\n");
+        exit(1);
+    }
 #endif
 
     if (SDL_Init(SDL_INIT_VIDEO)) {
-- 
2.20.1


