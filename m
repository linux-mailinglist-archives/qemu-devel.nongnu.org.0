Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AC05640B5
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:27:26 +0200 (CEST)
Received: from localhost ([::1]:47960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7e5m-0002G9-0C
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o7e3w-0001Q4-6R
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:25:35 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:39539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o7e3u-0000y1-HL
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:25:31 -0400
Received: by mail-pf1-x432.google.com with SMTP id r6so707445pfq.6
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LTTJSLWbh0/gyqLlZr11hkpoMF0B1JSdtXPNYsJ5L9o=;
 b=X1Q8w4kTO12dRApYGhC8K08crczlN6XoQV82UVcQtJ7B0FWVDgS5ynZoAa1q1Mjkgd
 U04r0PipOKwAh4fnDj/BkqhYHtGhnjEgNx7KuGxctL/qPiQRcpNR1qwPKRWvZBgAQh8s
 X+56U8AMCiSnMW+L9p9/I9+S6f6+dvAOoms+2IBuOE9AaBIEJZ4K79Mzl8OroEMixGRm
 Vx4BJ92qb2VKLifjS8U34z+Qq8mO8VNcr1za1Z86Mcpqs1W6R4tlui5UFbXq6DUSynkc
 n87TmUBKeMfJIm9hBdCzZrOWOGuMuz1Oee22fMH+g+0CCf33GNOwQoYa8EiF1Zp9uir4
 j5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LTTJSLWbh0/gyqLlZr11hkpoMF0B1JSdtXPNYsJ5L9o=;
 b=V/+jnNBg8M6SATR3qSo4sXW8IkiBR91/WRLnvgoZuNcmvpfSxRzRF/TLz6CRT6bySk
 IA6HhzkMQBdfeTPD+TItbxniRbTv21zEBx1fdiy+151+Fugzec4ZX6BCYWyt0biOjn2m
 K/y8cafVrasKX91llGwPxNsRj+fJp42JC59LWKmT1sF7RlYxunLjMASfnAPiyvxpSrJy
 mx71LXU7fBceyJkxymyK8H2HZQFlRP58jXF6Lvg0XP+n3iieWYnxjKsKHLMs6Wqmd8yC
 ZUwJLMrTQOSwQaqeiDl1AZ45VMz9MvcSsG4cLH4csbqq9FxFdQNjaExpIKlE3t5peoUc
 ql+w==
X-Gm-Message-State: AJIora/TL6PCoj9s5hnK8N9KLuNuTK2Qk5XdOjf4zrz5NEU8Nhgqx1ZA
 wTYHOZAzDvb1Bl8pmRTHdM3hxZXT6eE=
X-Google-Smtp-Source: AGRyM1uJfET6+Yt/MtK4ACxadhYb3vAIfZ06zdv0h9bYS8M5I6yWfhkneUpInbmBySEwbNbE0QoeXA==
X-Received: by 2002:aa7:9425:0:b0:525:279e:9251 with SMTP id
 y5-20020aa79425000000b00525279e9251mr27107878pfo.4.1656771927932; 
 Sat, 02 Jul 2022 07:25:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:c19f:1986:c0d4:95f6])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170902650800b00168a651316csm17440666plk.270.2022.07.02.07.25.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 02 Jul 2022 07:25:27 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v4] ui/cocoa: Take refresh rate into account
Date: Sat,  2 Jul 2022 23:25:19 +0900
Message-Id: <20220702142519.12188-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Retreieve the refresh rate of the display and reflect it with
dpy_set_ui_info() and update_displaychangelistener(), allowing the
guest and DisplayChangeListener to consume the information.

The information will be used as a hint how often the display should
be updated. For example, when we run 30 Hz physical display updates
it is pointless for the guest to update the screen at 60Hz
frequency, the guest can spare some work instead.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build |  3 ++-
 ui/cocoa.m  | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 0c2e11ff071..0f83f3730af 100644
--- a/meson.build
+++ b/meson.build
@@ -575,7 +575,8 @@ if get_option('attr').allowed()
   endif
 endif
 
-cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
+cocoa = dependency('appleframeworks', modules: ['Cocoa', 'CoreVideo'],
+                   required: get_option('cocoa'))
 if cocoa.found() and get_option('sdl').enabled()
   error('Cocoa and SDL cannot be enabled at the same time')
 endif
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 84c84e98fc5..0000a3949c6 100644
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
2.32.1 (Apple Git-133)


