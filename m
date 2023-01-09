Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB466624B8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 12:54:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqjM-0003MH-6G; Mon, 09 Jan 2023 06:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjL-0003Ly-0a
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:54:19 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjI-00089s-UM
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 06:54:18 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso2113600wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 03:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDVaRNcO9+ny7tdAgMwhPc41lYorsN/VnELvXWwWtQM=;
 b=O2xUZEX5hwRpCQ3t3VFkygUGb2Tt5aept/9DhS661DHH0Zr5tiQt9VzVxmWQTJQIC5
 rsKgfFO9kAY5W0VpjyIucaFalJziGQ4ZX0SvL+KfAt8pu14H9VRRCLgVGQQHJili1+Sr
 TgkePgcCvgxIbUXNpW/lnjOlxJMo9HqwdY4IRTMHjCwj/qYvwIN/xd6vxCk5ExpyoJYZ
 bxvm6JZzxeqOrDeia6VeRQCmGYfGaSgVg1uODZViTwHO0eDk8n7wRpinYNHeXLQP0PsC
 bxB7ow8c019+eOqs2hplaHHnDI/9XXGyhMJmUp+gVHEib+POerWmcP7VR++vMr0xFQou
 MygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDVaRNcO9+ny7tdAgMwhPc41lYorsN/VnELvXWwWtQM=;
 b=Ju0UDDGRHmyBwxhp5EzVE7ear6BeDXSmZ48NlQyiF2FxdCFnu+CBwJd7LqY+dl68UP
 vNZyrRxcvu/fkg+hTJCHOyN728hFulFriSG+dNpSbij+2g/5wHM/9CSKTLIFeJDos+dx
 VIhz5Fud/AokTfTdlLiw3YEOt66J5XV33KwHtIaICjAqssTpzTc9AegaRrgCqL7zkVuy
 TJ/zGn8yyAfE5pbauV0wQ31CGUfMW/9AzjVC4TSrW19E7bbPaqX8iYdcAQrVWVpn2TJR
 ejcJ14T+5CsF0mOFVf2ohse7XjL9oGvdZj22rOjBOlM5oRqt7q+KwsFnQiienMC0sisx
 CB1A==
X-Gm-Message-State: AFqh2krV90mkU/jT1W/p4XkMqvlAMSIrZzkJonbapal8oa4rRjSiAUg+
 hqtqxVLQlKo6ykAuv+I0h2H7SzXsxX4yo7X8
X-Google-Smtp-Source: AMrXdXswFcwWt/BTbMTXXgHP81KB47VS5v9ffQRP7dKvPw9N6oeMLR54pMn+PXMezSDsyJO5S3SmIg==
X-Received: by 2002:a05:600c:3845:b0:3d1:caf1:3f56 with SMTP id
 s5-20020a05600c384500b003d1caf13f56mr50679684wmr.9.1673265256106; 
 Mon, 09 Jan 2023 03:54:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b003d9ed49ee2bsm5158895wms.1.2023.01.09.03.54.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:54:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/13] hw/arm/vexpress: Remove dead code in
 vexpress_common_init()
Date: Mon,  9 Jan 2023 12:53:15 +0100
Message-Id: <20230109115316.2235-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Upon introduction in commit b8433303fb ("Set proper device-width
for vexpress flash"), ve_pflash_cfi01_register() was calling
qdev_init_nofail() which can not fail. This call was later
converted with a script to use &error_fatal, still unable to
fail. Remove the unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/vexpress.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index e1d1983ae6..757236767b 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -659,10 +659,6 @@ static void vexpress_common_init(MachineState *machine)
     dinfo = drive_get(IF_PFLASH, 0, 0);
     pflash0 = ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flash0",
                                        dinfo);
-    if (!pflash0) {
-        error_report("vexpress: error registering flash 0");
-        exit(1);
-    }
 
     if (map[VE_NORFLASHALIAS] != -1) {
         /* Map flash 0 as an alias into low memory */
@@ -673,11 +669,7 @@ static void vexpress_common_init(MachineState *machine)
     }
 
     dinfo = drive_get(IF_PFLASH, 0, 1);
-    if (!ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1",
-                                  dinfo)) {
-        error_report("vexpress: error registering flash 1");
-        exit(1);
-    }
+    ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1", dinfo);
 
     sram_size = 0x2000000;
     memory_region_init_ram(sram, NULL, "vexpress.sram", sram_size,
-- 
2.38.1


