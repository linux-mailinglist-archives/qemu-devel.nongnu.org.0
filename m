Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264186484D7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:17:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3f7E-0005Sf-Ia; Fri, 09 Dec 2022 10:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6h-000548-IH
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:16:15 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6f-0008DX-HP
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:16:11 -0500
Received: by mail-wr1-x431.google.com with SMTP id bx10so5544756wrb.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKYgngh5eKPOlW1JWGuhao9lgG0+kDitgT4eXHlFVxA=;
 b=jQLcSXka+fu0099TqIgNY3gGyIGNk4pzza7Qm3/mN8oDjgzlo4+ebwp0hLOPTW9us7
 EWhowzz90IyiipOq9xsxeC6uBYlOThX2vbnO8CwWT6e54i83L1MmHjq++Lq1F0FAe9Rr
 4EaskBcVq7poyir+qAJ4z2Y3Cn5qCmL91XGbx5AP0pQAublcxy0B4y5FQ3o0ScZMTaJm
 CufWr3Mk6GeKubS2o5/rowrLJyrmNUIKSYimFk4eY5w5gFX9BRXIHP1AvhE/NVCrRkHp
 I/lNqpa/3ewLtJKaFOFSyD+7IBB7r4/OZRzLik+daCLohwo8ASXKTd3ZsHlWEfpNK+Wo
 29rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PKYgngh5eKPOlW1JWGuhao9lgG0+kDitgT4eXHlFVxA=;
 b=5Nd9Iu9RAnY9CIr6bgMxGgLIDd/XZXqh3PYeRvybMFirDYKN6Po5CFx4Ey/TO0GSAO
 J3G8XeAJg6WkmRPzeaoqkQzz1gto9T2QIfT+pySLN9pWIKN2Sv0R6WGr9Ur/RNN3QEql
 KqU472s2HTmb7R7SxIRUg3ES9Vvh/7QWGdaioEsH+rqdan+3XwCkgsZXFNKtBmnMN0Hq
 sSEMORnH1I5FFvCUWuTHD32HN3Ifp7hCtLjBhCmXfT4Q3DE7sOgOSiYgQxAAX/GFP0jb
 7b/derzSYA1MdCLEz+VVdtmO9MX3YR2CkeISQ7w6KiVmZrGr7/N4iTtK3Gtoag13xEqa
 VwHQ==
X-Gm-Message-State: ANoB5pnVVDovNurzc6r1Yi/Xnd7lwqs+2kOPqXMyBzxsvp/5XNt9QnT1
 /pOU9cFL+l97NIOfk3WU2/iUd04opolgYe8GEbE=
X-Google-Smtp-Source: AA0mqf43dRIRLIadShJFcxAGQ/sIwlUFDrFEIqWNr+peeLN9tuR4SlKbzyd5+XADqeT2WPChB5zmdw==
X-Received: by 2002:adf:e109:0:b0:236:b220:8f89 with SMTP id
 t9-20020adfe109000000b00236b2208f89mr3703193wrz.61.1670598965153; 
 Fri, 09 Dec 2022 07:16:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bl1-20020adfe241000000b00241fea203b6sm1659609wrb.87.2022.12.09.07.16.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 07:16:04 -0800 (PST)
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
Subject: [PATCH-for-8.0 6/7] hw/mips/meson: Make gt64xxx_pci.c endian-agnostic
Date: Fri,  9 Dec 2022 16:15:32 +0100
Message-Id: <20221209151533.69516-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209151533.69516-1-philmd@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

The single machine using this device explicitly sets its
endianness. We don't need to set a default. This allow us
to remove the target specificity from the build system.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/mips/gt64xxx_pci.c | 2 +-
 hw/mips/meson.build   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 9ae4953d1e..b05b2b3acd 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1233,7 +1233,7 @@ static const TypeInfo gt64120_pci_info = {
 
 static Property gt64120_properties[] = {
     DEFINE_PROP_BIT("cpu-little-endian", GT64120State,
-                    features, FEAT_CPU_LE, !TARGET_BIG_ENDIAN),
+                    features, FEAT_CPU_LE, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 6ccd385df0..152103f15f 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -3,7 +3,7 @@ mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('malta.c'))
-mips_ss.add(when: 'CONFIG_GT64120', if_true: files('gt64xxx_pci.c'))
+softmmu_ss.add(when: 'CONFIG_GT64120', if_true: files('gt64xxx_pci.c'))
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
 
 if 'CONFIG_TCG' in config_all
-- 
2.38.1


