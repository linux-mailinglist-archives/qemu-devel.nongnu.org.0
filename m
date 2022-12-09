Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269E6484D5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3f6P-0004rg-Fz; Fri, 09 Dec 2022 10:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6H-0004o8-FE
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:15:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6E-00084R-FS
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:15:44 -0500
Received: by mail-wr1-x42c.google.com with SMTP id co23so5528576wrb.4
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykkaTaAV+4CtMofJZ4MlHHQhTvxgfANUb/q5AOZUgp4=;
 b=Y5dwiRjeeAxqJSrVCOPetbOZupdl7X39f6QfpnGhxipcTt9Gas5rQZmnsb8mrYPVjA
 ZBJz+hNUYsQR0RL0z/oZeQUckl2IMaJ/bm7CJQtir/irBBrW8WIftV1W62rhr3Nn8XF3
 ssKOFizW+7T80JFvKIcG6js6l49uSrBukbF/tuRz2ODOewYDvx6kuT2XZclhGFzRhG4f
 ZuM2ClYUCJ4NkK+TFaDr5CF+LF+I+w44X1z4cZpLJPDdWr7G4DJX5z6iEmpaRSqHQtik
 NyNJU34gz5++YHkqpigxcg9rdjtEuvIlEx2eIkDIljR6gqFEnItNF1nJkl2prbstrzPs
 jQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykkaTaAV+4CtMofJZ4MlHHQhTvxgfANUb/q5AOZUgp4=;
 b=ZJlKBbE+d/oZl5E6OyPWjVJbZ3KQMiPG9hB9ndEfufww4/Bxr2njU2WUaveKUaMH4n
 CMjm92XGf/C0EHxQtOqK1Rg6iRvf1WhH25JyoZtEmVD4YcCwdZTPdxdgYzP01kQ8RIbH
 boy4OhFSSHDZgXrtE1LyK4SZhhO4ZB5L//fZxrMMMVq3zPyD/3oqSIndpz6GDHIs9Lk1
 S4kCED+Q46bwVq/aWGnFvd4sQb4M68nr/g9cLQDn3PcNnI0zxEmzjqctOXCupywsh1CI
 G7AzcEqE1Q+G6mti76iNK7LxmQ2lgBsVsKvNotyAwVUZCxwkK3QDEmL5+dXAjyZTFgyA
 krpw==
X-Gm-Message-State: ANoB5pmIVAZeS80612HasxbK2MAKVIOpmh6t8HkE6mdGavoyb+Vz0Mzp
 AdrZQjCUvFfQuBlVL/ZguEGDeGjcoXYw6th5eic=
X-Google-Smtp-Source: AA0mqf65StovMVTOYuHuitVzl+cTyDIn6ac77+GBSCPW++fGXPjqqXQUdkduznbt53QE6uyUTqxGMQ==
X-Received: by 2002:adf:ebc3:0:b0:237:45f1:7f12 with SMTP id
 v3-20020adfebc3000000b0023745f17f12mr5158085wrn.39.1670598940485; 
 Fri, 09 Dec 2022 07:15:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 ba17-20020a0560001c1100b0024245e543absm1687214wrb.88.2022.12.09.07.15.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 07:15:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-8.0 1/7] hw/mips/Kconfig: Introduce CONFIG_GT64120 to
 select gt64xxx_pci.c
Date: Fri,  9 Dec 2022 16:15:27 +0100
Message-Id: <20221209151533.69516-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209151533.69516-1-philmd@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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


