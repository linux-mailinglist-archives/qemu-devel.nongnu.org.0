Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB33E4B2B17
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:57:56 +0100 (CET)
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIZF5-0000X9-Vm
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:57:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYuK-0000f4-Kc
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:28 -0500
Received: from [2607:f8b0:4864:20::431] (port=40734
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYuJ-0002QB-2X
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:28 -0500
Received: by mail-pf1-x431.google.com with SMTP id a39so16372304pfx.7
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ueFe30KAYoKjPHZOLv0QgRUmcJTyJH01k8g/Vbuxj28=;
 b=M9IhfeGEzCS7txqpK8JfxYzN0zGve+ov50Y5HuUmy3XKeoZUt1oW+tbafTLlsIhGJZ
 kOwqOzGhScvrNXMe7+dpUeCpEHl5OG9SexJMdu2sc3ua9LH09CiSGJBIpqpDpPQiYE6e
 20MI8MP15u4D1dVrLWDRlsEgcD+HGASyFeBbQR3f9FqS9WPYjoMJYmzD2NDD6yNXsHTS
 nVMjMHuOvV1yJP/q0ko+UYKJ8JXtxjFx8TccKztgnh671UeabW/QNWvl1XmKeoqURwb3
 kcNOqaGhF7V81quUPTh1E0EQzcFCSb3+boe7as6K9TTLx96SgYQUDtfZyxItiDiSMw+w
 Fy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ueFe30KAYoKjPHZOLv0QgRUmcJTyJH01k8g/Vbuxj28=;
 b=X612gnUTQVcMlQOeeCGj1EVfjrP0hjMI4/YVM+tiqPJNLP0/thEb++L6J4H6/UEp5Q
 Y/yRt3NpFxyLM5bOe8PFPM2HF8BHcPFBZGfbchnvwXBRC4zH5SyuDmvFSkyIYjEE5Ur/
 sEIUak9/rCnWnZjNSoa1WWEqT2AqG3e1mCsPe1rGWjM4rH4q3B3/dNIBx9FGiEhN/opC
 dIqHcvYUzcg++uY0PsiJQe8n9yOW7mzgCvVvzg01SwAncgY8rf/MxkGm5Dz6kQBs87Q+
 i9wDxYjJQxLF7dzz7eg5O4IAgAq19CAdFOcjaquUXwpPN90EWj47+LkneZ49vMuzdCoP
 LznA==
X-Gm-Message-State: AOAM532mL/UjtD53e+neE+N8C18giM83OT/KNAWHSr9Or6BbCUFKq/Ey
 GR7LEMdbagQv57gDh33BXo8BLYHfseU=
X-Google-Smtp-Source: ABdhPJwV5N1BASOfi0vqB0CIT5JmE8RVFMRQzg+SRKQpUjysPfk77Ql7wyVNx0iEYaLM4HZFklmjbA==
X-Received: by 2002:a05:6a00:a8e:: with SMTP id
 b14mr2414582pfl.32.1644597385800; 
 Fri, 11 Feb 2022 08:36:25 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id rj1sm6191919pjb.49.2022.02.11.08.36.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:36:25 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 11/13] audio/dbus: Fix building with modules on macOS
Date: Fri, 11 Feb 2022 17:34:32 +0100
Message-Id: <20220211163434.58423-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


