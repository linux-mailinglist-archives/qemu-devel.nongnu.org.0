Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD64661E8B0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 03:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ors9e-0004iQ-TS; Sun, 06 Nov 2022 21:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1ors9c-0004hx-CU
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 21:46:28 -0500
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1ors9a-0003ys-Jd
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 21:46:28 -0500
Received: by mail-pj1-f45.google.com with SMTP id k5so9290861pjo.5
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 18:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A4hklchz7NMD0odllmvm5l2IgbJAfZrOqP1bydV+1+Q=;
 b=JuhOzmSfaQTjGtdBnxSJ/we81DF6cqh4Q0ZvHZXWfNp1NEarnDFlbeAHUFu9pB3e+Z
 wX7XtV3XPSAp9BhIY5zqg0Nw9U5kFgoHhycE8e4LymSIt8Aydmg+1IxLFkQKm/Q8ND4q
 gSiRNDV0UydcmnTu3CRWIafEAiQ3tXYTLweVnsqpRmA61gQTFl7zw3WtzM1BpNihJV6u
 8O6c734G9NCkR7POqms4KNnQgV57MqIBWy0fplBe+9mtnWdVfSLpfnf9jHMcNuDzF8jw
 Jg983RNwi+nqkgqv73YqmPwRgyaPkni4mzSwf5CmLGlmqTzge88GCWJKjeWhBv/BzP7I
 gWqQ==
X-Gm-Message-State: ACrzQf1oNaFQ0ulBk5DFIvoAtyFuDTuQ9QvOnDwx3nbU3kDXT1TL8le0
 OwQ0C/PQTz4aJcVd4eT4eDlxxGR+kUn/Ehei
X-Google-Smtp-Source: AMsMyM5VlcPxpRux/R173aRZb3MJEI5r+Q//1Wib7x3iy82yaKcWR3bAOkcYNFXzjgnzZJ/jaRsmSg==
X-Received: by 2002:a17:902:b20a:b0:178:6f5b:f903 with SMTP id
 t10-20020a170902b20a00b001786f5bf903mr49846137plr.39.1667789181811; 
 Sun, 06 Nov 2022 18:46:21 -0800 (PST)
Received: from localhost.localdomain ([2400:8901:e002:5400::])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170902cec100b001887e30b9ddsm1284192plg.257.2022.11.06.18.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 18:46:21 -0800 (PST)
From: Rui Wang <wangrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, hev <qemu@hev.cc>,
 Rui Wang <wangrui@loongson.cn>
Subject: [PATCH 2/2] target/loongarch: Fix return value of CHECK_FPE
Date: Mon,  7 Nov 2022 10:45:26 +0800
Message-Id: <20221107024526.702297-3-wangrui@loongson.cn>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107024526.702297-1-wangrui@loongson.cn>
References: <20221107024526.702297-1-wangrui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.45; envelope-from=r@hev.cc;
 helo=mail-pj1-f45.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Regarding the patchset v3 has been merged into main line, and not
approved, this patch updates to patchset v4.

Fixes: 2419978c ("target/loongarch: Fix emulation of float-point disable exception")
Link: https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg00808.html
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Rui Wang <wangrui@loongson.cn>
---
 target/loongarch/insn_trans/trans_farith.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/loongarch/insn_trans/trans_farith.c.inc b/target/loongarch/insn_trans/trans_farith.c.inc
index e2dec75dfb..7081fbb89b 100644
--- a/target/loongarch/insn_trans/trans_farith.c.inc
+++ b/target/loongarch/insn_trans/trans_farith.c.inc
@@ -7,7 +7,7 @@
 #define CHECK_FPE do { \
     if ((ctx->base.tb->flags & HW_FLAGS_EUEN_FPE) == 0) { \
         generate_exception(ctx, EXCCODE_FPD); \
-        return false; \
+        return true; \
     } \
 } while (0)
 #else
-- 
2.38.1


