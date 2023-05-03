Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B60B6F524D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:51:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tt-0005mv-E3; Wed, 03 May 2023 03:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6te-0004xB-3C
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tb-0005d5-Oq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so29134995e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098847; x=1685690847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAI6VIgzMZpgJduQw+zbfBfSRhC2iaxfwnzVojWouK0=;
 b=xz+qkb0DYmfaphO93mm3ENkVqyaON9kXzidcWhEka5HdBfGaqgTjeKUEejj0ACUWaq
 V4ZS3STPeFnA7eInjKqIq5/9aPVmoPY+VU4Ci9Bzg9BPRNNNt9oYVt1kEnVf7VQpBTrH
 h5czYyMSGLEZwp/+cZYT4QWLfov9rn49p1Nnx7A0GOejU8GttjmgcG+0A3BOncS+8omN
 qsAwxt1oYW1f4Uy2xtSTx4sMhrVpv5oZZ/WhK29ITdSKe/jCsQWrSHQFFwAAhk9gcJyi
 1/p0+udtahJdNiDVXnEDI/q2FN8U9moq8gnJWDzzXKnNGj24VmQXXJlHR7WTT6wWctD8
 22eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098847; x=1685690847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yAI6VIgzMZpgJduQw+zbfBfSRhC2iaxfwnzVojWouK0=;
 b=FB8upNcCXk+bSm73RvKPCBSn49OBwUAvHqu4xTh1TxajTYHUZSzJPj3+9quRN/KESh
 iQWjuzLLNW1CTEzTjy+kxKKPgLU0XI4RkmMINg0YdZcakIWacsrMTUFcG7BHtuYGiifZ
 ExOImsYPec8ZPpy26fs9jNJ+aHU9Mg8f5Q0M78uLxzhNE6M/Ekcvstid1eBrCcfxROmB
 8M9RF5wyxbfxVH4rylorb/PpHlmjf1tCkn7zGNFV9s/HQcfQ4tG6RXs/M3YlLLHRNre8
 ePJ/Fo3cpLqxzUhEAe+DDez3Tjyr8Nq95u+s1Q1KdbjIcEscdBjEbGfoeDTEDNeUtUWY
 7TkQ==
X-Gm-Message-State: AC+VfDxSzY6/CbUW4dEUnwUEg+5hQEg8jqZ25xKqkg6WTpBL+nvBWbAa
 Q4v1PuF3K6sEkN0Ogd3L3x6i6GBtzIldj62xDz8uUw==
X-Google-Smtp-Source: ACHHUZ5Jc9z0A8taFlu97HvVotVCaO23rL8taSvkpSrLltMUsH7SByra7fZ/IEfcjOmOmkkLgFXB6g==
X-Received: by 2002:a05:600c:2285:b0:3eb:3104:efec with SMTP id
 5-20020a05600c228500b003eb3104efecmr14690134wmf.16.1683098846958; 
 Wed, 03 May 2023 00:27:26 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 72/84] accel/tcg: Tidy includes for translator.[ch]
Date: Wed,  3 May 2023 08:23:19 +0100
Message-Id: <20230503072331.1747057-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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

Reduce the header to only bswap.h and cpu_ldst.h.
Move exec/translate-all.h to translator.c.
Reduce tcg.h and tcg-op.h to tcg-op-common.h.
Remove otherwise unused headers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h | 6 +-----
 accel/tcg/translator.c    | 8 +++-----
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 228002a623..224ae14aa7 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -18,12 +18,8 @@
  * member in your target-specific DisasContext.
  */
 
-
 #include "qemu/bswap.h"
-#include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
-#include "exec/translate-all.h"
-#include "tcg/tcg.h"
+#include "exec/cpu_ldst.h"	/* for abi_ptr */
 
 /**
  * gen_intermediate_code
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 60a613c99d..fda4e7f637 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -8,15 +8,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/error-report.h"
-#include "tcg/tcg.h"
-#include "tcg/tcg-op.h"
 #include "exec/exec-all.h"
-#include "exec/log.h"
 #include "exec/translator.h"
+#include "exec/translate-all.h"
 #include "exec/plugin-gen.h"
-#include "exec/replay-core.h"
-
+#include "tcg/tcg-op-common.h"
 
 static void gen_io_start(void)
 {
-- 
2.34.1


