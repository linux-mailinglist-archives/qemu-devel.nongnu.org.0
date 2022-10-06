Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779B5F5FE8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:07:33 +0200 (CEST)
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIAW-0000SI-EX
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoO-0004He-9T
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:40 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoM-0003wh-HR
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:40 -0400
Received: by mail-pg1-x531.google.com with SMTP id f193so828623pgc.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4qIVKig9S9x8D14AyFcGhgg5zmaJDwxxAfigArX0KMk=;
 b=jjbs4gRXwuis6L4R2QTx6yzUBe9Si+UAv1EY3x30Om3rgdGqWxuHLP+xmgHaeIY6Ni
 5Se2TrhH8AtiTYUS96nt1l6WG2jex6ZNRiWf8TAPr38BTk2raCWc44bkaO2LUX2A8IIf
 XI5TWd/31d5PlFRKTeUm9S3r/TMFXBtkf3Rn/thxpu9ix5g++75vkFRRwKy+iB7xelMU
 VDzlFszyThy0VRGaj7GWRsGkh8brHkDCGDzvKla92nfCDjyMx+plDqPaL1UGhFPHzf6B
 SOQDfH+G7VcR73cteVzRX7RxGbHvl9UvW591p4212QLJuTKq1C906ZDMtfCIxo7Mv32x
 +nIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4qIVKig9S9x8D14AyFcGhgg5zmaJDwxxAfigArX0KMk=;
 b=MGF7/SVRLVkbjG9hFZLtomOSOnOHeZ1XbceY0OPp0RWdKagX1q7Z5RRxDzrTyh0WXh
 2Y++MY+DkO9aGbn0WdsdoumIlGflzeXIzV1K6ktymH64j0Vvf/ylSW1+0Tw6uRPBQPpC
 C1XuQGnhUiQxp79n0CMKsdy28nc+QR/nrPQKOJKmEkYtw4fpcLB0FBMPyTuN2xPlE1qD
 T+S0HYTxWHFRWageIwtwvZotszQqxwqQtqk4JGy6vF9NDnIa/ZgVadf/PYq2KY1/IkHr
 GJiWsk4tiyi+PHjyacWAKur3rS8CHx8d8T3w4h1P5/eyIl6SJD7PCWtDLexBdvzmllMb
 Ki7w==
X-Gm-Message-State: ACrzQf1LKnw+T0CiYEIJ0wThlebzVdt4B4ACo4dVxNqj0uiAS/O9Axnb
 FTowZPVzIKijRxmu1I0wYw7JMWXrca3D4Q==
X-Google-Smtp-Source: AMsMyM53T/spcx8KaL7pS1G56TKR1gtxmahXueucfHKK6F/gLzoWT9XXtkNALVjmEMbX3wyADUmpgA==
X-Received: by 2002:a63:9149:0:b0:448:9717:d8bc with SMTP id
 l70-20020a639149000000b004489717d8bcmr2773720pge.134.1665027876480; 
 Wed, 05 Oct 2022 20:44:36 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 14/26] target/s390x: Don't set gbea for user-only
Date: Wed,  5 Oct 2022 20:44:09 -0700
Message-Id: <20221006034421.1179141-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The rest of the per_* functions have this ifdef;
this one seemed to be missing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a20c3bc4f0..868895b9ae 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -384,7 +384,9 @@ static void per_branch_cond(DisasContext *s, TCGCond cond,
 
 static void per_breaking_event(DisasContext *s)
 {
+#ifndef CONFIG_USER_ONLY
     gen_psw_addr_disp(s, gbea, 0);
+#endif
 }
 
 static void update_cc_op(DisasContext *s)
-- 
2.34.1


