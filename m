Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C4E6F5225
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:46:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6td-0004rO-8Y; Wed, 03 May 2023 03:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tX-0004fo-2p
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:23 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tU-0005gK-Dt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:22 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so49257215e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098839; x=1685690839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k4JyHOgABx0yJWBT56aXvI2acEMiFWfdjVimr0obidk=;
 b=sXFV+XMhDgXI9PT1cuxnzlZh97ypV99kM2ME3CaZU4uhYT257CP7B5TkpZg63PvaXf
 Y6ZIXvUk60LjMYWvRekeZCfH8XlqOm/lNwn2T+azMJL15sp9IVWBZyK6aoT5IEeEbNth
 s4y82KrBvkwEK4SEMn5hmQxVjMxZQNwDTPJ7LGHFqmYqmAs1/jHkq9eBMuOrqprSL2w+
 h49laN5gXWw8czOLIvD1VLbg8M28fTP1KztARY3QIgjq8AWIUwl4Us2JotsyomZ8xT2t
 VsC068NJGA6PtHACMSTVdqLP4Sm/5i6J5fpvawR5yNC/Xp1zTIcIY4gUdqO0TBwNf68a
 /38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098839; x=1685690839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k4JyHOgABx0yJWBT56aXvI2acEMiFWfdjVimr0obidk=;
 b=aSI+7qi2bAjXowNoq48F49/J9xmoQLlkO6pVypgFI8tkrPTxvFXA26rO5EmuAp3a0U
 NsfYRzEDIu7M9DTKAw5UWWJDHpf5UXIjB6cs6OHKGoRcm16ldrKt2v5UrDNZnxYPCE3d
 4fhmuACcWGHfUQzUz2hhz73T8jWQ72L5hL4dC/9L7MS5CbInsywToeS1v2n/I4WcAe8i
 hQqNBsF4hum3Ii/uVDD7DhZOd+HYUR6q9erpkT/DuQS9RdZ/RoKfaL5AD404cLFICYIC
 I8jwZiPI/xI19fgTLdwYYs8yImf4m+kvlUthprVpxy8Ssf/Xwhu3x36UGLkHV+P7E5hT
 6AQQ==
X-Gm-Message-State: AC+VfDw/KdttPqEA8gMVsIYhVo7WxWvgCtpCXrFPfCdEYsN9HrDv9hls
 s2DM0Glic80tgiy/iuimxrOD+mcmVa+xcq6ylc1g8g==
X-Google-Smtp-Source: ACHHUZ4JS5iryxk7BBQymkLYnPAaci4ip+JcTg3mrrEP7UzIremHf8u0bWbRqn8T2RAOFELBPK+tYA==
X-Received: by 2002:a7b:cc1a:0:b0:3f1:969f:c9d0 with SMTP id
 f26-20020a7bcc1a000000b003f1969fc9d0mr13722895wmh.4.1683098839023; 
 Wed, 03 May 2023 00:27:19 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 62/84] tcg: Remove USE_TCG_OPTIMIZATIONS
Date: Wed,  3 May 2023 08:23:09 +0100
Message-Id: <20230503072331.1747057-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is always defined, and the optimization pass is
essential to producing reasonable code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c5d7c6abc1..f9bc6bd0ed 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -22,9 +22,6 @@
  * THE SOFTWARE.
  */
 
-/* define it to use liveness analysis (better code) */
-#define USE_TCG_OPTIMIZATIONS
-
 #include "qemu/osdep.h"
 
 /* Define to jump the ELF file used to communicate with GDB.  */
@@ -5936,9 +5933,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, uint64_t pc_start)
     qatomic_set(&prof->opt_time, prof->opt_time - profile_getclock());
 #endif
 
-#ifdef USE_TCG_OPTIMIZATIONS
     tcg_optimize(s);
-#endif
 
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->opt_time, prof->opt_time + profile_getclock());
-- 
2.34.1


