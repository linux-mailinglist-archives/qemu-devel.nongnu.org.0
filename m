Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6ED3FB1A1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:10:41 +0200 (CEST)
Received: from localhost ([::1]:33450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbRI-0007E0-Tg
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamT-0003Fe-Ud
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:29 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKamO-0001qT-Fz
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:28:28 -0400
Received: by mail-pj1-x1029.google.com with SMTP id oa17so8769727pjb.1
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rvNuXyDgl561ih0UCNemc0yPl83Dln6iOUSP6pwicZo=;
 b=NyFJ+B3q6VEeVb012HH2SkZhFgBclrgflDc+5s+SITCxjv2CFsuJ6uLkgi0tZFgIZn
 HoE5t5JOxFKFUxTI7SGiv/YjF3ZjSJM8cDDUvqwqyI0aq17FGwSmSanS2QHzqHo6s7NZ
 j0VvKACxThDa2UiCej3z+RViNxakybJPq0Mj4NeYOMF7AQhKUCJldukAer4+dycGQe7b
 y8dSnEc+R/8HyNav2ZA4t5VrNmRWpHxebCpLrpVf01toL4Wxb797QPU+pr9mY+O3Pi6n
 d8aGPGM6cCdfQTFI560RBnXgXpyr3aCRuYz3g2Ad4O0pgy2pQ+9qhnDO6ggSzD5fhYRZ
 rHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rvNuXyDgl561ih0UCNemc0yPl83Dln6iOUSP6pwicZo=;
 b=OO6nfuMHQRs7IIzJAsxqRiEyKz6DtkxVDhyk/S80bJv0Tslb1FcBhSkoLPCtiSr8Cr
 1WX86yz7vtRZhZhADCnXQJctg2I1On9YgM2IByBW9F2nLQ9hOHbPWk5C8EbKVN7SmKwU
 d9L6xlgqoyR/EvZKYuMUHPOYsRcbsVZes53/sWqd+E3x+woWy22EMmW+ucsoey/Zb7C7
 WOnEODudYVlRgKzQxqpzD2yrlazSI7pKgPsg3hQ1B7czM0bx68QP1haEDDpMhmvddGHv
 kmNqo4qMoga40bJCzRnKE9YpJLDmvHNSTe2ECxV7LtYmb23KN2kBrwf+UiaJsDz5gEOI
 wKVA==
X-Gm-Message-State: AOAM533TGmv+sy5RUXAcX3c9LkRsoG3lhKaD11AZGUexq0z3mB6M3QW9
 XBgvEoGb7C1eLihKWVx36zVEOz6+u+XxdA==
X-Google-Smtp-Source: ABdhPJzzhuNdnAGWRRHmzvjQafB2ou3h1FOID+/y7C65PFACnPfSijwV+HBnZcpUIHlPYjwSTd6tkQ==
X-Received: by 2002:a17:90a:6907:: with SMTP id
 r7mr7175283pjj.226.1630304903270; 
 Sun, 29 Aug 2021 23:28:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o6sm13337072pjk.4.2021.08.29.23.28.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:28:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 47/48] tcg/optimize: Propagate sign info for bit counting
Date: Sun, 29 Aug 2021 23:24:50 -0700
Message-Id: <20210830062451.639572-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

The results are generally 6 bit unsigned values, though
the count leading and trailing bits may produce any value
for a zero input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 788a5acf10..dad72b2ff5 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1216,6 +1216,7 @@ static bool fold_count_zeros(OptContext *ctx, TCGOp *op)
         g_assert_not_reached();
     }
     ctx->z_mask = arg_info(op->args[2])->z_mask | z_mask;
+    ctx->s_mask = smask_from_zmask(z_mask);
 
     return false;
 }
@@ -1236,6 +1237,7 @@ static bool fold_ctpop(OptContext *ctx, TCGOp *op)
     default:
         g_assert_not_reached();
     }
+    ctx->s_mask = smask_from_zmask(ctx->z_mask);
     return false;
 }
 
-- 
2.25.1


