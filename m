Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58436631B8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:43:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyyj-0006mO-IG; Mon, 09 Jan 2023 15:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEyyZ-0006lW-T1
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:42:35 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEyyY-0002tm-CF
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:42:35 -0500
Received: by mail-ed1-x532.google.com with SMTP id c34so14494435edf.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5HEvWC8yzZ3rlkRH0wedpeFM4/qVAvcqPXLMVH7T5Q=;
 b=A4ApPJucQbYn+YK5CYTbXoEDeUDJxK9Ts/+HyoOHks9gvuoYvsnclOB76NVCobqeAc
 jRUEWZKMMAaMZTHJoVbL6VXFKcvMRaqh0dm5BTKCMl9lyt+78EWA2PQDhBFmszULdsof
 h8b6HL87vYS4naYOdSU+HMMfrSdX9c/BUvvAUOaRy/spjc6HpY6iaoYfvQyLMxQcIPqj
 jvnA2BrHEHnjlJSUyebIVZds+pQgHQCRlp95cgoMh0wrJCYcTQgtOBC7OtOiUhnwPElD
 kg1Gc72yeo/R06WlQb3TkUhJNNohR4AkENbPSQdEPs9xnexAgZnJSit7Je+UGfPCOvWM
 pxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5HEvWC8yzZ3rlkRH0wedpeFM4/qVAvcqPXLMVH7T5Q=;
 b=n/13R5cwdPVGsJRSsWvDNh1Plu1GXdaAjWupSgE5nMkTtnwK+VqquzxWED5NJrgtcu
 W92XVY8e6+Nriu3+uQvRsV2saO7/lyCtaQNpNWtPgMw1TGM/PTil1pdqv/EXnY+4Ii8F
 wA1MEVePW/M2FyloZZRByw4XVnM4847yBJDfmeBAevID3UHLUZBgTqvi0vjVSLAq7GDf
 nvs2V+JJKdCblEfSq71JioTOi5HiWFF30xpd+qf60OjgTstwLUk59pBGSvatBsHRRaFV
 ffq17SZ4bUqRh2h37YDL0O6KgJwQ676prWd1Lv769v43ILZscPN8ROWjfPlh6pvPn/AH
 2rUg==
X-Gm-Message-State: AFqh2kpVs/TywuaVcfSboRnJ+MSPXVISl8GAH/wAPrVzbqngt0YynBTP
 PIihcm5rslgek3cN71YsXZj1QDs+P6w=
X-Google-Smtp-Source: AMrXdXtnb61yrcD+p7Kx6JGMBaWp9RRLZfTj0eB20PxYIi67ZQQ6kbLWkbxOCCa2MVdVRO8okc0qJw==
X-Received: by 2002:a05:6402:448a:b0:481:9219:f603 with SMTP id
 er10-20020a056402448a00b004819219f603mr50683329edb.28.1673296952064; 
 Mon, 09 Jan 2023 12:42:32 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-30.ptr.icomera.net.
 [185.104.138.30]) by smtp.gmail.com with ESMTPSA id
 ca20-20020aa7cd74000000b0046267f8150csm4078018edb.19.2023.01.09.12.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:42:31 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/4] hw/mips/Kconfig: Remove ISA dependencies from MIPSsim
 board
Date: Mon,  9 Jan 2023 21:41:22 +0100
Message-Id: <20230109204124.102592-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109204124.102592-1-shentey@gmail.com>
References: <20230109204124.102592-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The board doesn't seem to have an ISA bus at all.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/mips/mipssim.c | 1 -
 hw/mips/Kconfig   | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 39f64448f2..f459550c13 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -32,7 +32,6 @@
 #include "hw/mips/mips.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/char/serial.h"
-#include "hw/isa/isa.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 5b16ff4ed2..78400f8c23 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -6,8 +6,7 @@ config MALTA
 
 config MIPSSIM
     bool
-    select ISA_BUS
-    select SERIAL_ISA
+    select SERIAL
     select MIPSNET
 
 config JAZZ
-- 
2.39.0


