Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7DC3F8CC5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:14:08 +0200 (CEST)
Received: from localhost ([::1]:44442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIx4-0002aF-W1
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn1-0006Df-JB
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:43 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn0-00009P-0l
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:43 -0400
Received: by mail-wm1-x32b.google.com with SMTP id f10so2260398wml.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h47sE0DsCxPb7Mc68TeucJUfawKcRbpHrCIDY0wiKi4=;
 b=TRowkjsdD+qE/O9wR58WaaYWU8vQAkS+aP/O2qHV7I9qI3N4bS56UJtj2prETENhG/
 LtZrGFakxc8yam57kI6sQIMhu8Ijev1z+zjuylaMzALR1EXF3cK/LbBSjsYfNU3/Hjp2
 nxBsXYbIGM3TW6GpLTYXFMcyyf3QcJg3fHsIEqQKmHioJxS+BO9CR+PKZ9v8QPyfHXmL
 zpYE+2tfWHLhAD0FbRk3ghjnupMuimuBhOzCtKhOmeAZEL1Tgo95A/7jxan3/TKqAIUw
 /v134oKQe7XIexNPhDRlb8l14P8M5fHz23Gu8egpJibYMXCTh7vgPA+x+8oO3dRkIMTS
 cmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h47sE0DsCxPb7Mc68TeucJUfawKcRbpHrCIDY0wiKi4=;
 b=h8/WVSlcQWhmPJzmI7EV8oA6Dre6QV3lVMzcQ62bMDcgxuAronrgl9c+6eCMU2TfcV
 DmB5klEEfbNAvhYvvPqzAoURlznMgMrw2iN2y4ejgk65BoiJK4ON1hyoaX782N+Nfmr0
 Eh7amlIh/bZdDKoPj8HHS9K6OZVM+0P6GuyTDAEEsYoXJ1UdSQSvYO8FO4VGuKD8ipKH
 JoFamix3SwZm0lDnQgh3l6VoYwsJjgED+rh887hc5Zr2T9UERKZ0q/xTYbcE1MCh64oa
 YM2TbALpZ9BYys/OBNqJMMQ7icCKy39xPWDmhWrY4u9vn0L0xe/PXUyv+bLZdxY2UsO3
 QP0A==
X-Gm-Message-State: AOAM531ZgehAxOJaTbEwqZUgM0yoAxZkk7DSh9Zu8cBggzi01Mih11J6
 W7r4M0YqMvYMpFeyFF1Ze7eySrJfe89OqA==
X-Google-Smtp-Source: ABdhPJzemHc5rdkEQ3muHKfcPuAn8J5fagqvuY/VEzkbLJP7oYRPXuCOdciz6be3rl4szeMeGWm0Bg==
X-Received: by 2002:a7b:c3d8:: with SMTP id t24mr15013355wmj.88.1629997420588; 
 Thu, 26 Aug 2021 10:03:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/37] raspi: Use error_fatal for SoC realize errors,
 not error_abort
Date: Thu, 26 Aug 2021 18:03:00 +0100
Message-Id: <20210826170307.27733-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The SoC realize can fail for legitimate reasons, because it propagates
errors up from CPU realize, which in turn can be provoked by user
error in setting commandline options. Use error_fatal so we report
the error message to the user and exit, rather than asserting
via error_abort.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210816135842.25302-2-peter.maydell@linaro.org
---
 hw/arm/raspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index b30a17871f7..0ada91c05e9 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -281,7 +281,7 @@ static void raspi_machine_init(MachineState *machine)
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(machine->ram));
     object_property_set_int(OBJECT(&s->soc), "board-rev", board_rev,
                             &error_abort);
-    qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     /* Create and plug in the SD cards */
     di = drive_get_next(IF_SD);
-- 
2.20.1


