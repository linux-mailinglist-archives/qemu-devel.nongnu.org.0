Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3A956510C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:40:07 +0200 (CEST)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IYo-0000LS-FI
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITX-0000SH-Ob
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:40 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:43801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ITW-0004y9-Bq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:34:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so4478108pjf.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7miE1J32cGCfgzDoEjdy1xniOQ1sdRcJ/+h0R/nm0Nc=;
 b=O0HnH+Z+A7vv4LHhPkGZ9md2+ivvCB+YdOmAOrZIdcn3Ir9ZITVAyKQPa7YPmeQs6n
 GItaWZlq4tOvlShoK3CIPxWbnSXUkD2g0GMMtJlnjTGvd2o1EBxcUl6VSBR2trrO3D5S
 QdIzFbWVYYPJhn+9NJKuYxBY8b6NreSquJ5XsLy7/AYxtQ9iyL86FCLrYEwCC/f1pxA3
 5ISRNBaMYF+ZwyM55OxJU/OnFt/Xpw/lp++EDDoA81/28HskaBQJpZFqSwbXDPgb3OQ6
 q+Y9v4/vPrzu+Bswz2yCCrUSjhUG4jN97m8v7cuq2s0GVDcwRtrS6Dt9xu0x6BJxPqJz
 MbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7miE1J32cGCfgzDoEjdy1xniOQ1sdRcJ/+h0R/nm0Nc=;
 b=njLFu3Xapi+TpHjoigFss99dSlYnQ8SgYQ0ToDTwxOOoAvHkN11Vo6uy8CZfzpaquv
 tRCKrqduQp1qnvTE3GznsJchzDEIgEj+4FSIuJtHmCMShHHtWeP8c8Ly9+TBCKE+oA+Z
 9SQNDMoUPCPZefMWaXyNFE+CiVvE2fN6ZW+4MVOPSLRSqhLHka4x/TQxtsXBlEgKSCu6
 mem6qexCpUF+zL10MKGEpe/RF7MHxH/XWlVXhl5cG+rE+J9Tdg2aMBopEOE72eRnRK7j
 qYJllW4cUw7+skX+aSWQQjc89AGhuIzsP/HiFK/PedCF3i/klFeW0w8nyQZGR3YU2zOY
 hQrg==
X-Gm-Message-State: AJIora+eQnBKY1FxQ+NRlcHzVw5hLkEOeABZfhKs0L6+jwUqHNeTch61
 FpV9CDvwR0FGDJ8jGlUcc36ntSIMlTw4qy+y
X-Google-Smtp-Source: AGRyM1vHElEQQ7h2P1Fg2e6qC1qEPKdSsIW3du8Y2f2D3mC1ZIpPtE8CTqB7ezN3PS3ehpddSQSt2Q==
X-Received: by 2002:a17:90b:1bc7:b0:1ee:ffbf:95ad with SMTP id
 oa7-20020a17090b1bc700b001eeffbf95admr36505824pjb.37.1656927271992; 
 Mon, 04 Jul 2022 02:34:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79e45000000b00525b7f3e906sm15353355pfq.27.2022.07.04.02.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 02:34:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL 10/23] target/loongarch: remove unused include hw/loader.h
Date: Mon,  4 Jul 2022 15:03:44 +0530
Message-Id: <20220704093357.983255-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220704093357.983255-1-richard.henderson@linaro.org>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Song Gao <gaosong@loongson.cn>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220624031049.1716097-11-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 0013582a3a..bf163a8dce 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -18,7 +18,6 @@
 #include "fpu/softfloat-helpers.h"
 #include "cpu-csr.h"
 #include "sysemu/reset.h"
-#include "hw/loader.h"
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
-- 
2.34.1


