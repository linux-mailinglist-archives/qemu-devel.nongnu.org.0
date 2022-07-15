Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE54D57631B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:53:01 +0200 (CEST)
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCLkb-00067U-33
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCLgR-0000a2-Vr
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:48:44 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCLgQ-0006ue-Ix
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:48:43 -0400
Received: by mail-pl1-x631.google.com with SMTP id 5so3275805plk.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 06:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zJST1JlzrBFRfYOJJKYdNOjdYpGZW6q5WVfQSu/8SsM=;
 b=VUYn5pkiSOAR6r52O+vBqb0sH+aaHoUhKFrLfVB+LXuJO98u6DxyMPR9ptHmSUm4TP
 +AEcBMZRKxLJtdUw3GIE6qsonxUZUpdL4CPteEzKuOYKODgAv73Vk9F9kgXyxu8m3xI9
 6Q1Dr9kS/gop1Y86qTwxvRVKBgzldtBqDXbrd+C1Tk/r0oAK/Irz/WPsWXbGX39S9PYQ
 DXv9RNMcfGtQVHdTA8JnrT1C2WQJZXBnQzCSEJqwALhJCqN6cG85rWwX2PbIuEuUo+Q+
 8oY4eVVYaR2D007Sxxni52RDIIvys7AkJUglWwiAk+9tNSH7an0EakSBPZDdOBxE9aJP
 vjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zJST1JlzrBFRfYOJJKYdNOjdYpGZW6q5WVfQSu/8SsM=;
 b=bdDYjwhQGh1/cyMN58LbkubJFCNZ4IGZ6Qo93HbyQaLoaWk7+SHFvZLwMRHLQ3DIry
 LXCMC1PrymdbAbKA8COyPIF8Jvqcar6pzgfI5ST9PIZlvCbqBs3EJp4ZmVxZjFBziIHB
 SSoc8p9zesBy8gv/y7raH4JPrHYibTzxJj2SuyHbZWmaG0gI/VUBCLrgxZj9mcOq3o7b
 dPTg4FxJzG4YGZyKD01QE78nkOjtFlp1PxXqa+mcvKxj4kioWXvgRbEZ6a/bVppl8MUu
 lMrFSQgyIHFGavxxJ59hKtVYxRSl0cr/fClvj0hWJzA29RFjfQ7iQpxB/jIew628nW0t
 +hQQ==
X-Gm-Message-State: AJIora/0TFrhTHwSynoq0dSdCassi+OMpWokOIMNZFbTwa0iqppLHVYd
 oFnmpDYAp3cuain0tWOtoehb3SES0/M=
X-Google-Smtp-Source: AGRyM1txr8wv7c1Vrx/NQr3dyPgltNCam9fP1pXyYDQZiOxfkaK5THueokD5vqV74I2g2SfpRVtA0A==
X-Received: by 2002:a17:90b:1c87:b0:1ef:1e29:8a93 with SMTP id
 oo7-20020a17090b1c8700b001ef1e298a93mr21991504pjb.179.1657892920912; 
 Fri, 15 Jul 2022 06:48:40 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d554:ffbd:f962:2efd])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a17090a165600b001f035bfcc53sm5579126pje.18.2022.07.15.06.48.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Jul 2022 06:48:40 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v3 3/3] meson: Allow to enable gtk and sdl while cocoa is
 enabled
Date: Fri, 15 Jul 2022 22:47:50 +0900
Message-Id: <20220715134750.63090-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220715134750.63090-1-akihiko.odaki@gmail.com>
References: <20220715134750.63090-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x631.google.com
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


