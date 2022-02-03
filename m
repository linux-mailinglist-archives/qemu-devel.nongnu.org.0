Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24874A893C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:06:17 +0100 (CET)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFfYm-0000T1-77
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:06:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFfS2-0006DZ-BP
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:59:19 -0500
Received: from [2607:f8b0:4864:20::1033] (port=52015
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFfRz-0007wf-IK
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 11:59:17 -0500
Received: by mail-pj1-x1033.google.com with SMTP id q63so2990458pja.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 08:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HGAu/AjjiHjjy7OltnPVn1JOiJPHnYEy4kJJQtVjzJ8=;
 b=kCZRs3pYhpAc8LAsYorB8rJKtCN6cEo5oTrkYibVgVuHsg9Bwds5QNHeApvISjsaQs
 ahoxnAfCMCjnJZ7L64Q4vLtwYsniWaX8ypECQaovtDPyUV5LpsAMpjJ4oBhaYizgR8K7
 OFnjEtitQTweOhDLfpTR7MR7CnOb+eYVgkUMUyjTUnnclhMJH7DC8Ig7EWFZZrZNnZMq
 iByFqPdiSMUnr9nm+BpR3o8R6wDa+acxUeVMMVnWitUxG4mvFcVxMtDME+HxDwvF/tcm
 xI1XvlUfnprWfThGDsd/Ia0rlCFzCPHZRiatAA90+k3URENSqR6qjuwu25SuXBOCjOgZ
 QWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HGAu/AjjiHjjy7OltnPVn1JOiJPHnYEy4kJJQtVjzJ8=;
 b=MIx2QDn4KxGMIkNrLERNGLU4e0Qs9+qcob1CvU51alLH2RhbrLk0pCYpa/K1hfbmhO
 refMkuFzaMsYWYHBFZ64qJmn9oEolSOIUDMwrG+GgDAsxhcJs/EUjZaGKB+Bsj2c+1gS
 a0D5nFQzQVRA/cUUgEkM4Ssa10t1g5m0jG7p84JX6xBUVRbK9jjrWTtL7N8Gh6fkRQWT
 F+jtvQIdFJpdz8FS2dl1AmkUjhReCyYZGkYX01BfGghIleWCfDNSLM6LejsEuSR4rVhz
 N5Ql63+fPvOLlJdVMo0NFgKo8f0vBxNOc9WOaZu9Ya++wQ1uDKWt/+leyEqvyBdNkbf1
 Qt1g==
X-Gm-Message-State: AOAM532TpoZ1QrYrXKhgmynaufXf2/Zf0vL07F4HQnY5vwjgx5FoKQXc
 9kQ/aK2HeHt5fPm0DfwfJRaMlSG+DWg=
X-Google-Smtp-Source: ABdhPJzOw7iTX8Lc5j1KOovM0MycVWVwhk6e/b11PXiBNEBNGEx0ArBBHHm5zxPgdFJSX7aBVjwb4Q==
X-Received: by 2002:a17:903:300d:: with SMTP id
 o13mr4553285pla.174.1643907545758; 
 Thu, 03 Feb 2022 08:59:05 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id a13sm31407097pfv.97.2022.02.03.08.59.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 08:59:05 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] audio/dbus: Fix building with modules enabled on macOS
Date: Thu,  3 Feb 2022 17:58:59 +0100
Message-Id: <20220203165859.41066-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

When configuring QEMU with --enable-modules we get on macOS:

  --- stderr ---
  Dependency ui-dbus cannot be satisfied

ui-dbus depends on pixman and opengl, so add these dependencies
to audio-dbus.

Fixes: 739362d420 ("audio: add "dbus" audio backend")
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


