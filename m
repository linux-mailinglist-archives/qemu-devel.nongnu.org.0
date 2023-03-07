Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611056AFABF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:50:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh3c-0005pI-J5; Tue, 07 Mar 2023 18:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh3H-0005TE-NY
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:49:09 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh3F-0002tI-Uk
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:49:03 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so177721wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NiawUsU8t9iSDPAS2ynsYcKvAPuboz/5nBfIXoe6khg=;
 b=ngJ7LoAniqn69ZUzCIh7UJjhEzokAG3f6buBP17pRCv/xvcOtkHpRRonnrIWbg92c8
 KTMBNjlcBlkxtB717aLR+CMmEOXg0id1s1FAWY4VpTOPFkafo+D8wABZBsSVXSxF/pcG
 gvYBX9KJZZqxUOfVl/uNrsBfAjo+YKunHqWIC80uHXfLlsegp7FjKy6+y6/CD5AfHePt
 0BUoO74+LoBn4fdk1jPxvZrKnWDlvD7phN5ROV8eLxFVfe3bUgoHNwbOq0fYQeUMrv+m
 Rp5uv1CF7XuIT+LVcx5TzmDTXg5t6xbuVFQV4MGPZfQh1H+qj6gz4mKdJJgYV+bH9OhM
 PDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NiawUsU8t9iSDPAS2ynsYcKvAPuboz/5nBfIXoe6khg=;
 b=m0hBi6236xH+MMTPYnxoIM8j2NgEmgzQI6iSaj0EPiKBopHNSA5lCtKp2ipmMUhvMH
 TWL6KxhINjvyTAuP4nlD1RHCPwaFWOZokWD4Fh/B9G5pcWXBAhiXfBGSE607boMvNSJd
 q55G4njA1W4yzEJO24onx0wpA8ZTXldV8UYdY7NDY/CPI4nNmsqWMT9wZ938wFogvT7y
 NmwztaWBYw7CrpAaj2O0LbSg7AqncTjGwlI+qKgff2ehgycRiYJyGtVjJB3iq+zpGmSB
 ovpaXJQJjug+EXHEA+hecJ8pYAifnisn9CJkGuuzXlx/9e3byz3Pw023JMjy4pempuIK
 WV6w==
X-Gm-Message-State: AO0yUKXB95a3CRYCBf4PSXcatNXLyomRzqaQv1SjbQC4PvCeEDmN/7+F
 u0VR40Hrv5M8g4xXJzImkNH/nJuOWJ/5rAh5Xq0=
X-Google-Smtp-Source: AK7set+THg9Dny7OwwXkrer7f6SEhh7Z0Y/Mpfj1rPdzhxXZMSBxkFflGvH7+C3+f5l5tbsyPczzTg==
X-Received: by 2002:a05:600c:474f:b0:3df:deb5:6ff5 with SMTP id
 w15-20020a05600c474f00b003dfdeb56ff5mr14674737wmo.24.1678232940806; 
 Tue, 07 Mar 2023 15:49:00 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 m13-20020a056000008d00b002c54c92e125sm13988751wrx.46.2023.03.07.15.48.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:49:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 18/20] ui/cocoa: Override windowDidResignKey
Date: Wed,  8 Mar 2023 00:47:09 +0100
Message-Id: <20230307234711.55375-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

This fixes pressed keys being stuck when the deck is clicked and the
window loses focus.

In the past, Gustavo Noronha Silva also had a patch to fix this issue
though it only ungrabs mouse and does not release keys, and depends on
another out-of-tree patch:
https://github.com/akihikodaki/qemu/pull/3/commits/e906a80147b1dc6d4f31b6a08064ef9871a2b76c

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230228070946.12370-1-akihiko.odaki@daynix.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 ui/cocoa.m | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 289a2b193e..985a0f5069 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1330,10 +1330,15 @@ - (BOOL)windowShouldClose:(id)sender
     return NO;
 }
 
-/* Called when QEMU goes into the background */
-- (void) applicationWillResignActive: (NSNotification *)aNotification
+/*
+ * Called when QEMU goes into the background. Note that
+ * [-NSWindowDelegate windowDidResignKey:] is used here instead of
+ * [-NSApplicationDelegate applicationWillResignActive:] because it cannot
+ * detect that the window loses focus when the deck is clicked on macOS 13.2.1.
+ */
+- (void) windowDidResignKey: (NSNotification *)aNotification
 {
-    COCOA_DEBUG("QemuCocoaAppController: applicationWillResignActive\n");
+    COCOA_DEBUG("%s\n", __func__);
     [cocoaView ungrabMouse];
     [cocoaView raiseAllKeys];
 }
-- 
2.38.1


