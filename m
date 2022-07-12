Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB23A572991
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:59:45 +0200 (CEST)
Received: from localhost ([::1]:55694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOr1-0006tB-AE
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBc-0007rX-7Q
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:56 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBX-0002T5-Az
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:55 -0400
Received: by mail-wm1-x32e.google.com with SMTP id o8so5492686wms.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EWeAZEgVjDNYCPX5r/G5ZnsWsZ8ptX15tIjDl2hMt5Y=;
 b=HlPrzP/YAWj4KI4uGXZD9Fef8IwYby2V8B+7pDLACdW1xwcqBd9ZGMi+CqxpUO16th
 dG8CovQXIojMb+TG2I4MuzBas4JS6ewErZBMrM/omWHkNYT0d2IOEnAxoiOBDPBAr8D5
 6ttq0YZ4mWyawdm1IX1x+sdgWzmbbCMsqCuEW6mmoskXrYgyNgrg1OQ9dLrRDjLYFGAu
 m/6SDNd3w6GzoWYW2WntipK7PSSA1HtZtAQDJxVp1DIYTqPa6dzJOJK9k6SkM1x8gzg3
 bWfCGt4hAMCx1KSwVsOXn7tqBteyOtQD+o3UJDhs+b7BKD2DIBRAf41xXVkjAxFD+zf8
 /fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EWeAZEgVjDNYCPX5r/G5ZnsWsZ8ptX15tIjDl2hMt5Y=;
 b=diZPnrQS6HPq+YprWhaM91lJtgDztgwqrikPNEHEKfzREBJAi9GGNASZORqrv0z/1Z
 xCghd1ed+bHyC+No/1JV1QkR1ubu2o/4A5oORQ2hNc6z+tKOVoponakGqcNbuyxMnkUR
 4gt3aUVBGrfVtSE7vLi5VxS2D9/6yDYLrGThnheofAV7CkB6NATo/hkEAXys4D3yb1E1
 I9VEhUMCDvgZhGO+kcR4QO6xy9MhNmpBZwYp5xUvD9i16rFvc5uDmeMJ2jJ3hPgbOlN0
 SQRwm3U0Yuayhoi5QAzCRHy+jp9rL1fHlR6oTWcRe4LV4e1Vx3UDDZ4/ic6D5YjdwO7N
 XaIg==
X-Gm-Message-State: AJIora+R8mY9TEWBJKM5WAP6wpTqOgu8nujlp1sKcEA55MwmfKj2RrMu
 Le3O0cCNcBwS2X4TlTBk2tsCvcxkEK48qb0W
X-Google-Smtp-Source: AGRyM1sxD3vuhFjlFxdVWQ/7MSuvMfOXGD3nfMW9P1nbGdQxToL/YXstcaPMZPRVxWwh0oqGlh17VA==
X-Received: by 2002:a05:600c:1e8d:b0:3a1:9eb0:fd81 with SMTP id
 be13-20020a05600c1e8d00b003a19eb0fd81mr194101wmb.19.1657664210427; 
 Tue, 12 Jul 2022 15:16:50 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c35ca00b003a2e5296befsm181242wmq.32.2022.07.12.15.16.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 15:16:49 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/5] ui/cocoa: Take refresh rate into account
Date: Wed, 13 Jul 2022 00:16:06 +0200
Message-Id: <20220712221607.9933-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712221607.9933-1-f4bug@amsat.org>
References: <20220712221607.9933-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Retrieve the refresh rate of the display and reflect it with
dpy_set_ui_info() and update_displaychangelistener(), allowing the
guest and DisplayChangeListener to consume the information.

The information will be used as a hint how often the display should
be updated. For example, when we run 30 Hz physical display updates
it is pointless for the guest to update the screen at 60Hz
frequency, the guest can spare some work instead.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220702142519.12188-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build |  3 ++-
 ui/cocoa.m  | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index ad92d288a6..fea3566ea8 100644
--- a/meson.build
+++ b/meson.build
@@ -583,7 +583,8 @@ if get_option('attr').allowed()
   endif
 endif
 
-cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
+cocoa = dependency('appleframeworks', modules: ['Cocoa', 'CoreVideo'],
+                   required: get_option('cocoa'))
 if cocoa.found() and get_option('sdl').enabled()
   error('Cocoa and SDL cannot be enabled at the same time')
 endif
diff --git a/ui/cocoa.m b/ui/cocoa.m
index e883c7466e..5a8bd5dd84 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -561,8 +561,20 @@ - (void) updateUIInfoLocked
         CGDirectDisplayID display = [[description objectForKey:@"NSScreenNumber"] unsignedIntValue];
         NSSize screenSize = [[[self window] screen] frame].size;
         CGSize screenPhysicalSize = CGDisplayScreenSize(display);
+        CVDisplayLinkRef displayLink;
 
         frameSize = isFullscreen ? screenSize : [self frame].size;
+
+        if (!CVDisplayLinkCreateWithCGDisplay(display, &displayLink)) {
+            CVTime period = CVDisplayLinkGetNominalOutputVideoRefreshPeriod(displayLink);
+            CVDisplayLinkRelease(displayLink);
+            if (!(period.flags & kCVTimeIsIndefinite)) {
+                update_displaychangelistener(&dcl,
+                                             1000 * period.timeValue / period.timeScale);
+                info.refresh_rate = (int64_t)1000 * period.timeScale / period.timeValue;
+            }
+        }
+
         info.width_mm = frameSize.width / screenSize.width * screenPhysicalSize.width;
         info.height_mm = frameSize.height / screenSize.height * screenPhysicalSize.height;
     } else {
-- 
2.36.1


