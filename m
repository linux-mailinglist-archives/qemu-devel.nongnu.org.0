Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48707697AB8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFx2-0000So-KD; Wed, 15 Feb 2023 06:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFww-0000Np-Uu
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:48 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwv-0003Vy-Cu
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id p5so678439wmg.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDxlxVOZMpWrGXNGMddy/NkpJei0Gesyel8wOOF9FHI=;
 b=E3EG9HjGmp9f876gATkgg5yilXE0k3C+5ZI6BYww/sUBcfHLiRxhLrPn08LbI2orX6
 Xz3KMPwEo7bQIjboWeP/OdgQemsycJa/sW6CtItEL1J1YdmoLg2156jpWZ5yr82/Wcxl
 Sme/UzZBJC/0n/Cpvnjz7j+6v7VMUKk7Mxtss7nAI6BFHpoq7NlkScnyVd/MV8WMdyiW
 caPhVLl9pRz/TG5N1smivJzWVAF5vdNSck/w5/VQPSiEOn+MOh/KJwGclI+bClulPfSb
 lf06Dlnhkc2vlb7XJBiWBu2lemwwyBB2WlkFRebRsJ+2OTEanaPn9mtcxrRdTlpL/adW
 WGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HDxlxVOZMpWrGXNGMddy/NkpJei0Gesyel8wOOF9FHI=;
 b=QIA9PKTeioHFkX3LYuhnQDXahgPUsk95HsxdJxcxp7cqNUMZr+8lMPxGlI+RPIWI/O
 p3LCUtEJ9+giImfyyCeXmgSoHc2Q2hRiZGBUxWSs54X2eKFNkReBca+hy+GPYfQT1bfp
 I8Cm3kvSfeouEUkVlQ2mmUimYQLrqcthvBTm+1xIYZoBL8s4MXa43nNdDZzyIJSrTr9F
 +fT4fR3FkAqmToYWeHAI8ekduqqxBnPY4mWQtba/1FZoyenKz9YxiG3jSk07dltZo8vG
 J3t25aE82mPcaiZPkgp498iCNEAqomh+DyxdC7G91vYgmJ5aQHwslWfAvawDFbVa12YB
 y6aA==
X-Gm-Message-State: AO0yUKXnDCtypT3oiGOBdC8N25DWwLideaHXi3vFT/LJsMw1E9Ti5GKy
 tX4XFzGQTZ0hLO7d+i3N3nVb0ACXfdfojsFl
X-Google-Smtp-Source: AK7set+DQqrY1mlyt81HsMQaSmZekqtb/AwEgpxW+ij41O6IwjhNmcCY/oYkXWmK45xdawPp8A2isQ==
X-Received: by 2002:a05:600c:318f:b0:3df:e468:17dc with SMTP id
 s15-20020a05600c318f00b003dfe46817dcmr1679731wmp.40.1676460463380; 
 Wed, 15 Feb 2023 03:27:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c510300b003e2052bad94sm1395593wms.33.2023.02.15.03.27.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:27:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/20] hw/ide/atapi: Restrict 'scsi/constants.h' inclusion
Date: Wed, 15 Feb 2023 12:26:58 +0100
Message-Id: <20230215112712.23110-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Only atapi.c requires the SCSI constants. No need to include
it in all files including "hw/ide/internal.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/atapi.c            | 1 +
 include/hw/ide/internal.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 0a9aa6f009..0c36bd0afd 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -27,6 +27,7 @@
 #include "hw/ide/internal.h"
 #include "hw/scsi/scsi.h"
 #include "sysemu/block-backend.h"
+#include "scsi/constants.h"
 #include "trace.h"
 
 #define ATAPI_SECTOR_BITS (2 + BDRV_SECTOR_BITS)
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index fc0aa81a88..29a8e79817 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -13,7 +13,6 @@
 #include "hw/isa/isa.h"
 #include "sysemu/dma.h"
 #include "hw/block/block.h"
-#include "scsi/constants.h"
 
 /* debug IDE devices */
 #define USE_DMA_CDROM
-- 
2.38.1


