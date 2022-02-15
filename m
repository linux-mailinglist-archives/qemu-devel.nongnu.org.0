Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC694B65F6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:23:28 +0100 (CET)
Received: from localhost ([::1]:51354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJt7P-0003e9-1J
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:23:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspA-0002qf-Uf
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:36 -0500
Received: from [2607:f8b0:4864:20::62b] (port=44557
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsp6-0002Dp-SD
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:35 -0500
Received: by mail-pl1-x62b.google.com with SMTP id y18so12500753plb.11
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ueFe30KAYoKjPHZOLv0QgRUmcJTyJH01k8g/Vbuxj28=;
 b=MJtiNogox/Gy+oenkVGOTbwBs5ZxoFKpb4Xh/HNRZxrg3ETaSNxYtfSP8AiLp4TZll
 YFhOeNECDEHtUKn7txwVsxywf0sPTpYW+8zAwenp+28jlUsrxRDnjpvbLh5HDR+6zkzR
 iGb0sap2KyFUgC5Hpvx9i7HGZdLBHX95zvfhbYWqw7uGOY/Th6GQQzUvIDP7793FRj82
 6yH2zDIGXGKspWkIWq3HuMXSt8igsExRcwrhvFfcPVdmmvfHuk7gCGS8f3AiuDYNL+Lu
 rSYHTn66T26Vqyz+FkTuHXproG9VbTQfzZxcVjgqN1vkY/Ws7t34aj9qStSNbNvUlXlu
 eH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ueFe30KAYoKjPHZOLv0QgRUmcJTyJH01k8g/Vbuxj28=;
 b=0Z6IhiXph5J+5z1xgAF2N9IGcKax+HHxnz4uIwAxSBZyxhMnDPplWPGKdqpi2+eXSn
 oXkMH8a0p1udmfTEIRz0ykflbGpXftpH9yv7NRkefxQvZHy+P/njHNkr2DMVlWEcHDgr
 5Cu573BLyloT/+cuZlmf81YaT1Xhp0KkyiVu38Iqnji2QCDUtElAKhngl3gegBobhDGq
 Oa55/bOoiLb9Z1d2szDp/9q8OfIOStbU/KeXRLDjtc5KhRieBkQ2ern3ktKKeLUkzXVN
 AGRxBnJ3syr/Axw9pLp+J6Rpesg+aWYoQercPahQFEM6PBkPggyrBqAIKmkxCYM8ZSDY
 lBbQ==
X-Gm-Message-State: AOAM533Rtqw+Ffj7oJ0zxpXeo6PrVX8K3NyrqpLuxpTqI6G4s7iUf2l7
 PLx9gd0Pn7h1CzWXgiGjB7TP3UMRF5I=
X-Google-Smtp-Source: ABdhPJwVQSh+9NC7ozgJNHSJau0Bq+y2C3dM2rfwCWepz88InK4kF1qB6kbnKuIbbTnGXwBGu9hEMw==
X-Received: by 2002:a17:902:d512:: with SMTP id
 b18mr2966308plg.54.1644912270488; 
 Tue, 15 Feb 2022 00:04:30 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id p27sm2302715pfh.98.2022.02.15.00.04.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:04:30 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Li Zhang <lizhang@suse.de>
Subject: [PATCH v6 09/15] audio/dbus: Fix building with modules on macOS
Date: Tue, 15 Feb 2022 09:03:01 +0100
Message-Id: <20220215080307.69550-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


