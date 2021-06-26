Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB81F3B4D3C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:51:09 +0200 (CEST)
Received: from localhost ([::1]:39022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx29k-0003Uw-P3
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vt-0002Jq-Ed
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:49 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vr-0000QK-Eg
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:49 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso6828596pjp.5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y/anbb6DPNvIO8E9zByeUSadBR7zd/opSVuaQ6a6eP4=;
 b=oK0cGfxKr/2ljlStMqrH8p1JHbSX9Lcxz1/9akjr2cj9ce/BESnEYydPtqt570hSc5
 mOubhiqUcaPHsbir2+PZEAUdJ/7IyGxVPvlMGemeyGGFbkHjVSohTm1eslaSwQezV+Gw
 W5kIq7hxm6dWa9gAH9m2IAO9FLTkKlpJUTu5lces6Xlgo98M18K4mf/8tqVeLYcXh1z8
 d9rTyiWpa8d5r7lXQVikKbZHq7IR5wTInQQuPIaLz0BKJWb9DCANLRCCsWg6VrFJvnev
 qBdL89Pm/aVF3ZZs5iqVP7QDN7dDBESaDAQ7pTak9K7uR7IvxWpTg3UrTRwWqgRQXS4J
 bhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y/anbb6DPNvIO8E9zByeUSadBR7zd/opSVuaQ6a6eP4=;
 b=hsIGj30wRdkN2MA0jcMRWgk/fw1+NQoklVLkkI4Fdh49Gz1sVTHSqYSG6R054heQgD
 wbWJooCE3XcksGtymDjjAGNxyOrxCuQbPXFkmo9gc0UFWWUrfXpnthfyAwQAcjos0tlF
 xRy4mJM3EY2jMG9ksBo3xthRj9SX42EatrWQE6e2rtu9xfesHlCYFxjAIVAI8PvS5knB
 skCUMWuIauM16UmviajGJeskaOrGQkxrtR8ZVxr5ehIkcDO840Y9yZVQXf2Gb1ERU+jI
 A20u/VEq8IMtMecyMgqNqTnuOFNYBp/DkUlJ1NIPPf2Sy6LY5HPuLF8cMHwMFLnwSCNB
 mT8w==
X-Gm-Message-State: AOAM532AY4g9llmDkNHxWReT9MLM4oLlMi2LGOmi+FT1qfrCtgb1HFLu
 LJeYbdHhujJZwWFGVoZundFeuy0Dtn6YLg==
X-Google-Smtp-Source: ABdhPJwkq39uwE1OX7mqC9j+hcuEq5B06WHQodR+C2yZx/cL/X2tQseaY6X7kDmaF7YVeMxq8cIhzQ==
X-Received: by 2002:a17:90a:e283:: with SMTP id
 d3mr25280113pjz.12.1624689405924; 
 Fri, 25 Jun 2021 23:36:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/29] target/arm: Improve vector REV
Date: Fri, 25 Jun 2021 23:36:24 -0700
Message-Id: <20210626063631.2411938-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can eliminate the requirement for a zero-extended output,
because the following store will ignore any garbage high bits.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 304fd3d370..1a40e49db7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12444,12 +12444,10 @@ static void handle_rev(DisasContext *s, int opcode, bool u,
             read_vec_element(s, tcg_tmp, rn, i, grp_size);
             switch (grp_size) {
             case MO_16:
-                tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp,
-                                    TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+                tcg_gen_bswap16_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ);
                 break;
             case MO_32:
-                tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp,
-                                    TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+                tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ);
                 break;
             case MO_64:
                 tcg_gen_bswap64_i64(tcg_tmp, tcg_tmp);
-- 
2.25.1


