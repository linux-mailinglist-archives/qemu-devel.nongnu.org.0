Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CDB566910
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 13:23:33 +0200 (CEST)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8geS-0006CT-NR
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 07:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gI6-0006wB-TR
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:26 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8gHq-0000gQ-Uf
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 07:00:16 -0400
Received: by mail-pg1-x533.google.com with SMTP id q82so3900570pgq.6
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 04:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z9HYnLroahrDAazMWts4PSFEzXJdvqtXFJupFoU2vN8=;
 b=dmooeY8oKJC/tJFBYkHpFo2ZVveFReLyXeuP5A2o5EkB7uwFfta93HEVsZzB3GN+5k
 bCA4IAJWKuSntcy4eqi1x+PHNtXhkpvQSSNO+a8mD3lfJFLW0Hk0m7f0w2TjY7a+xb4J
 BKkagPj9MbXxfNeCCV1z90k7/m7B36yrRTj7fbBRReIQAj0JtJepnhXksnwyozFw4FsP
 +AvPxGhCSDaOmGkxfzk1vqsziiuKxbEIMgnGNIUftqeoqHL82D/GnWXcluA8mD67radq
 r0QhEm0Po3ri4KBXp5rGmAxJikxzR/rgKaKc1CQdVQTekMWZPY7f30GA7NG3g2QZK7Pn
 YiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z9HYnLroahrDAazMWts4PSFEzXJdvqtXFJupFoU2vN8=;
 b=NBpDRYNQ3srUD1NcE8tsenzbYo5r2ON8jyzfElLDDd68AirNauaj/xhTBz9hVa/Clw
 trxScUrEe7S/JYNHDwnwQiEn5SL+ONNvoEyQPm8DJ+BP0y1Dk+aAdBiES+29ZAYgmtWE
 9aHjOwoTPTZ/0tPLPblgZWAOYlHEwsi++PZ1AVk+12X34nvU0WzlnX7MPOpRt21xptYr
 luMU6n0ah+os0xuav2EDfYsXUfWBhp+EovO/bQ3NIeRBMNHJPZJOD15/2VcaNC1uSwp7
 iZQedLJ0hdZui60yaritG/GlbYywOLRotkA0OoCs9U358WPJA0Jeflh0K3h2bgtzXZTj
 tyRg==
X-Gm-Message-State: AJIora9z6sYm8ev7VO8EpjLUqJ0GNLEjPi7TuECCzfEMozxrEfuM2/bt
 UXNX3XkQvmuxitcMPA1HU+qo6+Xn0fQyMbqw
X-Google-Smtp-Source: AGRyM1vXJHhXNyaLKWPfSGkJgueKVo8ySdY+uRwyDSpeJt7VU1+Ypr0GnqE7eoATHy62L2KpcStqwQ==
X-Received: by 2002:a62:542:0:b0:525:a313:fe28 with SMTP id
 63-20020a620542000000b00525a313fe28mr41719723pff.73.1657018809463; 
 Tue, 05 Jul 2022 04:00:09 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0016bf7981d0bsm508454plh.86.2022.07.05.04.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 04:00:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PULL 2/6] target/loongarch: Clean up tlb when cpu reset
Date: Tue,  5 Jul 2022 16:29:53 +0530
Message-Id: <20220705105957.1144514-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705105957.1144514-1-richard.henderson@linaro.org>
References: <20220705105957.1144514-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

We should make sure that tlb is clean when cpu reset.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220705070950.2364243-1-gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index d2d4667a34..e21715592a 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -479,6 +479,7 @@ static void loongarch_cpu_reset(DeviceState *dev)
 
 #ifndef CONFIG_USER_ONLY
     env->pc = 0x1c000000;
+    memset(env->tlb, 0, sizeof(env->tlb));
 #endif
 
     restore_fp_status(env);
-- 
2.34.1


