Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E87697ABC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFx8-0000Ws-Pz; Wed, 15 Feb 2023 06:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFx6-0000WK-Ng
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:56 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFx4-0003TT-6o
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:56 -0500
Received: by mail-wr1-x42a.google.com with SMTP id o15so15475763wrc.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y67tixTvt/tYOnbC1oMiSzkMJPDPGSkjTOTNexreHBE=;
 b=NeXpNp6y15OTEC7PVwfTVODCqmRics5zM6b1IspAcHZN+XCCpZPFONyGENq4jcvCzd
 JtNmaKNwMoeCzG5AyXudy6BLFD89J+CEmo2cCmoXzBTBVtTCTSkrvu9NXG6mwhQDnkeG
 KztbZv/C5YNp80jyZwgCDYasMe6Xuc4B1nfemBQnY7VPUjUHHv+XgbxH0sXe5V/wEqCM
 ZRoso5wsrp2eOiQT/MKHiboSN0K+Lzq3ViihUp5FBKKqGxm8213fuJPa280Cv8QhLZRU
 fzVr8utt0nL0Co1o1KHhXcyvdzNaxy+T3chEw9dHic7n9+YiyjiJIRV+uOV2qi9lX2dx
 eNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y67tixTvt/tYOnbC1oMiSzkMJPDPGSkjTOTNexreHBE=;
 b=Kc9CNPTgsWE/T7TOZIFGWoW8M+wGFaPNFLfwALugA+jnFh26UzsnLkQIGF/TCIgIk8
 Xg+yvN4RQdIYXFAgjMXxj78mn2fUCY6VV7tfXESgsDQZCkBlgCL/1GWO4wZ9MPlEYBRf
 MDbV7rA8/GIzVxPvO3L2ZRYklqRtna5i8znOi072SMNWCX2KcFjLObhdAL0uJk/ye1lr
 6JkSM8CNbe47JC/p4aa0PVByFO/VVs5+KNPhLvuUvcldS551Nk8SoQBk9tDdanbZwLzu
 iy1HbWVTusttN1nmG+xUXfGtkYpuEdOCfChGYdjSqEJsbUZW6q/bww9rIDRFh9oFU7Al
 dCsA==
X-Gm-Message-State: AO0yUKWaj9pLWh5HrmrAmz26LFlYiRtlBVEL/c1kRCNNIq8oYzWUS8lz
 Hu6ohD5ryDsjHjyHIhvzXpbHLPoQjZE9T3B3
X-Google-Smtp-Source: AK7set+9U2XJtok+EpKcom75GEsu7G4vzJ+qGdBX4iffZsALNDbWwIeA4wli1VZajgUjykjniXv1sQ==
X-Received: by 2002:adf:f204:0:b0:2c3:dc42:5252 with SMTP id
 p4-20020adff204000000b002c3dc425252mr1232908wro.70.1676460473226; 
 Wed, 15 Feb 2023 03:27:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a5d5048000000b002c54d97b1ecsm11026732wrt.72.2023.02.15.03.27.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:27:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/20] hw/ide: Include 'exec/ioport.h' instead of
 'hw/isa/isa.h'
Date: Wed, 15 Feb 2023 12:27:00 +0100
Message-Id: <20230215112712.23110-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

The IDEBus structure has PortioList fields, so we need its
declarations from "exec/ioport.h". "hw/isa/isa.h" is not required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/ide/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index e6deb1c5dc..84d3722d67 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -9,9 +9,9 @@
 
 #include "hw/ide.h"
 #include "hw/irq.h"
-#include "hw/isa/isa.h"
 #include "sysemu/dma.h"
 #include "hw/block/block.h"
+#include "exec/ioport.h"
 
 /* debug IDE devices */
 #define USE_DMA_CDROM
-- 
2.38.1


