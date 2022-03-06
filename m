Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CF4CEE76
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:27:43 +0100 (CET)
Received: from localhost ([::1]:36594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Hu-0002XW-93
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:27:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09G-0007Sd-G8; Sun, 06 Mar 2022 18:18:46 -0500
Received: from [2a00:1450:4864:20::431] (port=40763
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09E-0007PU-W1; Sun, 06 Mar 2022 18:18:46 -0500
Received: by mail-wr1-x431.google.com with SMTP id k24so11194236wrd.7;
 Sun, 06 Mar 2022 15:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LG/c+ztFQy+lUqxAjjhbBGZeuruF9FjjhdwvvjkCJJo=;
 b=c5KvniZr3NAmm7o04SW2gxatubovbgQhCjoIp0NG+tvllj6YW2hGA15KVHP0uGBkv4
 pwoXiuUrw9VZ98wOWqKt8Ui775Bqd96r3qw8THDtgwkRpln+NjqT1n/84NU4pD3yokZ7
 U/3x860jh7pejP1CWP0Ucj025Ib4J2FHyD7/OZLWFM7yz5Yd6oj8OqlIUEydTcufOWEQ
 YfC8dOLN2mls2INIbuZ1GleVvwJnpH1HKN9SQeCEZax9BabOnzBGX61tjcxd6yBSEOXQ
 2fa/MNfqnPK9N3yARYiBGAtX7OJvnjhHIk040f2vnHif+r3FyabNcS+Fo3EWCY8JrVuE
 S/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LG/c+ztFQy+lUqxAjjhbBGZeuruF9FjjhdwvvjkCJJo=;
 b=mB3j+3XACTccozTg1cpuy9bm6ToGZqoc4ryLQ31L+PLnYS5aM2yDnJWBShat2xTk7H
 HWmqtoy3/RDe+lzeD1NBcNz04gG7ELSnr1tSwet0x1wXYfVhOe1QEC62CdtUIVoIxthw
 ug0inf6b79LxH73J8mqfIbrN3KYcHINNIYtKUGG5Y/PvPW3qmW0vQgh1P5YDFSJGAzz+
 DRvXSHwa9ubgoxGNey9lqE+FitBYs9013iSWeZE8+/L5lOCOIhT6Wlva6QNkLigogRgG
 bGEnarkkjoHrQikYZYpcZCoKgrMDETWsRI7ldQ70Haag9PC9aHpGYT1hbpi0ShJg8MF2
 O2bA==
X-Gm-Message-State: AOAM5300P0vnZfLqIiK21h4cPjVZmGrCCRDIyx6RFaBF8aPjAfnwarnE
 vpKKj0CSmybylFqbBD7gpAoADP2JeWQ=
X-Google-Smtp-Source: ABdhPJzcHb0HDMZHNRGQh2dFvWvQsna3sk/dbkDGaHlNbxWbcHz5fh/iwzqbptJ2wnO+1VBXB/ifDw==
X-Received: by 2002:a05:6000:1a8b:b0:1f1:d8f4:4aa with SMTP id
 f11-20020a0560001a8b00b001f1d8f404aamr6623248wry.238.1646608723256; 
 Sun, 06 Mar 2022 15:18:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c34c300b003884e826642sm11277989wmq.12.2022.03.06.15.18.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:18:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/22] audio/dbus: Fix building with modules on macOS
Date: Mon,  7 Mar 2022 00:17:40 +0100
Message-Id: <20220306231753.50277-10-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Li Zhang <lizhang@suse.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When configuring QEMU with --enable-modules we get on macOS:

  --- stderr ---
  Dependency ui-dbus cannot be satisfied

ui-dbus depends on pixman and opengl, so add these dependencies
to audio-dbus.

Fixes: 739362d420 ("audio: add "dbus" audio backend")
Reviewed-by: Li Zhang <lizhang@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/meson.build b/audio/meson.build
index 0ac3791d0b..d9b295514f 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -28,7 +28,7 @@ endforeach
 
 if dbus_display
     module_ss = ss.source_set()
-    module_ss.add(when: gio, if_true: files('dbusaudio.c'))
+    module_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'], if_true: files('dbusaudio.c'))
     audio_modules += {'dbus': module_ss}
 endif
 
-- 
2.34.1


