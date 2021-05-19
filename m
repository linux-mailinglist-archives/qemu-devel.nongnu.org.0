Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8291B3895AC
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:42:19 +0200 (CEST)
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR98-0006y5-Hs
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyb-0003wd-Jf
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:25 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:39586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyQ-0005jE-7Y
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:25 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so12620544otc.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QgY/O+HXE0Z19LMDWbzIdcxZYSvNYsLpXbLW2u99c0A=;
 b=iE1oZVubVcwOCj1VnNq6+rjnwgMRC03fT6VHXnyniK67jo2NiA073wYGesiEjx9Qyx
 gQEEUXoNCxiaCw+PtoudW5sZD2ST1ZPWbpI87NQX18yLJrKSn9VOVNIQ+JGOW6PxhA3z
 CEYzXMKwmnhfq06msa0L3P3zbwau8GbZuu6ZF38Z8DnCu6DVHgAzXHo50Lx85d1KDEes
 BoZ3BJ4Y+VPrKl1Uk7gHBq3KFfLE+2d060FqSXWiujns4mH085fcp6sPaVPuKfaiTqaX
 UjxhXQc4tMbHUgjpuyGXFj9mLaiQ3cmzcW/qALpCOzr1Cluml+pl3SnJB9Tdw0CmARwa
 OEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgY/O+HXE0Z19LMDWbzIdcxZYSvNYsLpXbLW2u99c0A=;
 b=f84ajjYJ5/ZeKCdq6AI/yyCU4IU14lKY59fWH6FnAV+O4ZxduEfjTkqkhhruy7yX1r
 ucf6q/C2XLgChPL8kssreOqp8vQE2MMrRp+XCqJ+MwVkXlvqqRRCJiDgsEvc01A3eR+Q
 UQTSlnHH7gfKtWkLEkUm42Zqv0F63t5U9pWlG/HlADpLkNOm3sVX8Yi+iCuLMKuMqjIb
 P8UnOn4kyl0RIEOA0yRDHtmHLxx0wEvln3r6d6nmSN9KsERBFNvwwCn/OcYucSwKL0sd
 R396anLHPid2/GYL6L/ggcTh33tmXfPsarV/ByKg5FVauS9dTb+V8OHmRTPxH7L+Hs+D
 SqEw==
X-Gm-Message-State: AOAM533lWrZabq97udMlSBf7NvhBBqtxhlupS+bVb+NvmQHaaPIrG502
 fYiSMy2JjQXPkGHLBSd0nBQe9oqPCMXAIwrw
X-Google-Smtp-Source: ABdhPJzVaWCn+8/jlFxi5cYzNgBITQf9DCEMzyAmKXiqePoK6Ya4RTyLqnpIAoHMMemR60X/QfjYYg==
X-Received: by 2002:a9d:4b8a:: with SMTP id k10mr656433otf.131.1621449072334; 
 Wed, 19 May 2021 11:31:12 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/50] target/i386: Reduce DisasContext.flags to uint32_t
Date: Wed, 19 May 2021 13:30:20 -0500
Message-Id: <20210519183050.875453-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value comes from tb->flags, which is uint32_t.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-21-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7e296b39f5..ca7f0a8cf4 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -105,7 +105,7 @@ typedef struct DisasContext {
     int jmp_opt; /* use direct block chaining for direct jumps */
     int repz_opt; /* optimize jumps within repz instructions */
     int mem_index; /* select memory access functions */
-    uint64_t flags; /* all execution flags */
+    uint32_t flags; /* all execution flags */
     int popl_esp_hack; /* for correct popl with esp base handling */
     int rip_offset; /* only used in x86_64, but left for simplicity */
     int cpuid_features;
-- 
2.25.1


