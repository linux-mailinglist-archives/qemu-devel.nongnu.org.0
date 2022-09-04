Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DC05AC33D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 09:33:00 +0200 (CEST)
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUk7o-0007K7-0o
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 03:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1R-00083n-Jn
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:25 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1oUk1Q-00031Y-0a
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 03:26:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id k9so7528876wri.0
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OPQrnSVeL4J+2x1UvAxj0DL+BYtY7LPxxx3tMOdidn4=;
 b=FERCrkw+LGR8shAFQlEfaeK4bw8ifWV3EQzprlJq5v2mc9tTRs8rM5M12IApCbU7DJ
 el+iHdRbIQ4gzcYC57GW6sLtx6NAWF9CkP+8xG3N3UyHS02fJdSwyLfwKP0vywJJEM+M
 3d5oslaiW1FoXLnFN7Mu/xMX7owBoWVEntUvZkriz7Sf5EdBHeVWdoWyzxsc24JAEiO5
 7eYCAIvXH60m69EtgJY4IgHfbfRPAWBXv1Ax+thC4vRv875ZdqtGs2giFqUuqKg8pRsB
 JcLlvCs5yv+7uOq0VgtjG8JsXol7Rpy3g+QYmIsMf9Jz2PgpWAamjEoOWS3UxhLjXoh6
 CO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OPQrnSVeL4J+2x1UvAxj0DL+BYtY7LPxxx3tMOdidn4=;
 b=XfbNlzRIrcJ1fAmmf3uT3UeEuTefaPR6g6eKT1rTZtrRSML8RA1ms38OPD6llalxme
 scmfT5EXzppb+FpGstuK0Jx9NYxeeRne4yjo8ETnC0Ul5MY8XLCAx5C45vOJBqshVL10
 exgiWo07UeJukyDA5O64xTYkFSrFCZDkmRkj14s2hcZLtRu+t2xg+gaZA6DZBfU06/OD
 YbRsDMR41EbmdM1WbfSVfn0AtJrEx218s4VtFnnH6b2jAgbCyGStIyYRHqBFQVy5wbgR
 5wNQkIF+L3TsfQ9AAalJ53SkiqUIte7y9gnmEZzkSUp9/JvUsRC9qPu4cQahCRJaPyV8
 oZAg==
X-Gm-Message-State: ACgBeo1dtcz5ScFQp/2JNU4oMi+b8+WoCMl56fVPR/asrVkP52KU19yJ
 MGHFEZ7yWmlxrtDUBM0kIcbiiN9X8fE=
X-Google-Smtp-Source: AA6agR6GXxwmH381Y7cjsnT1zkZT6NnO473dPStP4UVoAzFmGrMm38UFEMFDgdzM6e7TuB9jCoCsxA==
X-Received: by 2002:a5d:4b08:0:b0:228:7268:58c6 with SMTP id
 v8-20020a5d4b08000000b00228726858c6mr436956wrq.525.1662276382478; 
 Sun, 04 Sep 2022 00:26:22 -0700 (PDT)
Received: from localhost ([88.83.123.243]) by smtp.gmail.com with ESMTPSA id
 c13-20020adfed8d000000b00226d217c3e6sm5446100wro.64.2022.09.04.00.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 00:26:22 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: qemu-devel@nongnu.org
Cc: openrisc@lists.librecores.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PULL 10/11] hw/openrisc: virt: pass random seed to fdt
Date: Sun,  4 Sep 2022 08:26:06 +0100
Message-Id: <20220904072607.44275-11-shorne@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904072607.44275-1-shorne@gmail.com>
References: <20220904072607.44275-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This is confirmed to successfully initialize the
RNG on Linux 5.19-rc2.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
index 9a78234a28..f8a68a6a6b 100644
--- a/hw/openrisc/virt.c
+++ b/hw/openrisc/virt.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "exec/address-spaces.h"
@@ -130,6 +131,7 @@ static void openrisc_create_fdt(OR1KVirtState *state,
     void *fdt;
     int cpu;
     char *nodename;
+    uint8_t rng_seed[32];
 
     fdt = state->fdt = create_device_tree(&state->fdt_size);
     if (!fdt) {
@@ -186,6 +188,10 @@ static void openrisc_create_fdt(OR1KVirtState *state,
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     }
 
+    /* Pass seed to RNG. */
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     /* Create aliases node for use by devices. */
     qemu_fdt_add_subnode(fdt, "/aliases");
 }
-- 
2.37.2


