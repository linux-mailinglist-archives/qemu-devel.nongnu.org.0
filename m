Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B9A651FCD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:37:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7atY-00043O-Pk; Tue, 20 Dec 2022 06:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7atU-000417-Uv
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:34:50 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7atT-0007yK-Cj
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:34:48 -0500
Received: by mail-wr1-x432.google.com with SMTP id bx10so11495304wrb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGCOa5oMG6crU1pmMt6tVFXX/xHui00CJSxQwvzSIuo=;
 b=FBxpo4uh6lgCOnPobDxJkJ4ejL13b4KMQuhmkDQHaE73TWjYJr4cXsVM0DgbPf4vDq
 q3Enjm7Z8s/2QOdL09MhtU52cTC3M7GNp5GXZrK2bjBSujNsW1yYvUaoBqeWgF96IqLv
 hZ5vQihXhKxbDST9Yf/JZRPlMYiiEwidNsUm9yvuujmVpmdq3CwRIiryOBL89dmH57HY
 p8qmmCbigf/7U6PM2VGSI72BTYDCjfcso+VLAXhfKo+GDJ8r6bZx2EsyT17nTcCsATgu
 cb0Ou8Wye4hgHBrx8Ra4LRDnNa6HotzVRBdfR5mNvsgA8Ym4k+Vu8l2nqML+AUbH8VFf
 Ve5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bGCOa5oMG6crU1pmMt6tVFXX/xHui00CJSxQwvzSIuo=;
 b=5hbVG+AjQkjXkt0a0ZjXpTaHGMewDDh99lHdKq0YuN/Udt9indICUcyi86yp+b1uQJ
 TsjcWvSLSt44jxuqWVww5gOmFIOHdIgVqfSzHSrAQ6cgrK3MA0oSLF2CVT1XwhqS9GfS
 Ro7s7moOrJ220GZmCj1M/a5pJEOFOKIdlzFbq3wo0Dl7nEHSARJFVagj9ca9dALNdWzm
 GKSs1ZjU3pJQVCZO7R6enyHdxlKAmj2G335NTq1IC1h50itgHS5EO0ibdaakKIoDv/vu
 /wUTSNeHAmd0fIF9xCLtKLFQLPSW+xEB2gJXy6XY36wA1t6hl7RTNWRLDRSzmT2q+fZs
 9Oog==
X-Gm-Message-State: AFqh2kquvFyxu347ticH6lhMyD5LgU98Yi4kNKhM16R/devHdQalKfVA
 +fT/ds9X1f5eLggx4BMId4ClhaYHjSGP8uoHLfw=
X-Google-Smtp-Source: AMrXdXurOZcSuQbQoUteGPFbPxcKHRxg3tjjVuOQHdukEroVdk+W8FQtjS0M3LRrzFsDgfT0RlKpsg==
X-Received: by 2002:a5d:504d:0:b0:242:68fb:da2a with SMTP id
 h13-20020a5d504d000000b0024268fbda2amr1187187wrt.39.1671536084543; 
 Tue, 20 Dec 2022 03:34:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a5d4cca000000b0024278304ef6sm12425651wrt.13.2022.12.20.03.34.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:34:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/7] hw/mips/Kconfig: Introduce CONFIG_GT64120 to select
 gt64xxx_pci.c
Date: Tue, 20 Dec 2022 12:34:30 +0100
Message-Id: <20221220113436.14299-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220113436.14299-1-philmd@linaro.org>
References: <20221220113436.14299-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221209151533.69516-2-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/mips/Kconfig     | 6 ++++++
 hw/mips/meson.build | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 725525358d..d6bbbe7069 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -1,5 +1,6 @@
 config MALTA
     bool
+    select GT64120
     select ISA_SUPERIO
 
 config MIPSSIM
@@ -59,3 +60,8 @@ config MIPS_BOSTON
 
 config FW_CFG_MIPS
     bool
+
+config GT64120
+    bool
+    select PCI
+    select I8259
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index dd0101ad4d..6ccd385df0 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -2,7 +2,8 @@ mips_ss = ss.source_set()
 mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
-mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
+mips_ss.add(when: 'CONFIG_MALTA', if_true: files('malta.c'))
+mips_ss.add(when: 'CONFIG_GT64120', if_true: files('gt64xxx_pci.c'))
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
 
 if 'CONFIG_TCG' in config_all
-- 
2.38.1


