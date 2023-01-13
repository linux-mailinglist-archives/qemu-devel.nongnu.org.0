Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52375669BC3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:19:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnN-0001ag-MR; Fri, 13 Jan 2023 09:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmo-00015F-PA
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:03 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmi-0003eW-PO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:02 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso13090319wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EM2/m4aIPwCcmm0UYVNBr9Hej5isozR7WVzOBPfC9wI=;
 b=LBg6gZn55+EvOJL1EoQ3EsACxPVjYiJHBCTPiSYNnpQHlxes+yoDle+bAuFbCEHPmo
 xKhDsvO5xyvBUVf95eigAOsy60eszPyh3fRab8GCkNlzXHjuS7+lqVBd9xdQ4GEZVRkY
 OJheL76CWXsYmfEa+95u8X3ApvYTitZJ5tqvOvYFLFDPyf5QIdxm7/P0kfEBcVut9pNm
 4hve5HEHiIDfvYFfyXmbvNd71K0SogmBKTNlwUsRcYfJikt/C4XsLsexBwh+KpLsBelN
 KCyuuStoe3taoTpVXah7cPlnhdyLYvWJvnmvjnuPFLp3Y+HGgEDp5eVY3DAJjvu7gNvC
 NuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EM2/m4aIPwCcmm0UYVNBr9Hej5isozR7WVzOBPfC9wI=;
 b=B2byQ25JocSEi0zgs4Jn67MPMVPPYzc4c5Eyy+a1jtyfTiMze8HdwfEnLMPgznTCm9
 vNXhHo/iTJgPprDdj+tFbvMfBtD1joWwPvBpK9+I0rI3TO8PwUhTbUYMwh49kaucJLPK
 Go03y6fUZsB3XlT9x54TMl/vkQkiORm2C5TAU1zYbPMDoGbXZTw4XqWCQ514SAQd0ICa
 dEsKZufyAeE00pqC0cpFIketKZpmKzR5wG+6Ky3Fv/OXH951jV/VhIXxRx97sakDH2t9
 RQeBH9xpysRpZUda7notNC1t6WcafFNh5MNwPIzlHx2rkOY9m1tWwD/dEpTE/WzKlZPC
 4xnw==
X-Gm-Message-State: AFqh2koPgdrdh6WVUvMKOFPTv1LyOs2HINEONAwLmZqqk+FItwTysc3u
 Skj7Jgj/t8RLHm5icknjuVZpoBCVCS+/COuM
X-Google-Smtp-Source: AMrXdXsbl8t/YX4i3hSQkAVeWhvgK5bc8WsEzq6kvNDkOFGtUCYXxu+euAlJDrnY43J4k70g0K+YdQ==
X-Received: by 2002:a1c:4b04:0:b0:3c6:f0b8:74e6 with SMTP id
 y4-20020a1c4b04000000b003c6f0b874e6mr59734125wma.4.1673619106968; 
 Fri, 13 Jan 2023 06:11:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/38] hw/arm/vexpress: Remove dead code in
 vexpress_common_init()
Date: Fri, 13 Jan 2023 14:11:10 +0000
Message-Id: <20230113141126.535646-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Upon introduction in commit b8433303fb ("Set proper device-width
for vexpress flash"), ve_pflash_cfi01_register() was calling
qdev_init_nofail() which can not fail. This call was later
converted with a script to use &error_fatal, still unable to
fail. Remove the unreachable code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-13-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/vexpress.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index e1d1983ae65..757236767b0 100644
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
2.34.1


