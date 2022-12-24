Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B53655BDF
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 01:05:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9EOa-0002LI-MH; Sat, 24 Dec 2022 18:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOZ-0002Ku-09
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:39 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9EOX-0006J7-Bm
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:57:38 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso8008486pjh.1
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8QfQ1uDgH78xLrd7SQL4h0WAoUU3UOZ3RoOlmiv5EM=;
 b=UQl46vBRu7SW9dLT+pEBRKGKvJ+exQa94UllJVm1d/I/vlXVuYJ8Jcasfy0TIW1PtL
 6DzKGsm04r8h3cPqlYml7xbNvEtKiHQm8xYIEUg2mXVm711bBnPZexUI52kgBKQTFaJJ
 QpmguaezTfHvDTPJnIksa/gly9ym1SYj/I2Rp/um/W0SDmMIRudMQ+SXA9P0YWBVM3C8
 aPSogDxa7/zdvKuGYdahLv07mj7fbjk+Fqw1Rnt6i7UQsoBwpa2uKyiyyHuYe0tqDseQ
 gILC4jIW16EpIqDb1gKBCtA0tuZqq5rTOS77Ywg02fNNqC2QzVaH47csUaJlhmHOgGOi
 ddzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8QfQ1uDgH78xLrd7SQL4h0WAoUU3UOZ3RoOlmiv5EM=;
 b=RgeKcLlxOf1QcH36QMoxyX8pqfqI3hR0Sr8fF2qR0x5/J1+Ac/jD9udqYFt19VjG/v
 aid2gVaYoqE7ZwpJafrU37OWF2ZvrjbhNSd8X3cOPBYPJPu3wryd9eT9dXM2ld+pG/Dp
 Qze25c4OHEBgGhJ47AlhdultqaGh47n/u8/nvHS6LP4nhIZkvcZrXDyomOTlpOXljUh5
 V4gy6dKfSZ9ZJFcUzy0CSD63VuKrw7ZvGOM/jrBv/njx0S8xR3lgqsYRqjvyHfCKK9q8
 2zP2/eaiNyvuECRnJOcF80sKJOmJcgNqCGOJsBXb9fiBFRYzR7YCasq3lbmHQMK0rWtL
 E2Xg==
X-Gm-Message-State: AFqh2kqRT+Si6+N+MzzqxQEcMWsHS98FnEI4ZjlMin/6+BKgvjGxpoeM
 m2NiTyOZ1tOgLNpjhB08HTo2ymQCfRWBOvGL
X-Google-Smtp-Source: AMrXdXuKoNpHTbjmN9XGBwbTeLuqbD6z/J4ronZ2q7KiO1zHtvdDFeQFaGDAoZMeB/o8EVWNUW3+ZA==
X-Received: by 2002:a17:902:7594:b0:188:5e99:d84f with SMTP id
 j20-20020a170902759400b001885e99d84fmr16351707pll.42.1671926256127; 
 Sat, 24 Dec 2022 15:57:36 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 cp12-20020a170902e78c00b00187022627d7sm4599716plb.36.2022.12.24.15.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Dec 2022 15:57:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v5 14/43] tci: MAX_OPC_PARAM_IARGS is no longer used
Date: Sat, 24 Dec 2022 15:56:51 -0800
Message-Id: <20221224235720.842093-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224235720.842093-1-richard.henderson@linaro.org>
References: <20221224235720.842093-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Unused since commit 7b7d8b2d9a ("tcg/tci: Use ffi for calls").

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c                | 1 -
 tcg/tci/tcg-target.c.inc | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index bdfac83492..05a24163d3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
 #include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-ldst.h"
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f3d7441e06..c1acaa943e 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -197,10 +197,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R0,
 };
 
-#if MAX_OPC_PARAM_IARGS != 7
-# error Fix needed, number of supported input arguments changed!
-#endif
-
 /* No call arguments via registers.  All will be stored on the "stack". */
 static const int tcg_target_call_iarg_regs[] = { };
 
-- 
2.34.1


