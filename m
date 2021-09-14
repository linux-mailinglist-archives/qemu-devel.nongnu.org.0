Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8FB40A1DB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:24:33 +0200 (CEST)
Received: from localhost ([::1]:39966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwFU-0007f2-6h
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6O-0001h8-Fe
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:08 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6M-0007dL-3P
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:08 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 f3-20020a17090a638300b00199097ddf1aso791168pjj.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GQ13E27YAKs6tc4OBt00qJWWcTtOdmK391i+KqsNCqs=;
 b=NLUtmvSeAGSpms16/+OqvcDx5bCYAQThEkWhlYg/3YwkxJPGlHsaPiIapuhCbMki2g
 Yhzq4Z3pQzeSHs3wi6fgvX7MRUJ/n3r9dR9/ykesik9MD3HCuhfYoVjaDce46LhqPdaA
 /syZ8npkpxOIVwNlNgsbq3TbQ5hatBLXXUvXtOJjELwQQcxdEbx4iNxfuRO7INOMhSZp
 3IfJ2cRT+0J5piZuui4JY8fnJBypVSmIn/klT3HF5ZME8DmYvqH95XXlWNLpGXMj9jgb
 S4SKG7S2wUBLAO9iX1qtRO4ZM0VNKUSK1eP4PRGFSvgMjkgESQw9uJ191W+sCGyx0Sg5
 g1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GQ13E27YAKs6tc4OBt00qJWWcTtOdmK391i+KqsNCqs=;
 b=bxXHfNib1tMECq3J0oxSxq1jAS4uh+0AsHU9LIu9QzI6i88qPhVZrlkAoHJClSamYD
 LMb+ODzOcMhYYHx1uQ0aLAl/obQqbZIlLeGfiq2Dn/UAruhMEEdZxNkYFIgleEKMxShN
 OhC/MVPWH64KnW8GF0eaVKwNmog1wSSKJmLneJLk3F0k6yFQ952CRzXWGfYsj+QMbHie
 PMq24Q80X2juLpNFmxUpSNQKQgjoV0FdBOym9JrX5PAmUyz25gcua9HvVfMgnls0X8gf
 AmHWwIGK8McWmUjNMkg0Q6dLO7/f68yCLI3/SuQHU5cXNbr8z5pQ+v/ukJEy3PUjMG+1
 u+pA==
X-Gm-Message-State: AOAM532fYYLVu5N51gKoBVwO4QbQgMwiLI9kJ/OHdTz+mUrg6V8lkPx8
 7svIPO2bMtJaX8PqO2y2HAvquFs9ri7ASQ==
X-Google-Smtp-Source: ABdhPJwamg6s8slFE2HLMdKAkXTY603hHVlE1N4pgFHz2qgz7+nR9eforYMXreoJ9FJ6uq7cUxeulQ==
X-Received: by 2002:a17:902:ea11:b0:13a:db38:cfcf with SMTP id
 s17-20020a170902ea1100b0013adb38cfcfmr12664046plg.3.1631578504832; 
 Mon, 13 Sep 2021 17:15:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/44] target/avr: Remove pointless use of CONFIG_USER_ONLY
 definition
Date: Mon, 13 Sep 2021 17:14:21 -0700
Message-Id: <20210914001456.793490-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit f1c671f96cb ("target/avr: Introduce basic CPU class object")
added to target/avr/cpu.h:

  #ifdef CONFIG_USER_ONLY
  #error "AVR 8-bit does not support user mode"
  #endif

Remove the CONFIG_USER_ONLY definition introduced by mistake in
commit 78271684719 ("cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
pointer in CPUClass").

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-By: Warner Losh <imp@bsdimp.com>
Message-Id: <20210911165434.531552-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/cpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index ea14175ca5..5d70e34dd5 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -197,10 +197,7 @@ static const struct TCGCPUOps avr_tcg_ops = {
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
-
-#ifndef CONFIG_USER_ONLY
     .do_interrupt = avr_cpu_do_interrupt,
-#endif /* !CONFIG_USER_ONLY */
 };
 
 static void avr_cpu_class_init(ObjectClass *oc, void *data)
-- 
2.25.1


