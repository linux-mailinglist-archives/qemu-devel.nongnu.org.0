Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7544F64B57A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:54:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54ls-00005a-CS; Tue, 13 Dec 2022 07:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54lq-0008WV-4Y
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:52:30 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54ln-0002zK-Th
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:52:29 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso7901198wmo.1
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tV5dDqKeW0g9sIA7fe0a/By2zgJayPRpeDRbB0e1smc=;
 b=NwCxfj4WCNtdnsgbLWI91hcX0HEh5S4lhhSXsLWyy2Wf9RcRlwRaQxMRWQOpqV2+QG
 bHIGRLggMoS3aGXMpew6zbSAULzSLrw2RTdv8zkJMoJMLt6aZ68xVx3HmWKUVMjOX4hK
 zZOI/aNnie7lOXaFvU5uN8YH0GEJHoX8js/2Y37mZzwPHp8NDeYm1jXnWyqkURHjtfsG
 Y9rpiUqh0AwV500L6ODruQzJmw+UeYtWE4P1tpW1zusyMZF0GiTvaQex/1FIvmWj5T0m
 ya5nSFNB5ZumK+PhCGC67KKCCL3JGkWFQ+ihU5/sK6Qi6mal3uHdTwbItlX7Z6Tyyg3l
 PF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tV5dDqKeW0g9sIA7fe0a/By2zgJayPRpeDRbB0e1smc=;
 b=j2ACXyDBV7Wcmz6vkWN4SSYNVA2rDPdMjsM0S7H3xt2nX1Q58pvPo6fE71y0LgNi4M
 fI08u4BVgkZ08n4hbuT2QDheyBJAJAcxkdU8Z83mNJ1Kla7x1UStFGlj05BRhWx5S79P
 peR4W9vohZNxZPIX6FaOr3PMOD5LesPxJ0gqNOJrL9eYFjUVeojHuqZzZsbec9ZfkbRL
 DSxsQVnJIyCeLCKT3QynSwfRSZTxlpDn8uQAmKgL+1j/3AJy5r3FDumuhDljlPoGpJBH
 AIzCaDXMCPQBcVqy9Z06jxb74ncXFUQfJ6O9lygObrQk7OR5CdRyYndDZALn+aiyzIw4
 iaPA==
X-Gm-Message-State: ANoB5pmuKJxN1WCg43gWP8VZs0yKLivNYrwX7JeFMmxD/5bT7OPc9VEB
 EbMo5NKHNZBY3KLiooZoBhBheZgw2DJl0+Rkvuo=
X-Google-Smtp-Source: AA0mqf7ZGadK9LQwOEYIQpatBgd093EgAqPVlMz83i53R1n60QgjRjkkXsHpy+7CPpi2Ki7tTj6E4A==
X-Received: by 2002:a05:600c:4e91:b0:3d1:dc6f:b1a4 with SMTP id
 f17-20020a05600c4e9100b003d1dc6fb1a4mr19595334wmq.5.1670935946097; 
 Tue, 13 Dec 2022 04:52:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c22d200b003c6bd12ac27sm12560385wmg.37.2022.12.13.04.52.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 04:52:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Date: Tue, 13 Dec 2022 13:52:16 +0100
Message-Id: <20221213125218.39868-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213125218.39868-1-philmd@linaro.org>
References: <20221213125218.39868-1-philmd@linaro.org>
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

Assuming the developers of commits 2c50e26efd ("powerpc: Add
a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
aCube Sam460ex board") were testing on a little-endian setup,
they meant to use const_le32() instead of tswap32() here,
since tswap32() depends on the host endianness.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/sam460ex.c     | 3 ++-
 hw/ppc/virtex_ml507.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 4a22ce3761..88b1480138 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -15,6 +15,7 @@
 #include "qemu/units.h"
 #include "qemu/datadir.h"
 #include "qemu/error-report.h"
+#include "qemu/bswap.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
@@ -255,7 +256,7 @@ static void main_cpu_reset(void *opaque)
 
         /* Create a mapping for the kernel.  */
         mmubooke_create_initial_mapping(env, 0, 0);
-        env->gpr[6] = tswap32(EPAPR_MAGIC);
+        env->gpr[6] = const_le32(EPAPR_MAGIC);
         env->gpr[7] = (16 * MiB) - 8; /* bi->ima_size; */
 
     } else {
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 13cace229b..0f282ecaa7 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -38,6 +38,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
+#include "qemu/bswap.h"
 
 #include "hw/intc/ppc-uic.h"
 #include "hw/ppc/ppc.h"
@@ -141,7 +142,7 @@ static void main_cpu_reset(void *opaque)
 
     /* Create a mapping for the kernel.  */
     mmubooke_create_initial_mapping(env, 0, 0);
-    env->gpr[6] = tswap32(EPAPR_MAGIC);
+    env->gpr[6] = const_le32(EPAPR_MAGIC);
     env->gpr[7] = bi->ima_size;
 }
 
-- 
2.38.1


