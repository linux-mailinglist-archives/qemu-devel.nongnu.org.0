Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68DE6A3F81
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWaos-0000Ov-5c; Mon, 27 Feb 2023 05:33:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWaol-0000GF-Nx
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:33:19 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWaok-0001As-69
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:33:15 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso3502524wmp.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 02:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SMCVeQ0rUUkrihdTeaeuUllAhYFqzhnhzh04vyn+ero=;
 b=GZFI1gokd3RO0o1jJMcCBSmjoCbTw5u9YybjYgvx+wJF8Pi4UPq0Ltpx7+z8BiXadC
 aIRUIDDA0BPxB+I+A1UrlPuBAcoaTxz0O3m030qBx7dJprVr9+KewLWLiUwLguNFRv0c
 o1OHCBOLmUqqUn07fWtPuWo9GZg39UR/yHzQs8xk75V0F/DiDaVtwuWtNjcQfyiD1z6Z
 WXEW76o6CyZKp5k9OSPzEhui3D2C9y/YxRgscXR9yIdfQnCim98hJFdW8UDikdnOwPXQ
 kUU2fTaDLlFIqJBgAku4Af2rzmVSI6iFc0lC2UlpybW4mEOfd0TSHu9BDPUU7ajsXG35
 159Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SMCVeQ0rUUkrihdTeaeuUllAhYFqzhnhzh04vyn+ero=;
 b=A0betAij4GVbXQ1Kt4+5d825b5r7hrQrmrnP7E+1OjwvKWieNaqouTgxpTWcApmnM9
 hGbQOVxV+rVgglh4qfHdChRXJmVFd5nWPmd4Ypmqcz/tMaMeZZnVjOMhjkj5WUEe5QEn
 PaEpt9Kco8b04MHdoAlwOGABk1HNqQvPMxnYAxW597NQUQlOqgS3OOOzWKEaZBfHWMPV
 B9reKq9hwrekZXK1hdairJ4UVoOiwV7XNg/K7mOyk/WVNjumkUBZfk5fzsWjHFE8vT6A
 +nORcK4HDsrTLeuWU+cfoXRGY2Azj+h2+Ol8kltSgiOOMB4I1EOr6Mj75xJO8lroIeHx
 2g1A==
X-Gm-Message-State: AO0yUKVS5ithrmnR2xnA8v24lq7pbCE1oZKpNxMkU1EA/Vx6/thD+jdZ
 MZ2rQg6jvwriwhvEnUVRZYXlisboJ1i56OTh
X-Google-Smtp-Source: AK7set9DYZ8xF+46MH/YV7WpH13uDxrJwh7JgiO3LAgoqOzKHcXTz6HidvyL8hl9W5hQtC2azyE5Pg==
X-Received: by 2002:a05:600c:18a1:b0:3eb:2de8:b72a with SMTP id
 x33-20020a05600c18a100b003eb2de8b72amr6866432wmp.7.1677493992759; 
 Mon, 27 Feb 2023 02:33:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a1c7717000000b003daf672a616sm8519199wmi.22.2023.02.27.02.33.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 02:33:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] hw/vfio: Build various target-independent objects once
Date: Mon, 27 Feb 2023 11:32:58 +0100
Message-Id: <20230227103258.13295-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227103258.13295-1-philmd@linaro.org>
References: <20230227103258.13295-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/meson.build | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index da9af297a0..a1ed62245a 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -1,19 +1,22 @@
+softmmu_ss.add(files(
+  'migration.c',
+))
+softmmu_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files('display.c'))
+softmmu_ss.add(when: 'CONFIG_VFIO_XGMAC', if_true: files('calxeda-xgmac.c'))
+softmmu_ss.add(when: 'CONFIG_VFIO_AMD_XGBE', if_true: files('amd-xgbe.c'))
+softmmu_ss.add(when: 'CONFIG_VFIO_IGD', if_true: files('igd.c'))
+
 vfio_ss = ss.source_set()
 vfio_ss.add(files(
   'common.c',
   'spapr.c',
-  'migration.c',
 ))
 vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
-  'display.c',
   'pci-quirks.c',
   'pci.c',
 ))
 vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))
-vfio_ss.add(when: 'CONFIG_VFIO_XGMAC', if_true: files('calxeda-xgmac.c'))
-vfio_ss.add(when: 'CONFIG_VFIO_AMD_XGBE', if_true: files('amd-xgbe.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_AP', if_true: files('ap.c'))
-vfio_ss.add(when: 'CONFIG_VFIO_IGD', if_true: files('igd.c'))
 
 specific_ss.add_all(when: 'CONFIG_VFIO', if_true: vfio_ss)
-- 
2.38.1


