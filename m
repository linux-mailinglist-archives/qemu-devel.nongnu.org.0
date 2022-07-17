Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8EC5774FF
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jul 2022 09:37:41 +0200 (CEST)
Received: from localhost ([::1]:42954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCyqS-00078r-Ql
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 03:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCyms-0001hs-M5
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 03:33:58 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCymr-00053J-5l
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 03:33:58 -0400
Received: by mail-pg1-x536.google.com with SMTP id bf13so8032808pgb.11
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 00:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zJST1JlzrBFRfYOJJKYdNOjdYpGZW6q5WVfQSu/8SsM=;
 b=jUdgcaZd+LXoh9WZ3xjWgCa5GPlHrP9Hei/sooH6Akxro13DU7fd1E5yJvXjcCFWgO
 pGBnaBUCyWm5iG8HK0o6ZIWO4ueBv4V3ti39MzfhgHJPp3eU8Fdg+Yun57PQxNLvoBEV
 VQYte7Q6oVTMfFgzII8HW2+fdJXuR+5VBg6C39LHS9fnttxPFxALdgy9nMyewp2nfctD
 XOLT8FhXOfiv0vKAvtZZvHyCMM5cmkj64HB4HzLMZwo/AhIe6V8WcIk92qUgF9yDgKg8
 NPiIJkug+HfuJeKtDhR2+jXpSr74JRFgiW95RJtU6xBnjfVqwptlJGoBRkrnaByLqMvW
 CwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zJST1JlzrBFRfYOJJKYdNOjdYpGZW6q5WVfQSu/8SsM=;
 b=ihrIhjurolVvS+jY84OKUIZ6Zj1rLRqYqRIwqzr4kzeDwsmdUsvhQWp6SNy3WFkuBr
 wNnl7V/9eKUKHlnhgmgDzXOpR9n07w30S0cWEgzKBAwmjZcqoSTknUf/1ibjrkuzHCtj
 hhpTVmoWkU5S5kfxGSbf7UGY4XmbqL++ZvGRJaMMNzYaxukzmYU2ESvek8ttC2CWzWmo
 +XSNDByQfCU46gjh1UcxZU/NT/UmiV3qU2moILAeTE9eZw3GcZcLFmyO6eOKkc0acgRO
 5bi7eFoBDpynFfNC/INRapJxeq5pyvlJfOC/DDEHma6ncQaMCx+RePoMnioyu2HDuKvQ
 wuAA==
X-Gm-Message-State: AJIora/Ox/OfS4Nz9EWh3hFlhpiJX904E/U1YdwrhBlRzsoq2bfVxji/
 NDNcLuRvVttDnP3R6zmsC7Sf2P8BXWU=
X-Google-Smtp-Source: AGRyM1sZNukTvxk/vPgC7K3xFaCrO1xktRsbZtr4srMymdUkGxSp4UtiMafyZJgGUavPm9Hg09p40w==
X-Received: by 2002:a63:6aca:0:b0:419:cb1b:8b4f with SMTP id
 f193-20020a636aca000000b00419cb1b8b4fmr13109622pgc.92.1658043235467; 
 Sun, 17 Jul 2022 00:33:55 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:ece4:54e6:b565:8dcd])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b0016c4546fbf9sm6793364plh.128.2022.07.17.00.33.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 17 Jul 2022 00:33:54 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v4 3/3] meson: Allow to enable gtk and sdl while cocoa is
 enabled
Date: Sun, 17 Jul 2022 16:33:40 +0900
Message-Id: <20220717073340.25830-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220717073340.25830-1-akihiko.odaki@gmail.com>
References: <20220717073340.25830-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x536.google.com
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

As ui/cocoa does no longer override main(), ui/gtk and ui/sdl
can be enabled even ui/cocoa is enabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 meson.build | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index bc5569ace15..7baec7896ef 100644
--- a/meson.build
+++ b/meson.build
@@ -583,12 +583,6 @@ if get_option('attr').allowed()
 endif
 
 cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
-if cocoa.found() and get_option('sdl').enabled()
-  error('Cocoa and SDL cannot be enabled at the same time')
-endif
-if cocoa.found() and get_option('gtk').enabled()
-  error('Cocoa and GTK+ cannot be enabled at the same time')
-endif
 
 vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
 if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
@@ -915,7 +909,7 @@ if not get_option('brlapi').auto() or have_system
 endif
 
 sdl = not_found
-if not get_option('sdl').auto() or (have_system and not cocoa.found())
+if not get_option('sdl').auto() or have_system
   sdl = dependency('sdl2', required: get_option('sdl'), kwargs: static_kwargs)
   sdl_image = not_found
 endif
@@ -1181,7 +1175,7 @@ endif
 gtk = not_found
 gtkx11 = not_found
 vte = not_found
-if not get_option('gtk').auto() or (have_system and not cocoa.found())
+if not get_option('gtk').auto() or have_system
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
                    required: get_option('gtk'),
-- 
2.32.1 (Apple Git-133)


